Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C34C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaCYyrbqrYjh5lrSJFFiV+CYsBoA1EBJh7E+FO7i5KI=; b=K+9zI4WUCFeV4UJFSFGI78r0Rg
	LoQdl6HFAQi4wlV3+WKobktJKrYseBQKieVebvfqVvinw25dKFco7XDK+A5q+bfBazeCeOOnuT8+v
	Sa/MaAG6nzy0sNVguWKV3L8QCwyurYzaBr8BTDF4f87Rx+q0jg9/vcN35/ZascJ1LojvBktG0ii0L
	iz+TjIqIwbFuAuMKwCTk83qJrur+FpLCeS+Z89QVNn+N0tQRxGVyZAbB9B6H7crZzoSDRCvD1h+oU
	zx0Udl0SK6v+iC9DLWT+v8HK1nw9uvX5WJjFgMDa133G4foyswJebgUGwno52BqKkciKGTEeuku7Q
	dsl5lfLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHzh-0000000C1SB-1gD0;
	Tue, 06 May 2025 13:05:57 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFlo-0000000Bbgw-3pR1;
	Tue, 06 May 2025 10:43:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746528196; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=brMsqbzUL/KN1CckQAUYqK/OAB0Wx9uBKKMTeQhCyEVls2zi+aaahcVKbG4Zmc7JMi+X/Rqe/KqK/2CtHnnRrnkmOEniFRreEQQtfumR2PqCRsoH4U5npmrmHEtUoHatD73PD/5zfiXjAZEL/0jrZL6n0i4F5O9edG1kVxSqc28=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746528196; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kaCYyrbqrYjh5lrSJFFiV+CYsBoA1EBJh7E+FO7i5KI=; 
	b=Q7DenkidvfqoQ/StQETFuXZyjGlZicELNp7Ujb1FxI5UyiBGg3fjEiphxqZs/LBMLxvWKu4FlzG2Q2CEQubz0zetQLHZ1HkWKoeXkRDC8pyP/9dR/jCMnjWFxY2SGRua1cAvVjpWYrqJMQRXmtTW5sLQ3VV7EANf9WJK4be5LKk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746528196;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=kaCYyrbqrYjh5lrSJFFiV+CYsBoA1EBJh7E+FO7i5KI=;
	b=XqgjtmHIXCY0ZhC9PQzgNgmVG4gNLFmOwchgsphWtenU9mIdCQrnLrPxuUNgBUx6
	F//4WZcdfHeX/TTM3oTnU4H4Lc3UPiTfpm4INv2xq0MT03P0j0Mz7KPbVpDRLwsUAn9
	acWVZAERN7uj/GpAvG2SXdKY7Vy9WY6uBx2XHbfc=
Received: by mx.zohomail.com with SMTPS id 1746528194017991.5681611931021;
	Tue, 6 May 2025 03:43:14 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 06 May 2025 12:42:42 +0200
Subject: [PATCH v4 3/5] arm64: dts: rockchip: Add analog audio on RK3576
 Sige5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-rk3576-sai-v4-3-a8b5f5733ceb@collabora.com>
References: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
In-Reply-To: <20250506-rk3576-sai-v4-0-a8b5f5733ceb@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_034329_009159_148B8F3A 
X-CRM114-Status: GOOD (  15.37  )
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

The ArmSoM Sige5 board features an Everest ES8388 codec to provide
analog stereo audio output, as well as analog audio input. The codec
hangs off the i2c2 bus and responds to address 0x10. It is connected to
the SAI1 audio controller of the RK3576, with one SDO (output) lane and
one SDI (input) lane.

The codec has two sets of outputs. One set, LOUT1/ROUT1, is connected
through a set of 22uF non-polarised coupling capacitors to a 3-position
connector that appears to be a clone of the JST BM03B-SURS-TF header,
and is capable of mating with a JST 03SUR-32S (or JST 03SUR-36L if you
prefer lemon-lime) or compatible clone connector. The right headphone
output is the one closest to the Type-C DC input connector, the left
headphone output is the one in the middle, and the third position, the
one closest to the USB3 Type-A host connector, is puzzingly labelled as
"HP_GND" in the schematic but is in fact connected to the codecs RIN1
input through a 1uF non-plarised coupling capacitor.

LOUT2 and ROUT2 are routed to 1mm test pads T36 and T37 respectively.
These are located on the bottom of the board, and do not go through any
coupling capacitor. For use as line out, the ES8388 datasheet recommends
adding 1uF coupling capacitor if one wishes to use it as a line-level
output.

There is also a pair of inputs for a stereo microphone, going from two
1mm testpads T34 and T35, which are decoupled with a 100pF capacitor and
pulled to 3.3v and ground respectively. These inputs then go through 1uF
capacitors each and end up in the LINPUT2 and RINPUT2 pins of the
ES8388 codec.

The codec's power inputs are routed to receive 3.3V for both its analog
and digital inputs, though from different supplies.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 570252c4c0bfe56a3c269e47d81fca7676e61787..2c991ad974a95fe1995a8d15eaba3e7b07d4dfb6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -56,6 +56,34 @@ red_led: red-led {
 		};
 	};
 
+	es8388_sound: es8388-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "On-board Analog ES8388";
+		simple-audio-card,widgets = "Microphone", "Headphone Mic",
+					    "Microphone", "Mic Pads",
+					    "Headphone", "Headphone",
+					    "Line Out", "Line Out";
+		simple-audio-card,routing = "Headphone", "LOUT1",
+					    "Headphone", "ROUT1",
+					    "Line Out", "LOUT2",
+					    "Line Out", "ROUT2",
+					    "RINPUT1", "Headphone Mic",
+					    "LINPUT2", "Mic Pads",
+					    "RINPUT2", "Mic Pads";
+		simple-audio-card,pin-switches = "Headphone", "Line Out";
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
 	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_12v0_dcin";
@@ -624,6 +652,25 @@ hym8563: rtc@51 {
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
 	rgmii_phy0: phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -680,6 +727,15 @@ pcie_reset: pcie-reset {
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
 &sdhci {
 	bus-width = <8>;
 	full-pwr-cycle-in-suspend;

-- 
2.49.0


