Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B05CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 19:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5SVr5FfGqw1uBAV0gP9IimhA/pN8ipjATE7h+sfzNk=; b=0xbjlvQXJ+/7W2KVAgxIayFh7p
	tvvbZnFZbes3G5BdVV+r2tvcuTSjo9KnUN2UjIjef2Pu1bkQCcRSyt+0Q+toDWhfZlx1gU43UyHce
	x4FAiNDhZPWVNwf5n1ASEGeDQnl4td8zuMVVz3FUoUhHT9NZ4NG2xH3cZyZzdoSEhzFwRG2kyid0t
	ftQ8ZhnfG55mnqb1sJdEIwrSxnRQoGCBJoyaiYwdIqFo0cSmZD1x1MtMHQwbpayMoZZ73KLZLNWUO
	pOJj7SzkIb4iQJdv54LSvlupFW1E0QGgPRFwvyyqxv0vHL3h2/i8vB/3VB+ptkRZ2xNCxdeMcyZXe
	6sOywX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcLD-0000000BZba-04Mi;
	Sun, 03 May 2026 19:18:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJcLA-0000000BZZQ-2yoG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 19:18:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso24290195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 12:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777835935; x=1778440735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5SVr5FfGqw1uBAV0gP9IimhA/pN8ipjATE7h+sfzNk=;
        b=Ze9T/Ia+v8ineUY/HtmKQ66vpnZgGO9ZynQPGonez24bEHZmccO2tfzkNWJG2J9S5F
         lmryU+6jRUMIsIRzEiQlwKidyFBH4H3TdqDevpADDCwxZge2d/NanjGX85hmHK9Lk2BY
         JTb7Xfc1+qotfL487toabfEelop+eVYFI3GARkKrX/ZxaEYfVL3y9KD147De2abpzaB+
         oY/TPFKDgbm0rRJdTNeUXwwtOmLKXWyDXrEMTaaz5OyAA7kDZ1zk43se+Hu5hHsSGZvx
         f+UKnCKEN+lqrvqfq3WomH0rSeTvD7MUOyQyMi1B7V5Hh0ul8cXO1SuMbPqD2UfqWpLo
         CBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777835935; x=1778440735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/5SVr5FfGqw1uBAV0gP9IimhA/pN8ipjATE7h+sfzNk=;
        b=geNokLYLT0P9yaIQIMHFjtRr81Gg8cIq8txPm5pCPzeLP4fdDdD4Hv6SjZ2sAjlT8D
         iVBJxt/I5PANwOIZT/zudqH1aZpQRpITxcVk8K0ruJRaYrJXLL+Pf0joE4gr36DjxZAi
         G4D+inEFGGl9reU/zVCDDd8plIUPZ50b5A6Cy6tvZqRrOJWGZjI7U6xHZdPHextqkhof
         LBVvOe2gW1C1Z3spQNfkL9PECAZoEUBvcpxFAr6Ngb1XUNGxdKu2cy6cTLd6SLQiPFrU
         3CowqIGoQx6uz0NrJihd2I96Jyw1DDlM0fDXAkjT8vxjeku9AC2hd7lD3tgQhxA/Dp9H
         Pt2w==
X-Forwarded-Encrypted: i=1; AFNElJ/lIWEkQoqS0/fL6xOg+DVyksLXut4RZYg0juK0C6p6J6frKADwsrAsum5YUDUde2utbjtqqpoMboQTzTHlQI6F@lists.infradead.org
X-Gm-Message-State: AOJu0Yxayt9VPNMeOw8bkKdReu1CoyT7E3Sy892VyBOOR8IA0IYZBGOD
	YLnGtnNKUzZ6VoZEBg1+9lkhV5gzHnphESZCdxDR+8QT6Do8Qb650RmV
X-Gm-Gg: AeBDievFKq2F6wjMQSwm27hjWNGsKmRFfw7xxpP+W1p32KweVvyrjixU4g0lrgQJ6qs
	j79/WjaLHNWqQHmJk0D4Qf+G1rlN+EO+U2dGwgX6Fst9KAYNMw6XnrjICLRtd3PNbGJ0dz5hQj3
	4P/IhRqW9dr+FtVh+vOX3sZJFdvk6YpPReheczdg4QIs7Ndb8sjE5Feie9lV2I4M3QbKeth9R09
	ZaAKSfsplBdkv255dvVZdTDKVtyrFBUv1iVpuIlpZQnQ+GxZuT6/gweAbjdPpiBiNtTLS3sCkoU
	rF+bg4Umbgi5DgejqlEBoHTomd5ely3TA+0lj8qoNAgVgexTmGRvaW45Px/dJSOUUPeZHyCodEd
	rFIKCvkihM6hSqhxyUlLsMYl1OtZs9CV/bdh1I1phCxNJORKEWeBM8ijLjX9y0m9B4H07IS12WX
	ttXByeyvze5fiSwqfDPN6C8/D9JLXlSy6GW6wmnS+G/XS47K6hCjbRFLzCGsm1TFg=
X-Received: by 2002:a05:600c:a316:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-48a988a4cfamr83350095e9.19.1777835934701;
        Sun, 03 May 2026 12:18:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe928f6sm62230925e9.6.2026.05.03.12.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 12:18:54 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: allwinner: A133: add support for Baijie Helper A133 board
Date: Sun,  3 May 2026 21:18:38 +0200
Message-ID: <20260503191842.2736130-4-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
References: <20260503191842.2736130-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_121856_816554_1BD6C295 
X-CRM114-Status: GOOD (  17.35  )
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

Baijie Helper A133 board is a development board around Baijie A133 Core
SBC. Features:

- 1/2/4GiB LPDDR4 DRAM
- 8/16/32GiB eMMC
- AXP707 PMIC
- 2 USB 2.0 ports
- MicroSD slot and on-board eMMC module
- Gigabit Ethernet
- Bluetooth
- WiFi

Add initial support for both the Helper and Core boards, including UART,
PMU, eMMC, USB, Ethernet.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-baije-core.dtsi | 159 ++++++++++++++++++
 .../allwinner/sun50i-a133-baijie-helper.dts   |  92 ++++++++++
 3 files changed, 252 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index d116864b6c2b..926dfa851100 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-baijie-helper.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-liontron-h-a133l.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
new file mode 100644
index 000000000000..78da3baa65bb
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-a100.dtsi"
+#include "sun50i-a100-cpu-opp.dtsi"
+
+/{
+	aliases {
+		serial1 = &uart1;	/* BT module */
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
+};
+
+&pio {
+	vcc-pb-supply = <&reg_dcdc1>;
+	vcc-pc-supply = <&reg_eldo1>;
+	vcc-pd-supply = <&reg_dcdc1>;
+	vcc-pe-supply = <&reg_dldo2>;
+	vcc-pf-supply = <&reg_dcdc1>;
+	vcc-pg-supply = <&reg_dldo1>;
+	vcc-ph-supply = <&reg_dcdc1>;
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_eldo1>;
+	cap-mmc-hw-reset;
+	non-removable;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
+
+&r_i2c0 {
+	status = "okay";
+
+	axp803: pmic@34 {
+		compatible = "x-powers,axp803";
+		reg = <0x34>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp803.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&reg_aldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1600000>;
+	regulator-max-microvolt = <3400000>;
+	regulator-name = "vcc-3v3";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <500000>;
+	regulator-max-microvolt = <1300000>;
+	regulator-name = "vdd-cpu";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <500000>;
+	regulator-max-microvolt = <1300000>;
+};
+
+&reg_dcdc4 {
+	regulator-always-on;
+	regulator-min-microvolt = <500000>;
+	regulator-max-microvolt = <1300000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <800000>;
+	regulator-max-microvolt = <1840000>;
+	regulator-name = "vcc-dram";
+};
+
+/* DCDC6 unused */
+
+&reg_dldo1 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_dldo2 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3400000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_dldo3 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "avdd-csi";
+};
+
+&reg_dldo4 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_eldo1 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1900000>;
+	regulator-enable-ramp-delay = <1000>;
+};
+
+&reg_eldo2 {
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1900000>;
+	regulator-enable-ramp-delay = <1000>;
+	regulator-name = "dvdd-csi";
+};
+
+/* ELDO3 unused */
+
+&reg_fldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <700000>;
+	regulator-max-microvolt = <1450000>;
+	regulator-name = "vdd-cpus-usb";
+};
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
new file mode 100644
index 000000000000..d48b47ef2ed0
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-a133-baije-core.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/{
+	model = "HelperBoard A133";
+	compatible = "baijie,helper-a133", "allwinner,sun50i-a100";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 7 13 GPIO_ACTIVE_LOW>;	/* PH13 */
+		};
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_dcdc1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&rgmii0_pins {
+	drive-strength = <30>;
+};
+
+&emac0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii0_pins>;
+	phy-handle = <&eth_phy>;
+	phy-mode = "rgmii-id";
+	allwinner,rx-delay-ps = <200>;
+	allwinner,tx-delay-ps = <200>;
+	status = "okay";
+};
+
+&mdio0 {
+	reset-gpios = <&pio 7 11 GPIO_ACTIVE_LOW>;	/* PH11 */
+	reset-delay-us = <10000>;
+	reset-post-delay-us = <150000>;
+
+	eth_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+};
+
+&usbphy {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
-- 
2.53.0


