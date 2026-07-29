Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CF1C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=; b=dRi1GD+uvY4jwlWi2+7JS6Kepq
	nTvlNxZqmgbnOlG54kYS40XeROWy1S7/LFSApwFfvGOB1YYtdBMTPruNafNbg9WbXkg0OjY1cP7WE
	RzyeeXmOmbVKwyDlBX31Qs1F4XQ5/GWNZ1e3d3E4uRM1lY4X5ywABrje0B1XTgROSJnXEdnA2yPkq
	UA8XfGg5ejDDiz/3Bn/03LANaZwJhAxilWEMSibqf2QlonCojBz8MP4KQpRE9HBls09srACTRiITX
	4nFgIn6KPMjbagvq7T0D2egpI9Tbvaayp7zUnn3jtubgoY88OVqLUpFjEcXqIriOGco2RbAVw333M
	gpfZ1C+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51e-00000008Dn8-2s2k;
	Wed, 29 Jul 2026 14:12:50 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp51W-00000008DiA-0p6J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 14:12:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so665711f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785334360; x=1785939160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=LL5BVvTM4FZCiiLyaEzSxtckIKxZEQ1jmjGBW06+JfZJfVlOKDVXUxTVqHjIG2I/dQ
         LMCsoxDxW4qPL/5vAA//n9gX8MUlUkSGN1vn9JBgE9Gkhbl+v836RitOI0xlbI1GCbUS
         Yr/aSSZLncu80USxqyd8w0DANc9D7FfWkoserD/FsuM1HCQtS89nZ1z44QzuYVIgjh+o
         kgAZBw2kE3Ew6LxTb7iI4ATltNM1EmNIWGshZDVacMQnvZ/lZdKmMqNuYQopVXmyhNZp
         vC22f6RWW2TuAuXmBjv+m1i8x6rDcTCalZtmPeICO1uU0phiU4jeifCgAlB8QM8Qyrjw
         W0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785334360; x=1785939160;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dg/MbR2Z6TESuIFxgaSk9l6XDWrZ8tDzJ8s/nIWGkrA=;
        b=VU+QYB8sw561AgUMc13a5ObCR7n6GMLf4EfPS3+D2H3fuBZitbF2WzE47/vHHiuUpb
         vpfUQ0oke3BUEvfPGTCHKHHGXGpo6rI0KWdBQF6+IeJmWOS71Aa7Azn7jRelF7JuPZ41
         w+sHmxYG5WsaW2SJa/LPT2YrMcLtfRJ6B3HSWD1Kjuu9VtyXbQc8xShwNC2hCbGq/5sM
         /DZ+vDb7Q9K2QGwPUHe4nU3B7WkRufCYnLA4IGCF258hYhIPAguKEmQdb3tJPvrpFABH
         ypRt2F1x1fhT8lIVkZxaWZD/aBnJOTWH3nbYQ2FFSrjajji66gzYS+xwSmSe+qHpD93m
         wEIQ==
X-Forwarded-Encrypted: i=1; AHgh+RofuPUNMDVYd30l0vHNkhY9lZlZP8DWrBbcIJDYAbtIyVi9d7BZCBIdNiZQcX9b2AYsJOrHzSXXqQxgoSY7v9ut@lists.infradead.org
X-Gm-Message-State: AOJu0YzG5ZMN98rrIWvLkcmqSkDPGJmCPLqGsEDkJgxrGx7dwgB6rqxt
	82P8jH1c11MEM6/5If/dMGSZ/I2kbmqPNmRhSnIoHAlJe7OvwKwTJIN5
X-Gm-Gg: AR+sD10Sfad6fWQ05CpmxRk2j2r/8IkBailREerOVZuKaP4cQiFcooZqOYloNxq2omh
	Luvdhj5eLupXDzfhj9fCUpMfPOCillQ3CXg8KEMpb2N8nbpDfCrHuAOVYTRGA/KnvOiP92LUtJB
	xavbbsK5t0zYjE3/4RBUhKUkfzunCTfDb6iSwsUJDRqfENLr7EVvQUNtX1qxVo0NZT7x9XL1rGv
	Zib9UKpJiqIWgxmc8PLBKXChkai1LkPNd2RNTnwWW+248wquATscT5vAPkbt2sCYesmADGOvrPp
	5nT75jNgsU0x6Bn7Y1uwIDX7/5WyVSgW8Rg3SrzOYNWzs6Rd6XYfvbEwxL0YfEgU8QqUuj5NRe1
	GHrfMJgF7PhqVJbGaOkTISJuC65Z9HNW8J22CitT1IdXK3C1mmSPhHTxdRMw4eqH0s+2EtJlzgb
	qb/Y8jhFEJ8+wtf/xynFI2p2U27XNxLixarDlMPTel6HUE7DUqhRRx2hkmrRRG4usmVbUl4c0Oi
	JgSnoy8J3i9nUJfaUyu8A==
X-Received: by 2002:adf:e19c:0:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47fb1ecaf7emr7635569f8f.4.1785334360362;
        Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6ad01b6sm8955482f8f.16.2026.07.29.07.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 07:12:40 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Alberto Robazza <robazzalberto@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Wed, 29 Jul 2026 16:12:34 +0200
Message-ID: <20260729141234.65037-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729141234.65037-1-robazzalberto@gmail.com>
References: <20260729141234.65037-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_071242_279649_EA923109 
X-CRM114-Status: GOOD (  18.00  )
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
Reply-To: Alberto Robazza <robazza.alberto@proton.me>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
BCM4345C5 Bluetooth over UART_A).

According to the original Linux dts, the board is a modded version
of the ODROID-N2, with Amlogic A311D instead of the original S922X
and WiFi and Bluetooth support.
So the device tree builds on meson-g12b-a311d.dtsi and
meson-g12b-odroid-n2.dtsi (using same vddcpu values of N2+),
extended with the board-specific GPIO wiring for the AP6256 handling,
and some modifications for the led, GPIO_ACTIVE_LOW instead of
GPIO_ACTIVE_HIGH and different label (it is a green led, not blue as
in the Odroid N2).
Add the new DTB to the Makefile.

Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 105 ++++++++++++++++++
 2 files changed, 106 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa..83fb38b94 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-zora-p1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
new file mode 100644
index 000000000..6e696ddbc
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Alberto Robazza <robazza.alberto@proton.me>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-a311d.dtsi"
+#include "meson-g12b-odroid-n2.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "orbbec,zora-p1", "amlogic,a311d", "amlogic,g12b";
+	model = "Orbbec Zora P1";
+
+	leds {
+		/* Status led on Zora is actually green, same pin as N2, but reversed polarity */
+		led-blue {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
+		clocks = <&clock_32768>;
+		clock-names = "ext_clock";
+	};
+
+	clock_32768: clock-32768 {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>;
+	};
+
+	sound {
+		model = "ZORA-P1";
+	};
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+};
+
+/* AP6256 Wi-Fi: Broadcom BCM43456 over SDIO. */
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+	non-removable;
+	disable-wp;
+	keep-power-in-suspend;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+	vmmc-supply = <&tflash_vdd>;
+	vqmmc-supply = <&vddao_1v8>;
+
+	wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+/* AP6256 Bluetooth: Broadcom BCM4345C5 over UART_A. */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		shutdown-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&clock_32768>;
+		clock-names = "lpo";
+	};
+};
+
+/* vddcpu regulators same as Odroid N2+ */
+&vddcpu_a {
+	regulator-min-microvolt = <680000>;
+	regulator-max-microvolt = <1040000>;
+
+	pwms = <&pwm_ab 0 1500 0>;
+};
+
+&vddcpu_b {
+	regulator-min-microvolt = <680000>;
+	regulator-max-microvolt = <1040000>;
+
+	pwms = <&pwm_AO_cd 1 1500 0>;
+};
-- 
2.55.0


