Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDFED5B158
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWSTfVrTz9AP+H16kOXILeM/kriLrvt4t2SX+p4mfaY=; b=pRWCnicWA+475/zk+z4nzbwGKq
	lrcGvzMvNrGgMs5Zi20vQRwajRC1jDcTln2LpgijuDLCg0jqzoH3+oOliv3nZXAN5bJKUH4i4dxdA
	IdxLAbIeMLfALZyaT5yEFAThTWu8L47EKKiVNXWQwyv3Xl5VwpGsx5dPfvey2M+uuvtmIrfeth38Q
	EHjP2iW3ub8dLsKrAZ1qmMmTVUzkLHFoWu4pqKEKRTo9QzqBFJnjVj1cFDh9V03zZMqhpjWXM/2EP
	Nb1JZ70Ci7HnTGFZZqfd4EynRbFoOTyBR3jspnFE55QihGFOgY4x8jP9vo4xfj+dcVwc/HJXeJirH
	yMDzg0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Xmy-0000000CRvs-2sig;
	Mon, 28 Oct 2024 22:00:40 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XMy-0000000CLfO-2y0Q;
	Mon, 28 Oct 2024 21:33:50 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539fbbadf83so6135682e87.0;
        Mon, 28 Oct 2024 14:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730151227; x=1730756027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWSTfVrTz9AP+H16kOXILeM/kriLrvt4t2SX+p4mfaY=;
        b=ObnofKz4oSEzKsw1DceNqmTVev4Y+eUoKWtWJFEbrFId5K7pgEvzIlTikzD7LgNxRS
         1sxSI6qE/mk4IWcpkF99HoANLKYxiXzin/JocdllzdE7AmrCCbD2RiNFkjY6K7ClsX9I
         u2YsRWlfOrSRzhDTE/Urw8NKHTwiR6sx47NDEh+iQoStDfSMOOpqNJMWlj9iJhMxjAQ4
         Yj4Au4cv7Hi7PauCaJyqF9cG6SMHc4SKRZEFj/adjYGacP/PBzJBipRnjXhJmgHq3qeB
         UUeNLipWMdYMJGedGCVgZ+DbRo8AalOAvxNkdnuZNJ5fKa47MfG/ogwbZo6DS9vf4Qtz
         o26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151227; x=1730756027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWSTfVrTz9AP+H16kOXILeM/kriLrvt4t2SX+p4mfaY=;
        b=wKotI3WNl8L+hYv3hMm2kzPp/0NY2J1h82qTDyO4VqQztxNkLBQd9YuEpGmpQ2e8Iw
         NlBwVkwjlB3m6XEiQd79ahYdCAbDadG7GJo6mGTw+CJah2d4L9oWFeabFtqqWuivhnSA
         B9hdFUtX9I99Q5jYnTm1mUI5bJk6HSxWxajvXJpdwfbY4mrYYTCQ7lB9Qlhjk3AFCIjo
         8+uu/JGmfKcauNdCZnO3bo3Y5/XOQANZt9r3jpMfYVsBdyIywL2w0TJTLTGt4dN/2Wm/
         6cCIHrRR4846Wc8MscZp78dTHM4Q0cVazmCrB7jrFdXAJDrwLKjLKrU3Sor9ghQilnU0
         DsUw==
X-Forwarded-Encrypted: i=1; AJvYcCUHSy6YLXyQOw6LtMBJUU2CfwPCVQiXYJIz5iSn5y0GMUr8qWeItQj3Ki4rwxkkcY0heHtXU7/H+tXj/u4QMT0=@lists.infradead.org, AJvYcCXApawmZYjxeW9LiRRi4rLAHQVj+H9qLENLB4laSoqD4+KEYY4zBzslTtwc5j5Cs5yy333B//BUcbDu8P6caRsP@lists.infradead.org
X-Gm-Message-State: AOJu0YysNEQHLk6iZAE5Yh+O32Q8Xrar0ZRtWqO3E/xo+eEvwnvwxW5F
	SUFk0mfNFP7eTULXWGteqAR1mX2QK8QaeZG2d9oJsWb9rX0JVZdh
X-Google-Smtp-Source: AGHT+IFAomt0AVe+GUKrHV4M2ZQ62vizEQvRSHAA+LSxQ2V19mOQG1miy8q5i3RNLCq7CcUyt+3Ygg==
X-Received: by 2002:a05:6512:3d0c:b0:539:f763:789d with SMTP id 2adb3069b0e04-53b3490f13dmr4339756e87.43.1730151226894;
        Mon, 28 Oct 2024 14:33:46 -0700 (PDT)
Received: from localhost.localdomain ([91.90.219.38])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c98b9sm1204625e87.224.2024.10.28.14.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:33:46 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: add Banana Pi BPI-P2 Pro board
Date: Tue, 29 Oct 2024 02:33:14 +0500
Message-ID: <20241028213314.476776-4-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028213314.476776-1-dmt.yashin@gmail.com>
References: <20241028213314.476776-1-dmt.yashin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_143348_939695_148AFCE3 
X-CRM114-Status: GOOD (  15.01  )
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

Banana Pi BPI-P2 Pro is the SBC made by Shenzhen SINOVOIP based on
Rockchip RK3308.

Banana Pi BPI-P2 Pro features:
- Rockchip RK3308B-S
- DDR3 512 MB
- eMMC 8 GB
- 100M lan + onboard PoE
- 40 pin and 12 pin headers
- AP6256 BT + WIFI
- TF card slot
- 2x USB 2.0 (Type-C OTG and Type-A)
- Headphone jack

Add support for Banana Pi BPI-P2 Pro.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3308-bpi-p2-pro.dts   | 362 ++++++++++++++++++
 2 files changed, 363 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-bpi-p2-pro.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 2e485553ce8b..4c1fd113bdef 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-ctouch2-of10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-firefly-jd4-core-mb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-ringneck-haikou.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-bpi-p2-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-evb.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-roc-cc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-rock-pi-s.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3308-bpi-p2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3308-bpi-p2-pro.dts
new file mode 100644
index 000000000000..bd821fc38fea
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3308-bpi-p2-pro.dts
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include "rk3308.dtsi"
+
+/ {
+	model = "Banana Pi BPI-P2 Pro (RK3308) Board";
+	compatible = "sinovoip,rk3308-bpi-p2pro", "rockchip,rk3308";
+
+	aliases {
+		ethernet0 = &gmac;
+		mmc0 = &emmc;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-recovery {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+
+	analog-sound {
+		compatible = "audio-graph-card";
+		label = "rockchip,rk3308";
+
+		dais = <&i2s_8ch_2_p0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&phone_ctl>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_en0>, <&led_en1>;
+
+		blue-led {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "on";
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_HIGH>;
+			label = "blue:power";
+			linux,default-trigger = "default-on";
+		};
+
+		green-led {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;
+			label = "green:heartbeat";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	vdd_log: regulator-1v04-vdd-log {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_log";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1040000>;
+		regulator-max-microvolt = <1040000>;
+		vin-supply = <&vcc_in>;
+	};
+
+	vcc_ddr: regulator-1v5-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		vin-supply = <&vcc_in>;
+	};
+
+	vcc_1v8: regulator-1v8-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_io>;
+	};
+
+	vcc_io: regulator-3v3-vcc-io {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_io";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_in>;
+	};
+
+	vcc_in: regulator-5v0-vcc-in {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_in";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vdd_core: regulator-vdd-core {
+		compatible = "pwm-regulator";
+		pwms = <&pwm0 0 5000 1>;
+		pwm-supply = <&vcc_in>;
+		regulator-name = "vdd_core";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <827000>;
+		regulator-max-microvolt = <1340000>;
+		regulator-settling-time-up-us = <250>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-0 = <&wifi_reg_on>;
+		pinctrl-names = "default";
+		reset-gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&codec {
+	status = "okay";
+
+	port {
+		codec_p0_0: endpoint {
+			remote-endpoint = <&i2s_8ch_2_p0_0>;
+		};
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_core>;
+};
+
+&emmc {
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_pwren>;
+	status = "okay";
+};
+
+&gmac {
+	assigned-clocks = <&cru SCLK_MAC>;
+	assigned-clock-parents = <&mac_clkin>;
+	clock_in_out = "input";
+	phy-handle = <&rtl8201f>;
+	phy-supply = <&vcc_io>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		rtl8201f: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <1>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&mac_rst>;
+			reset-assert-us = <50000>;
+			reset-deassert-us = <50000>;
+			reset-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&i2s_8ch_2 {
+	#sound-dai-cells = <0>;
+	status = "okay";
+
+	i2s_8ch_2_p0: port {
+		i2s_8ch_2_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&codec_p0_0>;
+		};
+	};
+};
+
+&io_domains {
+	vccio0-supply = <&vcc_io>;
+	vccio1-supply = <&vcc_io>;
+	vccio2-supply = <&vcc_io>;
+	vccio3-supply = <&vcc_io>;
+	vccio4-supply = <&vcc_1v8>;
+	vccio5-supply = <&vcc_io>;
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rtc_32k>;
+
+	bt {
+		bt_reg_on: bt-reg-on {
+			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		host_wake_bt: host-wake-bt {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	gmac {
+		mac_rst: mac-rst {
+			rockchip,pins = <0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		led_en0: led-en0 {
+			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		led_en1: led-en1 {
+			rockchip,pins = <0 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	sound {
+		phone_ctl: phone-ctl {
+			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wifi_wake_host: wifi-wake-host {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&pwm0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm0_pin_pull_down>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+/* WIFI part of the AP6256 connected with SDIO */
+&sdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	status = "okay";
+
+	ap6256: wifi@1 {
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_wake_host>;
+	};
+};
+
+&sdmmc {
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	vmmc-supply = <&vcc_io>;
+	status = "okay";
+};
+
+&u2phy {
+	status = "okay";
+};
+
+&u2phy_host {
+	status = "okay";
+};
+
+&u2phy_otg {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+/* BT part of the AP6256 connected with UART */
+&uart4 {
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&cru SCLK_RTC32K>;
+		clock-names = "lpo";
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PB4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wakeup";
+		device-wakeup-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_reg_on &bt_wake_host &host_wake_bt>;
+		vbat-supply = <&vcc_io>;
+		vddio-supply = <&vcc_1v8>;
+	};
+};
+
+&usb20_otg {
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&usb_host_ehci {
+	status = "okay";
+};
+
+&usb_host_ohci {
+	status = "okay";
+};
+
+&wdt {
+	status = "okay";
+};
-- 
2.39.5


