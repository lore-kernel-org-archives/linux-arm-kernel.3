Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF051CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1AdBqTLN1NoLcfkeqL2tMz91d07+kTAZBqSBvoPLus=; b=ZDy8GieXmsAmOfn02gqoSPhpMg
	0q940IrBCWmybtvbHcOBh5NHrpj/HO/BtXuqsBewZ/V0GYOBBB9OUlJ22H6xOGOU3Bf96RUbmM+Xx
	Dkyg1lWSfAKIQYoG/zLsh6tjNGJse+4ESlrfsNsr1ES5gu6XY2vf0XeVNHPlkwsolnAsOjW34q045
	ntDpUisWf1A7QmpMfYjfFvuG0i/3s7RppaSPScVlkQk7sAM/pTbAgHGpOH/4HA1fiKlchZgz3Ez29
	K6CK3FreYAm0b3nupB78/gtdFbuN/UcrqmeEvpfEMV0T905BXNu6QJzwq0g1zL1iKEvlbZPlQEKIe
	xsOhP8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3X-0000000Ac3v-3XFA;
	Fri, 02 Oct 2026 04:39:35 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3T-0000000Ac1r-3Udy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 04:39:32 +0000
Received: by mail-pj2-x0e.google.com with SMTP id d9443c01a7336-2df4aa80a73so48102235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 21:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915971; x=1791520771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1AdBqTLN1NoLcfkeqL2tMz91d07+kTAZBqSBvoPLus=;
        b=OLgH/XYuo1eEaCZsxUXkHPwt1mKOGkhDVIojbXvAlTGihXeJel+oNe5d0Gs2YAx537
         p7Idit2shwSPvy+OIg54kj5bXQi6lGg2tKqNueseLbEtYh/5RE4q/47XMIFWGmSDEkAs
         wAhrAAjzHooThs2bV2C828cSKfd/kgAliUTe0CqMCeil09qnDwZcLPn6PxOSPuvxxtaD
         5KHAZnDVN9cpNH32K2PPFvxp98Geb7z4gLxFKRV6c5RmL4qUPPeI0+HGVuOb55HOGVXq
         iG8tJNJqoq5YBtvuwDrNvAr5kzQmmTMAlIi+SGh70ehrbU8idA/SdOpJBHTcoV0ckQOU
         ABwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915971; x=1791520771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1AdBqTLN1NoLcfkeqL2tMz91d07+kTAZBqSBvoPLus=;
        b=NKDciY7l9n5imENNyZwQLz7M6z5v+icoB40TocC4jLDq3Si5Lz3yNCBhPXPkRjEZPc
         cIbWwN08AcNeRSVUGfRvqJpEUHWA2MK/E4e9zdr/+ZUEEc8Pcoe8AitT4OJ7T0T9n9tZ
         fL8+1MuUDrjOmstzmK8/DgAznb/EEObfpaxVNC3AgupWtAA1ovlSE28nrdYo9LYzIFns
         4eo+8xbCfFmZZUtIugqZJmoJqgXaY4JCoCHrIY3w0sKFj9h4Wd6aJTUA2nTDg+vX2rvZ
         PrOOuOAKn96NDag4RqmEw9SmwmhbEpjn2LCFcyd/bqQ72sk36/TkiHKAQbvtkiPoXf61
         Wx5w==
X-Forwarded-Encrypted: i=1; AKwUvBz0T+YmTD4GG3/lcNV4fG45C7h8JWio6xdIP6wjElimbTudrdNyvFehloMKsCrFDpwM/nEpGTOZtfO25Fb2ykJv@lists.infradead.org
X-Gm-Message-State: AFq9FYIGM1jzfjnb9Kdz7M/BWenjCiO8/ynQSAKxh7zWKmgwsuAAUpmv
	zx3CJefsa8Q3YFf49KU8pTyoPcqYvvwZRscj8WNe4iNgrjEJ4X80N7qo
X-Gm-Gg: AYBFou15TUjz0lBnYA6R9M1p8Ppv7rpoxPcrLXzapqxAx9cvFBhASVfH60SE9aK+rss
	bz/7IlZTZFcaEs5In6xIqVd5uRC0fO6Ob1xI9QtAZgD3VDZzPFWvGfmMPa82HlsqqJtyv5FnDpU
	nPzlp1hVR7T1I3MDVT6IMsUxVeIu1c/gpwJEVGoNPKCwe9W2uSul2v2ZlBaWwzMQOvA1I/Nc7dM
	qxSmqZ5/V4KoWxA/27L6bs5W2n2HG7kvAttrQpMGv/d7Sl1ogq17D5PR2/RLrpIBsZc6SoJpknO
	aAEC4uL7iOM+j3gn8Z9PJEa+ZlA7UM8hCHs8oy2Mgfzt/X4RKsscssxDlnqBzo5ZolDY4dWl4eG
	lUKGpxkx6xbNsqPJlclEJqRc8xva9yvv3oQfczDT9muK2NqJlPuWl4fK/fuOCUo70/ZP5TvQCPk
	s+XqrwTD5e7jKAeNGXPKkSxucp2+q/Val5T4x+yX4iEYXXb2tIxlQT9Ay38z194NpMqQTw7eU/S
	1VmJ8+bpQT+Kyq1oGvqI6WQyPx4lWVkeIPQJzPiAtLB5rDBRFuwsh2Q8SvLGr+osuEy90HvWJTS
	cz9VuyKJtDaJzg==
X-Received: by 2002:a17:902:e5c2:b0:2e3:d33:b27c with SMTP id d9443c01a7336-2e49b6198ebmr13023775ad.38.1790915970609;
        Thu, 01 Oct 2026 21:39:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: atmel-i2s: use optional API for muxclk
Date: Fri,  2 Oct 2026 11:38:53 +0700
Message-ID: <20261002043856.97295-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002043856.97295-1-phucduc.bui@gmail.com>
References: <20261002043856.97295-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_213931_876538_691B6B01 
X-CRM114-Status: GOOD (  15.98  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The muxclk is an optional clock according to the device tree
binding.

Use devm_clk_get_optional() to handle the optional muxclk instead of
handling the missing clock explicitly.

When muxclk is not available, devm_clk_get_optional() returns NULL.
clk_set_parent() returns 0 when passed NULL, preserving the existing
behavior.

Unlike the existing code, errors other than -EPROBE_DEFER are now
returned instead of being silently ignored.

Fixes: b543e467d1a9 ("ASoC: atmel-i2s: add driver for the new Atmel I2S controller")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index f28808d980ce..c52d048449f8 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -589,21 +589,15 @@ static int atmel_i2s_sama5d2_mck_init(struct atmel_i2s_dev *dev,
 				      struct device_node *np)
 {
 	struct clk *muxclk;
-	int err;
 
 	if (!dev->gclk)
 		return 0;
 
-	/* muxclk is optional, so we return error for probe defer only */
-	muxclk = devm_clk_get(dev->dev, "muxclk");
-	if (IS_ERR(muxclk)) {
-		err = PTR_ERR(muxclk);
-		if (err == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		dev_dbg(dev->dev,
-			"failed to get the I2S clock control: %d\n", err);
-		return 0;
-	}
+	/* muxclk is optional */
+	muxclk = devm_clk_get_optional(dev->dev, "muxclk");
+	if (IS_ERR(muxclk))
+		return dev_err_probe(dev->dev, PTR_ERR(muxclk),
+				     "failed to get the I2S clock control\n");
 
 	return clk_set_parent(muxclk, dev->gclk);
 }
-- 
2.43.0


