Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F78FCB638
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+K/4EeJCxe92O1jpes4D7vWhHNljpVjuEnxrJp6Jybk=; b=uFs5ta02/5pi81dZcKeqSQNuPA
	lcv+SzuRoP57fjd+yHwvbtVf785IMW0AJaQaFMO5cZYXJReqXp0FkkieYr1NjDa3rVLIFbDklFpkA
	SnhLSsY8mWtYSm0rjQal9qEPPErDYf7ae1ex5Doa49szdwZD3VULei3HV5AId6U3w7TZDLDmMKJuu
	TUyLz3ZFSl2pqm693qqKl3Xwubo47Bl4Vg4uETrQY1rkpN7EddB1gx+csfzrKMu2Ijxf/1VXoqUxE
	/5qC90EoQHUnCRUPS50WiWPM8ocG98/3jCczCGbSm3+jXOrGmN3eFVcCvciLfKtNb/guDlq1sjagL
	ca2rpi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzs-00000005K12-0qVn;
	Sat, 07 Mar 2026 15:55:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzo-00000005Jy5-1Wul
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so6047865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898915; x=1773503715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+K/4EeJCxe92O1jpes4D7vWhHNljpVjuEnxrJp6Jybk=;
        b=OHCXhJdW5vV+2KAQM09ay9V+GIptdrLuHTo21a5chlyZysXVWTuQ8+onwXuSx+anAn
         9+PFQh9q/aYXTqRWct/Rj3DcElsuDbtJtX0deIKax6Q5zDmZI1EmcKIbmQqcmMi0qsnb
         Z2ZFXauETVoS1D4BkrspPtdHVdQPiMlwfBqIl+4In3rc8McvVBu9BzbdUgTU3wc3sim+
         wQm24mDyxVqGGykoupk/uKrzj2QoQ0x30PqZF57qt5gzAybXQ5OX/5tb2OOvYBABABui
         faeEH8DfGaGYH9JHs1Q8OWEofn4dh7QbgxyI0awqudKHZOMlry7yd90K4+/9uZz/kY5G
         JBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898915; x=1773503715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+K/4EeJCxe92O1jpes4D7vWhHNljpVjuEnxrJp6Jybk=;
        b=sH98AItqCK9txAY7LNHRu/3AUIWpWxG8DTGOETx+f9zcBlqEG56YzEXmHnjrRy9dFN
         f6+blYaL4nIZhJ+bkK/Xb82Oo2cxznYMhHNHeRJGmDGKjyY7ZtMZJUhu1/LYaFYnELc0
         TSXcdtNyCTT4tu56oqVhDW30bZO0jsawq4/Tkd0pWxC2Dp9GIdUFgMea8vqxJhbbEN6N
         XKKVuCtToTSacpXkZ7mUESPRrBZC74JJeSbGyWidd2akKf5LcQcoIikrBCKrBdcebXCL
         Pu0nH7AK2rq14dxLYVe3Y5dr+zrNhMTwjU6Tx70XY0mpOhxT7wjM8hhkHMWNlQDLES4Z
         4yDw==
X-Forwarded-Encrypted: i=1; AJvYcCUUDxtondpxA6kLE3EnHKPXH9FE8l5SgzZnZP7iYCM6lFJoz07t53EJ4nUyh3gjJFKLAfFFZAlvSj9El4bQBO0+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz//JtOdnhChqGHXwiAcy7Ml0idWyANxfskE4FhEXE2Oefek8IB
	rCtlgbKJuanIMyCiYmtllLTjrhFJGkE2F3MJnaJiIGB5sLePQmCxuAVJ
X-Gm-Gg: ATEYQzwOhtcnLM6Q/GeLh+DPtyxscEKRcLyNWM4o904CkKfQcmojdwZO/B7oCYg6+od
	MATJjYY3lKwN34rJ/wMokaPjFQUfUOnj0mzBk8SBwkqkuEZ6ab4qO7mAkcYHmaAWmH8hQ+Hk+Q0
	LuGbRazi+Kd2p+kvFcxKJFoG33lYdh2PIfzdb8c7sO6NXzSp2fHjHSmP3d2Db8PWiXXIS/DLdIk
	KKqMeEBoLpAC53g9izEYImfc/SHkpNhezrFGIuBNL4t5/+QBtPRSI8WZvaqOG6mHZzOLqwXcOgk
	C43GhajPUUaBpmVGwuR60SoLHUA1UpTHKVQSlTD2FhIuXsTdYxfxlgTmvdCv+TqWrjeKT5K1A4W
	oke7cEp8Xnr1pXxfeqKDupnG9uPTFwcJVyRb5ppE7qe99JaFw86wnds8k1xwi0hgU0Ydmha9ub4
	6RU64CiZdTN08hILVaOjKuKHYKa1BNFZu0GPOmb9z5FFU3lH55MUFxXlQ29B7bp8XHFTiDX+9ID
	UvLnKB5+Nv/7MUxMd58/zOZZg==
X-Received: by 2002:a05:600c:a117:b0:483:7eea:b185 with SMTP id 5b1f17b1804b1-4852695aedemr76798135e9.16.1772898914633;
        Sat, 07 Mar 2026 07:55:14 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:14 -0800 (PST)
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
Subject: [PATCH v3 03/11] arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
Date: Sat,  7 Mar 2026 16:54:39 +0100
Message-ID: <24d31e0ca71c9b2dcb64d39117a8501d85cf945f.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075516_474712_666C8072 
X-CRM114-Status: GOOD (  16.86  )
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

Update the FEC Ethernet controller on the i.MX8MM VAR-SOM to match the
latest SOM hardware revision using the integrated MaxLinear MXL86110 PHY.

Add the PHY VDDIO supply regulator, adjust reset timings and add a
pinctrl sleep state for low-power operation.

The PHY LED signals originate on the SOM, but the actual LEDs are part
of the carrier implementation (RJ45 connector). Move the LED
configuration to the Symphony carrier device tree, matching the
evaluation board LED wiring.

The enet_rst GPIO hog on the carrier is kept to ensure a defined
board-level reset line state during boot.

Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
is therefore not enabled in the SOM device tree nor in the official
evaluation carrier board configuration (symphony).
Designs requiring WoL support may enable it in their own carrier-specific
device trees if properly integrated at the hardware level.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - Moved phy LED configurations to symphony dts

 .../dts/freescale/imx8mm-var-som-symphony.dts | 27 ++++++++++++-
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 39 +++++++++++++++++--
 2 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 819707e6f3bf..712892edba8f 100644
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
@@ -99,6 +117,13 @@ usb3-sata-sel-hog {
 			line-name = "usb3_sata_sel";
 		};
 
+		enet-rst-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "enet_rst";
+		};
+
 		som-vselect-hog {
 			gpio-hog;
 			gpios = <6 GPIO_ACTIVE_HIGH>;
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


