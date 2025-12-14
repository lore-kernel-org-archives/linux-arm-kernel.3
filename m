Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9B9D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 11:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=; b=t2RhOZDUWdZbYcslTJjR1u3LZK
	cBqyLY1cCrUtG2ant3T9D8OBHnn1A3/94shB8YRGKqHYe45lLnCxWTNzGJ59GNuYe1P8WGfOfE3D0
	mZsdsVZbop9K2UsNSi9g+YZ9Kbgb91/rocaSqbrsWe/5JfiRSOmhn4ZiM/Q0owIvt9fe8rygcikck
	UXV0pM9LWTfPeKnQuTt8n7kF61i4DsZ6tlRzCHn1LsyoBQk2524J1AmKsQ3rv/D6ZXmMvzpnkSXoK
	mwmPt5Pm/Zxi2gZTojPB6OBwR3w6M5RHV1oOAQ1eSaOW2ETg3Q8CUff+tegZc09BSg2csioVFbKqj
	H0/L2ZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvH-00000002NYs-2m49;
	Sun, 14 Dec 2025 11:05:55 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUjvE-00000002NW7-0nyx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 11:05:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so862784f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 03:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765710350; x=1766315150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=WUN7lIFNlRrMUHPmsmaqfZU9Cni1PumKYBS/AiLTsponsLgp0MUi7F9wBqw2W3K4ND
         FxIZR5Y0xvyWVleWdqvZHsKCqLan723SOmDQgqoa6Unm5ZCojhYGSwDSvMvTWrkxONV4
         zfLjXRQfi8iFSxmwk+F3oztKGD48ObiVBipIOqqAcFTLe4gK6OXgQ6wHvc6+LuK5cTEP
         o9SY4vXRRE/u25LlQQyD/WWzjlDyA0TojfA1Gjp3WxInihFhyXUdWeO7RvMbqOXoiaJr
         tn7Y1Ik81NncyV3zNIZrDReXils3wsVsiUm7Tnhgtk1wYIx3DM//c1pofYiep4xbyOa4
         0cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765710350; x=1766315150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r8jury4dWgJkw8r5nImNRFf5uOLhU7BpYSo44vohOG4=;
        b=deF2UQyBNcO0e5SOX96NT2CM4Z/Oqea8nzdk2x2oL6EXJnhLOUPMXf/04H8PJxVYGi
         bCbZ4rcSmB5e44fElyWKxC2wxAiyuHS/xDnN8FMhb/1LRhziSaIkdCbclzFDvaTka+qE
         7K8HjKNhfbhFf92kOUz3r7QcJ6wubycON4zXp4r6pAIH8RTh0uvZ/1U3/Iz2boefWgvf
         HhqmMKtFlf6+4/68MzaMlsiKBX8QUxCLnP/bOzHRYe6k9XQ+sjmmnLnzjPNvoYZkg+1F
         d+nwZDEGVY0VwbNS2Rdz1Fl5FINTnnR9z7BeRe1oSYRxglTUnLMPH5YbjOYS6kQNZ0AU
         XI0A==
X-Forwarded-Encrypted: i=1; AJvYcCWR2cvFbGhVfFM5RJDQmwgo7DESfs1Tei0qs5rRSv7kS/Vadhmm6T5K59L4aF1T75TjDEvWsX3wVbZg4bnLTBAK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6bKpeP8jPwe4z1MYj1lCGb5duUhIBsrtdPx1882cSwyKFHGrX
	LaO34eXShmRLDXmZYrZ466HXMvmAkWiFFyBFChF28XzOb4FK5k6nf+uq
X-Gm-Gg: AY/fxX4AiLtdb+fWn96OeBCUA0TShfKfvbKnBvaevnZvyDhaLj2XO5mjNSGN8nmqKAW
	YrmRe7vn+smUkhCeTGaX5EG1qd3UPHXd9jM78z5GIUkZLAdTrBVi6/VBIpKYeuiFTkHv4rC1OXI
	7uwyjz6yYc85aX6/9lCok6dA3x56sFsknhH8EzZYlQMFBi3dbbnajQzWAjroVEV1FYm0FM3Ga/u
	EA7klZRlJJFqYH9Wkiku+BoDFnFJLYvw5W5aN+YJ/cf/6ynDxj223tY6+9f+9dSkOuyEgN9pFjz
	M3ndQtmtsaa3r16L/dwpuHXTA4RWPqNeM3KddqmLsch+zkyvfEMu36SOVid6j38NXD2G9R5h9u7
	zRSOMTsWjR3oHYn2Kk5QfvUx+47h7zxNdCGUzMRD1LtVKOSU7Gphz8qiYcUzKbIlHlpA9OVzaw4
	oc0u2SFDWmmotacA6Yy4Dfb1InItlBiaB8v0fGc9lpwcBHk46xJjM8Qk544UbBS2BkYiWOK18Kd
	v3qZt43pXbVjA8=
X-Google-Smtp-Source: AGHT+IHBNPTTgk+ZY0LSAwyjZh4NsXuPGDMKLr7V1eirb7wDZS7diFfCXYns/WQowcG2+dA8ESJLgw==
X-Received: by 2002:a05:6000:2505:b0:42f:b3b9:8732 with SMTP id ffacd0b85a97d-42fb46e3070mr8331041f8f.40.1765710350339;
        Sun, 14 Dec 2025 03:05:50 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm7823660f8f.38.2025.12.14.03.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:05:50 -0800 (PST)
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
Subject: [PATCH v3 2/6] arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony carrier
Date: Sun, 14 Dec 2025 12:05:25 +0100
Message-ID: <20251214110531.9475-3-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251214110531.9475-1-stefano.r@variscite.com>
References: <20251214110531.9475-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_030552_246360_65FEE0BC 
X-CRM114-Status: GOOD (  13.72  )
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


