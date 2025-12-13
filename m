Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6498D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOpZh7LYAA8Dtx9qfwir93rZZO8/sCuUlp6Rdd8i9AU=; b=kBIxOPqQ0NC+y4LfJJFeC81+v1
	u4lfbok5bTOxHgNRRAN79nln2P2oCiPUfmmFREs9A/NKxNymVkw818gS2obXqh6jhdgQAHNF/H75/
	yerpqkjSy5wXG+PjzFoUl10KwMAlE7QM+WXIOBMuTnJtVeoCl0++c8FZvS0XfqZroNOUP8e4szB1B
	QNpmiIIDYuAlSkr7ABCNB8+t7CZjs6AyIu+n5ssKmjgebvQ9gYf29m2mR5AHHqjT5n8KrzYlrXboH
	P9LaHGitdB4BLLxJW3iOoYQHEjAOzCmmst2QNa15YiGR2cDJMpe66PGDk3IkhJVXxYbCbTN9Akxhx
	SIV54PPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYkA-00000001yrj-3JYu;
	Sat, 13 Dec 2025 23:09:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYk4-00000001ymu-3Hkm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 23:09:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477770019e4so23423485e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Dec 2025 15:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667375; x=1766272175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOpZh7LYAA8Dtx9qfwir93rZZO8/sCuUlp6Rdd8i9AU=;
        b=IBQPpYamJLD/z6+J89b/WH8yGBfEi72l6amNhQ0VRQhqbs5c/90OQ9gU5fYOivaUhH
         VE59XtmmF1OBbeZ7V8wrovXVxGSpMdn6Z6P/5nvEj9UoKrAFKf38okc5pKWAFABkhENv
         p+n9x6KsqHtg7Zu7K8gjwaVxFqPSeGzZHuor1wfnPrhLKXT8FtAzCSnX7viP30fRryUs
         SiGUynDPDhD0oVBzjsAWGMkH+hchUSwYp8zJ6kN1N+C4I7v98A2x66SFCBNM6uM54BHX
         jokKhUH8vA8yhkpyYJhWSTIcDEey2dEl4EVkZ1Bz0dHbPUjfM8y6zf+yzAybTEm8Ru6r
         ayDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667375; x=1766272175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WOpZh7LYAA8Dtx9qfwir93rZZO8/sCuUlp6Rdd8i9AU=;
        b=vg0GhOTHGpbkbMWCSg9bE47a5aEmHRzRxyNMhJSNXPZ1gFfcp0c/kiOob39geZ3+VA
         bxDueBNWSdpZEEhTMT96PxtVHum5oqnaWkk7KmPYW+5Ms1w/ag8KUvTqDy3PYxXf8Fx6
         IPldGrfXOq5lc6And0EA6YceOqLK/NI6wbO0fX+gs48bQ7sus4s2PtFYnypaI6YcdFug
         mnqSBzzAosDrfSPdCfC9ehdXnGe15MyEOMzQiap0Q8Lv2fCSi2lmZBZxakl9QbirAyQq
         1KoSY44KBd/nQXtEfpy52sVrEziicBOv7Yx3SfiSn8vbHjqv2XeBanVDaW36UCOixYc9
         ChrA==
X-Forwarded-Encrypted: i=1; AJvYcCW8m6jeApAIc1CYwXtzWghedHEWE013I0x9DJSfwu+wGUMoDh26JCHup6X9EE3lVSi5zIpMSvPWcAM9aJPvX4Ac@lists.infradead.org
X-Gm-Message-State: AOJu0YzU6qvoa+Zhy5aRZiPhe67VJ+9lnzSDZI2DrhAMFRezJSBjE4Bh
	2ECn0vM/lBtf+GCBay2Buxd2RHpmyk8UsM5Am0eMv/f4LyST2j7lUiUv
X-Gm-Gg: AY/fxX7jNFBH5AnKNt3OzwfzFyh2X33UO5lgO/kaTxjfKyxtkQUH/3kP3vO6x4dY3AE
	6M3Mm0SQCtTx3wFTq0MnPpJXx7RgWGKBM9yFsJmBQ0qq67L+3y5PhC5q7Pu8Ns/ywDiNinIWuxe
	kIBO9GM/P6qCT8sWTw7bbcic/UVMMP9bdi8aIX912/N9LtFFFiLe+V846DYYMJJ+xNCGAtWHiXq
	C8A0uURibEuMUeO8CBzvBRrEY9w5eZ95Vnh6Z6HarvscLlzOOz8Kq24h0GW1clH5GDHAhtrfYq9
	KuCLxs5AlpE7yjpZknzQ+ANOtNSRCEzHBberMP/Gj1yvxWS036w9KeBVquZRaQRT2EmZz5DrWEa
	+73W0hdlwaeLMmQWFgrydm3R7MSC34vT8zYjSyPEmpD4N8Z3kGuFku3L+kQpmDa1BPsnE19R8bV
	yf1W+d86Mp4GKdwq7ORq6RHPt3RN2ZqRlquZNZoJZ0rVZC8OveVpFV4LhHjb8+KhZMStUfd8UN4
	P0KC/61SAjFYso=
X-Google-Smtp-Source: AGHT+IFh/ZiZ9L++4UdOLlAP7bnIG/paHtZaS1ZXQpXk440Sin8Fz6Voei7JBvcemO+FNI3s4UJtDQ==
X-Received: by 2002:a05:600c:37ce:b0:477:9574:d641 with SMTP id 5b1f17b1804b1-47a8f903a23mr65879575e9.22.1765667375035;
        Sat, 13 Dec 2025 15:09:35 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:34 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/6] arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
Date: Sun, 14 Dec 2025 00:09:05 +0100
Message-ID: <20251213230909.16810-6-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213230909.16810-1-stefano.r@variscite.com>
References: <20251213230909.16810-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_150936_842701_A2F2346F 
X-CRM114-Status: GOOD (  12.45  )
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

The VAR-SOM-MX8MP can integrate the WM8904, a high-performance
ultra-low-power stereo codec optimized for portable audio applications.

This patch adds the WM8904 device to the appropriate I2C bus, enables
the SAI peripheral, and introduces the sound node to expose the
sound card to the system.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index e7f5ec10cbac..169fc6a9c8cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -30,6 +30,14 @@ iw61x_pwrseq: wifi-pwrseq {
 		status = "okay";
 	};
 
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -47,6 +55,34 @@ reg_phy_vddio: regulator-phy-vddio {
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
+			sound-dai = <&sai3>;
+		};
+	};
 };
 
 &A53_0 {
@@ -209,6 +245,52 @@ ldo5: LDO5 {
 			};
 		};
 	};
+
+	wm8904: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_audio_supply>;
+		CPVDD-supply = <&reg_audio_supply>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&reg_audio_supply>;
+		MICVDD-supply = <&reg_audio_supply>;
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
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <11536000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
 };
 
 /* BT */
@@ -300,6 +382,18 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC                   0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK                    0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00                  0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00                  0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK                      0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC                   0xd6
+			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI3_RX_BCLK                    0xd6
+		>;
+	};
+
 	pinctrl_uart3: uart3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX                          0x140
-- 
2.47.3


