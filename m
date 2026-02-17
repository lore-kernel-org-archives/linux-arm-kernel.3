Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F953E9A038
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsvZHHMHNdlwLacCrgd+fOKcEC9NeExJe/PUTUm5+0c=; b=j29gIl8YqX/8OxnEwHjZQozWwt
	z+EgFIWKwZ/azKaoGopt9HX/ToO1AdARCtww1K1mgN3CgFTu4o2Y7ulrndNIGtzNleUzEOJZe9DeR
	gjXSq/LTENXrW1lakbe0OJjR5FEGrNca74wOaJW/wTYvamGJBs0FfeIdWb5yNuslQ6deOgK12Oho5
	1ObbFvWrg7cKokUPndw2H+h2eTnb1lyO7Wnp+ZwxirXI8Tmzzvd4tfBoZUf/GRNoj+8kpKBoA9KGi
	2y3nFovCtx7lBibnx9KivyrAMl5ki+QCU9MRotfJpKyP+Nrk4SzQgNYLoh2tUOaJtJ7ca596FdD+/
	Zj4N6DSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2p-00000008kIk-2Vcd;
	Tue, 17 Feb 2026 18:43:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2l-00000008kEy-0Kne
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4376de3f128so3115095f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353809; x=1771958609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsvZHHMHNdlwLacCrgd+fOKcEC9NeExJe/PUTUm5+0c=;
        b=SETHZTLmtGtoWmdsRduzNQ5HNo/Gx8IbuDsycxnTDXVSK+Ksx5tO98KDzIe3rVpqnC
         zcilbHXYWXpWFWQaA41n5TrTHxaAKmc7oXrNdBTMfIpaW2wfrQX1sBv2rZ/1qQKseIAX
         U/rN1jAG+fyP8rBVm9qfgBpP6lUImVPrd2CcqgXYW6MVUUwsYp0H9oILk9XEQuOwKHkQ
         v6VI9ite/Utraams7snZIc3osYTwVU4znqgz3vyfoz2m2RrsMo/0QF2NvVnHTuKdsYfs
         5l84HZIz4JYOl14S4PXvzJmGjMPCtLgup8kYlLVBNw4C0BZC9k9Anz668aRBnXa9RKwu
         O0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353809; x=1771958609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zsvZHHMHNdlwLacCrgd+fOKcEC9NeExJe/PUTUm5+0c=;
        b=NOvn1eiL8cc7KXsYvHA5q9G+98TGTq2I3FAG9t2iKgviOcPIj6L0D17wLXd3JrQAap
         QE2xkAZWvj2DtJOrP23n1/mEKqrakRmabsH99vHcqapv9jiVtKZGjVVC/+y3hHB4Tu4w
         p1husutiHq8QF7Z0S+wmImMOsZhKJGfCZjGX1RdsrAFFEU7/kllWjuKD90zKJOEGqt4K
         bs4E2o/gMzP+nUvhfIAqXGKfTOsPyTB5HiGltDX+9jYF4KZnwntKyCsQ5t86CbOOXAmB
         cYjlRl5qCChruVDIqqAw70Sfes2mOEn0jRnq5zHqmZqzIAQ24OKTizaSEoYYEIFur/mH
         ZzIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjC3BOJ6UsKkj88/69FfiANQpVptP2e9fRkyd/3ewCuwZJPgCoerUX/ljkOb+YGqsXBVu7kBhn8lW6Didg/5ZM@lists.infradead.org
X-Gm-Message-State: AOJu0YzP1xhFVL9XUmunkyPE0HPjCB1nJNrktnV/KohJZUX7rQHL36bF
	PD+zBMR+vOOm/i5zSJpgoGZ0yUIU/A+EvH99892WuR54kZVc65xedktW
X-Gm-Gg: AZuq6aIn+rreL0mKYkcVt6/+W5uYiLH9TMQbrqfz/wF9iraK5DV1YHN0z3l23X1IcDN
	leggohtWiN43wKNVmq/+sCZC/zb/HmLN1UKO1dt5OkzoSmouuu3PxDqslbc+yf4clPFfTVlRllw
	pbbTvbIChczuYcotfXKsFJb6OkUWirREfBZUP9FWfEyVnpEgtPX4gXTShzI2NuCpkGpyuvqrA9M
	qImJ5ZSzJu9JyLxLHJdQ/oB9YHhIUZWQI2Xzlchp8re0IL6orESQQGLsi60Lp9Q1RbbV+qY6G9p
	2LEvF/UI+u8XLoJLoPe1F0I1xECdd9YEDRauOHcR/xM0hGPlzpErUri1oY+EMEtgkSa8bM2jRjI
	BE1V0z7iY+rWg7Ui2JJYXeBTfpJIWmDk9ZPOKpSbWZX8V5LHAdM9dLx9FRMRcET4FmpmlYvOlLs
	5Ba0p+Sri5T0NHXUAt4S7M+HRHtU22qtY6uz0x4Ts2M/N3/x6tYV4q3/F4ee8NSnSHyFAMd+64G
	zRMMIz0V77CWYKumGEQwf6yyfvDERFCHPU76TxW
X-Received: by 2002:a05:6000:2f83:b0:437:6e0b:7147 with SMTP id ffacd0b85a97d-4379db352e5mr19506480f8f.7.1771353808829;
        Tue, 17 Feb 2026 10:43:28 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:28 -0800 (PST)
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
Subject: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
Date: Tue, 17 Feb 2026 19:42:37 +0100
Message-ID: <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104331_145482_B122A713 
X-CRM114-Status: GOOD (  18.65  )
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

This patch adds:
- PHY VDDIO 1.8V supply regulator.
- Proper reset timings for the MXL86110.
- LED configuration for link/activity indication via the LED subsystem
  under /sys/class/leds/, leveraging the support in the MXL86110 PHY
  driver.
  Two LEDs are defined to match the VAR-SOM carrier design:
    * LED@0: Yellow, netdev trigger.
    * LED@1: Green, netdev trigger.
- A pinctrl sleep state for low-power operation.

The PHY reset is now handled in the SOM .dtsi using the SoC GPIO.
The previous carrier-specific reset-gpios property in the Symphony
device tree is therefore removed.

The enet_rst GPIO hog on the carrier is kept to ensure a defined
board-level reset line state during boot.

Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
is therefore not enabled in the SOM device tree nor in the official
evaluation carrier board configuration (symphony).
Designs requiring WoL support may enable it in their own carrier-specific
device trees if properly integrated at the hardware level.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts | 11 ++--
 .../boot/dts/freescale/imx8mm-var-som.dtsi    | 59 ++++++++++++++++++-
 2 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 819707e6f3bf..689894405b27 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -70,10 +70,6 @@ led {
 	};
 };
 
-&ethphy {
-	reset-gpios = <&pca9534 5 GPIO_ACTIVE_HIGH>;
-};
-
 &i2c2 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -99,6 +95,13 @@ usb3-sata-sel-hog {
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
index da3c7332ec34..23045f54e00e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -4,6 +4,7 @@
  * Copyright (C) 2020 Krzysztof Kozlowski <krzk@kernel.org>
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mm.dtsi"
 
 / {
@@ -24,6 +25,13 @@ reg_eth_phy: regulator-eth-phy {
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
@@ -99,12 +107,17 @@ touchscreen@0 {
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
@@ -116,7 +129,27 @@ ethphy: ethernet-phy@4 {
 			reg = <4>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <10000>;
+			reset-deassert-us = <100000>;
+			vddio-supply = <&reg_phy_vddio>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
 		};
 	};
 };
@@ -366,6 +399,26 @@ MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x19
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


