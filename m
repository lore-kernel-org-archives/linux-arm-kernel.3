Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BE1D58E49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 02:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwCutTpNf6ifG9SAmX44tqMP8TE8P/7XXDyl59hedWg=; b=tKB5V6Sb8zj+uIkxEwHMIP+grv
	HfyyR4LGLRPd32dyRkKkMBjT7sR7xScr+zXmlmpH5scXdY6pq+edYDQuRofbfPk4Y69A6paBxX5vH
	bvI8EGplpHtZO8n6Ya1dJo6kVNgWMXj3Qg8iF8Q2s7BTI9HnNUqLGAX0aue9aGp1fwUf0+QMLbY7w
	KFYerqUGIILFcfbM11jEty/N7ix28e36x3P190AaE3YJxBPOVoEyX2XBwbCUdt8s49l3LYfPmXgN7
	ISELptkkP2Hau8/9t608G5mrYzq1wwnu0ESZCpY7uW7maAuZkkCe2h4M5gexvBoQcWh+nTA71Lqmt
	Ab43hIBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwskA-0000000C6Ko-1QzK;
	Mon, 02 Mar 2026 02:10:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsk6-0000000C6Iv-3AGQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 02:10:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso34211855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 18:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417441; x=1773022241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwCutTpNf6ifG9SAmX44tqMP8TE8P/7XXDyl59hedWg=;
        b=ZOR58U5raQbbn4vNANga94+3ThSr/HJGFg4ROvIAOeNoRYWr0Z8Fqa1lILgRvGmAVy
         iGs0DxOFVQ5aZOBrNXhOq10865l49/X07pT4fcyimgDoTpP6dgBgCd6ZON2+w6WQ0GQd
         5dKMayIA3otlcV9rigQFb4HdsA43dvtQ66NDy7Jh+DHaRfFSH1V5tyNjo5u1l5N4649t
         lhEUqNUP7On02HRkATEh3wyaZvJDIfDKUDocV5Zpm0WARgRS/gdZMx4F3EswwH7l3hvL
         7/Y3IxNdjywXHQLK/Kp41RAsp2iBR/qHHBY52Uin8i6sfXF7qS5ZT61VSdaD2gJY0mEp
         EgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417441; x=1773022241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KwCutTpNf6ifG9SAmX44tqMP8TE8P/7XXDyl59hedWg=;
        b=Fv3gjNNxmTFafwsfw9jXDRoSabBs5QelcSYU3eWidJj2dqscU/cwfa3zUtlLPPTjd/
         aMxRzQE6pFqrWy89mfx4ojoVPvDuOIm4zq2CqVh6Dj5hcFIKGlUg0SrJLHI7oMcOqOPu
         0f6DBLO7qTqUMh2M9U7frPCxR5thaCz3ibd+OFkfE97ZqsddTqn3BEMtggRmqpbA+dEe
         puqEIWMkIya80CpdluGn6Of3xtsdxQL5ziTXUABr+Dm1mvyTwfnjK408tZcW73UNltgd
         tfisb2EV6M840zLE6vHXFC4s0nBbT2lbr/p3IbO/8RwWxUHpThAf15KqHHhKh2nl07ay
         eAJg==
X-Forwarded-Encrypted: i=1; AJvYcCWm9Z9N9YzHH9/MWGOnv72fjQXHu8dHF83dDXi4g9h95usah8rKb9jfHTsa0h3kuA1BI/rMDO5DvlOdzwGb3Je6@lists.infradead.org
X-Gm-Message-State: AOJu0YwNmbGQEjXHOXwgTl19g71AsBxYqqJ099d2NRAZOPBkvLTld5J8
	D94JRILbtZGuUi0E/TD1lUE0/Au+MQX1Jj3fYYsBqws9cj0L4aY5xVrn
X-Gm-Gg: ATEYQzx2coNNVpKR7TWUZdLWdgdoAL2IxSoYUAwodDIJTIprjy+EF8oyTIBQVgUYrjZ
	JFkzY8DEvMOcD2QXZBYBHxQAxNBdunmUns11NF7hD/L0y7UpYfWQuSCne8pog2pri6vuryMCQRf
	/WLtBms3T2qCnx7JF7RKzY8qJGVjdq+BvFhDrM9JwUIyDjj9tpjK7ZDOBhvALMlw9N+daBgOo8t
	A+L7roZvJybTsP1kwoWL8ern8ZrzchS+oSlgUX/zFszx9IOB/h+/Ja4g2RROLGg3+tdxoP6tXL2
	xc5gusr316AO/nF9pS/o1szBt+JiGU7pRasRuveaRNGT2MvpKkPK2je3GzDI9PrJr2dVS6Wb92+
	C8l9000MHGUTE4JdeshWPu2PExS6veIambMV3A3Giz25WtdZ2k9WIHPwthXdztVDU4jvhJ8wGST
	LaUYjGGjelX+b2azsttZ0+
X-Received: by 2002:a05:600c:4592:b0:480:52fd:d2e4 with SMTP id 5b1f17b1804b1-483c9b78c20mr199672795e9.0.1772417440636;
        Sun, 01 Mar 2026 18:10:40 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm194451105e9.7.2026.03.01.18.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:10:40 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	andre.przywara@arm.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
Date: Mon,  2 Mar 2026 10:09:56 +0800
Message-ID: <20260302020956.96424-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302020956.96424-1-jerrysteve1101@gmail.com>
References: <20260302020956.96424-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_181044_084860_2BCC20D3 
X-CRM114-Status: GOOD (  19.56  )
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

TaiqiCat (TQC) A01 is a set-top box powered by an Allwinner H6 SoC,
equipped with an AXP305 PMIC, 1GB LPDDR3 RAM, 8GB eMMC, an AP6212
WiFi/BT combo module, one 100M Ethernet port, one USB 3.0 Type-A port,
one USB 2.0 Type-A port, one Micro USB port, HDMI, SPDIF, Micro-SD, and
infrared input.

It was released by Ultrapower(UQSoft) as a blockchain-based terminal and is
now discontinued and no longer supported.

  https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

Hardware schematics are not available at this time; however, the
dts from the vendor firmware is provided for reference [1].

Based on the PCB silkscreen marking "AZW-KT02 2.0", the ODM/OEM
can be confirmed as AZW, and the overall hardware circuit design
is highly similar to the Beelink GS1.

Tested, works:
- debug UART
- status LED
- USB 3.0 Type-A port
- USB 2.0 Type-A port
- Micro USB port (Host)
- MicroSD
- eMMC
- WiFi/Bluetooth
- HDMI video output

Does not work:
- Ethernet (requires AC200 MFD/EPHY driver)
- HDMI audio

Untested:
- SPDIF
- IR receiver

[1] https://archive.org/download/tqc-a01-stock-fw/tqc-a01-stock-fw.dts

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
 2 files changed, 362 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 2edfa7bf4ab3..d116864b6c2b 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-lite2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-orangepi-one-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-pine-h64-model-b.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-taiqicat-a01.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h6-tanix-tx6-mini.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h313-tanix-tx1.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
new file mode 100644
index 000000000000..3138292abb45
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (C) 2026 Jun Yan <jerrysteve1101@gmail.com>
+
+/dts-v1/;
+
+#include "sun50i-h6.dtsi"
+#include "sun50i-h6-cpu-opp.dtsi"
+#include "sun50i-h6-gpu-opp.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "TaiqiCat (TQC) A01";
+	compatible = "ultrapower,taiqicat-a01", "allwinner,sun50i-h6";
+
+	aliases {
+		ethernet0 = &sdio_wifi;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	connector {
+		compatible = "hdmi-connector";
+		ddc-en-gpios = <&pio 7 2 GPIO_ACTIVE_HIGH>; /* PH2 */
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
+	ext_osc32k: ext-osc32k-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext_osc32k";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			label = "taiqicat:blue:power";
+			gpios = <&r_pio 0 4 GPIO_ACTIVE_HIGH>; /* PL4 */
+			default-state = "on";
+		};
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply directly from the DC jack */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	sound-spdif {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "sun50i-h6-spdif";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_out>;
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+		reset-gpios = <&r_pio 0 8 GPIO_ACTIVE_LOW>; /* PL8 */
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdca>;
+};
+
+&de {
+	status = "okay";
+};
+
+&dwc3 {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci3 {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&reg_dcdcc>;
+	status = "okay";
+};
+
+&hdmi {
+	hvcc-supply = <&reg_bldo2>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_cldo1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	bus-width = <4>;
+	disable-wp;
+	status = "okay";
+};
+
+&mmc1 {
+	vmmc-supply = <&reg_cldo3>;
+	vqmmc-supply = <&reg_bldo3>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	keep-power-in-suspend;
+	status = "okay";
+
+	sdio_wifi: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac";
+		interrupt-parent = <&r_pio>;
+		interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_cldo1>;
+	vqmmc-supply = <&reg_bldo2>;
+	cap-mmc-hw-reset;
+	non-removable;
+	mmc-hs200-1_8v;
+	bus-width = <8>;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci3 {
+	status = "okay";
+};
+
+&pio {
+	vcc-pc-supply = <&reg_bldo2>;
+	vcc-pd-supply = <&reg_cldo1>;
+	vcc-pg-supply = <&reg_bldo3>;
+};
+
+&r_i2c {
+	status = "okay";
+
+	axp805: pmic@36 {
+		compatible = "x-powers,axp805", "x-powers,axp806";
+		reg = <0x36>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		x-powers,self-working-mode;
+		vina-supply = <&reg_vcc5v>;
+		vinb-supply = <&reg_vcc5v>;
+		vinc-supply = <&reg_vcc5v>;
+		vind-supply = <&reg_vcc5v>;
+		vine-supply = <&reg_vcc5v>;
+		aldoin-supply = <&reg_vcc5v>;
+		bldoin-supply = <&reg_vcc5v>;
+		cldoin-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1: aldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-pl-led-ir-pg-pm-ts";
+			};
+
+			reg_aldo2: aldo2 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-ac200";
+				regulator-enable-ramp-delay = <100000>;
+			};
+
+			aldo3 {
+				/* unused */
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc18-dram-bias-pll";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pc-emmc-efuse-hdmi";
+			};
+
+			reg_bldo3: bldo3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pg-wifiio";
+			};
+
+			bldo4 {
+				/* unused */
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc33-io-pd-emmc-sd-usb-uart";
+			};
+
+			/* This regulator is connected with CLDO3 */
+			reg_cldo2: cldo2 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-wifi-1";
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-wifi-2";
+			};
+
+			reg_dcdca: dcdca {
+				regulator-always-on;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <1160000>;
+				regulator-ramp-delay = <2500>;
+				regulator-name = "vdd-cpu";
+			};
+
+			reg_dcdcc: dcdcc {
+				regulator-enable-ramp-delay = <32000>;
+				regulator-min-microvolt = <810000>;
+				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
+				regulator-name = "vdd-gpu";
+			};
+
+			reg_dcdcd: dcdcd {
+				regulator-always-on;
+				regulator-min-microvolt = <960000>;
+				regulator-max-microvolt = <960000>;
+				regulator-name = "vdd-sys-hdmi-usb";
+			};
+
+			reg_dcdce: dcdce {
+				regulator-always-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-name = "vcc-dram";
+			};
+
+			sw {
+				/* unused */
+			};
+		};
+	};
+};
+
+&r_ir {
+	status = "okay";
+};
+
+&r_pio {
+	/*
+	 * PL0 and PL1 are used for PMIC I2C
+	 * don't enable the pl-supply else
+	 * it will fail at boot
+	 *
+	 * vcc-pl-supply = <&reg_aldo1>;
+	 */
+	vcc-pm-supply = <&reg_aldo1>;
+};
+
+&rtc {
+	clocks = <&ext_osc32k>;
+};
+
+&spdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spdif_tx_pin>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_ph_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43430a1-bt";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_cldo3>;
+		vddio-supply = <&reg_bldo3>;
+		device-wakeup-gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+		host-wakeup-gpios = <&r_pio 1 1 GPIO_ACTIVE_HIGH>; /* PM1 */
+		shutdown-gpios = <&r_pio 1 4 GPIO_ACTIVE_HIGH>; /* PM4 */
+		max-speed = <1500000>;
+	};
+};
+
+&usb2otg {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb2phy {
+	usb0_vbus-supply = <&reg_vcc5v>;
+	usb3_vbus-supply = <&reg_vcc5v>;
+	status = "okay";
+};
+
+&usb3phy {
+	status = "okay";
+};
-- 
2.53.0


