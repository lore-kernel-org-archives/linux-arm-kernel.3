Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6271D12D71
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 05:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ELI81nSGmtRLCIfnNl6b+pJ5Dyc0maExjkBvXW5ljQ=; b=no/JkvShWZ6+UB8q3eYj3otva9
	8MIhQ6Yw8t7E4NxAD9uXRNwt+RD+RR5jcyokei6kYhvNx6h8nk8a7IQ1n2eTzRXPWs8NLfTnCTXCb
	M6kF6avSHQlO73f4mMcOmFHyDDYg59cmu+MLT2vFEjt03K2aGMrokUtFebcQSbF/9ik8/T8bWAeuD
	OfiJ1tmxEhMUeb3vqL5vxHAND3RzfkNCEiUJoNf/dk+gIy9d+CtmB1T9lDJbpADVrQIc5L5gE20Qn
	0jAZKPN/XR3p8w0NorM/kmCsefdmQ85RvTR57sbuNeYO8jeu96qf3Gt7wEyaqhtEJM+p5zH6QEK62
	d6vJwtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAMYY-0000000GMtl-22pj;
	Mon, 11 Nov 2024 05:01:42 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAMSR-0000000GM6d-2Wwf;
	Mon, 11 Nov 2024 04:55:24 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7180d9d0dcbso1815152a34.3;
        Sun, 10 Nov 2024 20:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731300922; x=1731905722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ELI81nSGmtRLCIfnNl6b+pJ5Dyc0maExjkBvXW5ljQ=;
        b=GwZlrrdsFsu/8PnyQX/gJAXE6h8Yc+F79swVO9QmQaoFnwOrkTpNrlxFfru1SAuKNi
         OrASWOLITvuddjaolmXH5OwdTOwVpCB7TeLkIvlodJ1BGAAg6+/fZ6l4exDdAhIqdlPS
         c7HFgpuabAiPp0YfBN+hhgRF4TR6azNFbhbhjonhLGfWvYJCNZu0DgTdyVA2WOWV1AX9
         IcUa+WtVAA6H6jOutvSAlLl24K1SCAIO8V3ycxpxpOGuM8YGsSeOj2Y3DL0pkCs2dRWj
         gucVIZos6sRoBmN56OqcMsSH4KOhCXkyoEfxeuDETS7W+54l6X34SBrSHn0NHUaHUjcY
         +ltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731300922; x=1731905722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ELI81nSGmtRLCIfnNl6b+pJ5Dyc0maExjkBvXW5ljQ=;
        b=t5sBBCGfU27otUCT0Jxsx+Zb8hKW+l8rVD23YpcUIt5TkE8h6nQFBWzwEj1gkt1Drv
         7K7ZCmnWEa/m+J0LjHsL8yIGoLhSmcgmHP+a4ETQ6R8D5QTO0BMQFRJG6ugic3eWRhCD
         9bBVXrdtGAYgtqO5MMD4iHc2z9CBuL5X/ieUwQOyirqNT3uqVcXKuat2BWsMV+aAWUQe
         I6PNsViE5ORbJP9vjtAwMzEUDTC6QVnI7dOv0QFRFwKWKxNADGjaxcKh3miaazeHryyw
         3WTkkZxPqmyoo56NIB5qftsO+tqLa1/l0EJijKIoo3CXxDHtKadvN1YYhCEor/+32srk
         bIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqR/be+fBewGtMAsCP8nS/Y9l0CaoVydNQ1HXOgxoESM0YcwGvorD9pfgjbG3Z4VBILPIMcejDdMy2tzWeYjw=@lists.infradead.org, AJvYcCVuTaK0T1cNIsjZ6XOQvgzDGNdowGqfLpFvGb5CD7v34VWfF3I+fHdsfwJvSkXZonT54a4Ls8u2MpBdmi5fZMpO@lists.infradead.org
X-Gm-Message-State: AOJu0YzUCbQOnh1+gPrOM9P3GQPV2ugW8lWkcElJjk254E+TsTQrMgHD
	nMC/PDm2us3Vt2TZbjN4ssoQ/YV6OLOtDCVSCvI+JMGwvh3JFs40
X-Google-Smtp-Source: AGHT+IEoQpKpY9CfdhJVGdmAhAWMOaFZK5Ypm9JbIg7lvsz/1vwYwFGpiuV6UUwqTVqpZHWsOwVJuA==
X-Received: by 2002:a05:6830:2aa0:b0:718:12b5:1ed3 with SMTP id 46e09a7af769-71a1c28abeemr8669794a34.23.1731300922481;
        Sun, 10 Nov 2024 20:55:22 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:9ab7:85ff:fe20:5865])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a107ebd11sm2089439a34.10.2024.11.10.20.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:55:22 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH 3/3 v3] arm64: dts: rockchip: Add Orange Pi 5 Max board
Date: Sun, 10 Nov 2024 22:53:27 -0600
Message-ID: <20241111045408.1922-7-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241111045408.1922-1-honyuenkwun@gmail.com>
References: <20241111045408.1922-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_205523_671467_68F7D92B 
X-CRM114-Status: GOOD (  15.19  )
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

The RK3588 Single Board Computer includes
- eMMC
- microSD
- UART
- 2 PWM LEDs
- RTC
- RTL8125 network controller on PCIe 2.0x1.
- M.2 M-key connector routed to PCIe 3.0x4
- PWM controlled heat sink fan.
- 2 USB2 ports
- lower USB3 port
- upper USB3 port with OTG capability
- Mali GPU
- SPI NOR flash
- Mask Rom button
- Analog audio using es8388 codec via the headset jack and onboard mic
- HDMI0

the vcc5v0_usb30 regulator shares the same enable gpio pin as the
vcc5v0_usb20 regulator.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-orangepi-5-max.dts    | 130 ++++++++++++++++++
 .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  |   8 ++
 3 files changed, 139 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 86cc418a2255..83ad11650f0b 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -142,6 +142,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-ok3588-c.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-max.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
new file mode 100644
index 000000000000..c9f17bb31710
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3588-orangepi-5.dtsi"
+
+/ {
+	model = "Xunlong Orange Pi 5 Max";
+	compatible = "xunlong,orangepi-5-max", "rockchip,rk3588";
+};
+
+&headphone_amp {
+	/* PHONE_CTL */
+	enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+};
+
+&analog_sound {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hp_detect>;
+	simple-audio-card,aux-devs = <&headphone_amp>;
+	simple-audio-card,hp-det-gpios = <&gpio3 RK_PD2 GPIO_ACTIVE_HIGH>;
+
+	simple-audio-card,routing =
+		"Headphones", "LOUT1",
+		"Headphones", "ROUT1",
+		"LINPUT1", "Microphone Jack",
+		"RINPUT1", "Microphone Jack",
+		"LINPUT2", "Onboard Microphone",
+		"RINPUT2", "Onboard Microphone";
+	simple-audio-card,widgets =
+		"Microphone", "Microphone Jack",
+		"Microphone", "Onboard Microphone",
+		"Headphone", "Headphones";
+};
+
+&fan {
+	/* FAN_CTL_H */
+	pwms = <&pwm9 0 50000 0>;
+};
+
+&hym8563 {
+	interrupt-parent = <&gpio0>;
+	interrupts = <RK_PC4 IRQ_TYPE_LEVEL_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rtc_int_l>;
+};
+
+&led_blue_pwm {
+	/* PWM_LED1 */
+	pwms = <&pwm4 0 25000 0>;
+	status = "okay";
+};
+
+&led_green_pwm {
+	/* PWM_LED2 */
+	pwms = <&pwm5 0 25000 0>;
+};
+
+/* phy2 */
+&pcie2x1l1 {
+	reset-gpios = <&gpio4 RK_PD4 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie_eth>;
+	status = "okay";
+};
+
+&pinctrl {
+	hym8563 {
+		rtc_int_l: hym8563-int {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sound {
+		hp_detect: hp-detect {
+			rockchip,pins = <3 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		usb_host_pwren: usb-host-pwren {
+			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb_otg_pwren: usb-otg-pwren {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pwm4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm4m0_pins>;
+	status = "okay";
+};
+
+&pwm5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm5m1_pins>;
+	status = "okay";
+};
+
+&pwm9 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm9m2_pins>;
+	status = "okay";
+};
+
+&sfc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fspim2_pins>;
+};
+
+/* pcie eth. not a real regulator. 33VAUX */
+&vcc3v3_pcie_eth {
+	/* Ethernet_power_en */
+	gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
+};
+
+/*
+ * Represents the vcc5v0_usb20 and vcc5v0_usb30 in the schematic,
+ * both regulators share the same enable gpio
+ */
+&vcc5v0_usb20 {
+	/* USB_HOST_PWREN */
+	gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_host_pwren>;
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index 3c6e1321f13f..6459a277f973 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -95,6 +95,14 @@ fan: pwm-fan {
 	pwm-leds {
 		compatible = "pwm-leds";
 
+		led_blue_pwm: led-1 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+			max-brightness = <255>;
+			status = "disabled";
+		};
+
 		led_green_pwm: led-2 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_INDICATOR;
-- 
2.47.0


