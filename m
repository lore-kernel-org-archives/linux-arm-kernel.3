Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECC6C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 04:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=; b=U4NHLkLNOvd2Q38SpQYcXB/0iJ
	GfSi7jYL9ZOSjSjf5HmMysgl/S+BXg0Gn6LdVq/x8G0DBeEAuLwlwHDwEK/3RAqdhyBW46j1e6kYN
	YftnjoMC+IOaE0q7dESzzUNQU8PTlu05JHC1oGzvW6i8Gx/zVwGcXd4JIr+p9me718iDjgQTRpDKS
	Gh1tmwGbKoKfT3DuyqQPVOzbLybCBZaCdEEX5HJsFeboDqTmuVaoUE28S5x9jIcjmUiJ6l1UdK7yi
	zHbio6bh+hdWi+BT5tLZ50luTj6yRD0XUx5CLCt265TYjn35/qw75dRfeOYya67FCNE2ZY/vmdTvJ
	kkys6mag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89ay-0000000GsMG-1bGv;
	Sun, 20 Sep 2026 04:56:08 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89av-0000000GsKP-2cCI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 04:56:07 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747eb79f7so13408625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 21:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880165; x=1790484965; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=J6bQlMsLvWXktxpMFH2ya5BLZJDIVPgQaz9vJYoNKi1zZb00E4i8DxM0dOFEUSAlck
         T5plEsJdTjL1ue36soKfJsKRBbKrpwVwwVsOsa5hLv1+zT0IZqa486RKIdgWhy+t0x/6
         87UM7nHCVXSoL57sF0TpMzj8HJC/SCY8gOKiqr5QVDQg5fLbiraFQerR0al/S7qctAed
         LFD6YrG4hRz0D2nfrrL4DEpkoo2zwJJpotRwQKvUAe/jZA1i2P/EIKeKSTvpJ/LuytdW
         cudpAZmZbgnjV6JVfMlcBosfKvwaS49X82IScOqY2RCks0p25PChU7oOrGzSFCvoW1z/
         8agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880165; x=1790484965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=yvumEHlGYJjOE2A0CkGi+9FaNurMWWQuIp+vPBLYZ5AleLB9UBrvRqQS85+pb2LOCx
         bg0Dc2tneaLw6E7ouhwsdL6rufey3c7CKQ1CVmQ5N/MKVDvPKLjHJECG/waWXhhZuEui
         b7ZG1a3KM1DhyRDAiycEBWtywL5d2YlI0eshYxCO1m5RdEGfT0Jp4pIJeixtrnuHP6eJ
         fIvdp9uq+12xNPfREImEO9rNy0u+ck9N/kwdohvp7/67aHuqsgasoxSV18QCaFn9M2Uj
         f3AW+gBVAMGwIUSMTOLv51v05lPArgg3xWFLewBu+85epb08Au+C0a5vpiLbYpPv88LN
         idcw==
X-Forwarded-Encrypted: i=1; AKwUvByJbg98D+Y3W4xMNGj6BsoF9lP8wAgyS7cWBPD9LwXKxl6hUXM5eIldiWb96mM5n61rBTdXr6Urwr2grydFN3mB@lists.infradead.org
X-Gm-Message-State: AFuF++kBdQBjVQu8EoS0admv7M6EtB25zGutrQw0fI+bGSS8w/CUOWwl
	zVsCfezpX48bxYzvjcmU5odOg5NbVFfnlWb13A+/e4k88wThoS4tPHou
X-Gm-Gg: AYBFou1QW3qo34Fd3JLJiA0yz1E8UZoRColRklf2JTg6JLMarfKP3C6jG2pu7ZyUVW4
	Zp5CniWq8KsS4kGSRJmzJM8pikHn2ZiiD3+nsTg6Zt2qJQRTwx2m0nzcpkd3uDKwZSa6sVJoMmg
	8hIXdfoWbEi2MvYRJrO32CRKsdqmCRujjrZr1kGFnpwKGHJeuS9UgJYpZwz06oAR64p41EalqW2
	nSoaZgMJ/arTeZz7Gd7JggVL5UwlStP3/72UShJknHkPoyFNOKJml1Nh4xMlU2qNxD0brIH6GwV
	SXUkdjdLIDB/uUR30eGt1O/WhARtMrVWqkPYAWclkbNRVEqnYj/m6RywjhDk6ILBbZnXvzAtewI
	4TAZX9cNRPUrJSTzz9NinuP3qMlZvfsJaX3Kk68G3/VyTdFzHZAnT0VXfUa02nf64s1e0gLTmNr
	s17kDXE49c3FR6UEMFo+RskA8jqW3nZ9wCZ6KKUR3eKxOZLwdQkyhB/YBsjDTHvaMKv0uZCAV9m
	M6kQieIAr3e8d7mK9diU2ixcvg2GGn9DTa8zwZHB89NvPvh9Ee/uBkEcCKO1zidDo3JAuEK+W74
	yWXbARI7k2YBluJoAecDHHtEeNdkXx5NUdnvdpDRZcpvxPo=
X-Received: by 2002:a17:903:fa5:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2ddc053841bmr56459515ad.40.1789880164957;
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:45 +1000
Subject: [PATCH 06/28] ALSA: dmaengine: Always terminate DMA when a PCM is
 closed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-6-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zGb+++j8iUZe/cn0Z0nFJK8T6VZ7UceNkKMJL+0HzLM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UNCs+tnF8jm/Fr9rnD+qaz/5/MlJvafvnEpdXpu
 SeWZM6J65jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1kxJGhmuLz9eF5142Xp283+/t0Rc/gw80iqvZZe94zfXn23/Xh9UM/2yWb2j
 yPuE6S9JqBqt0gZDlkrU7xeS3e7Hc+lrDvndKKxsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_215605_670003_5865B6A1 
X-CRM114-Status: GOOD (  15.14  )
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

From: Hector Martin <marcan@marcan.st>

When a PCM is suspended, we pause the DMA. If the PCM is then closed
while in this state, it does not receive the STOP trigger (as it is not
running). In this case, we fail to properly terminate the DMA, calling
dmaengine_synchronize() nonetheless, which is undefined behavior.

Make sure we always call dmaengine_terminate_async() on PCM close,
regardless of whether it has been called previously or not in the
trigger callbacks.

Fixes: bc0e7345168c ("ALSA: pcm_dmaengine: Properly synchronize DMA on shutdown")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_dmaengine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 1306b04be171..e59b561b849d 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -355,6 +355,11 @@ static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
 	if (status == DMA_PAUSED)
 		dmaengine_terminate_async(prtd->dma_chan);
 
+	/*
+	 * The PCM might have been closed while suspended, which would
+	 * skip the STOP trigger. Make sure we terminate.
+	 */
+	dmaengine_terminate_async(prtd->dma_chan);
 	dmaengine_synchronize(prtd->dma_chan);
 	if (release_channel)
 		dma_release_channel(prtd->dma_chan);

-- 
2.55.0


