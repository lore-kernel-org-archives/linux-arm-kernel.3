Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DD9C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQEawgMl5+WZow30MP6fn81i9eavUfCQMsxMAUPIACM=; b=PMgR+U4C//AJDfVQS2uchUFPIK
	dkbNiohMcj5yiiIc6E+W6TnKD0NLohasLTb093mZNbKUfGOIpOxYJY9jRRDI4/IFiT6Nht/ePA1+G
	Quxu3nn9sCoUTgLSMnb1Mgi+E+96KppqiKtxG2Q+h/Jc48cEDzPPRw/8Gh3E69oulVoXkKROnF3FW
	QILgKg+l+EYjqyrYgTIB5a6giy3GpQafkOVrzGPM1aJdgE9bGSKT7Gv2yk7uLbSANtDnH8JCvXhxW
	stw7RDbwbljmCmYNwIiCamiG5RhJW3kLLpsXweMbyQ4CQfaL4y7M56CxDo3GAaawH+vXsCT3e0j8y
	4V13oCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YOd-00000006n3q-1nNi;
	Mon, 07 Sep 2026 12:24:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3YOb-00000006n2y-2mhz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 12:24:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jQEawgMl5+WZow30MP6fn81i9eavUfCQMsxMAUPIACM=; b=hvnVxU9HBCwGnSDPQ5sZrzS41N
	51mrlRkHD+wellVViOGr1McgJ/DPy0qypuIfmt627vj/nZ4xkrBnVNeueqKIGJOtbQPZFABIdpyqM
	5oS6t8bSiNopPUsMfoHSu7+DRMWERIlixcZIxsGZku15HHpxikVMUM42vBzA11WgZITGn9HN8mE4j
	LpAo95d/nMPgV6I42LXA4gjbURw2BgttcN1ZfTj2wjbuYFVUwa4wjxUo0sK0fsMMGh+TZxcOq3tf8
	3IUqhChjuiE9LeEvrLOuHZ05F+9+ep9o1i4c72YvVLyqXuX/P7nrrhS/S8m9dPmnd+BGNi/WsfDzh
	oNbuyozQ==;
Received: from out-215.mta1.migadu.com ([2001:41d0:203:375::d7] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3YOX-0000000GD9u-0sTO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 12:24:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SF/BkZtpH0zsCxHBAMSG1N4uiarb4RpMqqndpLESzpM=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788783853; v=1; x=1789388653;
 b=FRYZQmoecxHbJ5NnFqczQslCfYBKKNccGYKs4/YKldQ7GMd7/Gy2VpeF5yWEbB2geI9V1WLr
 oagbSGaJXhVXKI37RrdqbTHGjG2FAbXCwAaQUTTEhyWV/+3tq1HcNxjZLM4sQPPlSC6d7s27+Bv
 2U27SicqEujYgtNdFDVERBMGludnpOJm1XI3aasEBsiSqaaE4BCm/t/Aq2X8Lp84PeQuWqW5gHa
 ODbxg9DKNCTey2alyI4z3ieV8JVIDWdz3ifT2BHlx382TMdr8zSXWF63R3fs+po/UI5QTtBUdcL
 5Fsh9pv7KJnE3BmbZBUxCkLzcDkH7ZGlAyoak1b0rhPaQ==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b80fe7de94c76630;
	Mon, 07 Sep 2026 12:24:12 +0000
X-Mizu-Trace-ID: b80fe7de94c76630
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Joachim Eastwood <joachim.eastwood@gmail.com>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 2/3] arm64: dts: rockchip: Move sound cards to board files for NanoPC-T6
Date: Mon,  7 Sep 2026 14:22:44 +0200
Message-ID: <20260907122406.1862398-3-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907122406.1862398-1-diederik@cknow-tech.com>
References: <20260907122406.1862398-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132418_199718_F040B0DA 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

The NanoPC-T6 and the NanoPC-T6-LTS both have a Realtek ALC5616 audio codec.
But the NanoPC-T6 Plus has an Everest ES8389 audio codec. So move the audio
definition which is not shared among all boards to the individual board files.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 .../dts/rockchip/rk3588-nanopc-t6-lts.dts     | 39 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dts    | 39 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 36 +----------------
 3 files changed, 79 insertions(+), 35 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
index 0ee67ee24f3c..32f9b313b5d6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
@@ -30,6 +30,45 @@ vcc5v0_usb20_host: regulator-vcc5v0-usb20-host {
 	};
 };
 
+&analog_sound {
+	compatible = "simple-audio-card";
+	label = "Onboard Analog Realtek ALC5616";
+
+	simple-audio-card,format = "i2s";
+	simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+	simple-audio-card,mclk-fs = <256>;
+	simple-audio-card,name = "realtek,rt5616-codec";
+
+	simple-audio-card,widgets =
+		"Headphone", "Headphones",
+		"Microphone", "Microphone Jack";
+	simple-audio-card,routing =
+		"Headphones", "HPOL",
+		"Headphones", "HPOR",
+		"MIC1", "Microphone Jack",
+		"Microphone Jack", "micbias1";
+
+	simple-audio-card,cpu {
+		sound-dai = <&i2s0_8ch>;
+	};
+
+	simple-audio-card,codec {
+		sound-dai = <&rt5616>;
+	};
+};
+
+&i2c7 {
+	rt5616: codec@1b {
+		compatible = "realtek,rt5616";
+		reg = <0x1b>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pinctrl {
 	usb {
 		usb20_host_pwren: usb20-host-pwren {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts
index 40290a81bb9d..40ea1079a928 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts
@@ -27,6 +27,45 @@ vdd_4g_3v3: regulator-vdd-4g-3v3 {
 	};
 };
 
+&analog_sound {
+	compatible = "simple-audio-card";
+	label = "Onboard Analog Realtek ALC5616";
+
+	simple-audio-card,format = "i2s";
+	simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
+	simple-audio-card,mclk-fs = <256>;
+	simple-audio-card,name = "realtek,rt5616-codec";
+
+	simple-audio-card,widgets =
+		"Headphone", "Headphones",
+		"Microphone", "Microphone Jack";
+	simple-audio-card,routing =
+		"Headphones", "HPOL",
+		"Headphones", "HPOR",
+		"MIC1", "Microphone Jack",
+		"Microphone Jack", "micbias1";
+
+	simple-audio-card,cpu {
+		sound-dai = <&i2s0_8ch>;
+	};
+
+	simple-audio-card,codec {
+		sound-dai = <&rt5616>;
+	};
+};
+
+&i2c7 {
+	rt5616: codec@1b {
+		compatible = "realtek,rt5616";
+		reg = <0x1b>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+	};
+};
+
 &pinctrl {
 	usb {
 		pin_4g_lte_pwren: 4g-lte-pwren {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index eb0eb124c4cd..4d97afbc33bf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -98,33 +98,9 @@ fan: pwm-fan {
 		#cooling-cells = <2>;
 	};
 
-	sound {
-		compatible = "simple-audio-card";
-		label = "Onboard Analog Realtek ALC5616";
+	analog_sound: sound {
 		pinctrl-0 = <&hp_det>;
 		pinctrl-names = "default";
-
-		simple-audio-card,format = "i2s";
-		simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
-		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,name = "realtek,rt5616-codec";
-
-		simple-audio-card,widgets =
-			"Headphone", "Headphones",
-			"Microphone", "Microphone Jack";
-		simple-audio-card,routing =
-			"Headphones", "HPOL",
-			"Headphones", "HPOR",
-			"MIC1", "Microphone Jack",
-			"Microphone Jack", "micbias1";
-
-		simple-audio-card,cpu {
-			sound-dai = <&i2s0_8ch>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&rt5616>;
-		};
 	};
 
 	vcc12v_dcin: regulator-vcc12v-dcin {
@@ -549,16 +525,6 @@ &i2c7 {
 	clock-frequency = <200000>;
 	status = "okay";
 
-	rt5616: codec@1b {
-		compatible = "realtek,rt5616";
-		reg = <0x1b>;
-		assigned-clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
-		assigned-clock-rates = <12288000>;
-		clocks = <&cru I2S0_8CH_MCLKOUT_TO_IO>;
-		clock-names = "mclk";
-		#sound-dai-cells = <0>;
-	};
-
 	/* connected with MIPI-CSI1 */
 };
 
-- 
2.55.0


