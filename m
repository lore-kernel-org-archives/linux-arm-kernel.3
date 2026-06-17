Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D7DCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=; b=D75ATBFnNHI1VKB+JnnqKK25Aw
	jTILizeVdmQipxzoTE/8067cgO/QFiL6Wa3lZcLr+Rdy578THF2ylcWfXQVAiZjBbjF4Bc6et9Vxa
	5ROCrflzJgJKQdjfomfoMKw1GxZh6vuqBVgnvynZXQTvQ5Tp6sDX0pZPTinSNShniY0IcpUMXJfTR
	60iTYknkw4gDhFox2fR37ssMcZi92f7xgZkwBKfmDKDdxh3WasniOYvWpYnz4aVlJf7SE+XsA27wa
	Dlon1PTozEmY7hzPC2qvEwUpsBjeyDDnCZz3REKwxVK0wZhX0OyteOQQFO6BTm2ivW1sWa/qpsTJx
	wdSsk7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZng0-0000000H8Qv-07eP;
	Wed, 17 Jun 2026 10:39:20 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfx-0000000H8P5-3pqw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:39:19 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-304d8362a58so603502eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692757; x=1782297557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=Lc4H9esDHd2d0hMSls/oXdimu7v9XA05k6pIwsNj3rzohy2LsYqzYO+bvYJEnn2VOk
         IDiRYfdMOhrMohoyugkGIszsqv5HgUz2XKOfxsdDSOZixHFHNopSDi9Jtsnl17v7oF6y
         Oq1GU2+D9uTHLBdVeSW60cm4/X9kpwwHewKFZcOW7+vmMG4gqMzT46T2vrPhunaaevqo
         zbKgELLVmaUqK9ZADowvKxQyMl4QowXqTQd0YOc12aDJAvxkhkr3UCIpD4QLt2DyVoHa
         NQu2D5UknZb86yB4bG3Z202BbtqeqEWmrQWZGmhiSBoZdfDvVn2uEJFdaIkO1BD3GMfF
         P3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692757; x=1782297557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=U9wMjyLShXvrQcpxm9geS4e6Z7+gK5S8xlP0DIXWgYRvcLhLX/4RcWDQe8sThsn53q
         TLVYLdvlICh3BPi+5mG/8bTjYwzp2jrEMEekmHcFxZSZTgj/I1ohq4BX4HGK5IFnDlOw
         K25RPiS6Qu/P8Onv06PJqFxig1NyV+1CnOfoE3NvEXAoztvhVrrxL2j/aHJmVNWmVvsA
         Tka4/j9FQGdzZyMjrys3mibWP4U5Awua7/xjVxE7QKs3U6kLM70QbPyfOFW6bfVkiUoP
         HrrkNl5MpFgbmXTIuxZkcIQ2nZ0xJ+IoJCzyWU8a5Jj4fgtuSdKewJCt/C9UE9tJ4y65
         tdtw==
X-Forwarded-Encrypted: i=1; AFNElJ/5nQhGPMYmI4B/kzcLB3PipPdnvx40U8wjmhiVTl7dV9nZgHn0NYpL9zxDqpTNc5Xjfi8Xdms7U+9O9ZN481xC@lists.infradead.org
X-Gm-Message-State: AOJu0YxHW6q+WTsNYxVRuuM0YPFSrOHQbOQWYGmtbKsfhFCT1dpreRbB
	D0P+JdB6fQ5O99txFEUpNWd9JrTWYY//9Nkt0YxiiX4zWDjlGTBaD3EH
X-Gm-Gg: AfdE7ckR43aA90nccaHBaVs7sPfFRiqmnGl9ZrBjWdbK7DA+ElKAvkfGPtC9gZHZ7g+
	QlsNXhGErCSXiFViSjCiULc5uT0kUvhyKrnUcZ+3MAqDwiXTZ47e+NZ7X+a5v3H1NuwJa7uz2wn
	2pYT3dBKNMTyLilPpX2Yg/5y7h+IQRFCGxphfh7Z/T8McFPkJS5xoOTLefdWaXm/4cNx4jaP14m
	wdxzHtkZnkiZIe2kanunN1vo5aKWFSxtsUZV7Cy4efl0ozpMXOBZgg/Q82rzEGlf34SsVlYuGHX
	Fl2tB2ZzsaAR9kTCTDS4+A0665ZtTQErvm2QTfE0ohFE2KyTla1RJe2Dl32NQfdtbc4xxynAptW
	30FgPATNvKJtZEoCQyP7mr1kqGau3Ps3t0hdTARH6ICBJQ10bot3QL7v+ujYW7J0Ab1hsHhWMpj
	a7u4xqaiRJft09DUMaAA9hqU2tG1tjfBpn/cN5KYNFT4kcwYs=
X-Received: by 2002:a05:7300:50fa:b0:30b:bf84:18f8 with SMTP id 5a478bee46e88-30bcf08d54emr885755eec.8.1781692757235;
        Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 40/78] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:57 +0700
Message-ID: <20260617103235.449609-41-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033917_963200_7F80EECB 
X-CRM114-Status: GOOD (  12.44  )
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/peb2466.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..ddbc5f34b08a 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -1704,13 +1704,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1716,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0


