Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF505C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 02:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JlV3zJ5RwhKne2jUh8CcjrZlF2RdUTEpohrGS1TCb5w=; b=CpWalhB7xET6z52Owfe1y2J6Jg
	werI1lUodognClcXBIq33YkahExzeV87nMQzgKLvRKsW3OQIPhlIXPBqlhI73OT5rHaeGwilPAROf
	vZuiKwrPUPfB4Bct4nf6+fKHCQPwqiYP8wQ7Wyl0KqkG275GHrf9KG3c/GH2J5aw5PpJ44XZOCWxz
	TQ5N+Dm0F6sKh5/n9qzKwcAlTP80H2Kg3YyKjSx3b/9JqkAWZMirjmNyEZ7WKGZBZlAzZR1CyHlqz
	eqtOaBDuKVYmOxK+jT2D4PDzzIH8xpk969mUBY0CIEU+sVKsp33n5VVhkEvjgzr82zQ6IlJWs714A
	YCgaX/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfU5T-00000005uWD-1BZx;
	Fri, 03 Jul 2026 02:57:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfU5Q-00000005uVQ-0wYM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 02:57:06 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso61212a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 19:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783047423; x=1783652223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JlV3zJ5RwhKne2jUh8CcjrZlF2RdUTEpohrGS1TCb5w=;
        b=EkH+AHiS+cU3QilD7Q3Fh+CO/3SDcvRSsdNGZIVOC8mWu4z8BPhcNPyqTjaxCdosWn
         ymXqtyAI9Cfm8UA6yWdmBXSwHG0ruLFBFB1crVTz6d5vdcTl+QGdCqpBKnM55rrpniRx
         FQujtO+FTvUZJyAdB0V0mtRtuLR644tOYxHs29qmdSt4jNTDEkpZNsoECqE0yD5BuLz0
         wJaRY4Y0qduMSmJZgrPIV5eMH2XWpcSOUQTK2o5wiQd0C/+71BOz/qESNb2095WCGxeS
         780fcM/eZkIaRtgCT0JUYGIf6bvMd+ruKoe1K8z774X0sgbbT6+uCznzD43XSU08zxNg
         kD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047423; x=1783652223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlV3zJ5RwhKne2jUh8CcjrZlF2RdUTEpohrGS1TCb5w=;
        b=NBF+n/jzCcXE9q/xe1UVnJ0mKCHPaboNsW4EHUbDAk1DxxkF+PAYMk56rcQG541A85
         HuY6iA9ATYPesSD+Eyi1ICYWAK+kiWpptjWmFcbLlcYRYZ5JWiP86kIwj18k2cUu+cWY
         YouO9WfPlD7KNLTRlE0uvFC8zZGYHB/FGV1dwYXuN7PT8Ux/ACi3Hhv/gERPbDjdQb4D
         P1N5buT8QQo7qnt3g5Ses6a2wLiHGqJhIH1b+zrppbx5mlF6nu9/a3vsZhptf4yRVgwk
         BCpfC4WbtDyEfOclzOmWq0ZnbEyZ8vPRyW9mN4K1L7+kAUQkUEB4j/g8yHKcUOhIkt+p
         I81Q==
X-Forwarded-Encrypted: i=1; AFNElJ/TdE7sIomNiluVXuDUB4+vcB7nh3FTWg6KIjge0NF/5I0b1So8qQ4y5L88z4GTj0c9hLIqIfN6cm8Me11DEc0a@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9f+7FOioy/PT/D7hSWeHlSXHZ2lKJj7jeQWCz345AhKNWEuv6
	SxRghcpZfVme4Bu9Mv1Zona4uSNTAay1DOunZ0RTEGNEOkGB9gzFVsbd9TlQDA==
X-Gm-Gg: AfdE7cnzbM7C2L6ma+8eoWzKZbc6eebtx/0S6/g4RmarLeIW5H29oQK7MARFLv9v5c8
	of7czafsxkDPvvpSTKCTOUXKSzkAf/YIk4O4RCx/DjwsHvAcPjqNzgC64UFvH9/m0e/t7Ey0yZs
	dLgcKSqp1j0XJnluRymRE7ig/2Oit5QsQ8C6UmxNpjgzzTxIUldAmUPrW2EMMQrYp246YZS2QK2
	men6llK0wrdcpLT5krpC3Zp1rVcuuYd0t2SxdK6gan9tMJ7UDzWYFlprQUpVmkOAgxRiO5NJMBQ
	8PBw85EKhO7t18YRxgagmnVT7uI3HXHV+2jgFzyxZfgj1esnHLNP0WjgeXBAJKnhQ0urKK6Fb53
	qLaT/al1BLbkb+1I+393ytbDXOfZZ1LubmPrUz1Pcvl3drW5cnDBhPD9ip8AWfUjLHFC8b20lAo
	yoicxDxr82hamTv7itvVdcJGEbK3vkLrcoODw7GWkXet/81lf/VJVE53tC+zE=
X-Received: by 2002:a05:6a21:4516:b0:398:9379:d04d with SMTP id adf61e73a8af0-3bfed22ecacmr9856159637.24.1783047422829;
        Thu, 02 Jul 2026 19:57:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a800:5116:5334:8739:4661:fde2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa65asm14645620c88.6.2026.07.02.19.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:57:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix rk3588s-roc-pc audio description
Date: Thu,  2 Jul 2026 23:56:48 -0300
Message-ID: <20260703025648.180135-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_195704_296865_26935C67 
X-CRM114-Status: GOOD (  13.02  )
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

From: Fabio Estevam <festevam@nabladev.com>

The rk3588s-roc-pc ES8388 codec is connected to the i2s0_8ch audio
interface.  Use the matching I2S0 MCLK output for the codec clock
instead of I2S1.

Using the I2S1 MCLK can leave the ALSA PCM running while the codec has
no usable master clock for the active audio path, resulting in silent
headphone output.

Also make the CPU DAI provide bitclock and frame clock.  This matches
the active Rockchip I2S controller side and avoids relying on the codec
to drive the bus clocks.

Route the headphone output to LOUT2 and ROUT2, matching the old 5.10
BSP device tree.  LOUT1 and ROUT1 are used for the speaker route there,
so using them for the headphone widget can leave the headphone jack
silent even while the ALSA path is active.

The old BSP also used hp-con-gpio on GPIO1_A4.  Model that GPIO as a
simple audio amplifier so DAPM enables the headphone connection when the
headphone path is active.

Cc: stable@vger.kernel.org
Fixes: 7f9509791507 ("arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index d534d662c40f..99853880aaac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -23,16 +23,19 @@ analog-sound {
 		compatible = "simple-audio-card";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,aux-devs = <&headphones_amp>;
 		simple-audio-card,name = "rockchip,es8388";
-		simple-audio-card,bitclock-master = <&masterdai>;
+		simple-audio-card,bitclock-master = <&cpudai>;
 		simple-audio-card,format = "i2s";
-		simple-audio-card,frame-master = <&masterdai>;
+		simple-audio-card,frame-master = <&cpudai>;
 		simple-audio-card,hp-det-gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_LOW>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,pin-switches = "Headphones";
 		simple-audio-card,routing =
-			"Headphones", "LOUT1",
-			"Headphones", "ROUT1",
+			"Headphones", "Headphone Amp OUTL",
+			"Headphones", "Headphone Amp OUTR",
+			"Headphone Amp INL", "LOUT2",
+			"Headphone Amp INR", "ROUT2",
 			"LINPUT1", "Microphone Jack",
 			"RINPUT1", "Microphone Jack",
 			"LINPUT2", "Onboard Microphone",
@@ -47,11 +50,17 @@ masterdai: simple-audio-card,codec {
 			system-clock-frequency = <12288000>;
 		};
 
-		simple-audio-card,cpu {
+		cpudai: simple-audio-card,cpu {
 			sound-dai = <&i2s0_8ch>;
 		};
 	};
 
+	headphones_amp: audio-amplifier-headphones {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "Headphone Amp";
+	};
+
 	chosen {
 		stdout-path = "serial2:1500000n8";
 	};
@@ -327,12 +336,12 @@ &i2c3 {
 	es8388: audio-codec@11 {
 		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x11>;
-		clocks = <&cru I2S1_8CH_MCLKOUT>;
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
 		AVDD-supply = <&vcc_3v3_s0>;
 		DVDD-supply = <&vcc_1v8_s0>;
 		HPVDD-supply = <&vcc_3v3_s0>;
 		PVDD-supply = <&vcc_3v3_s0>;
-		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
 	};
-- 
2.43.0


