Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145DEC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7gd4xgFPS6w7BTzrSeXHpNhFIY11yTT0Qr54aOpU7Go=; b=nY54C/ZhOS9cI+PGkD0xwCJdtF
	3UHSLLyYn2uxJvUF/EKZ2iVglotWAAzclmbv1SGcamxg7DEznJD2MSNTBh4i8srGWBYdj04nntMuw
	2GDAdi6qMGljOEmOi6og8daie25UT1DugGGSm2OPLcem106skAxXu6F9LQXMQoCMe5I/jMbgcFyVU
	P+DPmZbxkTXBQzago7X9Pcnpkb45ySATrcifH4ZebO+Ftt53uT+B5b7stFoGY/fFMu0amaRxO2Kjp
	BnaF2qTjbmyZs6+uLwaiz09y20fRtaWiuWsBUob4rmdO+x1u8rEv8yK48w8hxn2CnRQVw+bsXJ5ie
	c5kRfAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1EG-0000000EUE0-3qGZ;
	Tue, 07 Jul 2026 08:32:32 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1ED-0000000EUDT-1cCh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:32:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzk5ST/YFWyFesF629fiq1/LXcqx79Nt8Y0vjII1MmAHnsjpGB6SAox1MdxnqTi50coRReHoic0MkfeEkmyUjP7XR7ixzXtk/U8O9WYFIq8D/9KKYjUqpPm5h/u8csnt7uh+JWkW2HFNveavPXBG95LWMkrubgmS5JWR/N0yzhUQu+U/qo905nPagHu6W3I7apPCNi+JzcWQNPImg3Bjul+zNHGUOZ+nEtiYtdfVjgXIDQoUav1mLdRRkDti7zu6npHoaPsgsPYZmqQC487Z/ROK73xvWtb32Z/SzdjkSlKbYVuPKs7ZdulQ2M+MC8NQH+knPGgbNkCBbVE37qpGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gd4xgFPS6w7BTzrSeXHpNhFIY11yTT0Qr54aOpU7Go=;
 b=CTd3jBtl5ou+WMaKixcc7Jhw+cmFbPY1Qvhfj/Giia8XBswMy7L/irjorJmTjZqIG4ojfVyoPD3Rh5BQczjRsbMQDC3NWIWEkCa2NyhyMLw0eLELIhxR6egmuhjSCD6Cu0p5U2VIn68iM2UDtzw6ZnLTKTiWZ6dzLGvj+QUVsTxb1Y20DJwiZD1bZucadOi+uxk7lTjpSaOdFaBgkr07vzH3cxvdPDgfaBAc81O5qR+p3cPKS5SULFNlyThsrhOK4InWR4B9dwuu30HqIM/WR49yjBlVKXuC8WDDrSVRr7Cy487l+Q6RMwmSBhi2Qh+8265jRaHq2lH5OwSUxCPDqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gd4xgFPS6w7BTzrSeXHpNhFIY11yTT0Qr54aOpU7Go=;
 b=3xDueQMBovL/F+cEw2ChxY+Y3I6f2iXyN4tutgUJytdHpqlDOvNlo299z/1PnxYiuyN9z2c9pbQSKGWHLd7jta+fTc0IFTWQC2arUSwtHg0qxcnquOgW5KSyWkUnJZFpK1QXNn41iqdmTWtPjayE/1W9Xft9bD9b+/PyabbwNOc=
Received: from MN2PR05CA0047.namprd05.prod.outlook.com (2603:10b6:208:236::16)
 by MW4PR12MB7288.namprd12.prod.outlook.com (2603:10b6:303:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 08:32:20 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::78) by MN2PR05CA0047.outlook.office365.com
 (2603:10b6:208:236::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 08:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 08:32:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 03:32:14 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 03:32:14 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2] dt-bindings: xilinx: Remove EDK/Ethernet references
Date: Tue, 7 Jul 2026 10:32:09 +0200
Message-ID: <40767504662d6461553db77465230e25348c69bc.1783413127.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5356; i=michal.simek@amd.com; h=from:subject:message-id; bh=LeQbBNHl76yizinL+LiSXP3l+HNTlbJA3hGQO3XnshE=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT57Oy+LHkrtmXm9GO7/p9bsLl07R8LmUie5PyOTS8lB GsiP9780lHKwiDGwSArpsgynUnHYc23a0vFlkfmw8xhZQIZwsDFKQAT+T2F4Z/RUvfKuwwVm6L+ cgce+vHYvvOWbOuklJXHtjKc15IOZ1vL8L+Ec5nLCl4D2YO8D4QPfFVLfB9hysXtfF+Ge+E3Het fqxgA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|MW4PR12MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ae5a1e-2816-4902-b661-08dedc024222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|3023799007|6133799003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: SQylDOko0rvCkBxGKstVMARKbSQkcY8x2FsKX4VSksdp+X3gqAdSuLJYZmpLFa1aVjWhWw4I0xIXYCrBbIi6oHMvKh8ti5Ie85Fd0zqwv7/3DvJdp7U6h2ykOWhZf3n1REmrxIKlKUhjOZ3/3lT/8QehzQHOIr8anLTeYakOLOdo+S5FnD58VF5UXK97yTal0ARRjCXaVchKfeqxXCNVabciKYaz2Jyrd6w5ahmrxw2ylv8FFbCBNcwWRVirIGFdF7GH5sNfzb7RCqcK9OO9NmHWahDswfjH9rh3tkuv1AMc8J+7FwW0z5JbzqHIA8ygN/JzUhz9DvXBHUv8UjOZyb45ubDgjlPPRKqzPAYu5kKR4tYfmVRuKuTUwpebwo364iN4gX3KlDYPDJ/pFsd9B8sCluLCkSLIWeSzFvMF7JmfSjlX1wfZfXvt2amHzB28OV8qMyTP/v1AIfD8T7rYgitzkn/nDuQaqhD/fyvRiewg48PUahsy7l8X48WmoL6NQVNCgvkVJE016LSbpIbakwnZul2ExxVAjZ30U4712NSU57vu4jcIEBFpNZA9feRgPj75B98BvrWA3gYGIKv9A+PtzZVRH+D/UAL9d8IzLuXgTU6BlCZnoH5VKbtKZAvkDhF5/Lck5uz5TvT1nE/v1bHLem9/a0CGwn/fjY70HxD0q8CAhptJvgVe5alUtIajnEV2otwdM7HsXolyPUtm/Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(3023799007)(6133799003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rIDSFzyUupXUVYKzPqjL5P0uHEs6ugxfaO7/yPcQhWaqMO70GtT3wr+EgP241mg6Fl4UBImGzRDdY3KhbUQYXVqQQ2m4opileL1dOhf+XSGiDAdp+zUS4mBSc/bJzmxmu9tSQj/+ufJY+3b6ttfaCL9bjXqjhWzSKEA0VsV3f5D9IYAqjMNGueYfOWEmaCAzBWIaGJV4oa7PFP6DahqGkyDNmb8Dn3qU9ym5CxPu9IugEiXgQrSHYA1p33gTioaZ+3rfr3V1SLjwwM9oTc0bX+P0Qznjxblynrr/bxxNo16cgu5blOrraX3lvaRyoiCbriyaWNW0ayyI9tNxyaFv8AUMWyYpjuYO+SJGFo222PGR1r96DFqvcHTMuiHmco5yhjGQ2N3gpsIhtP+FUOXpPSk71L9l7RTPcBCvE0j2GiQ5e9n7gMmOW0akSRIYuZsQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 08:32:19.0454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ae5a1e-2816-4902-b661-08dedc024222
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7288
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_013229_564215_350BF083 
X-CRM114-Status: GOOD (  24.59  )
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

Changes in v2:
- Update description for additional bindings - reported by Sashiko

 Documentation/devicetree/bindings/xilinx.txt | 98 +-------------------
 1 file changed, 1 insertion(+), 97 deletions(-)

diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
index 0ee9de99b3ae..a1a2cde7b7d8 100644
--- a/Documentation/devicetree/bindings/xilinx.txt
+++ b/Documentation/devicetree/bindings/xilinx.txt
@@ -1,93 +1,4 @@
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
-   That covers the general approach to binding xilinx IP cores into the
-   device tree.  The following are bindings for specific devices:
+   Bindings for specific devices:
 
       i) Xilinx ML300 Framebuffer
 
@@ -102,13 +13,6 @@
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


