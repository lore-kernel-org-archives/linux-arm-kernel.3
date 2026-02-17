Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B39E9A036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0AdkHdlH8x10dXncHHYDtwK0rBVyA/j0o4uymvMJoc=; b=mpCcxY95+k4S89d15H0s3CNN1C
	ig+O3Bh/ly8anzAihjjBK6tTF5L2b1uCk6DIgeyxci1HxK2ru+mvYSKUPQJN0gIf4A+upWNxjfzrX
	WQwkBXahfMFADBKCwZEvrCVIck9upj7Zs84lhWNPvCLgGWn8l7sREFYEDmJw5NK+rZ0XGF8FSKWAn
	Ee0yGVSXLJ0rmAOD4GQbrgr0aIbFE3Vvd8nwOA7M5ex7fhu6I7gS2CwHbk2JWQdHY8+gVmURVyL3O
	mciO6wfrsFdDNftJy6bsHo1vv4903T/EzGr1EE/lEg+FUm8GPPIO1tFDcfBAYgYnFRqapkfx/qR96
	b7GHfudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2p-00000008kJE-3q07;
	Tue, 17 Feb 2026 18:43:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2l-00000008kFH-3bDd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48375f10628so27015895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353810; x=1771958610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0AdkHdlH8x10dXncHHYDtwK0rBVyA/j0o4uymvMJoc=;
        b=R6Bu8JmbvxHAX+ufbYqFtGDSOKmgqgJf3KsFylczjihzlWfZ90ATAzh0hdT0jBr8pW
         KuGLihSlWkfJ4KDbFZKvDYlUOP59xWHvQchD/aEuY9ZMjHo/bgCmteO4whorRCwl8dMj
         dsV+vbR3SCF+UCrVLLjpG2RFqkRppQFSFPMKMNo1Pp1h3NdzxRVEuZyn+6JgEaLffGc2
         ViD2dC5gBA02nOH5RT+UlHvTHpC88gWkKTt+cxY5YHeuhHTJgZ3Bgb8yVIextRZiOiRJ
         MU36yHoE2+LI5EzctLxCIEkcFzkcoDAxsBw7j+kZepBOealtcAahmBRITctfwLMaLbxX
         gOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353810; x=1771958610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0AdkHdlH8x10dXncHHYDtwK0rBVyA/j0o4uymvMJoc=;
        b=oKumkiF+W4KvOHDZ1cP/eKfo0dzOsV+1GGz0FEqDGHEe/Ez9/3wFFx1FzIm2p3jsWR
         MwgFaAXHNG+mn2GC8o3uSO5PqflWzuJsRMYlgt8QiInvXEsvCLiXkXEgjqhb7EZjgn7o
         w8qkDlQySf2GH4gRYWHV/235aw+WF/Kt9T2jhb0tlVvnBkWipRDTUntQtBVhyqFEMlHb
         l1FUhQZTSTWDQL39JQfb4uhup1mdzKZrOQMDlmakHxuBNLarKhQL9aluyCjPYUVqw6sh
         zULPpKXbvN41X2Q6PxCTcfzCPOsnc56+q702EQ73UC/OC++egB0a5BaJJCzkJe7YR2jP
         4CzA==
X-Forwarded-Encrypted: i=1; AJvYcCXL9MkWCded4tDErRoRPfz+6OCimQGqYpIUDLU2qghjFfLnmC97S7zoCQnvDC77zqAXwgav/I+DBI4nP9Mo9Ea1@lists.infradead.org
X-Gm-Message-State: AOJu0YzHhW7A53pJLjXVJkBFmqMxAwFFhbhVrbcYtGLLJHHdKCNwQUmx
	XHvE4/G3TDupqH7VSoSlqmWpqyGfE8tPEyFaWAGk1dc4HLqO5E/TvnEx
X-Gm-Gg: AZuq6aJ0MkRZJCsDktKoIvFf147w7KpGGRUW4CpJGi9R2UC3zsIdCVorW8HC1bfmPar
	hsryOu1Xjsb/QTD555pkU/q7lvPNzfWfB76SzlOL7P8gQbzwC7SECraQ2boSylWIxh/Ytqg8AkK
	mfXOX3DNh1AoMVHlvMo5zufXQ5OyJAAtxIpBTJtJDf/c51qUoYuYfUFO4Vd26egYN3buHayeNBq
	LHPWDYTDROt2bVZqDKscnwRqsUvEQBilKSCwsxz7RO5tHuL1DkTKEYPzixUJmMTew842zJJ24sL
	1HL2QlMtSUGjPmcTGuzKWBBklroHA+bOFI/YsEZ49SEgF+6TmdJgdqMu07uGXZSe44nLGnSZ3Jd
	M6bvmkGlhHBk4MaCsLLPFHJ6cPAETxWoNDf+xIiFi5saE4PCxKxvbMmSpJss6GSIDjJvS3UEGC+
	n0ae1ANDZMALVpj3Bt1K6SoAM06zi3C6eHKLk3AbTx2bbxi3EnHT3NmYBM71Rp5/yx17K7c9PgZ
	e5APQfrQdgGRUxgKhzDiaET2yjFjvBCbAGRsusiqEfLUM3jYic=
X-Received: by 2002:a05:600c:1c12:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-48373a02cfbmr289063715e9.9.1771353809715;
        Tue, 17 Feb 2026 10:43:29 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:29 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 04/11] arm64: dts: imx8mm-var-som: Add support for WM8904 audio codec
Date: Tue, 17 Feb 2026 19:42:38 +0100
Message-ID: <8d437d36b24d184945c478fb727e93ffb0719c91.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104331_924003_D88DC623 
X-CRM114-Status: GOOD (  15.62  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 101 +++++++++++++++++-
 1 file changed, 98 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 23045f54e00e..e52080490ddf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -15,6 +15,14 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0x80000000>;
 	};
 
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_eth_phy: regulator-eth-phy {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -32,6 +40,34 @@ reg_phy_vddio: regulator-phy-vddio {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai5>;
+		};
+	};
 };
 
 &A53_0 {
@@ -277,18 +313,58 @@ ldo6_reg: LDO6 {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
-	/* TODO: configure audio, as of now just put a placeholder */
 	wm8904: codec@1a {
 		compatible = "wlf,wm8904";
 		reg = <0x1a>;
-		status = "disabled";
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX8MM_CLK_SAI5_ROOT>;
+		clock-names = "mclk";
+		AVDD-supply = <&ldo5_reg>;
+		CPVDD-supply = <&ldo5_reg>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&ldo5_reg>;
+		MICVDD-supply = <&ldo5_reg>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+		status = "okay";
 	};
 };
 
+&sai5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai5>;
+	assigned-clocks = <&clk IMX8MM_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <1536000>;
+	#sound-dai-cells = <0>;
+	dmas = <&sdma2 8 25 0>, <&sdma2 9 25 0>;
+	dma-names = "rx", "tx";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -433,6 +509,13 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18		0x1c3
+			MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19		0x1c3
+		>;
+	};
+
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8		0x141
@@ -451,6 +534,18 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI5_RXD1_SAI5_TX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC		0xd6
+			MX8MM_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0		0xd6
+			MX8MM_IOMUXC_SAI5_RXD0_SAI5_RX_DATA0		0xd6
+			MX8MM_IOMUXC_SAI5_RXC_SAI5_RX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI5_RXD2_SAI5_TX_BCLK		0xd6
+			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK		0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
-- 
2.47.3


