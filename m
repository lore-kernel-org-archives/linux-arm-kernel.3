Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69EFF3D311
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIGOnwHy33glwtsrC+oPbG/spYHZKFo/D7H9UgDqhfU=; b=UxIKSkf788lDTa5Qraa2OwtpEb
	sylWXsZIuYQsttEKUEknLtYVIfrePd9E3wdiawV64sCczAvC6CHqcYp5KIiTXOzKuI7+CR791IjIj
	kymUiZGKg2uFlmovbOWp4jVaS2GdaEjI9G9HRNJZGVhaZ1bo43LL6lSnmNg64wnhQbBmmXtcA+9Xq
	jelu9S+tOxz8nqbTFo+mx+v/Mlajvmb3N1GcggnT8AN/ZPgWvCN/UMTI2Hmj/jFcNbCIYGi2iFxgh
	I2hh7GKxVEH8ntVTw2KGTjX1MUWh4H2PX09632lwnISk7YAZ97Q9qwS65wD/uXIiYF4Us1vSvupRQ
	4AnbpbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAoO-000000028u4-21uv;
	Thu, 05 Mar 2026 15:40:28 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAoH-000000028sV-2DSP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:40:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9N19SpGXQlGW1vdrhTkRq78fX2TUdiK6uY67qcTYByrfXuykwRVAdt+6WmVY5D0VJZRNMnCi0Dr0QNU++TW0JWvZcV0SBS5WltsJj7HK3uMyTSQeEZhh0TdLDabNXdR5XOhJYtTQ1UiEzcJm7YXMpfnHtMyAJGsNNh8IhsQCSEwnHq010OaXnSDTIUPfTO2T/0K8HfIDbGa3Eu8pcyDahPssGm5DgqynJpu3AFD2m6HKuXeor+snAiAR1J6gF0TU3R4bWVsFQrwBrklBqVsV83JRUPbJpOa8lxktrrwlvEiIjtTcZMgsnxtm+t5orhbv9JdDwTQP5l9bzfRmL84Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fIGOnwHy33glwtsrC+oPbG/spYHZKFo/D7H9UgDqhfU=;
 b=a18h3VapCo3X7HkM2F8NK6HTFlChuFK7z6kwAJKYEtOsv9cdgPVtnf2oK4JwVm51j7KU321XfS87uFZKWUINUOR9mucJKABmEAJ1tEFlVtO1bs6cBBA+kuDi1/jJlmPOVcb8sA8fPUCtb8wQt3F8gGGXKBHFXWV4Mxw9weiHMgR9ZbE5CGUmjs0IYMaestBMBTzcQUR+VZxz5i5xAKyIDR4daaKDUYFO5K2Pe1pCy0BTAyryNQ3kLIfd5AsIpS2UqnPbHwzB5GkT6N/dyRca59CZMTXKl4N3FbHoSA3i8A+V7zer5dGyhpuZmuL0bNlD3N1bK9qP+9KAyljVvDfyQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIGOnwHy33glwtsrC+oPbG/spYHZKFo/D7H9UgDqhfU=;
 b=rJF8nraaXFUxAPmL4LjyaGRwzHg5YUpg7WciM2NlDE0K55PfGFHDaqa7i+pRof7VLFP7YwfRBaNaHF82dhWgVrAhweZLUUOo77dxH8NW679xeFu6eI5UUx9pcRxLZR1vJRY2AtSijz+XYaR7wnuVMjmI57PsylRR717csNLUi10=
Received: from BYAPR08CA0067.namprd08.prod.outlook.com (2603:10b6:a03:117::44)
 by DM6PR12MB4372.namprd12.prod.outlook.com (2603:10b6:5:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:40:15 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:117:cafe::c0) by BYAPR08CA0067.outlook.office365.com
 (2603:10b6:a03:117::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 5 Mar 2026 15:40:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 15:40:14 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 09:40:10 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 07:40:09 -0800
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Mar 2026 09:40:09 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] arm64: zynqmp: Switch Versal NET to firmware clock interface
Date: Thu, 5 Mar 2026 16:39:50 +0100
Message-ID: <78c6e51f0a648b42dffa4d23778b0c1caf4a5f68.1772725183.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772725183.git.michal.simek@amd.com>
References: <cover.1772725183.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=26708; i=michal.simek@amd.com; h=from:subject:message-id; bh=HDNwomu1WuG6nraAlOcTUw/sPR625s0RK/dilbjJpjE=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWSuXHw6pWynlPmtqa9WazrwfsnxEIh7kP3ZR2P6tMOKr RN8NJMndJSyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEshcyMixYkOLS0sB+Y8XG 7ICdKxez3xY9LGm7gv9Mrd7MT9beP/cwMizrLxRr9VSxVf775QGDh83rBpftm8V2nLXSnPYmbdr PWywA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DM6PR12MB4372:EE_
X-MS-Office365-Filtering-Correlation-Id: 6897697c-7586-48fd-df51-08de7acd7ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016;
X-Microsoft-Antispam-Message-Info: bKhOeFaaqLmcEc7VndT7eCbvL5kN4+V9hfI6YQfM7GOry1DV9JO8lHJ1nUQXTd6GPpjIa6qj/+nIzTR/ezd1knkZFhHUPzaujD+bgNoNO896u65AIh49ofZzVCdY/pDTrfeWWbdxXihqjlZ9/IJ0dEAHTofC2EWH2vhEc+rIA91TxKiSxJe+QXygfzn9sdG8sK+iQD9xjVAXzfJ33ujTF4CMuGkoqwzNBlC4KetDjs0nVH68Yg1klZKdBtUr6LEdSoEzpaWKrViKZzjUVbEApmRcb/7H0xGhmXMGJWlGRVnnQzAPXcnUEf3zqiHwmQNLCJ+Ue2QGwlmbStFY4BVGE5PsNBgpRv/qfkuEJKqfeR269VBno2IlUyZvaBDTrHGesaIkkxHYZ0PmHnFX62E2yWHAbMgI6CN+czOi3mToIxZxjQeEbknwownLSSvx6A0Lg6IMJhac7dLRcOK+xyJ3Fc80/y7TZS7BK8IkJe8DXeb75qaKUbvycFdfiYcdfafseI39Nfc8pFdckMxwQvyc0LNGCnBDIDI4A7bQ0SZNm2NRplm8RjU36Dct9lVE1H1uw5Mmnm0deH2ElukvNzNmiKffdaNvYXHX9+0htVNoxTv1CQ6emMVc1uEAdISlH0DE4KB/veGsXNaC4IYo61/KJzSRzvSVm/NELptl/tBgqIsExBtZsnja3gILUafhDOVDQYuU7pHgb0RYyJbBF0Y6g1/zbMsnnB+PQac/2iCeBXDfB9FJ17uXg90Js0J5B+RpVrgUQCLM13N8yAs0hJuO+w==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UAHH/fCjbnTxvpxnl1Ruk7Q8Ppb+7Dwj8jnNPgil1DLDu/iZ1PJlxIiEaE3CRBbZuGl2AvUF4ZY4GZFZCcGuZmECUiLZrPlTYIA2eTZXQTmWUiAET8l9d0ju00VUpUXv16VBWmIxfeAjNHxOUMYr8rFF0PX2B68r/JjdMivJJmqVw/Fi8rzAUPfMT3AdUIpRL6EyNxQBigq775z+g4nLiXiVGLJowjKE5pF7Ahw9/2AYyd6I7Tk2rPL6MjQy1j/NYm53J+GUKMNIFanb9y3ggRBc8cQ3IEfFRcqQ/S9mErn1VN8Jixzx7v4va1Vy9At32OUgWyBV55Ue0mApkCIXkp75AbgdHTD1e1xsJ6kwGnvhfJcyJVPblYLuYgL9G6iG+Lt8qshymkyC9uEHVU1w6aE1ahE49wrXCNgTfaYYZ7VmxzkN4X4HfxniPZ8RffLi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:40:14.9374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6897697c-7586-48fd-df51-08de7acd7ef5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4372
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_074023_353164_6718651E 
X-CRM114-Status: GOOD (  15.17  )
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

 .../boot/dts/xilinx/versal-net-clk-ccf.dtsi   | 378 ++++++++++++++++++
 .../xilinx/versal-net-vn-x-b2197-01-revA.dts  |   3 +-
 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h  | 123 ++++++
 .../boot/dts/xilinx/xlnx-versal-net-clk.h     |  78 ++++
 .../boot/dts/xilinx/xlnx-versal-net-power.h   |  38 ++
 .../boot/dts/xilinx/xlnx-versal-net-resets.h  |  53 +++
 .../arm64/boot/dts/xilinx/xlnx-versal-power.h |  54 +++
 .../boot/dts/xilinx/xlnx-versal-resets.h      | 105 +++++
 8 files changed, 831 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/xilinx/versal-net-clk-ccf.dtsi
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-clk.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-net-resets.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-power.h
 create mode 100644 arch/arm64/boot/dts/xilinx/xlnx-versal-resets.h

diff --git a/arch/arm64/boot/dts/xilinx/versal-net-clk-ccf.dtsi b/arch/arm64/boot/dts/xilinx/versal-net-clk-ccf.dtsi
new file mode 100644
index 000000000000..1b8c7bbbcf5c
--- /dev/null
+++ b/arch/arm64/boot/dts/xilinx/versal-net-clk-ccf.dtsi
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for Xilinx Versal with PM
+ *
+ * Copyright (C) 2022, Xilinx, Inc.
+ * Copyright (C) 2022 - 2025, Advanced Micro Devices, Inc.
+ *
+ * Michal Simek <michal.simek@amd.com>
+ */
+
+#include "xlnx-versal-net-clk.h"
+#include "xlnx-versal-net-power.h"
+#include "xlnx-versal-net-resets.h"
+
+/ {
+	ref_clk: ref-clk {
+		bootph-all;
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <33333333>;
+		clock-output-names = "ref_clk";
+	};
+
+	rtc_clk: rtc-clk {
+		bootph-all;
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "rtc_clk";
+	};
+
+	can0_clk: can0-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&versal_net_clk CAN0_REF_2X>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "can0_clk";
+	};
+
+	can1_clk: can1-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-factor-clock";
+		clocks = <&versal_net_clk CAN1_REF_2X>;
+		clock-div = <2>;
+		clock-mult = <1>;
+		clock-output-names = "can1_clk";
+	};
+
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
+	};
+
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
+	};
+};
+
+&cpu0 {
+	clocks = <&versal_net_clk ACPU_0>;
+};
+
+&cpu100 {
+	clocks = <&versal_net_clk ACPU_0>;
+};
+
+&cpu200 {
+	clocks = <&versal_net_clk ACPU_0>;
+};
+
+&cpu300 {
+	clocks = <&versal_net_clk ACPU_0>;
+};
+
+&cpu10000 {
+	clocks = <&versal_net_clk ACPU_1>;
+};
+
+&cpu10100 {
+	clocks = <&versal_net_clk ACPU_1>;
+};
+
+&cpu10200 {
+	clocks = <&versal_net_clk ACPU_1>;
+};
+
+&cpu10300 {
+	clocks = <&versal_net_clk ACPU_1>;
+};
+
+&cpu20000 {
+	clocks = <&versal_net_clk ACPU_2>;
+};
+
+&cpu20100 {
+	clocks = <&versal_net_clk ACPU_2>;
+};
+
+&cpu20200 {
+	clocks = <&versal_net_clk ACPU_2>;
+};
+
+&cpu20300 {
+	clocks = <&versal_net_clk ACPU_2>;
+};
+
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
+};
+
+&can0 {
+	clocks = <&can0_clk>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_CAN_FD_0>;
+};
+
+&can1 {
+	clocks = <&can1_clk>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_CAN_FD_1>;
+};
+
+&gem0 {
+	clocks = <&versal_net_clk LPD_LSBUS>,
+		 <&versal_net_clk GEM0_REF>, <&versal_net_clk GEM0_TX>,
+		 <&versal_net_clk GEM0_RX>, <&versal_net_clk GEM_TSU>;
+	power-domains = <&versal_net_firmware PM_DEV_GEM_0>;
+};
+
+&gem1 {
+	clocks = <&versal_net_clk LPD_LSBUS>,
+		 <&versal_net_clk GEM1_REF>, <&versal_net_clk GEM1_TX>,
+		 <&versal_net_clk GEM1_RX>, <&versal_net_clk GEM_TSU>;
+	power-domains = <&versal_net_firmware PM_DEV_GEM_1>;
+};
+
+&gpio0 {
+	clocks = <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_GPIO>;
+};
+
+&gpio1 {
+	clocks = <&versal_net_clk PMC_LSBUS_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_GPIO_PMC>;
+};
+
+&i2c0 {
+	clocks = <&versal_net_clk I3C0_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_I2C_0>;
+};
+
+&i2c1 {
+	clocks = <&versal_net_clk I3C1_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_I2C_1>;
+};
+
+&i3c0 {
+	clocks = <&versal_net_clk I3C0_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_I2C_0>;
+};
+
+&i3c1 {
+	clocks = <&versal_net_clk I3C1_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_I2C_1>;
+};
+
+&adma0 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_0>;
+};
+
+&adma1 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_1>;
+};
+
+&adma2 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_2>;
+};
+
+&adma3 {
+	clocks = <&versal_net_clk ADMA>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_ADMA_3>;
+};
+
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
+};
+
+&serial0 {
+	clocks = <&versal_net_clk UART0_REF>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_UART_0>;
+};
+
+&serial1 {
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
+};
+
+&spi0 {
+	clocks = <&versal_net_clk SPI0_REF>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_SPI_0>;
+};
+
+&spi1 {
+	clocks = <&versal_net_clk SPI1_REF>, <&versal_net_clk LPD_LSBUS>;
+	power-domains = <&versal_net_firmware PM_DEV_SPI_1>;
+};
+
+&ttc0 {
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
+};
+
+&usb0 {
+	clocks = <&versal_net_clk USB0_BUS_REF>, <&versal_net_clk USB0_BUS_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_USB_0>;
+	resets = <&versal_net_reset VERSAL_RST_USB_0>;
+};
+
+&dwc3_0 {
+	clocks = <&versal_net_clk USB0_BUS_REF>;
+};
+
+&usb1 {
+	clocks = <&versal_net_clk USB1_BUS_REF>, <&versal_net_clk USB1_BUS_REF>;
+	power-domains = <&versal_net_firmware PM_DEV_USB_1>;
+	resets = <&versal_net_reset VERSAL_RST_USB_1>;
+};
+
+&dwc3_1 {
+	clocks = <&versal_net_clk USB1_BUS_REF>;
+};
+
+&wwdt0 {
+	clocks = <&versal_net_clk FPD_WWDT0>;
+	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_0>;
+};
+
+&wwdt1 {
+	clocks = <&versal_net_clk FPD_WWDT1>;
+	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_1>;
+};
+
+&wwdt2 {
+	clocks = <&versal_net_clk FPD_WWDT2>;
+	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_2>;
+};
+
+&wwdt3 {
+	clocks = <&versal_net_clk FPD_WWDT3>;
+	power-domains = <&versal_net_firmware PM_DEV_FPD_SWDT_3>;
+};
+
+&lpd_wwdt0 {
+	clocks = <&versal_net_clk LPD_WWDT0>;
+	power-domains = <&versal_net_firmware PM_DEV_LPD_SWDT_0>;
+};
+
+&lpd_wwdt1 {
+	clocks = <&versal_net_clk LPD_WWDT1>;
+	power-domains = <&versal_net_firmware PM_DEV_LPD_SWDT_1>;
+};
diff --git a/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts b/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
index 06b2301f48a0..322ef8f6340d 100644
--- a/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dts
@@ -11,8 +11,9 @@
 /dts-v1/;
 
 #include "versal-net.dtsi"
-#include "versal-net-clk.dtsi"
+#include "versal-net-clk-ccf.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include "xlnx-versal-net-power.h"
 
 / {
 	compatible = "xlnx,versal-net-vnx-revA", "xlnx,versal-net-vnx", "xlnx,versal-net";
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


