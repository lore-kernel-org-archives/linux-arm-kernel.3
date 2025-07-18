Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC54CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 11:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FRRGi/xM1mO5oVMzhKO7Kt4lzmCe9snMZQ/wiaZCfU=; b=NWXJMPsUzAS2Ds1LIbMEpdaixN
	tAiexHjYcsIvBmqUwXEbHsF2pv6AKy5VmA/Q7sy7+YH5/Psp03hz5ufk54BKLkU6k0bu+BngBFOLZ
	YQZRq2ryl6gomzyTH60v6U1jBh2pbN9/P0Z3IEPaXZtaTkY6oToz2d0vYGbRUUMcfpIwXYvCwX70Z
	jVu1yWXshOfQceRSrZBt2Fvh1MEd1QOM4u1WSMNKkvfYdW2kf4iC5mXE8Iw0rPDF6oAK+LLuW9FRT
	8KsEGKnFlxVo+CKVG5sGBklYfK5MlyPBJtqujvOQMblxU81BwBpkC1PgfCCrDhKRcEQCG4I44vYxE
	PTMkxGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjCf-0000000CQTf-1p7a;
	Fri, 18 Jul 2025 11:24:37 +0000
Received: from mail-dm6nam11on20627.outbound.protection.outlook.com ([2a01:111:f403:2415::627] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucibH-0000000CL0F-26V5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 10:46:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRUtivAlAKWs3Z59RFAv0+qJA7yqSBragrsnoNUPXuOC7LiO7K9JWHMf9qhNS2s1VJtef1KlBtBgrFwA5ne3dEdQRp1t34v/+6ibw3xsU4iIY2VctT47s1yfpsr0YIZL3N90UsMz+qQnft0PXw4pAEw0gGmdn/juaV5QFSUVzr17mcDimKpSLwCLG8y1p9tPEAYOAsmrFgCUY5vDpbnfv+H47golo6fWTIv78SP7Lw6r6+MGmRrl20sTWHLZiv7xs8wA+9sNT9bGpQHLui37YqF6l8HixkK0cHOrK1XA3ygUp8NVT6P/MZ/4kXRfuoPi+wcX+hhyC2u0lBYEYmaeMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FRRGi/xM1mO5oVMzhKO7Kt4lzmCe9snMZQ/wiaZCfU=;
 b=OFz5CZgCYoyybxbICT2EK1LKgl5Sz+Km2KObxPx1R3yaKTWkRTIMuxDylHeVr7pIXeszsaOsnIuy2491M/U/3OtpdOXs/dgi7pY+eu+OBJ5sKquRvoTBTGC2BeKfzqY9It+D0D+BQsmk2O3kp45Q+655DLw9ivYpft8aXWSxm5qL55p6S7zF+2VPYpNZFJvPugE7HiJwdCwMaRk+Gaemp59LLw/q+qd0IRu0u9mntAjS40ufbTn3gYFa+NF/JuMCAc9WjOrq5HgzRXZjNzGVQCUk2HGRl756H9B4jOkHCKUnQTlAHyvVwUGcc4NOA1t6Tj5rYnysEeaAqRQ5e8Mc2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FRRGi/xM1mO5oVMzhKO7Kt4lzmCe9snMZQ/wiaZCfU=;
 b=wKBFVKdakPypehR6H9T0RMouoAqfXCFLfA3RHLVkbYJnkWMxi6LTw1xzdXABvJ3w2iENfQ1dLfleej2lt8sdVsv2wtMo4nz+xr1omRav1kecs/2LaPigxEq1WqMkNYDuqdfnVp8jTMV8dYx6jEGBr/AjkVbDc4xUYLlb0g7hr14=
Received: from CH0PR04CA0086.namprd04.prod.outlook.com (2603:10b6:610:74::31)
 by SJ5PPF4D350AC80.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::993) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 18 Jul
 2025 10:45:53 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::33) by CH0PR04CA0086.outlook.office365.com
 (2603:10b6:610:74::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 10:45:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 10:45:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Jul
 2025 05:45:50 -0500
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Jul 2025 05:45:50 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Rohit Visavalia <rohit.visavalia@amd.com>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 7/7] arm64: zynqmp: Enable DP for zcu100, zcu102, zcu104, zcu111
Date: Fri, 18 Jul 2025 12:45:12 +0200
Message-ID: <0ac8df0c942ed9068e0b60a840fee6b9f7df2293.1752835502.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752835501.git.michal.simek@amd.com>
References: <cover.1752835501.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4608; i=michal.simek@amd.com; h=from:subject:message-id; bh=jyMvlXoDIpLHyFB6zsnug6Un9bdzJMUf/3BsBmtH9O8=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRUqe7ep7tGnOtnRrj8lHMZ1ildu1X3+zdPPnz7e8Tlz R3fypwvdZSyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBELOcxMnwXFp+nd0LacO+k p/ySVc/u31g8481V53l7wt828ywUusPN8E/lt8nz5piXT75f/cdeFRJm2Ga+8IXliRW+a7/2Tt9 +XoURAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|SJ5PPF4D350AC80:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f33675e-207e-4d2d-144d-08ddc5e84487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kGwUilBCiNUvdqN1rlrYYtWu3SrY2LDsNCQmAlyhuolyiw6SVMqiB3cM2GJP?=
 =?us-ascii?Q?aTR4oe+heazDX5OyE3IbTnMGeNsChRWFIDK7Kp9DIjusW4WP0YCOpo5baZm6?=
 =?us-ascii?Q?JrLeW+inxFig7deBxbPtFzMudcteY5KDoe5UTD4mihfAZorHztTmZGgARKm6?=
 =?us-ascii?Q?aZ+yNL9+Yvs7sDYHnXfCQmJ7BCipdY8utBZyTHz4fAeUm544c2kZSYNrhq3t?=
 =?us-ascii?Q?bLZzVyKHUq2k55ekI8cYnR+knHCMSAnpzl/ENbqW0rSHGhX6W16jQsbsbca3?=
 =?us-ascii?Q?PucYkMT9iteZe2nvcHiCR9zNyMPdOZH8CpVyqV+7O2swuh/dp/W1LI/HAASa?=
 =?us-ascii?Q?1Gzms3U9fG6owLpMkDfmw6NG/iFrT4hURSBSmHVBHN66mGnlMCOQbW4Njmv+?=
 =?us-ascii?Q?WI++F2DfKZCbsG+9i/aUWOZ2C1Av1XOEaPJIEbzoRsfPjGbigCO7UxfrKgxN?=
 =?us-ascii?Q?IyLrfMTf1p3o0rqcauKfXxOZfDOFPeLV1OQk0wg1uyKjYp8a5cp/QgKG8nCL?=
 =?us-ascii?Q?4ky7QPtBbQqxqcMDdWVnWPH+DDQM9vI4PObQJ6DRGJEXl0Rze9FWLfpfNi5s?=
 =?us-ascii?Q?tkGLybzE8SrvJoHJBCFu7pREKUvuzUESl6zhO0yll0ycdXTyPaPd+XYqfByJ?=
 =?us-ascii?Q?+mrhYxP2T06sRgWIZOGXTkwghGgCxV0Y8hL9+RcxN70rGA4u4akgEVsgST+L?=
 =?us-ascii?Q?r/IGC4/mvK6BdcYetkquAmS8Lb9DZDdixA9Tf0jFNP7jYqpsPHbdddEaLUvt?=
 =?us-ascii?Q?ZwL9V3Q5VweBaHvFyKtmmpy512mASKYdzMQibYN2l0UCLNi23nTvViyljwDQ?=
 =?us-ascii?Q?qhk3JPfZjBOm4zM8WHkqZeMc/4zGX++pbAhdb7uEKRRE6Cgz+sBlysjzsDaC?=
 =?us-ascii?Q?L/SZ8LaEE5ft9MGmnM9YYJ8RHRG2W/UiHHRG0KZsADBp5yoUAQw0zmthWKf3?=
 =?us-ascii?Q?3AOFg77lGg9A2BOWax/UfNJQyp8WR9kGCs3D3akWn9vZGhCirEQTREBz/Tgp?=
 =?us-ascii?Q?qndhPQB+hX0SQaOOL86B2pRkSQGey1B9dvfVfHXxwFU6NLwjHA2fpgTc92Or?=
 =?us-ascii?Q?gvDsLplkcLidqqhb4VnXsUVXHGkB6nADOA6UVjTUzi+FCDHYFonJZZizHVYw?=
 =?us-ascii?Q?BC1YFwjenA3Mk3Bh6UZkPHDxwsQuUUlS5BTdTBr/VVRJSsdE5RXdT01taFSQ?=
 =?us-ascii?Q?0BQ4IeIR/79rB2ZI8G290EBbzDoJm+wpmHTUR07ZbiSpXIzIgnU70lMrrXyr?=
 =?us-ascii?Q?jwVPfl3kcztuLb1XJWcl8n3Fd61wBjFs9IXm2YVFDuI4Gj258bUsQ4aFNe/y?=
 =?us-ascii?Q?Qn65QFHd2ujLB2d4wSjeFy/ABVlcX/mywe/1avNFmVXE0Txd3cpHoNtOgxpo?=
 =?us-ascii?Q?TVDZxcigtZBaGAO0ia1twuWQNOTaGigK3pLmOx1wQhzyz1xrLfcKrqJPaQdK?=
 =?us-ascii?Q?YQAYQeF/QV/MtQ33biVqL2wM/stkcjBP65DHu6CAKm+l7TE5vRd4ao4+/4R3?=
 =?us-ascii?Q?Z1ce9DzFn9EmwBfzX/8BSWZVgckRgxgJY6Ou?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 10:45:52.8736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f33675e-207e-4d2d-144d-08ddc5e84487
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4D350AC80
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_034559_545900_00C72F5C 
X-CRM114-Status: GOOD (  10.51  )
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

From: Rohit Visavalia <rohit.visavalia@amd.com>

Upstream DP DT binding enforcing dp-connector and port description to
operate properly.

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 .../boot/dts/xilinx/zynqmp-zcu100-revC.dts     | 18 ++++++++++++++++++
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts     | 18 ++++++++++++++++++
 .../boot/dts/xilinx/zynqmp-zcu104-revA.dts     | 18 ++++++++++++++++++
 .../boot/dts/xilinx/zynqmp-zcu104-revC.dts     | 18 ++++++++++++++++++
 .../boot/dts/xilinx/zynqmp-zcu111-revA.dts     | 18 ++++++++++++++++++
 5 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
index 3542844e6977..4ec8a400494e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dts
@@ -134,6 +134,18 @@ si5335_1: si5335-1 { /* clk1_dp - u23 */
 		#clock-cells = <0>;
 		clock-frequency = <27000000>;
 	};
+
+	dpcon {
+		compatible = "dp-connector";
+		label = "P11";
+		type = "full-size";
+
+		port {
+			dpcon_in: endpoint {
+				remote-endpoint = <&dpsub_dp_out>;
+			};
+		};
+	};
 };
 
 &dcc {
@@ -607,3 +619,9 @@ &zynqmp_dpsub {
 	phys = <&psgtr 1 PHY_TYPE_DP 0 1>,
 	       <&psgtr 0 PHY_TYPE_DP 1 1>;
 };
+
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
index 7e26489a1539..e172a30e7b21 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts
@@ -151,6 +151,18 @@ refhdmi: refhdmi {
 		#clock-cells = <0>;
 		clock-frequency = <114285000>;
 	};
+
+	dpcon {
+		compatible = "dp-connector";
+		label = "P11";
+		type = "full-size";
+
+		port {
+			dpcon_in: endpoint {
+				remote-endpoint = <&dpsub_dp_out>;
+			};
+		};
+	};
 };
 
 &can1 {
@@ -1045,3 +1057,9 @@ &zynqmp_dpsub {
 	phy-names = "dp-phy0";
 	phys = <&psgtr 1 PHY_TYPE_DP 0 3>;
 };
+
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
index eb2090673ec1..fe8f151ed706 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dts
@@ -60,6 +60,18 @@ clock_8t49n287_3: clk27 {
 		#clock-cells = <0>;
 		clock-frequency = <27000000>;
 	};
+
+	dpcon {
+		compatible = "dp-connector";
+		label = "P11";
+		type = "full-size";
+
+		port {
+			dpcon_in: endpoint {
+				remote-endpoint = <&dpsub_dp_out>;
+			};
+		};
+	};
 };
 
 &can1 {
@@ -529,3 +541,9 @@ &zynqmp_dpsub {
 	phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
 	       <&psgtr 0 PHY_TYPE_DP 1 3>;
 };
+
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
index 4694d0a841f1..3ee8ab224722 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dts
@@ -65,6 +65,18 @@ clock_8t49n287_3: clk27 {
 		#clock-cells = <0>;
 		clock-frequency = <27000000>;
 	};
+
+	dpcon {
+		compatible = "dp-connector";
+		label = "P11";
+		type = "full-size";
+
+		port {
+			dpcon_in: endpoint {
+				remote-endpoint = <&dpsub_dp_out>;
+			};
+		};
+	};
 };
 
 &can1 {
@@ -541,3 +553,9 @@ &zynqmp_dpsub {
 	phys = <&psgtr 1 PHY_TYPE_DP 0 3>,
 	       <&psgtr 0 PHY_TYPE_DP 1 3>;
 };
+
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
index a0cddaa64424..428b5558fbba 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dts
@@ -129,6 +129,18 @@ ref48: ref48M {
 		#clock-cells = <0>;
 		clock-frequency = <48000000>;
 	};
+
+	dpcon {
+		compatible = "dp-connector";
+		label = "P11";
+		type = "full-size";
+
+		port {
+			dpcon_in: endpoint {
+				remote-endpoint = <&dpsub_dp_out>;
+			};
+		};
+	};
 };
 
 &dcc {
@@ -864,3 +876,9 @@ &zynqmp_dpsub {
 	phys = <&psgtr 1 PHY_TYPE_DP 0 1>,
 	       <&psgtr 0 PHY_TYPE_DP 1 1>;
 };
+
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
-- 
2.43.0


