Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615ABC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzkwdUu5IxbjyIkUJ7r1XGcuucPGN3hdyJMixCjr1T4=; b=FY38uniLoeOds4B0oAveI/VE2b
	sHprPc1WO20+FYQWq7H5XBWqwql95+ODGMI06WWvw/dFrYVckxSuNOC6KhaQWTMhKS1lP5TQCy/A8
	2LDnWKNKbsPlIdzVSVU0ciOjiSGQTClU+lOs0YKK5tQjRZqQd5Pp/eEkfwaBZYdSFoBRzQWBOrYHG
	C8aVVK3i4h2PoMhWPdnXjgJ//h0Hji9moTPXPsuuhMex5Ot4c9tKKSrtHasWh09ZFB0RdhOzEg8iy
	X2VEZKt6/6PwxOzBHjS1qt140V5sUUl9/SH/PXl4NBElzmC6dlp+Nptdfa0p4aBg5n5C801KT4JeS
	2roP11XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89dn-0000000GuV0-3O7v;
	Sun, 20 Sep 2026 04:59:03 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89di-0000000GuRG-42xs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:59:02 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fdc579daso22636975ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880338; x=1790485138; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzkwdUu5IxbjyIkUJ7r1XGcuucPGN3hdyJMixCjr1T4=;
        b=EUPlJv9LJWp+vag8qbK/jDYcn9p7RU7hvfK3KezBMqOmYvONBJSbTAlUJXZ440s3f3
         aPNFrtjpCyLwqfh4oSxlzaZj2XtEKij2ddhm0TaGkDCJIZeuxWUBsMKMDknYGXBREOAJ
         Q2P9vcYkqMQsUIdksd7FdLhjRXdunz2nVF9aCZMk1AFOcfpjJ7Z1cryntP1besG4QfOJ
         1G1Gzrk33X/3TQvfm348kG3wJmtYnENhx/8FbgFhmmLQfJUzqggZeqv/y5n5em8YZQK5
         Uh9T3ylH3LF7soKcOQhdWxqxqv8RqWTbp4Kz5/dgLTvSNhZAd+Duh7yEkDsLY8+iCROZ
         cgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880338; x=1790485138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzkwdUu5IxbjyIkUJ7r1XGcuucPGN3hdyJMixCjr1T4=;
        b=T6eIR9QKOLb+FHrGm/Dj4bffAd97F4wAls9qHQb9OwOva7ntv4zs0DfQxT79CHMeAa
         0ucXp2h92ynIrZ2kTlFcyRGSl1AFtAwunIysLwuoQToU82mENesmx+jYpwzdJC3KtCo5
         r78qbpiJLOynql3qTyM4MGqjQDSY72+mtbPxMKX1UjW4UXBcSfYb1CE49zo3ip6tn4nV
         hDGXd9u2ugQJh61Y9tWzvjtejm692dmxhfVueVDF+L5Be7QnHh8Zso4CwYvFQVbXeWgL
         ip+b0cxnFtlMo75RNPgw3WsQXMbMs1orvSKEcaEDn0FBI9avBfbLbkD8X0sqhx1yR2fb
         Zg5w==
X-Forwarded-Encrypted: i=1; AKwUvBzbLMffmkW+9WTWAUFAOb2Whx9jBRLN/7+HgIRaddJYJoSkTv5EntYahAUI5A3EZQqNutzENcHmpmzpBT8+WzsK@lists.infradead.org
X-Gm-Message-State: AFuF++ngH7zFwjFyVRQ0TYERbC3y476+wOZVM/0JEecjYL+DRj3EbY+r
	p+n9PQnOrJmm8eV09r+6O9xXgm2X/URDapv+i3fyWM3yjD62PTwVIYsx
X-Gm-Gg: AYBFou1XYsGxo0FQBZC5kek4bstdLMDeGTqYKnwA78DSmEgeRZ/GbdKAKHdQRXG/jw+
	O8kgi2rBRG2tBCRwO1N45w8dLwSnkvZZrA9C86fkYIS7ZJCShK9teLHEA9tWJRvo6ZzGlotZXE6
	hK8rqm0xFCnJSfA3/55iRRG2HMTNWsbQ/7AZocSnT4tYpmL7SfkqXXM15u86RY3FFYvdmqOxaN/
	whBCCvk95vr9uUjxMvLpZC19so+5yUKvVcXRF+lfoJas+Sr1531tJEDL3y4Wmwu/dfVulAgH7HZ
	XOvn+nZx1KkORTJ46ZKAcjF+M4OAFxGAsbpQTueE4Cry/GjQRWJZNcJiRlI1/MLj11UArKadQ/N
	1RWacRXSbLEdUgt6conCvSVQhGZB98Zb1nTwRapAIk46Ho2CB1wdmGNiZjPC3weLZ9SiMR9iP91
	VpUewY0fe2I+5Zs30PRB07UTsPhoAmK+1NJ5mdraIDKOlzCB52B5dfQZHBkVno+Oc5v7Rjnrmgt
	KQ0Fkz2W8F+OSLZu9qMRv3pHmM4nUWy0i5CySgqCICU1XUMtaz4ocqBJorEzrGH5Qt1UTT7hdyk
	hbE8ng2jnaBTYgQOUhLdeDA5VgZ9/tM6/wGTIr0G3MIjypdRHdllGzQBWJ4=
X-Received: by 2002:a17:903:2349:b0:2dd:c100:3136 with SMTP id d9443c01a7336-2ddc100317fmr55120815ad.50.1789880338289;
        Sat, 19 Sep 2026 21:58:58 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:57 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:04 +1000
Subject: [PATCH 25/28] arm64: dts: apple: t600x-j31x: Add speaker/headset
 jack nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-25-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6132;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5Lv7LzgxsLDDIrEyhpz1IqbTrdKtgpeQE+Q25XVomZU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05UedJzvjLnaydTZH/toSs9SlgNxTF8Oa15zWfRVS
 jzyAI9Qx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKoFaxn+e9gtnb2XpXqbovDFtn/1S67zcoXafjukxDLpcN6Kas3V3Ax/ZZ/N+PU
 mqGH74/nKOzVXZb9vnZ3b63P8x0v9DobOwnl9jAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215859_018390_D9503AC3 
X-CRM114-Status: GOOD (  12.73  )
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

The M1 Pro/Max MacBooks integrate Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../arm64/boot/dts/apple/t6000-j314s.dts |   5 +
 .../arm64/boot/dts/apple/t6000-j316s.dts |   5 +
 .../arm64/boot/dts/apple/t6001-j314c.dts |   5 +
 .../arm64/boot/dts/apple/t6001-j316c.dts |   5 +
 .../boot/dts/apple/t600x-j314-j316.dtsi  | 128 +++++++++++++++++++++++++
 5 files changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6000-j314s.dts b/arch/arm64/boot/dts/apple/t6000-j314s.dts
index 1430b91ff1b1..dab8e99fa324 100644
--- a/arch/arm64/boot/dts/apple/t6000-j314s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j314s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6000-j316s.dts b/arch/arm64/boot/dts/apple/t6000-j316s.dts
index da0cbe7d9673..2cdfac3c40c8 100644
--- a/arch/arm64/boot/dts/apple/t6000-j316s.dts
+++ b/arch/arm64/boot/dts/apple/t6000-j316s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio", "apple,macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j314c.dts b/arch/arm64/boot/dts/apple/t6001-j314c.dts
index c37097dcfdb3..7495698beb02 100644
--- a/arch/arm64/boot/dts/apple/t6001-j314c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j314c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,maldives";
 };
+
+&sound {
+	compatible = "apple,j314-macaudio", "apple,macaudio";
+	model = "MacBook Pro J314";
+};
diff --git a/arch/arm64/boot/dts/apple/t6001-j316c.dts b/arch/arm64/boot/dts/apple/t6001-j316c.dts
index 3bc6e0c3294c..6622b6e225a6 100644
--- a/arch/arm64/boot/dts/apple/t6001-j316c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j316c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,madagascar";
 };
+
+&sound {
+	compatible = "apple,j316-macaudio", "apple,macaudio";
+	model = "MacBook Pro J316";
+};
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index caded1636f3d..7afd385ce57d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -169,6 +169,94 @@ hpm5: usb-pd@3a {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_woof2: codec@39 {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+
+	speaker_left_tweet: codec@3a {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_woof2: codec@3c {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	speaker_right_tweet: codec@3d {
+		compatible = "ti,sn012776", "ti,tas2764";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+};
+
 &nco_clkref {
 	clock-frequency = <1068000000>;
 };
@@ -366,6 +454,46 @@ &atcphy3 {
 	status = "disabled";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
+
+		dai-link@0 {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mode-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mode-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "spi1-nvram.dtsi"
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan-dual.dtsi"

-- 
2.55.0


