Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DF7C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcQ5JWQsS2P0sxTuodtPBzE3B+AxVvQ7Jj0tVbKvuKE=; b=StsVHvCMO3+0CT12bTAZLVC+e5
	uaZ4wRFabt4oeojp6zH+JR0mCGyafuSXuAZ0S/6/gi7Zx6gqhbUbn8iK8Eh4TL75n8MPqTqnbBnL7
	BsBmUDRZpWBoVBxvCtzToRcPW1f+1PGVJNM4iDWJOdfyaVJlCquuadkFfpPtSSk787PqzWtl+m5J3
	qIBOkZvaA45KN8c0yrHeNmtEw7uqkUIofZb3KqCGCHQYY9qxUZgBz+6inOTmS4GypwpHX4t4YpSZ/
	WcV+SAG9gdHtjVYAT4Vd6BgMfwiJqUfuP7a8Cb85xkgtdZKI1RhWUfLbyHeQEWrOl6PdNG7L2WMTe
	ab6E1few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jK-00000009AtE-3YZ1;
	Tue, 21 Jul 2026 10:29:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jG-00000009Aq7-48xH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:29:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ceae1ed204so91193075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629778; x=1785234578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcQ5JWQsS2P0sxTuodtPBzE3B+AxVvQ7Jj0tVbKvuKE=;
        b=pWkREWab84LZVFp1C8JoSUSjnzZHZC2tJi6p5aHcrtOdJFp1tIvVryKtqvLEz76+9H
         NdSQdNg8WzhJOkVQMVab2le7lRXAHb7pbKz0eXYkRYe5+90eilKwvaeM97SLS/ewg+BV
         cUbdbo1OPQkcBgYW5e/Ch+18Ytv5ls3RgBf0nN63vO5xiqskmHZpFWnCbuQYsrYY4czx
         Biz+JemZrCAcRtWWgyR5XBJHx0uqhjkWuW+b1gVtf3Z18Vr3HKbBajhHMFa2egUOMBZf
         iOT1tz4ZwPSg0iE2VZCEm1Ob2qAnIrb8aUgkchzJkWKZ1cUc2vcn0sBLX1mLk443nngR
         O7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629778; x=1785234578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcQ5JWQsS2P0sxTuodtPBzE3B+AxVvQ7Jj0tVbKvuKE=;
        b=pso8OMpNxk9psEHqtxFCeR15JNuccv7wa+Iwq9lklepmHiUgFZ8utQH+KnAM5lfP7H
         f5vqMMlkFZqDf22kowBYj3hxYKZzOl2ZA58wFNkMjYWO1eLv5gCtOAzz5fuOzkraosu6
         0Gq4uc2F/2vkQSatJQ7i5Rr+mNp6fqb+ZR5qoegmQSXYUQH0odViaxEvUmoqpkWOHqgw
         ktHbUsxeYRtaY62tcYzwBOFpP3DX0in/2oVGz/aKYDFfB4WAtesQeSGvn6X4Xxrm3P5c
         wv+1kQ0+lnG3u4HCjXrRQQeA7YdOc2sJIL7xvaLmm4QcpJDW7ZwQrqX6dzOzN469Zfxq
         kyCA==
X-Forwarded-Encrypted: i=1; AHgh+Rpw5RRGclHu9Bhxr24zCpYOjj+395CQtC1asdgN+4n21+oCt9u8BqPzaYSJul+1MnHDlecwc/hGG7HqDAdgrbFR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6Bs1GAm+C4WwLZswyGyrQxhhi5DUZpgvR+DCr7etDopI6CWwR
	jCfAi7ZevHpFRGgS0jhbw9vcomV+ZgolB+AcUKyXeHVZfklcuZ9jgd84
X-Gm-Gg: AR+sD13lYgyUi5ZhzFHN+ieNyfkGGSxB+vkJkwhTYr9b9dfZ8MWYboAGJg7EL0xDCyk
	OKwMBkk2uA4PNzh4eldof29NSB2kOi7YKU5gHfuSxx7h4+9iLHVTeKtGptIfFb4mLfyVxe3i+2M
	GcgSubrMIi0ef360XuCJocTDvk5ntcIiyqF0ci6jzbcsQeCAvaxjhXM2GRM+drhfEIFXdUsaRwS
	XfA3Y+k8JBTBCyuIY90B0FE8m6LzguDAcBA/sdunOi4qzdH6fdy9kcUyOAExEulNjpvG7DI3sCo
	hs2Bf5pXqtBInjeutO7xZWbcFgTCGQKxYwRQyj0p9MFHEhROwrRQ7dotcq7OUKALVRialjzgDUk
	C4u1PyffDE8EoVUsEXPKuImM/JR6b2znWl8GrS7/BmlmJ1WW9YWHpSiIfalVZf6j3YEnkRB8UIS
	tOOCz6m7znl1vUD7E7gzhLorfljty4fbbC3tlh
X-Received: by 2002:a17:903:2acc:b0:2cf:7ffb:82aa with SMTP id d9443c01a7336-2cf7ffb8d74mr33781705ad.45.1784629778363;
        Tue, 21 Jul 2026 03:29:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 25/29] ASoC: codecs: rt712-sdca-sdw: Simplify regcache error handling in resume
Date: Tue, 21 Jul 2026 17:25:56 +0700
Message-ID: <20260721102600.523199-26-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032939_074330_45EC18A0 
X-CRM114-Status: GOOD (  12.60  )
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

Calling regcache_mark_dirty() on error is redundant as regcache_sync()
retains dirty state on failure, and any write in cache_only mode marks
the cache dirty anyway.
Restore cache_only directly on error for active regmaps and drop the
redundant regcache_mark_dirty() calls. This also removes goto labels
to prepare for guard cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index ebdf7b308331..e23501ed87a7 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -473,22 +473,20 @@ static int rt712_sdca_dev_resume(struct device *dev)
 
 	regcache_cache_only(rt712->regmap, false);
 	ret = regcache_sync(rt712->regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt712->regmap, true);
+		return ret;
+	}
 
 	regcache_cache_only(rt712->mbq_regmap, false);
 	ret = regcache_sync(rt712->mbq_regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt712->mbq_regmap, true);
+		regcache_cache_only(rt712->regmap, true);
+		return ret;
+	}
 
 	return 0;
-
-err_sync:
-	regcache_cache_only(rt712->regmap, true);
-	regcache_cache_only(rt712->mbq_regmap, true);
-	regcache_mark_dirty(rt712->regmap);
-	regcache_mark_dirty(rt712->mbq_regmap);
-	return ret;
 }
 
 static const struct dev_pm_ops rt712_sdca_pm = {
-- 
2.43.0


