Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA6ACA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=96QaT7NGG5QsEpOMqkx1EIAlPmNTiG95XHMpgburkGw=; b=giiBMYDCMyZibHsRWtQ7s3IyMu
	NCFV5fEogX+NY9CYankC28nzh+Vw2HMc5C1caVadAF2JraCNyJUBKFVS7yi1A22In2tCyK18d3Heh
	YkRbein5EzOnjea9JEREXm5/OyRum6d2ENpVL9N8Ml18wv/polGwYWAeBvs4mJh/QdpFXodmJrBQ4
	8C3sHM8hOgOWfABPlmRZ6+pvjmsvpVIYtrxGWPfzCSvUS0lvamUIaVWlu+h08bh29FIRTTBnA0scE
	MMQIOioCYiMecEeno4VHBXgRVKIb4Fa7AzMswK0+4/igUxzsPBz+zWMe2hl9+wDosB9MMC6YBAaR/
	rkn6io1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSeH-0000000FEnV-1ixf;
	Sun, 04 Oct 2026 20:17:29 +0000
Received: from mail-westeuropeazon11013023.outbound.protection.outlook.com ([52.101.72.23] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDSe8-0000000FEfq-20Ko
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:17:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eg5TfAcL9DlLg9kfkihclqkyIMnHmZohj3qLjY5OaPrMXUyD9ofnSM5F69Mm6rNz24eqhRsKW4Tyo4cNc/rdaV+zgI2XfC5lHegiwWI+jBPCISkfEslfY2NG1TcLvwb4wCxBK2Fkh+1tN/fx1ku5MzQC7u6cpEHZ6pkDIC5Vww2XXZ3xWUVOPHqFOU2j1EBKwqRlvGgO0wf3MOAL/DrkCetXidgJgyllFZ9jPIJQBtQvVluhnH4+8IRcnxZVna50zUSPlmSSpEbfAvXZr2C/Y+ZelKQc4YVjnVw3tkX01hPeAf0nqEkS4cfNvIC8aZp4LpKnPUmHHqUceFMG+6Rf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96QaT7NGG5QsEpOMqkx1EIAlPmNTiG95XHMpgburkGw=;
 b=aK5coZ2tsmDDymICIbpcIq1Bs6g7E7YxcrFTCuNsvhRknBoOo+pmHarwHV2tfEryyYxf70QGxKIJsmFeWR07OqrXKq59vBT1ApiTl897o2vegtZvSFNgZ4TPXBuvEAz2J6di9PzQwcDz4JtjTf2SUK9ueEx30/g2z0/BQPttQjGHVbd0xMWodQj13LJOJuGw4vGXQhCLw00fpnR+pAomwcSjVkGYWdEoxmXDMWeJ/24YeQYR9O6nFMTDYx1CsT1haYHtLW/Btfults1ryWeJ7RK9jCVpBnnzSGeVbow8fAvQVattDuGTBGijYt7zzmXQDjk6ns42SvpDyLBu+BmGAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96QaT7NGG5QsEpOMqkx1EIAlPmNTiG95XHMpgburkGw=;
 b=GWj3ItlPNrCfvymL81kUxmNmU9heWmjvn4tsjsq47X8q94Dypf1Zbvr4u/8dFLKXOPZWFYzSarXW2EXrnEpfj21nnTaXX8R36H1l+vve+lQN5dwAL/CC+Ku9rU6XQ1Rhxuz7NtzO5ph3SJ4t5U3njEAeiMlnUr0vuzoc2RfaLv8=
Received: from DUZPR01CA0290.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::28) by GV1PR02MB8353.eurprd02.prod.outlook.com
 (2603:10a6:150:54::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Sun, 4 Oct
 2026 20:17:12 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::61) by DUZPR01CA0290.outlook.office365.com
 (2603:10a6:10:4b7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Sun, 4
 Oct 2026 20:17:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Sun, 4 Oct 2026 20:17:12 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Sun, 4 Oct
 2026 22:17:11 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Sun, 4 Oct 2026 22:17:11 +0200
Received: from lap5cd525d1j1.sto.se.axis.com (unknown [10.224.134.145])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 384864CED;
	Sun,  4 Oct 2026 22:17:11 +0200 (CEST)
Received: by lap5cd525d1j1.sto.se.axis.com (Postfix, from userid 22105)
	id F2D35803CDC5; Sun,  4 Oct 2026 22:17:10 +0200 (CEST)
From: Henrik Grimler <henrik.grimler@axis.com>
Date: Sun, 4 Oct 2026 22:16:02 +0200
Subject: [PATCH 05/17] ARM: dts: samsung: exynos4210: sort nodes by address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261004-exynos-arm-cleanup-v1-5-45e435353c56@axis.com>
References: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
In-Reply-To: <20261004-exynos-arm-cleanup-v1-0-45e435353c56@axis.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
CC: <devicetree@vger.kernel.org>, <waqar.hameed@axis.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henrik Grimler <henrik.grimler@axis.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3940;
 i=henrik.grimler@axis.com; h=from:subject:message-id;
 bh=5dIr61AenKslm4JmcCHuDtadO4naqsXmZmCVqeYe8vo=;
 b=owGbwMvMwMW4gT3Pk7swMZvxtFoSQ9ahLbqexRzPwnKsV+nPbhXSnP/a+sp0K3Ez0U+ySgH3L
 JveH03qZDRmYWDkYpAVU2TRqddcN71TPkVy5aOzMINYmUCmMHBxCsBEXldzMKws2re/q+3pXXF5
 NxUPw+32vxr0tBc5qDPfPbZO/7Da0/1GO3h96tt3bfutIGvkIWV+oGeaGfdh2+RFb3yqrINy+Q9
 +3cb44VaiytmGmNhV3P1rz074wy/y942k2KYGxUdNPQ4Mmp/yajpz6gWnaIQx3HhbvDJ+dyWXCV
 v/DcldKQ9zF9uvy7y2epVa1OT9UhIvPq4+qDZtZ9jnTaXJB2fuSZn7gqtksU3230cfs6SmtfYt2
 +onk3/tqPfTypTJjfzucz3fN5a4/XlSn+8xTeR8r4jNblm5dx4CpRPKO3x0l2Ze99q+3/iY0Zfn
 ylEn5XgFAzRmP3G5JZJYpnC3foqf/arSlrSw9H7OF9EXAQ==
X-Developer-Key: i=henrik.grimler@axis.com; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|GV1PR02MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc2cb82-455d-4d3c-3efe-08df2254798f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|36860700016|30052699003|1800799024|82310400026|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: /hBrBugGqpq92sND2lA9SN4BslVymjgCdfF6A2bwZbNccIRcJSauZ4hER3/Uujz4n0M1x4nytFvmzISWK9azqHs4Jq0NRCJtitAPkA9nGfS3VxdUz+0YLp2qRDL2H0SClrAlm5V/C3pqPz9EXPyokOgpfwacSWXxudII3LsUCiEMT6q2pPiNe9TlO767u3Wq3zyj6J5eokYnejitVX3eUgHLZjZfQviRPUGTkD+oIYWiVE1Awp+Xs+pLwvDB6/vk5lbTIrNr4f86+IORxXv4pmpXpJt02ElDRVzXNID0mSPbO9cQFRSMWY6c/4jukJxbuJHxLTI2pfy1SpoMwp3EksnTqk7nfroreJnjAzv3qRvoYWYQE7THSpwKpha8/yoY6dgGulVQCEvOBpCRgZM0yzr3usDTkQ0gh4LNmbyPrv1cHI1cpMRvU9FgPvocHzcQOfRz/toN+JHaNPm10YuFfzLF1wKF0U5zTInBW5vnzabVeMWZP4y8zBpJ2Bd4RF4DBiiNT7u76fQcWQVGiCFPchLSJNtvr7d7qAFHBModtrknKjHo+/mLJTOfnhYkKSpExrTbyvZJCpcgk9/QTBdb8GBV9aqd8dAcIJeY9Vv4evpLaMiA0MHTVFKmMQpbBw25pcZFUadTgXbexCg0QW0s+0eoeLxhat1BIlI8KskzXJZLsAZ8u852/zy/KgKNUOfw7wXn9PimgEUkyp9MWFjFOw==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(30052699003)(1800799024)(82310400026)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ud6yk9J/6357JNnhytmCFoVJWmwIdsjpyyFqxSwvEaBVFDbP8R9++Tz8zXKfUcueNM9HdGjXt7EEWm6nFvEmDrGFBBfczPxXjoyl2bCmJAZOIGF6YuGhOBgYqHXsj2N97TjMFbzHVHD1FimZW2kUy31Poa5Ws1TL6x0DSSAUt6zkEgCe5WZhpqKhvzfFNDIN/j94sj1ysKbuhrL6QaUsaPUr1BUnkUJOFMsp7fMl8HbIqF/7WNY8SKsOsy7vB0yfQBM8JvYvKtmWQYwGHCpiW3UMX1VJdN/IrKFm8LScujWh2/npRM+yh2yoy/S8EUC81oGq7GRI+ifml83MykKvO1EQqxReIiCaAvZg2+ECxXNn6KrccLt7QNWmWMTHPpycx3OAnk3MrbquhrQgWtLGC4pwo3uqmPJCwo7BZE/VZOtCt2XgL/XdoV2pUe2qdDuY
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2026 20:17:12.1414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc2cb82-455d-4d3c-3efe-08df2254798f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_131720_525259_14F1B7DE 
X-CRM114-Status: GOOD (  11.29  )
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

Nodes should be sorted by address, or in the absence of an address,
alphabetically. Sort all nodes except the pinctrl ones, to keep them
grouped and in order by alias numbering.

Fixes child-address-order warnings from dt-check-style in strict mode
like:

  samsung/exynos4210.dtsi:369: [child-address-order] child node @12220000 out of address order

Signed-off-by: Henrik Grimler <henrik.grimler@axis.com>
---
 arch/arm/boot/dts/samsung/exynos4210.dtsi | 77 ++++++++++++++++---------------
 1 file changed, 39 insertions(+), 38 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
index 510e8665d1a2..66b1a55f703d 100644
--- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
@@ -269,15 +269,10 @@ pd_lcd1: power-domain@10023ca0 {
 			label = "LCD1";
 		};
 
-		l2c: cache-controller@10502000 {
-			compatible = "arm,pl310-cache";
-			reg = <0x10502000 0x1000>;
-			cache-unified;
-			cache-level = <2>;
-			prefetch-data = <1>;
-			prefetch-instr = <1>;
-			arm,tag-latency = <2 2 1>;
-			arm,data-latency = <2 2 1>;
+		clock: clock-controller@10030000 {
+			compatible = "samsung,exynos4210-clock";
+			reg = <0x10030000 0x20000>;
+			#clock-cells = <1>;
 		};
 
 		mct: timer@10050000 {
@@ -301,10 +296,22 @@ watchdog: watchdog@10060000 {
 			clock-names = "watchdog";
 		};
 
-		clock: clock-controller@10030000 {
-			compatible = "samsung,exynos4210-clock";
-			reg = <0x10030000 0x20000>;
-			#clock-cells = <1>;
+		l2c: cache-controller@10502000 {
+			compatible = "arm,pl310-cache";
+			reg = <0x10502000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+			prefetch-data = <1>;
+			prefetch-instr = <1>;
+			arm,tag-latency = <2 2 1>;
+			arm,data-latency = <2 2 1>;
+		};
+
+		ppmu_acp: ppmu@10ae0000 {
+			compatible = "samsung,exynos-ppmu";
+			reg = <0x10ae0000 0x2000>;
+
+			status = "disabled";
 		};
 
 		pinctrl_0: pinctrl@11400000 {
@@ -330,20 +337,15 @@ pinctrl_2: pinctrl@3860000 {
 			reg = <0x03860000 0x1000>;
 		};
 
-		g2d: g2d@12800000 {
-			compatible = "samsung,s5pv210-g2d";
-			reg = <0x12800000 0x1000>;
-			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
-			clock-names = "sclk_fimg2d", "fimg2d";
-			power-domains = <&pd_lcd0>;
-			iommus = <&sysmmu_g2d>;
-		};
-
-		ppmu_acp: ppmu@10ae0000 {
-			compatible = "samsung,exynos-ppmu";
-			reg = <0x10ae0000 0x2000>;
-			status = "disabled";
+		sysmmu_fimd1: sysmmu@12220000 {
+			compatible = "samsung,exynos-sysmmu";
+			interrupt-parent = <&combiner>;
+			reg = <0x12220000 0x1000>;
+			interrupts = <5 3>;
+			clock-names = "sysmmu", "master";
+			clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
+			power-domains = <&pd_lcd1>;
+			#iommu-cells = <0>;
 		};
 
 		ppmu_lcd1: ppmu@12240000 {
@@ -354,6 +356,16 @@ ppmu_lcd1: ppmu@12240000 {
 			status = "disabled";
 		};
 
+		g2d: g2d@12800000 {
+			compatible = "samsung,s5pv210-g2d";
+			reg = <0x12800000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clock CLK_SCLK_FIMG2D>, <&clock CLK_G2D>;
+			clock-names = "sclk_fimg2d", "fimg2d";
+			power-domains = <&pd_lcd0>;
+			iommus = <&sysmmu_g2d>;
+		};
+
 		sysmmu_g2d: sysmmu@12a20000 {
 			compatible = "samsung,exynos-sysmmu";
 			reg = <0x12a20000 0x1000>;
@@ -364,17 +376,6 @@ sysmmu_g2d: sysmmu@12a20000 {
 			power-domains = <&pd_lcd0>;
 			#iommu-cells = <0>;
 		};
-
-		sysmmu_fimd1: sysmmu@12220000 {
-			compatible = "samsung,exynos-sysmmu";
-			interrupt-parent = <&combiner>;
-			reg = <0x12220000 0x1000>;
-			interrupts = <5 3>;
-			clock-names = "sysmmu", "master";
-			clocks = <&clock CLK_SMMU_FIMD1>, <&clock CLK_FIMD1>;
-			power-domains = <&pd_lcd1>;
-			#iommu-cells = <0>;
-		};
 	};
 };
 

-- 
2.43.0


