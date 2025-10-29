Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D66CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QiFp/LdLdfHAJfOJPJO9VTxDlMuNiD8Zbuk8ezHLYs=; b=l+hsiskvRxK6leQ5ASBZGfnutj
	5HRuUUDC1O5C2Zc63IhNv9wjp+pdAHVZ01oPXb7yb8otNVPN0BmJwH8i0An/MHKZbHFxMDkVzPWYM
	RlpZxnXuUkQUEmI5dHSCZCLsXcEUJ0Xoi11bNuEW/6IGGmJKKl1KEdfuApcsigsK9XaII9F0/WlAq
	vV3ivJD1p8pTkJSAd7uGQzHxww9V3ki3AKfvvutfKAaiufk0Gq/2inMvzP9SHghCZwaNQ8RAMqVYb
	ni9vYitLfzNDfMWgBFxODydt7iq7gXtGS2acRm3ZGSbyxpmjL4LiKsUIrgRy3AMZVVbzthCkxCYxt
	uiu+/V7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBrH-00000002bX2-0ZWq;
	Wed, 29 Oct 2025 19:29:23 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBr8-00000002bRk-2SrY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:29:15 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so47333766b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766153; x=1762370953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QiFp/LdLdfHAJfOJPJO9VTxDlMuNiD8Zbuk8ezHLYs=;
        b=BMLeeaB6OP/MbABdhkUCHwp83zM/+Q+YFc39YX0Y+0ZqI2xTcO/+Yw7GQOaYihzW1w
         6rNEudM61PYBNufSABhCsGw/rsfftf7ZhALnQ3GN/pHh9cZhqBbYPtR2N09R60snLf4K
         OMLHvD9oPADfoBFSrUdcJGldeYHTFzIYPfG4TaJa02A++1EJnQnPLeZPZGcrRwLDN7iP
         sWzmu5VT1Zk7DLzgWtUAsRPGx5OOgdPzq9SMRghT7Y97VtJVviMP8pK3NpcMtpF6QM7c
         P7XnS1x538zO52UECkek1F/tEIDz75iou+wJ7ef+gtY/tT262j+0696gWFLRari0VHbi
         ZudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766153; x=1762370953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QiFp/LdLdfHAJfOJPJO9VTxDlMuNiD8Zbuk8ezHLYs=;
        b=FFyJKmXo+Qk/10N8gCPuBJb5E8kJmGN8V++odMhqRPfv7w39hUs7hluqc0Zb48MznA
         T4zpiHODnbWqKLIQWTQ4g5fWLs3wgautJi5OSgKfnEfkbd5W7MMwPnxzymN629d48iBF
         X9pgb7RoEV/wEnte7hC75+/gDkuafvd4x2zUIM32XuH+pr8/OLaAZ6ZlINETmNv5UtvH
         nKRvbDxXFrqI4zlkx2+zZiAvl/m/RPX6Xu8R50gYtW+ZAHPv+UaMWn8bzZv7tCLRfUR6
         bLWRhiUjSjz/41iL3Cu8TAuEthj6xrGEkXWPadIfft2y4rhcXpObACopgHOuwoKgJqLe
         5DPg==
X-Forwarded-Encrypted: i=1; AJvYcCVuWf37w18PV8O1KK6vO4hdjccJPfuGQas7xmCA1GCkKPgXyagqeGbO2g988YUKEHU7PwXVh68lc05gsU2IWeI3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm0AAy+3Eq6S2SWoRE6cmRyrXToZ0M+Djn0NGu5KxALoSIZPUM
	DsOMdtHds8XsxbuECVn6C8Ue253Mfk+YKpxOUCdvS4jZyxXri+O8Sf3I
X-Gm-Gg: ASbGncuZveuDeSjPVC1pnU15gyk5prKmsA49xDOlqbGZZOiBrWekrIOQYOnwNbAUvGl
	aM/v76mag2fUboB8xnhiCjgq7R4+3rurGzX2WMOdu0VXkjSCRV3nXzSbUs8h+dyUh48Z3SymNr/
	6nsHOnbG8KRDBjbw1IUcib23PWxpXO/e3op4PgrqHAes+5tezSuuLb+S2iMbxHHcDBbKLZrU+1u
	zRKJx44dgWS+eyEIB7nCy9y66XJP9+1xAF6R1mxNOSl/pmYw85iE+vKCm/tAL1SCMSlFx9todRP
	nqhGGSBbKWNclXGp3Rahvu+RjHESHEIPBYzp7r3h6dif775gPHlakQHWcQByo2Z226KoWGvO/1/
	BOh3a6JoUykDJGSDWdiP7H7n0jeQgOqWVYpo1tkqV7XGXeze75gGqJkXho6lFjR5wOxok8AD9kk
	TOZrZK0K7kVfJgdeo+f+4QwMCYxrptcfwD9GrwKVJKk+3FNWd1xXK0WAIrkfeW2Q==
X-Google-Smtp-Source: AGHT+IFMO9AToKhALDtmsrq81s5iqoQxzOiv7HbkBgHJatpEZpryGrj89HkqN9nJYwlK5nQZ6d5XOA==
X-Received: by 2002:a17:907:c0f:b0:b6f:9da9:4b46 with SMTP id a640c23a62f3a-b703d5333b1mr421529766b.43.1761766152587;
        Wed, 29 Oct 2025 12:29:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/4] arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio codec
Date: Wed, 29 Oct 2025 20:28:48 +0100
Message-ID: <20251029192852.656806-4-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
References: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_122914_687031_1B3F18D6 
X-CRM114-Status: GOOD (  13.84  )
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

The VAR-SOM-MX93 can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../boot/dts/freescale/imx93-var-som.dtsi     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 368530f5831f..d94b40d1d804 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -12,6 +12,34 @@ /{
 	model = "Variscite VAR-SOM-MX93 module";
 	compatible = "variscite,var-som-mx93", "fsl,imx93";
 
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
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
+		simple-audio-card,mclk-fs = <256>;
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+	};
+
 	usdhc3_pwrseq: mmc-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		post-power-on-delay-ms = <100>;
@@ -152,6 +180,36 @@ ldo5: LDO5 {
 			};
 		};
 	};
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clk IMX93_CLK_SAI1_GATE>;
+		clock-names = "mclk";
+		AVDD-supply = <&buck5>;
+		CPVDD-supply = <&buck5>;
+		DBVDD-supply = <&buck4>;
+		DCVDD-supply = <&buck5>;
+		MICVDD-supply = <&buck5>;
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
+	};
 };
 
 /* BT module */
@@ -166,6 +224,17 @@ bluetooth {
 	};
 };
 
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 /* eMMC */
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -247,6 +316,30 @@ MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK                 0x31e
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC                0x31e
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00              0x31e
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00              0x31e
+			MX93_PAD_I2C2_SDA__SAI1_RX_BCLK                 0x31e
+			MX93_PAD_I2C2_SCL__SAI1_RX_SYNC                 0x31e
+			MX93_PAD_UART2_RXD__SAI1_MCLK                   0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__GPIO1_IO12           0x31e
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11          0x31e
+			MX93_PAD_SAI1_TXD0__GPIO1_IO13          0x31e
+			MX93_PAD_SAI1_RXD0__GPIO1_IO14          0x31e
+			MX93_PAD_UART2_RXD__GPIO1_IO06          0x31e
+			MX93_PAD_I2C2_SDA__GPIO1_IO03           0x31e
+			MX93_PAD_I2C2_SCL__GPIO1_IO02           0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
-- 
2.43.0


