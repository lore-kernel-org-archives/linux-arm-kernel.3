Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE102E64A87
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZ+3x4XN/pFJwUZ9Fq6iibS8haA6YmZ1TimlQMAiSR8=; b=aL5taPKxLc1AkZxaAD8KA8UuDM
	RVRsopxc91hTYslVGDGaXs8dXSt4J8AsRxnMpnrR4DAjPHjKDlbiPVADzumn7gihCgfyP7AUdRqO6
	UplE0mzHzlvt/zEx1PmQGJ/A6XQ9+g0gF53pJpp9wCgZgAp55Lt9nImjndrjY040MoqeI9Uqpct68
	pLJOYXm0vawKenGqFTX2BEypAlDo92qk5IMd+wjEpwf7bimLRO14khp9lmoCihl4d71uMYx7qujQS
	krgtQUXonOppRkdCh5ussUR0WUuV1ecOlq3uX5GpDSIq3ebuK81GJC5CgQQYbUuMzynhmujwSdnDe
	udAS+MQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISHU-00000009Taw-3Cgb;
	Tue, 03 Dec 2024 12:45:32 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISCb-00000009SJ5-1GUN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:40:30 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso6397031e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229628; x=1733834428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZ+3x4XN/pFJwUZ9Fq6iibS8haA6YmZ1TimlQMAiSR8=;
        b=j0zQwzAWJ8vuMzb7G6a1ojs/T9qFJe9UWI1kzdQoM8QiJNnmpQ4ml+2DWuyDVaYs4n
         3RutnAptaosXtSlN62q908myWKGOxzmosT0rqZ1JaPAyAf/riMUhIFIAKaJTkmssbyPF
         m2tBgHQKYnwcfkacUFNdPYT154VObkRoKTzdI8oEDBDqsdCVB4kIH7L/JaspI2c5gpT+
         Aq2r8Pn4Ak3hGuh1YUXTOw/LBBUZ2slJkLJ14CSzEyzhlVRqfe/H+ajz2nRN12UO3FzJ
         sra1S7SvN1zlEaPB2ll+AnE9+kI6bjAMl6G615g27C6FAatjn+dcSdIv0mI0Bxb0ECmn
         butA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229628; x=1733834428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZ+3x4XN/pFJwUZ9Fq6iibS8haA6YmZ1TimlQMAiSR8=;
        b=TXy9J7N5X9redZMOY1n0KRYj+ZVT7vLI2bevzzc9mlqFqJUQ2v28TNDxTEfy46rIQt
         6x/yi0yTPRfY4wkL3rKerS7BoWkeHFOU93PhW1iCKqp1JD94u3Tg322EkGLZv2OnidgN
         L9ZqvPviske2ncU31QWV4Z60/AJw0BD+La2ThFdwYRKKFAKek1WCP/vlVNE9K94we4U+
         QlS09YCq5FHZJh1zTV6NHP6uk6WMoJm0Z3ujVS6rvfdrI/LC6BDElCkd6h9Z66W3kPMG
         1BqdZnNR1PvCRH1mQNeQasCzox84CDMTzvpS07t8T1qwst6+OaWqUZ3rrhX7prw4GUvi
         WaNg==
X-Forwarded-Encrypted: i=1; AJvYcCV7vPNj3kP7Ld6cibmtWLGqiY4FUd0ySWEdAoAOF17J4QozCyKLzJXO+5N+a2avclqqj/qbK7XvDoNEPQsttkTs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3oTluwBv005o++isoiZOkEDU9rPnWtGc1FbEoT0q3rkP3ZPyO
	gcYCRLjoAhze496rqYJDHM9vXY2rEubNTwm22KGeZclaq2/zE5yUeU2ppm6qVy0=
X-Gm-Gg: ASbGncsqO+FIczaemSdzz2QC5+bQkoPR5VMtawtrqkjlJnDkp7DipKGeOI37AQ6YOLg
	6jCL4pCI20hPoOTy5UoJ8TRsIwwIomtveGkjpwV2KcdJUP7/21iEKjDsDaaT7zthchvTgwTbnXK
	YXFKAMcjU4peN9e5SqHr+KkYh+VHrE4vQn0dI0KHpqVPYENHguPByfAb9qU+T+w0T1CAygXnU9y
	wqjWG/apWNyC3cVd7+xLwmryEpy0gWD7Gwi/fsE9UsLgw7tODBO/vh1Cr7jOcXpxc6UdUsmXkkT
	MVxtOeCTO+uKwpD0uyOvMvUwj4hx32Dw6Q==
X-Google-Smtp-Source: AGHT+IHeO/mKEhXVpXi9pdteGlsI4F23sERp53+a3TrAQPMUegvKy3+VOm9U1xkMFuv9jqKNjlvGEw==
X-Received: by 2002:a05:6512:6c9:b0:53d:a8cd:4285 with SMTP id 2adb3069b0e04-53e12a2e8damr1334975e87.39.1733229627590;
        Tue, 03 Dec 2024 04:40:27 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 03 Dec 2024 12:40:27 +0000
Subject: [PATCH v2 4/5] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 TCPCi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-4-1412783a6b01@linaro.org>
References: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
In-Reply-To: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044029_338446_089832E5 
X-CRM114-Status: GOOD (  14.42  )
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

On Pixel 6 (and Pro), a max77759 companion PMIC for USB Type-C
applications is used, which contains four functional blocks (at
distinct I2C addresses):
  * top (including GPIO)
  * charger
  * fuel gauge
  * TCPCi

While in the same package, TCPCi and Fuel Gauge have separate I2C
addresses, interrupt lines and interrupt status registers and can be
treated independently.

The TCPCi is required to detect and handle connector orientation in
Pixel's USB PHY driver, and to configure the USB controller's role
(host vs device).

This change adds the TCPCi part as it can be independent and doesn't
need a top-level MFD.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* compatible has changed to maxim,max77759-tcpci
* clarify that GPIO is actually part of 'top' in commit message, not
  separate
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 387fb779bd29..a5cbf1e10c7b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/usb/pd.h>
 #include "gs101-pinctrl.h"
 #include "gs101.dtsi"
 
@@ -90,6 +91,84 @@ eeprom: eeprom@50 {
 &hsi2c_12 {
 	status = "okay";
 	/* TODO: add the devices once drivers exist */
+
+	usb-typec@25 {
+		compatible = "maxim,max77759-tcpci", "maxim,max33359";
+		reg = <0x25>;
+		interrupts-extended = <&gpa8 2 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&typec_int>;
+		pinctrl-names = "default";
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+			self-powered;
+			try-power-role = "sink";
+			op-sink-microwatt = <2600000>;
+			new-source-frs-typec-current = <FRS_5V_1P5A>;
+			slow-charger-loop;
+			/*
+			 * max77759 operating in reverse boost mode (0xA) can
+			 * source up to 1.5A while extboost can only do ~1A.
+			 * Since extboost is the primary path, advertise 900mA.
+			 */
+			source-pdos = <PDO_FIXED(5000, 900,
+						 (PDO_FIXED_SUSPEND
+						  | PDO_FIXED_USB_COMM
+						  | PDO_FIXED_DATA_SWAP
+						  | PDO_FIXED_DUAL_ROLE))>;
+			sink-pdos = <PDO_FIXED(5000, 3000,
+					       (PDO_FIXED_DATA_SWAP
+						| PDO_FIXED_USB_COMM
+						| PDO_FIXED_HIGHER_CAP
+						| PDO_FIXED_DUAL_ROLE))
+				     PDO_FIXED(9000, 2200, 0)
+				     PDO_PPS_APDO(5000, 11000, 3000)>;
+			sink-vdos = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
+					     IDH_PTYPE_DFP_HOST, 2, 0x18d1)
+				     VDO_CERT(0x0)
+				     VDO_PRODUCT(0x4ee1, 0x0)
+				     VDO_UFP(UFP_VDO_VER1_2,
+					     (DEV_USB2_CAPABLE
+					      | DEV_USB3_CAPABLE),
+					     UFP_RECEPTACLE, 0,
+					     AMA_VCONN_NOT_REQ, 0,
+					     UFP_ALTMODE_NOT_SUPP,
+					     UFP_USB32_GEN1)
+				     /* padding */ 0
+				     VDO_DFP(DFP_VDO_VER1_1,
+					     (HOST_USB2_CAPABLE
+					      | HOST_USB3_CAPABLE),
+					     DFP_RECEPTACLE, 0)>;
+			sink-vdos-v1 = <VDO_IDH(1, 1, IDH_PTYPE_PERIPH, 0,
+						0, 0, 0x18d1)
+					VDO_CERT(0x0)
+					VDO_PRODUCT(0x4ee1, 0x0)>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usbc0_orien_sw: endpoint {
+						remote-endpoint = <&usbdrd31_phy_orien_switch>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usbc0_role_sw: endpoint {
+						remote-endpoint = <&usbdrd31_dwc3_role_switch>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &pinctrl_far_alive {
@@ -106,6 +185,13 @@ key_volup: key-volup-pins {
 		samsung,pin-pud = <GS101_PIN_PULL_NONE>;
 		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
 	};
+
+	typec_int: typec-int-pins {
+		samsung,pins = "gpa8-2";
+		samsung,pin-function = <GS101_PIN_FUNC_EINT>;
+		samsung,pin-pud = <GS101_PIN_PULL_UP>;
+		samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
+	};
 };
 
 &pinctrl_gpio_alive {
@@ -142,9 +228,16 @@ &usbdrd31_dwc3 {
 	role-switch-default-mode = "peripheral";
 	maximum-speed = "super-speed-plus";
 	status = "okay";
+
+	port {
+		usbdrd31_dwc3_role_switch: endpoint {
+			remote-endpoint = <&usbc0_role_sw>;
+		};
+	};
 };
 
 &usbdrd31_phy {
+	orientation-switch;
 	/* TODO: Update these once PMIC is implemented */
 	pll-supply = <&reg_placeholder>;
 	dvdd-usb20-supply = <&reg_placeholder>;
@@ -153,6 +246,12 @@ &usbdrd31_phy {
 	vdda-usbdp-supply = <&reg_placeholder>;
 	vddh-usbdp-supply = <&reg_placeholder>;
 	status = "okay";
+
+	port {
+		usbdrd31_phy_orien_switch: endpoint {
+			remote-endpoint = <&usbc0_orien_sw>;
+		};
+	};
 };
 
 &usi_uart {

-- 
2.47.0.338.g60cca15819-goog


