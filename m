Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655C4C44531
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AG1aLLSk1A+OF1XRTr/NNeiulfMJPmRiCY4S1R09y4=; b=rFzu/TDCo8rjYFKzVMBU1y+yGb
	Aqfr2ZxRpAKhppH/4Xl5oTX5zIQySgJvti3YlsRr8NLmwGOskXWgna7HxZhzSR0LfMHa0r2w/9LDK
	LYNWbHQ4ZWu2+qKBGSGIWOKs6Iphu6D0pljk6WzFbrp90MTarN8pR0dGwYS8vpaEESWdBF1gVbVeO
	3AJs3hUIJPaO/XIbms4QeTgoGndRPcbCNxHEznyC69b1zKAGZYjwzpvX3eLpWFGC7uTs9AzXtgG7D
	OFRGGE3FNZ2Xl21R2RuvzURUcUDeyFk/fNyJZmCH3qMEKH1JK6G+YAkA+jrMjJdi/X+nLHBsRJ9EN
	zBR1eGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7je-00000009BAK-0kR9;
	Tue, 21 Jul 2026 10:30:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7jY-00000009B45-0BMu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:29:58 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cacf197759so127095855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629795; x=1785234595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AG1aLLSk1A+OF1XRTr/NNeiulfMJPmRiCY4S1R09y4=;
        b=V3F54AM9EUfvRV7fH5e1TeFX2q7L4TX37cELE3tBJFb1yyD/FlYqnrAtnxzLfnm5U6
         7+gDKnvrhMQzXK22CaX2e8W/is+3IYR35t0rtHL8OvqitN0rmsxO7bcLqbt5DKZYGulX
         AKU5blenwhPh4brlnjCafcmvHNAeoHYAWD96tPGK5xCudsqKHQD8C6U9N68FW5YKkZIH
         6ekpSVk/gDGkk1pArnLbxgHTCw89RMWwfRUsx6BPUoK/LJ1zsxmz8s9go8YBpDVzFYby
         KKanwRfHqe7jmiysYwzRAlhQ70ZR/FAaatBHLu+p4w1zd72AAD/mHjhZhq2Arw/H+Y0p
         iJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629795; x=1785234595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AG1aLLSk1A+OF1XRTr/NNeiulfMJPmRiCY4S1R09y4=;
        b=WblpkGqX+E4G8f95nOxy12wpw9PLysIixWCwGb+tX/wBuztQq1PdC9lboVYW6B050e
         9JPOEiF3hjipBwokHalGQaRf4A7y6YqTtDk6K9f7vJgAnFeVu0Pv/fgZryJ0h6Sfaxfs
         cbyaHcRHh0Kt+YG8EES7RNS3Sq1vrHXtlq/khX+c2J+qXp/yTDizAulvaMaPNGya2Akf
         wveIzvMn2i8xsN/c2zsQEwxWb/UcGPmFUwo4v1AtqABG4rtBW6Fnh+vvHU+tTkJi0l/9
         ftCkUCHm4paior72ZhpEudqLsPJAa2Y9jTi3AvaOoYRwtDLv1cckMHiZPmxV91ZGcZpt
         ehPg==
X-Forwarded-Encrypted: i=1; AHgh+Rrk8Cjd7phslbUMrgnXP2P00OIFQ0vAfoo/RCT0C+lZ8gUxGbcGXvCNqIY+cAbZG81iKi9y32B50iQ6zWjtgWVT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+H/BUjmqR4reYISjh8smytK8WJjlXEo91PIGjDA1QfDmyweKy
	ZBIiYuD14PDzov5k1QcxXgpzLQ6QgLFPUYr1gcBuCZnrVALCE8kf3y4r
X-Gm-Gg: AR+sD11rYPsV7dBgHFlH3rSS6akxHfG8fcOjE6Z4u+ZvPVvDJ2T7pBnoYHiXiGFI48d
	J1vGJPl+2HRinqzyFZ/GotllG18wdb6uGkgsxAb9KxbpxrHvDtkhM4j8WuY7CUu0T9Yq1MWWQpd
	dR5kg+WIck+Unnfesnb74tNUkZrSUeV4cNXSVYOSgVbttbynACeDZO/7TpOVk4OROYMc4JuJ4Gp
	ulpdC77KZr56+m9luFzH7EBUawSRGQN0mw0xgN3P1SmlGfV8F6lkgy8dmQBDL3Sl4cCNpMn5PVK
	ZFHXgHAmUpJ3bYxkvHZIgVbX84fjEzvEnx/7eonWAJOrZYU4JDB7MPgT2DPFi8cbWO6vFujkUBT
	83qJhB93ARgiySS12K+XzZKR2J3XonWr/IjBU8X0sJ26MLhYrrJqe/HiOjeY2uzrs4biuanKnff
	trAZ+1831rt+jEkf564Ht94HN1lA9DXOHDcLNZ
X-Received: by 2002:a17:903:2f8c:b0:2c0:b6c7:2271 with SMTP id d9443c01a7336-2cf348047e3mr198541925ad.4.1784629795303;
        Tue, 21 Jul 2026 03:29:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:55 -0700 (PDT)
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
Subject: [PATCH v4 27/29] ASoC: codecs: rt721-sdca-sdw: Simplify regcache error handling in resume
Date: Tue, 21 Jul 2026 17:25:58 +0700
Message-ID: <20260721102600.523199-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032956_143851_7A7C409B 
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
 sound/soc/codecs/rt721-sdca-sdw.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 6e27e761afb6..6411df4eede7 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -511,22 +511,20 @@ static int rt721_sdca_dev_resume(struct device *dev)
 
 	regcache_cache_only(rt721->regmap, false);
 	ret = regcache_sync(rt721->regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt721->regmap, true);
+		return ret;
+	}
 
 	regcache_cache_only(rt721->mbq_regmap, false);
 	ret = regcache_sync(rt721->mbq_regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt721->mbq_regmap, true);
+		regcache_cache_only(rt721->regmap, true);
+		return ret;
+	}
 
 	return 0;
-
-err_sync:
-	regcache_cache_only(rt721->regmap, true);
-	regcache_cache_only(rt721->mbq_regmap, true);
-	regcache_mark_dirty(rt721->regmap);
-	regcache_mark_dirty(rt721->mbq_regmap);
-	return ret;
 }
 
 static const struct dev_pm_ops rt721_sdca_pm = {
-- 
2.43.0


