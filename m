Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BE3EDEC03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 02:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vc/mKMQHWBKWISLIX5zCISp9R0i/eqeNN9jxcO1amd4=; b=MvD+cqKqjVzUsNgwmk+rmEP5bX
	HnBGc2r8t4V2JgdHCVsXn50hdck/vGk9i/ZwiFrPqEtfTw2ptoS2Qm8ooz4u0WdtNbqvlYMtdvIin
	rDK7jjqBqV5Gqu2B0lALoOoJBjisoSIkQiFUyMCn3FQV90dmIjVoldfDqvw/aHNE6W7NlnOd3SBpK
	oBlmGJRRQzXUBfgDX5Fk1d3DlLmx6Hy6O7wmnoJIZt3LKJZ6y6GdeKSPpZ4Md1FSuamUwosuhunN2
	6bF8iUrm7QQkWktQHE9mdYz5QrYirMk2hJwchjuLJUPE8jclgXzaJQTCl/YQMjNGr8e4aX+id/PtW
	x6+NfEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcOi-0000000GKeU-0Ptf;
	Wed, 04 Mar 2026 02:55:40 +0000
Received: from mail-pf1-x461.google.com ([2607:f8b0:4864:20::461])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxcOb-0000000GKZL-1pZ0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 02:55:39 +0000
Received: by mail-pf1-x461.google.com with SMTP id d2e1a72fcca58-829756f3ee9so3264b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 18:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1772592933; x=1773197733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc/mKMQHWBKWISLIX5zCISp9R0i/eqeNN9jxcO1amd4=;
        b=PZ414YcZxoO9DOSibn1nGTh39au7IHoH7HMXM9jTfzXrwv+KPfTvqelhcD7jAxrZ5b
         5j2BYGYdyLhFJIzmBoxzOAKQov4Mp8QyTpIMoiw0qkmDTb4h+SsTCe0UusFpArPJY8Cv
         NDmZzzC//D5lSALSMaA8/E1q0FdBJgYmNLglwUnu/KxptYmpwdUUgECB8w8HPEYQFg4j
         0veirlAmwTzxSezzJRiOd3AlqOkh89WjTS/DvmDJIccJcSqS0pnrTgnkus956T2pi1Hx
         HM+AMrwAn4LDYEkzLsLsSge97BVCcX126BBasTQU8o8AXkadcldlx5O+mZKlXbozdiUM
         Fg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772592933; x=1773197733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vc/mKMQHWBKWISLIX5zCISp9R0i/eqeNN9jxcO1amd4=;
        b=GmvVrgYkG1XWGkx6ZsrmT2YfsAeiy4Cg1DgZW61A9YnE/+eI6ZEjG2BJksLqLGG8ZT
         3vM1CjNSjOcoaXlMg+om9Xzx2JjvokEPf1T9PiLd6alNLZD5vN5zMvCu8Tpn5GpdK81e
         mM5JD0jf4XLlU88YADdtibIxpeB2tpa3vbMZaWt0oqXZbHSSuwh7JrW+/PrQHw9gddz9
         o7XbN4QkQMy0ChfaEQ9Xe1TyKY51sjgn3L9/4W5JM/XlVNrQCNspNIcDcovAvABwcCTM
         pkJxS3faTz5f0rCA7D8hrEH8gGXvGclNXc8tOy9+u1+0Esxya+Rt/H3BM2/Ln6ZYSCpU
         E5gw==
X-Forwarded-Encrypted: i=1; AJvYcCX6dJrju1hKMHP9GZH9buTkRAoUpyi1MPkpB0qNuKXzh0fkENcbmWOEQyzXcH9QuIeWojJ+BPEiyF0MuDJuIF7F@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4ZkE/a/eZqsjXEgTGxAP+0ZoEb8id/xAUIbPu/TToyYDu2KVM
	P8Wf1m891UjQdstKf9rlStEx3a6hewxe2Uj2dHtXlpJeIVtkAIOwZuY0OVue+8tmnwD3niRviNi
	4niJ+BskpqAhc7aiWyWx2k/pHH7VljChLKT5n
X-Gm-Gg: ATEYQzzSzm4BjcTcBhZJiw8LWVgB10X88jng3RsP6QuXbfgBGAndxnI6IDH19oivnzz
	FXbl7i6z+XwoBba7KQSp9vgcRcqq2TevglDmX2TnfJjAyFZrhnVnVo4FI+kSp9Vc2XOMeBlFT3f
	aIcqSH88MU/u5Jo5U1x1azLIiKYXdozRkiVnKp67j5xs/BHZBt1QTQOo3s8X1dvEEU3Qs4GZ4Rw
	yTHC8lwBRSKyECiF3TUtcoLRZR/ckS1gW+JlksK9KdrBFGUTkCmVTsejd9qzCVko62iInPWewsz
	ay2cT1Qm9YOVRGowr02aL4OeFvar9PgzkEXSGIkN4J92AZJ/iTzIpWz2xFuRjwVJey7OmVl/B6K
	N7m2sbvaF/XtfFv2xt+OmuPZ8peKIqWrNFNURFWPcr+U2
X-Received: by 2002:a05:6a21:7d06:b0:395:101e:9b40 with SMTP id adf61e73a8af0-3982dda4262mr500384637.1.1772592932621;
        Tue, 03 Mar 2026 18:55:32 -0800 (PST)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c70fa7d59b3sm1374096a12.7.2026.03.03.18.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 18:55:32 -0800 (PST)
X-Relaying-Domain: ausil.us
From: dennis@ausil.us
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
	Hsun Lai <i@chainsx.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	John Clark <inindev@gmail.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH V2 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
Date: Tue,  3 Mar 2026 20:55:20 -0600
Message-ID: <20260304025521.210377-4-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304025521.210377-1-dennis@ausil.us>
References: <20260304025521.210377-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_185533_480680_4109E348 
X-CRM114-Status: GOOD (  20.84  )
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

From: Dennis Gilmore <dennis@ausil.us>

Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S). The Pro
differs from the base Orange Pi 5 in the following ways:

- No SPI NOR flash; eMMC module slot instead, you can optionally solder
  a SPI NOR fin place and turn off the eMMC
- PCIe-attached NIC (pcie2x1l1) replaces the GMAC1 ethernet
- PCIe NVMe slot (pcie2x1l2)
- AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
- BCM4345C5 Bluetooth via uart9 with full RTS/CTS
- Two-colour (blue/green) GPIO LED using modern color/function binding
- audio is wired up differently

Vendors description and links to schematics available:
http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-5-Pro.html

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 376 ++++++++++++++++++
 2 files changed, 377 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4d384f153c13..c99dca2ae9e7 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -214,6 +214,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5b.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-5-pro.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-orangepi-cm5-base.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-radxa-cm5-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-roc-pc.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
new file mode 100644
index 000000000000..d656328c906d
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include "rk3588s-orangepi-5.dtsi"
+
+/ {
+	model = "Xunlong Orange Pi 5 Pro";
+	compatible = "xunlong,orangepi-5-pro", "rockchip,rk3588s";
+
+	aliases {
+		/delete-property/ ethernet0;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio;
+	};
+
+	/* Pro uses gpio-leds instead; pwm0 LED is not wired up */
+	/delete-node/ pwm-leds;
+
+	/*
+	 * Pro uses i2s2 (i2s2m1 mux) for audio, not i2s1. Recreate the sound
+	 * card node pointing at i2s2_2ch instead.
+	 */
+	/delete-node/ analog-sound;
+
+	analog-sound {
+		compatible = "simple-audio-card";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,bitclock-master = <&masterdai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&masterdai>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "rockchip,es8388";
+		simple-audio-card,routing =
+			"Headphones", "LOUT1",
+			"Headphones", "ROUT1",
+			"LINPUT1", "Microphone Jack",
+			"RINPUT1", "Microphone Jack",
+			"LINPUT2", "Onboard Microphone",
+			"RINPUT2", "Onboard Microphone";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Microphone", "Onboard Microphone",
+			"Headphone", "Headphones";
+
+		simple-audio-card,cpu {
+			sound-dai = <&i2s2_2ch>;
+		};
+
+		masterdai: simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		cooling-levels = <0 50 100 150 200 255>;
+		fan-supply = <&vcc5v0_sys>;
+		pwms = <&pwm2 0 20000000 0>;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&leds_rgb>;
+
+		blue-led {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		green-led {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_ACTIVITY;
+			gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc0";
+		};
+	};
+
+	vcc5v0_otg: regulator-vcc5v0-otg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_otg_en>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "vcc5v0_otg";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio0 RK_PD0 GPIO_ACTIVE_LOW>;
+	};
+
+	vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_pcie20";
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc3v3_pcie_eth: regulator-vcc3v3-pcie-eth {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_pcie_eth";
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+/* disable gmac1 as the pro has a PCIe attached NIC */
+&gmac1 {
+	status = "disabled";
+};
+
+/* 40-pin header pins 3/5 */
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m4_xfer>;
+	status = "okay";
+};
+
+/*
+ * Pro routes audio codec via i2c3 (not i2c6) and i2s2m1 (not i2s1m0).
+ * Delete the inherited es8388 node from i2c6 and redeclare it here.
+ */
+/delete-node/ &es8388;
+
+&i2c3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3m0_xfer>;
+	status = "okay";
+
+	es8388: audio-codec@11 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x11>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&vcc_3v3_s0>;
+		DVDD-supply = <&vcc_1v8_s0>;
+		HPVDD-supply = <&vcc_3v3_s0>;
+		PVDD-supply = <&vcc_3v3_s0>;
+		assigned-clock-rates = <12288000>;
+		assigned-clocks = <&cru I2S2_2CH_MCLKOUT>;
+		clocks = <&cru I2S2_2CH_MCLKOUT>;
+	};
+};
+
+/* 40-pin header pins 27/28 */
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4m3_xfer>;
+	status = "okay";
+};
+
+/*
+ * i2s1_8ch uses i2s1m0 which occupies GPIO4_PA0 (CLKREQ#) and GPIO4_PA1
+ * (WAKE#) needed for the NVMe M.2 slot. Disable it; audio is on i2s2_2ch.
+ */
+&i2s1_8ch {
+	status = "disabled";
+};
+
+/* Audio codec on i2s2, m1 mux; add mclk pin to the base pinctrl */
+&i2s2_2ch {
+	pinctrl-0 = <&i2s2m1_lrck &i2s2m1_mclk &i2s2m1_sclk
+		     &i2s2m1_sdi &i2s2m1_sdo>;
+	status = "okay";
+};
+
+&package_thermal {
+	polling-delay = <1000>;
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
+		};
+	};
+
+	trips {
+		package_fan0: package-fan0 {
+			hysteresis = <2000>;
+			temperature = <55000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			hysteresis = <2000>;
+			temperature = <65000>;
+			type = "active";
+		};
+	};
+};
+
+/* NVMe */
+&pcie2x1l1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie30x1m1_1_clkreqn &pcie30x1m1_1_waken>;
+	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
+	supports-clkreq;
+	vpcie3v3-supply = <&vcc3v3_pcie_eth>;
+	status = "okay";
+};
+
+/* NIC */
+&pcie2x1l2 {
+	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie20>;
+	status = "okay";
+};
+
+&pinctrl {
+	bluetooth {
+		bt_wake_gpio: bt-wake-pin {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host_irq: bt-wake-host-irq {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	gpio-leds {
+		leds_rgb: leds-rgb {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>,
+					<1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		vcc5v0_otg_en: vcc5v0-otg-en {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wlan {
+		wifi_host_wake_irq: wifi-host-wake-irq {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+/* pwm0 pin conflicts with i2c4 pin 27 Pro */
+&pwm0 {
+	status = "disabled";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm2m1_pins>;
+	status = "okay";
+};
+
+&sdhci {
+	status = "okay";
+};
+
+&sdio {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	max-frequency = <150000000>;
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
+		interrupt-names = "host-wake";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_irq>;
+	};
+};
+
+&uart9 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wakeup";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host_irq &bt_wake_gpio>;
+		shutdown-gpios = <&gpio0 RK_PD5 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
+
+/* USB2 OTG PHY for usb_host0_xhci; phy-supply enables VBUS to USB3 Type-A port */
+&u2phy0_otg {
+	phy-supply = <&vcc5v0_otg>;
+};
+
+/* Pro has no FUSB302; the USB-C port is power delivery only */
+/delete-node/ &usbc0;
+
+/*
+ * The Pro's USB-C port is power delivery only: no FUSB302, no data lines,
+ * no alt-mode switching. The parent DTSI enables usbdp_phy0 (status = "okay")
+ * and adds FUSB302 alt-mode/orientation properties; delete those here.
+ *
+ * dp-lane-mux = <0 1>: PHY lanes 0/1 are DP (physically routed to the
+ * LT8711UXD DP→HDMI2 bridge), lanes 2/3 are USB3 SuperSpeed (physically
+ * routed to the USB3 Type-A port P3). Without this property the driver
+ * defaults to USB-only mode and places USB3 on lanes 0/1, which do not
+ * reach the Type-A connector and makes the USB3 port non-functional.
+ */
+&usbdp_phy0 {
+	rockchip,dp-lane-mux = <0 1>;
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+	/delete-property/ sbu1-dc-gpios;
+	/delete-property/ sbu2-dc-gpios;
+	/delete-node/ port;
+};
+
+/* USB3 Type-A port*/
+&usb_host0_xhci {
+	dr_mode = "host";
+	/delete-property/ usb-role-switch;
+	status = "okay";
+	/delete-node/ port;
+};
+
+/*
+ * combphy2_psu is shared between usb_host2_xhci (USB3) and pcie2x1l1 (PCIe).
+ * Disable USB3 so the PHY can be used for the NVMe M.2 slot.
+ */
+&usb_host2_xhci {
+	status = "disabled";
+};
-- 
2.53.0


