Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7236CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkxkko4ftqDaHo/izTn9QHmIISRTtfMp02w5yD7lJmA=; b=Bo2Dnm7M2R0lAcneppvkxMXyhs
	FnXhULs0lFI34EvFarEjVUNWJTSMKUeZWvYGu+CmlCgZwLNAkzjeD/WebpTi5lOpI9OICyNj5VucB
	UhbdZkIO+PiNy7SWLMv8BRB0T9jqW6Cwfo4BGgRb0cdjAG8hQq8T1OFV9HeYBZ84zqvJFWoqf5ci6
	EfYJYOKYYO11rX4EozoL2r2UtOIQX+Wt0NqKxIoXOG20jg7a+sQpxSW0n1rbAlrLDGzj/utMDKZr6
	RFPMn25VEom72vQCCVT0zssMzcT+PSfwI8rxGRPHS/ARI/BKAIWVgP6Rab4lXNrxgIDgiaK7Fhtvp
	k5Jd7rnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo3r-00000001V5b-1Bg9;
	Tue, 26 May 2026 09:26:55 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo3o-00000001V3n-224i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:26:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABy2sEVHip9zK0wKUMZk3RmqXdJ5iCEYdbxiwuZm2QadY/VNq42s13eYGA4JAWp7TNk8NwYLebPOCFR3CnyVFCkr5sMHmkRVNIZrIO1igBROcSrudb0lBYmSUtNrVAbpoZMMbIl6rRNPb8LgjCF2/DdbJWE7OLRczzWue/BHB1GxdGNxnWTrKuGdmaCxMm9n+uMeVMW/SyAOL8MCvUH/s4fWv95aePFu3QAfvHuFnbadOIxasNkD4huCdqEkaLEd6E89r69yWAjfiQChQgEGbUeXOY9EWaYSnjXrKX0It2TxcRgvtXfB652qBmm+z81+XplpIUFJ/0U25mR2qrXsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkxkko4ftqDaHo/izTn9QHmIISRTtfMp02w5yD7lJmA=;
 b=HWnNZF2a2GJ+kAKj+Wr/NpWygsfkOBSHpyWOf/RUOJLwS3nekAzaBwBHi2ieAHMmsWu3e8BM3Y443c3XBVesEf+B7mdgzgSWc+AHZ6Cfr3Hlc8l/zbin0IYwtcOHlz3jPpVRLoewk2IWxA3/VVi6hTCMDMkLj3dpNWnVIO1/g5PlT8qfNo3+LDp6C+lJznTA/igmCl6A0Pkvb5UUVrUM7Pec1Aln8ZO+74cKXo5NG+yXK6h1H3Nw7RZY95khAq25y0iSDNMDgrIid1L+G4T05IApdC11OMwoeSWzd6ZS11sCRdw4u7VMmWtrNA2us+JYsMBOSHkNe4VJw149DBSyKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkxkko4ftqDaHo/izTn9QHmIISRTtfMp02w5yD7lJmA=;
 b=NjWPW1z+7lDlZ+C77PKW69K4O+nW5vqYeWrR7DBFygjRuvKiMjDnSAaSAqWYHqZQTwmXhrvnmGgPcvof3K87m8y6UKQ4c4NncRomOkvf5RxaB72EN6x4oE7K1h1ghQvlMQqmlfsnhm3BfcU6QHqYY1CD9D1sX0ZehZsTRB9ggGXsvwDx+nVW7BrUNc0dhgWw1P0XRMmkvkEmItzLBl8WaBPyZgbjwl4VHi0dWKT5WntgZJxejMbkQsrSsWasoh25s4YIXpDqJSEjCp1HWQdcURmnOJXBWjJcfKnoM9BSbm3NxZXHEXIcCSiBsuvyAn8siS/u76vAVQNT86iLf47Amg==
Received: from AM0PR02CA0177.eurprd02.prod.outlook.com (2603:10a6:20b:28e::14)
 by VI1PR10MB8207.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:26:44 +0000
Received: from AM2PEPF0001C715.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::93) by AM0PR02CA0177.outlook.office365.com
 (2603:10a6:20b:28e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 09:26:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C715.mail.protection.outlook.com (10.167.16.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:26:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:30:49 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:26:43 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 26 May 2026 11:26:41 +0200
Subject: [PATCH v7 1/7] ARM: dts: stm32: Add boot phase tags for
 STMicroelectronics f4 boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260526-upstream_uboot_properties-v7-1-e17cd424d5db@foss.st.com>
References: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
In-Reply-To: <20260526-upstream_uboot_properties-v7-0-e17cd424d5db@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
	<cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@dh-electronics.com>, Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C715:EE_|VI1PR10MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 382f74d6-2b11-4985-ee16-08debb08e736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|3023799007|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 46xvISFI771ox6f7Py5yWRPF4C1t7vdIA9rzC84Qw3NnzTaBIEat0vwzsBbQjj71+4BJDyBmt+TtbUp5BuAHC5SBat+fFt9A8t4RnY+lCWxeSKDH6/XSW9v3/dORelwE9csQ169AlxvdJzwjEuHxm8Vy5O92bjWzz2qxq4QNid7Fz6LieyVo7KFwVu9CxNVEz7Y5l2p1XP8/sQAzZZ/Ij+FQdZHY569EeT3HrABA61w2G9hUFnhrJlOz/QgzK1nUurp81apRK0VX+8TWikkXrbZfxpwDwRdK5hvuTH4/9nL1xQKzkpKs3nJr/TvAChNd8EDXR1iECj74dJ7e5Z0l8pzXHZNpHxoPNdFMSTR5mtIf0ry7qFXlG7M3C0iDlaABwk+gEvB/XelUqXPU6iubVKiutgg84zSwgTNLhBWj+ul9MrgZNYKmXRgqhEGyTmRPQMGcwvhy3Ss+J8QADcyYzBUo9Q5FXmYtfrHC23wedJ89v2v0iM2cHx5UxOaP8Q/dlBsUid0n1uFFLRt/+oP++KdngoIY1htWjeOwNzBSTGAhcA8w65EYhuk4EzLuTbj/ReA7myN3o410P6KXd+xlXFmxy4FXqX352IXgUEx1zSxodGEFOV2lmniuNgYHwsjp+pMMf1MOjggSMc2x9Kr9oCmIe0OirgS+dB2xiQGbh054Tbj0bl67Q8kbP7Hx5IjCHN+ZcEDqltOzox85yw8eHsbm8ZgH73O+iGm7Zov7Qeg=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(3023799007)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7YNneAwk/uG+QEsziHrsnV4ouHg3uBnTqisg/JHMNtDpH2pCDW2mTs85n2DU/4kMgGvmHNbgJDXfYGR2OIVqYfSVjGtWECVmbLw+5cReXswFa+NJrRr6AqNBxqY5V8UwYDWfoJmUgUDivAYFr+u1VY9542q+y0ZPlvi1iYOreNJ+3/aDO1s6gUDNIeFP+6sJZEybqnTnURsXvCM8xmr1KRXQnsnw/RrLeaQ1N5wfkeMrRKVrBgZOMEH4P/wZug/S/vqMFzJcu8F5IzHqILaRI2nubOw9Rk6tIY4Uu7KqMjTH780bTEIo9IS29nEx61JwSDj8yoJy6vzXhsvrRpC+e9FO1Y1TqhOdDsLiZdFUW1PWhYtMI8gRFEeVdT1ZOSQhNEF6Q5Mfn6bhKkfluAf3WG4zA6HqQDVbv7WxeeAyrgQ5X/BLcLr5j/PvLEAbpcft
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:26:44.5519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 382f74d6-2b11-4985-ee16-08debb08e736
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C715.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8207
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_022652_974623_65F775A9 
X-CRM114-Status: UNSURE (   9.30  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32429i-eval.dts  | 80 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f429-disco.dts | 80 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32f469-disco.dts | 72 ++++++++++++++++++++++++++++
 3 files changed, 232 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32429i-eval.dts b/arch/arm/boot/dts/st/stm32429i-eval.dts
index f4b1c4eb64f2..8a08b9f6b837 100644
--- a/arch/arm/boot/dts/st/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/st/stm32429i-eval.dts
@@ -188,6 +188,15 @@ adc3: adc@200 {
 
 &clk_hse {
 	clock-frequency = <25000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s_ckin {
+	bootph-all;
 };
 
 &crc {
@@ -209,6 +218,50 @@ dcmi_0: endpoint {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_pins>;
 	pinctrl-names = "default";
@@ -278,6 +331,18 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
@@ -293,6 +358,10 @@ &sdio {
 	max-frequency = <12500000>;
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers1 {
 	status = "okay";
 
@@ -325,6 +394,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -339,6 +409,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	dr_mode = "host";
 	phys = <&usbotg_hs_phy>;
diff --git a/arch/arm/boot/dts/st/stm32f429-disco.dts b/arch/arm/boot/dts/st/stm32f429-disco.dts
index ded369abee4f..047845ab3d5f 100644
--- a/arch/arm/boot/dts/st/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f429-disco.dts
@@ -113,12 +113,65 @@ vcc5v_otg: vcc5v-otg-regulator {
 
 &clk_hse {
 	clock-frequency = <8000000>;
+	bootph-all;
+};
+
+&clk_lse {
+	bootph-all;
+};
+
+&clk_i2s_ckin {
+	bootph-all;
 };
 
 &crc {
 	status = "okay";
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c3_pins>;
@@ -176,6 +229,18 @@ ltdc_out_rgb: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	assigned-clocks = <&rcc 1 CLK_RTC>;
 	assigned-clock-parents = <&rcc 1 CLK_LSI>;
@@ -216,10 +281,15 @@ panel_in_rgb: endpoint {
 	};
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -234,6 +304,16 @@ &usart1 {
 	status = "okay";
 };
 
+&usart1_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_hs {
 	compatible = "st,stm32f4x9-fsotg";
 	dr_mode = "host";
diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index 943afba06b5f..ecd33d6003b3 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -181,7 +181,52 @@ dsi_panel_in: endpoint {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
+&gpioj {
+	bootph-all;
+};
+
+&gpiok {
+	bootph-all;
+};
+
 &ltdc {
+	bootph-all;
 	status = "okay";
 
 	port {
@@ -191,10 +236,26 @@ ltdc_out_dsi: endpoint {
 	};
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&pwrcfg {
+	bootph-all;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers1 {
 	status = "okay";
 
@@ -238,6 +299,7 @@ &timers5 {
 	/* Override timer5 to act as clockevent */
 	compatible = "st,stm32-timer";
 	interrupts = <50>;
+	bootph-all;
 	status = "okay";
 	/delete-property/#address-cells;
 	/delete-property/#size-cells;
@@ -252,6 +314,16 @@ &usart3 {
 	status = "okay";
 };
 
+&usart3_pins_a	{
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usbotg_fs {
 	dr_mode = "host";
 	pinctrl-0 = <&usbotg_fs_pins_a>;

-- 
2.43.0


