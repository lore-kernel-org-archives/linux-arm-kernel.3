Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361BEC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxKcq+z+SrS9YOgP9Wucayj+sHc3IIcXGTLDJtzMh0c=; b=42EiDaF5Sdp+u58uLLxYTxcDJN
	a22kBwNUSbpiem+/f/PrCSGqiu9p7l3qLrtEkRoCSF8fnmLs2npo/Z7KF7i1BrEYnWYrDE/SuTUq5
	Iz77dPXgGW+gezkm+8Q7M8jO7Teo9CoQ+1M5wyBYRkdwFN4JTOPbvfGKvbxdTdZ4IE6phSZQB0OqP
	uhYCOyCCr9tsXwKfZ3XNh30HnUsCaoQHmQ/LMWo31NKkX6RNqHwoztxu6aPoWtpcv9SeblUPxHvP7
	5jyykfKKU4HzJzSlONcDI7p0TGZ+zbija46+NPy/3kNGRHiuDsKAehp0fow5pMBhfGIme9gnRsB2C
	slg4frLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UM-00000001Tqt-2p8u;
	Sun, 26 Jul 2026 18:22:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UJ-00000001TnO-1F0w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 18:22:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13135775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 11:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090129; x=1785694929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxKcq+z+SrS9YOgP9Wucayj+sHc3IIcXGTLDJtzMh0c=;
        b=mYmVF5hhnWC0clIKFVBI5snKAyyeoxgtwV94CJhkXjoZuOwJbNx4UkM1PONzDioVsN
         9SWXCyhD8ZCWHQCEUtP9PQ6UdcvEqXM49ep5ptdIH0uygC5tB0PZOltdKiAOTj7DxE1A
         Vo7+28Vzf+YfWXt+Bgupqi1rc6U5hLl7qhU3SVpxXYjeemtsw99hXR1cSyP+rHuNG5qW
         M+QN195s5qcqrtJJWgrIjjwfXjq6MFD8NwcUTWzxXqLqoNao3PyjY4mGCa6S/SjPai68
         rnQc3mxAGIHOnsyJXavWr9NrH3pPbV4GwyFNOVag8mNPmjXeUWVhPlcJ0xa1fE/JuVJ/
         eZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090129; x=1785694929;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxKcq+z+SrS9YOgP9Wucayj+sHc3IIcXGTLDJtzMh0c=;
        b=jwA8S5609Vs5+NmbNhqIqbdA8lg8e+SFXxXg62SZgrtKZWESZRF7YBN/YvkDkzaSEF
         4CdKSZZH67uiET5V543z8dQM5I2lbYPRG+z7uFmweA9DVSDunNrY58eqwzXNEPaoHmPo
         XdSbRW7N9Q16CcOODHZpv/4xjKVj9E7Ho8jL10pNyOkS/g2l+ZniPQTZQyAFfS/YyhO5
         z/hZt8WapELpv0esm2GJZyNNUM6fEVWWXc3e4Iqyj4mDMyxXHhhhO7IqbIlAosJamQle
         JCzZMUQQ2qmqWbuoLZg6hEgTFznA1JYUr+Ud7gH58G4/Xrwi1x7KtiJEi1fvKslZzG5b
         EAXA==
X-Forwarded-Encrypted: i=1; AHgh+RoyinjdQadrfrW+tseYQovqGnq/EsGONXjE0MFNJu5BTp+w6C8NzafkAUrGBc0G8Tyn/pk4x/ayIbcNh6aiPLCg@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8WN5ZIyUZgWQ2B0ToSy1aou2IbyxRjrRhLyD78jWvJjcFJZx3
	9pAOwIJroKGNIZTG4Wm5eWMaBtmgtkWFhMIPRFNANrk+39JXDsTO5If3
X-Gm-Gg: AR+sD10A8H9ZPcRTduagiQ7Sb5HR7dCE/t/75WV1dzf/5VUuJQtM0lMeS7UWS8l+R6J
	SyAgoYF//dE9zeSGC44UH3VfI2J46QEVxuECgtT6so9fJMT4a5KmcEuSbcm8HZfh9X8rXmx+Ui5
	RTzL3/PvdvHXe0Mr9spAS7O4LaD6Htr58wpe4v010ya11ndUaJC7K+pWM3fUgPAX0S0DFG77VNN
	EepR7Yu8F/djXLKvCsLlQnW57IlL4BWP3hP6y1XTCkIMshxoSL/AErXexgwmSSM5uaLcazUrWKZ
	C15BQFjYjgqF4xU9vvpaUqeCmvqMe9L0a5S8WrM0RMBuFm4grXTwTh2JkO4OWTl2OlELcwCpYmM
	9MIuJX+c1ZYR5OdsMOJX9rBKjCZ//mRsVD3yqXeG6eNP9BTSwVUk40k8qjANXfuDCnb7esUVOGB
	HZnkra7sS0yeobdxD//VSqNj8IXph1666+nBX7Ag==
X-Received: by 2002:a05:600c:310e:b0:495:44f3:4576 with SMTP id 5b1f17b1804b1-496b5710dc8mr79233605e9.7.1785090129119;
        Sun, 26 Jul 2026 11:22:09 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:08 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 20:21:58 +0200
Message-ID: <20260726182158.249449-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726182158.249449-1-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_112211_379980_EE64ACDC 
X-CRM114-Status: GOOD (  18.23  )
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
Reply-To: robazza.alberto@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alberto Robazza <robazza.alberto@proton.me>

The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
BCM4345C5 Bluetooth over UART_A), HDMI audio output.

According to the original Linux dts, the board is a modded version
of the ODROID-N2, with Amlogic A311D instead of the original S922X
and WiFi and Bluetooth support.
So the device tree builds on meson-g12b-a311d.dtsi and
meson-g12b-odroid-n2.dtsi (using same vddcpu values of N2+),
extended with the board-specific GPIO wiring for the AP6256 handling,
and some modifications for the led, GPIO_ACTIVE_LOW instead of
GPIO_ACTIVE_HIGH and different label (it is a green led, not blue as
in the Odroid N2).

Add the "orbbec,zora-p1" compatible to the amlogic.yaml board binding
(the "orbbec" vendor prefix is already registered) and the new DTB to
the Makefile.

Signed-off-by: Alberto Robazza <robazza.alberto@proton.me>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa..95e9071e0 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -36,6 +36,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-go-ultra.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2-plus.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2l.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-zora-p1.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
new file mode 100644
index 000000000..fe20d39a8
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Alberto Robazza <robazza.alberto@proton.me>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-a311d.dtsi"
+#include "meson-g12b-odroid-n2.dtsi"
+
+/ {
+	compatible = "orbbec,zora-p1", "amlogic,a311d", "amlogic,g12b";
+	model = "Orbbec Zora P1";
+
+	leds {
+		//The status led on Zora is actually green, same pin as N2, but reversed polarity
+		led-blue {
+			label = "p1:green";
+			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	wifi32k: wifi32k {
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
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
+};
+
+//vddcpu regulators same as Odroid N2+
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


