Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C608FD006E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezaKcTCwxvc8WCNj/aHK68Tu0GeEJ4didEw5cUNO9nQ=; b=2LJTVI7+fVlZGr0BGRj2G7GU0X
	geUVQbdXD0rKpTUG0ADhzs5SolOgJwLu3FLTNeo9i7bPlUevmxsv3xQbB9uK4NbZhIX7v/VYW1v8b
	K/b0NG0xlQgA5bayKi1fizOjQEgCYUo559OEkbTXF80HpbSX/1c6T1keM4D4AmTe7/p88nm+78Po0
	xsAHqL4JHVj90pCglCw+KIk7iqNOpnAB0SDiRrQayAM++rZL7jHPgBquZxjk1eiVwHg1jrVPimInk
	OGPnXYeXebiSytPeDqG5SMg4+Qhj+pR7Ek9qBIfHYWZXqR0joL0bT7LYgX+2C2Is/TZ4ofWtVIiE7
	telCKIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGV-0000000Gghn-1L77;
	Wed, 04 Mar 2026 08:07:31 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGR-0000000GgfS-0aQC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:07:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCbPMe9yUJSaBlje+MSm8kBerxW2bsBAHp+CFND2xjpdwX1thS75NZE35MYwm4ihY11Z35G4O6UK+Qhcab5+OrI0QGb9ChWOZ5LDDo+F9n8bVg19qkTM0dOwfy/Orrkd6PbbEp72wkcyevJMBXIDSn6NkT6g2eSLo7XtgEs0EBAlXF9f3ZBxWg3e09+1DgJOBJtHr4OXKGM06NoelvmuB78k3eKXHoQGcMjFKg1XUR3s8zpjyCSqpLE7yFTEB+17jwEUIL1jxgtauolm4EYdHMtbUeiyzKkTn2zxHVSmP5tiiLmN/FWME0jhno7x7nXEW1/uOeE2MCyHVjeUXZIHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezaKcTCwxvc8WCNj/aHK68Tu0GeEJ4didEw5cUNO9nQ=;
 b=do4BYEydoO3rsu63s72Pvf3/HkpvC3pxLMRuCXWc+5xEeifv8cQTdIfl57EFiABGJMTICvM9I0hNL/+NcWDlAUJ0N3MnUCB7pfsaIA+o0wKvxuDRt3ZxTwxVh57/xyh+ZCNtCl9HOY2p2E+TksEKDY8GgUTA1ExyFE4jFpy2un3twHw7ek0DMUefYKQUeeI8XvDxGOv6ad+NlTqikYN1wWuq3OWfizcX9bddrAj/9oTDfJY5NBg6sv7V0woJpj+u7JqRbdIt7lsVNu/Tf668/dke/IcKcFMA9mJRO133rJVLlGu5GBGBGIil6qntvhkS23JmhrYkoZwxOdwaP3ELLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezaKcTCwxvc8WCNj/aHK68Tu0GeEJ4didEw5cUNO9nQ=;
 b=FIFtAg+j+ZNnoyH3jRlG/IuxohYIbQy3/VvWMvg2rfproK6SnukHEFC/4WgrW/zFR3amQHGbbEi5LE1FsZTR+8W3Bvzy4ExPq11ouFhhrPc9o5SXEpEIvCgyBqSsKabsRGlXtCqNO94H+TU+Fm8JKuaCIZOlgi9jb0zEdhNB0R8fw3rLUsa48oAdq/1EYoiw+jz3mr9OnQuMn/jy+eqDIQMCqQvUXJ6KYHaBjDD6D1BeFNGkC8ZDNHWTm0x5+Gcd0iKqBtISYdYyo8YP5PwBT5euuDe3djQ+m1+DzQtKLXGezWn7/EK+fvqC2kibTy+abyFHUmRkKcAu0/UZvETrSg==
Received: from AS4P189CA0011.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::12)
 by AS2PR10MB6349.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:550::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 08:07:18 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::9) by AS4P189CA0011.outlook.office365.com
 (2603:10a6:20b:5d7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 08:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Wed, 4 Mar 2026 08:07:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:09:40 +0100
Received: from localhost (10.252.5.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:07:17 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 4 Mar 2026 09:06:59 +0100
Subject: [PATCH 1/2] ARM: dts: stm32: fix misalignments in nodes of
 stm32mp151
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260304-mp1x_alignment_issues-v1-1-19a8013782a5@foss.st.com>
References: <20260304-mp1x_alignment_issues-v1-0-19a8013782a5@foss.st.com>
In-Reply-To: <20260304-mp1x_alignment_issues-v1-0-19a8013782a5@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.5.222]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6C:EE_|AS2PR10MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: fae59708-48a5-4ae2-2bf5-08de79c50ded
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: MLYUS9yU9WfjMPqTB8zpNxuBle1FjW7NA5UfO+/hj4UTTdfQbInIZoVo9ECcr/aLOe1PtgU91poXyZp87u5wzhEpgye/btfbf7TZTEq0WUoRTqd6YdGzImkcfNylT+SJnoTEDWa074X2UunoZZwF2xA2tj2RCWr6moVtkeLIBqMOv/Bu666Rn0Ntwt4VWwDBQG6kGYcYEllVjnbjcVbIXMlMtmafrRGWro9O/PyjylXIDreJmbMqt2PkTFRIX9yGto+cN0pC0puIo4o5IgFbXHMZBcJ2NF/1peLPqmz3Vkh5oeIZWAnR+xuURZZbahMqRMOOheymClZn/DDD3w1G6/Np+kOiUvujb8J+8nCC8cqbKFTmklfLJywRP8RN0XwLD1VzVloKKl4f4ifbxeL9ESHqnZKIe+GvDWRQxVMnQngoyOmD2let82brGTDQqWKe/WSk0/cmQ+W6DPxsnKKliPIaHQZmICobQYY+YvYMiJTxhWWtnfBKizj6CaLivS6at7EiGospQgYhxVoRVElJbW9KLdGaox0PNgJ7MvKYNNkEYfoocnwLJIwCTn9fQJWiqFshCEBlZkrsuV9dRUMKaJN0RrmMHEyUrX+MkJ4QRpSo86gN1uNZ7cAAZsJj3MTpAbAgxYUxKOT7bxMDEXuPwqhOaYtn7TAPBoPh/Yn+QkNjUToGc6dKUeQ9OW07nRVShdg4aI3TeLac33ZjLcRFWIJsmJ2JTec5cgKOIb9Q8x5FbbZizlff8hurTNyXCUA7kPeqCQ4Q/3rXJzyygCLSdw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V1LBcNn1+WboRoRbYGxYeL3Cv4T5qDE5TlXabuhIWjh63vbCxBotdL/zdmLHwkzitJPiii4LPvNlXJvaJQ++voIrJYpuO+1WI9qP1vzMnz7CwWTVg+Mk7lTpW2AqAAdEXEiynuxbCLjjLK466O+YIqwSMEKBafgMWfdQpGzNarGJbLjhc7VhB4V8z1JzRNhfUkjoiN4kvHYVpXecckLPpi7W3RbmYSd0lzwxkij+iXQGIVJhoagdYlh6ASMii7ULP+UaofsAcYNsRlXhZldGa4lMZpzYKAyEYhLoGMvFaDOHMy0Zh2zpve1InmFR58gsy8+LtXr+c2+jqLcfPWc2Mnxa27NiT5N73ny9WAYqrr1St1L/DmauTfoczxTsNSAXLcQh/w/GAtve2gzDf7qdRiWF6FjQIexATdtE/wsnFIjvu0N6+kbXYH4ceaL/A6q7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:07:18.1523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae59708-48a5-4ae2-2bf5-08de79c50ded
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000727_196541_514E5AC6 
X-CRM114-Status: UNSURE (   9.80  )
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

Since the ETZPC system bus was introduced, misalignments have appeared
in some nodes moved under the etzpc parent node.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..fd58bb700f6c 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -1083,7 +1083,7 @@ usart6: serial@44003000 {
 				clocks = <&rcc USART6_K>;
 				wakeup-source;
 				dmas = <&dmamux1 71 0x400 0x15>,
-				<&dmamux1 72 0x400 0x11>;
+				       <&dmamux1 72 0x400 0x11>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 51>;
 				status = "disabled";
@@ -1095,7 +1095,7 @@ i2s1: audio-controller@44004000 {
 				reg = <0x44004000 0x400>;
 				interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 				dmas = <&dmamux1 37 0x400 0x01>,
-				<&dmamux1 38 0x400 0x01>;
+				       <&dmamux1 38 0x400 0x01>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 52>;
 				status = "disabled";
@@ -1110,7 +1110,7 @@ spi1: spi@44004000 {
 				clocks = <&rcc SPI1_K>;
 				resets = <&rcc SPI1_R>;
 				dmas = <&dmamux1 37 0x400 0x05>,
-				<&dmamux1 38 0x400 0x05>;
+				       <&dmamux1 38 0x400 0x05>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 52>;
 				status = "disabled";
@@ -1125,7 +1125,7 @@ spi4: spi@44005000 {
 				clocks = <&rcc SPI4_K>;
 				resets = <&rcc SPI4_R>;
 				dmas = <&dmamux1 83 0x400 0x05>,
-				<&dmamux1 84 0x400 0x05>;
+				       <&dmamux1 84 0x400 0x05>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 53>;
 				status = "disabled";
@@ -1176,7 +1176,7 @@ timers16: timer@44007000 {
 				clocks = <&rcc TIM16_K>;
 				clock-names = "int";
 				dmas = <&dmamux1 109 0x400 0x1>,
-				<&dmamux1 110 0x400 0x1>;
+				       <&dmamux1 110 0x400 0x1>;
 				dma-names = "ch1", "up";
 				access-controllers = <&etzpc 55>;
 				status = "disabled";
@@ -1209,7 +1209,7 @@ timers17: timer@44008000 {
 				clocks = <&rcc TIM17_K>;
 				clock-names = "int";
 				dmas = <&dmamux1 111 0x400 0x1>,
-				<&dmamux1 112 0x400 0x1>;
+				       <&dmamux1 112 0x400 0x1>;
 				dma-names = "ch1", "up";
 				access-controllers = <&etzpc 56>;
 				status = "disabled";
@@ -1241,7 +1241,7 @@ spi5: spi@44009000 {
 				clocks = <&rcc SPI5_K>;
 				resets = <&rcc SPI5_R>;
 				dmas = <&dmamux1 85 0x400 0x05>,
-				<&dmamux1 86 0x400 0x05>;
+				       <&dmamux1 86 0x400 0x05>;
 				dma-names = "rx", "tx";
 				access-controllers = <&etzpc 57>;
 				status = "disabled";

-- 
2.43.0


