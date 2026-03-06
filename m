Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD7DFCC06B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdG08ZWm+hlT9FVxwUh/CwAknI2CF8I/yIBQ6VyRzCY=; b=fMp/IKJy9i+3eN4e/0xxSnneEZ
	qSTbDJnfwYt3PdrKpj2ASmbvOKAr6IidXoqtGRjvO2HZ8JnvMctwL9uKhpJBbx6SQ+zN78yKS6kFY
	HOcpGW8xUQsPqXkjjyFvNrM45c9EnJm80pFSMGIqTXbL15lxVxaQCRUk4koX/PMXSlb/wGGzFhmQp
	9kgjlVqpnCZWWuNfYVSnLOm5/YN8iKijwGld8GhQhBuXDeZMQxKFj8d2q/dWSqU1NtC6j1Aa+5Sow
	tD4chjsO/wHkj3RZWMV0wycMdfwDAm386SPLQCZHVnwSuePhOmv3EScQEkV3k5qJlwlzhROVBvhI1
	Kzu1ccnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJw-00000004QdN-3HZa;
	Fri, 06 Mar 2026 19:58:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJs-00000004QZq-12sj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4837634de51so42071695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827122; x=1773431922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdG08ZWm+hlT9FVxwUh/CwAknI2CF8I/yIBQ6VyRzCY=;
        b=ONgKO4KrwBJo8uvuVr/WJUKM7Cw1TFSA6ymrkn7Ex8afxNyu89IWQqA+hyv+ObEQyl
         AP3GGMWDI1HmNMyxoaqs8wr6bJiNxs+NI2epHpzR0DA0o7h9sBM9sGQZbAL+i51FfWMb
         cgVeAGuMyTL58B8NPrg/JPUkSCCbzERUAV/Z9FH2DfgveUTvinaXpijsOnMNYfnhtTXR
         ZXG/nU2+DmWLpX4Xyz6hFuVC6dBgv2GumeQFhgn4Fg6Seb/Ozj1xrqCriRVR7Z0ancC3
         4uI/I7vrUwk1Kh4RmYaEmpbsxpot2YhyR/VgaYrvuBBGfb68sQFT2w5nMmB20BHdHd57
         0TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827122; x=1773431922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MdG08ZWm+hlT9FVxwUh/CwAknI2CF8I/yIBQ6VyRzCY=;
        b=bdNGU5kWv1rKozcmXA7jlQwt3h6IKmG2Awl1HZG3D08AXbpqOqBRC/kPROcXD3I+ET
         sLumrhiqa5MEcNOf0wQSugDJZKCcKwcwREAfHcyt1lFfrurQSs5AoyhRk6UDHQxioaDN
         EQ6g/DViNSBbibrcmriAapuIwgsjIdvYI/fdeEqYvhQxM+GN6yZANLmKB6qYkGExqg+V
         UKhb07bID4ywTGKMV0Hkh+S6BiWwRXJcbe1JStN+b48nPAKh4D0biriVk1hvrJJlyrRO
         ZtCU+Yk5R+nYtApf8nqxvC6yBbtHCu6N/kgxCcHY+6g83kovl3zuh08EuIs9knDoapqR
         GCIA==
X-Forwarded-Encrypted: i=1; AJvYcCXfDfgNPB2Ep9xiHCmi22RJtsIcJbnj0SV6KlgFG1KvPZ46n8k/KUKH2nQ0dLHW/fpLL0MJBa8wiSUGZuCqOvGB@lists.infradead.org
X-Gm-Message-State: AOJu0YwOIctesyFeVo3eT444ycveY+wi20RE48PL+/XbZ1/spFshQ8Wd
	5UdcnR0Io3ZjzeYcQ95KkXrmyUgRH/ix3K4nh8A343oeAP9cn8KB6ifJ
X-Gm-Gg: ATEYQzyr052cLidJE3yUrTX0nZ0TZRGz8r3phhPy5rEyYYPRuPHtF1iTvPeSFZgMd7V
	0qM5fD3BF4V4yoTRo8Q5jGdm+vwYlvpK4z/DB7Sszs++rBiXt4NixDbtXET5hkUIpquqO8Fo5KT
	zsj41QUljYhtlNWFcFYww6DTaRAIMRaX8aYY+Phxj8fZFcLmuEsp4Ai+i4JwhAP99qWhLMO7kje
	wDf+nTeleG3ONMFPmCafTo16X4iEVk/QPH4hVLudvg1DqVxt3rK0pRkXJMeDhZLe2EeRI1YLyRP
	UtrAAXcfF+5chMt9S9Lo4eUw+jcvUCBASk5ByODC6UzG875DWhJhMlucmOGipIIj7ELgpiWWELu
	zjbVVbES3x/0rUP1lk2M4cme57s7aGGq2NUbz2ggx42pq9MbytOi0IqDWrL2L2u7l2CMMn60fTt
	e/PAmnrqJ5lYr4xrS9Ixy+q2V3IC3JERdfHMZavfGQlL5wfQGsCb5grMmed2iGIjzl2yuxdSUDk
	P3KfMX6ATPhj6hX9idg09jrL4oPBI9W7aSbov0uwRF72Hadkg==
X-Received: by 2002:a05:600c:3596:b0:483:709e:f22d with SMTP id 5b1f17b1804b1-48526964c5bmr54934365e9.27.1772827122339;
        Fri, 06 Mar 2026 11:58:42 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:42 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v2 03/11] arm64: dts: freescale: imx8mm-var-som: Update FEC support with MaxLinear PHY
Date: Fri,  6 Mar 2026 20:58:22 +0100
Message-ID: <24d31e0ca71c9b2dcb64d39117a8501d85cf945f.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115844_320513_6F490F14 
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

The enet_rst GPIO hog on the carrier is kept to ensure a defined
board-level reset line state during boot.

Wake-on-LAN via magic packet is not supported at the VAR-SOM level and
is therefore not enabled in the SOM device tree nor in the official
evaluation carrier board configuration (symphony).
Designs requiring WoL support may enable it in their own carrier-specific
device trees if properly integrated at the hardware level.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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


