Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526921091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsRjlpj8112gDvVfzgcWIwNrv5kQelDCvuBWHshniGY=; b=eN8nk2uzikHlHI3tNFAd6VIaT7
	MpKfpGx4/4pOC1PUKvvz7K4jSXwqL3KV88lDQGxqUPhx1wdKP81khi4HwaS29oeqr5r4zsNFLINI4
	QAOXoUs0gbcNNgaH5NIS0HC0cTZA38eq82ZoN59qsndS2vs7sc/WoJV8fFhZBPn0KhbQaxoXKGrNM
	jOx00Pk32QTFeyGIRlvHMknaxhUj8iO3mOzs++NCUMiE2iaOokrvdOioLdvok2AB9X3C/13uV6nIf
	khYFjqnwKd/zmXkKkHannmqVhc6pI42YVnWSidnvwzLG0/YUy8tPvWnVb+AebEKhnSWQ8h/Bpi23l
	aRG1WS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJi-0000000BNLI-2WhP;
	Thu, 19 Mar 2026 18:41:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3IJf-0000000BNHs-0Lik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 18:41:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486b96760easo14049755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 11:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945713; x=1774550513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsRjlpj8112gDvVfzgcWIwNrv5kQelDCvuBWHshniGY=;
        b=LHeCtBLeg0s3bs7d39+EAoNfCRPFvIHYqxbx+oaRsXCRW/K7SCdGHIekXzoKTB71iL
         OmSqHi47NpFQIH1Bukp8FvwhrZJ8RJNXXKktbm6R5PPXQ5kkZx2qPE7R0IWD+mYLG+6y
         UfgVUtWvStSiNNxLX14950gxn6uuxC1zYvpMNMlDuFTgwiHyOJdajdCP3k8ktr8fPYkf
         Huc1qP2n2jdJGbC7HG5YnGBLWf1rkgosEgB6Z+JEEQyghOnXXmKH1HuIl0In3wQZMENb
         FM0iDPmJ87BxFX/1y6X8/ZODLZKeEI7M3YSR0kx063pPQVi5bmhxXAttjuuPhSH1hH8j
         9u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945713; x=1774550513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsRjlpj8112gDvVfzgcWIwNrv5kQelDCvuBWHshniGY=;
        b=o+aOn3LMwsbHJSQBgYNbpuQsKH8+2ENBwGPIRBqwc1sSz4gkj+uhAmaV+0nU0m5iYK
         7kqcRCddxkMhtq6ZpDbR3GEHyX7NWKr5XTh6TD4K0zzPIBY9hbgnpbqtGzL2h6hhUyOc
         9B9vheroW1CZI9UXy5VN9MjFFakXjcXP0AKFD+0ljrObD3JHj9BcyLUR1InXtgAEiOnD
         lGZ3empQRkqnVOAZads81uqJoHAKpNXVLPJfm+2912U0xcY3226njkADc/gaEvyAd3zW
         1IyCFF7eQM3XRKMKpeGlfNpGZ2KXf8wF8RWsk8LpKH2RQ8jtwhFLHVSpq/xrgwtuwM4R
         WxUA==
X-Forwarded-Encrypted: i=1; AJvYcCX5BpHzKzktEeqJflQXQ1pIN2jkxkfA7T5wcnluzK5bRLhQDuJdUyHrUwvo1XqZvIQSUHwXNCxVcT92V/VRLdbE@lists.infradead.org
X-Gm-Message-State: AOJu0YyAUcss9wx4NYC2CnCOJTUotwmjSJmjkOTpMpT7s07mACN/8CmT
	9fAnnnwI+fXWZTWsPfFPVyjM1DM5XRjSSP0uWuhD2SJ6j1dAKH9wdkI3
X-Gm-Gg: ATEYQzxbM5D0e90adkTu3SNTxTfYB/u8Efh42ukEUvKpQ1tXeP//6VRO15tnsQh4AGD
	VFFHb6zuJ4hrtOIDBHofCvr/NpreLN8EgUx2UygDFH3Wln20kgbCb7G6Owkhe2t4xKxEsbpw2kN
	QfwyX0pyGAJzVF9vF6tbmWZqPFgRLXGziorQ9nc36QyZKGyY5MiMjKt7nLSZpdoMin/onOztlmj
	H0URINS9qAt8cV975GXxcmG3T4K7EtRtTyl75J0xyr6mlS47VMTDFvPa/IsFQFqXbfQKZgOoBT7
	1/uLAVdtvoS8n+X2LnIr6CMfaNV2pVjSskQHVb7nlcZarrQOsMSt5CzcHk5HeGlym5HUJgqmj3w
	HMnj6JD4t1p8QWUxCBaxiUdqOaOxmaWbeH1MJviuvdLvqzG/WmjnUCklpW6akQfrZovpyQ1XUA9
	kW7CesD7kvSnARjVFL8b6Jq2hnj2pF78Drn8VikYNR8NrfkzEG4wEqOQ32sBv2gktCFrlWLtpXo
	ibftv9s/TT8JK/lBn3wDbdDIM3ydUQckQBHqkg=
X-Received: by 2002:a05:600c:4750:b0:485:3812:36dc with SMTP id 5b1f17b1804b1-486fedbd0bbmr2722735e9.9.1773945713116;
        Thu, 19 Mar 2026 11:41:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:52 -0700 (PDT)
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
Subject: [PATCH v4 03/11] arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
Date: Thu, 19 Mar 2026 19:40:23 +0100
Message-ID: <7f26d7a437b76a60475fa5373803eeb2bea125b0.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_114155_160466_A5CAEAFB 
X-CRM114-Status: GOOD (  16.76  )
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

Update the FEC Ethernet controller on the i.MX8MM VAR-SOM to match the
latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

Add the PHY VDDIO supply regulator, adjust reset timings and add a
pinctrl sleep state for low-power operation.

The PHY LED signals originate on the SOM, but the actual LEDs are part
of the carrier implementation (RJ45 connector). Move the LED
configuration to the Symphony carrier device tree, matching the
evaluation board LED wiring.

Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
is therefore not enabled in the SOM device tree nor in the official
evaluation carrier board configuration (symphony).
Designs requiring WoL support may enable it in their own carrier-specific
device trees if properly integrated at the hardware level.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Remove wrong enet reset gpio hog

v2->v3:
 - 

v1->v2:
 - Moved phy LED configurations to symphony dts

 .../dts/freescale/imx8mm-var-som-symphony.dts | 20 +++++++++-
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 39 +++++++++++++++++--
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 819707e6f3bf..9f4e004f0a37 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mm-var-som.dtsi"
 
 / {
@@ -71,7 +72,24 @@ led {
 };
 
 &ethphy {
-	reset-gpios = <&pca9534 5 GPIO_ACTIVE_HIGH>;
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
 };
 
 &i2c2 {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index da3c7332ec34..24924ee1e8c7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -24,6 +24,13 @@ reg_eth_phy: regulator-eth-phy {
 		gpio = <&gpio2 9 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
 };
 
 &A53_0 {
@@ -99,12 +106,17 @@ touchscreen@0 {
 };
 
 &fec1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_fec1>;
+	pinctrl-1 = <&pinctrl_fec1_sleep>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
 	phy-mode = "rgmii";
 	phy-handle = <&ethphy>;
 	phy-supply = <&reg_eth_phy>;
-	fsl,magic-packet;
 	status = "okay";
 
 	mdio {
@@ -116,7 +128,8 @@ ethphy: ethernet-phy@4 {
 			reg = <4>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
 };
@@ -366,6 +379,26 @@ MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
 		>;
 	};
 
+	pinctrl_fec1_sleep: fec1sleepgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_GPIO1_IO16		0x120
+			MX8MM_IOMUXC_ENET_MDIO_GPIO1_IO17		0x120
+			MX8MM_IOMUXC_ENET_TD3_GPIO1_IO18		0x120
+			MX8MM_IOMUXC_ENET_TD2_GPIO1_IO19		0x120
+			MX8MM_IOMUXC_ENET_TD1_GPIO1_IO20		0x120
+			MX8MM_IOMUXC_ENET_TD0_GPIO1_IO21		0x120
+			MX8MM_IOMUXC_ENET_RD3_GPIO1_IO29		0x120
+			MX8MM_IOMUXC_ENET_RD2_GPIO1_IO28		0x120
+			MX8MM_IOMUXC_ENET_RD1_GPIO1_IO27		0x120
+			MX8MM_IOMUXC_ENET_RD0_GPIO1_IO26		0x120
+			MX8MM_IOMUXC_ENET_TXC_GPIO1_IO23		0x120
+			MX8MM_IOMUXC_ENET_RXC_GPIO1_IO25		0x120
+			MX8MM_IOMUXC_ENET_RX_CTL_GPIO1_IO24		0x120
+			MX8MM_IOMUXC_ENET_TX_CTL_GPIO1_IO22		0x120
+			MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x100
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
-- 
2.47.3


