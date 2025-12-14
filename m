Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37DDD5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 21:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=; b=Yp4BhYf4J6UijEADq50m+QOFW4
	KMTcd6P1xWqUKTUxZlXfYuFqqiJ2EvnpvmdYGV1bmntBXG7U419M3V3w8jbG8Q+CdxssSX+TucEQY
	5S8/35oxyeANKgrmUizscqj9kTUKPC3NhKFG0OerwLMLBjH1UDYJZqCPPdDYbKA7sOUTUtFpMCGmj
	mUpUOLzrZvCC6rgMgwbKD7NaNjytOXVyZK28ksKlRMI//5Fmyd6IMY3Nwrlvis/CIUfWfs/V3LYnx
	HMHYz59YVan9PPcgG/GhU1vMNrEi/MpfXTthZEl2ikodTbgFe05K7tBpn6d8mkkuP76zq/3HJavbX
	GhIF/grg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1e-00000002l3A-0aBg;
	Sun, 14 Dec 2025 21:53:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1Y-00000002kzo-3TAt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 21:53:07 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477770019e4so28551265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 13:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749183; x=1766353983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=B5Eo0o1O3ATIlIRuuUlip5gSnEXJpZy4JAl1ZPgKkrh9jNxbzdWtqScVzSgVe86Csm
         7eDIiPZVZ8BX+GlN3fNyhFtdV0SQnDBVs/gqat5jn+PB4r+1DipKy7vKHHeKkmjhwwZv
         AGl2DLdG8iCB8iOqQFvh49X6liPiUzjLVfMFK0AIh9KhOeTsMX4wv6fOH6q0jK0HA+3u
         e/3wUn3QrxljQLnckl/hfdvVdXCXTu7K2PUNmKcyZbqs9sUwHShNYKvmH6OubKI0mh0f
         kfh8qGzVb/GrogL74tr+RaoAQHoMe9Iuy16QYPYt2PO9alt0dgnOljY72U1wuBG9ZLtM
         1uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749183; x=1766353983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=Al5mokuiPT1yw6tq/1gmSxX+gi+86zhsTSkAWjI/8abXiHXIR8iGH2JK+nJT3V20Li
         ksQJ03FVifDc3CKKmIp5thLRUAwrtQ3W7ehTj8Ca/5XAW0LJ6GewY2xthIaSXuKqzAvF
         0KkyO/olFJ7EkiKwP0wfC/hc+UZu7sv3BtHmfsmDHdhTuPSwJ8oWQ49KLgmgJj+7bT3v
         EXNEztLm1hDXOTiFi9tp0mxLh6N1LEvwJWubh5TTs1Er32mrSQ4pRFSTu15x4iO9DUYA
         FdyAIQ9LPCANtB5DeKd+wuJJgzj/8Fr7dPih5LNxz6Q3227DWOqRH1LfRpBrCFGwGZDV
         BOkg==
X-Forwarded-Encrypted: i=1; AJvYcCX4cPd4ljaoGO/YTiISIzXodqgbQuCJF6o3gOLa/+7Dz+XfmmBkLHFYLJeJBDWyZyJAoNUtbHyMs8iDpL3/dgHT@lists.infradead.org
X-Gm-Message-State: AOJu0YzfELIFZF1AQPHf1PiGGcTF1PYNCBUDAvX0MOtPLWPXooTSIxFz
	LAM+OvXXlD5iELSu/D7wMa8GMh8hpAq0Oum0jHLXv9Gv+pKR0MmLaEKf
X-Gm-Gg: AY/fxX4PsDrYPBHe04wYR2pQg0cH0f/VkfRteKlXbGnb6Z5A7+/Dg6nC3r0Bx9lNQc3
	c4ZGU/B77VIwQyBIn/EJrc5j0Pp0m14YXH96wGhQB3nQBELGailg+R7iWkOSnjl9gWHlUZkntnU
	HtWukczHvob8fIhuy2UroT9Yut365K0FAtBAfcn+Bfz7b9eZzRYiouafLUR0H9jzF8pRbAJw2fD
	DMSgGgPzb7ymI1PsXqTNbxsUON8+hcbXpQQrXYoSybnxUTKP7DJAQJ1rXiSr3JubF3/q8JWLNHT
	lk/Uhw9qNfLmSP9Y7TbRm1ZFhnqtQWSFBS6txaFBp7xxp0ZjsgLYI/x5wr5EWQ6wFO6LipN9TcL
	gB4J+opDF1JWym0KF4mzhhrvflfJ37UakiDMwbs+sRSNXzLjQoKriHoip7l9/q7FVMZGmF2491a
	WpFjX+Q7jYV20kCPlx8A8kC//xQ6Bwk2AJFjKwlCiHE3IsDuamTkyxspfB6Cd5Ab6AMYBmWw3y0
	d0S6N/g05ICE8Zb6znL9Xz7NQ==
X-Google-Smtp-Source: AGHT+IHlwvUwhglREyCe2v0pBDkwpLJw4hn2MzBwpG419jFwAHwhdlcI6pbWRQtcoEeM5mlvwGC+Zw==
X-Received: by 2002:a05:6000:1a8d:b0:430:f742:fbb8 with SMTP id ffacd0b85a97d-430f742fd90mr2518662f8f.21.1765749182731;
        Sun, 14 Dec 2025 13:53:02 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:53:02 -0800 (PST)
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
Subject: [PATCH v4 2/6] arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony carrier
Date: Sun, 14 Dec 2025 22:52:49 +0100
Message-ID: <20251214215256.5812-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214215256.5812-1-stefano.r@variscite.com>
References: <20251214215256.5812-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_135305_937267_7C7A0A1E 
X-CRM114-Status: GOOD (  13.71  )
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

The VAR-SOM-MX8MP module does not include the PCA9534 GPIO expander nor
the LED connected to it. These components are present only on the
Symphony carrier board and may vary across custom carrier designs.

Move the PCA9534 GPIO expander node and the associated LED definition
from the SOM device tree to the Symphony carrier DTS, ensuring the SOM
dtsi describes only hardware present on the module.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 50 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 50 -------------------
 2 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index ea3c193bb684..361e6122bdc3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -9,6 +9,16 @@ / {
 	model = "Variscite VAR-SOM-MX8M-PLUS on Symphony-Board";
 	compatible = "variscite,var-som-mx8mp-symphony", "variscite,var-som-mx8mp", "fsl,imx8mp";
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			function = LED_FUNCTION_POWER;
+			gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -31,6 +41,33 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	status = "okay";
+
+	/* GPIO expander */
+	pca9534: gpio@20 {
+		compatible = "nxp,pca9534";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pca9534>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
+		wakeup-source;
+
+		usb3-sata-sel-hog {
+			gpio-hog;
+			gpios = <4 0>;
+			output-low;
+			line-name = "usb3_sata_sel";
+		};
+	};
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -45,6 +82,19 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
+		>;
+	};
+
+	pinctrl_pca9534: pca9534grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 949d9878f395..158a78ec9656 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -19,16 +19,6 @@ chosen {
 		stdout-path = &uart2;
 	};
 
-	gpio-leds {
-	        compatible = "gpio-leds";
-
-	        led-0 {
-	                function = LED_FUNCTION_POWER;
-	                gpios = <&pca9534 0 GPIO_ACTIVE_HIGH>;
-	                linux,default-trigger = "heartbeat";
-	        };
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -216,33 +206,6 @@ ldo5: LDO5 {
 	};
 };
 
-&i2c3 {
-        clock-frequency = <400000>;
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_i2c3>;
-        status = "okay";
-
-	/* GPIO expander */
-	pca9534: gpio@20 {
-	        compatible = "nxp,pca9534";
-	        reg = <0x20>;
-	        pinctrl-names = "default";
-	        pinctrl-0 = <&pinctrl_pca9534>;
-	        gpio-controller;
-	        #gpio-cells = <2>;
-	        interrupt-parent = <&gpio1>;
-	        interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
-	        wakeup-source;
-
-	        usb3-sata-sel-hog {
-	                gpio-hog;
-	                gpios = <4 0>;
-	                output-low;
-	                line-name = "usb3_sata_sel";
-	        };
-	};
-};
-
 /* Console */
 &uart2 {
         pinctrl-names = "default";
@@ -298,19 +261,6 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
-	pinctrl_i2c3: i2c3grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-	                MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
-	        >;
-	};
-
-	pinctrl_pca9534: pca9534grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-	        >;
-	};
-
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3


