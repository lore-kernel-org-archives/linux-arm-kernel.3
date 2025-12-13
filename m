Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEAFD5B169
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 23:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=; b=CrArPBhrEidTDRJd7Nry/Vng0l
	MPQ3EIwyFYXAFHqRIkdKuIhd/IksscUzeLsYYuOYNH6XpY0jgLQyHHEiF9CItHBypQQQnDc4Huzsi
	QjNpnt5/FCoLYCyU2Ooq6kos18OrlJB79Wl9zPRGB7L7z9w1tpZW6o1yOJujO3aex3/xAYxyX+itU
	96K2FZLmAlvrwmpGjGM08NbxOR9LYOcdvSZvK3HFW4pKTAIEcyGu1gYPB17qZHdb0wVIm6bneaIs3
	hmAOlbKlDwmn6ty8cHhwTqlOXnunU8lqSlsdjFszGI5cxlqGEPTTxcEWN7DkS4o64p7IdROdbW5zk
	ZGD9ohJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYk5-00000001yni-1BaW;
	Sat, 13 Dec 2025 23:09:37 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUYk0-00000001ykd-1bsz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 23:09:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so26588645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Dec 2025 15:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765667371; x=1766272171; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=UGWc9EsQ7f+3ViNBHDUTtEQnfjjk8x4fWLprHvgisAnwtlG/8MmidKE4BPO8NdBGcs
         hwvwfI7rePYggFvDgb4W6nKlDiR+G+8BXNb7B8YGgTqCx1MTE2aLib0sGtjFQLJiav0D
         EU9CzmcihEtYFepIA2I2yhOgxR5AyKbMHaPoJZzMQu4tmaZQOe6+4xWAG7I0wzaVFYWx
         LQ24/UC/lijxAZaWEf02YnDw4zxAoJJRbtLcgUgAr/mYHvtgJIZGE/XjT1BZZhC0+8cv
         cXd0b8OQ1RQfGnCoIYOeqKBqbFyu9du3QFvYnIqWJZLveRE5FE0ZMeyDmM0N75St/z67
         PCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765667371; x=1766272171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=BxUE9kSKktGqwec9CoJnEyXWACsyZWrs9XiOJHAsVZ52KWIks1kWqxQ2VIZZTlFgC/
         qx2DdEltoEPP38lUFtu4xVCBb7LKGXZYygorq632P5/XeSFwPoKef6z+Adi++Q1cIqXb
         aCshu7c8bQJQQrdCf27U11pyMpUAVs4kKFsYbLb8DLb3wF6svUO6BdKufG1g4d7A4e7j
         fQBwWyjWh/8Jcb98EvAvlkvrtID1odB58DfqY1pqdk6ZvzdmS5rMvNKucjine5GzqBFh
         SXupcS4jKkxsMKmUIYzXQ1+R0J96IubMt8Yn+GPQxdgV/j6k1uOXVrCDCrIkvOMprZCx
         eY2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXcVBXE1hTehf8rTIJJlLyIS1jrKwwWNptcoylbArlJFE5y+DuxdI6AFGLbfqeyfaKkYrRiByFIbPdQLGh8dNqC@lists.infradead.org
X-Gm-Message-State: AOJu0YxdQAlfmjPykeh3iN1lE1IBoSZEHuUgPaB/MVHSFlAwn6xgsJN9
	wNtOsAkVTOHXu4xFokyY0jlB4rKoqakGni0WOBJ/6v2di59VpGaEe9T0
X-Gm-Gg: AY/fxX6OuGfayJ+/jHkySbUgTIn5erwPLO63j5j9WlH+tDci/wy4kjsePADphl5BkSf
	8KLxcLjm2Y/wf0VXxHvFMxsIbpg08ZGFZ1S5wMIjOb6JoOGVR4jjDpJplX50TJvTkmrnNJaaqjX
	LXozkjDnS55MDnu+HVOLGYz/jW2Nnr84PmhdrDMT34uulcYIpYuW5bfgqKMYmkghNIsf6mJ14Q8
	gOWMO8PMANcCb/rL8qXSGAU7rotKEMJ9go3RJiRnYLr0tKWRuvwI9kgSjgD/WCUU2LOZZHLyjTE
	c693ZIb8uoWWwUS02soBZ0lI4iFuwAnLeh2hqhXEG3L9EFnvoyNDl8XCch7mMk09NfCFeFEwntd
	KwvIWbgzOWZuLIvOsa3ymFz5c4eSRY7xvJk0S4vcUPCB3cAl77/sD38GDeX0DK7EIQhJ0+d1E+5
	sLf12uCJFQ1OnSxC1efBYwDg5afiotZvmARZv0JmCa83lTnMt0xjs3OkKTRKXhoi0G/RbH0a/cN
	SaxZq/tB8iCKlw=
X-Google-Smtp-Source: AGHT+IHzWPYCHO8TYMArjtFvECMEL21nASqORB4ezLJFhG6O/tj1mS9JO/pOaU9Regy38BeBofSLBg==
X-Received: by 2002:a05:600c:444a:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-47a8f8a7570mr64372955e9.6.1765667370526;
        Sat, 13 Dec 2025 15:09:30 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4f4150sm106040995e9.11.2025.12.13.15.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 15:09:30 -0800 (PST)
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
Subject: [PATCH v2 2/6] arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony carrier
Date: Sun, 14 Dec 2025 00:09:02 +0100
Message-ID: <20251213230909.16810-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213230909.16810-1-stefano.r@variscite.com>
References: <20251213230909.16810-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_150932_448480_200BEA68 
X-CRM114-Status: GOOD (  13.62  )
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


