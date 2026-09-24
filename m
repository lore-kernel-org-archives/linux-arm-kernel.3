Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6802AC98324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwDQ5m8Lr/ZNLuGAHNSbThMwvePKcFW/UlVIIrfTaNo=; b=Q84qSlzhgSaA0toHpy5SF7S8PL
	fdnyMX3YMOKS7qbqp+h6z8KifnlM14nujze2w3IrwqN3Fxy8FDb40IeXk4+uQJwCy3xVLTJlqF3fM
	rqM2Zs13QfGme1t6g9eZ6mPpok5tXysf4TXoiMu7EMpYsMd8Z/Pkb9lvl5w98LoS3TYL4fQdGJMxK
	EoiqrjhnUGpaq+AulKQ6nSID+S9hOcmFXz2c0XfFMwjPSHW9FRlolfip3hJhj2uXVuVLw6DErvy5a
	kBl4hrv5UaVnj6y6XqVElM8d8r3HqVATeE8RxoUb4V5ldTqNlmsfZTy/oqruYO5GM/VIIEWOBnO7b
	XWI+tSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lOY-0000000BPuR-1JsG;
	Thu, 24 Sep 2026 15:29:58 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lNy-0000000BPVL-0rGp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:29:23 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1338573f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790263760; x=1790868560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwDQ5m8Lr/ZNLuGAHNSbThMwvePKcFW/UlVIIrfTaNo=;
        b=cmBL+gD7Ps+e43FU3UiaGnm+pA95UWrZ8m3sh+WFRqUwqccuiEoEzxHG4Wocr7zEeL
         Qnd+ag0QfPFbMbC6E+oM35cXfVyzFw+UhMPSUNJcVbgTV9PBxK99h0oGSgWNyXUwdcK5
         ZA6cf7lA+IGXOwv9/BSW4vyLFdey6O/Ok9xanibHHmQfrgbbIKMZavhgeOmbPy56LRcX
         PlNGodImZ0hJRNpGEWXLgcNg2wq19JjfyO52u8/FKwF3Js+i9Mm8KUZUiFKhItO+E2yg
         b2wkDjZEwkJVu3KemgbDDNRTaSSH45RrH+yqraZ8aYWWbqMVFl65dUlMuwLp7Y1w1ljd
         5Auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263760; x=1790868560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwDQ5m8Lr/ZNLuGAHNSbThMwvePKcFW/UlVIIrfTaNo=;
        b=L2Udo2OIOzXstDnJfZ0mmfYljWvv4jRdJt5agYRWom5irh8gbgrMlZxNfeo5ZRDx4z
         6qL0ohvLLIpkU4xrmZoGJgLDv+A67JDGFs9Lq7tKJMxzC3U+Jc3Cgys9lBap+0O2/PtY
         9D65Htgn/sRIsDqfnMDKLdvsc4UD8h04upmgqgQIEoiOC70lKCy+5z5WAzml2MpQeEOD
         kwMghLRlgnsLVHiYg8f6BBmc506/hzNcU+uX8JmSftTcM4HM+FDSubX52hSmCjq83emc
         eTxD4bWxXQwBxJOGu+4NRbGml302mpdpj8q2MxDNZbsl0Z5pk7GMTTXeUKHSC2RXCwdC
         V5TQ==
X-Gm-Message-State: AFuF++mJu7lUwB/J1yaU47DPDyZLL+9p2Zew9F5JrMKldCXdMMUAp0WQ
	ME/64foXzN+ng8P9jYwO7WCQf81fGjfURRvLdK1KI5KVr8BL0ixKevEdycg1lblEqvbSpsV/2LJ
	dm93qIzU=
X-Gm-Gg: AYBFou1hin1RkOIEO0+8i9Ja8OG8DwUHB6+zal+kWdP6OQUSAE9KbpdVBlAZt/S4h2v
	/40+1VMWuDp3oG3bSE+MI8gF8bs9e/Bi0yH+1dOKHZhkDU9utyx6GW2vcF3qomxEPKEt8hYNW2s
	2DrioqZZo1kUd5cY2xJzxIcf+Ei3cNOi0+U07LIeMH7rHh9R/JVjgZ1X9FGvVuKZ+WHBOUyYR09
	QsCaSjMBoLUFiNYsK3QqRi1rhTSBAvnMZF6C6/uaVymOBW+jJyblPGKrrCeqmC33BgwTHw/DwMS
	RxuBYyySRrQlXbKg4F58eyjbLP1yVQXhpGnic29RZIQ1PjBJtnyrgjIcmoYtmeXJ0iPPjSTw/2M
	VsyNi0LXMtOchBQzDmyDRrLvQiYPwpqDam9natzHszxXOTvbwucu9P2YN2QFFEABkVQC4JaB8F4
	SeiTLdmFIYueo5JMpIwJVzNBntzKanAaFauqHiaeh2Wdl3SdwODiZ3CKf37oCKuRZoEE/ujXZxd
	9Pk7iVYGk2VCPmTwSCzqbVkC2NugsFSKDwY
X-Received: by 2002:a05:6000:1888:b0:487:2777:6354 with SMTP id ffacd0b85a97d-488717166dfmr6661967f8f.48.1790263760497;
        Thu, 24 Sep 2026 08:29:20 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48867b49661sm14781552f8f.0.2026.09.24.08.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:29:19 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v4 5/6] arm: dts: sunplus: add Tibbo LTPP3G2 board
Date: Thu, 24 Sep 2026 17:28:43 +0200
Message-ID: <20260924152844.81705-6-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za>
References: <20260924152844.81705-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082922_414901_01C3BD17 
X-CRM114-Status: GOOD (  18.17  )
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

Add a DTS for the Tibbo LTPP3G2 board, which uses the Sunplus SP7021
SoC. The initial DTS was provided by Sunplus Technology Co. and has
been adapted for upstream with permission.

The board features eMMC, SPI, a bit-banged I2C EEPROM (Atmel 24C16),
PWM output to a buzzer, a watchdog, RTC, and two GPIO LEDs (heartbeat
and MMC activity).

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 193 ++++++++++++++++++
 3 files changed, 201 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

diff --git a/MAINTAINERS b/MAINTAINERS
index 6e50747a621c..313107bea748 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3737,6 +3737,12 @@ F:	drivers/reset/reset-sunplus.c
 F:	include/dt-bindings/clock/sunplus,sp7021-clkc.h
 F:	include/dt-bindings/reset/sunplus,sp7021-reset.h
 
+ARM/TIBBO LTPP3G2 BOARD
+M:	Andrew Gaylard <ag@ffroot.co.za>
+L:	linux-arm-kernel@lists.infradead.org
+S:	Maintained
+F:	arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
+
 ARM/Synaptics SoC support
 M:	Jisheng Zhang <jszhang@kernel.org>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
diff --git a/arch/arm/boot/dts/sunplus/Makefile b/arch/arm/boot/dts/sunplus/Makefile
index 868f2ea0c127..25ba2e530c35 100644
--- a/arch/arm/boot/dts/sunplus/Makefile
+++ b/arch/arm/boot/dts/sunplus/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_SOC_SP7021) += \
-	sunplus-sp7021-demo-v3.dtb
-dtb-$(CONFIG_SOC_SP7021) += \
-	sunplus-sp7021-demo-v3.dtb
+	sunplus-sp7021-demo-v3.dtb \
+	sunplus-sp7021-ltpp3g2.dtb
diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
new file mode 100644
index 000000000000..2d321c41067c
--- /dev/null
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for Tibbo LTPP board G2
+ *
+ * Copyright (C) 2021 Sunplus Technology Co.
+ */
+
+/dts-v1/;
+
+#include "sunplus-sp7021-achip.dtsi"
+
+/ {
+	compatible = "tibbo,ltpp3g2", "sunplus,sp7021";
+	model = "Tibbo LTPP3G2";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	i2c_tps: i2c {
+		compatible = "i2c-gpio";
+		sda-gpios = <&pctl 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&pctl 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_i2ctps>;
+		eeprom: eeprom@50 {
+			compatible = "atmel,24c16";
+			reg = <0x50>;
+			pagesize = <16>;
+		};
+	};
+};
+
+&leds {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&gpio_leds_pins>;
+	pinctrl-1 = <&leds_s0_slp>;
+	led-0 {
+		label = "system-led";
+		gpios = <&pctl 6 GPIO_ACTIVE_HIGH>;
+		default-state = "off";
+		linux,default-trigger = "heartbeat";
+	};
+	led-1 {
+		label = "SG";
+		gpios = <&pctl 7 GPIO_ACTIVE_HIGH>;
+		linux,default-trigger = "mmc0";
+		default-state = "off";
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_pwm>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart1>;
+	status = "disabled";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart2>;
+	status = "disabled";
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart3>;
+	status = "disabled";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_btuart &pins_bt_reset>;
+	status = "disabled";
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_pins>;
+	bus-width = <8>;
+	max-frequency = <52000000>;
+	non-removable;
+	disable-wp;
+	cap-mmc-highspeed;
+	mmc-ddr-3_3v;
+	no-sdio;
+	no-sd;
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
+
+&pctl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_gpio_nobinded>;
+
+	emmc_pins: pinmux-emmc-pins {
+		function = "CARD0_EMMC";
+		groups = "CARD0_EMMC";
+	};
+
+	pins_pwm: pinmux-pwm-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(48, SPPCTL_PCTL_G_PMUX, MUXF_PWM0, 0)
+		>;
+	};
+
+	pins_gpio_nobinded: pinmux-gpio-nobinded-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(30, SPPCTL_PCTL_G_GPIO, 0, 0)   /* was L2SW_LED_FLASH1 */
+			SPPCTL_IOPAD(39, SPPCTL_PCTL_G_GPIO, 0, 0)   /* was L2SW_LED_ON1  */
+		>;
+	};
+
+	pins_i2ctps: pinmux-i2c-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(1, SPPCTL_PCTL_G_GPIO, 0,
+				     SPPCTL_PCTL_L_OU1 | SPPCTL_PCTL_L_ODR)
+			SPPCTL_IOPAD(2, SPPCTL_PCTL_G_GPIO, 0,
+				     SPPCTL_PCTL_L_OU1 | SPPCTL_PCTL_L_ODR)
+		>;
+	};
+
+	gpio_leds_pins: pinmux-gpio-leds-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(6, SPPCTL_PCTL_G_GPIO, 0, SPPCTL_PCTL_L_OUT)
+			SPPCTL_IOPAD(7, SPPCTL_PCTL_G_GPIO, 0, SPPCTL_PCTL_L_OUT)
+		>;
+	};
+
+	leds_s0_slp: pinmux-user-leds-s0-slp-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(6, SPPCTL_PCTL_G_GPIO, 0, 0)
+			SPPCTL_IOPAD(7, SPPCTL_PCTL_G_GPIO, 0, 0)
+		>;
+	};
+
+	pins_uart1: pinmux-uart1-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(8, SPPCTL_PCTL_G_PMUX, MUXF_UA1_TX, 0)
+			SPPCTL_IOPAD(9, SPPCTL_PCTL_G_PMUX, MUXF_UA1_RX, 0)
+			SPPCTL_IOPAD(10, SPPCTL_PCTL_G_PMUX, MUXF_UA1_RTS, 0)
+			SPPCTL_IOPAD(11, SPPCTL_PCTL_G_PMUX, MUXF_UA1_CTS, 0)
+		>;
+	};
+
+	pins_uart2: pinmux-uart2-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(12, SPPCTL_PCTL_G_PMUX, MUXF_UA2_TX, 0)
+			SPPCTL_IOPAD(13, SPPCTL_PCTL_G_PMUX, MUXF_UA2_RX, 0)
+			SPPCTL_IOPAD(14, SPPCTL_PCTL_G_PMUX, MUXF_UA2_RTS, 0)
+			SPPCTL_IOPAD(15, SPPCTL_PCTL_G_PMUX, MUXF_UA2_CTS, 0)
+		>;
+	};
+
+	pins_uart3: pinmux-uart3-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(16, SPPCTL_PCTL_G_PMUX, MUXF_UA3_TX, 0)
+			SPPCTL_IOPAD(17, SPPCTL_PCTL_G_PMUX, MUXF_UA3_RX, 0)
+			SPPCTL_IOPAD(18, SPPCTL_PCTL_G_PMUX, MUXF_UA3_RTS, 0)
+			SPPCTL_IOPAD(19, SPPCTL_PCTL_G_PMUX, MUXF_UA3_CTS, 0)
+		>;
+	};
+
+	/* AP6256 Bluetooth */
+	pins_btuart: pinmux-btuart-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(40, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RX, 0)
+			SPPCTL_IOPAD(41, SPPCTL_PCTL_G_PMUX, MUXF_UA4_TX, 0)
+			SPPCTL_IOPAD(56, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RTS, 0)
+			SPPCTL_IOPAD(49, SPPCTL_PCTL_G_PMUX, MUXF_UA4_CTS, 0)
+		>;
+	};
+
+	pins_bt_reset: pinmux-bt-reset-pins {
+		sunplus,pins = < SPPCTL_IOPAD(82, SPPCTL_PCTL_G_GPIO, 0, 0) >;
+	};
+
+};
-- 
2.53.0


