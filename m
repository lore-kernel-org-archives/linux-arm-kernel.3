Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2914ED0D17B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZSzeuhOh967YV3ctaRpt/EyImqRXsVD9tcSM+qmsec=; b=IPk+txV5g74EztT+641yahxSYj
	dvchMoqyuIl3PfUo1rLwfPOX2QGc/iyWqHyTu3FqEbMng0m7JBCvfU1kBGt+UurmOXY74YwsFyFAX
	M2+xSDhmOMcguL54IxOFLL1QimJpCSAyjFjacMaZLoH44WG+whyD+QShEI9hotCW8WJA3li5f4q8K
	kkiffsbsk+sGlIxy5TANVVivOaj8bNKYANLmOD4uw40uj7LlJdhpR8E+YBBiMUaKk9vyx0TN5u3/p
	RyrNiR/Knr0DaLWyRnLYua3BmgFtHEcWtzYLXksRjBFTbCDGmRdvvSVX5tl4IDTwDHYoXcklPryqb
	QqOM/1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlJv-0000000GHFT-3KR3;
	Thu, 08 Jan 2026 08:24:39 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlJs-0000000GHEk-2i1v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:24:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LA5Tjj7/GRuqiOUpR6ICK6Q7rJEiYgDuSTVHvrtOkNGVpBlzGwioekCoitDMXzEWnyuCH72OPR5LBrOK0YuhhYBzEIoZtb99VrWS5Dr1BnBNvK8cLaAfJhicNXekhI/dm2qHmnUmxsTas05b14Y3gE1oPgMWRCN/qMJy73BIjq52Vcq6DlgxOrVu8n9+YqgAVkI0MGZfUdid3gpKYUCWpdSE/Fe9xQ/GA+4G5OcOr9umwM3VemSYZIzi5/zoU+Yqw2r46/qKtk1fLLdoCLKqMxnLjLSWJL0pIfjhyQVsGlHc2WAkJEZU7Du7jBUKUCneu5Rb2kJwv+j5y55mPEajfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZSzeuhOh967YV3ctaRpt/EyImqRXsVD9tcSM+qmsec=;
 b=KLqjNmH0RamW5UaS2XeNOEEXM+I0Lj6+5m+P2ewegaTaPJHjlV5OwF2suwSlGb+JUxmNIoJaJdvOxEPPgogFIYjMp4N8T7To24Vy7KSVOPi5r2ks5QeEQOVemdSvGbWWOcZsIzN4wZTK2t0Vv+HQtN0dlbNHfTc3UTo4emVahu1BlI8jbFLYPadGufUyrBqeyEgMmlRpUvw3URFQgi1vNSkmnH7gwu9ThI1JI4Bc5di1aycoEYhH607nAck/NtMQ5rXGiOmEaP6qjkDyU708g9igtJXMJf8aRwO0sVHLO5uNOTLKyjpYbqq1aCYBskYHCGBtiu1GSiwlew4mk54VEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZSzeuhOh967YV3ctaRpt/EyImqRXsVD9tcSM+qmsec=;
 b=w7DEVvjSaBmVLrtrD5V0scAZ+UGQFSVjVHh03fMXmKovV24X8unvxoivdr/ZQCfU65Uw2lJaBe9rYLknqyQjF5/nbpdNLtZgReW1v43I7IzV6pe1lapAVQd59Eg2VjrYFRJoqMsgvve+Lk3vbmQTRTrnabIXnjO+jOTBFNzSjAw=
Received: from DS7PR03CA0034.namprd03.prod.outlook.com (2603:10b6:5:3b5::9) by
 IA0PPFA8EB66EE9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bde) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 08:24:30 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::c0) by DS7PR03CA0034.outlook.office365.com
 (2603:10b6:5:3b5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 08:24:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 08:24:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 02:24:29 -0600
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17 via Frontend
 Transport; Thu, 8 Jan 2026 00:24:28 -0800
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: zynqmp: Fix DTOVL warning about graphs in kv/kr260
Date: Thu, 8 Jan 2026 09:24:20 +0100
Message-ID: <b484e81c1723fb21530c4f95deb70f3b0b61ada9.1767860657.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4151; i=michal.simek@amd.com; h=from:subject:message-id; bh=gfmbrYb/2PDoxLgCVenHb1wNFLtDoWe/Uusfv4UDssA=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWTGZ27jLo87nnVV9lnqrZKdFjrWm6ZseSbdyrJosnvL3 s45G15LdJSyMIhxMMiKKbJMZ9JxWPPt2lKx5ZH5MHNYmUCGMHBxCsBEpncxMnw63ef+sXhGyDUm Z64tcoqveWNbiqw03jdyFWbyqz6v72X4Z6B4wCwqWoA3YZnga+9qsUS2rUwmRqwRixbFBvYnBkf wAwA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|IA0PPFA8EB66EE9:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1d362b-0376-4c27-51bc-08de4e8f5874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eay+KjExulEVYm0kjc3u61VTp2SPfqnx7YPIWWFlNjFbUj1cOYC/a+WgzTwj?=
 =?us-ascii?Q?B0psiCoc5pOVSLRFPZa8YFHLWAW2XrOWZFZvFvQe72WvQ3U1dFneKbzrYiEw?=
 =?us-ascii?Q?rnNRiOXB0spIARhSuN5Wo306ywKJCLstI/HP3MVbf8VG3ZDSoaTDLqVHGxSs?=
 =?us-ascii?Q?ZjEupGG1W/dvT5KiRodxW7PmhBnErSZBgW034VUsJamppaiY8w+GqtfIKs70?=
 =?us-ascii?Q?lM/7dalkX16+zsv6hFvtI+QHlKVhiFsIaaoFyGuNVvUpTooPK+cd1Zs0+U9I?=
 =?us-ascii?Q?gZJWhXzqdr8mOFKyrXtPxAnHD6L2qzeVrqmsgUQr3NpekPys9X/7vccdGd7r?=
 =?us-ascii?Q?QSjIbH15yl95YymmIRDMUJJd4v7eOQc1COdLceVXC28QhfsJYDtLNOFWN8+L?=
 =?us-ascii?Q?WEqal9WfdoR/DqePEsQz7D2sGltnGBr4RorVRaXPxiV+qE5KNyguxrF0PAN1?=
 =?us-ascii?Q?AZ8MV2U7J7tMvgZWfPjik+sXklTd8+TBmaixnSJKKqXPIckFRE1OwBgOXpTk?=
 =?us-ascii?Q?/iRqDP1+cx4vN2eSlKFScc7q9C2ZxzdeU3DKmSLvaRBkzrSK09pzy09SnMEj?=
 =?us-ascii?Q?gvEuODbGB8pBv79N2GMc9kHtqrPlQ0AC7/7NNLEuoHQlD8lt0hqtIJoyTqnx?=
 =?us-ascii?Q?XiBD9hD2d8YWEV8sVEi5U8/qUzOQL9jLYVu2EbCfLWLrhUo3fiFUwUGAMh6F?=
 =?us-ascii?Q?UEwyDpwAG3wsROsXiVorZnJn0B22mdAhbAIujeeaMjHpGdcnK0i+hter/jv1?=
 =?us-ascii?Q?xHmIXMWuHs4tknZ+VzudQwUB1JiiAMRahKQpElIhDXqUzXbVHlmAQnUqoE5L?=
 =?us-ascii?Q?jfiKQNaZGHH1d04cEjtAMXeiVH/mhZFwPNzbGqzUWjWzTe2WPh3mE1wBSaP4?=
 =?us-ascii?Q?1hCR8SbhZqVLNLZKB15xRG4m4546oCnnltgLubJzjAdNX0Hh8aWBA3KCUAgv?=
 =?us-ascii?Q?JfbLSnQsdHzQk9ccrURJjexdD8hwIUOwJ3hJieVDEQU8xGoEEHxwhDYFwsIh?=
 =?us-ascii?Q?i/0k4QBCNGo8movtIQmDulLQx4SNwWDIKz9z49DUiDoqTO+DfCvgRnlk1j8j?=
 =?us-ascii?Q?ISwHwIO4bALngOylqM5a9xjURObpQDiFDCodgqGE5OIKN6eH4g2QTjW0TIVN?=
 =?us-ascii?Q?5tEDFmvVqDLLJzv1ZY9NLrBOWPit43P8Q2oI3OE3MwxBiE55Whz2gyUXRZdh?=
 =?us-ascii?Q?E0wStMAzqYKYnLnzz0UcbKa8atyYcWHmRQigfT1yM00G58wlWJrX52CzZQDh?=
 =?us-ascii?Q?8v1aOUE+HAqkBm/L3Fepi8DElI4rt1jfTMAGH8zBPX8xy5z4OGsuXAHTG65b?=
 =?us-ascii?Q?rlxM5JuTzM3HDBygpqXNEnuzhpRZPAD/hO03+p6MO4nqtDNgM1eN0NxPXh1M?=
 =?us-ascii?Q?OnWa4CvqMcrwpAtzDcu//ZdZxsoOfCqPL85ZD4+7p/kaRm6fFAfi0WseCZJh?=
 =?us-ascii?Q?acuQncrBk32wRgV7Ue+bsBz5JEx3lNXLC9CJM+0qKE9mn3kMDADKF5cWGlkk?=
 =?us-ascii?Q?QLCoRbHK99S6e9yRU1sA8LCTADOcMxOmN6qg4A8Te/3K4S/JM6cU7G3GWLa7?=
 =?us-ascii?Q?zxfBAjF5hkywh9Wqv4E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:24:30.4021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1d362b-0376-4c27-51bc-08de4e8f5874
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFA8EB66EE9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_002436_687394_0EB34AAA 
X-CRM114-Status: GOOD (  11.95  )
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

DTC is generating warnings about missing port like:
DTOVL   arch/arm/dts/zynqmp-smk-k24-revA-sck-kv-g-revB.dtb
 arch/arm/dts/zynqmp-sck-kv-g-revA.dtbo: Warning (graph_port):
 /fragment@5/__overlay__: graph port node name should be 'port'
...

That's why change description and add it directly to dpsub mode to contain
full description with also port.

Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 10 ++++++----
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 10 ++++++----
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 12 +++++++-----
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 12 +++++++-----
 4 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
index b82a056be2f9..507be24e71c0 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
@@ -147,11 +147,13 @@ &zynqmp_dpsub {
 	phy-names = "dp-phy0";
 	phys = <&psgtr 1 PHY_TYPE_DP 0 1>;
 	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
-};
 
-&out_dp {
-	dpsub_dp_out: endpoint {
-		remote-endpoint = <&dpcon_in>;
+	ports {
+		out_dp: port@5 {
+			dpsub_dp_out: endpoint {
+				remote-endpoint = <&dpcon_in>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
index 4dcf92a2158f..68394f02e8fb 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
@@ -148,11 +148,13 @@ &zynqmp_dpsub {
 	phy-names = "dp-phy0";
 	phys = <&psgtr 1 PHY_TYPE_DP 0 1>;
 	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
-};
 
-&out_dp {
-	dpsub_dp_out: endpoint {
-		remote-endpoint = <&dpcon_in>;
+	ports {
+		out_dp: port@5 {
+			dpsub_dp_out: endpoint {
+				remote-endpoint = <&dpcon_in>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
index 923a70d750bf..e7417af8ae01 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
@@ -3,7 +3,7 @@
  * dts file for KV260 revA Carrier Card
  *
  * (C) Copyright 2020 - 2022, Xilinx, Inc.
- * (C) Copyright 2022 - 2023, Advanced Micro Devices, Inc.
+ * (C) Copyright 2022 - 2025, Advanced Micro Devices, Inc.
  *
  * SD level shifter:
  * "A" - A01 board un-modified (NXP)
@@ -125,11 +125,13 @@ &zynqmp_dpsub {
 	phy-names = "dp-phy0", "dp-phy1";
 	phys = <&psgtr 1 PHY_TYPE_DP 0 0>, <&psgtr 0 PHY_TYPE_DP 1 0>;
 	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
-};
 
-&out_dp {
-	dpsub_dp_out: endpoint {
-		remote-endpoint = <&dpcon_in>;
+	ports {
+		out_dp: port@5 {
+			dpsub_dp_out: endpoint {
+				remote-endpoint = <&dpcon_in>;
+			};
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
index 563e750b0e08..7a05180e58b4 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
+++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
@@ -3,7 +3,7 @@
  * dts file for KV260 revA Carrier Card
  *
  * (C) Copyright 2020 - 2022, Xilinx, Inc.
- * (C) Copyright 2022 - 2023, Advanced Micro Devices, Inc.
+ * (C) Copyright 2022 - 2025, Advanced Micro Devices, Inc.
  *
  * Michal Simek <michal.simek@amd.com>
  */
@@ -110,11 +110,13 @@ &zynqmp_dpsub {
 	phy-names = "dp-phy0", "dp-phy1";
 	phys = <&psgtr 1 PHY_TYPE_DP 0 0>, <&psgtr 0 PHY_TYPE_DP 1 0>;
 	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
-};
 
-&out_dp {
-	dpsub_dp_out: endpoint {
-		remote-endpoint = <&dpcon_in>;
+	ports {
+		out_dp: port@5 {
+			dpsub_dp_out: endpoint {
+				remote-endpoint = <&dpcon_in>;
+			};
+		};
 	};
 };
 
-- 
2.43.0

base-commit: fe24398ebc1d62c0d2549d1e258564fd6625ae19
branch: zynqmp/dt

