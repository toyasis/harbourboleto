IF NOT DEFINED PROG SET PROG=BOL
REM SET VUPX=SIM
REM SET PROG=TXT2XLS
SET PRGDRV=C:
SET PRGDIR=\APPS\BOLETO
M:
CD \BOLETO

DEL *.map
DEL *.tds
CLS

IF %PROG%==SM  GOTO RUNSM

:RUNSM
DEL DEMOBOL.EXE
HBMAKE demobol.bc %1
IF NOT EXIST DEMOBOL.EXE GOTO FIM
IF DEFINED VUPX upx demobol.exe --best --compress-exports=0
%PRGDRV%
CD %PRGDIR%
M:DEMOBOL
GOTO FIM

:FIM
M:
SET PROG=
SET VUPX=
SET PRGDRV=
SET PRGDIR=
rem PAUSE
rem MODE 80,25