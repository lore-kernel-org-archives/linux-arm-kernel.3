Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F8A606D811
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yZvlciFZ;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=Usi61I2E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=e4CIuy+PkiT+UL1hCEuwA9BVJ0GmEQ2NY52OWjxnzAo=; b=yZvlciFZhuH7it
	B2WIYEnGshriCP1YoWHp79kdF9ybpji+GoN4VNo1s/0VOYRMQhC+m3GxT1/bm2+KdWo8UpvL1rTPH
	pyutPvvHEJW97vlMWOKJfq4k/hVUGrbRENVMGFndhb5g+irQvo+wD9lYnDytGx+qaJxk7hL4flqvu
	LMBnzFV5TM72drj3zfDmd8crN8/xgKU8y6BIZqE87O9BoyEUhsoh/RHq4Sh43OOvNZYi9iEEsfkMY
	p6dUvySQ9N5U4CWxRjW1e/3YdUeTq+Go/wfKOYORMq8VKqOGmIqYdt99h333tI9JqmUgOZYx8cDsN
	C5egOBthMiyXD45OFeog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYpX-00000005656-35nR;
	Wed, 04 Nov 2026 11:06:59 +0000
Received: from out-15.mta0.migadu.com ([2001:41d0:1004:224b::f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYpU-0000000560g-1u0B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:06:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rnqNfzNHS33ke4zcO6y3Oh6VMVuv1mlxjr1t5iFKKLk=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793790414; v=1; x=1794395214;
 b=Usi61I2EKaXcye57J7LC8+XF/ZLPorol8lgrKj5cx8R4WOThTd1paLWgEE1sVlhlU6FW6YL5
 pY2+J+ZMTsBqUrdLu+XqaJdAa6b7q4RGNFVy2GMOKxP6U/ehVAwCvywJx4TOKIlrEz/+6z8pvnw
 hxq4K5wiAjmqeHys4MJ9XKbDILPUcwj7FBX0xXas1l83Eg24i434V+JjH4uW7EfiCH+QC/GgT0I
 gbxByvt3BdIwZaWDqhaYIzRNndzCge4s61MjglxZb6hCZyeTxnjDd3Y6P7ay3xk/z7Oe4feQagx
 f1VPL5lkK4eGyQgHi2aELq9u3MctcOQiLBoWMA/b1ofGw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id eeae194fa72656f1;
	Wed, 04 Nov 2026 11:06:54 +0000
X-Mizu-Trace-ID: eeae194fa72656f1
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH RESEND 2/3] arm64: dts: rockchip: Move sound cards to board files for NanoPC-T6
Date: Wed,  4 Nov 2026 12:05:05 +0100
Message-ID: <20261104110640.1132917-3-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261104110640.1132917-1-diederik@cknow-tech.com>
References: <20261104110640.1132917-1-diederik@cknow-tech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_030656_633741_C85F99EB 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 13be56af095b..121ab2c467bf 100644
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


