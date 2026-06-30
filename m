Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F6BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=; b=NNXtPmNB1+0+CyNl60xE40jLpw
	826584dnZpgZcidlLCXpS4YG4N7iWGRRk5xi3NkaH5/r/SBu2x4GxDGLgERuVeCHXFeYvUSE1jn2A
	zjsH00oeWlMFjOybst/6FFxeeZIYHiq7zyfKdPCvNqXcEN05iwwFwhKKrXsIZsfLZcVy6rbsvZU5l
	tkrKQJ41hLwFM+aKquQJffsJYOx97y3Rkzi2DVGeNyS6Vl+WQ5pzcrQ1AXWe2huKUvytSYtrj/R//
	3iWcOJQrKMDG7Hm8O4TGewOHM2Uy1J4VYsWdsgWUqiQ2WySha87Cbd7dxqMnRopst0YpOIHbdmO8w
	o/tuf7eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6Y-0000000FzuL-17mb;
	Tue, 30 Jun 2026 06:37:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6S-0000000Fznq-1EHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:53 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8478cc93299so946712b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801472; x=1783406272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=kdJHcz2adZUdfTo+2vy18qo4+dTKzlQzj3eaUSOPpo6ZDubOs7m4syUmpz3J6IOi5T
         Pp+h/y+zSOEjCu4qqfucY9Ezz2Lf3oP2USMpKAkuhTYBjOhlESgqj41rFH0vjFGKSzKi
         rVyYZmVZWakDu1bDh6lfDjlF0QMu/Y8Z05jkb76FgGGovwfOTnLOY6Q2KMECg7RHvSI8
         mm/T5+5hukzAtIVICAISUr9keaHDqeOwKQLmYDuS9I98WCuajoBzbkCUaChbbyaPMJGE
         SnFq741PRpq07nfajzx/ajYjXHGaKBauxnOfXvTQON69OjAL4nh/e0/bjG6LySLzh0bX
         Vieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801472; x=1783406272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=szTeJxdCXfRiq0JYZiBL7HG8m++k8Kdwx28jMoEPk0/NkOR6QoCtjR30Ny0uKZASug
         JvRLFqMdQ4nvyFRCkWLdozpPCqOxsvaliWxFIFm30yB4vUDdaz2SI5wwiSlVDL+nd6Kr
         czJ9AEHaqLE4X7pKEu96t2oZLpKYCveOQv4yfpINQEbnr4Yf/8dzPbm9ErVeNXFqmEQ4
         AJ8Lzf/N+nXckXFQjLX3seaZSlTYjZtQdb6nkWEE/bZGM2c17Xj/B0EwCuowOO3mAdNi
         Y2eY2BOPRgc6DcfDkijOhdyXRP89IldoX3RKzO6VJH3NhiqYfOBWRbuV+2NG+HwEQ8Lc
         NIIw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/ae9A7FtECQ190jjG5wA1p/dS8MhffnEHWzZDGSA83/o6YroTkI5gm+Fg/MRKGF9vb5elHFEkMTrDBPy7ZWJd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8XaiQM8nUPDQFWWo1y2Dtyp9iClggfl5RCvIi1LD7WLJoZ5fw
	6gD4N8vMqhCCyqpmNZ1qTYjJufKFvRZVdo0DNYR2N67RHzueNup/pw12
X-Gm-Gg: AfdE7cmEZTYfCiTy9Mzs844B3FdI0r1ePyZcVMNrdxqeWguTsMlFpYN7R/0vZGeZtwZ
	3TxoW7TVOhd1zv7cgplVhDfpvHut76CO5RJjgxc5c+Zb+OGPYCpVNjbpuW1sfKSe/V8zyLLclde
	AeKn9XJJ5UJbuV6LtJjcXY0NjlIAVvosvjQD823qOjumzG9HWIxEVijIkecwCYxSVQZCpOIQ8vG
	Njn3x1ZNZapH4TYDW+aeswSC0bK57yOexJwWkd4oNjR4NJLVt683RUzLND3po8ZABNVe4toOBOO
	l8LGuA+/U7ozKslGLdA2cwtHLBvPPBLzYWSp4Kq+n5CdrnzNyOVJU4nmIQunnhRLCfsUwk6Gchp
	gnD8PJFjnT2F+8z0hA1fPZb587R4uT1k6OCOsAKgqX01I+i5XMQlb/L5/iYEppe0oRIdQA1p+IV
	ncMjlTBSWwqvOGIwQdXIIVD7YToMwwtdIk2+ny+L95YiIYEAA=
X-Received: by 2002:a05:6a00:3d0f:b0:847:8a47:264d with SMTP id d2e1a72fcca58-8479f22aa22mr1967010b3a.36.1782801471671;
        Mon, 29 Jun 2026 23:37:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:51 -0700 (PDT)
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
Subject: [PATCH 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:41 +0700
Message-ID: <20260630063449.503996-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233752_366281_4683B6AA 
X-CRM114-Status: GOOD (  11.69  )
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
 sound/soc/codecs/rt5665.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..1d987472ba42 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -1208,7 +1209,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1275,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4563,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4601,7 +4600,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("HP Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4620,7 +4620,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("MONO Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4635,9 +4636,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 	regmap_write(rt5665->regmap, RT5665_BIAS_CUR_CTRL_8, 0xa602);
 	regmap_write(rt5665->regmap, RT5665_ASRC_8, 0x0120);
 
-out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0


