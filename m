Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09595CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIhwqvNfFUPGkGKDGdQA0xxsDsEozIRSBlJe9cqjGkc=; b=Wn3xKiGklz9YOETjoQsCu9cWxf
	NmpvhqpMXdroRv6rs/vKZJ3jRxEAjOxMGAgQVLIp2pIiF2VEZ+mpOQxsLrzCCBUjD+0ZlLMaa4sdK
	C8fN9aZdHFR+15T+aQtKiMmqb0pA3OLoXh3HdkqLcB8nv/lW8klOAb3P3bs0uIIQjPNRhPiN6zLhB
	H0TsiEL/8AgG8zGBUYN7ODykbnvqQEA4YTAeeusDt3363yNmJUXi0fC1Dntmd07zQnX8WpDRN1uZG
	dYvH1OGF/JvZtUI2xy5w6/AtBuKX8/ejGtuPd/0kANIUXrQyaBV6D7XxIPZaHdYysYHfHKgEIN12o
	uhXe9d8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxxN-00000007VBR-2S4B;
	Fri, 29 May 2026 14:13:01 +0000
Received: from mail-eastus2azon11011042.outbound.protection.outlook.com ([52.101.57.42] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxxG-00000007V87-0XeO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INPt6Pw+HtElDpET+NI7lO29n1CzEf1222Y0r8ajlf1I5CKBAlvgHM3P6T0loULtmfJ36lUfjH6ysLqSXrSJ2o26HTOVJBqaXc537OvPnRJOsbPHsIynMuZeivYFGwebHGQMiNC8fElquyNvmFXhuCiIPnZotwLacP927U8kG9kGPysE+tL2FMtD+l3uvL6UmWAE5H+bBoVGZxBcSNap6d/CmCLwiJd3+rg8cLAev0h73rpA2dqz/CRWufrFkgfAYhnS9l5GUwLT0gtdq8onlkZ776Zxr3Jq0Ly/2Jd1npAeiVdkmafVfU9nz5UBNoL6oq1MwP7YfbnqQbjZd91vNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIhwqvNfFUPGkGKDGdQA0xxsDsEozIRSBlJe9cqjGkc=;
 b=Gyh0iM/ikpZ/l8d/tVrc1aPoMPYte1fXnnf6cJYBzUdT5boPFlOjPy0tgP3bzxMkdRX8UOcd4QTwje5YIqfMfkr+ovKu5z2NxX5t3QSbDmi2cA3vBpslOhPABDnlqLC4AFiLqulxAvlWZrOwSUWcLyQ5+UT4ngeBOs8Mo5HOxD0rzL1r/1Z8ZDOjSAAi9b61PHpReq/JJ57SvJb9BtfB4mezHxvKysEYh/IOBPc1kkKwmk9XRoUQzqDFM2w2t3FHi4znZ33ppdIgooYyzkwyBcjUA4t4P/cNe5yxhk5R6UUviNzBbt//NABoGwhDu8TVsKgodSpDaLSeOpv4J7jnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIhwqvNfFUPGkGKDGdQA0xxsDsEozIRSBlJe9cqjGkc=;
 b=bmciQk2eediL5fQS2HMKJzDF6vLsnwzbPcUqFhFuKsDSMhHPFXZ39f0OG8a4yBuaMVb1r36hYr8NUGteJjzV3u/1wGf315jal2qW3J2LkicgCy8hCMPfKmzSmPvdMOKjMXbOZzO48Cx1XQGTTiy6XOiirsjoBvEDLppSF6QPNgk=
Received: from DSSP221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:3d5::10) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Fri, 29 May 2026 14:12:46 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:8:3d5:cafe::a6) by DSSP221CA0005.outlook.office365.com
 (2603:10b6:8:3d5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Fri, 29
 May 2026 14:12:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 14:12:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 09:12:37 -0500
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Fri, 29 May 2026 09:12:37 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/3] arm64: zynqmp: Switch Versal NET to firmware clock interface
Date: Fri, 29 May 2026 16:12:09 +0200
Message-ID: <60222042a1c46d28b9c00a8128d270937f97d997.1780063921.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780063921.git.michal.simek@amd.com>
References: <cover.1780063921.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=28724; i=michal.simek@amd.com; h=from:subject:message-id; bh=qYKsqVnI91ndM/Eszt/1ZhayTUtmV4oX8bJEODfio2g=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRJzjvJHaF9QYJlWWmwVtPnLX/fmhXduO98rz3kZ7SqW Phtzb7XHaUsDGIcDLJiiizTmXQc1ny7tlRseWQ+zBxWJpAhDFycAjCRj08Y/nufd3WJ2zYt88Ot Jzwxt89enq7wzmS1lsUWHeWE/BkXttQwMiyJXGajPfksk/J2ST6byd0v7qp5yxtsWfAyc/6JqVH +c/kB
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c44b0b-c08d-4aa4-a58f-08debd8c5b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099006|22082099003|5023799004|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: SWeXdk+l+LNzNXBy+BnoA13w7HwzyDAA8q6rBkNceL1Wo4yR/iYLVJj3BU1QrjVSAWioXy77gex1yRVqj5ToBu/820HFbAyvH31Tl0ppVJU1niq5v67H5p8rlKNLS9z0H4ho3pGAA/jyvyN3Ttvtp+M4a3ZVGBNWdseBehzzYr0wpZ3TJMKZ72Tjki5o5IWTN7BqulZm9YBreUb2P9QUAR00PzbIQyUOCBSN2+2bV7+XwUlBrHuKT2eXz+Gu2Lqhp4EhwtcU0wGdfKUSnVdT2WirZwr0ebyBrsX7DyO2VFDMqLn+L7iWpzWqamFTSqJCb3nEeye3UAItgEdYGVGI5GaGWUR/jcFSH1MXcHoHHlXKkM8VGjvZbGF2gJV6FLfUwgpe8/O4W+uDsqKS4+sGFcoSa3qVaaRHgpQBzoWQAHzS8My5WEUj9OxF2uMNTQQXD6EG4gNvF/qZxjcWK1RL9Q178xIz0El5sVxN22VUiVHGXoob8R5tjbBnXRw9UQ1Yzo6Pqc2u2YqgohMe1+T010I7M7LnIgIT4Shi23XyGgs1ki9PlgXoHXDCU7ytCG6qlqBWth68mVLGUlW2Ui62lDLF4IQGKYNftkEzb+WYlfCjfsksw/KPf3W+uHTZSN4iGyhFAd3c3p5dvYbfWXaW3IRuWdehi70f3WnxvDJQi3/mq1E1dxTh8XMlQy6PNNh9e2ALeVBLG+4Jpbsrk4F7LnCD8PbfgNhfijgjWl0qJh8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099006)(22082099003)(5023799004)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oRVUBAjJk/nwZhJya9YWU6rlwm55JATjPqMts6Fl03XDbemG4olgbYY+/KO25/7opnyWOfdDYt6A1QprlJjitIX4Rw4IGgyABxFyXMSTAHUmUAIw1p3Ke5SWcAAOZFcaAVynU5Z2Qsm0sMeaGjZ9ltTgGCaszZ7K2W/vIsktscMl5nGG7yj0EvehU16+NTxj3ECmeOoVKbIuszdX6aJWvL9YA2EcNeNp6V/dgYR5Qm+b+TCRbItpKLdWUJ1k7VuXvhviXJSL3OQnfjPegO/9xyhXComY6dhIkXVFRm1S0a0IDu+tYdxW0Ddi0riP40it3AVqdkou00wxldxU1ae0PgbTGhDBdRoLDtHwIVouDYFMoi/9wV/lNWSUGHpsIfelA9wXgHfCUxuPz+m3jWCOy/Opjp7jebVDIM6fUphZW/1zyCSSDtEYcfhJiQk+XJfZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 14:12:45.7513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c44b0b-c08d-4aa4-a58f-08debd8c5b52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_071254_258942_84D174D5 
X-CRM114-Status: GOOD (  15.31  )
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

Switch Versal NET from using fixed clocks (versal-net-clk.dtsi) to the
firmware-based CCF clock interface (versal-net-clk-ccf.dtsi). This
enables proper clock management through the platform firmware instead
of relying on static fixed-clock definitions.

Add DT macro headers for Versal NET and base Versal clocks, power
domains and resets that are required by the CCF clock dtsi.

Signed-off-by: Michal Simek <michal.simek@amd.com>

---

Changes in v2:
- use clock-<HZ> node name for fixed clocks
- Reuse existing versal-net-clk.dtsi file

 .../arm64/boot/dts/xilinx/versal-net-clk.dtsi | 345 +++++++++++++-----
 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h  | 123 +++++++
 .../boot/dts/xilinx/xlnx-versal-net-clk.h     |  78 ++++
 .../boot/dts/xilinx/xlnx-versal-net-power.h   |  38 ++
 .../boot/dts/xilinx/xlnx-versal-net-resets.h  |  53 +++
 .../arm64/boot/dts/xilinx/xlnx-versal-power.h |  54 +++
 .../boot/dts/xilinx/xlnx-versal-resets.h      | 105 ++++++
 7 files changed, 697 insertions(+), 99 deletions(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h

diff --git a/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi b/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
index b7a8a1a512cb..dead487539cd 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
+++ b/arch/arm64/boot/dts/xilinx/versal-net-clk.dtsi
@@ -1,231 +1,378 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * dts file for Xilinx Versal NET fixed clock
+ * dts file for Xilinx Versal with PM
  *
- * (C) Copyright 2022, Xilinx, Inc.
- * (C) Copyright 2022 - 2025, Advanced Micro Devices, Inc.
+ * Copyright (C) 2022, Xilinx, Inc.
+ * Copyright (C) 2022 - 2025, Advanced Micro Devices, Inc.
  *
  * Michal Simek <michal.simek@amd.com>
  */
 
+#include "xlnx-versal-net-clk.h"
+#include "xlnx-versal-net-power.h"
+#include "xlnx-versal-net-resets.h"
+
 / {
-	clk60: clk60 {
+	ref_clk: clock-33333333 {
+		bootph-all;
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <60000000>;
+		clock-frequency = <33333333>;
+		clock-output-names = "ref_clk";
 	};
 
-	clk100: clk100 {
+	rtc_clk: clock-32768 {
+		bootph-all;
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <100000000>;
+		clock-frequency = <32768>;
+		clock-output-names = "rtc_clk";
 	};
 
-	clk125: clk125 {
-		compatible = "fixed-clock";
+	can0_clk: can0-clk {
 		#clock-cells = <0>;
-		clock-frequency = <125000000>;
+		compatible = "fixed-factor-clock";
+		clocks = <&versal_net_clk CAN0_REF_2X>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "can0_clk";
 	};
 
-	clk150: clk150 {
-		compatible = "fixed-clock";
+	can1_clk: can1-clk {
 		#clock-cells = <0>;
-		clock-frequency = <150000000>;
+		compatible = "fixed-factor-clock";
+		clocks = <&versal_net_clk CAN1_REF_2X>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "can1_clk";
 	};
 
-	clk160: clk160 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <160000000>;
+	firmware {
+		versal_net_firmware: versal-net-firmware {
+			compatible = "xlnx,versal-net-firmware", "xlnx,versal-firmware";
+			bootph-all;
+			method = "smc";
+			#power-domain-cells = <1>;
+
+			versal_net_reset: reset-controller {
+				compatible = "xlnx,versal-net-reset";
+				#reset-cells = <1>;
+			};
+
+			versal_net_clk: clock-controller {
+				bootph-all;
+				#clock-cells = <1>;
+				compatible = "xlnx,versal-net-clk", "xlnx,versal-clk";
+				clocks = <&ref_clk>, <&ref_clk>, <&ref_clk>;
+				clock-names = "ref", "pl_alt_ref", "alt_ref";
+			};
+
+			versal_net_power: power-management { /* untested */
+				compatible = "xlnx,zynqmp-power";
+				interrupt-parent = <&gic>;
+				interrupts = <0 57 4>;
+				mboxes = <&ipi_mailbox_pmu1 0>,
+					 <&ipi_mailbox_pmu1 1>;
+				mbox-names = "tx", "rx";
+			};
+		};
 	};
 
-	clk200: clk200 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <200000000>;
+	zynqmp-ipi {
+		compatible = "xlnx,zynqmp-ipi-mailbox";
+		interrupt-parent = <&gic>;
+		interrupts = <0 57 4>;
+		xlnx,ipi-id = <2>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ipi_mailbox_pmu1: mailbox@eb3f0440 {
+			compatible = "xlnx,zynqmp-ipi-dest-mailbox";
+			reg = <0 0xeb3f0440 0 0x20>,
+			      <0 0xeb3f0460 0 0x20>,
+			      <0 0xeb3f0280 0 0x20>,
+			      <0 0xeb3f02a0 0 0x20>;
+			reg-names = "local_request_region", "local_response_region",
+				    "remote_request_region", "remote_response_region";
+			#mbox-cells = <1>;
+			xlnx,ipi-id = <1>;
+		};
 	};
+};
 
-	clk250: clk250 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <250000000>;
-	};
+&cpu0 {
+	clocks = <&versal_net_clk ACPU_0>;
+};
 
-	clk300: clk300 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <300000000>;
-	};
+&cpu100 {
+	clocks = <&versal_net_clk ACPU_0>;
+};
 
-	clk450: clk450 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <450000000>;
-	};
+&cpu200 {
+	clocks = <&versal_net_clk ACPU_0>;
+};
 
-	clk1200: clk1200 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <1200000000>;
-	};
+&cpu300 {
+	clocks = <&versal_net_clk ACPU_0>;
+};
 
-	firmware {
-		versal_net_firmware: versal-net-firmware {
-			compatible = "xlnx,versal-net-firmware", "xlnx,versal-firmware";
-			bootph-all;
-			method = "smc";
-		};
-	};
+&cpu10000 {
+	clocks = <&versal_net_clk ACPU_1>;
 };
 
-&adma0 {
-	clocks = <&clk450>, <&clk450>;
+&cpu10100 {
+	clocks = <&versal_net_clk ACPU_1>;
 };
 
-&adma1 {
-	clocks = <&clk450>, <&clk450>;
+&cpu10200 {
+	clocks = <&versal_net_clk ACPU_1>;
 };
 
-&adma2 {
-	clocks = <&clk450>, <&clk450>;
+&cpu10300 {
+	clocks = <&versal_net_clk ACPU_1>;
 };
 
-&adma3 {
-	clocks = <&clk450>, <&clk450>;
+&cpu20000 {
+	clocks = <&versal_net_clk ACPU_2>;
 };
 
-&adma4 {
-	clocks = <&clk450>, <&clk450>;
+&cpu20100 {
+	clocks = <&versal_net_clk ACPU_2>;
 };
 
-&adma5 {
-	clocks = <&clk450>, <&clk450>;
+&cpu20200 {
+	clocks = <&versal_net_clk ACPU_2>;
 };
 
-&adma6 {
-	clocks = <&clk450>, <&clk450>;
+&cpu20300 {
+	clocks = <&versal_net_clk ACPU_2>;
 };
 
-&adma7 {
-	clocks = <&clk450>, <&clk450>;
+&cpu30000 {
+	clocks = <&versal_net_clk ACPU_3>;
+};
+
+&cpu30100 {
+	clocks = <&versal_net_clk ACPU_3>;
+};
+
+&cpu30200 {
+	clocks = <&versal_net_clk ACPU_3>;
+};
+
+&cpu30300 {
+	clocks = <&versal_net_clk ACPU_3>;
 };
 
 &can0 {
-	clocks = <&clk160>, <&clk160>;
+	clocks = <&can0_clk>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_CAN_FD_0>;
 };
 
 &can1 {
-	clocks = <&clk160>, <&clk160>;
+	clocks = <&can1_clk>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_CAN_FD_1>;
 };
 
 &gem0 {
-	clocks = <&clk125>, <&clk125>, <&clk125>, <&clk125>, <&clk250>;
+	clocks = <&versal_net_clk LPD_LSBUS>,
+		 <&versal_net_clk GEM0_REF>, <&versal_net_clk GEM0_TX>,
+		 <&versal_net_clk GEM0_RX>, <&versal_net_clk GEM_TSU>;
+	power-domains = <&versal_net_firmware PM_DEV_GEM_0>;
 };
 
 &gem1 {
-	clocks = <&clk125>, <&clk125>, <&clk125>, <&clk125>, <&clk250>;
+	clocks = <&versal_net_clk LPD_LSBUS>,
+		 <&versal_net_clk GEM1_REF>, <&versal_net_clk GEM1_TX>,
+		 <&versal_net_clk GEM1_RX>, <&versal_net_clk GEM_TSU>;
+	power-domains = <&versal_net_firmware PM_DEV_GEM_1>;
 };
 
 &gpio0 {
-	clocks = <&clk100>;
+	clocks = <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_GPIO>;
 };
 
 &gpio1 {
-	clocks = <&clk100>;
+	clocks = <&versal_net_clk PMC_LSBUS_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_GPIO_PMC>;
 };
 
 &i2c0 {
-	clocks = <&clk100>;
+	clocks = <&versal_net_clk I3C0_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_I2C_0>;
 };
 
 &i2c1 {
-	clocks = <&clk100>;
+	clocks = <&versal_net_clk I3C1_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_I2C_1>;
 };
 
 &i3c0 {
-	clocks = <&clk100>;
+	clocks = <&versal_net_clk I3C0_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_I2C_0>;
 };
 
 &i3c1 {
-	clocks = <&clk100>;
+	clocks = <&versal_net_clk I3C1_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_I2C_1>;
 };
 
-&ospi {
-	clocks = <&clk200>;
+&adma0 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_0>;
 };
 
-&qspi {
-	clocks = <&clk300>, <&clk300>;
+&adma1 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_1>;
 };
 
-&rtc {
-	/* Nothing */
+&adma2 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_2>;
 };
 
-&sdhci0 {
-	clocks = <&clk200>, <&clk200>, <&clk1200>;
+&adma3 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_3>;
 };
 
-&sdhci1 {
-	clocks = <&clk200>, <&clk200>, <&clk1200>;
+&adma4 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_4>;
+};
+
+&adma5 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_5>;
+};
+
+&adma6 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_6>;
+};
+
+&adma7 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_7>;
+};
+
+&qspi {
+	clocks = <&versal_net_clk QSPI_REF>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_QSPI>;
+};
+
+&ospi {
+	clocks = <&versal_net_clk OSPI_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_OSPI>;
+};
+
+&rtc {
+	clocks = <&rtc_clk>;
+	clock-names = "rtc";
+	power-domains = <&versal_net_firmware PM_DEV_RTC>;
 };
 
 &serial0 {
-	clocks = <&clk100>, <&clk100>;
+	clocks = <&versal_net_clk UART0_REF>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_UART_0>;
 };
 
 &serial1 {
-	clocks = <&clk100>, <&clk100>;
+	clocks = <&versal_net_clk UART1_REF>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_UART_1>;
+};
+
+&sdhci0 {
+	clocks = <&versal_net_clk SDIO0_REF>, <&versal_net_clk LPD_LSBUS>,
+		 <&versal_net_clk SD_DLL_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_SDIO_0>;
+};
+
+&sdhci1 {
+	clocks = <&versal_net_clk SDIO1_REF>, <&versal_net_clk LPD_LSBUS>,
+		 <&versal_net_clk SD_DLL_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_SDIO_1>;
 };
 
 &spi0 {
-	clocks = <&clk200>, <&clk200>;
+	clocks = <&versal_net_clk SPI0_REF>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_SPI_0>;
 };
 
 &spi1 {
-	clocks = <&clk200>, <&clk200>;
+	clocks = <&versal_net_clk SPI1_REF>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_SPI_1>;
 };
 
 &ttc0 {
-	clocks = <&clk150>;
+	clocks = <&versal_net_clk TTC0>;
+	power-domains = <&versal_net_firmware PM_DEV_TTC_0>;
+};
+
+&ttc1 {
+	clocks = <&versal_net_clk TTC1>;
+	power-domains = <&versal_net_firmware PM_DEV_TTC_1>;
+};
+
+&ttc2 {
+	clocks = <&versal_net_clk TTC2>;
+	power-domains = <&versal_net_firmware PM_DEV_TTC_2>;
+};
+
+&ttc3 {
+	clocks = <&versal_net_clk TTC3>;
+	power-domains = <&versal_net_firmware PM_DEV_TTC_3>;
 };
 
 &usb0 {
-	clocks = <&clk60>, <&clk60>;
+	clocks = <&versal_net_clk USB0_BUS_REF>, <&versal_net_clk USB0_BUS_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_USB_0>;
+	resets = <&versal_net_reset VERSAL_RST_USB_0>;
 };
 
 &dwc3_0 {
-	clocks = <&clk60>;
+	clocks = <&versal_net_clk USB0_BUS_REF>;
 };
 
 &usb1 {
-	clocks = <&clk60>, <&clk60>;
+	clocks = <&versal_net_clk USB1_BUS_REF>, <&versal_net_clk USB1_BUS_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_USB_1>;
+	resets = <&versal_net_reset VERSAL_RST_USB_1>;
 };
 
 &dwc3_1 {
-	clocks = <&clk60>;
+	clocks = <&versal_net_clk USB1_BUS_REF>;
 };
 
 &wwdt0 {
-	clocks = <&clk150>;
+	clocks = <&versal_net_clk FPD_WWDT0>;
+	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_0>;
 };
 
 &wwdt1 {
-	clocks = <&clk150>;
+	clocks = <&versal_net_clk FPD_WWDT1>;
+	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_1>;
 };
 
 &wwdt2 {
-	clocks = <&clk150>;
+	clocks = <&versal_net_clk FPD_WWDT2>;
+	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_2>;
 };
 
 &wwdt3 {
-	clocks = <&clk150>;
+	clocks = <&versal_net_clk FPD_WWDT3>;
+	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_3>;
 };
 
 &lpd_wwdt0 {
-	clocks = <&clk150>;
+	clocks = <&versal_net_clk LPD_WWDT0>;
+	power-domains = <&versal_net_firmware PM_DEV_LPD_SWDT_0>;
 };
 
 &lpd_wwdt1 {
-	clocks = <&clk150>;
+	clocks = <&versal_net_clk LPD_WWDT1>;
+	power-domains = <&versal_net_firmware PM_DEV_LPD_SWDT_1>;
 };
diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
new file mode 100644
index 000000000000..264d634d226e
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (C) 2019 Xilinx Inc.
+ *
+ */
+
+#ifndef _DT_BINDINGS_CLK_VERSAL_H
+#define _DT_BINDINGS_CLK_VERSAL_H
+
+#define PMC_PLL					1
+#define APU_PLL					2
+#define RPU_PLL					3
+#define CPM_PLL					4
+#define NOC_PLL					5
+#define PLL_MAX					6
+#define PMC_PRESRC				7
+#define PMC_POSTCLK				8
+#define PMC_PLL_OUT				9
+#define PPLL					10
+#define NOC_PRESRC				11
+#define NOC_POSTCLK				12
+#define NOC_PLL_OUT				13
+#define NPLL					14
+#define APU_PRESRC				15
+#define APU_POSTCLK				16
+#define APU_PLL_OUT				17
+#define APLL					18
+#define RPU_PRESRC				19
+#define RPU_POSTCLK				20
+#define RPU_PLL_OUT				21
+#define RPLL					22
+#define CPM_PRESRC				23
+#define CPM_POSTCLK				24
+#define CPM_PLL_OUT				25
+#define CPLL					26
+#define PPLL_TO_XPD				27
+#define NPLL_TO_XPD				28
+#define APLL_TO_XPD				29
+#define RPLL_TO_XPD				30
+#define EFUSE_REF				31
+#define SYSMON_REF				32
+#define IRO_SUSPEND_REF				33
+#define USB_SUSPEND				34
+#define SWITCH_TIMEOUT				35
+#define RCLK_PMC				36
+#define RCLK_LPD				37
+#define WDT					38
+#define TTC0					39
+#define TTC1					40
+#define TTC2					41
+#define TTC3					42
+#define GEM_TSU					43
+#define GEM_TSU_LB				44
+#define MUXED_IRO_DIV2				45
+#define MUXED_IRO_DIV4				46
+#define PSM_REF					47
+#define GEM0_RX					48
+#define GEM0_TX					49
+#define GEM1_RX					50
+#define GEM1_TX					51
+#define CPM_CORE_REF				52
+#define CPM_LSBUS_REF				53
+#define CPM_DBG_REF				54
+#define CPM_AUX0_REF				55
+#define CPM_AUX1_REF				56
+#define QSPI_REF				57
+#define OSPI_REF				58
+#define SDIO0_REF				59
+#define SDIO1_REF				60
+#define PMC_LSBUS_REF				61
+#define I2C_REF					62
+#define TEST_PATTERN_REF			63
+#define DFT_OSC_REF				64
+#define PMC_PL0_REF				65
+#define PMC_PL1_REF				66
+#define PMC_PL2_REF				67
+#define PMC_PL3_REF				68
+#define CFU_REF					69
+#define SPARE_REF				70
+#define NPI_REF					71
+#define HSM0_REF				72
+#define HSM1_REF				73
+#define SD_DLL_REF				74
+#define FPD_TOP_SWITCH				75
+#define FPD_LSBUS				76
+#define ACPU					77
+#define DBG_TRACE				78
+#define DBG_FPD					79
+#define LPD_TOP_SWITCH				80
+#define ADMA					81
+#define LPD_LSBUS				82
+#define CPU_R5					83
+#define CPU_R5_CORE				84
+#define CPU_R5_OCM				85
+#define CPU_R5_OCM2				86
+#define IOU_SWITCH				87
+#define GEM0_REF				88
+#define GEM1_REF				89
+#define GEM_TSU_REF				90
+#define USB0_BUS_REF				91
+#define UART0_REF				92
+#define UART1_REF				93
+#define SPI0_REF				94
+#define SPI1_REF				95
+#define CAN0_REF				96
+#define CAN1_REF				97
+#define I2C0_REF				98
+#define I2C1_REF				99
+#define DBG_LPD					100
+#define TIMESTAMP_REF				101
+#define DBG_TSTMP				102
+#define CPM_TOPSW_REF				103
+#define USB3_DUAL_REF				104
+#define OUTCLK_MAX				105
+#define REF_CLK					106
+#define PL_ALT_REF_CLK				107
+#define MUXED_IRO				108
+#define PL_EXT					109
+#define PL_LB					110
+#define MIO_50_OR_51				111
+#define MIO_24_OR_25				112
+
+#endif
diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
new file mode 100644
index 000000000000..f894d044c6f9
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022, Xilinx Inc.
+ * Copyright (C) 2022 - 2024, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _DT_BINDINGS_CLK_VERSAL_NET_H
+#define _DT_BINDINGS_CLK_VERSAL_NET_H
+
+#include "xlnx-versal-clk.h"
+
+#define GEM0_REF_RX	0xA9
+#define GEM0_REF_TX	0xA8
+#define GEM1_REF_RX	0xA2
+#define GEM1_REF_TX	0xA1
+#define CAN0_REF_2X	0x9E
+#define CAN1_REF_2X	0xAC
+#define FPD_WWDT0	0xB5
+#define FPD_WWDT1	0xB6
+#define FPD_WWDT2	0xB7
+#define FPD_WWDT3	0xB8
+#define LPD_WWDT0	0xB9
+#define LPD_WWDT1	0xBA
+#define ACPU_0		0x98
+#define ACPU_1		0x9B
+#define ACPU_2		0x9A
+#define ACPU_3		0x99
+#define I3C0_REF	0x9D
+#define I3C1_REF	0x9F
+#define USB1_BUS_REF	0xAE
+#define LPD_WWDT	0xAD
+
+/* Remove Versal specific node IDs */
+#undef APU_PLL
+#undef RPU_PLL
+#undef CPM_PLL
+#undef APU_PRESRC
+#undef APU_POSTCLK
+#undef APU_PLL_OUT
+#undef APLL
+#undef RPU_PRESRC
+#undef RPU_POSTCLK
+#undef RPU_PLL_OUT
+#undef RPLL
+#undef CPM_PRESRC
+#undef CPM_POSTCLK
+#undef CPM_PLL_OUT
+#undef CPLL
+#undef APLL_TO_XPD
+#undef RPLL_TO_XPD
+#undef RCLK_PMC
+#undef RCLK_LPD
+#undef WDT
+#undef MUXED_IRO_DIV2
+#undef MUXED_IRO_DIV4
+#undef PSM_REF
+#undef CPM_CORE_REF
+#undef CPM_LSBUS_REF
+#undef CPM_DBG_REF
+#undef CPM_AUX0_REF
+#undef CPM_AUX1_REF
+#undef CPU_R5
+#undef CPU_R5_CORE
+#undef CPU_R5_OCM
+#undef CPU_R5_OCM2
+#undef CAN0_REF
+#undef CAN1_REF
+#undef I2C0_REF
+#undef I2C1_REF
+#undef CPM_TOPSW_REF
+#undef USB3_DUAL_REF
+#undef MUXED_IRO
+#undef PL_EXT
+#undef PL_LB
+#undef MIO_50_OR_51
+#undef MIO_24_OR_25
+
+#endif
diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
new file mode 100644
index 000000000000..34f99695655d
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022, Xilinx, Inc.
+ * Copyright (C) 2022, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _DT_BINDINGS_VERSAL_NET_POWER_H
+#define _DT_BINDINGS_VERSAL_NET_POWER_H
+
+#include "xlnx-versal-power.h"
+
+#define PM_DEV_USB_1				(0x182240D7U)
+#define PM_DEV_FPD_SWDT_0			(0x182240DBU)
+#define PM_DEV_FPD_SWDT_1			(0x182240DCU)
+#define PM_DEV_FPD_SWDT_2			(0x182240DDU)
+#define PM_DEV_FPD_SWDT_3			(0x182240DEU)
+#define PM_DEV_TCM_A_0A				(0x183180CBU)
+#define PM_DEV_TCM_A_0B				(0x183180CCU)
+#define PM_DEV_TCM_A_0C				(0x183180CDU)
+#define PM_DEV_RPU_A_0				(0x181100BFU)
+#define PM_DEV_LPD_SWDT_0			(0x182240D9U)
+#define PM_DEV_LPD_SWDT_1			(0x182240DAU)
+
+/* Remove Versal specific node IDs */
+#undef PM_DEV_RPU0_0
+#undef PM_DEV_RPU0_1
+#undef PM_DEV_OCM_0
+#undef PM_DEV_OCM_1
+#undef PM_DEV_OCM_2
+#undef PM_DEV_OCM_3
+#undef PM_DEV_TCM_0_A
+#undef PM_DEV_TCM_1_A
+#undef PM_DEV_TCM_0_B
+#undef PM_DEV_TCM_1_B
+#undef PM_DEV_SWDT_FPD
+#undef PM_DEV_AI
+
+#endif
diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
new file mode 100644
index 000000000000..b26ad78f6dc8
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022, Xilinx, Inc.
+ * Copyright (C) 2022, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _DT_BINDINGS_VERSAL_NET_RESETS_H
+#define _DT_BINDINGS_VERSAL_NET_RESETS_H
+
+#include "xlnx-versal-resets.h"
+
+#define VERSAL_RST_USB_1			(0xC1040C6U)
+
+/* Remove Versal specific reset IDs */
+#undef VERSAL_RST_ACPU_0_POR
+#undef VERSAL_RST_ACPU_1_POR
+#undef VERSAL_RST_OCM2_POR
+#undef VERSAL_RST_APU
+#undef VERSAL_RST_ACPU_0
+#undef VERSAL_RST_ACPU_1
+#undef VERSAL_RST_ACPU_L2
+#undef VERSAL_RST_RPU_ISLAND
+#undef VERSAL_RST_RPU_AMBA
+#undef VERSAL_RST_R5_0
+#undef VERSAL_RST_R5_1
+#undef VERSAL_RST_OCM2_RST
+#undef VERSAL_RST_I2C_PMC
+#undef VERSAL_RST_I2C_0
+#undef VERSAL_RST_I2C_1
+#undef VERSAL_RST_SWDT_FPD
+#undef VERSAL_RST_SWDT_LPD
+#undef VERSAL_RST_USB
+#undef VERSAL_RST_DPC
+#undef VERSAL_RST_DBG_TRACE
+#undef VERSAL_RST_DBG_TSTMP
+#undef VERSAL_RST_RPU0_DBG
+#undef VERSAL_RST_RPU1_DBG
+#undef VERSAL_RST_HSDP
+#undef VERSAL_RST_CPMDBG
+#undef VERSAL_RST_PCIE_CFG
+#undef VERSAL_RST_PCIE_CORE0
+#undef VERSAL_RST_PCIE_CORE1
+#undef VERSAL_RST_PCIE_DMA
+#undef VERSAL_RST_L2_0
+#undef VERSAL_RST_L2_1
+#undef VERSAL_RST_ADDR_REMAP
+#undef VERSAL_RST_CPI0
+#undef VERSAL_RST_CPI1
+#undef VERSAL_RST_XRAM
+#undef VERSAL_RST_AIE_ARRAY
+#undef VERSAL_RST_AIE_SHIM
+
+#endif
diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-power.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
new file mode 100644
index 000000000000..7db3969a4277
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (C) 2019 - 2021 Xilinx, Inc.
+ */
+
+#ifndef _DT_BINDINGS_VERSAL_POWER_H
+#define _DT_BINDINGS_VERSAL_POWER_H
+
+#define PM_DEV_RPU0_0				(0x18110005U)
+#define PM_DEV_RPU0_1				(0x18110006U)
+#define PM_DEV_OCM_0				(0x18314007U)
+#define PM_DEV_OCM_1				(0x18314008U)
+#define PM_DEV_OCM_2				(0x18314009U)
+#define PM_DEV_OCM_3				(0x1831400aU)
+#define PM_DEV_TCM_0_A				(0x1831800bU)
+#define PM_DEV_TCM_0_B				(0x1831800cU)
+#define PM_DEV_TCM_1_A				(0x1831800dU)
+#define PM_DEV_TCM_1_B				(0x1831800eU)
+#define PM_DEV_USB_0				(0x18224018U)
+#define PM_DEV_GEM_0				(0x18224019U)
+#define PM_DEV_GEM_1				(0x1822401aU)
+#define PM_DEV_SPI_0				(0x1822401bU)
+#define PM_DEV_SPI_1				(0x1822401cU)
+#define PM_DEV_I2C_0				(0x1822401dU)
+#define PM_DEV_I2C_1				(0x1822401eU)
+#define PM_DEV_CAN_FD_0				(0x1822401fU)
+#define PM_DEV_CAN_FD_1				(0x18224020U)
+#define PM_DEV_UART_0				(0x18224021U)
+#define PM_DEV_UART_1				(0x18224022U)
+#define PM_DEV_GPIO				(0x18224023U)
+#define PM_DEV_TTC_0				(0x18224024U)
+#define PM_DEV_TTC_1				(0x18224025U)
+#define PM_DEV_TTC_2				(0x18224026U)
+#define PM_DEV_TTC_3				(0x18224027U)
+#define PM_DEV_SWDT_LPD				(0x18224028U)
+#define PM_DEV_SWDT_FPD				(0x18224029U)
+#define PM_DEV_OSPI				(0x1822402aU)
+#define PM_DEV_QSPI				(0x1822402bU)
+#define PM_DEV_GPIO_PMC				(0x1822402cU)
+#define PM_DEV_I2C_PMC				(0x1822402dU)
+#define PM_DEV_SDIO_0				(0x1822402eU)
+#define PM_DEV_SDIO_1				(0x1822402fU)
+#define PM_DEV_RTC				(0x18224034U)
+#define PM_DEV_ADMA_0				(0x18224035U)
+#define PM_DEV_ADMA_1				(0x18224036U)
+#define PM_DEV_ADMA_2				(0x18224037U)
+#define PM_DEV_ADMA_3				(0x18224038U)
+#define PM_DEV_ADMA_4				(0x18224039U)
+#define PM_DEV_ADMA_5				(0x1822403aU)
+#define PM_DEV_ADMA_6				(0x1822403bU)
+#define PM_DEV_ADMA_7				(0x1822403cU)
+#define PM_DEV_AI				(0x18224072U)
+
+#endif
diff --git a/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
new file mode 100644
index 000000000000..895424e9b0e5
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (C) 2020 Xilinx, Inc.
+ */
+
+#ifndef _DT_BINDINGS_VERSAL_RESETS_H
+#define _DT_BINDINGS_VERSAL_RESETS_H
+
+#define VERSAL_RST_PMC_POR			(0xc30c001U)
+#define VERSAL_RST_PMC				(0xc410002U)
+#define VERSAL_RST_PS_POR			(0xc30c003U)
+#define VERSAL_RST_PL_POR			(0xc30c004U)
+#define VERSAL_RST_NOC_POR			(0xc30c005U)
+#define VERSAL_RST_FPD_POR			(0xc30c006U)
+#define VERSAL_RST_ACPU_0_POR			(0xc30c007U)
+#define VERSAL_RST_ACPU_1_POR			(0xc30c008U)
+#define VERSAL_RST_OCM2_POR			(0xc30c009U)
+#define VERSAL_RST_PS_SRST			(0xc41000aU)
+#define VERSAL_RST_PL_SRST			(0xc41000bU)
+#define VERSAL_RST_NOC				(0xc41000cU)
+#define VERSAL_RST_NPI				(0xc41000dU)
+#define VERSAL_RST_SYS_RST_1			(0xc41000eU)
+#define VERSAL_RST_SYS_RST_2			(0xc41000fU)
+#define VERSAL_RST_SYS_RST_3			(0xc410010U)
+#define VERSAL_RST_FPD				(0xc410011U)
+#define VERSAL_RST_PL0				(0xc410012U)
+#define VERSAL_RST_PL1				(0xc410013U)
+#define VERSAL_RST_PL2				(0xc410014U)
+#define VERSAL_RST_PL3				(0xc410015U)
+#define VERSAL_RST_APU				(0xc410016U)
+#define VERSAL_RST_ACPU_0			(0xc410017U)
+#define VERSAL_RST_ACPU_1			(0xc410018U)
+#define VERSAL_RST_ACPU_L2			(0xc410019U)
+#define VERSAL_RST_ACPU_GIC			(0xc41001aU)
+#define VERSAL_RST_RPU_ISLAND			(0xc41001bU)
+#define VERSAL_RST_RPU_AMBA			(0xc41001cU)
+#define VERSAL_RST_R5_0				(0xc41001dU)
+#define VERSAL_RST_R5_1				(0xc41001eU)
+#define VERSAL_RST_SYSMON_PMC_SEQ_RST		(0xc41001fU)
+#define VERSAL_RST_SYSMON_PMC_CFG_RST		(0xc410020U)
+#define VERSAL_RST_SYSMON_FPD_CFG_RST		(0xc410021U)
+#define VERSAL_RST_SYSMON_FPD_SEQ_RST		(0xc410022U)
+#define VERSAL_RST_SYSMON_LPD			(0xc410023U)
+#define VERSAL_RST_PDMA_RST1			(0xc410024U)
+#define VERSAL_RST_PDMA_RST0			(0xc410025U)
+#define VERSAL_RST_ADMA				(0xc410026U)
+#define VERSAL_RST_TIMESTAMP			(0xc410027U)
+#define VERSAL_RST_OCM				(0xc410028U)
+#define VERSAL_RST_OCM2_RST			(0xc410029U)
+#define VERSAL_RST_IPI				(0xc41002aU)
+#define VERSAL_RST_SBI				(0xc41002bU)
+#define VERSAL_RST_LPD				(0xc41002cU)
+#define VERSAL_RST_QSPI				(0xc10402dU)
+#define VERSAL_RST_OSPI				(0xc10402eU)
+#define VERSAL_RST_SDIO_0			(0xc10402fU)
+#define VERSAL_RST_SDIO_1			(0xc104030U)
+#define VERSAL_RST_I2C_PMC			(0xc104031U)
+#define VERSAL_RST_GPIO_PMC			(0xc104032U)
+#define VERSAL_RST_GEM_0			(0xc104033U)
+#define VERSAL_RST_GEM_1			(0xc104034U)
+#define VERSAL_RST_SPARE			(0xc104035U)
+#define VERSAL_RST_USB_0			(0xc104036U)
+#define VERSAL_RST_UART_0			(0xc104037U)
+#define VERSAL_RST_UART_1			(0xc104038U)
+#define VERSAL_RST_SPI_0			(0xc104039U)
+#define VERSAL_RST_SPI_1			(0xc10403aU)
+#define VERSAL_RST_CAN_FD_0			(0xc10403bU)
+#define VERSAL_RST_CAN_FD_1			(0xc10403cU)
+#define VERSAL_RST_I2C_0			(0xc10403dU)
+#define VERSAL_RST_I2C_1			(0xc10403eU)
+#define VERSAL_RST_GPIO_LPD			(0xc10403fU)
+#define VERSAL_RST_TTC_0			(0xc104040U)
+#define VERSAL_RST_TTC_1			(0xc104041U)
+#define VERSAL_RST_TTC_2			(0xc104042U)
+#define VERSAL_RST_TTC_3			(0xc104043U)
+#define VERSAL_RST_SWDT_FPD			(0xc104044U)
+#define VERSAL_RST_SWDT_LPD			(0xc104045U)
+#define VERSAL_RST_USB				(0xc104046U)
+#define VERSAL_RST_DPC				(0xc208047U)
+#define VERSAL_RST_PMCDBG			(0xc208048U)
+#define VERSAL_RST_DBG_TRACE			(0xc208049U)
+#define VERSAL_RST_DBG_FPD			(0xc20804aU)
+#define VERSAL_RST_DBG_TSTMP			(0xc20804bU)
+#define VERSAL_RST_RPU0_DBG			(0xc20804cU)
+#define VERSAL_RST_RPU1_DBG			(0xc20804dU)
+#define VERSAL_RST_HSDP				(0xc20804eU)
+#define VERSAL_RST_DBG_LPD			(0xc20804fU)
+#define VERSAL_RST_CPM_POR			(0xc30c050U)
+#define VERSAL_RST_CPM				(0xc410051U)
+#define VERSAL_RST_CPMDBG			(0xc208052U)
+#define VERSAL_RST_PCIE_CFG			(0xc410053U)
+#define VERSAL_RST_PCIE_CORE0			(0xc410054U)
+#define VERSAL_RST_PCIE_CORE1			(0xc410055U)
+#define VERSAL_RST_PCIE_DMA			(0xc410056U)
+#define VERSAL_RST_CMN				(0xc410057U)
+#define VERSAL_RST_L2_0				(0xc410058U)
+#define VERSAL_RST_L2_1				(0xc410059U)
+#define VERSAL_RST_ADDR_REMAP			(0xc41005aU)
+#define VERSAL_RST_CPI0				(0xc41005bU)
+#define VERSAL_RST_CPI1				(0xc41005cU)
+#define VERSAL_RST_XRAM				(0xc30c05dU)
+#define VERSAL_RST_AIE_ARRAY			(0xc10405eU)
+#define VERSAL_RST_AIE_SHIM			(0xc10405fU)
+
+#endif
-- 
2.43.0


