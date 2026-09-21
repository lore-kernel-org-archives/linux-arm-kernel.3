Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33609C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ht+z0CqdLRuuaIXmyH+reVuxUkKXu+3RAyjhrVxahWw=; b=X6zboqnB5hKyYy0jfNwR4mWZsh
	3C9KvXggN3ajKhfAt8Ez0W0KH2EE51METxlyPqVSPgbJTKvGmPg6tPoHExnWZRKsF0HM44tt6Xxah
	KVRzJPSAeKVQKkK9roZMutuPGyZVfXg2ugYfkFdaDJ5hU8RAJp0AgVLrGbkGpCURDOa4NNXyQvCRb
	RfHfmBFud/Vjr5czmEnNLI+APTJX22sGioryhKg8a1X3abYTFclH99UezNea6BEiT6T0S1g9l6lkv
	a3iwf3YND3YTOD1P6mQ+v/sVI56+COBUmX9bzDSJeRkVzOEdS6tbTcZxOKThZlis5dVSEey6qOU8K
	EiGG6fzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xc1-000000011ri-2DEd;
	Mon, 21 Sep 2026 06:34:49 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Xbt-000000011mQ-30OP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:34:42 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d91ede8035so30963105ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789972481; x=1790577281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ht+z0CqdLRuuaIXmyH+reVuxUkKXu+3RAyjhrVxahWw=;
        b=G8R3revvVQ+ws7loJk4BSbjX4lYF5XJaPveluCzPmj+kzqYLa2+ry5O6ZNN4Mgw9de
         AqftNz14/uD/twGY1nZRQHEq9nlHSjm7tyJy4cS1Ea4qyXaBlfIaVihvg3qZ9NuZx2gM
         TMCnwu37P/YAiHxXbh0aw+lFIDY4UmeGt6TGggsHAR0XuvgwkjNHFq7liMT+tS9PeA+4
         yYaIMWMar5iLbg7B177tF/rsI61XNh65ouhSrR/u7ox4rtw4dqykoP7xd30Sru8jRfug
         HAvQklaTcDSmAJn7N0fOlG0ySDhn4gXn1pyZo3+HaXYIAQy/uG80FUtkridfOBRWxwGW
         hvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789972481; x=1790577281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ht+z0CqdLRuuaIXmyH+reVuxUkKXu+3RAyjhrVxahWw=;
        b=BwAYqZUhwD1jaYJ2Pr+gbuH4DvONsPODJrNOhBiTY33a0Ym8xgF2qrkllGNOATzBPX
         q8VkjQlIwWwYLsWm6pyvTCNMM5oAXzML9bxcPE/79vPo52CVoPf4LNCvksoRhKe66ikx
         MNbAV5pyhfJyAx8NJgLsI6Ped+30FBDdXg3l1GC7oDIXiRlyJAJLgf06uY6cUhdCWIZ1
         Bp5/b/ZVzM7LSzWAVX4dwV0b/UIzjU5lha30xKz+JymYpb5dFM1fBirDr6WoyF+zPvn+
         LDfa410YVtD1oB96RGoA2YY1ekHpaExu84+SM3oqoi9+Q2Ej06zkdzvoH4IUV3XXRUSE
         whCA==
X-Forwarded-Encrypted: i=1; AKwUvBwI4JbXbr3RUOz6Mj/Ld3G7J7bGp4QwToRsMxyyVuyHlO/2MioIpu3yg9evhO0Tvu1b7Bk9GIDVCvJQ9WIp+js+@lists.infradead.org
X-Gm-Message-State: AFuF++lwZGs6Vb2zTS3GbkuzoY3bWcUquZQvri81n+j/1HlJCFh+duJr
	Et7lBTaOYPcSE9z2DGkeCXaZmxDNcdI97/zVm5oHQYn4oiWrSwroZg2c
X-Gm-Gg: AYBFou3lj3Y2VdcOVO+ibUW/jtCY28CayfgWX1r/tN009Zkz5ryWV+UAGW0CHrPJEk0
	fEwL58gPJOJNo6Rg6Rrsw/3VksesTS67CRSG18mwUPfi0vPSCvvyDvacQ50Zs1ZLHR1i14HJOBW
	vCQaZkXQGcxe8Aa7lMRIQ5vwoaoK6uImVsAXf62yNXUrnxhsbtyErJJnDcHCZy1v4W0OW3xRlle
	GYveQmFR5F2glEkduGHifcA7Mah6ZFZAgbOCsRdGWkOfvvc2wTiyLgKOiKpgo8e2m4mHvOg1BuA
	lAlFBDq2z3AXlIogklXPfG06FZKrAj0vRtXcLGFKJsi28PrEH3QItLGVLQ61o9XhGW8UeEFLpa+
	Gnm1hJ/X0KC4XZAWws5f29HKVCf7vTxauXAkCb2Ovg1aUrkgB7eC6Ol84n46zEJ1bvfT3zpSxPZ
	+uzV1tGJ+EkWgXjulFU8p+Ql2fo7ZlKmhGNXulu4zFhoescT/n7mdnMN+SBIyTv5ceAsu+/BuIA
	aNaai4Qnow=
X-Received: by 2002:a17:903:2c0c:b0:2dd:b3e0:850 with SMTP id d9443c01a7336-2ddb3e008d2mr136442775ad.17.1789972481120;
        Sun, 20 Sep 2026 23:34:41 -0700 (PDT)
Received: from Aaron-M6 ([188.253.120.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dbd5sm28173565ad.39.2026.09.20.23.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:34:40 -0700 (PDT)
From: Yaozhong Li <yaozhonguwl@gmail.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] arm64: dts: rockchip: disable unused i2s0 on rk3399-firefly
Date: Mon, 21 Sep 2026 14:34:29 +0800
Message-ID: <20260921063431.103-3-yaozhonguwl@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260921063431.103-1-yaozhonguwl@gmail.com>
References: <20260921063431.103-1-yaozhonguwl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_233441_747456_F5C0CF92 
X-CRM114-Status: GOOD (  14.85  )
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

The board file enables i2s0, but no sound card references it: the
on-board RT5640 is wired to i2s1 and the S/PDIF transmitter has its own
controller. Keeping it enabled starves the other controllers.

The pl330 instance that serves the audio block has six channels:

  dma-pl330 ff6d0000.dma-controller: DBUFF-32x8bytes Num_Chans-6 \
    Num_Peri-12 Num_Events-12

snd_dmaengine_pcm_register() requests the channels named in "dmas" when
the controller probes and holds them until it goes away, so this is
decided per controller and not per card. The demand is i2s0 2 + i2s1 2
+ i2s2 2 + spdif 1 = 7, one controller always loses, and which one
depends on probe order:

  rockchip-spdif ff870000.spdif: Missing dma channel for stream: 0

i2s0 cannot simply be dropped, though. Its pin groups also list
GPIO4_A0, which carries SCLK_I2S_8CH_OUT, the MCLK the codec runs on,
rather than an i2s0 data, bit clock or frame clock signal:

  i2s0-8ch-bus           ... <4 RK_PA0 1 &pcfg_pull_none>
  i2s0-8ch-bus-bclk-off  ... <4 RK_PA0 1 &pcfg_pull_none>
  i2s1-2ch-bus           ... GPIO4_A3..A7 only

  rt5640: rt5640@1c {
          clocks = <&cru SCLK_I2S_8CH_OUT>;
          clock-names = "mclk";
  };

Removing the &i2s0 override on its own would therefore leave that pin
unmuxed and analog audio dead. Both changes are required in one step:
disabling i2s0 without splitting out the MCLK pin leaves GPIO4_A0
unmuxed, while giving the new group to i2s1 without disabling i2s0
makes the two controllers contend for the same pin.

rk3399-roc-pc-plus.dts already carries the same i2s_8ch_mclk_pin split.

Measured on a Firefly-RK3399. The pin moves to the controller that
actually drives the codec:

  pin 128 (gpio4-0): ff890000.i2s function i2s1 group i2s-8ch-mclk-pin

The RT5640 and S/PDIF cards then register with no DMA errors, and a
1 kHz tone measured through the codec's internal HPOL/HPOR loopback is
unchanged (L 2135 -> 2138, R 2202 -> 2203), confirming that MCLK still
reaches the codec.

Fixes: 171582e00db1 ("arm64: dts: rockchip: add support for firefly-rk3399 board")
Assisted-by: LLM
Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
index 2fdfdd3..dbc38dd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-firefly.dts
@@ -628,13 +628,9 @@ accelerometer@68 {
 	};
 };
 
-&i2s0 {
-	rockchip,playback-channels = <8>;
-	rockchip,capture-channels = <8>;
-	status = "okay";
-};
-
 &i2s1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s_8ch_mclk_pin>, <&i2s1_2ch_bus>;
 	rockchip,playback-channels = <2>;
 	rockchip,capture-channels = <2>;
 	status = "okay";
@@ -689,6 +685,12 @@ ir_int: ir-int {
 		};
 	};
 
+	i2s1 {
+		i2s_8ch_mclk_pin: i2s-8ch-mclk-pin {
+			rockchip,pins = <4 RK_PA0 1 &pcfg_pull_none>;
+		};
+	};
+
 	lcd-panel {
 		lcd_panel_reset: lcd-panel-reset {
 			rockchip,pins = <4 RK_PD6 RK_FUNC_GPIO &pcfg_pull_up>;
-- 
2.55.0.windows.3


