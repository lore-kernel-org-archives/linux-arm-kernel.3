Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E14DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 06:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iGySoB88OEcRTsat4S3v7cuCT0D+xrGo0gJxgXYwwCo=; b=iDTMzzlBpgTcV0kTAfyjoOWGqN
	nVoAL5f51tT8eV5LknLRyeVB2n5HDa/SjQrV+6ufReK+4Ws4uL1SGKgoIuGAeAjATgiFYMLkJ/Dmx
	UmyIADLgtVgF+/VdmAmmDeDv1BF7GtcKYcLNavkhlFSGLRhstPHQzmxDIfOq7zkCncRX5ZxqAfqi3
	IqbQb372vEKvxNFF5z0GrgAIDoCRg6y0tteSRxEN1YbjQ5ux+kXjNHr9k9xhYLHjs0EMkEqeK5iwj
	QRBRqxF+WyMnKmRka+ozwZ3I3AbTT0mSbjrnvGMZ6Z/5Rd2Pa6YVmE7NqwCSgMnCzOJTygc+pzQyb
	xpYOl3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzXE-0000000EFA3-1EjD;
	Tue, 07 Jul 2026 06:44:00 +0000
Received: from mail-westusazon11012067.outbound.protection.outlook.com ([52.101.43.67] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgzXA-0000000EF9e-3Lpw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 06:43:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHs/7dmDT1HPjQhD6+H6VfiWA0gcD12rba5OEdSfKtNTZuoGL3oGHL/7U3likjAdbHpAIdD5PhZz1RkHma0LZ+Q2hzNPiO3YgCZp+eJH9f5oPasVPBMj72Su/3WduYtGyiC/4fF7ili6xiVqrhlJjnsge3X9BZr2i5oz4yrxLKMB/6h8wFWLNIDwcay6MvvIjBMdwXZeZbmh9V4E+SGHgsHQCQLoCcyHahg3hbC9AAxNr375ENL5KZCpScamZMboixCmSop+QvxYLTHTRUnmrR38tRsfGajT4hPgHJfW7axcZ00JmAyHWPshTOVh2igbPSiTDPvcdoaniYKQSmatTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGySoB88OEcRTsat4S3v7cuCT0D+xrGo0gJxgXYwwCo=;
 b=FKtyNRdNVsaNxuPl+0P39xYzyL6ABrz3R3OlRij2uGXWwaWqWi3+ugVdo7PvKPkxJBIS6rtXfVqPe0Nt/BdQg19kPenSQOgopD64u0ZZepLOBGzvvYeJ7kWNZe3ruXCzSlQdJ3PN2EkwpwG3j9GKHtyXD21myIs8l25FaJShzv5TvGODNVj5FNMuGp/vtpg98TwPNJZa83Mo7VSATeCUFY7wPtSvNij1d8XdBI1UUOapXR5IPVzUoJ0JmuyYELqWfjIvdcuEQVGwFGFdyfktd6leH6Z8nvrukksCo2mtL6lVOTNcI2JNjE7v/lMYX9VWVh8qdRB9jC0c4IbZ1XP9Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGySoB88OEcRTsat4S3v7cuCT0D+xrGo0gJxgXYwwCo=;
 b=Myr8VDkFtFLlIWaWtpb838sM1NzakVENuiEoKaMgAgDklZmiUT8YWHJJKukdy3BjYWJNEtiBNr7PlNjeNU7hekE/OQzcBKc6vHguetm7ju8bYnVKv5FyM9Dp7K2v2yjHWHjgwx4zRFJShFDC+W/4aWg4fceKLWsj2DredeB8BeQ=
Received: from BN9PR03CA0462.namprd03.prod.outlook.com (2603:10b6:408:139::17)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 06:43:50 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:139:cafe::22) by BN9PR03CA0462.outlook.office365.com
 (2603:10b6:408:139::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 7
 Jul 2026 06:43:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.0 via Frontend Transport; Tue, 7 Jul 2026 06:43:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 01:43:49 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 01:43:48 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 01:43:48 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] dt-bindings: xilinx: Remove EDK/Ethernet references
Date: Tue, 7 Jul 2026 08:43:31 +0200
Message-ID: <43b2cbe78468fdfaf849a44a7b68ecbae521e611.1783406609.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5179; i=michal.simek@amd.com; h=from:subject:message-id; bh=EE4ww8VoIIOekWJnmh110l8ELLUoH5a9LrHNLuG8v8g=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT5LBA72VHzoFcrcMKNS+enf9zLEdbA90HrZ2Ot6i6FU xERV60OdpSyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEstMZ/vCnhzhNvdf6aevP 6om7qn0ilwh6+3/N//9A1/3MDaPbqz8wMkxjm/0iplv5Y81Xr+s3WDIKdAN8S63Oxbk5z/84ce6 zdTwA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f89bfd1-08b2-4017-623a-08dedbf31a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|11063799006|3023799007|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: chhMYxQmmdzmsel965uB9Dzkghevhom9zwRu4917UVK/xO1xVomaPpv0WSyqpqO/VHUJ/tiBrM7ksgVkbM65QONMuHh7No8/mrA4HmJUHwy/rTzSyHnytdmrhTYVyFjb760CIGJdJdMFraed8LJs6MdUoxcUEC9lfMl5HdRfzqWpVd+MMm7/3MzkmfFgrIvxIMwxduFUTib0SxVQgCm2TGERUAgqSspjlpH9cif9pLSyz+jV06OwjEER74Q2+0K5q2y2dBFq8kP9L2M4/GfIBgEl6DHwroK4EVgIyURMePqlfLT88/qI6vkye/XxCjco96/vZ98ia8F5G2Xh7UO87lk0QzB+OwoXMmdEzooSe7HUtzvb9VDaXEs8XVJp4GUDZeqsy2BhHuxes98aWATHIneCVVO3pra0Sv5SWsK7szKWogLlJp+c3beWzR1niPVMVURepO4G9pe0NGGrRpsq4vfxYyuqOrB+9x6ssF2vAhlYeO9k6LZB5CIhz8iEajKAiSbZ4Om6FXzNt039QvTwTLUYZny1z/vcFAqz65yQ2uxgHrjmn4IWeg+csaags3T+2xUOnQSL4t6KB+P6zrpUHrOGwzPO8BTADeI5cdyRncHtU8Coi6QDWU18HKVdXOFU4jhD+wBjDmiucc4BKfMo/Y3EUTxwn31W+TZvI+5LqklL/cBEyPIeWjZDKXtH6v822zQ0Q1PbmDgbX5Mo+RFG/w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(3023799007)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yojWQB69g/Jyi9kUSeWP0mXBz1ed3whG5exDv59EocdPDZcgjWBGuax82cSrQxlPFwp+qSrZ0OPjiLQdGdAQySWVwaMVX/ARZdKYZ11mLo3G6ZoFsG/z8x89jOgZ3h1AXmEJAqkpizwU8zjVglnuUbfA0iEfJRBVVeyDs5iVor2RWV8iXd4+Ialldb6dhsdNykWsGryIjebSTrjj8EzBk4NXzJXRqhmU+Rx3o0gRO1dHPeRKh7nyIOn3HavsM7+OecU3TiScGKYDBpTTeLpFLaVv0XVV33JHpNd0MAnuNdLh6WaS24cQ3M1f3SBafaIqnvC5ZjS0o/SLRv95+tMS9SjpkfclYPleJAsEENIa5xkcd43zLH2927HnyMfWItRLz+iKe0BrHZ5mrocEdFRkcc93UA11cM9NvwG5qL11mHJsDvOOZ/a2ofcM5olSMf+n
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 06:43:49.6969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f89bfd1-08b2-4017-623a-08dedbf31a44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_234356_886741_3A17623F 
X-CRM114-Status: GOOD (  22.87  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The latest EDK version was 14.7 released in 2013 that's why remove
description for it. Also remove generic description for Ethernet which
doesn't bring any value.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 Documentation/devicetree/bindings/xilinx.txt | 95 --------------------
 1 file changed, 95 deletions(-)

diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
index 0ee9de99b3ae..7e8ad67134b2 100644
--- a/Documentation/devicetree/bindings/xilinx.txt
+++ b/Documentation/devicetree/bindings/xilinx.txt
@@ -1,91 +1,3 @@
-   d) Xilinx IP cores
-
-   The Xilinx EDK toolchain ships with a set of IP cores (devices) for use
-   in Xilinx Spartan and Virtex FPGAs.  The devices cover the whole range
-   of standard device types (network, serial, etc.) and miscellaneous
-   devices (gpio, LCD, spi, etc).  Also, since these devices are
-   implemented within the fpga fabric every instance of the device can be
-   synthesised with different options that change the behaviour.
-
-   Each IP-core has a set of parameters which the FPGA designer can use to
-   control how the core is synthesized.  Historically, the EDK tool would
-   extract the device parameters relevant to device drivers and copy them
-   into an 'xparameters.h' in the form of #define symbols.  This tells the
-   device drivers how the IP cores are configured, but it requires the kernel
-   to be recompiled every time the FPGA bitstream is resynthesized.
-
-   The new approach is to export the parameters into the device tree and
-   generate a new device tree each time the FPGA bitstream changes.  The
-   parameters which used to be exported as #defines will now become
-   properties of the device node.  In general, device nodes for IP-cores
-   will take the following form:
-
-	(name): (generic-name)@(base-address) {
-		compatible = "xlnx,(ip-core-name)-(HW_VER)"
-			     [, (list of compatible devices), ...];
-		reg = <(baseaddr) (size)>;
-		interrupt-parent = <&interrupt-controller-phandle>;
-		interrupts = < ... >;
-		xlnx,(parameter1) = "(string-value)";
-		xlnx,(parameter2) = <(int-value)>;
-	};
-
-	(generic-name):   an open firmware-style name that describes the
-			generic class of device.  Preferably, this is one word, such
-			as 'serial' or 'ethernet'.
-	(ip-core-name):	the name of the ip block (given after the BEGIN
-			directive in system.mhs).  Should be in lowercase
-			and all underscores '_' converted to dashes '-'.
-	(name):		is derived from the "PARAMETER INSTANCE" value.
-	(parameter#):	C_* parameters from system.mhs.  The C_ prefix is
-			dropped from the parameter name, the name is converted
-			to lowercase and all underscore '_' characters are
-			converted to dashes '-'.
-	(baseaddr):	the baseaddr parameter value (often named C_BASEADDR).
-	(HW_VER):	from the HW_VER parameter.
-	(size):		the address range size (often C_HIGHADDR - C_BASEADDR + 1).
-
-   Typically, the compatible list will include the exact IP core version
-   followed by an older IP core version which implements the same
-   interface or any other device with the same interface.
-
-   'reg' and 'interrupts' are all optional properties.
-
-   For example, the following block from system.mhs:
-
-	BEGIN opb_uartlite
-		PARAMETER INSTANCE = opb_uartlite_0
-		PARAMETER HW_VER = 1.00.b
-		PARAMETER C_BAUDRATE = 115200
-		PARAMETER C_DATA_BITS = 8
-		PARAMETER C_ODD_PARITY = 0
-		PARAMETER C_USE_PARITY = 0
-		PARAMETER C_CLK_FREQ = 50000000
-		PARAMETER C_BASEADDR = 0xEC100000
-		PARAMETER C_HIGHADDR = 0xEC10FFFF
-		BUS_INTERFACE SOPB = opb_7
-		PORT OPB_Clk = CLK_50MHz
-		PORT Interrupt = opb_uartlite_0_Interrupt
-		PORT RX = opb_uartlite_0_RX
-		PORT TX = opb_uartlite_0_TX
-		PORT OPB_Rst = sys_bus_reset_0
-	END
-
-   becomes the following device tree node:
-
-	opb_uartlite_0: serial@ec100000 {
-		device_type = "serial";
-		compatible = "xlnx,opb-uartlite-1.00.b";
-		reg = <ec100000 10000>;
-		interrupt-parent = <&opb_intc_0>;
-		interrupts = <1 0>; // got this from the opb_intc parameters
-		current-speed = <d#115200>;	// standard serial device prop
-		clock-frequency = <d#50000000>;	// standard serial device prop
-		xlnx,data-bits = <8>;
-		xlnx,odd-parity = <0>;
-		xlnx,use-parity = <0>;
-	};
-
    That covers the general approach to binding xilinx IP cores into the
    device tree.  The following are bindings for specific devices:
 
@@ -102,13 +14,6 @@
                                            Default is <d#1024 d#480>.
        - rotate-display (empty) : rotate display 180 degrees.
 
-      iii) Xilinx EMAC and Xilinx TEMAC
-
-      Xilinx Ethernet devices.  In addition to general xilinx properties
-      listed above, nodes for these devices should include a phy-handle
-      property, and may include other common network device properties
-      like local-mac-address.
-
       v) Xilinx hwicap
 
 		Xilinx hwicap devices provide access to the configuration logic
---
base-commit: f608bce703fc31a2cdf67abe1de882d5bbc45142
branch: zynqmp/dt

-- 
2.43.0


