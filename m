Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A33C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QNyWJjOlsPLUMiOSNZBEFuwctRhGOyXIhHqXv/w/08=; b=uoCoTM8FzQupXMMyd6T5VFL2Ud
	sQkjch4c8eqDbmWqzDQXB+OZ3oPHaK258xjgtA2MC1g/ZamWbx2gw1wwC+9jbri2O87q7mBBjHbzS
	CEBx31x7uEXVOFhcJzuNShgqx3iGGHwtLBaLJYMoo2I6tU084HkSdOc7mfDFnAPAxmjSOsZ+ZaydT
	sJNZMd9eHlAkjpA2BTH954AkpPsG+NDRbKfUHQSTUicvNt51wEg9sw1MsTfZNjNMGVjgHUOzkMeM2
	kOG2MbhGYeNw+pi6nzW3XX5XAzY974ZmRDiOAJGOTvVqweM7mTEw3PHlqPnje86akfRm5hvUYdhhn
	F0yBemJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojYF-00000005cHF-0tXJ;
	Tue, 28 Jul 2026 15:17:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojXy-00000005c5X-4C5c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:16:48 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f904e80eeso3264060f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 08:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785251805; x=1785856605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QNyWJjOlsPLUMiOSNZBEFuwctRhGOyXIhHqXv/w/08=;
        b=NerhLJ7z/SBPoYryGgLM3dn8YMFkhRtrNZzrizgsNMOcTPQlJiCyT8jvGusEU6TdrL
         ENWQtt6383QMBC2xEu8Q8Yi5qxuDD0B1X7Gh6RpKStkn2CFdeGpGcoxeGAoUX0lq/mEV
         1swginBOVfmS5wiJs9f978zGszD5IlLd5eY9ctxITauGj9hQixcAOS4ANgaAAgW6Bu1k
         bIYg9JDbjxjJM1YsAQotY8SAm5+39JpWg79jik6jQJwV+TNpp1m5qqMQ6rsSyGeqIg0H
         V9LqyrfmUIY/QxNzlEB2wg21Y2DvxAdMI1fN6lzdDK7w5t2McGlYI1b4eNsd2sjsL3bw
         qGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251805; x=1785856605;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QNyWJjOlsPLUMiOSNZBEFuwctRhGOyXIhHqXv/w/08=;
        b=kbkJKEPMtZpt2rkru39SJc32vypAAiVahBqEA0yz0n0QMwEOayJvk/RudmkYZEqK+g
         iul5Xj6sYHc05pbnBRkQCE8pGC/fF/lAxWDJpAuY5RkX4PqwQ8i6ioGw2nPAV3zKYDfV
         hMSYIlqfwnpsaOe8yOePf28X1P04LdCWDtXX7TaPzuDMvyMWlObMPXUezpfUozIcYDZr
         e0r5JPP1fRTCdjcwEujahJsDUtv7e3ZZxH2TKqnMVteLsiSLxWyoonUNTUaQWLwOsl7r
         tOH1Pg2UpITodBo+l//GqrKASxb9Ht/+fvMZ2MLv/HoX6Ehs3X5eq+2XO/AzQg/F+UjV
         enWg==
X-Forwarded-Encrypted: i=1; AHgh+Rqbt/2ZIYEk01Q5sYamxpfTjFleX3djoh+wM/kQnImMd/ovvjIiP931d9rKPJ662dreJuva7vl878Hi7JBw0SDt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsy3bdVf0bXis/b8peaaBH7XPncrIxOM1P41LQUfJ62tHXicU+
	hyjbVqZoaSKEo9OdRCBJObJIam2wGe1fo2OVNCmkzZxMjTjPJc5D7pXp
X-Gm-Gg: AR+sD12HiFEWpa+h/Rsbk5QQtBhwzxY0svQPt147AzXHtwKbKc+oz9cKvCgA4a7yrZE
	4PKMhhDrLhr/Gv22Xu9jd9AhWH/R7tTKrtMPUI7/TDq/1QCACxn+RGbLGtpGs8Q3pLPgB5Ktjho
	aPYSUFGdKUCvGUIg38I5qbzxwdpr9rudon5yB0v8t8J8d0y/zuxU/chSSBy3jnYUxNu7f2SrM1d
	7Pmi7GJrIAHnynNhIzvNTL8wR7AOmiZ+RkdGaYVkIvjcHZfIOZrbLopthmSwjmR4hSy9xSmTVuo
	r4geuwbDj2mbQltN5fmqy0z97XgNAHf+QUwM4ktGhPmpLawiCKZFnCX7xHqYpFqeiU/5yt55OeZ
	B90wV8l7C7v5TfUWcdaj/ABgyvUyfF2gMNwWj35HTjS+PZ2I17+pj3R0JthibXR2snCAP8hD1B4
	tjQ5elxAHEz+WyRaMyKFg/YUfnzopEjaM5NPc=
X-Received: by 2002:a05:6000:430c:b0:47f:9254:d453 with SMTP id ffacd0b85a97d-47fb1ec8030mr3188995f8f.8.1785251804447;
        Tue, 28 Jul 2026 08:16:44 -0700 (PDT)
Received: from slackboot (93-34-146-61.ip50.fastwebnet.it. [93.34.146.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm58422500f8f.28.2026.07.28.08.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:16:44 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Tue, 28 Jul 2026 17:16:36 +0200
Message-ID: <20260728151636.236393-4-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728151636.236393-1-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_081647_093646_368FBB51 
X-CRM114-Status: GOOD (  18.47  )
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
index 000000000..d003582fd
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


