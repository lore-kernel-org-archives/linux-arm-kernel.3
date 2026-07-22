Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52D4C4453E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lx+q8kfVSC/vGxkNza1JtoI/JnGjA4HrTdpwEw2CHEU=; b=JCQj/B+xY9MTJa0Z4BxkNg+XED
	EsEZCZnoDmFDYb/lkhW/9RlWpEMeeGbWCg7OJZ7s6cEC9rqG5Segtqom50+QtZgkmDmY99xffebHl
	iEF21Aky6N4DY3d6OwoJT7EebkBE1PIaUozF32s7d10rPYsnXegBod4kDi9IAIzlw7lRfRlxZsCEI
	RjY0bfz7Ft8wVOTUkVVEpCE7sGbH4xufxjVphQ4VrALlKuofr5M++c3/x/HTE/QAy9Tt9rUSJR+hN
	bAM+wSfDxpSRvoAPcziP7f4wNgdDVZSyZsi+t1oRkGJAtmW1/5MegvZlJhEyXMtZ58ee7wS2ezGU7
	1PE+cm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT4F-0000000BN2G-3Mid;
	Wed, 22 Jul 2026 09:16:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT4D-0000000BMyz-0DhQ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Jul 2026 09:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lx+q8kfVSC/vGxkNza1JtoI/JnGjA4HrTdpwEw2CHEU=; b=FRsioWiLCrzgSsJSCfBml5RStP
	04Go2W8gLXD/s5IexHHrEq5P5f0fjumKw/MxitBhdy8uS0VqzLnBZGi0j3ONA1I1N5U0IZhCvLTNZ
	Zpv3wMl4pCYEURUuxhqpSwYDCdSdaYhTEhcifuS4JQyfYWmp+XOWnk4rw0aFQGGrmxSNdcSvMFFPj
	y3wRI7X/DkdKRZJymHUn8mBWuQlAkwQeDhI/7jbr5BNdsa99MZLa0SzUKFBJRZK/NWsOxDfcWo9SA
	CsrPsWkbIjmmzoLq6pZOzTjizXZDJ/B3XEkL2ta01V2Op8jrpJ5tKN1cw5GzGYvIm3u27l5WpSp1h
	rpJU2KtQ==;
Received: from mail-swedencentralazon11013047.outbound.protection.outlook.com ([52.101.83.47] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmT47-00000000ezM-2qvy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:16:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8dma11wdFcUjieFQ0IBKGzq9R+4+ZvpAfWo5pa1n9xWAo2aeo5Bms5pNmj7g1GGWbrXcXiytAjZU69BvaFs3gVMAtiNFIxOX/clNmx4r0fMcBRSz9thwRnzEzaW62p8tcHS0ig7Us8GVEgLUNRP/Pn7kBw3aYClxEaAZzCdvmm7bf5XhvEHxbVfU6WPzxmxesw6/rSn0KYRZGTUuzeb6xUje//tLGNbhsmNm2esGUCMknwW6QS/xxeCla5lO2vErAdBRrDEn2s8qo/+v0kbAd6Hsw/2Qa5je21sCAgzeQZUxsYPLzGRHZRJtI0IQbdiG4Qohp9/LBJEo9oG83gXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx+q8kfVSC/vGxkNza1JtoI/JnGjA4HrTdpwEw2CHEU=;
 b=xol/qkQvCpkaXnbU++2c03lpFqGSVnABUq8yAJhVnsykn/4i3XPdX8TfFtSj25y9dcwBiSV1+3H0AQXsPNLKdAIm8T9w2RaIteO5sdiR0RQHTofqcL9LfK3Liw8AVtKNtK8grMXoFlxJ/H1ZItPVfH7wwK3dmSgsg0i+g50+03Ox5v4O1+KOSIQzAXbNIf4UwmGbp5Cl/r1/fi3/gZI5iqKdTj+caXvjsWqeOOZC+paHDELcuARVwI/1TfXD/RLyIbsVYqihPK9KLB9RQWv9f1k2KfIN8iYrlSVgHhrh6aBmprR862HszYH7qg6DqKUYnePgjrOe4R5+nYecvKdz1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx+q8kfVSC/vGxkNza1JtoI/JnGjA4HrTdpwEw2CHEU=;
 b=ojtbpLG02Z8RTI0EmVio8DA1R0aqdDhiQDl6HqoIgjjXgC8Y2k2IKTLUyaI6PFepbDNoMieHjiQmPJKlWdB4WDw/O63xdJQFLe87FEH4djeYAyDTaiDOX5LvwjBko2HcP8sFwaYLAYTlMdccOUs8t6t6teWhAUBn3+F3jJrLDRfvbg+wsf/k3EhY+2a3be67n0KI/iexqHDye4gf/8xcU0BqES7mLXB+fJRn0Oznk9Pdyflt66WWh9nEjWMoePoNpUwLxNLuNRXxI46g61PSl1/uvDuf09NFPF8pb6TkLuVV4pd/d0eUD/oct/qctcySSIxRCNDkBE3L6ORGm280eA==
Received: from DU7P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::20)
 by VI0PR10MB8815.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:234::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 09:16:28 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::88) by DU7P191CA0001.outlook.office365.com
 (2603:10a6:10:54e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 09:16:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 09:16:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:21:40 +0200
Received: from localhost (10.130.77.105) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 11:16:27 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 22 Jul 2026 11:16:13 +0200
Subject: [PATCH 3/6] ARM: dts: stm32: Use DMA FIFO mode for all spi in
 stm32mp151
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260722-spi_arm_stm32_dt-v1-3-6ef611523232@foss.st.com>
References: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
In-Reply-To: <20260722-spi_arm_stm32_dt-v1-0-6ef611523232@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<clegoffic@baylibre.com>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.15.2
X-Originating-IP: [10.130.77.105]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|VI0PR10MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b49ee8-1704-44f8-16fb-08dee7d1e997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /nGGPMW30yyxBpHbojajv/9jeVvyDYUtgtYDrrPXZ5QUzoTYZoE6CFlV/IIYkPHzp985AY4t77rRJaBobyY0WWKvbLP04gy4PuymivwZmBcp95TvMyVFldYSmAzQ5Jz0YslNAtqUXSOF2q9HCcfI8Dir+INIUHruJOKeyIaJacbdbYXkc1z10qsdCOkSGPgS9Aw0S48qygzWUbQ9As/l650qqbD0wAra0yvGrvlYcw3YugybuXdZ3oANRf64spa/1oU66VG7YpM4O++2XM4kBHrqehwEX8mdXymD3RDNN9QITF+CEH5ndziHGDsTYszCVPvHpLPIp3HfSMZHkYXcj/LXAzGpE88dpnYCDvYC5xNgDH/AQt53aUNCqvfgOH1WMutHl1QulSWuH+6O8ZNgMEk9bwk7SVZh5uoWlJ+VPE7e3QTu31Z3vh2qKALCPHwbxd+6fkjKFToiaEP1LPVBH0lNlKylG7aBLOMzcQN15ksiCEHaVQKT9hO4tA5Ksbzdk8rfZbyoygKfLUyot8pg71nlaJ1AHAYYJNfI+CN06XyORlSf5Qnda80Zs2gvfOo9pFTv8t/2eGCwltPcxNOsjJXdHJ4+ced4PDyb0bz4gGdaJrpSWgV/jRKeg88636Lyk4ZB2uuyZ6sHCxT4c7raVBaIgbPUbu/7S+2+ckdadiRnUHhIiBxuhQZtNFctBydd6gvgdm2IyjEx+9pVyHv0og==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HsCPn1Y+2PKLurWi8mq+Y/JpqMzySwTo6+pByKxHkQIN4pUtrMMvFv0rcP/iwCtvgTFbmlwwlleN1EdPQbWRV5qVkQL4eM+E8ywFQAcAnv7z94+Kk6a5b4GHK53sn5KBJUo+Sh+riDdpMeKpf1EjyPP+YElSak8oNvCv2NITwlQrTLDs2dHbciBKkhbaV3z3+I5NN05+3Jn9unMHojzzAsaLXl9Jj97twg7YSRLqqL39nOXBPbsBSKjgDTWN8FK4j0FGkjg6Td4nx80e60W3FRBBcl2Gw8orErGrHg+O/YH2MkFOoP+QbXMyVVp5eUlDzbwG2xjQJQX89NvLr6f6c2FFYJBvj7oyjukFb3+4X7Fwdue3FELRRmtHRy7dxeLfFlC2mJlSAh1OEwaEFl+nU7Tdkqq2nAIB0MZuG6L9ViGR3NgfJ9v5f6R8dr0eQtUw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:16:28.5219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b49ee8-1704-44f8-16fb-08dee7d1e997
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_101636_634174_696464F9 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

When used, configure the DMA in FIFO mode (instead of Direct) for all
SPI instances of stm32mp151.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 84f68e8563d85..e7fec8b49ae16 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -943,8 +943,8 @@ spi2: spi@4000b000 {
 				interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc SPI2_K>;
 				resets = <&rcc SPI2_R>;
-				dmas = <&dmamux1 39 0x400 0x05>,
-				       <&dmamux1 40 0x400 0x05>;
+				dmas = <&dmamux1 39 0x400 0x01>,
+				       <&dmamux1 40 0x400 0x01>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 27>;
 				status = "disabled";
@@ -970,8 +970,8 @@ spi3: spi@4000c000 {
 				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc SPI3_K>;
 				resets = <&rcc SPI3_R>;
-				dmas = <&dmamux1 61 0x400 0x05>,
-				       <&dmamux1 62 0x400 0x05>;
+				dmas = <&dmamux1 61 0x400 0x01>,
+				       <&dmamux1 62 0x400 0x01>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 28>;
 				status = "disabled";
@@ -1301,8 +1301,8 @@ spi1: spi@44004000 {
 				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc SPI1_K>;
 				resets = <&rcc SPI1_R>;
-				dmas = <&dmamux1 37 0x400 0x05>,
-				       <&dmamux1 38 0x400 0x05>;
+				dmas = <&dmamux1 37 0x400 0x01>,
+				       <&dmamux1 38 0x400 0x01>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 52>;
 				status = "disabled";
@@ -1316,8 +1316,8 @@ spi4: spi@44005000 {
 				interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc SPI4_K>;
 				resets = <&rcc SPI4_R>;
-				dmas = <&dmamux1 83 0x400 0x05>,
-				       <&dmamux1 84 0x400 0x05>;
+				dmas = <&dmamux1 83 0x400 0x01>,
+				       <&dmamux1 84 0x400 0x01>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 53>;
 				status = "disabled";
@@ -1432,8 +1432,8 @@ spi5: spi@44009000 {
 				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc SPI5_K>;
 				resets = <&rcc SPI5_R>;
-				dmas = <&dmamux1 85 0x400 0x05>,
-				       <&dmamux1 86 0x400 0x05>;
+				dmas = <&dmamux1 85 0x400 0x01>,
+				       <&dmamux1 86 0x400 0x01>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 57>;
 				status = "disabled";

-- 
2.34.1


