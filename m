Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0CCC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA0mD8O/O9CZCZ5PXDRC9+J532+fBSjDskdhk9fr/Ec=; b=AFyokRAXjdTYyG4QeQ6ix+raSu
	Rd8Z9ZQ6HFUiQgfXHPOZAgJCYeUUQsYwLOhguDzvPSLJTTmTJ7v8g21FHNKfqbsQTnPE94SfPwdY3
	swfcrfrTmIdadDWR0YXuMfQMgQJTttBkU5cehEaZTPFNRDfB+y3azTJ3UCI4uYJDskOwBBb8YyuNZ
	FfrVkCFwq/pn7hMNMNj2UwsjwyRUmQXjVNdJzGU6tvWfJIUa5lL9ZKDeTxZgzHw/02SW+SeejXdvM
	tve73ed/zAlVNg1jm0Zs9ejXc3fNaedr46NmhUPfjbKOKTxFWXzuy8y14kQvxZMVOIJAMrMU8A8sg
	xLqiXI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xc1-000000011rL-1nHn;
	Mon, 21 Sep 2026 06:34:49 +0000
Received: from mail-pj2-x17.google.com ([2607:f8b0:4864:39::17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xbr-000000011lY-3RcF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:34:42 +0000
Received: by mail-pj2-x17.google.com with SMTP id d9443c01a7336-2db18fe433fso22612915ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789972479; x=1790577279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hA0mD8O/O9CZCZ5PXDRC9+J532+fBSjDskdhk9fr/Ec=;
        b=kCRId2dGKWP73jSgJMh0jvJlDLH41khwQ1mXz2De4y/TRa6pilHSTiWap5/JS2Q8XL
         k1Z2xmjM9HJmHtlm345GiFHwNcuZZAkzomFAgejq4ngBoRYJVU+6mNrtSxBpHWIdd95F
         3Vtj7kmyriC/Nnb0B8jtblVzjRkuxTtxMmGItKi/Ph9/0wNFj5so78f2Whb+YejY9tYt
         gHX0u5JHfT5mbUD1bIxudxlI7Z7adcU53e1J8OqxFpGk/aXyHiYDbiG/2i9JXta3Ha5Y
         DZZl5mPOkcLHb5qjs0A9NF2jOtpA1InEIAWMDasEUEeRyikpu6ePo2yxXKVBIdOGGt9E
         KC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972479; x=1790577279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hA0mD8O/O9CZCZ5PXDRC9+J532+fBSjDskdhk9fr/Ec=;
        b=ZGrPb8/isN3P5E4NLDdV7CcLxeEHraGG+zMZlbfmn1f2qjDuHT7wXFak91+mI3FJ3S
         v3vqMyH5ri+cys8EQUEDPR7fAjiCpY46VHCPmZiHYbSoPrJ528BMo5/aTvO7eX10J5eG
         nktn6liLSrJzR9r0U87K23Wc3K7XbfcWKuMP/YxF/iDukReCiQ6mnaNtcuQRMGjADg1h
         syQBddSlQQq6M0p9kiYHTUGRvza18bUGqbB9pyXM8veuYeksWMo3wKYEjLXDvIIIwU6+
         MqrJ2dfGXwv405gBBMU+IKiLLaZ6QY4wLq5BpC5LIQ2jnUaXXPZ0wwfmAE5OcTcEY91Q
         4rHw==
X-Forwarded-Encrypted: i=1; AKwUvBxAeUFfdeoyHbGLl10Q3ICHrTMXCHt5SMLRw9cTWCncQXZqeL59B/GEYHTZy+m8qTYrqxv+2sIAr9KJSujpEbDy@lists.infradead.org
X-Gm-Message-State: AFuF++nOYBhYje3FqqKbVOtOESQ0xw9t4oBrvZgPGALakMBnuXFzlbyR
	XYa2DXF7K15ODUYFL6B0trtz5bk7Od48t1bganDzzVTh4fQk70Sx2sZEBt/QyVE8MUA=
X-Gm-Gg: AYBFou3ZaoEL3/y5ulzmieRqGIs7yUuyC9swC9YDWcRB4l5pI8JYX1SCOBIfEjDRF9v
	QZG+jCwfcqPIOGDuXjj1znX56mKb/6mdG6uxxUtu8pXhiu0K3VTlVnd3qk6s5z0oA+zSxTYFQpG
	7dMSE9CIOL2VrJsnBN3CB2vjtLxii/xWULAqVnQIIBhCP7bWNXm+Wdo8I3gIsRN/CuCRoJWAkuo
	S5MZXwcY+SDtf1P8KnE75KhvoaVHlJk0mqUNk+Tw4MnSUSK2ca1OrCDAQ/bmcNHcc/PtoEYY2m0
	yErW4BYh0U8OWigNiFnFJNJXLfwmvR+D3SfL1Dbm0e/2BaeO9mgJCnbaCoMdB77nlr+UY2lFJZX
	gStEMM+6EoyU5ReyO4B+prU2CreqdLJ7ghhrv1PIolX8BEFlvnMYBhzwGog1WCSV9ySRyVixbpK
	+nXdrEltNH+EkGLurhaSxPx3yUbdi2RTtzhAmvrNYDouaYFRoaUtiJ9zXCDZAvn/ahQ8wE73F99
	cxsACX/+h8=
X-Received: by 2002:a17:902:c944:b0:2db:39dc:48af with SMTP id d9443c01a7336-2ddb1b7a12fmr143529905ad.17.1789972478709;
        Sun, 20 Sep 2026 23:34:38 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dbd5sm28173565ad.39.2026.09.20.23.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:34:38 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] arm64: dts: rockchip: fix analog headphone output on rk3399-firefly
Date: Mon, 21 Sep 2026 14:34:28 +0800
Message-ID: <20260921063431.103-2-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260921063431.103-1-yaozhonguwl@gmail.com>
References: <20260921063431.103-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_233440_800131_6F339874 
X-CRM114-Status: GOOD (  17.65  )
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

The analog headphone jack on this board has never produced any sound
with a mainline kernel.

GPIO4_C5 has to be high for audio to reach the jack. The board file
muxes the pin to GPIO through the rt5640_hpcon pinctrl group and
references that group from the codec node, but nothing ever requests or
drives the line:

  pin 149 (gpio4-21): 1-001c (GPIO UNCLAIMED) function rt5640 \
    group rt5640-hpcon

It therefore stays an input and reads low. The vendor tree drives it
from a hp-con-gpio property that was dropped during review of the
original board submission because it is not part of the RT5640 binding,
but the pinmux half was kept, leaving the description incomplete.

Describe it the way rk3399-roc-pc-plus.dts already describes the
equivalent signal, as a simple-audio-amplifier auxiliary component, so
that DAPM asserts the GPIO while the headphone path is active. That
board's DTS carries the same caveat in a comment: the binding is used
because it expresses a DAPM-controlled output enable, not because the
hardware is necessarily an amplifier.

Measured on a Firefly-RK3399 by toggling only this line while a 1 kHz
tone kept playing, with the playback PCM in state: RUNNING throughout:

  high -> audible, low -> silent, high -> audible

With this change the line is claimed and follows the audio path:

  pin 149 (gpio4-21): headphones-amp gpio4:149
  idle:    gpio-21 (|enable) out lo
  playing: gpio-21 (|enable) out hi

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3399-firefly.dts | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 0568dfa..2fdfdd3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -96,6 +96,15 @@ key-power {
 		};
 	};
 
+	/* GPIO that enables the headphone output path */
+	headphones_amp: headphones-amp {
+		compatible = "simple-audio-amplifier";
+		pinctrl-names = "default";
+		pinctrl-0 = <&rt5640_hpcon>;
+		enable-gpios = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "Headphone Amp";
+	};
+
 	ir-receiver {
 		compatible = "gpio-ir-receiver";
 		gpios = <&gpio0 RK_PA6 GPIO_ACTIVE_LOW>;
@@ -132,8 +141,11 @@ rt5640-sound {
 		simple-audio-card,routing =
 			"Mic Jack", "MICBIAS1",
 			"IN1P", "Mic Jack",
-			"Headphone Jack", "HPOL",
-			"Headphone Jack", "HPOR";
+			"Headphone Amp INL", "HPOL",
+			"Headphone Amp INR", "HPOR",
+			"Headphone Jack", "Headphone Amp OUTL",
+			"Headphone Jack", "Headphone Amp OUTR";
+		simple-audio-card,aux-devs = <&headphones_amp>;
 
 		simple-audio-card,cpu {
 			sound-dai = <&i2s1>;
@@ -547,8 +559,6 @@ rt5640: rt5640@1c {
 		clock-names = "mclk";
 		realtek,in1-differential;
 		#sound-dai-cells = <0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&rt5640_hpcon>;
 	};
 };
 
-- 
2.55.0.windows.3


