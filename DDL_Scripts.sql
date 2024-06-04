/*
* ER/Studio Data Architect SQL Code Generation
* Project : Final_Project.DM1
*
* Date Created : Wednesday, April 03, 2024 18:08:12
* Target DBMS : Microsoft SQL Server 2019
*/
/* TABLE: Dim_Contributing_Factor */
CREATE TABLE Dim_Contributing_Factor(
    [Dim_Contributing_Factor(SK)] int NOT NULL,
    Contributing_Factor_Code int NOT NULL,
    Contributing_Factor_Description text NULL,
    Pid varchar(500) NULL,
    DI_CreateDate date NULL,
    DI_WorkFlowFileName varchar(500) NULL,
    CONSTRAINT PK2_1_1_1 PRIMARY KEY NONCLUSTERED ([Dim_Contributing_Factor(SK)])
)
go

IF OBJECT_ID('Dim_Contributing_Factor') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Contributing_Factor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Contributing_Factor >>>'
go
/* TABLE: Dim_Date */
CREATE TABLE Dim_Date(
    [date(SK)] int NOT NULL,
    Day_Num int NOT NULL,
    Date_Str varchar(500) NULL,
    Month_Num int NOT NULL,
    Month_Str varchar(500) NOT NULL,
    Year_Num int NULL,
    Is_Weekend varchar(500) NULL,
    Qtr_Num varchar(50) NULL,
    Season varchar(10) NULL,
    DI_ProcessID varchar(500) NULL,
    DI_CreateDate date NULL,
    dt date NULL,
    CONSTRAINT PK2_1_1_1_2 PRIMARY KEY NONCLUSTERED ([date(SK)])
)
go

IF OBJECT_ID('Dim_Date') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Date >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Date >>>'
go
/* TABLE: Dim_Location */
CREATE TABLE Dim_Location(
    [Location_id(SK)] int NOT NULL,
    City varchar(500) NULL,
    Address varchar(255) NULL,
    Latitude decimal(9, 6) NULL,
    Longitude decimal(9, 6) NULL,
    Pid varchar(500) NULL,
    DI_CreateDate date NULL,
    DI_WorkFlowFileName varchar(100) NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED ([Location_id(SK)])
)
go

IF OBJECT_ID('Dim_Location') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Location >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Location >>>'
go


/* 
 * TABLE: Dim_Source 
 */

CREATE TABLE Dim_Source(
    [Dim_Source(SK)]       int             NOT NULL,
    Source_Name            varchar(100)     NULL,
    Pid                    varchar(1000)	NUll,
    DI_CreateDate          date            NULL,
    DI_WorkFlowFileName    varchar(100)    NULL,
    CONSTRAINT PK2_1_1 PRIMARY KEY NONCLUSTERED ([Dim_Source(SK)])
)

go



IF OBJECT_ID('Dim_Source') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Source >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Source >>>'
go



/* TABLE: Dim_Vechicle */
CREATE TABLE Dim_Vechicle(
    Dim_Vechicle int NOT NULL,
    Vehicle_involved varchar(500) NULL,
    Start_Date date NULL,
    End_Date date NULL,
    Is_Current BIT NULL,
    Pid varchar(500) NULL,
    DI_CreateDate date NULL,
    DI_WorkFlowFileName varchar(100) NULL,
    CONSTRAINT PK2_1_1_1_3 PRIMARY KEY NONCLUSTERED (Dim_Vechicle)
)
go

IF OBJECT_ID('Dim_Vechicle') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Vechicle >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Vechicle >>>'
go
/* TABLE: Fact_Accident_table */
CREATE TABLE Fact_Accident_table(
    Fact_Accident_id int NOT NULL,
    [Location_id(SK)] int NULL,
    [Time_id(SK)] int NULL,
    [date(SK)] int NULL,
    Case_id nvarchar(1000) NULL,
    Pedestrians_inv_acc int NULL,
    No_pedestrians_killed int NULL,
    Motorist_killed int NULL,
    Motorist_injured int NULL,
    No_Fatal_Acc int NULL,
    Total_injury_count int NULL,
    No_Road_Users char(100) NULL,
	[Dim_Source(SK)]         int             NOT NULL,
    Pid nvarchar(100) NULL,
    DI_CreateDate date NULL,
    DI_WorkFlowFileName varchar(100) NULL,
    CONSTRAINT PK2_1_1_1_1 PRIMARY KEY NONCLUSTERED (Fact_Accident_id)
)
go

IF OBJECT_ID('Fact_Accident_table') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Accident_table >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Accident_table >>>'
go
/* TABLE: Bridge_Collision_Contributing_Factor */
CREATE TABLE Bridge_Collision_Contributing_Factor(
    Bridge_Collision_Contributing_Factor_id int NOT NULL,
    Fact_Accident_id int NOT NULL,
    [Dim_Contributing_Factor(SK)] int NOT NULL,
    Pid varchar(500) NULL,
    DI_CreateDate date NULL,
    DI_WorkFlowFileName varchar(100) NULL,
    CONSTRAINT PK2_1_1_2 PRIMARY KEY NONCLUSTERED (Bridge_Collision_Contributing_Factor_id)
)
go

IF OBJECT_ID('Bridge_Collision_Contributing_Factor') IS NOT NULL
    PRINT '<<< CREATED TABLE Bridge_Collision_Contributing_Factor >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Bridge_Collision_Contributing_Factor >>>'
go
/* TABLE: Bridge_Vechicle_involved */
CREATE TABLE Bridge_Vechicle_involved(
    Bridge_Vechicle_involved_id int NOT NULL,
    Dim_Vechicle int NOT NULL,
    Fact_Accident_id int NOT NULL,
    Pid varchar(500) NULL,
    DI_CreateDate date NULL,
    DI_WorkFlowFileName varchar(100) NULL,
    CONSTRAINT PK2_1_1_2_2 PRIMARY KEY NONCLUSTERED (Bridge_Vechicle_involved_id)
)
go

IF OBJECT_ID('Bridge_Vechicle_involved') IS NOT NULL
    PRINT '<<< CREATED TABLE Bridge_Vechicle_involved >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Bridge_Vechicle_involved >>>'
go
/* TABLE: Dim_Time */
CREATE TABLE Dim_Time(
    [Time_id(SK)] int NOT NULL,
    Format_12hr int NULL,
    Format_24hr int NULL,
    Am_Pm varchar(10) NULL,
    Minute_in_Hour int NULL,
    Time_Value time(0) NULL,
    Time_of_the_day varchar(10) NULL,
    Pid varchar(500) NULL,
    DI_CreateDate date NULL,
    DI_WorkFlowFileName varchar(100) NULL,
    CONSTRAINT PK2_1 PRIMARY KEY NONCLUSTERED ([Time_id(SK)])
)
go

IF OBJECT_ID('Dim_Time') IS NOT NULL
    PRINT '<<< CREATED TABLE Dim_Time >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Dim_Time >>>'
go



/* Updated Foreign Key Constraints */
ALTER TABLE Fact_Accident_table ADD CONSTRAINT RefDim_Location23 FOREIGN KEY ([Location_id(SK)]) REFERENCES Dim_Location([Location_id(SK)])
go
ALTER TABLE Fact_Accident_table ADD CONSTRAINT RefDim_Time24 FOREIGN KEY ([Time_id(SK)]) REFERENCES Dim_Time([Time_id(SK)])
go
ALTER TABLE Fact_Accident_table ADD CONSTRAINT RefDim_Date25 FOREIGN KEY ([date(SK)]) REFERENCES Dim_Date([date(SK)])
go

ALTER TABLE Bridge_Collision_Contributing_Factor ADD CONSTRAINT RefDim_Contributing_Factor6 FOREIGN KEY ([Dim_Contributing_Factor(SK)]) REFERENCES Dim_Contributing_Factor([Dim_Contributing_Factor(SK)])
go
ALTER TABLE Bridge_Collision_Contributing_Factor ADD CONSTRAINT RefFact_Accident_table22 FOREIGN KEY (Fact_Accident_id) REFERENCES Fact_Accident_table(Fact_Accident_id)
go

ALTER TABLE Bridge_Vechicle_involved ADD CONSTRAINT RefDim_Vechicle12 FOREIGN KEY (Dim_Vechicle) REFERENCES Dim_Vechicle(Dim_Vechicle)
go
ALTER TABLE Bridge_Vechicle_involved ADD CONSTRAINT RefFact_Accident_table21 FOREIGN KEY (Fact_Accident_id) REFERENCES Fact_Accident_table(Fact_Accident_id)
go

