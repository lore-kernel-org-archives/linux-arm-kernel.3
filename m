Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6413109190D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRuhOxXG+BRUmsxT9+NWnppBH4O76RAmFQCZtJj6nds=; b=TBWKD7bBG9//vYJeoNFwmKBCgB
	DrwVCxB+jvC8UFLnAqmnk3xPHHSZ9w8scLM3rUpoaK1290BKLY2ktI0+OQN1ewQ9kJh8Tm80ETJuS
	QcBhXqQkgXvEYnSm/W0d1v2gW+G1WPigyMV3RfmvG/LPaS0/2PkEVgQmx93dF7U4G3kwsRa/duFui
	cCiMCTa1oNNNeA+x60mXO+gQMRGwvPFdl3O+3g3jeC+1w/Zetpb2bhKl3GWYDrc9+SRM3zIL4iUgK
	ThOp7neyqx3C0LASapAQwOnJCsbY2yIIMS8MOIjiCdYzEIf3+0uhB1QNQhPnw4/aigTCdL5JoIr7A
	pN0krmDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJi-0000000BNLw-3uLT;
	Thu, 19 Mar 2026 18:41:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJg-0000000BNIL-0zRB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-486b96760easo14049935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945714; x=1774550514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRuhOxXG+BRUmsxT9+NWnppBH4O76RAmFQCZtJj6nds=;
        b=H3BFKZLetVTyZ+O/A88KouER+uq09iPtJ69uDbsnejLaljwBJtBQzz15xpmoyfwXn+
         ZNRsvIS6q0B0CzF8EWNmcrQ2I3B8fWeORLS+3uRxV+6Xvrwmspn933YW4/7Fu9JJ7kei
         jj3Xt4Okrdybw3RxpjvJ23QuEohvnXvDLgjfL7P/kQCKNGDk2xtEzVQb/c955dUuYvUm
         VWvW6vil/QgKLYrRgdNeh7MiIsureak6eUFKB2v4i0Bo5Jt7YIAz/R3nTUU5WeBzCZi0
         AlG/133vhzda3ofIT9jKHaAWjUWfq68svXQQbC7JI8H8f8on1aY6gAT0ZfJhCLtQRO47
         gljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945714; x=1774550514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jRuhOxXG+BRUmsxT9+NWnppBH4O76RAmFQCZtJj6nds=;
        b=Rtsj2pG2vmPzQWLodvQ1EPlHcynT3JMADMuv2gk+yqQO2zj5Mcn3TK8M6S/DuF1PJ2
         Det1EQ2aEqZkAFdbG5iNZnVd5ZD+brzzWafJc0s66Z1UDoHEuroToCEvuWg1/TQPKXIG
         K5FLLW86aaLW6iKwsM4yppnklaaldh672+rbS7cyRbmMcKLCqFOxiLr4SuF/H8Vd0JUe
         iCmlKQL8xUJUU4SMUxYni8Uw83Q4kLAAj12BGLlfxspc+uKDEpEdaGsrniV8JOxCujT9
         k0h5rrCsf3jRGLYxJMfQRYVtq/rUgptK4IrMasoD/39M1v++yjuatkMaMT7GHu/lnyNR
         idiA==
X-Forwarded-Encrypted: i=1; AJvYcCWQX2Q30wG+zyYz8bVSOUP/v75H7y+gK7UbbpfqY9iv3EC4mnxs4upJ3OspItdhSGG1qQjRmo7Wx+0IYS6Xv0z5@lists.infradead.org
X-Gm-Message-State: AOJu0YwM88LS332H1G05ij0viuw/DtXo6sjzFJp0nce4ZqWZKWRRH7Os
	1ldLWO00qHEO4TfMqUq9fetNcqld9rAZh+dXbKFZZWvHEnLhZZmgIX1G
X-Gm-Gg: ATEYQzyTCXPEeARgALhGLMwp1Y60IMMNGwDvNmYttzAFrL/o4F4nM96r7whQ8Xl1Rg/
	I49mKpc5wQretXSkK8G5N9gAy5Mdi5+KiniFkh45pyxCnovF1VN+8hwNjGGY6denU1nSlJMIzux
	YPfHE+sMhQgb/UM9TGNRU9MYIG6oDUNuEulUaFoOpat6v6yIzIhz9zsFI4V2Qypv0fx2bYW6swF
	Hc5qZdDYtct3P4h7MGUqaNV0pliUQxWP7SKoN8ubEBY2Y5N3JdIfX0Kwu1UUbiZQUwMtTH8djRq
	0tmjMT+Cz85McvBsqcFngg5Jm1rWRDxnoZ2VpapykHWTqpLTufvtIopMKyZTmMRtm3jitBzYr3f
	Ko5n7i5eomh6xNDuTw24HLm61YqZ7n3LV6fDJDjb0pk6Rf30AM+puBwcZBQYFuBW6hWDohLe1q7
	jDbjWWTAQAQMXn/NKBWrKBBEu72F37JJsPi3/AfIi8gUjyFd9cLcBPwlzwO9kcupB4Vt2odWdMY
	kzw5CjHmnPXCVZkxBfqNzxxep1uj785RuZLcNw=
X-Received: by 2002:a05:600c:c16e:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-486fee0f975mr2351435e9.19.1773945714065;
        Thu, 19 Mar 2026 11:41:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 04/11] arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio codec
Date: Thu, 19 Mar 2026 19:40:24 +0100
Message-ID: <71a37de0ca214ac4ed1200479dadc25eb7820ffd.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114156_308072_B9377E43 
X-CRM114-Status: GOOD (  15.10  )
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

Add the WM8904 device to the appropriate I2C bus, enable the SAI
peripheral, and introduce the sound node to expose the sound card to the
system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Remove "This patch" from commit messages

v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 100 +++++++++++++++++-
 1 file changed, 97 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 24924ee1e8c7..7cedef8add32 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -14,6 +14,14 @@ memory@40000000 {
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
@@ -31,6 +39,34 @@ reg_phy_vddio: regulator-phy-vddio {
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
@@ -257,18 +293,57 @@ ldo6_reg: LDO6 {
 
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
@@ -413,6 +488,13 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
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
@@ -431,6 +513,18 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
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


