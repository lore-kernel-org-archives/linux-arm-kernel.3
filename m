Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760F3D3E787
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d98j53CwylYGkDXzrv9xLEHUO5ol14s3GpQ93nPd4ok=; b=3pKbENhIdfnvmSsLGcVsKdS/WM
	Ps38YZKvA7RNGadCVjlyzJSGvuCGlbt94b2V/MXBgimfOCj0QGApPmoNQz89qOm5d9X3tkqPi07eH
	GMqacIP+lUAz9Lzk89+Vrl1ewF+5z6mVLxQ55O97PE1m1saI4ugNxG57vhfXp7hQV8F4TIqH4HP1u
	QTl6fg8fImrikwXgo5oUf960H2tCaACckW0YAlizmnEWQGtG8UabAK6H9Uxj2SXQ25zl87PuPj31Q
	XjXQqR4uhuPQHhrPOTlJ8Swb49dNGecQbLJ6SC7bmDPYOxjzaN+ERw/4o4Gv+zM2C5WwfKLVvyxZW
	wPrkjlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvH-00000002NYC-0sCO;
	Sun, 14 Dec 2025 11:05:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvD-00000002NVZ-02md
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 11:05:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so1615384f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 03:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710349; x=1766315149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d98j53CwylYGkDXzrv9xLEHUO5ol14s3GpQ93nPd4ok=;
        b=Xsm/5SntbmKoPxsK4tyBy2tJPQBOk1j8taC3i6bLLrZD0yTIp4RGB4u1hopXn/URVE
         wUNlLzHbIic0ISyAfwOa6L76PbyiORtoKQhAz5TU0Fm5VSgiXiAnwApNX9SlbQ2Vk7gO
         c4pYew9TkhAyj9VfGDezeLDo8aJjzUGj+k+J7k1D2ysI7zqQSsBd0aJJ4YfaC28CIcA1
         BnYJdNqAhIi3kPdz3+5WMAcyW9XL1qB75VT1yiAae/pSIjdsV6QFeA6EX1bAqeTxY8DQ
         Rv70WAUSX+jWMiLGLqQljC1sRuORM1foF/0+NuHg3Im8DTKBBXhsa/afn7ia5ja08P2Q
         9OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710349; x=1766315149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d98j53CwylYGkDXzrv9xLEHUO5ol14s3GpQ93nPd4ok=;
        b=EzmpE+WaAlAlMbmzvYlXig3nLaeRIeqcievZOkSQRuFu5dBwYl2n0HF6sJhcM2u9rt
         qhduHliiv42VpcUBBsfnxhD+864d3y6XG7LvFBy1cREFOE4N35Q345DeyI/xPnc20Eo8
         MDEc0d15TezvRzxriuCvKEF6c0d3Uav/ncVEmWAMiemvM8smKoejE+HilkooOexSb/dR
         /6HU3cJYPkLm3i8yhTxEeeK3+a2Foe+wwK1G0cpg0TGS9vVFf2Rwn9YNYURZgThP/xUO
         TZfMKeRE1RX/Fxl2mlUuWEkSwpe3U4F4C3IYCegpG57szNMUx9GZY1e9k9uQOvycHK6H
         pwzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMczwquwLERC3DKYSd6OAnG937fUrxKoSX6LSyNQF3Uc+bu2zg9Hjts/a3kIFxuhm3XhGBXdO+S1q7H11Nwc32@lists.infradead.org
X-Gm-Message-State: AOJu0YwyCybXJDLqFsbGp8kDgqX0z0p6LsmOHf1Ah1aTpNtdzrrdM4IT
	XNzZ+VwSRcKkjL+FRovA1yDPpnsOe3x7wopoqqGT57y9fp9pn1JRjWLc
X-Gm-Gg: AY/fxX7pTyyUTIYH3glg+OB6ZSfAew2orkzOMUqtLoJBYHYg61d4hKVlvtPeUnUQH/8
	ZTErAVCD/Pl8413u1TV48EE5S2gyI5LSKDQZdZA6y8Mjn/5LvfbubxLcDdXaq+YXfO95tm2cNmQ
	8vWlDZAhb/i0QuLh2fpUlQuYCkFab6Jv6rAYv8hglSKQQh/pymswOoUEQ8JG+DEBeR58PwvrItu
	MvDKJIqSMSEi5gN8RYWuCWAErd5ThBPaGN4W+lscMZt0fPGH3wtKk16ldxQJUYI3TaYP0t8GDZF
	uafNJHnTw5KBumb4ySyTgPNKXbKTcPDR6DOvO9EZFwl4DixnHBQfKmzWctIeLEyjKEtmIHkuKMs
	eQtCkZuc/gZLGTsAiwXUSX8JkIvw2z9eshBMthTkEeA+j+xW8/Vv8ocWW3Qk5t8aitE1E4u6WMx
	rulq+AC6OTVJz4ZbI1FahYjiZINrNy9tv54UwPZwTKXdnOBgGTFyO5BPXiCjmkYOeyE18SBc6pV
	6PVGvSfGANQxiw=
X-Google-Smtp-Source: AGHT+IH8uGQHUEGjnwmbuaTG7OA0INNOSmTaWG92qY9kO76Cptm1NW4J26INzPWirk186SsdGwe35A==
X-Received: by 2002:a5d:5f54:0:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42fb48ff7cemr9210148f8f.40.1765710348922;
        Sun, 14 Dec 2025 03:05:48 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:48 -0800 (PST)
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
Subject: [PATCH v3 1/6] arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
Date: Sun, 14 Dec 2025 12:05:24 +0100
Message-ID: <20251214110531.9475-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214110531.9475-1-stefano.r@variscite.com>
References: <20251214110531.9475-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_030551_090150_17EA0387 
X-CRM114-Status: GOOD (  12.34  )
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

The VAR-SOM-MX8MP module does not include a microSD slot connected to
USDHC2. The USDHC2 interface is routed only on the Symphony carrier
board, and it may optionally be used or omitted depending on the
customer's carrier design.

Move the USDHC2 node, its regulators, pinctrl groups and related GPIOs
from the SOM device tree to the Symphony carrier DTS, keeping the SOM
description limited to hardware populated on the module.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 77 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 75 ------------------
 2 files changed, 77 insertions(+), 75 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 36d3eb865202..ea3c193bb684 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -8,4 +8,81 @@
 / {
 	model = "Variscite VAR-SOM-MX8M-PLUS on Symphony-Board";
 	compatible = "variscite,var-som-mx8mp-symphony", "variscite,var-som-mx8mp", "fsl,imx8mp";
+
+	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <100>;
+		off-on-delay-us = <12000>;
+	};
+
+	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
+		compatible = "regulator-gpio";
+		regulator-name = "VSD_VSEL";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
+		states = <3300000 0x0 1800000 0x1>;
+		vin-supply = <&ldo5>;
+	};
+};
+
+/* SD-card */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	vqmmc-supply = <&reg_usdhc2_vqmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
+			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22                               0x10
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12                               0xc0
+		>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d4
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d6
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 29f080904482..949d9878f395 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -35,27 +35,6 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
-	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
-	        compatible = "regulator-fixed";
-	        regulator-name = "VSD_3V3";
-	        regulator-min-microvolt = <3300000>;
-	        regulator-max-microvolt = <3300000>;
-	        gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
-	        enable-active-high;
-	        startup-delay-us = <100>;
-	        off-on-delay-us = <12000>;
-	};
-
-	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
-		compatible = "regulator-gpio";
-		regulator-name = "VSD_VSEL";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
-		states = <3300000 0x0 1800000 0x1>;
-		vin-supply = <&ldo5>;
-	};
-
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -271,19 +250,6 @@ &uart2 {
         status = "okay";
 };
 
-/* SD-card */
-&usdhc2 {
-        pinctrl-names = "default", "state_100mhz", "state_200mhz";
-        pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-        pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-        pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-        cd-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
-        vmmc-supply = <&reg_usdhc2_vmmc>;
-	vqmmc-supply = <&reg_usdhc2_vqmmc>;
-        bus-width = <4>;
-        status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -358,47 +324,6 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-	                MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22                               0x10
-	                MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12                               0xc0
-	        >;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x190
-	                MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d0
-	                MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d0
-	                MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d0
-	                MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d0
-	                MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d0
-	        >;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x194
-	                MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d4
-	                MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d4
-	                MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d4
-	                MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d4
-	                MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d4
-	        >;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x196
-	                MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d6
-	                MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d6
-	                MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d6
-	                MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d6
-	                MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d6
-	        >;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
-- 
2.47.3


