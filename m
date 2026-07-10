Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E8DC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=; b=O3AsHASQ936qPU+07hKGYvedlY
	4QR8UvchwIpAwEL8IMRh+bt9u8+UK/ohmsWNsYokbguybDoLwxTTf2om04pEmQBm6R5yOvOJfCfz5
	/6KmEJIhL3gUIsYDSLoWL7xtJHnb4jTLoqLRB72Dz5/Fz6ep5wxAKXNZu69kohOZJuE1OHsKNZVeF
	jGBX7TSUlsMorAnFAJOZok3ZfJQxINVIB5sSCyuO6z4dHn5mZqOudaBigHUDAaLyZEyza8luKcIB6
	RML5cKKLS41bcz3OICNwaRnGzdIrghVZ/kptfBD0tqGsm4oVyA8YX4o5zRdpI93J1c2J+SADZxmvG
	yHlqvxlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3SR-000000049Cm-03da;
	Fri, 10 Jul 2026 05:07:27 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3SM-0000000499m-2JqW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:07:23 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so299877a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660042; x=1784264842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=jD9Apm86IGS+P0QvwSLnxhiYJ0k+5o55eKBgGKlN7dSKrLoJxLgzzchaHojAkb5iyT
         jWwcqyhD9aJmUg2f2aRTY+3pn0s03cKggAuSMvFC5Uwa4Z8RT/3Y8e5qx/WM3MaDNnN8
         Gcki0/zPHiCFClCyw9dd68F0dSXVFqzD2W1ttIOEkAvQVlJj+m/1qpXFQg+xfQ39kpTA
         Am6Qs9Es/bg33mdZpxoXiu7pjU8oPbSa81XxjScZxKC+S3Z0vhaKexr6YpYJJImHpPGN
         Ql8hJAo46lU088X6jcxlzmWeLx0yfiel+/jgA5S4DhYrFr5DfDbK4Bo+lA6YOfkhYTkA
         CMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660042; x=1784264842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=OKP37mons/rXt9yqvMHmhDIfb9YQbYnjTMWJzAc6f7KF3fHmfHmcLPxT3dVzs8join
         u0klSXGHKiHa3EDYvvd9Z3Kj6M3mQ7WxSBj3LgK4XJJvxBEPSS6njzMYrrWrSqpCOelz
         8BHx0cUKA0A0awbODCHEuUn/RG+peGfMbQ7KeavS+oLsCwz7l57NfA/KjgFXv9ZCtOU0
         g54Bc5tNvcANxT9WqCL2lfJqLvryi/RKFgMU1IfPQOeO+B/icLEbR2zZ2EECD6R88yTa
         CUNlLSDMoH72ccP2jt3o+dzRM4mUbO09818wN4PVyCppD8ZIgBxd6XU2N5igG8JDrQ4g
         syNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrARbSvGgwxPol7D1blTEqmi8BusOQmG6sDEW0k9S6a7sbuVwk4nBH7ovZ1EL5LWlGZqQaJuZbWMjuc4YmV/Wya@lists.infradead.org
X-Gm-Message-State: AOJu0YzfLHlWaEHrr5M6NWZYYYNNdCYQ2/c0g8fQ/+Fl4oCm1uHv0QGs
	2oIMBBjFuAbARycvHXT2vLHzOV6RWZFO7/XNtdrQO3/3F6oszoAo/55L
X-Gm-Gg: AfdE7clg5jjuthyOKPa4o7nAgfk7RKTxeWJj/cXFSosFqHeSeQ9jhFjw3Uom1z7MVig
	ilM94wxQYdy+k+lLGG7B/3m7Nn7n5Oub+oeG5Wxz8nWsp64s3LIZyPgtxehB8qxq6jKRVxmS7b7
	DJEQ/DXT17DMt7eJcSXNC2EHcN3h+HJmSn2OByOMYFx7FkqnRS6ZTpsJEsFqxQvGNcEgytn3yU2
	32UYWAt9ktLPha/6H9Qbjne46re0iCZFLTFpeb2MjPViOFhL1ZsLcXl/6Tw4HzVGaOC46iYRMo5
	4NgausBrll7djrPievvq7Q8O1NG0wbmurv+UJxLClkSUKj0Cpde5jfaCdzOKQ05Fi31m6hnyEt1
	WIuFksy+brqgfG10fxbHZKnu3J9XEpfFW9koyKeo7kcK1knlsqoNMeyobPLBwL/lbXp+fdQqonh
	JcYm8ynE9O4573jgOy12Ayu9wk7sb4ZWqah0yOI9/vKhBOCX0=
X-Received: by 2002:a05:6a00:3e22:b0:848:5821:9489 with SMTP id d2e1a72fcca58-84858219d60mr6179778b3a.68.1783660041650;
        Thu, 09 Jul 2026 22:07:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:21 -0700 (PDT)
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
Subject: [PATCH v3 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:00 +0700
Message-ID: <20260710050511.14439-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220722_628867_E21290A4 
X-CRM114-Status: GOOD (  13.95  )
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

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
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


