Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58635CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YO/zAsMmVNbgiwhXPJfja3Ox5Sfm1mn9GrVKI9xPg6Q=; b=s4s9LyfBJ08LaWozyE2OTyaZEc
	ck8kgt/CUYsxF7wNSBOMk8GSvjCFbehlQTg0Wu/2/DgcfghtuqVA/xWRjF6wTcaEqGiaIxl7crQEt
	6ZTPWoOMfCMLlh5C1naXZvN2GGjIIC55Qz+uK1cM4/cZHKCdxNygh1Hjn4hfIzZ4BARNq7a6m9SCa
	IZ25ymtpSoUJWWCqZUTbMSgTvTw9w4cn3ExQhze3caeQMkr9vppI7a7b1gaA5hG2lcViDhDwUzRQ3
	PJepxqtk4GrCPGCKZVH69Yad64HTSGylIGSBU2NpKbNG0qAfJnAIGh45DBpnDutFEPATFAyT7oXJp
	YD43O4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMB1-0000000FzH8-2qfe;
	Tue, 02 Sep 2025 08:15:39 +0000
Received: from mail-dm6nam11on2062f.outbound.protection.outlook.com ([2a01:111:f403:2415::62f] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLsn-0000000FrbO-1qC0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:56:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbs1EAPJ/vZtDWRyl1e4JL7K2/SwS392uxbIKWkNarTjOEovSFbHzuOSTg20OodOwYrA7vmN1u1PkHOaS9Qia2u6y4xJ6XcqUolGHX01sMAHnU2w5EmmiRhvlPc39CMkdhy/nmw3KmR2pW1WhvylzAlA6Vii/CQ5upVwRGNfhvD6FmgAHDS5w7/NmUjJNmuVSniCGUlntPuWT4wbdcgvqGc/I76GIHq/paEaOD1ri/PFc3/DYLaSBnVjeUE0KonWrQuqNjgXtaU+HYhDHDbHQqKzBgA0F+k4NczuD2N7slPq5RGBIB5zzjPc5KyuvgiOAMvItZXKZdmHzUagfgI7tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO/zAsMmVNbgiwhXPJfja3Ox5Sfm1mn9GrVKI9xPg6Q=;
 b=Ffqa9mJQrFDoWLghPIHuN4E76+NsqQptorKP4xTnrtpndzxaI8WvdR3gnExMdtJfs9WWYQ03ngaKXSkF+vsSpUVoQY2oRFpwh169C6myq8jNK4w1p/8H9/BZpHUaHyBSjf84Bl/xmtwzS8eo8wrj1Snv2MKLdfoS/9q0iIDu5/u/WS5Hnij260BeGpknHyBE7NeAhUDAwCFL00dmK5gQI7z54vLWaGUOr9Qxl8uvGXHrwsmH9Fgf1eYjXHfiVJic8r4Xo+I4hzLgj8MS0O9H1hTorimqXA5Hc4EU0YTbjZ1Np/goXJJMEx0WkP/QD7OoLTHfggizu6TZniNTbhjZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO/zAsMmVNbgiwhXPJfja3Ox5Sfm1mn9GrVKI9xPg6Q=;
 b=Udf6lWBFy20SsXyLpojHW98I0NPH8x2ktyU/WBOlbhOlCZW7d2poqExdwnPzWHHWD/zsdGM9Hro1wZx7afVGhbBG/lEeBlCNiS18oVwwVmN53Y5PZ5AhL/tDx/0iYMOI0XfDTivwdaQBTtRGMzGdx+6mkWHZGWPs6IN4OI2fFLM=
Received: from SA1P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::8)
 by BN3PR12MB9571.namprd12.prod.outlook.com (2603:10b6:408:2ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 07:56:43 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:22c:cafe::c6) by SA1P222CA0016.outlook.office365.com
 (2603:10b6:806:22c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.16 via Frontend Transport; Tue,
 2 Sep 2025 07:56:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 07:56:43 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Sep
 2025 02:56:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 2 Sep
 2025 00:56:41 -0700
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Sep 2025 02:56:41 -0500
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 4/4] arm64: zynqmp: Enable DP in kr260/kv260 revA
Date: Tue, 2 Sep 2025 09:56:21 +0200
Message-ID: <3160658ea2c4dd09a1d68918271177cf55437a8f.1756799774.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756799774.git.michal.simek@amd.com>
References: <cover.1756799774.git.michal.simek@amd.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145; i=michal.simek@amd.com; h=from:subject:message-id; bh=i5oQeAKSmfEj/B7YG3M7h9kT5VZIlKX5hM3kicyf2bA=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWRsW6zKOslV0eaBQKuY05JfwUcPTn21K2T+uyuSjGIF4 TWxv/d/6yhlYRDjYJAVU2SZzqTjsObbtaViyyPzYeawMoEMYeDiFICJPGhnZDjguot1wROLgvmW 14QOdrle+j/n/hapgorY619XdykJTbZk+F8RPqFMI3LT38c307IOxyxptj55uYVLQY0zoKzwSH3 eaz4A
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|BN3PR12MB9571:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c1ef046-db42-4c4e-ddf6-08dde9f641d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xl+8iICf3ewLivwBkPRf4fX70H7zV39Kg9zbRTFEKrY2R6MQmd/m5vCRJPe4?=
 =?us-ascii?Q?WXN28ESuH+SUCBm1t00D80Ji66lbcDkvcfX81HrahnRZnZzpc9QxjwEzv1ry?=
 =?us-ascii?Q?LLV3p1sS2nLE/Gr6wjiJWchtXwYHXoOYF2VYuWCwXIFeI5Zy5hdlTO3xtGjY?=
 =?us-ascii?Q?9QYih9x16oQG2aGGrJyfEfMJ5DpIYMZpUYZ0FGWTNPlsPNU1Oyh3GeL2LisG?=
 =?us-ascii?Q?w/4VSxy2NgWDAgv4JQFUaaa2lfXPYv1KZX7N5vehhQGWfPniGH3KGrWgzxcg?=
 =?us-ascii?Q?oU6fNJDP7tjaW31oVHI4xxDS1S2ROmnUuvxe+x7il6Srpsg1/Pe0TIlDqFyF?=
 =?us-ascii?Q?jGPOZ7v//hMRySP3QVNzq9vDLqKUePvjzt7LlysHJT6s4d6y540nItvjKhas?=
 =?us-ascii?Q?WMUS8pJ337pBSQJIi8i/qAwqXQKKMP2tFG3HMJIOdF+SkP7Wk8zUixvvmGeH?=
 =?us-ascii?Q?fAAlV7VtEX3bx/QHH3mfSZv6pQzX3mvoT+KjcvNxcKiSPiEWx9lkkKzTfLw6?=
 =?us-ascii?Q?Frs+pECEduFGyPh5UBtaykmvvRDnwgc/NUaZzWPfnbU/oXoJHWUsyF85JaDp?=
 =?us-ascii?Q?qvC5IpV1TJDSjLzHfUs+JZsjb9srpuHUPFbUPpsfKFqQ7IWyPO6PKBp8Z4vk?=
 =?us-ascii?Q?0KeaT5BkzESPJ5HJLrE855Zsd637EiRlAv3FfWUwTSLCvjAKuVVBf7Ro0Ihu?=
 =?us-ascii?Q?L01G5RQMmiKYXaxjdlImG2qPqvJRWcQIrFDcJ7CQPm6la1mKHm7xzB+uAboH?=
 =?us-ascii?Q?OzveN9keIsE95QtmeoW1xfbJrWMRObpFGA9so+kN9eKUFohL3f+gOrATaPDL?=
 =?us-ascii?Q?/IIs641QpARcCUiUNK1XS/fWqVTgzdGBsM2ZiS14Rp2ZxYNwE2u8ApaO9BYQ?=
 =?us-ascii?Q?ZNsLxC0mdvlPHPIXnX4T476txCu1emhqwfaGZqGn/vSkF4G8DotkLdgt/cyX?=
 =?us-ascii?Q?X2bPwC2rZZYtFGLZz1UIPijnG6qKtHq0OAU1oCkO7qiXDH7BbjERCJ0rSEnI?=
 =?us-ascii?Q?BmnlOCDl0BeRigm48N205pCj46uayn8DZ7TPVzeMjkdKlcHG3nsiqJebCjBk?=
 =?us-ascii?Q?QWfrPZNKcU8T80gvW+HlzJiysJgscJdUdAvgBWje25FUFy8vlovqPSyjhLxj?=
 =?us-ascii?Q?B6Qodmx97e/ENZ0lho+ykIreDzso+HXFnLUbq2f2cSR2iED16wa+p+qbZoGX?=
 =?us-ascii?Q?zrF8XL/Hyg8wFc/n758NokErBK23B3s6Egg+/tb70xWwAOrTnmwb7l4+9IvO?=
 =?us-ascii?Q?Y86AHEofWx1eHSycs9mI708u84rKtZAM4f/JNZbX0zjxrK73fnkhi+RyOxyi?=
 =?us-ascii?Q?LtAYda53oAOt8AbZrNSwqvZ5YVYwMe71pmj4bmjoFxpkjH7+Tw6+yVl76HTb?=
 =?us-ascii?Q?I7Kd8mtSU15MgtfwncRSOUx9L+TzI3bzttOcCJMoY/Tpj3fVacCYJuKPsKiC?=
 =?us-ascii?Q?mr+YGC4LWVky+TyMWb6jEqy4U+rZgzVxWp+6hlB7gIMwyCVuwSPS9HRHisgc?=
 =?us-ascii?Q?4eXVwu6+7I8wlTYGJuyoJcW0Xz6Qn7ZE82h9?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:56:43.1556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c1ef046-db42-4c4e-ddf6-08dde9f641d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005649_524188_2D275F62 
X-CRM114-Status: GOOD (  11.40  )
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

Enable DP output in both CC (Carrier Cards).

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 .../boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso   | 17 +++++++++++++++++
 .../boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso   | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
index fbacfa984d76..b92dcb86e87e 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
@@ -71,6 +71,17 @@ clk_25_1: si5332-4 { /* u17 - GEM3 */
 		#clock-cells = <0>;
 		clock-frequency = <25000000>;
 	};
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
 
 &i2c1 { /* I2C_SCK C26/C27 - MIO from SOM */
@@ -145,6 +156,12 @@ &zynqmp_dpsub {
 	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
 };
 
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
+
 &zynqmp_dpdma {
 	status = "okay";
 	assigned-clock-rates = <600000000>;
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 3c36eb52e968..d7351a17d3e8 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -72,6 +72,17 @@ si5332_5: si5332-5 { /* u17 */
 		#clock-cells = <0>;
 		clock-frequency = <27000000>;
 	};
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
 
 &i2c1 { /* I2C_SCK C23/C24 - MIO from SOM */
@@ -122,6 +133,12 @@ &zynqmp_dpsub {
 	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
 };
 
+&out_dp {
+	dpsub_dp_out: endpoint {
+		remote-endpoint = <&dpcon_in>;
+	};
+};
+
 &zynqmp_dpdma {
 	status = "okay";
 	assigned-clock-rates = <600000000>;
-- 
2.43.0


