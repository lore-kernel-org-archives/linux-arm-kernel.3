Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62476D7977E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 15:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zpjb9qiEoko6BYqT2R2iLSBVI8rHRkVBYY+cJfJABg=; b=GfWOxRGpiGGZ6x6IcYlJ8R0GyW
	9Z8kvYhgbpayeyY4AagBsB0h8p1JIITxsOTqaa//em7taxe9rr0rnNfdDEHVYrWJ3FTlIYVSRGL2k
	W0qVnsmKATD5RVOgS3xmk2gw1B4fcfp1v1oV+g074Yoq0LLZ2Lb+IrnXuadgg8BsvNFiPXSY9AE5f
	Cnlamh4t7Ix/oHe5TQyywUAfB14y7PE9RljsmkauQu1u9FvKTpwgpeTHv3uMQoNx5G1iU9wNUHgmb
	kR0GKzh0RmQ2KtQXaXelCjFe2BagJDy6Fd+Omro6sTJB8Fcr9rFoz7lY2cRhLYVmqBu+8coRRjPSh
	Wc50mQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmCwi-00000002kSR-1MIp;
	Sat, 31 Jan 2026 15:31:36 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmCwd-00000002kOh-3rfO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 15:31:33 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso1889409b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Jan 2026 07:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769873491; x=1770478291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zpjb9qiEoko6BYqT2R2iLSBVI8rHRkVBYY+cJfJABg=;
        b=guwRdNgj/6l82r+kkx0IhV5Y/2/LG0I9N7lYg9hzrIMXoEL8MOtan2RmutFBJ+auU+
         Lhj9/M9KbJU4dAFUkhPTM22Rn/e/ewWYIjiVoVzq8uQmNfcdhTmD7h2B53h+uSOTS+Ds
         EKTjy4FdR0kKi1rSmBVhv0UQEN7rKpbQOM1dalVMUHFCXMH3BgdyAVWQush/6s4yyrEw
         C1vIkUZ667kW5ZppV1lKHoGgWvPc1iOO5xfj9xAJWairGOLm5raeh65zKMVnjOv9Wsr2
         ValbpRtgjB7b+4d+WNGQQLoh3u9rRGqZYv0QcMko9oXLkjSdMBq0Q2H85e8s9UPIoJTg
         EsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769873491; x=1770478291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/zpjb9qiEoko6BYqT2R2iLSBVI8rHRkVBYY+cJfJABg=;
        b=HN0IiH0Fl04weOJzLSU+81WvYjKOy9YQWBVnXn1MzwPcnfTx0k+3NHUFJQFmNDgYZ1
         rj3uw4AyH6XnzCH5eEKKELWEuMhQfUUXfawlOOH1mXs+DnKKl/krNjJlwbpNTkIA+Kgp
         wc3inboDMw07tP35Z0FyQg8CgtkZWTi5PASmHZjVo3tnxhfkIU4BQWmT4uNjqYd07Fi2
         4e+a9lySyvyxwrxoiRCQZfvzmOwojkMk32ifYrt3txPAA26RIdTR4NuzrNVqnVEGO3mF
         wGJPcrUbCvzSmbGmIJsmGvxIUvu2hYI450jAbqBoE2Cj+xV+5QDbxfW6OIjjhzjpPcHC
         43iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWStKgcskgbVL7C75oM4b9yGlRg4E9m7CqEPL2j/H7l533muHVwz2rdnrPoQQzfoEC/Hbcpd0e4MvCDRmwxSke0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz36XKGMYIovzy2G+b6mPj77SJIiHiy/qSdQnvPSOeqGRumksU6
	ag5MFcL1pbWv54V9Z9K8URVBsyOOirNX4qMQmXEh8ZktvdgO+LJJtiPI
X-Gm-Gg: AZuq6aINgBpOhgayo4yF3AQakFhkJ5fyQxkPapEfKC07+w9OjiKhKnpJgNAV5OKvNN0
	ySMcOSkYNKdDkffdoiZpkACvSwovhp+OxxiA2vO4byWrGASvioyFuFjdE8RdBnEiesgMS3nhvQD
	WSxA8gidvwGP50bfYdpZs2kjLI+4MDXauvxAsjMKdz1XKYj6zdmJ+WxOi9s9qlUTgbuYQIMJNOb
	vOnpSydi7IjzkMc4kiE6wYkXrEZFjerzPbj5tNnQAU+luTse9SHdHT3I04jWAG/vFoMa8xHBUKx
	fHGHCRNCOIp60T7wmz5sXpkkBSvFyuMUQYFbGxXOp4l/Ogq4TYn65tEdb7UV/zOIBs0NgBo4u7G
	SYmHDXvm8unZ0ZyCOH52xXgl8I2uPyZiLVySP7D0cbyR7PTBK76LCPh7uJ1FJTp1KVt5s6MFNi8
	F0x42P3Ggmvqwui+lNmwFH0tnqxgkBpnbIi3MTBgxdtUnTZbTI
X-Received: by 2002:a05:6a21:690:b0:33f:df99:11e5 with SMTP id adf61e73a8af0-392e0051f35mr6055531637.28.1769873490853;
        Sat, 31 Jan 2026 07:31:30 -0800 (PST)
Received: from arch.localdomain (awork135098.netvigator.com. [219.76.135.98])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642487f1f5sm10701122a12.0.2026.01.31.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 07:31:30 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	dsimic@manjaro.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add OneThing Edge Cube series
Date: Sat, 31 Jan 2026 23:31:03 +0800
Message-ID: <20260131153106.31723-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131153106.31723-1-jerrysteve1101@gmail.com>
References: <20260131153106.31723-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_073131_975244_84319007 
X-CRM114-Status: GOOD (  14.95  )
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

The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
eMMC storage, and supports one SATA interface, one Gigabit Ethernet
port, and one USB 3.0 port.

Other than the difference in RAM capacity, the OEC and OEC-turbo are
identical in all other specifications.

  Specification:
    - Rockchip RK3566
    - LPDDR4X 2GB (OEC) / 4GB (OEC-turbo)
    - eMMC 8GB
    - Gigabit Ethernet port x 1
    - USB 3.0 port x 1
    - USB-C 2.0 port x 1
    - 12V DC Power supply
    - SATA 3.0 connector x 1

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   2 +
 .../rockchip/rk3566-onething-oec-turbo.dts    |  10 +
 .../boot/dts/rockchip/rk3566-onething-oec.dts |  10 +
 .../dts/rockchip/rk3566-onething-oec.dtsi     | 309 ++++++++++++++++++
 4 files changed, 331 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4d384f153c13..ec57719e4573 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -104,6 +104,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353v.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353vs.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-odroid-m1s.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-onething-oec.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-onething-oec-turbo.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v1.1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v2.1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts
new file mode 100644
index 000000000000..16d0cd0cf577
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3566-onething-oec.dtsi"
+
+/ {
+	model = "OneThing OEC-turbo";
+	compatible = "onething,oec-turbo", "rockchip,rk3566";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts
new file mode 100644
index 000000000000..81da771ad63d
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3566-onething-oec.dtsi"
+
+/ {
+	model = "OneThing OEC";
+	compatible = "onething,oec", "rockchip,rk3566";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dtsi
new file mode 100644
index 000000000000..df458a881d0e
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dtsi
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3566.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &gmac1;
+		mmc0 = &sdhci;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	gmac1_clkin: external-gmac1-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "gmac1_clkin";
+		#clock-cells = <0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		rgb_led_b: led-0 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>;
+		};
+
+		rgb_led_g: led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
+		};
+
+		rgb_led_r: led-2 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio0 RK_PC3 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	vcc_1v8: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc12v0_dcin: regulator-vcc12v0-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v0_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc3v3_sys: regulator-vcc3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc12v0_dcin>;
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v0_dcin>;
+	};
+
+	vcc5v0_usb_host: regulator-vcc5v0-usb-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_usb_host_en>;
+		regulator-name = "vcc5v0_usb_host";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_cpu: regulator-vdd-cpu {
+		compatible = "pwm-regulator";
+		pwms = <&pwm0 0 5000 1>;
+		regulator-name = "vdd_cpu";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-settling-time-up-us = <250>;
+		pwm-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_fixed: regulator-vdd-fixed {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fixed";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_logic: regulator-vdd-logic {
+		compatible = "pwm-regulator";
+		pwms = <&pwm1 0 5000 1>;
+		regulator-name = "vdd_logic";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-settling-time-up-us = <250>;
+		pwm-supply = <&vcc5v0_sys>;
+	};
+};
+
+
+/* No hardware video output port */
+&display_subsystem {
+	status = "disabled";
+};
+
+&combphy1 {
+	status = "okay";
+};
+
+&combphy2 {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&gmac1 {
+	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&gmac1_clkin>;
+	clock_in_out = "input";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1m1_miim
+		    &gmac1m1_tx_bus2
+		    &gmac1m1_rx_bus2
+		    &gmac1m1_rgmii_clk
+		    &gmac1m1_rgmii_bus
+		    &gmac1m1_clkinout>;
+	rx_delay = <0x0>;
+	tx_delay = <0x0>;
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&mdio1 {
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pinctrl {
+	usb {
+		vcc5v0_usb_host_en: vcc5v0-usb-host-en {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio1-supply = <&vcc_3v3>;
+	pmuio2-supply = <&vcc_3v3>;
+	vccio1-supply = <&vcc_1v8>;
+	vccio3-supply = <&vcc_3v3>;
+	vccio4-supply = <&vcc_1v8>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_1v8>;
+	vccio7-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&pwm0 {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sata2 {
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	non-removable;
+	status = "okay";
+};
+
+&tsadc {
+	rockchip,hw-tshut-mode = <1>;
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb_host1_xhci  {
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
+&usb2phy0_otg {
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
+&usb2phy1_otg {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
-- 
2.52.0


