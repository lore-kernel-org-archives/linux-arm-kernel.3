Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62FDD29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIKHQA9Koa5dAWUwBAWIQNMUXdy4WVVSFWlJdkhck6g=; b=T92ESvFsHOe2wXDktmDV1k9iSF
	scJB4j9Nk96rssQr1JvY4d9xNm0kQpKmwQfu7rQePfErG18zE6cavhT4RSUxw7gIxbMk7sx2ncrK8
	GTsPleXhJHk7kVyw6NhtNTTHL8Vw21ZTj3xmJz4SMVbXgfX2s+7D3A0YuVCpgim/7bFy/4R5ZBcPv
	nPConcZMKp3vbDyT+zfTTfEGVAMdtZRKW0D3xQ9aCHuuqp+B/JsSv1m6jnMcotKyVE79LQwEy0jBS
	uxqBY66OuqVih+93fAn+sUqT+I0ECBY3qk97C6H5F4GRpUD/bl0GdzhvAiGEvpYEsmMh3YUikLKPj
	PswgYnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaUC-00000006p4M-2V4l;
	Tue, 13 Jan 2026 09:14:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaU6-00000006p1e-3R4c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 09:14:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a07fac8aa1so55118475ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 01:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295682; x=1768900482; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gIKHQA9Koa5dAWUwBAWIQNMUXdy4WVVSFWlJdkhck6g=;
        b=W+iFHdlUKnxNqtzIiBPshyDkd7SibVAvRRoJMmdjkAQBvLGKHajbK496LImhwgvNcR
         z8nccSbQNG20Gmn2qxTA3YkEet4EI3n5LawKpd5xkPVHD+kxmOh5AZkcRULeCd/2fPji
         EWbPANZcrZMElCsjlUDNkaw8wxdYBerk6GqhpnQv0HMjED/qUj28vfEqw6n4JoWf7cpb
         PY0Ist8x9azbmpPrCUHyI6PO1l4GOSLgEsYCHgCr5huJWsV0mMFft1C6iwYECXFxQ9Jc
         hBNIkwIhOoqgnCoWReEt20cTVFOBIEy765t9hLrVIOv/sViuGKOFvUhiysJzZrgWkfZ/
         z5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295682; x=1768900482;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIKHQA9Koa5dAWUwBAWIQNMUXdy4WVVSFWlJdkhck6g=;
        b=G25Q+PC+bgakA6XiWrFF71to6CfHxoouAoOFxRaRvR69fQLB8FbNAqSGNP3cLJf+Ke
         aQOG8gpIGjWVnsnuorkLirYxnb8Y9bVJiQ7EN7EGZWRDKyPu/3LiVBvCGLdR0wClT2HQ
         XAGSf0uIxHjhAa1F8fSlCFiQ2t2rpbz/Jx6YzkURNaorw+I4gEBfW1vDdr4peuvvErmM
         9tDP9JKhsHvrbtLskoUPRB1/eT6iNHdKQwF/Ye3d/oEs9UifbLAaY6kX7qiL4Y5JHM9+
         qj6eERZy7Uc+KWF/qDvmKgEuNrHBQ2i+z3zjT/4QQrn9QGNIITnEH+N2ksIqbP2PV9Ts
         irtA==
X-Forwarded-Encrypted: i=1; AJvYcCXiTyBV1mpqBY9KmG25/LP7t0pHrqy4bSGYS//z+r/LtRCQ9KSdYe96LVVtgNWPT1fXIlI+noQt0NWPRmWwIATJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4F8g8zocFcCtW/+TQhQ03MYjr7cQODt4uKCF/tjMoGULj7VHe
	zoHnflvBpRikaXV1R+/mqOsm0TFBOqzy48akLRZwrXJXPvxPrQdIv9ou
X-Gm-Gg: AY/fxX40+hwJW7ionon15DRJaDI4ACUy5eGqHRtqPHEdc+VCsu4Rep5uKvyQ5Ow49Af
	dzdCXLAWUs6WnDhxBxlzptEnRqv0qlBG624bENrP+QwZBMW11SQsJP5IeL1lvk7m+fsQN/OAi05
	xIfiBYc4YNw9ow11g22+wW/cSvHO4cHN/X+GpkGct+wn1WXPEfHj2mUAWJpWj6767nwPqrvalrJ
	MYS60qUwMafrMVqJb3lzIiuFLTyjK5+6S+t0ezG/Uai4hpDLtLb1LYolfN7gQsFKnFr3ehRnwF8
	RhlN3N9B9z+5YfOq08UbqbLGhl6NLanXHpF6s7QDmAVbVr5+PR9VNxVm08WRbhRY10crxVeZnL1
	ElAFRUvcJiGbfy48JOTPULWadDk3RRoY3FEcd4rbtFDkNuM6X2KchN1oF3EPMpzkR8YxPpeBu3C
	gF1cnHYB4=
X-Google-Smtp-Source: AGHT+IHpabFlSVaMvIjeDmekiCt4f6v2Xl95ZHSz3fxaipc1z6UfyXOAZumovWpEHXCAcpcvCKPXig==
X-Received: by 2002:a17:903:1a6f:b0:2a3:ee53:d201 with SMTP id d9443c01a7336-2a3ee53d218mr208331835ad.12.1768295682052;
        Tue, 13 Jan 2026 01:14:42 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c0bsm15293915ad.31.2026.01.13.01.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:14:41 -0800 (PST)
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
Subject: [PATCH v1 2/2] arm64: dts: add initial device-tree for Khadas VIM1S
Date: Tue, 13 Jan 2026 17:09:51 +0800
Message-Id: <20260113090951.35928-3-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260113090951.35928-1-nick@khadas.com>
References: <20260113090951.35928-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_011444_330929_C4ECAB80 
X-CRM114-Status: GOOD (  15.36  )
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
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 191 ++++++++++++++++++
 2 files changed, 192 insertions(+)
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
index 0000000000000..0cd5f9b674830
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -0,0 +1,191 @@
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
+	sdcard_power: regulator-sdcard {
+		compatible = "regulator-fixed";
+		regulator-name = "SDCARD_POWER";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
+		enable-active-low;
+		regulator-always-on;
+	};
+
+	vddio_card: gpio-regulator {
+		compatible = "regulator-gpio";
+		regulator-name = "VDDIO_CARD";
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
+	vmmc-supply = <&sdcard_power>;
+	vqmmc-supply = <&vddio_card>;
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


