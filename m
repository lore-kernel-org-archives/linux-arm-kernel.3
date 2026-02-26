Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6384BFC590E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTKetamP2EeNXOUhoU5K8kxvTOyJjzbTJBd4dOGFFHM=; b=aIJ2tPpfQ3nGoKwR3Yo5oKSKo6
	1yPutP3lOG8HR3D4Ya51jLWPe8eKkaQwrzbO+/nYChSpBjt+xRyd6/eJc7e87OU95/FoIQwTItZqR
	Fd0PUIAKrrfrqkN8OW/ijsSA1+k/IZ6wf4kolDh3cyffawyROWccXE4co109dn12nu2l29RnULTt2
	VFnvkbUfSeccG8hpEUDcZNJyy5PrnASl3p8cGMIfH7bb1LLC/A+TbDbMBA9Eu+CUkxlCiGs+v+1UZ
	9vRn3shUhnaDGVLoFaytr6YrRusMkCbHBEg1yv+j2agbqcFAqqpAajTU00Svt6kVyD/C8oBSBBIhd
	vUp/W9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX3Z-00000005hGV-2WYy;
	Thu, 26 Feb 2026 08:49:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX3V-00000005hDw-3Jmb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:49:11 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-81df6a302b1so777167b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772095749; x=1772700549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTKetamP2EeNXOUhoU5K8kxvTOyJjzbTJBd4dOGFFHM=;
        b=PTH9BOSvWVegBLVQlTeo+jIqeyqHdkhjZKwvY1VmRkzZFJkAyGXlccCCuyxYyB4olu
         RGyxkxZSm8ssswloLM9YKJJUcNj54GJZdKXH4eSNCuj4KLjyoyFuDKNEGd9wOZMwTV4P
         wZp4C6deTWeeKBRw4wRMBkxSnZHyaaB4uIHoLDCRyDgTKwerXzI8AELTKGgEQ/nKozL5
         XJQ/Bxvzit/cPGDERPnswYofqAOsTdc4798AzJhjDBrHGFmOrPY9AMXWLFsW0IsvjvpE
         sI+b0iW+P7rLa46E01AfFjIpDLB7ZAUTMdEOWCSvsfLiuKXhZtG8coGk3srSO1M3HqPR
         M0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772095749; x=1772700549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oTKetamP2EeNXOUhoU5K8kxvTOyJjzbTJBd4dOGFFHM=;
        b=i3WIlpTP8zLcMG6L06aSezLHeApO1E4empqQZFrty+nRu0ZCSPqYTjmyf7wuF4IcHB
         mFsyINARhPcNLtZ1x/hyk8IqBpTF7LTM0J3mW+lezuzzHWS4fvyZumqp6EcBvclqf3yP
         j/XfCSIcp5v+wJgL1D2qvbmM8BVdqYdDNpN1+8cuihu+RG28G68Jq+sUeSpOo93WHkSO
         PqB5hmSU+kNqD3BhleHbUbh38blphmu0MPqsYBBlCk8XyzYcoGHXDHXgr2jnY7sEim9J
         fxERgLrHd4XWMJI9V27gcDbg0Ta02OGhXofj2RgYPyy56ilCVa0SCdAv/tXeKzunfzAN
         uuEA==
X-Forwarded-Encrypted: i=1; AJvYcCV+UEErYuOG8KfICgNbVene+S2SOZhErEj2oXvogg+HGB6UII1tKvS6IbbsN4nESwRIdsT7Rl80snmEEb+F/V/T@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0xv/tPeQZjZQO9Gq+Us1k75oJN+BsLXe7JpiGU+r9o0Dy8+qM
	kSH5XM8Qj8pA7EG5Iicv5ORRDzyazNo0ybma1xxROqT+/DnW4tGZcMIy
X-Gm-Gg: ATEYQzwYAkdaCtVYlhOLJ+i6dVHVPHkq7eeatWWW7OP1whoYUg7p5pdomEWV9iyslIq
	ej5Kg99drioUIsQep/GCTWpHY3+s4VZ3UdiFlZ2HPJP2nFC3YfNgpm+M5VwHT79s7IgSYI0Pejd
	uppDbLi94XL6FKyKM5OJ888iO26KmDMOPECX3+w+Pw3OZvjV5LdDsxsuTezmJXPeCF1me13sti5
	gR1aSai4DwrlSVqsnAjFnn6uoDbKRXVWFlzOM3x6UGjAMR0OpC7j7w4DJLvN7CZJ3yweashnB8T
	nbbGQqX34Gd/VffqiqK+UjqX70rvV5dGs0ensKlxkLNrtWpFqlBNZPwrsF4M2WcCvpw8bLgmFyP
	9ct4meN7vuY9a5wsK/FdcjADkcAKEFyFlpi5Bp79UKrO0ZuIpKqsjyJl+z/FigpXwaCZkMg3Sl+
	99yzqP72mvlUPAUUmt6gadBPx+ZNqUo/VMrExM
X-Received: by 2002:a05:6a20:6a15:b0:394:a026:4c60 with SMTP id adf61e73a8af0-395ad0f204fmr3272592637.32.1772095748941;
        Thu, 26 Feb 2026 00:49:08 -0800 (PST)
Received: from arch.localdomain ([117.147.91.218])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa848471sm1342441a12.30.2026.02.26.00.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 00:49:08 -0800 (PST)
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
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
Date: Thu, 26 Feb 2026 16:48:47 +0800
Message-ID: <20260226084850.417731-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226084850.417731-1-jerrysteve1101@gmail.com>
References: <20260226084850.417731-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_004909_979640_916103E4 
X-CRM114-Status: GOOD (  19.40  )
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

It was released by UQsoft as a blockchain-based terminal and is
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
index 000000000000..2a685eba08f2
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
+	compatible = "uqsoft,taiqicat-a01", "allwinner,sun50i-h6";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
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
+	brcm: sdio-wifi@1 {
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


