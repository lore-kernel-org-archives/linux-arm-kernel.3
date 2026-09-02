Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4205C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYu2Vt6FrK2lOaa8h2hDcB0E3/wKfWbYEhbeZHIZOeY=; b=PQWJ9E1mj8/SzU/ajr8KYleEHK
	rDQIbkxzO8bVspzhH7CCbcgYJ7ZYpAghLJlKB9iEU7jov0xbRfBlN/MCTELxcds4h+1eduGVM9wur
	hV+l7B2n/Br4c8QMhPMCkK5tc2GQJZFDx0UvSpprFDZvnDql9zxufOhcSZP9Ck0136uMfRj8GIBUZ
	8ogvNfFqBxQ/2cqBzhiTPtavK9v9ElyNN7gVNalHY9eGJtTbslKFMJ9NoezDIC6POr6fS+V+t/usQ
	+a7zUeVQrgohRxYwgHZt6QAvINaSX5ybyq735iv1bM583FaGqmQCviMJTlKFDoveCKD8ApBriw9ls
	P+T6gFnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iUO-0000000EOJs-09Uy;
	Wed, 02 Sep 2026 10:46:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iUK-0000000EOIA-3yLd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:46:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so6725965e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1788345999; x=1788950799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SYu2Vt6FrK2lOaa8h2hDcB0E3/wKfWbYEhbeZHIZOeY=;
        b=PJEt1tcY40gs0evgL4RcSF0kIdvQsMW1bcn1aXkubjd3nzGLGz3NhbBe7jcuO3QcYp
         EZxl2R+8ElBklbaO/gEGJ/AMMN851F8hNuO2sQjrSny6PBwIVIaIwFL1HIk2AK8EJFRL
         2cr4pJyv3ZSEtIi2o+puH/Vbn09t7tUS31SI3Sgh52VHcQjsiSiNL7W3f61R+bBB+mXU
         qMjBP9cVAp6fXh8F/N5AsuXXdc2oweujHt/MVrtzXc4jEO+OqegKWoP1WpxLamB4m1HH
         HN96nwwsOI0QgISvz8bCnuI37dVIE4Axt/eFyIMyAqYKRl0j8IMe2Cz4EPoVe2sM7WMy
         Z1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345999; x=1788950799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SYu2Vt6FrK2lOaa8h2hDcB0E3/wKfWbYEhbeZHIZOeY=;
        b=aqp5ZMCWOEr2+E/BaFgfUeJ5EdukCrOlnIbye7i6DraqglKCEsaeq0+0XTmdmnSLv6
         FzFNjCiDLo5o6RK7ZDxHarfW6AEyScvSsE7ZBkV43F3esJ6TIIsf8WC5D+gwWvyZUCD8
         ZX6+1C0QR5H0A74Y+EKdxADCjECII5D2O24LNHzJb7B0Ic5665tZ53p5VKDPXxCesmeO
         egRiGgYDDlHtusnviz9WYjP9lZkYZU68OY1uEN5FkWH56JKTmR/sIfTZDq7L7TJf6suG
         aP+sV5FEOPYlPEu6Mae6fWWHNpVeHuo3sJIjwiTdhztUcnRienma3FVWAfUFXG4mx/W3
         wwHg==
X-Forwarded-Encrypted: i=1; AHgh+RriWeRf8Gz0v+7KHKy4PesXRmWvOGq6k9WB7+Sryogi2VDQr0/UIuIVGXvpLu0VWI8jNq40ya6OEk7zYNUx5caD@lists.infradead.org
X-Gm-Message-State: AFuF++mDI2KdmD2IxpZ/MN+25JjTfokbmWsCa6Iy+KqNHOyzbPVM4UcE
	W/PqkjW5dpQrl6Er5ZXopKOrF0Y2iBEsqj6mqX3PDBthjptA+ZkGb8T/aExs5jjsQSIHkKIgpq0
	YermtbWw=
X-Gm-Gg: AR+sD13U/YuXKTkLUCX6OZS5he+7+ahL+X7LLz2DEKw8DZZDbD7rZWCyQJx9wxCo97i
	FAgnuWP32cUJSWRCMleilgf4vTDjLAoWsRfpMvnFBBkjYzsSplqAstVzXrlvg2mtTd305fjUysY
	6ddCxU/gKAa2ZsZDvVypWoSDNhUgdj3ZoTiF2fXT0ya+hTFAM1Elx7cNAHRQA1UVYgvujEhd/FU
	Ui9o2okpw+OraRgseHkTQ7En7Ecd6ZQdre8SHpC7ceqjGEnlmipYkQYJzELzKsAZUZX8EXzgGJW
	io4ppmOlVeX7228rN9DmCYKhPU5fL7j0Ke0RuRLzDzdejs0KC6G6MPo5tRn/lxvUm01IXxcvJjv
	8bI5XEbOvZ5uC7kNISc+wyBdOz0jy70c6RcwDKjKJUiCWQn5aFCeAhN2iwpE4rOSlg1a2KpvVZR
	p8p8hBwEiLFgOAkeE+ehLnGfKhpbMys+OVLzRzSRwYCQUYnXoxqZJJFektq2enG5XWIZIaax0zQ
	d9Nwyy6MHVcE1i/OjVvXH0=
X-Received: by 2002:a05:600c:6091:b0:499:a760:722f with SMTP id 5b1f17b1804b1-49ce583270emr71190875e9.13.1788345999154;
        Wed, 02 Sep 2026 03:46:39 -0700 (PDT)
Received: from dev-ag.figment.co.za ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5936a5esm20127665e9.3.2026.09.02.03.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:46:38 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: qinjian@cqplus1.com,
	linux-arm-kernel@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	devicetree@vger.kernel.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH 2/2] arm: sunplus: add Tibbo LTPP3G2 board support; update defconfig
Date: Wed,  2 Sep 2026 12:45:45 +0200
Message-ID: <20260902104545.67794-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902104545.67794-1-ag@ffroot.co.za>
References: <20260902104545.67794-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_034641_076953_1BDE8668 
X-CRM114-Status: GOOD (  20.62  )
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

Add a device tree source for the Tibbo LTPP3G2 board based on the
SP7021 SoC. The board features a quad-core ARM Cortex-A7 processor,
4GB eMMC, 10/100 Ethernet via the L2SW switch, and a PWM-controlled
LED.

Enable CONFIG_ARM_ERRATA_814220 to work around a known Cortex-A7 r0p5
erratum.

Enable CGROUP and SECURITY so that the shipped rootfs will boot.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 301 ++++++++++++++++++
 arch/arm/configs/sp7021_defconfig             |  30 ++
 3 files changed, 333 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

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
index 000000000000..c42e6f779ce3
--- /dev/null
+++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
@@ -0,0 +1,301 @@
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
+		bootargs = "console=ttySUP0,115200 earlycon root=/dev/mmcblk0p8 rootwait";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x20000000>; /* 512MB */
+	};
+
+	led {
+		compatible = "gpio-leds";
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&gpio_leds_pins>;
+		pinctrl-1 = <&leds_s0_slp>;
+		system-led {
+			label = "system-led";
+			gpios = <&pctl 6 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			linux,default-trigger = "heartbeat";
+		};
+		led@2 {
+			label = "SG";
+			gpios = <&pctl 7 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
+
+	i2c_tps: i2c-tps { /* eeprom */
+		compatible = "i2c-gpio";
+		i2c-gpio,scl-open-drain;
+		i2c-gpio,sda-open-drain;
+		i2c-gpio,delay-us = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pins_i2ctps>;
+		gpios = <&pctl 2 GPIO_ACTIVE_HIGH  /* SDA */
+			 &pctl 1 GPIO_ACTIVE_HIGH  /* SCL */
+			>;
+		eeprom: eeprom@50 {
+			compatible = "at,24c16";
+			reg = <0x50>;
+			pagesize = <16>;
+		};
+	};
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_pwm>;
+	status = "okay";
+};
+
+&spi_controller0 {
+	spi-cpha;
+	spi-cpol;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_spi0>;
+	status = "disabled";
+};
+
+&spi_controller1 {
+	spi-cpha;
+	spi-cpol;
+	status = "disabled";
+};
+
+&spi_controller2 {
+	spi-cpha;
+	spi-cpol;
+	status = "disabled";
+};
+
+&spi_controller3 {
+	spi-slave;
+	status = "disabled";
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
+	status = "disabled";
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_btuart &pins_bt_reset>;
+	status = "disabled";
+};
+
+&l2sw {
+	pinctrl-names = "default";
+	pinctrl-0 = <&l2sw_ltpp3g2_pins>;
+	status = "okay";
+
+	ethernet-ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			phy-handle = <&eth_phy0>;
+			phy-mode = "rmii";
+			nvmem-cells = <&mac_addr0>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			reg = <1>;
+			phy-handle = <&eth_phy1>;
+			phy-mode = "rmii";
+			nvmem-cells = <&mac_addr1>;
+			nvmem-cell-names = "mac-address";
+		};
+	};
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+		eth_phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
+
+
+&mmc0 {
+	status = "okay";
+};
+
+&rtc {
+	charging-mode = <0xE>;
+	/*
+	 *      0xE     Disable
+	 *      0x1     0.86mA (2K Ohm with diode)
+	 *      0x5     1.81mA (250 Ohm with diode)
+	 *      0x9     2.07mA (50 Ohm with diode)
+	 *      0xD     16.0mA (0 Ohm with diode)
+	 *      0x3     1.36mA (2K Ohm without diode)
+	 *      0x7     3.99mA (250 Ohm without diode)
+	 *      0xB     4.41mA (50 Ohm without diode)
+	 *      0xF     16.0mA (0 Ohm without diode)
+	 */
+};
+
+&pctl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_gpio_nobinded>;
+
+	pins_pwm: pinmux_pwm-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(48, SPPCTL_PCTL_G_PMUX, MUXF_PWM0, 0)
+		>;
+	};
+
+	pins_gpio_nobinded: pinmux_gpio_nobinded-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(30, SPPCTL_PCTL_G_GPIO, 0, 0)   /* was L2SW_LED_FLASH1 */
+			SPPCTL_IOPAD(39, SPPCTL_PCTL_G_GPIO, 0, 0)   /* was L2SW_LED_ON1  */
+		>;
+	};
+
+	pins_i2ctps: pinmux_i2ctps-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(1, SPPCTL_PCTL_G_GPIO, 0,
+				     SPPCTL_PCTL_L_OUT | SPPCTL_PCTL_L_ONV | SPPCTL_PCTL_L_ODR)
+			SPPCTL_IOPAD(2, SPPCTL_PCTL_G_GPIO, 0,
+				     SPPCTL_PCTL_L_OUT | SPPCTL_PCTL_L_ONV | SPPCTL_PCTL_L_ODR)
+		>;
+	};
+
+	l2sw_ltpp3g2_pins: pinmux_l2sw_ltpp3g2-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(63, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_CLK_OUT, 0)
+			SPPCTL_IOPAD(71, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_MAC_SMI_MDC, 0)
+			SPPCTL_IOPAD(64, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_MAC_SMI_MDIO, 0)
+			SPPCTL_IOPAD(62, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_TXEN, 0)
+			SPPCTL_IOPAD(61, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_TXD0, 0)
+			SPPCTL_IOPAD(60, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_TXD1, 0)
+			SPPCTL_IOPAD(59, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_CRSDV, 0)
+			SPPCTL_IOPAD(58, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_RXD0, 0)
+			SPPCTL_IOPAD(57, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P0_MAC_RMII_RXD1, 0)
+			SPPCTL_IOPAD(55, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_TXEN, 0)
+			SPPCTL_IOPAD(54, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_TXD0, 0)
+			SPPCTL_IOPAD(53, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_TXD1, 0)
+			SPPCTL_IOPAD(52, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_CRSDV, 0)
+			SPPCTL_IOPAD(51, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_RXD0, 0)
+			SPPCTL_IOPAD(50, SPPCTL_PCTL_G_PMUX, MUXF_L2SW_P1_MAC_RMII_RXD1, 0)
+		>;
+		sunplus,zerofunc = <
+			MUXF_L2SW_LED_FLASH0
+			MUXF_L2SW_LED_ON0
+			MUXF_L2SW_LED_FLASH1
+			MUXF_L2SW_LED_ON1
+			MUXF_DAISY_MODE
+			MUXF_L2SW_P0_MAC_RMII_RXER
+			MUXF_L2SW_P1_MAC_RMII_RXER
+			GROP_SPI_FLASH
+		>;
+	};
+
+	gpio_leds_pins: pinmux_gpio_leds-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(6, SPPCTL_PCTL_G_GPIO, 0, SPPCTL_PCTL_L_OUT)
+			SPPCTL_IOPAD(7, SPPCTL_PCTL_G_GPIO, 0, SPPCTL_PCTL_L_OUT)
+		>;
+	};
+
+	leds_s0_slp: pinmux_user_leds_s0_slp-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(6, SPPCTL_PCTL_G_GPIO, 0, 0)
+			SPPCTL_IOPAD(7, SPPCTL_PCTL_G_GPIO, 0, 0)
+		>;
+	};
+
+	pins_uart1: pinmux_uart1-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(8, SPPCTL_PCTL_G_PMUX, MUXF_UA1_TX, 0)
+			SPPCTL_IOPAD(9, SPPCTL_PCTL_G_PMUX, MUXF_UA1_RX, 0)
+			SPPCTL_IOPAD(10, SPPCTL_PCTL_G_PMUX, MUXF_UA1_RTS, 0)
+			SPPCTL_IOPAD(11, SPPCTL_PCTL_G_PMUX, MUXF_UA1_CTS, 0)
+		>;
+	};
+
+	pins_uart2: pinmux_uart2-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(12, SPPCTL_PCTL_G_PMUX, MUXF_UA2_TX, 0)
+			SPPCTL_IOPAD(13, SPPCTL_PCTL_G_PMUX, MUXF_UA2_RX, 0)
+			SPPCTL_IOPAD(14, SPPCTL_PCTL_G_PMUX, MUXF_UA2_RTS, 0)
+			SPPCTL_IOPAD(15, SPPCTL_PCTL_G_PMUX, MUXF_UA2_CTS, 0)
+		>;
+	};
+
+	pins_uart3: pinmux_uart3-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(16, SPPCTL_PCTL_G_PMUX, MUXF_UA3_TX, 0)
+			SPPCTL_IOPAD(17, SPPCTL_PCTL_G_PMUX, MUXF_UA3_RX, 0)
+			SPPCTL_IOPAD(18, SPPCTL_PCTL_G_PMUX, MUXF_UA3_RTS, 0)
+			SPPCTL_IOPAD(19, SPPCTL_PCTL_G_PMUX, MUXF_UA3_CTS, 0)
+		>;
+	};
+
+	/* AP6256 Bluetooth */
+	pins_btuart: pinmux_btuart-pins {
+		sunplus,pins = <
+			SPPCTL_IOPAD(40, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RX, 0)
+			SPPCTL_IOPAD(41, SPPCTL_PCTL_G_PMUX, MUXF_UA4_TX, 0)
+			SPPCTL_IOPAD(56, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RTS, SPPCTL_PCTL_L_ONV)
+			SPPCTL_IOPAD(49, SPPCTL_PCTL_G_PMUX, MUXF_UA4_CTS, 0)
+		>;
+	};
+
+	pins_bt_reset: pinmux_bt_reset-pins {
+		sunplus,pins = < SPPCTL_IOPAD(82, SPPCTL_PCTL_G_GPIO, 0, 0) >;
+	};
+
+	pins_spi0: pinmux_spi0-pins {
+		sunplus,pins = <
+			/*SPPCTL_IOPAD(26, SPPCTL_PCTL_G_PMUX, MUXF_SPI0S_EN, 0) */
+			/*SPPCTL_IOPAD(23, SPPCTL_PCTL_G_PMUX, MUXF_SPI0S_DO, 0) */
+			/*SPPCTL_IOPAD(25, SPPCTL_PCTL_G_PMUX, MUXF_SPI0S_DI, 0) */
+			/*SPPCTL_IOPAD(27, SPPCTL_PCTL_G_PMUX, MUXF_SPI0S_CLK, 0) */
+		>;
+	};
+
+};
diff --git a/arch/arm/configs/sp7021_defconfig b/arch/arm/configs/sp7021_defconfig
index ec723401b440..e0c0692f455d 100644
--- a/arch/arm/configs/sp7021_defconfig
+++ b/arch/arm/configs/sp7021_defconfig
@@ -1,4 +1,7 @@
 CONFIG_SYSVIPC=y
+CONFIG_CGROUPS=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_MEMCG=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -16,6 +19,7 @@ CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_SUNPLUS=y
 # CONFIG_VDSO is not set
 CONFIG_SMP=y
+CONFIG_ARM_ERRATA_814220=y
 CONFIG_THUMB2_KERNEL=y
 CONFIG_ARCH_FORCE_MAX_ORDER=11
 CONFIG_VFP=y
@@ -24,11 +28,16 @@ CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_NET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
 CONFIG_UEVENT_HELPER=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
+CONFIG_NETDEVICES=y
+CONFIG_SP7021_EMAC=y
 CONFIG_INPUT_SPARSEKMAP=y
 CONFIG_INPUT_EVDEV=y
 # CONFIG_INPUT_KEYBOARD is not set
@@ -36,6 +45,25 @@ CONFIG_INPUT_EVDEV=y
 # CONFIG_LEGACY_PTYS is not set
 # CONFIG_HW_RANDOM is not set
 # CONFIG_HWMON is not set
+CONFIG_SPI=y
+CONFIG_SPI_SUNPLUS_SP7021=y
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=y
+CONFIG_EEPROM_AT24=y
+CONFIG_MMC=y
+CONFIG_MMC_SUNPLUS=y
+CONFIG_WATCHDOG=y
+CONFIG_WATCHDOG_SYSFS=y
+CONFIG_SUNPLUS_WATCHDOG=y
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_SUNPLUS=y
+CONFIG_NVMEM=y
+CONFIG_NVMEM_SUNPLUS_OCOTP=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_RESET_CONTROLLER=y
 CONFIG_EXT4_FS=y
@@ -51,6 +79,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_NETWORK=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DYNAMIC_DEBUG=y
 CONFIG_MAGIC_SYSRQ=y
-- 
2.53.0


