Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999F0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=; b=W/i67UfaaUlyc3N17nfhBA6euj
	1ccDXeQ4VKY6r/cMLKs6AYbhdy/+j+aHzsAYCkugHPKuaLrksjzH5qas1GGCw9eUlzD5/ZO41jI5c
	aC6+y8tPSg/HcKuIv8JROhIKN0I7O0TBxZcVRij+v9uSMTfh0a8AwLUmPrxveDiaqr+GX4XrZVQ3e
	J69gZOcAG1flNTxafJYfUtX7rzrEE6EfvZFk9eWCtjawS+MSpHolHZ1ZXwWU2PhAgpBs0SOQH93mK
	zQJImeQ7d6rGbF364T/ZTGXlDOxXHL3yaZ9HYVaFQN5jRv7mCXT78I4qlyto4f5lFbAMSfty/pY2z
	FWt22gOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6C-0000000FzX4-1bXY;
	Tue, 30 Jun 2026 06:37:36 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS65-0000000FzPK-2sbv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:30 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so2112768b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801449; x=1783406249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=;
        b=YPAdyRX2rJF6XsM8ParU1VGg/tg3u3sVi3weMawHkQAsteN0my8cwL1QpnDQzmyoKg
         0OEhS9T21nCZtPrGPNQiOINlf0lYktYaeZ4YlwQ93hgmErN0104hNmsYmu+R/ANB/f/4
         4FDay0zFtShxEmIAqE8dsjOljt+arUSPRDFuNDZAe+5COl//dMhatHcvK9tQnUvKEkKw
         B4dSD5YhyRhu/SY14dcEjoR14ibqGq1IDaU33m6EzeZUuepQyNi8op4y59d5az532i5b
         xhIJqHKG0fghocvut38rI5+O97LKwtFwi4XH9LWjREggwVCy7geYslaeAR98fuFTclRz
         EBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801449; x=1783406249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=;
        b=d48fXEapX4pdZAL/A7ikNAzw3lNJF0YvZXhmO26H2RuLf+DINk5r+qcsjLekkexAzq
         cZz4J4kRdQVZ3/3jvyDakE/iXMYdNq8fTnUFTPuIzcRt3zoS1+W3xtyvEC3STNOi1hnz
         b+qhwFpuMymdM4iA3qNX3ZcKCv6ngfzNIWAmpwXUYixKJzdQekU3dbUkPQDmjILlP3DQ
         gqxCQZ1jo/6XLNa08X03/gXgqKlE75g1wMI3b6OQETmEkrR7m9NyjmucHeLngRPIXmN0
         eLTNrgd89X6oE/9HeWlE0rhdnlxf0Ik0SehphSvtJGZCDh3oHNJRHaDsPzUNvqj/Gyzk
         cpFA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9h5nmiiYn0W/0GhxUr50h894eczO1MeKMZz/O7gG+xOFfVunZnHkoSFjhLyUhpVNyCJCnRaF9ba3PGqx0nT/I@lists.infradead.org
X-Gm-Message-State: AOJu0YxUUJL2wLSSPmaHRYHrehRLJwKEnbXxGEpZ5/mYGD6VTketQtpi
	IV5Ot897F2Oo8bYYLAbU4IuK176ajT7B7AQbsd4KHTzbEGxKoM6C1c/A
X-Gm-Gg: AfdE7cnzd05Y3j3jJooi3WUnqRKvbCcRBQl2GcM9xnNHTY+tvIgpbkWfa0GuJxgPO7P
	9opoba5/cYxRSoHzcqrrO41y8ojcoHM6t35xrddu6kTMUR/EU6066IqwZJQ7fAcYP3L31XPyXEg
	QxQS5zT+qkpdwLbMgkNPN/RMyRlkGjruFk7jepbQ6FN+UxHgGtCLc9g+MfJPv9jA9hZDa6QJiyq
	1+0mZ6YFLYOSTEZ7wllAqyVyo1P5El8u0xnFCadDCa/yHQOkYeMBtoGNAV87T6woSb021ApDVrX
	vNdBshBBo0mRhCGaFPHRAzLojFAdCPLc3Z8gE6Q4hRG1qlcQ7IBo7p2CXXulldxP+ygJR2ML/UQ
	w3CmP4tRsG3Mt+jDM6ZwAm1CYpOFrhee2lbw6XmT9YiUIqMms648m6GJhDR5B0sxcF/AEHETXZY
	vcKoWdUjMj1iBb3ctbkmKvAhUYVNkbYf8VSNBMo3snqUiY0Ewg2fw0kngOHQ==
X-Received: by 2002:a05:6a00:4b4b:b0:847:8842:8c63 with SMTP id d2e1a72fcca58-8479f2ea745mr1734146b3a.56.1782801449017;
        Mon, 29 Jun 2026 23:37:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:28 -0700 (PDT)
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
Subject: [PATCH 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:38 +0700
Message-ID: <20260630063449.503996-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233729_732890_C01CB276 
X-CRM114-Status: GOOD (  13.87  )
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
 sound/soc/codecs/peb2466.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..5a1ed02abb84 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
@@ -1704,13 +1705,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
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
@@ -1718,14 +1717,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
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


