Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3562ED609D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 11:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lE4wmixBBgayLXBCtLCcMeypgTnpcFbWaBYeAtvt70Q=; b=deVPMnyQ6qiS/YR8T0RpKGsL6t
	/jGyBkSfNtYCmc4DGnzqxOFriY9DWQFH+ndI6M2GPjxvp0b1E3PvA7f8vGFAA59Dy97vvn5Gn4zgc
	N0Jn52aqEjFX+itPsLXGori6tHc8BvhFCIFjPKIP35oTTQT05HCdOCb4D+hPx4u/UsG3vhsgJbbvN
	BvKMWAlhENCtVbHVWii0NHj/vdNsZHWtnLyWTaiIeDjxphFsPCAFfXrMOhTDQmSF8rMfaZl2wMTR3
	Ag2qDMvYz2I1N4UrjW7Po6nnW6E3yrpqt3aLuKKB/zZtgGBL1CfnIuswt7/uGTGMI7Pg45243y48V
	nh5CkV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFzZ-0000000Cy61-2JPG;
	Wed, 27 Nov 2024 11:13:57 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFnl-0000000Cw2M-02Oe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 11:01:46 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9ec267b879so952805666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 03:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732705304; x=1733310104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE4wmixBBgayLXBCtLCcMeypgTnpcFbWaBYeAtvt70Q=;
        b=tFXwZgeAwHvmgtjYACWrjH+L/RKNXkN6Z22ESKnb9uoiXglifYo9nZmH+GDC+a3dXm
         59yHpkxK+PGo5zCqi4Wuzte+OAFEez8ZxTHnSE6bfYzqjWZzG0Y5DZ6ebJX3NLshvZlK
         lYTdWZkKp+K59mpkhjyOdSkUc22YZ639mPKrxWRY9xLxsocAhqRCHThNQtKKTt7n7Gk7
         4pYezCd2lL+yfrkKC6OH1HYihcpj92vV0NyM4BLyag7khTVLdd1iBq5slzqZR+GHR5NZ
         wOMz0p6R62FTYYUhrtLBUIzNfS+Dnr27oFvIHjFoMWsrMttVBfCevGA5a6gopH+mJJRQ
         NylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732705304; x=1733310104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lE4wmixBBgayLXBCtLCcMeypgTnpcFbWaBYeAtvt70Q=;
        b=Wzq/r37T7kvROA9hMCwehPp0A8E4b1sL7keQKZRa0b8lsl+TS+AMJzQoaCBCIG7h1V
         MMstnujOrWbETUDDd42wGWI/H6CDZPEKXXoVLwGraNPNRNBxKF+GHM+NcmqwhCbih9VX
         RbM8wePNYCORewgq5zU6OAFHlhoi9v7SIF/S/TYIDaLcyHfH6acvTUI7AUjt49dwqQWd
         Nhv/KylLUUGcpEy/oS7wdrZufixqGfsNcrR+pzcZibm1riMg4zXT2z7B4LN7fFinLkO6
         ClWTqgpTNyjCsZJG1GkLri6VUMRSskqYZPHu6+GZtpucDPYPxxSmdqwE9NiCapWGGd3s
         CoAg==
X-Forwarded-Encrypted: i=1; AJvYcCXBndTPfEQSrbBceduuc9fSXJyF3MpsXJCooMrds8yV8io/FTL9q3redDbYUt1zW1LD9j6Ro2w/U4EO1WmoLA5s@lists.infradead.org
X-Gm-Message-State: AOJu0YwapywV8JWr8tXaVpNR3I2lBkV/TpeLpNZmCJokrkZokjGNezkL
	wyl8QzKE9YW6jbMn+USB3gyR47b+foKgp8p6XudDzXaNon4juYuirrqDPUE5Iu4=
X-Gm-Gg: ASbGnctD+NNuZ89WDZI/eAIp7tAYljtkOKSuMG8h7OFEeb8T6j6yiQS6Jnoj6efDJou
	irGJ19WuJ3EDs2Hl0ghyZgSa2qVxgNxvDUJWO4jZ7ogsNLLY30CfucKvdJM/zs9OHjmbA0m6dWY
	m/uvtC5X2d7bDX9kXB5MMIKqoPnfy4PY9snQI1U5IZTbV+2t1UZIGySACbzuoMANAnhRi11CV++
	kyHmVdktCqdMwUfOmN7KuvKU+UfotqKprXNcfNfIqS8ptERoFUmlTJuDjIQ4ZaSMuEpIvY/K0Gz
	fD1iVPOXyXsWMBQDathlEF8MM1fVn9S0kg==
X-Google-Smtp-Source: AGHT+IEjfWpzgWvuf2PuWauL4irDzBBYokZtNaKPDwP8hTNSrJiLJvviKNCQ2xOU0CW7rCVG+Drreg==
X-Received: by 2002:a17:906:2192:b0:aa5:e01:1471 with SMTP id a640c23a62f3a-aa5810330a4mr150052566b.37.1732705303655;
        Wed, 27 Nov 2024 03:01:43 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b339612sm693762966b.84.2024.11.27.03.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 03:01:43 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 27 Nov 2024 11:01:43 +0000
Subject: [PATCH 5/6] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 TCPCi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241127-gs101-phy-lanes-orientation-dts-v1-5-5222d8508b71@linaro.org>
References: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
In-Reply-To: <20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jagan Sridharan <badhri@google.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_030145_058414_B2A81761 
X-CRM114-Status: GOOD (  13.89  )
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
applications is used, which contains five functional blocks (at
distinct I2C addresses):
  * top
  * charger
  * fuel gauge
  * TCPCi
  * GPIO

The TCPCi is required to detect and handle connector orientation in
Pixel's USB PHY driver, and to configure the USB controller's role
(host vs device).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 387fb779bd29..5f7be0cb7418 100644
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
+		compatible = "maxim,max77759", "maxim,max33359";
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


