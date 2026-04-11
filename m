Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A53F45A1F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 02:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWb3wq+tLz2SXSLe84zxMiTa2uE6dgIP0LkrcchIYxY=; b=zF738O9C3CjZHoUXN9T9y+Q1X0
	TW1IIsInXgoTU7iv/O1ZQ6b9HdeKTIBBP/x7GQeOVjL2lZ7FFT+pP8E3O8sA6bAdYDpBhLz3KZii/
	l+V68KHt7Q01jCjiIBMEl//iuIsRI0JojI4ef+KPy/eTNsTuKW0ycu/R5tGRmSQZP68qWWfr86jZ1
	bgFfQUjz7ksKInDayn81fo+4lzLsahWfrn9VnB/eE9O377NulQYuGMIDqmKewdMAcOfHJxQmX7XZ8
	VW7phOlB2Uzu8SoUnJfKOigsd/uqtAcNgv5XiMP+TRVEPV8ASgh6jyfPOX9myE/ALuh7qJ0dWkOZy
	qhBw+HTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBOO4-0000000D44Q-3s8j;
	Sat, 11 Apr 2026 02:47:56 +0000
Received: from mail-oo1-xc62.google.com ([2607:f8b0:4864:20::c62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBONz-0000000D409-11yF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 02:47:52 +0000
Received: by mail-oo1-xc62.google.com with SMTP id 006d021491bc7-685013eb590so1655013eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 19:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775875670; x=1776480470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWb3wq+tLz2SXSLe84zxMiTa2uE6dgIP0LkrcchIYxY=;
        b=hbWi3PKQ9HsA0Wl1QFmC0WzXcuA7eDRIDJ98oDMrSBby/Fe/inpSASDiPufMOYdi6H
         4YesqMbaZdAUiiq8lvLvKhsQjYiqkt80lQCh1uC4ch0nvUgbRrEdcuUaFABlwa2Q2yYY
         SCwY/Mjml+WxgXn5ITmp08Qj/5pUBbq0r/KgRQSdyzmunLCkA1k7hu24jeNXYW2RX5iP
         PvaKi4ImidnSq7MNN9ftt/UN/54eOUoTbU5LtZHmrVBAG/rQqJ6wC4pZGQT9XfojoOmi
         +no3TbEeL9SlDi/A1soQd9bzeMA/QzReYJmh2FQ/L2LkMr04QeSLeGTJg5kCacSfoQUj
         FzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775875670; x=1776480470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWb3wq+tLz2SXSLe84zxMiTa2uE6dgIP0LkrcchIYxY=;
        b=ej2SNqpJGLRCxsBqCC4d8EFvyqOpUCPsmqS1JrRSRsv1QfW1OvE98ZdWaDYrTuO4Nf
         y0hipSNriKcENhjMz8ZnlHvbgB/g3OItyedX7hv2XkK82tcT91Z860Q6pP73ADq6XcL8
         ZoTQImt6lkzqs4naaIHywPV2+fLb1oXFrrJLTthwBUosiB2sOjZ51JJPoeNybACWy88o
         3TMxuuQpypwqvIA5eJfsHn1dpdNMwH3VYluvcxk5NSLwIA2kwi+KGoOGXjGnXsaQT8Hi
         1yknkoHco7S5qfraq3a2EyKyQaHpm2in26BonMVcmLWJVNGvJ6Dh/NjMSRm6joBsHCO1
         YrwA==
X-Forwarded-Encrypted: i=1; AJvYcCXl51jPUSA7A/kjdkFHgs0t+6/yrEJQlKjHxgSlSKav2WUZmsAWiQVMJSA0vNcpVeKaEMpbnxBp9zRew4zS+Hne@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ40NdZlcLRI5SriWOo3N+YffJvyaCeLi/oONL0453MVlt/a31
	+G5Dx8Ir+TKDTe9OkpvDItW/OX5CrYUZe6L7pImTJJMPOpaC8JwoGssgDPSGcRZNAoNeevFyWr2
	tPQcoO5oVGCKyKhK6ApZ9XC5L8+JpCPEr0w0Z
X-Gm-Gg: AeBDieuljnieywXh8VwUrgTIN0+p71LlkgggGtgvNxRdEo1ac3zlHKYrGLeCFn3u79K
	GaIIU0o4jmCMt0XlDqsiEqphHa5XKQD+VmWWyVwVc7VCgybA5/2yetQBwIQkWAMpJduDmqJjr+4
	DvDIO65buaNFi2LYqgRFZtsxQVoyd5ATmDmFVJaiU43hVdl4l+okPBvy6KvHFJdGv1Q/U9duh5W
	NnOaLIjBXidOgkr/Sl6Rjkoxe9UYpjRxme5bRxOSLlWLIp5fiLN09MpHR4sWrIPW3QQH8+3H7Ls
	PzvUDi/MYzXoRiLExTgxc+6UPcGk0JimCslhoct4KMG7vo64c04mIDvbi4zv4p5tgcEdIF6Y591
	SyJc0ukhP2VV+8sUzyXLgErOoI/buutZDGZMASiepAtdN
X-Received: by 2002:a05:6820:7513:b0:682:47e0:5d4e with SMTP id 006d021491bc7-68a68d5f842mr3068714eaf.14.1775875670052;
        Fri, 10 Apr 2026 19:47:50 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-423ddd32ab3sm599086fac.16.2026.04.10.19.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 19:47:50 -0700 (PDT)
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
	Chukun Pan <amadeus@jmu.edu.cn>,
	Alexey Charkov <alchark@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/3] arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for Pro
Date: Fri, 10 Apr 2026 21:47:42 -0500
Message-ID: <20260411024743.195385-3-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024743.195385-1-dennis@ausil.us>
References: <20260411024743.195385-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_194751_333430_30BD9D17 
X-CRM114-Status: GOOD (  17.59  )
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

The Orange Pi 5 Pro uses the same SoC and base as the Orange Pi 5 and
Orange Pi 5B but has had sound, USB, and leds wired up differently. The
boards also use gmac for ethernet where the Pro has a PCIe attached NIC.

I have not changed the definitions from what was in rk3588s-orangepi-5.dtsi

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../dts/rockchip/rk3588s-orangepi-5-5b.dtsi   | 192 +++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dts  |   6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 198 +-----------------
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts |   2 +-
 4 files changed, 209 insertions(+), 189 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
new file mode 100644
index 000000000000..b04dd667605d
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device tree definitions shared by the Orange Pi 5 and Orange Pi 5B
+ * but not the Orange Pi 5 Pro.
+ */
+
+#include <dt-bindings/usb/pd.h>
+#include "rk3588s-orangepi-5.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &gmac1;
+	};
+
+	analog-sound {
+		compatible = "simple-audio-card";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,name = "rockchip,es8388";
+		simple-audio-card,bitclock-master = <&masterdai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&masterdai>;
+		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		simple-audio-card,mclk-fs = <256>;
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
+			sound-dai = <&i2s1_8ch>;
+		};
+
+		masterdai: simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+			max-brightness = <255>;
+			pwms = <&pwm0 0 25000 0>;
+		};
+	};
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-rxid";
+	pinctrl-0 = <&gmac1_miim
+		     &gmac1_tx_bus2
+		     &gmac1_rx_bus2
+		     &gmac1_rgmii_clk
+		     &gmac1_rgmii_bus>;
+	pinctrl-names = "default";
+	tx_delay = <0x42>;
+	status = "okay";
+};
+
+&i2c6 {
+	es8388: audio-codec@10 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x10>;
+		clocks = <&cru I2S1_8CH_MCLKOUT>;
+		AVDD-supply = <&vcc_3v3_s0>;
+		DVDD-supply = <&vcc_1v8_s0>;
+		HPVDD-supply = <&vcc_3v3_s0>;
+		PVDD-supply = <&vcc_3v3_s0>;
+		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+
+	usbc0: usb-typec@22 {
+		compatible = "fcs,fusb302";
+		reg = <0x22>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbc0_int>;
+		vbus-supply = <&vbus_typec>;
+		status = "okay";
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			data-role = "dual";
+			op-sink-microwatt = <1000000>;
+			power-role = "dual";
+			sink-pdos =
+				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
+			source-pdos =
+				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			try-power-role = "source";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					usbc0_hs: endpoint {
+						remote-endpoint = <&usb_host0_xhci_drd_sw>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					usbc0_ss: endpoint {
+						remote-endpoint = <&usbdp_phy0_typec_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					usbc0_sbu: endpoint {
+						remote-endpoint = <&usbdp_phy0_typec_sbu>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&i2s1_8ch {
+	rockchip,i2s-tx-route = <3 2 1 0>;
+	rockchip,i2s-rx-route = <1 3 2 0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s1m0_sclk
+	             &i2s1m0_mclk
+	             &i2s1m0_lrck
+	             &i2s1m0_sdi1
+	             &i2s1m0_sdo3>;
+	status = "okay";
+};
+
+&pwm0 {
+	pinctrl-0 = <&pwm0m2_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	dr_mode = "otg";
+	usb-role-switch;
+
+	port {
+		usb_host0_xhci_drd_sw: endpoint {
+			remote-endpoint = <&usbc0_hs>;
+		};
+	};
+};
+
+&usb_host2_xhci {
+	status = "okay";
+};
+
+&usbdp_phy0 {
+	mode-switch;
+	orientation-switch;
+	sbu1-dc-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		usbdp_phy0_typec_ss: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&usbc0_ss>;
+		};
+
+		usbdp_phy0_typec_sbu: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&usbc0_sbu>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
index 83b9b6645a1e..d76bdf1b5e90 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
@@ -2,12 +2,16 @@
 
 /dts-v1/;
 
-#include "rk3588s-orangepi-5.dtsi"
+#include "rk3588s-orangepi-5-5b.dtsi"
 
 / {
 	model = "Xunlong Orange Pi 5";
 	compatible = "xunlong,orangepi-5", "rockchip,rk3588s";
 
+	aliases {
+		mmc0 = &sdmmc;
+	};
+
 	vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..5c154cc6c62a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -3,19 +3,13 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
-#include <dt-bindings/usb/pd.h>
 #include "rk3588s.dtsi"
 
 / {
-	aliases {
-		ethernet0 = &gmac1;
-		mmc0 = &sdmmc;
-	};
-
 	chosen {
 		stdout-path = "serial2:1500000n8";
 	};
@@ -34,38 +28,6 @@ button-recovery {
 		};
 	};
 
-	analog-sound {
-		compatible = "simple-audio-card";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hp_detect>;
-		simple-audio-card,name = "rockchip,es8388";
-		simple-audio-card,bitclock-master = <&masterdai>;
-		simple-audio-card,format = "i2s";
-		simple-audio-card,frame-master = <&masterdai>;
-		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
-		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,routing =
-			"Headphones", "LOUT1",
-			"Headphones", "ROUT1",
-			"LINPUT1", "Microphone Jack",
-			"RINPUT1", "Microphone Jack",
-			"LINPUT2", "Onboard Microphone",
-			"RINPUT2", "Onboard Microphone";
-		simple-audio-card,widgets =
-			"Microphone", "Microphone Jack",
-			"Microphone", "Onboard Microphone",
-			"Headphone", "Headphones";
-
-		simple-audio-card,cpu {
-			sound-dai = <&i2s1_8ch>;
-		};
-
-		masterdai: simple-audio-card,codec {
-			sound-dai = <&es8388>;
-			system-clock-frequency = <12288000>;
-		};
-	};
-
 	hdmi0-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -77,18 +39,6 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
-	pwm-leds {
-		compatible = "pwm-leds";
-
-		led {
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_STATUS;
-			linux,default-trigger = "heartbeat";
-			max-brightness = <255>;
-			pwms = <&pwm0 0 25000 0>;
-		};
-	};
-
 	vbus_typec: regulator-vbus-typec {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -101,15 +51,6 @@ vbus_typec: regulator-vbus-typec {
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-	vcc5v0_sys: regulator-vcc5v0-sys {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc5v0_sys";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-	};
-
 	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		compatible = "regulator-fixed";
 		gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
@@ -119,6 +60,15 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_3v3_s3>;
 	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
 };
 
 &combphy0_ps {
@@ -161,20 +111,6 @@ &cpu_l3 {
 	cpu-supply = <&vdd_cpu_lit_s0>;
 };
 
-&gmac1 {
-	clock_in_out = "output";
-	phy-handle = <&rgmii_phy1>;
-	phy-mode = "rgmii-rxid";
-	pinctrl-0 = <&gmac1_miim
-		     &gmac1_tx_bus2
-		     &gmac1_rx_bus2
-		     &gmac1_rgmii_clk
-		     &gmac1_rgmii_bus>;
-	pinctrl-names = "default";
-	tx_delay = <0x42>;
-	status = "okay";
-};
-
 &gpu {
 	mali-supply = <&vdd_gpu_s0>;
 	status = "okay";
@@ -270,69 +206,6 @@ &i2c6 {
 	pinctrl-0 = <&i2c6m3_xfer>;
 	status = "okay";
 
-	es8388: audio-codec@10 {
-		compatible = "everest,es8388", "everest,es8328";
-		reg = <0x10>;
-		clocks = <&cru I2S1_8CH_MCLKOUT>;
-		AVDD-supply = <&vcc_3v3_s0>;
-		DVDD-supply = <&vcc_1v8_s0>;
-		HPVDD-supply = <&vcc_3v3_s0>;
-		PVDD-supply = <&vcc_3v3_s0>;
-		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
-		assigned-clock-rates = <12288000>;
-		#sound-dai-cells = <0>;
-	};
-
-	usbc0: usb-typec@22 {
-		compatible = "fcs,fusb302";
-		reg = <0x22>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PD3 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&usbc0_int>;
-		vbus-supply = <&vbus_typec>;
-		status = "okay";
-
-		usb_con: connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			data-role = "dual";
-			op-sink-microwatt = <1000000>;
-			power-role = "dual";
-			sink-pdos =
-				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
-			source-pdos =
-				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
-			try-power-role = "source";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					usbc0_hs: endpoint {
-						remote-endpoint = <&usb_host0_xhci_drd_sw>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					usbc0_ss: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_ss>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-					usbc0_sbu: endpoint {
-						remote-endpoint = <&usbdp_phy0_typec_sbu>;
-					};
-				};
-			};
-		};
-	};
-
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
@@ -346,18 +219,6 @@ hym8563: rtc@51 {
 	};
 };
 
-&i2s1_8ch {
-	rockchip,i2s-tx-route = <3 2 1 0>;
-	rockchip,i2s-rx-route = <1 3 2 0>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2s1m0_sclk
-	             &i2s1m0_mclk
-	             &i2s1m0_lrck
-	             &i2s1m0_sdi1
-	             &i2s1m0_sdo3>;
-	status = "okay";
-};
-
 &i2s5_8ch {
 	status = "okay";
 };
@@ -404,12 +265,6 @@ typec5v_pwren: typec5v-pwren {
 	};
 };
 
-&pwm0 {
-	pinctrl-0 = <&pwm0m2_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
 &rknn_core_0 {
 	npu-supply = <&vdd_npu_s0>;
 	sram-supply = <&vdd_npu_s0>;
@@ -841,26 +696,7 @@ &uart2 {
 };
 
 &usbdp_phy0 {
-	mode-switch;
-	orientation-switch;
-	sbu1-dc-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
-	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-
-	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		usbdp_phy0_typec_ss: endpoint@0 {
-			reg = <0>;
-			remote-endpoint = <&usbc0_ss>;
-		};
-
-		usbdp_phy0_typec_sbu: endpoint@1 {
-			reg = <1>;
-			remote-endpoint = <&usbc0_sbu>;
-		};
-	};
 };
 
 &usb_host0_ehci {
@@ -872,15 +708,7 @@ &usb_host0_ohci {
 };
 
 &usb_host0_xhci {
-	dr_mode = "otg";
-	usb-role-switch;
 	status = "okay";
-
-	port {
-		usb_host0_xhci_drd_sw: endpoint {
-			remote-endpoint = <&usbc0_hs>;
-		};
-	};
 };
 
 &usb_host1_ehci {
@@ -891,7 +719,7 @@ &usb_host1_ohci {
 	status = "okay";
 };
 
-&usb_host2_xhci {
+&vop {
 	status = "okay";
 };
 
@@ -899,10 +727,6 @@ &vop_mmu {
 	status = "okay";
 };
 
-&vop {
-	status = "okay";
-};
-
 &vp0 {
 	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
 		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
index d21ec320d295..8af174777809 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "rk3588s-orangepi-5.dtsi"
+#include "rk3588s-orangepi-5-5b.dtsi"
 
 / {
 	model = "Xunlong Orange Pi 5B";
-- 
2.53.0


