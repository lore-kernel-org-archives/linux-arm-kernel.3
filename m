Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FB7FCB63F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76UifUem1CcpJi2DmZ9pX1KLlPf7UqUfrwIn74xAbJ8=; b=NhB57XHO8YZ71HxCYmjStUuf8Q
	h/2qP9skFI4UaIT+OgCYG398+X9THejMGw+tkG98EDPRQPa0SYjPLrkVwi5AAikY9GfSbNKlINGWA
	Z63qENBqRlDvh9f3Gusb3+c+89QsghhyFh7YIoMHR+lLUTzCb/uwQpVOp2Rk9RRkLJOCeFBFB1cd/
	opm/ad3pI5N1FAnG2sqhaGmJxw3c3FqHztH3jJ7gk9b0Q79obtDCFHUZo7MZwoWIJmvmPq/D4+PyT
	9C7AdR1R+LgUBRpHU0skQkQaItaG7iPuKmu/CFoiooNWmAz0U4ejHM/XrUxk84WYTXSVzaly7KXTt
	zF/1Q3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzw-00000005K47-2KPb;
	Sat, 07 Mar 2026 15:55:24 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzp-00000005Jyc-39NK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so6918115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898916; x=1773503716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76UifUem1CcpJi2DmZ9pX1KLlPf7UqUfrwIn74xAbJ8=;
        b=XhpshloDh2oeeETxoDZEULENZJvw6UZjl9mTiY1BB2dkgC2a65JSsdJgzydLatpYUh
         /RH+YOqkpwTDDi5IgwAEfSAk8LDtuBMnEvSSZahxVqk/rkLrZDczRqcNDcNsdzNjIHlB
         ZXd3gBbsrCPw9lAAw0B1ye72L+THclx6wcxYjNQ1bpQRL6XvIgH0MBEfyDJKaEdJbh8z
         3TX0ipT3nKNAuPFO50IYEegJnMuCbhHn0V/jjI3l5gddD4OMbwP+SnjEpd0PaUYSe4PB
         8Z5TSEDALBWvoka9sEB6gsHmWWIs4V+sn6+fZ4FD9sIstEpcagVtJhkJE3DQpSzcJjlG
         XbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898916; x=1773503716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76UifUem1CcpJi2DmZ9pX1KLlPf7UqUfrwIn74xAbJ8=;
        b=mnkfobTC3QTFbYEaK5FlDO2zuk0sYIRSqjw7w0o5JydeMUdGp4CjJVtwuEo45HD1oE
         hxiydomN83skcs23b72BW/h+KiRDL64482hBQqD18ar/tis/yXUVZYvyO6aUimHm+7CM
         E/PrAlTr6g4ocO3D87IUxCjm0CnkD+ncfJMQ4u4UJKK2/JM4ZBNDFV91MBQ6503rFiSD
         ClgbIt8Dwwlwk+E5uyA6HOkx6YKoqmKtbKxq/LKYsQ8mEhTKhrPPuEul3ZiVfSB4FA1B
         5+ATy+U7Ffmuype7MqsRzKAODA1pQAjLEgVb55FJ0LplczFsFb4CmUShgk9oPwNgQW7z
         d/NA==
X-Forwarded-Encrypted: i=1; AJvYcCU4eMkdr5R//8ozhIs3ybPW+XKP8P5U1wX/gN4rTUucAqkrIlajJoteYLRPjpTnpTzTioz87RgyhTw0AwBsoUCh@lists.infradead.org
X-Gm-Message-State: AOJu0YwGGG+SbBESZxgpQvPmV7VwmqGRY8hygNKhXFL69u0Hyom2SR/J
	/cCxYsbRl0bK8snLofZ3/qR9VbpkzUpMhVepQLX+yR7eyrqet40vB/i9
X-Gm-Gg: ATEYQzwdsz9HrPNfaiy9jSOlzJddtYhFUthEQS4rqpMhloiPHZmyE+83xmBs/6/IsXd
	kS+SJBrg4Gd4sPrft0m4epKbIsMmaiwhp3bKANritZTFgh0ryj7lIDyCbpbpjFwAAK+LEEnK6gw
	ABXDgReUvb1LH+kQO0RW4LbCFuB9ROBo0gmkgfCLNivLmYZ2rTDnAS04DkKbErD6rNkDQFTv9QW
	2FJMy3etnigbVsBjsYexv/ODzN0VawD9yeDngofAvHDEdAAajUna9EPMaIHH7THeqcvPocdoRTZ
	B/YNUyZ+M6wmkYPKkKaNccK1aRi6omlyhwZfMtckwE4iJzLntbCKuOUgoCFarhMmVdY1lY0Bprz
	2qXLepRUH1HS5Cd2t3uFGHwkUXR9Etb9/cjjZmPOgEq1osRytI0qMxW3j72/fHQ/TmN9pJfVseV
	3GaSy//z+SzOrm0vCQCLW/2a6JUkjJM2fgFDeX0nZSB6aBM2Fa5KdH6PAq1IHe5JXpdRwnzuLnb
	zAIoGxKKybSE8dAe79nF/ccwQ==
X-Received: by 2002:a05:600c:3acf:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-48526978d48mr102487035e9.30.1772898915750;
        Sat, 07 Mar 2026 07:55:15 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:15 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 04/11] arm64: dts: freescale: imx8mm-var-som: Add support for WM8904 audio codec
Date: Sat,  7 Mar 2026 16:54:40 +0100
Message-ID: <bb76d92b9bfb164827f53eafceada37fb3312145.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075517_822691_CC5D0C06 
X-CRM114-Status: GOOD (  14.93  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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


