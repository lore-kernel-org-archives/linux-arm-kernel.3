Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8297CC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4EIBbDtP3pE4sX49bamShduyelpdA+kNTYkxo4+Kss=; b=z+J1qJIPr2Rb8CUCGDH+lxDgJ2
	BeSIiWZuMfIXVrhP5nc93qKWgByVZK8GOkj+g4Zbtf9i3s82NaGXX529fPKjN/vZ38qMIcNtbq/5Y
	NCnJCiOKQKW3az1KSHaiFU7cYhUavUeqIWY5KEWi64X/4J2NatvAsnR/1liBaoOeOxej5ryjMlzMu
	fUv8r9VOTz7w3wkAZNwsyEfx0bGWGqwD+t5EXy28EioD6Na+LFxtPNGojfLVf46ujY2UqUyMlfyPH
	lUzfDyOzwh8pJx2Jx6amymufXkbo7dvvNWyOMvk3UUkL+SISlRj4zuac6aE8fFKLAIkT8LXJc3064
	Yyf4syBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45i5-0000000AT9y-45HK;
	Tue, 08 Sep 2026 23:58:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45i1-0000000AT7y-1Q3V
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 23:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k4EIBbDtP3pE4sX49bamShduyelpdA+kNTYkxo4+Kss=; b=O9cNYY/Kok0fEQdC5IutYhVykd
	JBQy9RgmIL+87bAGJeQDjP/N6VFoi26B+B8vQSaEqbplX5QZFqDHotMZ6ty+Cs2rs1Z944zvWUFWv
	GaC9vwRzCZZMaJxArOsMdtbNR5I/KbiU7Zj/vB/KaioTMGLfAZMibJfkw3uSlXUPX2WKX3WH9LjqF
	g7UO/OXCRj/3+tMVLh1oAbshPa72TXk6i7JxMTHFZIs9tGj7hNnAb9gj7nD48CYjwdzItrjZWZZKb
	wzCj+vOyxIG///U/5lj0dNqmWxFth2JwaYJ6fNE97VUJPcOG0+cfSMEgd+UZdJQarOG7V4uB0OKCR
	Oy0Vh2bw==;
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x45hy-00000000X1U-1JcO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 23:58:36 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-39faa67fabaso32364011fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 16:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788911912; x=1789516712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4EIBbDtP3pE4sX49bamShduyelpdA+kNTYkxo4+Kss=;
        b=SV97NOuVsM0pdMNRfmZVfAe4PC9ZAlSgOWV2QhvNT+nmfja2wNIKyaW/4CrK7EwdjJ
         HIz0Y/meGnm/Nbyyn9mY3ZT6E3zraOyMZILAuuTNE/sJY7tt7nAdeMtBpHeE9TGFl+8T
         dsSS5n4TgVGLCQ6t/E130Ie5nHikAlPeTxsf8HTMe6IHSt6M/91ofQBUttCVHAJF0e3z
         EXzveHr7zUku2ijF6XYeeR7OCRsjWtl4mDCwoRoAZYGelMOS8FF9vqS8SLqxpjs6Dw0E
         ctsPWOnheAG7eZzC1sGF/3dyO9QwSAxQaO38mRb4CnbuzXEgYMfWhIOO6vpDj7eBxzOE
         MQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788911912; x=1789516712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4EIBbDtP3pE4sX49bamShduyelpdA+kNTYkxo4+Kss=;
        b=DhD6DhZDGyK1UihdHwdnGs14Et2xDzFbgRSatzgkmtmUB2xzqMK7w34iU5Ylr/KEdA
         FFzu1Xp0qGGfO3AN1hzPnBhMXztlQrSgx0TIxzaolBVyFUAQv0eKsAbfM+YSwdZnhwZ/
         SBnhjDlfs/0eQV3mqty/eLjZQ0QiqnL8SS4xOMLrLJWzhOXaiifsKffuNmx6UZG2MCqo
         N6LPG5mp8YtdNMJR1ZvgUcTgi1lx5ibMWls6EpBjbXPU/uOklBKpOEpFNRPmcPmA5hnh
         2NjQrNavSVtdTqJXZ11DTDzsOSX3HFOAVQADVdTiuNO+l+QDsb56YjUIDVxVEuekTkSa
         EdLg==
X-Forwarded-Encrypted: i=1; AKwUvBz0H9oGSBEp1P+2VEJnYDxsgUQrozYbawzeuFZBSiPpQqcaRlYuEi6G3FGa3llk695uswzFfHa50NpOovUWlh54@lists.infradead.org
X-Gm-Message-State: AFuF++muzAlzCaJncabFRzgnJgK7H0yP9k5GWnOdxOY6Rc7ck3ButZWc
	PplMQTW0JSmoeCzuiBuPwh1u56DxjnNT/j96EWAYeDyfCW9TJhtMS370
X-Gm-Gg: AYBFou1IoQxc6F97YuaHZIZHfMdO6YKIKfjqtLvzlEKjTdgulZCt7g0Df/6+J2xsxWG
	AsJSqL9AnYBg5V9KTRg5hi4hca8z61y+ph0VNrUpl+y8Czr+PZIy3DruFQJnHawVhsPhwwf22Jh
	06+kW+/FJOzNkq0DBNOpbZDKjq0XUG6rjVX6b4HTPKSN0HjEb78dLVVacLuHSmNtsVfKj0BxnIc
	OmZBu6P/LYrXJQVG/9iMkVnYtMQA6Op1WTaavaF+Lbd660CFTpXe1sM2x4nEVGeJoUKXu52vjHm
	FlJRK/L7OZfVFBsRY6le6E5XMGeVdjxaL7gGggTIjED0tECx5O4SyX0QRydUmKitICm3ie/4RE0
	aqJx8SHV8AV0AxHwHbYbjdpIQK88I/JxFChZbTWYCv4a302vfQdtm67APvxEfZ65MDI+Z/Cqouy
	G6HdItNy0WuhouoLAk3uS8MyDfVPpL0vUNzewA9mkiT+BAGcNilb2uyDjzaUtfpnuUgwemUJV/j
	Rk=
X-Received: by 2002:ac2:4e15:0:b0:5b7:6378:bdd with SMTP id 2adb3069b0e04-5b763780d37mr586405e87.12.1788911911465;
        Tue, 08 Sep 2026 16:58:31 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b765652d3esm127328e87.59.2026.09.08.16.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 16:58:31 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed,  9 Sep 2026 02:58:23 +0300
Message-ID: <20260908235824.665-2-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260908235824.665-1-razor1702@gmail.com>
References: <20260908235824.665-1-razor1702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_005834_579813_7C3ED084 
X-CRM114-Status: GOOD (  22.98  )
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

The NanoPi R28S is a 45x45 mm router board from FriendlyElec with the
Rockchip RK3528A SoC. It has the following features:

- 1GB LPDDR4
- MicroSD card slot
- eMMC module socket
- 1x 1GbE RTL8211F Ethernet on gmac1
- 1x 1GbE RTL8111H Ethernet on the PCIe Gen2 x1 controller
- AICSemi AIC8800D80 Wi-Fi 6 / Bluetooth module on sdio0
- HYM8563 RTC with battery connector
- 1x USB 2.0 Type-C, 5V input and maskrom port
- 1x USB Type-C debug console, uart0 behind a USB-UART bridge
- 2 buttons (User, Maskrom)
- 3 LEDs (SYS, LAN, WAN)

The PHY reset is described on the MAC with snps,reset-gpio rather than in
the PHY node. This board leaves the PHY in reset unless the bootloader
released it, and of_mdio.c reads the PHY ID with get_phy_device() before
phy_device_register() picks up a PHY node's reset-gpios, so described that
way the PHY is reported missing and the port never comes up. As
mii_bus->reset, stmmac runs it before the bus is scanned and defers the
probe until the GPIO controller is available.

Signed-off-by: Andrey Korshunov <razor1702@gmail.com>
---

Tested on the board, booting Armbian images built from this device tree
on 7.2.4 and on v7.3-rc2. Both Ethernet ports carry link: stmmac finds
the RTL8211F on mdio1, and the RTL8111H enumerates behind the PCIe root
port. adc-keys and the HYM8563 RTC probe, and the system runs off the SD
card, iozone included.

An earlier build on v7.3-rc1 wedged the SD host - dw_mmc timing out on a
bare SDMMC_CMD_UPD_CLK, the card then rescanned in a loop, boots taking
minutes or hanging before the rootfs appeared. Neither v7.2.4 nor
v7.3-rc2 does that with the same device tree file, so it did not come
from here.

dwc3 is the one node not exercised beyond probing - the board's only USB
port is the Type-C jack that takes the 5V input and doubles as the
maskrom port, so there is nothing for it to talk to.

 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3528-nanopi-r28s.dts  | 387 ++++++++++++++++++
 2 files changed, 388 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index e7936a21c..12e117159 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-hinlink-h28k.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-r28s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
new file mode 100644
index 000000000..a699b72cf
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
@@ -0,0 +1,387 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 FriendlyElec Computer Tech. Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "rk3528.dtsi"
+
+/ {
+	model = "FriendlyElec NanoPi R28S";
+	compatible = "friendlyarm,nanopi-r28s", "rockchip,rk3528";
+
+	aliases {
+		ethernet0 = &gmac1;
+		i2c1 = &i2c1;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio0;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "MASKROM";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&user_key>;
+
+		button-user {
+			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+			label = "USER";
+			linux,code = <BTN_1>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&lan_led_g>, <&sys_led_r>, <&wan_led_g>;
+
+		led-lan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-sys {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-wan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_WAN;
+			gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <5000000>;
+		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+
+	vdd_0v9: regulator-0v9-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_0v9";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_ddr: regulator-1v1-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v8: regulator-1v8-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_3v3: regulator-3v3-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc3v3_sd: regulator-3v3-vcc-sd {
+		compatible = "regulator-fixed";
+		gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_pwren_l>;
+		regulator-name = "vcc3v3_sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc5v0_sys: regulator-5v0-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vccio_sd: regulator-vccio-sd {
+		compatible = "regulator-gpio";
+		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
+		regulator-name = "vccio_sd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		states = <1800000 0x0>, <3300000 0x1>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_arm: regulator-vdd-arm {
+		compatible = "pwm-regulator";
+		pwms = <&pwm1 0 5000 PWM_POLARITY_INVERTED>;
+		pwm-supply = <&vcc5v0_sys>;
+		regulator-name = "vdd_arm";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <746000>;
+		regulator-max-microvolt = <1201000>;
+		regulator-settling-time-up-us = <250>;
+	};
+
+	vdd_logic: regulator-vdd-logic {
+		compatible = "pwm-regulator";
+		pwms = <&pwm2 0 5000 PWM_POLARITY_INVERTED>;
+		pwm-supply = <&vcc5v0_sys>;
+		regulator-name = "vdd_logic";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <705000>;
+		regulator-max-microvolt = <1006000>;
+		regulator-settling-time-up-us = <250>;
+	};
+};
+
+&combphy {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
+		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 20000 100000>;
+	snps,reset-gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_logic>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m0_xfer>;
+	status = "okay";
+
+	rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PC1 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int_l>;
+		wakeup-source;
+	};
+};
+
+&mdio1 {
+	rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&pcie {
+	reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&pinctrl {
+	ethernet {
+		gmac1_rstn_l: gmac1-rstn-l {
+			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	gpio-keys {
+		user_key: user-key {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	leds {
+		lan_led_g: lan-led-g {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		sys_led_r: sys-led-r {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wan_led_g: wan-led-g {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	rtc {
+		rtc_int_l: rtc-int-l {
+			rockchip,pins = <4 RK_PC1 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	sdmmc {
+		sdmmc_pwren_l: sdmmc-pwren-l {
+			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm1m0_pins>;
+	status = "okay";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm2m0_pins>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
+	non-removable;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+/* Guangzhou Shikun SKI.WB800D80S.1 module, an AICSemi AIC8800D80. */
+&sdio0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer>;
+	status = "okay";
+};
+
+/*
+ * The only USB port on the board is the Type-C jack silkscreened 5V/OTG: it
+ * takes the 5 V input and doubles as the maskrom/eMMC flashing port, so the
+ * controller is device-only. The debug console is not a port of this SoC
+ * either - it reaches uart0 through a separate USB-UART bridge.
+ */
+&usb_host0_xhci {
+	dr_mode = "peripheral";
+	extcon = <&usb2phy>;
+	maximum-speed = "high-speed";
+	phys = <&usb2phy_otg>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.54.0.windows.1


