Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB4510F995C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7h9KF6DUxHVCjojEM2b2Af8cE4DbNkN2i/zma/X7Ow=; b=GIoWeDB1lXnqhuguv9oEpF5GHa
	H+OEb/Am6e58rIbTR41201/QZxMnT2UPtv60fb3KM2vNzhFAmjfhewR1WvW+2rxDxKam9ZeJt5gmC
	U/mIi8bdRiUtn3Y1zw3No2QylsQW/vrbG5/FxKBPosL3CgxaTXOQI0rZq3luFq7lq6AqYWr9HqdS2
	nR+hbQZX6mNLE9pkcKQkTchwTw/rqRVl0PZCS4zSgOu5sf5yAHhlKUcSYh6RNZ4f2GLalpAeudPWq
	HE5P/y7FU9ELqZUKneOlRyYHTP51czSrvubLLaipPpPU+xWQQXZMwMkXpXYExGJfzsj0p3bCypsTD
	jPNiPgDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAX2u-00000009Dh7-2ShL;
	Wed, 08 Apr 2026 17:50:32 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAX2s-00000009DeV-1aBm;
	Wed, 08 Apr 2026 17:50:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1775670618; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I4u7FW/tPFG/CjB3SVm9X11ID8dowsVwLk0U0XFJSktZfhxVxfvs0egS0DOr+EX4OnoeGTsG9e2tpJnwnnuhn0JLh6RwiHNPf6Wrvu91iEXbYzAduzZr2xkh+BuM36cS/Eu0gKzMMMy4lS5bI9+I8KfpaxXCVj4kVbqyhUbeeOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775670618; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I7h9KF6DUxHVCjojEM2b2Af8cE4DbNkN2i/zma/X7Ow=; 
	b=PWYdccTH0fTMhS8GnUFkVIC58LJW4LVpFfewPfog1+ChdTuVMML+UqSt8TjdrD8JUyDU2ItiUjqRmR5QCYT6NEX+rurSRhkYWk+66sF0VyvANCGvk6/0FEu40Tp1v3KCkAJJPr8AXoqHp5dCFap3jpV0m23dYsgcIqT2zaLAwmU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775670618;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=I7h9KF6DUxHVCjojEM2b2Af8cE4DbNkN2i/zma/X7Ow=;
	b=lMZpj1ZW+MX0hZ9CgXdA71UCvB5cuthaTJKBL771nBkz1A214PCJUozqdEKMx/s0
	blEHdcUhbm08487WO1RemLqcEovi9I44DBqB9TzNhbIxNhub328hJdjkhVBveyPHEOO
	FPRM4mhZkg7nTT/De8DKSnl5M0ucMYOyzyb3fuQ8=
Received: by mx.zohomail.com with SMTPS id 1775670617761642.4208513616555;
	Wed, 8 Apr 2026 10:50:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 08 Apr 2026 19:49:42 +0200
Subject: [PATCH v3 4/4] arm64: dts: rockchip: add analog audio to ROCK 4D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-rock4d-audio-v3-4-49e43c3c2a68@collabora.com>
References: <20260408-rock4d-audio-v3-0-49e43c3c2a68@collabora.com>
In-Reply-To: <20260408-rock4d-audio-v3-0-49e43c3c2a68@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_105030_482936_DE1ACF37 
X-CRM114-Status: GOOD (  19.05  )
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

The RADXA ROCK 4D, like many other Rockchip-based boards, uses an ES8388
analog audio codec. On the production version of the board, the codec's
LOUT1 and ROUT1 pins are tied to the headphone jack, whereas pins LOUT2
and ROUT2 lead to a non-populated speaker amplifier that itself leads to
a non-populated speaker jack. The schematic is still haunted by the
ghosts of those symbols, but it clearly marks them as "NC".

The 3.5mm TRRS jack has its microphone ring (and ground ring) wired to
the codec's LINPUT1 and RINPUT1 pins for differential signalling.

Furthermore, it uses the SoCs ADC to detect whether the inserted cable
is of headphones (i.e., no microphone), or a headset (i.e., with
microphone). The way this is done is that the ADC input taps the output
of a 100K/100K resistor divider that divides the microphone ring pin
that's pulled up to 3.3V.

There is no ADC level difference between a completely empty jack and one
with a set of headphones (i.e., ones that don't have a microphone)
connected. Consequently headphone insertion detection isn't something
that can be done.

Add the necessary codec and audio card nodes. The non-populated parts,
i.e. LOUT2 and ROUT2, are not modeled at all, as they are not present on
the hardware.

Also, add an adc-keys node for the headset detection, which uses an
input type of EV_SW with the SW_MICROPHONE_INSERT keycode. Below the
220mV pressed voltage level of our SW_MICROPHONE_INSERT switch, we also
define a button that emits a KEY_RESERVED code, which is there to model
this part of the voltage range as not just being extra legroom for the
button above it, but actually a state that is encountered in the real
world, and should be recognised as a valid state for the ADC range to be
in so that no "closer" ADC button is chosen.

Tested-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 90 +++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 899a84b1fbf9..c848c706196e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/pwm/pwm.h>
@@ -37,6 +38,31 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	es8388_sound: es8388-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "On-board Analog ES8388";
+		simple-audio-card,widgets = "Microphone", "Headphone Mic",
+					    "Headphone", "Headphone";
+		simple-audio-card,routing = "Headphone", "LOUT1",
+					    "Headphone", "ROUT1",
+					    "Left PGA Mux", "Differential Mux",
+					    "Differential Mux", "LINPUT1",
+					    "Differential Mux", "RINPUT1",
+					    "LINPUT1", "Headphone Mic",
+					    "RINPUT1", "Headphone Mic";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+
 	rfkill {
 		compatible = "rfkill-gpio";
 		pinctrl-names = "default";
@@ -65,6 +91,37 @@ user-led {
 		};
 	};
 
+	saradc_keys: adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 3>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <3000000>;
+		poll-interval = <100>;
+
+		/*
+		 * During insertion and removal of a regular set of headphones,
+		 * i.e. one without a microphone, the voltage level briefly
+		 * dips below the 220mV of the headset connection switch.
+		 * By having a button definition with a KEY_RESERVED signal
+		 * between 0 to 220, we ensure no driver implementation thinks
+		 * that the closest thing to 0V is 220mV so clearly there must
+		 * be a headset connected.
+		 */
+
+		button-headset-disconnected {
+			label = "Headset Microphone Disconnected";
+			linux,code = <KEY_RESERVED>;
+			press-threshold-microvolt = <0>;
+		};
+
+		button-headset-connected {
+			label = "Headset Microphone Connected";
+			linux,code = <SW_MICROPHONE_INSERT>;
+			linux,input-type = <EV_SW>;
+			press-threshold-microvolt = <220000>;
+		};
+	};
+
 	vcc_5v0_dcin: regulator-vcc-5v0-dcin {
 		compatible = "regulator-fixed";
 		regulator-always-on;
@@ -696,6 +753,25 @@ eeprom@50 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	es8388: audio-codec@10 {
+		compatible = "everest,es8388", "everest,es8328";
+		reg = <0x10>;
+		clocks = <&cru CLK_SAI1_MCLKOUT_TO_IO>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcc_3v3_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcc_3v3_s0>;
+		assigned-clocks = <&cru CLK_SAI1_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sai1m0_mclk>;
+	};
+};
+
 &mdio0 {
 	rgmii_phy0: ethernet-phy@1 {
 		compatible = "ethernet-phy-id001c.c916";
@@ -770,10 +846,24 @@ wifi_en_h: wifi-en-h {
 	};
 };
 
+&sai1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sai1m0_lrck
+		     &sai1m0_sclk
+		     &sai1m0_sdi0
+		     &sai1m0_sdo0>;
+	status = "okay";
+};
+
 &sai6 {
 	status = "okay";
 };
 
+&saradc {
+	vref-supply = <&vcca1v8_pldo2_s0>;
+	status = "okay";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-mmc-highspeed;

-- 
2.53.0


