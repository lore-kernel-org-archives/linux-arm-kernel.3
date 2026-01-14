Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5738DD31A0E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 06:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqboQ4ROVgM/dfJzro4IzHUtcI9B21cZXNDgBmCYmWI=; b=HSd5aeKtRWZx1hx3UGhg7doiU3
	L4fbqjhkOzEoHMoif1O5RO3vwqOT5ZwZ9hBpnRYB9x2tKbrDJCV2cdiHPTb0R0lhDsEvKOfU4IJVW
	VrEw8p6+hTN5pYOlB2Fdl/FO3IxBkt4ESiSR33okn/c0krXrN5i00yfSagvi/NDLDR9o+TiZUMc+h
	x8RdD9/YkFLOrycj2TjFDQxWaPLP/qdJgl0W0P+oWhfAKhErgLsVzAsJqNxrEaHwTP3S92MdwkL4H
	9mCoikFUZ2Q7L7qr0CR2uZ+3ujfCv+0pns9O3+05+QRjgbqaeyEXtq/qVcEINKNM2xk/sdZru8sbk
	3bpuG15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKh-000000087Pv-1b0x;
	Wed, 14 Jan 2026 06:26:19 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKc-000000087Ns-2W5K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 06:26:15 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso3205559a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 22:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768371973; x=1768976773; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GqboQ4ROVgM/dfJzro4IzHUtcI9B21cZXNDgBmCYmWI=;
        b=MJ8FHuGurZ8qoFOXlDq1jsQe4ieeSUhwHwtKvn5QlpzIX52iEiG1n+gY50IIBMcHAN
         +KdGErt//HOyY+4lH2bTZX5xDo6L3eBpRrnhw6ZBV3YGl+t0q0GQCxqxjTKQ/de+p9CK
         T+1geM5w0YvbNJOEV/IhltKrQu5cnHJ8zpVMmNx+Mjd+aFvED10IHvAO6jFhiSigX9x+
         14xw/qccINsK2cb5l5Th46n6XghrOXXiwnhSbdCMc89F6YHRmdGF5zv79Nozaw6lhiUA
         EKq+qR5XuVhRLpmd+x+jfZwzE4OBQ3rvsTa8kPdoc/5TmTsCkcpsPxDN1vDr9GS3wASq
         QFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768371973; x=1768976773;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqboQ4ROVgM/dfJzro4IzHUtcI9B21cZXNDgBmCYmWI=;
        b=mgYAQO6kovIzOU7MchA5yqVg7GjeF5Dwa4DEb7a2IhUbi0vCeLEg+8FjJyFLfrP6/E
         TqblqTzjgFXN88tC/fKUUXxKTGiMmyiCsB5U7PtKPV9S7tOGAW3qrNlRNUDSVCK54an9
         nCuDT8h7O0eA74EizTaoNmEMHgbDmVFQCT/reUWZ7HUjnEJXgkNauqat0wBhW+Mk3nZv
         IbQcJLJlwO5zlwNjF2VJW1ze/K26GR4eDqSEMcLEM4kg32Ou70a671693vtlUPZqGlAX
         nkAFjYSIbz+tM5gEfkfLndw7lobYilD7ER3BPAQNQNDikmNJrlXCNRac5I4CC6vDNdnM
         MRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/6Cd6RGoQo8IcYoA24o75akCALxAllEWusDDRxn6D4hSkJGXGv307wijjoMJn5R/cIO0gluqDZw1CUmduIwqR@lists.infradead.org
X-Gm-Message-State: AOJu0YxtJjE2w9m+rWGpWABk6i20i+UVHgFZE54vFt8JflQ0IM/GmnpP
	+rYfhvXzEtzW2ZeHGcF5O2guDoCgQecfUQ4KwqSYwEDbUCRGRUEDeYelPGJxU8yY9I6+Zwml
X-Gm-Gg: AY/fxX6j51E1JHqzkw+vjsK/lHp9yUTYa26pSAT1X6B3lhJ/2xjR33fZJqpegAM+zdt
	d8aWnzPbnDss0deXIqEe8MeyizLLSCKpxWXECdicVNO8yOuTFrtypmqERaU3OqctMssJnJClcd7
	uslvtWj2TNLbzLKN8RDAdC7XWa/0XHfFhlhY86aMsVkzWN0zqGV6VVtYKgQKxvxCT24WN2O+ENG
	DZg/Zpuo0ABitlk6pYkwyv1TTLNG9Lxp/nBzaWIl4qd2x+EIxdpnsMT+knlWZo84OTWPvr6StCu
	JgxDtnGANlpq6HrtcEwBap1029hhz2MIz50pQL+2IpLBvlrTa5q/USYRhOteJwh5BsqwvGq4l+5
	Y1uOlTDqulJZ9VpnrbKVwtzz3+1cXwiXbK5qqz9s+wcbsTG5QSY2JuYf9JyW/xsr8o5Dx9ftVrh
	nXCCyL1BE=
X-Received: by 2002:a17:90a:e7cc:b0:340:bb56:79de with SMTP id 98e67ed59e1d1-351091780eemr1590209a91.30.1768371973579;
        Tue, 13 Jan 2026 22:26:13 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109d88f0esm891791a91.5.2026.01.13.22.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 22:26:13 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com,
	christianshewitt@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	nick@khadas.com
Subject: [PATCH v2 2/2] arm64: dts: add initial device-tree for Khadas VIM1S
Date: Wed, 14 Jan 2026 14:25:49 +0800
Message-Id: <20260114062549.68954-3-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260114062549.68954-1-nick@khadas.com>
References: <20260114062549.68954-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_222614_637149_0BC85A87 
X-CRM114-Status: GOOD (  15.25  )
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

The Khadas VIM1S uses the Amlogic S905Y4 SoC, based on the
Amlogic S4 SoC family, on a board with the same form factor as the
VIM/VIM2/VIM3/VIM4 models. Serial debug console, ethernet, SD card
work with this initial device-tree.

It features:
 - 2GB LPDDR4 RAM
 - 16GB eMMC 5.1 storage
 - 32MB SPI flash
 - 100 Base-T Ethernet
 - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
 - HDMI 2.1 video
 - 2x USB 2.0 ports
 - 1x USB-C (power) with USB 2.0 OTG
 - 2x LED's (1x red, 1x white)
 - 3x buttons (power, function, reset)
 - IR receiver
 - 40pin GPIO Header
 - 1x micro SD card slot

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 190 ++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 219fb088c704d..15f9c817e5023 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -85,6 +85,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905y4-khadas-vim1s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
new file mode 100644
index 0000000000000..a371ddcdb5e99
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Khadas Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "meson-s4.dtsi"
+
+/ {
+	model = "Khadas VIM1S";
+	compatible = "khadas,vim1s", "amlogic,s4";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		mmc0 = &emmc; /* eMMC */
+		mmc1 = &sd; /* SD card */
+		mmc2 = &sdio; /* SDIO */
+		serial0 = &uart_b;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 52 MiB reserved for ARM Trusted Firmware */
+		secmon_reserved: secmon@5000000 {
+			reg = <0x0 0x05000000 0x0 0x3400000>;
+			no-map;
+		};
+	};
+
+	sdio_32k: sdio-32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&sdio_32k>;
+		clock-names = "ext_clock";
+	};
+
+	main_5v: regulator-main-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	sd_3v3: regulator-sd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "SD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+	};
+
+	vddio_sd: regulator-vddio-sd {
+		compatible = "regulator-gpio";
+		regulator-name = "VDDIO_SD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <1800000 1
+				3300000 0>;
+	};
+
+	/* SY8120B1ABC DC/DC Regulator. */
+	vddcpu: regulator-vddcpu {
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+
+		vin-supply = <&main_5v>;
+
+		pwms = <&pwm_ij 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+		/* Voltage Duty-Cycle */
+		voltage-table = <1049000 0>,
+				<1039000 3>,
+				<1029000 6>,
+				<1019000 9>,
+				<1009000 12>,
+				<999000 14>,
+				<989000 17>,
+				<979000 20>,
+				<969000 23>,
+				<959000 26>,
+				<949000 29>,
+				<939000 31>,
+				<929000 34>,
+				<919000 37>,
+				<909000 40>,
+				<899000 43>,
+				<889000 45>,
+				<879000 48>,
+				<869000 51>,
+				<859000 54>,
+				<849000 56>,
+				<839000 59>,
+				<829000 62>,
+				<819000 65>,
+				<809000 68>,
+				<799000 70>,
+				<789000 73>,
+				<779000 76>,
+				<769000 79>,
+				<759000 81>,
+				<749000 84>,
+				<739000 87>,
+				<729000 89>,
+				<719000 92>,
+				<709000 95>,
+				<699000 98>,
+				<689000 100>;
+	};
+};
+
+&ethmac {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins1>;
+	pinctrl-names = "default";
+};
+
+&pwm_ij {
+	status = "okay";
+};
+
+&sd {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <4>;
+	cap-sd-highspeed;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	max-frequency = <200000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&sd_3v3>;
+	vqmmc-supply = <&vddio_sd>;
+};
+
+&spicc0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spicc0_pins_x>;
+	cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
+};
+
+&uart_b {
+	status = "okay";
+};
-- 
2.34.1


