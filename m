Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF43BD70E1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 06:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeAVX7UvVNO3PvTJphdBYQGTOcjfDDijo9S1pfOn3vA=; b=xuvUAmWGojlFjEDYN0qmyaK3Xt
	PtqJ45/Pgb23L2ywR75RIYqAEv4fAa08Ijo6Eq6csKvnmfW7UxoBS40/6Tfs0C7B3gn3egdGF6owJ
	Nckv9E1MVEKTDfipi+yBIzkgo+lepL4PQfib5FoBQXMNPWz944gEghzdpoygFa5b4hqjY/d51z+jy
	aZG2CV9oFIlGw1RptL/a360/D9ZD2RsCggX7hsU7ykI0DTR+Zhq5U2BgfWuo7S2vs90NVW+devhv/
	tOGO4V44QKQNHtt5SHWo3g0mBujJ/YDFenUjaWZWKoDvGWa8UbJg4sINgrpIUpZyJhm3+LVWrzsjD
	oZUWab7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGu3F-0000000Gy4t-2jBZ;
	Fri, 29 Nov 2024 06:00:25 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGu0R-0000000Gxbd-2kha
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 05:57:32 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5cfddb70965so1711705a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 21:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732859850; x=1733464650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeAVX7UvVNO3PvTJphdBYQGTOcjfDDijo9S1pfOn3vA=;
        b=Jps6YCJu4zw0t8gQNeDK0yPXRbTOGGNbLkxtbiR2GznjljO2gYwKRycg2j2u0/mUx/
         nlV1/3Z8Umourxn1OsTyGZO8aUd66ebf9Jy57O7xIfpcn3Bk6uWVQ0enmTChaFal0MW1
         p1TgSTincu+6h4pXTiiv5tgk+8Du1zuWXSOu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732859850; x=1733464650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeAVX7UvVNO3PvTJphdBYQGTOcjfDDijo9S1pfOn3vA=;
        b=rrXg/xR45tukJkkmHYQV0tV1ASHr3RvzHxx1XHiUOojw2kTnGNn40RBWR2HcKPzWN4
         DfHkP2IXcPPQbVlnj/dhgR6cShVFqpXWu+iZe+vNsgJY3ngcp+oSs6BFdooW5Ja5VD3M
         S37kU8AAGO3cTvqVbdLQShhJSLV/OzRG0eHcyVg+0uBFlbjNdwEaBOQ0X5daset4CLgy
         bt8yFiMifQvPyXLo8Gxx+6P27srBMQPEA1LqWEzJEr5j28m9BgO2LJVc5qdeVXcpThIx
         HxAWfRFZEyv67MVmw8siQVRXLG8K9W5rDyIuRvXdY0DxLuuBEiKhP/5p2a/hQKa8Rhor
         o/dw==
X-Forwarded-Encrypted: i=1; AJvYcCXMPeISAVDxL15WI78vwZjwAS9xMN6eE4aQGGrM0/0Yexp4D7HklIfoXougGN6/8ieDd1Q2pT0zeDlvTj3irQc6@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3mbNuHMMPWA3OFdlSZSIRcW6ydk1QaHoxHwWf/pH6L0pPJssp
	0vVkCPZyvYsaLX+vOLM6N+9G99++I3jb7i6wOXqrqKA0fD2EEl3W1Otr0CRqFA==
X-Gm-Gg: ASbGnctLxQmRpEPBGyHgvUIXYQkPS0JWgX2BIohih4M+Hnk4BgHIuUO8ljZMq0HJsWe
	w459J048gqYWExpx5mMt1j60C9uyEbc/iBj/nd3VPMFaPNqJZyeiQdqRrzKT+POttNQW5NVkZmX
	dEpGRdzSjO4KUV/7ErvG+YyWVonw++9OAN0lMWjqo/IFDBU31b6WoxGunOIjhiVTcZQQHakus84
	O/DkcYnOtCIf05HL7f8JtPmWLf8hfXwidpYVUxQNmdxyj1iB/zBfVO3ZbURui2G63pLBPsPYmx8
	kCgdCC4a
X-Google-Smtp-Source: AGHT+IH89N0eBKh8povI6C18xlaQm02JHRQSleB29/KeBbdJHSCxPaipV7KttGza7MrJpx60qOzGNA==
X-Received: by 2002:a05:6402:3482:b0:5ce:d706:53d5 with SMTP id 4fb4d7f45d1cf-5d080b9914dmr9464696a12.11.1732859849866;
        Thu, 28 Nov 2024 21:57:29 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5d097dd6af2sm1468282a12.48.2024.11.28.21.57.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 21:57:28 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v4 2/2] arm64: dts: mediatek: mt8186: Add Starmie device
Date: Fri, 29 Nov 2024 05:57:20 +0000
Message-ID: <20241129055720.3328681-3-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241129055720.3328681-1-wmacek@chromium.org>
References: <20241129055720.3328681-1-wmacek@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_215731_697753_412705D0 
X-CRM114-Status: GOOD (  16.42  )
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

Add support for Starmie Chromebooks.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
Changelog v4-v3:
 - Fixed dtbs_check issues caused by introducing new files
 - Fixed &battery node representation
Changelog v3-v2:
 - Cleaned up DTS
   - Re-using dsi_out node
   - Removed unnecessary delete-nodes
   - Moved touchpads to per-board dts
   - Modified 3.3/6V power regulator node
Changelog v2-v1:
 - No changes

 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8186-corsola-starmie-sku0.dts  |  31 ++
 .../mediatek/mt8186-corsola-starmie-sku1.dts  |  31 ++
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 472 ++++++++++++++++++
 4 files changed, 536 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 8fd7b2bb7a15..2ee6266ddf43 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -59,6 +59,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131073.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
new file mode 100644
index 000000000000..23e194579bf2
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-starmie.dtsi"
+
+/ {
+	model = "Google Starmie sku0 board";
+	compatible = "google,starmie-sku0", "google,starmie-sku2",
+		     "google,starmie-sku3", "google,starmie",
+		     "mediatek,mt8186";
+};
+
+&panel {
+	compatible = "starry,ili9882t";
+};
+
+&i2c1 {
+	touchscreen: touchscreen@41 {
+		compatible = "ilitek,ili9882t";
+		reg = <0x41>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		panel = <&panel>;
+		reset-gpios = <&pio 60 GPIO_ACTIVE_LOW>;
+		vccio-supply = <&mt6366_vio18_reg>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
new file mode 100644
index 000000000000..214b972c9357
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-starmie.dtsi"
+
+/ {
+	model = "Google Starmie sku1 board";
+	compatible = "google,starmie-sku1", "google,starmie-sku4",
+		     "google,starmie", "mediatek,mt8186";
+};
+
+&panel {
+	compatible = "starry,himax83102-j02", "himax,hx83102";
+};
+
+&i2c1 {
+	touchscreen_himax: touchscreen@4f {
+		compatible = "hid-over-i2c";
+		reg = <0x4f>;
+		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		vdd-supply = <&mt6366_vio18_reg>;
+		panel = <&panel>;
+		post-power-on-delay-ms = <450>;
+		hid-descr-addr = <0x0001>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
new file mode 100644
index 000000000000..5ea8bdc00e81
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
@@ -0,0 +1,472 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola.dtsi"
+
+/ {
+	en_pp6000_mipi_disp_150ma: en-pp6000-mipi-disp-150ma {
+		compatible = "regulator-fixed";
+		regulator-name = "en_pp6000_mipi_disp_150ma";
+		gpio = <&pio 154 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&en_pp6000_mipi_disp_150ma_fixed_pins>;
+	};
+
+	/*
+	 * Starmie does not have 3.3V display regulator. It is replaced
+	 * with 6V module for enabling panel, re-using eDP GPIOs.
+	 */
+	/delete-node/ pp3300_disp_x;
+	en_pp6000_mipi_disp: en-regulator-pp6000-mipi-disp {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&edp_panel_fixed_pins>;
+		gpios = <&pio 153 GPIO_ACTIVE_HIGH>;
+		regulator-name = "en_pp6000_mipi_disp";
+		enable-active-high;
+		regulator-enable-ramp-delay = <3000>;
+		vin-supply = <&pp3300_z2>;
+	};
+
+	tboard_thermistor1: thermal-sensor1 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&auxadc 0>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <    (-5000) 1492
+						0 1413
+						5000 1324
+						10000 1227
+						15000 1121
+						20000 1017
+						25000 900
+						30000 797
+						35000 698
+						40000 606
+						45000 522
+						50000 449
+						55000 383
+						60000 327
+						65000 278
+						70000 236
+						75000 201
+						80000 171
+						85000 145
+						90000 163
+						95000 124
+						100000 91
+						105000 78
+						110000 67
+						115000 58
+						120000 50
+						125000 44>;
+	};
+
+	tboard_thermistor2: thermal-sensor2 {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		io-channels = <&auxadc 1>;
+		io-channel-names = "sensor-channel";
+		temperature-lookup-table = <    (-5000) 1492
+						0 1413
+						5000 1324
+						10000 1227
+						15000 1121
+						20000 1017
+						25000 900
+						30000 797
+						35000 698
+						40000 606
+						45000 522
+						50000 449
+						55000 383
+						60000 327
+						65000 278
+						70000 236
+						75000 201
+						80000 171
+						85000 145
+						90000 163
+						95000 124
+						100000 91
+						105000 78
+						110000 67
+						115000 58
+						120000 50
+						125000 44>;
+	};
+};
+
+/*
+ * Starmie does not have EC keyboard. Remove default keyboard controller
+ * and replace it with the driver for side switches.
+ */
+/delete-node/ &keyboard_controller;
+
+&cros_ec {
+	cbas: cbas {
+		compatible = "google,cros-cbas";
+	};
+
+	keyboard-controller {
+		compatible = "google,cros-ec-keyb-switches";
+	};
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	panel: panel@0 {
+		/* compatible will be set in board dts */
+		reg = <0>;
+		enable-gpios = <&pio 98 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_default_pins>;
+		avdd-supply = <&en_pp6000_mipi_disp>;
+		avee-supply = <&en_pp6000_mipi_disp_150ma>;
+		pp1800-supply = <&mt6366_vio18_reg>;
+		backlight = <&backlight_lcd0>;
+		rotation = <270>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&i2c0 {
+	status = "disabled";
+};
+
+&i2c2 {
+	status = "disabled";
+};
+
+&i2c4 {
+	status = "disabled";
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+};
+
+&mmc1_pins_default {
+	pins-clk {
+		drive-strength = <8>;
+	};
+
+	pins-cmd-dat {
+		drive-strength = <8>;
+	};
+};
+
+&mmc1_pins_uhs {
+	pins-clk {
+		drive-strength = <8>;
+	};
+
+	pins-cmd-dat {
+		drive-strength = <8>;
+	};
+};
+
+&pen_insert {
+	wakeup-event-action = <EV_ACT_ANY>;
+};
+
+&pio {
+	/* 185 lines */
+	gpio-line-names = "TP",
+			  "TP",
+			  "TP",
+			  "I2S0_HP_DI",
+			  "I2S3_DP_SPKR_DO",
+			  "SAR_INT_ODL",
+			  "BT_WAKE_AP_ODL",
+			  "WIFI_INT_ODL",
+			  "DPBRDG_INT_ODL",
+			  "NC",
+			  "EC_AP_HPD_OD",
+			  "NC",
+			  "TCHSCR_INT_1V8_ODL",
+			  "EC_AP_INT_ODL",
+			  "EC_IN_RW_ODL",
+			  "GSC_AP_INT_ODL",
+			  /*
+			   * AP_FLASH_WP_L is crossystem ABI. Rev1 schematics
+			   * call it AP_WP_ODL.
+			   */
+			  "AP_FLASH_WP_L",
+			  "HP_INT_ODL",
+			  "PEN_EJECT_OD",
+			  "NC",
+			  "NC",
+			  "UCAM_SEN_EN",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "I2S2_DP_SPK_MCK",
+			  "I2S2_DP_SPKR_BCK",
+			  "I2S2_DP_SPKR_LRCK",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "UART_GSC_TX_AP_RX",
+			  "UART_AP_TX_GSC_RX",
+			  "UART_DBGCON_TX_ADSP_RX",
+			  "UART_ADSP_TX_DBGCON_RX",
+			  "NC",
+			  "TCHSCR_REPORT_DISABLE",
+			  "NC",
+			  "EN_PP1800_DPBRDG",
+			  "SPI_AP_CLK_EC",
+			  "SPI_AP_CS_EC_L",
+			  "SPI_AP_DO_EC_DI",
+			  "SPI_AP_DI_EC_DO",
+			  "SPI_AP_CLK_GSC",
+			  "SPI_AP_CS_GSC_L",
+			  "SPI_AP_DO_GSC_DI",
+			  "SPI_AP_DI_GSC_DO",
+			  "UART_DBGCON_TX_SCP_RX",
+			  "UART_SCP_TX_DBGCON_RX",
+			  "EN_PP1200_CAM_X",
+			  "WLAN_MODULE_RST_L",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "I2S1_HP_DO",
+			  "I2S1_HP_BCK",
+			  "I2S1_HP_LRCK",
+			  "I2S1_HP_MCK",
+			  "TCHSCR_RST_1V8_L",
+			  "SPI_AP_CLK_ROM",
+			  "SPI_AP_CS_ROM_L",
+			  "SPI_AP_DO_ROM_DI",
+			  "SPI_AP_DI_ROM_DO",
+			  "NC",
+			  "NC",
+			  "EMMC_STRB",
+			  "EMMC_CLK",
+			  "EMMC_CMD",
+			  "EMMC_RST_L",
+			  "EMMC_DATA0",
+			  "EMMC_DATA1",
+			  "EMMC_DATA2",
+			  "EMMC_DATA3",
+			  "EMMC_DATA4",
+			  "EMMC_DATA5",
+			  "EMMC_DATA6",
+			  "EMMC_DATA7",
+			  "AP_KPCOL0",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "TP",
+			  "SDIO_CLK",
+			  "SDIO_CMD",
+			  "SDIO_DATA0",
+			  "SDIO_DATA1",
+			  "SDIO_DATA2",
+			  "SDIO_DATA3",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "MIPI_BL_PWM_1V8",
+			  "DISP_RST_1V8_L",
+			  "MIPI_DPI_CLK",
+			  "MIPI_DPI_VSYNC",
+			  "MIPI_DPI_HSYNC",
+			  "MIPI_DPI_DE",
+			  "MIPI_DPI_D0",
+			  "MIPI_DPI_D1",
+			  "MIPI_DPI_D2",
+			  "MIPI_DPI_D3",
+			  "MIPI_DPI_D4",
+			  "MIPI_DPI_D5",
+			  "MIPI_DPI_D6",
+			  "MIPI_DPI_DA7",
+			  "MIPI_DPI_D8",
+			  "MIPI_DPI_D9",
+			  "MIPI_DPI_D10",
+			  "MIPI_DPI_D11",
+			  "PCM_BT_CLK",
+			  "PCM_BT_SYNC",
+			  "PCM_BT_DI",
+			  "PCM_BT_DO",
+			  "JTAG_TMS_TP",
+			  "JTAG_TCK_TP",
+			  "JTAG_TDI_TP",
+			  "JTAG_TDO_TP",
+			  "JTAG_TRSTN_TP",
+			  "NC",
+			  "NC",
+			  "UCAM_DET_ODL",
+			  "NC",
+			  "NC",
+			  "AP_I2C_TCHSCR_SCL_1V8",
+			  "AP_I2C_TCHSCR_SDA_1V8",
+			  "NC",
+			  "NC",
+			  "AP_I2C_DPBRDG_SCL_1V8",
+			  "AP_I2C_DPBRDG_SDA_1V8",
+			  "NC",
+			  "NC",
+			  "AP_I2C_AUD_SCL_1V8",
+			  "AP_I2C_AUD_SDA_1V8",
+			  "AP_I2C_DISP_SCL_1V8",
+			  "AP_I2C_DISP_SDA_1V8",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "SCP_I2C_SENSOR_SCL_1V8",
+			  "SCP_I2C_SENSOR_SDA_1V8",
+			  "AP_EC_WARM_RST_REQ",
+			  "AP_XHCI_INIT_DONE",
+			  "USB3_HUB_RST_L",
+			  "EN_SPKR",
+			  "BEEP_ON",
+			  "AP_DISP_BKLTEN",
+			  "EN_PP6000_MIPI_DISP",
+			  "EN_PP6000_MIPI_DISP_150MA",
+			  "BT_KILL_1V8_L",
+			  "WIFI_KILL_1V8_L",
+			  "PWRAP_SPI0_CSN",
+			  "PWRAP_SPI0_CK",
+			  "PWRAP_SPI0_MO",
+			  "PWRAP_SPI0_MI",
+			  "SRCLKENA0",
+			  "SRCLKENA1",
+			  "SCP_VREQ_VAO",
+			  "AP_RTC_CLK32K",
+			  "AP_PMIC_WDTRST_L",
+			  "AUD_CLK_MOSI",
+			  "AUD_SYNC_MOSI",
+			  "AUD_DAT_MOSI0",
+			  "AUD_DAT_MOSI1",
+			  "AUD_CLK_MISO",
+			  "AUD_SYNC_MISO",
+			  "AUD_DAT_MISO0",
+			  "AUD_DAT_MISO1",
+			  "NC",
+			  "NC",
+			  "NC",
+			  "DPBRDG_RST_L",
+			  "LTE_W_DISABLE_L",
+			  "LTE_SAR_DETECT_L",
+			  "EN_PP3300_LTE_X",
+			  "LTE_PWR_OFF_L",
+			  "LTE_RESET_L",
+			  "TP",
+			  "TP";
+
+	dpi_default_pins: dpi-default-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO103__FUNC_GPIO103>,
+				 <PINMUX_GPIO104__FUNC_GPIO104>,
+				 <PINMUX_GPIO105__FUNC_GPIO105>,
+				 <PINMUX_GPIO106__FUNC_GPIO106>,
+				 <PINMUX_GPIO107__FUNC_GPIO107>,
+				 <PINMUX_GPIO108__FUNC_GPIO108>,
+				 <PINMUX_GPIO109__FUNC_GPIO109>,
+				 <PINMUX_GPIO110__FUNC_GPIO110>,
+				 <PINMUX_GPIO111__FUNC_GPIO111>,
+				 <PINMUX_GPIO112__FUNC_GPIO112>,
+				 <PINMUX_GPIO113__FUNC_GPIO113>,
+				 <PINMUX_GPIO114__FUNC_GPIO114>,
+				 <PINMUX_GPIO101__FUNC_GPIO101>,
+				 <PINMUX_GPIO100__FUNC_GPIO100>,
+				 <PINMUX_GPIO102__FUNC_GPIO102>,
+				 <PINMUX_GPIO99__FUNC_GPIO99>;
+			drive-strength = <10>;
+			output-low;
+		};
+	};
+
+	dpi_func_pins: dpi-func-pins {
+		pins-cmd-dat {
+			pinmux = <PINMUX_GPIO103__FUNC_DPI_DATA0>,
+				 <PINMUX_GPIO104__FUNC_DPI_DATA1>,
+				 <PINMUX_GPIO105__FUNC_DPI_DATA2>,
+				 <PINMUX_GPIO106__FUNC_DPI_DATA3>,
+				 <PINMUX_GPIO107__FUNC_DPI_DATA4>,
+				 <PINMUX_GPIO108__FUNC_DPI_DATA5>,
+				 <PINMUX_GPIO109__FUNC_DPI_DATA6>,
+				 <PINMUX_GPIO110__FUNC_DPI_DATA7>,
+				 <PINMUX_GPIO111__FUNC_DPI_DATA8>,
+				 <PINMUX_GPIO112__FUNC_DPI_DATA9>,
+				 <PINMUX_GPIO113__FUNC_DPI_DATA10>,
+				 <PINMUX_GPIO114__FUNC_DPI_DATA11>,
+				 <PINMUX_GPIO101__FUNC_DPI_HSYNC>,
+				 <PINMUX_GPIO100__FUNC_DPI_VSYNC>,
+				 <PINMUX_GPIO102__FUNC_DPI_DE>,
+				 <PINMUX_GPIO99__FUNC_DPI_PCLK>;
+			drive-strength = <10>;
+		};
+	};
+
+	en_pp6000_mipi_disp_150ma_fixed_pins: en_pp6000-mipi-disp-150ma-fixed-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO154__FUNC_GPIO154>;
+			output-low;
+		};
+	};
+
+	panel_default_pins: panel-default-pins {
+		pins-en {
+			pinmux = <PINMUX_GPIO98__FUNC_GPIO98>;
+			output-low;
+		};
+	};
+};
+
+&usb_c1 {
+	status = "disabled";
+};
+
+&thermal_zones {
+	tboard1-thermal {
+		polling-delay = <1000>; /* milliseconds */
+		polling-delay-passive = <0>; /* milliseconds */
+		thermal-sensors = <&tboard_thermistor1>;
+	};
+
+	tboard2-thermal {
+		polling-delay = <1000>; /* milliseconds */
+		polling-delay-passive = <0>; /* milliseconds */
+		thermal-sensors = <&tboard_thermistor2>;
+	};
+};
+
+&wifi_pwrseq {
+	reset-gpios = <&pio 51 1>;
+};
+
+/*
+ * Battery on Starmie is using a different address than default.
+ * Remove old node to reuse "battery" alias.
+ */
+/delete-node/ &battery;
+&i2c_tunnel {
+	battery: sbs-battery@f {
+		compatible = "sbs,sbs-battery";
+		reg = <0xf>;
+		sbs,i2c-retry-count = <2>;
+		sbs,poll-retry-count = <1>;
+	};
+};
-- 
2.47.0.338.g60cca15819-goog


