Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C94D25050
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 08:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5N9RVhLn9WaENM7A+5L2TBz865/dHybEDE+Byh/tGT4=; b=ysEC+kCEt47W4KRpjJmZaxptwe
	aUsaLYlYD6qG3RSAvZ9S1lW3gx+3inKqCm+4IL7/sCPIMGAa3iM57EPBwO2upsT2xjdWF9g42Ba3z
	0Tb+AvF9Yvb3J3fHd3aqcPmxWQvlVv3AC4Z1idw9r8+5SuhFncoOQJEdrdGYO2kRHTCqLLxo3b9ia
	iqX+2MPKVOdWJTdvGUD4/8NizBEz75X97Gpoea8AH+sLbbgKGyKzSBKTuKZAPn+R9zAwfXp50aRb+
	MejnrW9+q2RAUWWEjzB2dknlgcfUFPzbIweQADiJuZhOx0I7vM3owWCOjpWM3BDY8IkjDc6eZfUgT
	xXOuQhjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDfV-000000051YY-0glc;
	Mon, 12 Jan 2026 08:52:57 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDfQ-000000051X4-49Ga
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 08:52:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1lVP1LoWW+IdAkNGTPHce3KwFZKxlqKsGN6oxhmaWFWc/YqP00lGwT0uI/NPOIr+0A+L8uTS2rdQHGzvM2ahtUWqSEnlu/9da1jJ72SguIbfELmttSQ6wlt+sHeEQBojv0O8uTXT1RnTFf0SYE4IQa1XmQuvshvv43WIyYXYz8+f9cRrMP1M+dCd2I1E5IpnKZoOtyq2uQWT2qEXlhFv26l+Vc/2jD2PbAg5rRgXXjU2NElcy3jA8JP8a1Pk+f02CYDOwrfyLHg/eWRA/m9Du8gllzEVB7+7gYFQZyCEIdoSzdmEuqVmfFUPJfrOQVvBi1fIKiDpjhwaAisyvcTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N9RVhLn9WaENM7A+5L2TBz865/dHybEDE+Byh/tGT4=;
 b=O3RskMwCIqNCqYVjv3ULb28/gZUK/aU0ZUOHbBgJ1q6DK4IPWHev8TFOHvfB6kibOBx6oh5AKNkwo8n8aHgl4wjinv+nrVAkfSv9jKoWwrYJBUaLaMe9wQjJlL1bRDWu1YsZ0UkDZ8Jvd6yrLbZzjLDY1bK8GDVGDanf/vWyJMvWZoN84Ulz1Im4NVGdAJnDzCOWdHpqBYISX/bqFUupC0E7tnv83Ub2IatsWU8R1bZhnecBEIP5nzoFY5z0ClveIkwA1y7xXltpnKGo5PeAwV58Hssq1Lnmv9UMePqs/QNbG6Ddhve8cYDQ5UYcCl6/v++kRi/HyRb2ZvgmhzNTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5N9RVhLn9WaENM7A+5L2TBz865/dHybEDE+Byh/tGT4=;
 b=gtX82J6Yr78cGMhhGvfnhi0NVWbsxq6OgVlecq/sKF2PjzdGIZqU4LOXmU+rECHN28tzX1e0jb0fdGmvpWEK6L3+35X/fJu13mogsDZQhmwGsBQrmsagIkuxlrbkbVedylaP/acgWCjNcH3zLVvLxpD5Wlmj0oFPrAGdtQ2aQjY=
Received: from BL0PR02CA0073.namprd02.prod.outlook.com (2603:10b6:208:51::14)
 by BY5PR10MB4321.namprd10.prod.outlook.com (2603:10b6:a03:202::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:52:49 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:208:51:cafe::c1) by BL0PR02CA0073.outlook.office365.com
 (2603:10b6:208:51::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 08:52:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 08:52:46 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 02:52:08 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 02:52:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 02:52:08 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60C8pqhA090613;
	Mon, 12 Jan 2026 02:52:03 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <u-kumar1@ti.com>, <p-mantena@ti.com>,
	<m-chawdhry@ti.com>
Subject: [PATCH v4 2/2] arm64: dts: ti: k3-j784s4-j742s2-main-common.dtsi: Refactor watchdog instances for j784s4
Date: Mon, 12 Jan 2026 14:21:13 +0530
Message-ID: <20260112085113.3476193-3-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112085113.3476193-1-a-kumar2@ti.com>
References: <20260112085113.3476193-1-a-kumar2@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|BY5PR10MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 730e1591-3a1c-4645-e7ea-08de51b7f52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0gJ6geeE3qWmuBJFFvUqyz12IxhKBXeOZeGbShgV3r2Y0oXvHpZoE+8nrNXT?=
 =?us-ascii?Q?LNb9E4J5N+HKp+Fn1URywQTOqLMqVquH6olMnAtp9iaXDBg7g1uGkDLRPyCK?=
 =?us-ascii?Q?7Mwnap/s1x+KfPAQMh/ktDD10gJEOFm+40CRSrFP9RteU8SNJ8w++/bzAHlQ?=
 =?us-ascii?Q?2lnw6HtwR9wryFn5Zx45ykPpj8LXN7D3Ur98HyGGhchd1cm5h8tDcpwJExPH?=
 =?us-ascii?Q?ITk7n6T5V8g3ilyzYutvqLsc2dPaKGMatUrhw0sL8E+2yu1RTj/Adbwdakk/?=
 =?us-ascii?Q?9S+Au9Gij6xrHhaJIkkow3k9eovRpOjZxgEwo8QXXbX2YX1+fjp6TNC/r4UK?=
 =?us-ascii?Q?VUI6Rj8QCoMBpSx5TLhM3m2xiSvLLvdxpOptadw48DmDYHrt9fWxPAEU6qBA?=
 =?us-ascii?Q?31M53tMND5Bo6+q/3Y6YHPc6dsBGF5QW56JDZvvkJ1iAPIunG29OfxAkzZlr?=
 =?us-ascii?Q?nIb58ZZGY4cvV5gu2lU5SS/OrogbVyc3XRz914Gjg1PhZeweHTppHRIpSul9?=
 =?us-ascii?Q?T36bPzoHWHxFcdaUg7/8jUhujvIJQylaGVx86ozBj0r3ZJ+A1lPT7sgWrYhq?=
 =?us-ascii?Q?bweaqJqhpBzOekQ9dNBFYpuGrYjdJbWU2qm/dPTr4ndaGCmFRC1d1CnOfPpl?=
 =?us-ascii?Q?EmrD8TSPte6cDJp4KGi3GKraYxZToxUSeP6QiTNFufS2QmSoFz/Ku7fp7U7k?=
 =?us-ascii?Q?KVI1VtuWemt62ix9LbnWNqM6Wwd6N+s+dD7Il8c1U0eIFtBXbcEeCdDrdXLg?=
 =?us-ascii?Q?vOR/NgI5Df9BEx4LQZsjydb2CiHti/NBh6SJN8K0pc5GhF3Hb9I4fhC90/hC?=
 =?us-ascii?Q?ZgBCA8n58zHpEOpRzmGMmKK/nNBoC5lWAwg1g3U82novvVBh/OoeKt7wrYa+?=
 =?us-ascii?Q?OlwiIoljg80alCeoW4zYhwd777pLWJZAvf2oecP2SEo+Zulfe1k3aN1xz4sr?=
 =?us-ascii?Q?UDena3kuRRMiCoucg8Fj8P4x0oXPujnEhQxiS+bbr7DNGdD+Rry5QafJVVcf?=
 =?us-ascii?Q?oc4bJ9BT6Ua6ygAv4SqGEuic6qK+4Sry+zvL1hpy44UJeB2EOBumyywx6NC2?=
 =?us-ascii?Q?+5MqQ+jkavguDSmYt3Xe/KF6Xm1EQVKrvB4EoRvkQenD/+uKoeIBcbCZ4gbT?=
 =?us-ascii?Q?2AJjcLddQssTWVY0zvrl8t2nCauB1z/OxpzeiGgwetQ39equP0fxcakaIhwx?=
 =?us-ascii?Q?quQc+joIcNT0UZhYfuIC0ZrBoMBZTzW3CQSk9weDcKnCh3M+7yi39BC4v0H0?=
 =?us-ascii?Q?d1CYE1T6JZczOSLMhldl1fgUpuwUxLFSIeHr3HA2W1VBrfbvtiELQHkvb2mw?=
 =?us-ascii?Q?i9e94wUZ//ybHSYT+IK3x6F/WDf6LUnsgz/gZ24V4wPdnlLOki3v1hb651vb?=
 =?us-ascii?Q?YthrttLFPi4CHluB5tQnRlyCa6FlIU2uNIofOjcTfbivETRSwt4iC4oreG4h?=
 =?us-ascii?Q?L3i/OAl3UqukEYctKK2DssJ6g5+CYLcL05XOu1+4pwuTyUkTqt/wK0G86R/v?=
 =?us-ascii?Q?scS7dNTW1N35PYaUv5r+q/bPNNYOJ4QGmrhbJp0/VfiAkTbR8NluDgaqQQiQ?=
 =?us-ascii?Q?FZrhZaUFdAsdaa8XlB0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:52:46.6089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 730e1591-3a1c-4645-e7ea-08de51b7f52b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4321
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_005253_032761_1AF004AB 
X-CRM114-Status: GOOD (  11.08  )
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

Each A72 core has one watchdog instance associated with it. Since j742s2
has 4 A72 cores, the common file should not define 8 watchdog instances.

Refactor the last 4 extra watchdogs from the common file to j784s4
specific file, as j784s4 has 8 A72 cores and thus hardware description
requires 8 watchdog instances.

Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")
Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
---
 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 36 -------------------
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 9cc0901d58fb..c2636e624f18 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -2378,42 +2378,6 @@ watchdog3: watchdog@2230000 {
 		assigned-clock-parents = <&k3_clks 351 4>;
 	};
 
-	watchdog4: watchdog@2240000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2240000 0x00 0x100>;
-		clocks = <&k3_clks 352 0>;
-		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 352 0>;
-		assigned-clock-parents = <&k3_clks 352 4>;
-	};
-
-	watchdog5: watchdog@2250000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2250000 0x00 0x100>;
-		clocks = <&k3_clks 353 0>;
-		power-domains = <&k3_pds 353 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 353 0>;
-		assigned-clock-parents = <&k3_clks 353 4>;
-	};
-
-	watchdog6: watchdog@2260000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2260000 0x00 0x100>;
-		clocks = <&k3_clks 354 0>;
-		power-domains = <&k3_pds 354 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 354 0>;
-		assigned-clock-parents = <&k3_clks 354 4>;
-	};
-
-	watchdog7: watchdog@2270000 {
-		compatible = "ti,j7-rti-wdt";
-		reg = <0x00 0x2270000 0x00 0x100>;
-		clocks = <&k3_clks 355 0>;
-		power-domains = <&k3_pds 355 TI_SCI_PD_EXCLUSIVE>;
-		assigned-clocks = <&k3_clks 355 0>;
-		assigned-clock-parents = <&k3_clks 355 4>;
-	};
-
 	/*
 	 * The following RTI instances are coupled with MCU R5Fs, c7x and
 	 * GPU so keeping them reserved as these will be used by their
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
index 5b7830a3c097..78fcd0c40abc 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi
@@ -6,6 +6,42 @@
  */
 
 &cbass_main {
+	watchdog4: watchdog@2240000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2240000 0x00 0x100>;
+		clocks = <&k3_clks 352 0>;
+		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 352 0>;
+		assigned-clock-parents = <&k3_clks 352 4>;
+	};
+
+	watchdog5: watchdog@2250000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2250000 0x00 0x100>;
+		clocks = <&k3_clks 353 0>;
+		power-domains = <&k3_pds 353 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 353 0>;
+		assigned-clock-parents = <&k3_clks 353 4>;
+	};
+
+	watchdog6: watchdog@2260000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2260000 0x00 0x100>;
+		clocks = <&k3_clks 354 0>;
+		power-domains = <&k3_pds 354 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 354 0>;
+		assigned-clock-parents = <&k3_clks 354 4>;
+	};
+
+	watchdog7: watchdog@2270000 {
+		compatible = "ti,j7-rti-wdt";
+		reg = <0x00 0x2270000 0x00 0x100>;
+		clocks = <&k3_clks 355 0>;
+		power-domains = <&k3_pds 355 TI_SCI_PD_EXCLUSIVE>;
+		assigned-clocks = <&k3_clks 355 0>;
+		assigned-clock-parents = <&k3_clks 355 4>;
+	};
+
 	pcie2_rc: pcie@2920000 {
 		compatible = "ti,j784s4-pcie-host";
 		reg = <0x00 0x02920000 0x00 0x1000>,
-- 
2.34.1


