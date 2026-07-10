Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=; b=JYYZKSUdYcVWivaLjzlsYvNNyM
	SIPw23MWvvHrjglb+dLSlKdXlMuvuTXtCodcVOrPRLIAllwnZm8NxN6Msw6qBVYVnSDBgNrcxaVki
	XpYFuDBATqM7TKNBTGUIMK0Wl9z2hbigF3CG7qvsy+IOa8pKIx1Z25QGv1e71LeZAaDBeuIaqs/Kz
	lcLbWpLjLj6KoIp72d9xznWRbmmJnyh1k4Oqz/KWVZK4zlDcBw0EEeffgEbvWjAmhUkkyClPtzcBb
	4zBdMV0EIbKiNhss8GyaU5GGiLFKatK6MNypC5ZkinFuiYqEIXxP9n8oya6aOKaPnf5xozijz+QX4
	+VVO9EQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Sv-000000049fS-1MOW;
	Fri, 10 Jul 2026 05:07:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3St-000000049cg-1cbT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:07:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8484f229529so346389b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660075; x=1784264875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=Ks/9UWPgPIiJBtesJa6QePG9DA+mhp3EjQXLX0jamziQVZ16FnrNh6WF1IzEAQq63l
         sn1dDBNoUwbWCVe5Qry+K9YFJEEJKt7u23vNzlB05l+24xWEvcDW1IbVQZqgV2gMB49o
         RDjGwt9PmV3Y+n6l9FnDcQkgZlOMOze84ygoC3t8XW4RVUE5JY0VBMCYo6GR8RUwzXna
         VT/1czKQRVDHVp31Ub1kH+I/T0Oh1OYvHUWC7uFJb3/vknvlooDbBqMwTbzYxChbjJwh
         wlglslWQx+8LXDU/mVNpXy+giN9vxDjehb9GhWt0/TdjIP7/hiaTaE3ACLkWE2UKlkXv
         F1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660075; x=1784264875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=O083xHSUYsvdugQamCFMRZgV0Gc3bcqs+vg8tgJbuc/fsW1X6RzvhyjtLoTjwjkSw6
         TacTqCWAMtBNAGnEvpjhsOcs92FqIBHZEpYLVxYbDpJe7m6GAUsrMHDLE/5Zdhr3DyA1
         p+kr14rplYDKDQK5PEsDhjx/Qni7uPAiHa8FaDBIi0jTiuyYtigsYRwONVdo3KbqtpLG
         OUBsKLYPcVD5R8fZGpZbI/Y3cq8DLbhw8BHrzCwfQsFuLOAWMyPRO9LpUeYTWdsGZfqy
         oF0MgQfy7unMV3wLuLCxpdcrZeJpuJudMemNBpghm/BM41b4qwsYRKY/taPPufaYZ9Bc
         L33A==
X-Forwarded-Encrypted: i=1; AHgh+Rr9juc/0QISfBsc4BFdVy7m3WXAiMlfAp/ZNuzA3iIDF3LEopogJRaNdppRKFVFeacIDUhagKPrCXr9A/zFATLs@lists.infradead.org
X-Gm-Message-State: AOJu0YwjIYra/GMpLV+yAHna3+HIk/TFwjVpbIIn7/5lYfQa1ED1tuEd
	ZiQbLLd1tkxEo8Qto3St3OteYLkcNxO0kayAcxa//yEsxVMbtWAfgYdt
X-Gm-Gg: AfdE7cnV9q5r6cPeOpO+uMRz5PNiKg15Gqd/Pm3P3xfrixLFmKs5X991AljxHJ1caMd
	k/piVSVKBlPMDR8TxplPQmszik5vzv5ZeHjV69aWD6TD8NPBoYlNjFbt0H5kyISzUqDNVq0YB38
	b302+37L6IFT2KJyv73DCst6dyndL+lJfjjaVSnOn25H4NZCL6aqhaLqiWPYizyumm+ntIK+Q5u
	4IEoiAa5GmCRodvG8HozYBsE2rkTi/nUlznPCXmYcqSHyYJRl1VYxrf1O8mqWzvWIek8Ii2ELhJ
	yFNMruoxGN1yA8e/hKd1+VZeVVkX8YxjJQqWs+8m2uqjJnNk8oxre5IUPvmKxjj8MT3IcqFQrpb
	DBRezb4JkmbbnxM7ZR0DjbMLgHvn+njFWiHnt/sXt/wAmDR2yq+ztec5csrWH13ZI2b22Vn2BTu
	Pwi78LKy3RD4SAwg9CZxCVRYQvZnvSxKjunyYM5KOCgykQsUwFkX1Is00tcQ==
X-Received: by 2002:a05:6a00:2e24:b0:847:84a1:9782 with SMTP id d2e1a72fcca58-84842ede4edmr9311865b3a.26.1783660074723;
        Thu, 09 Jul 2026 22:07:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:54 -0700 (PDT)
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
Subject: [PATCH v3 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:04 +0700
Message-ID: <20260710050511.14439-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220755_439573_57EEF577 
X-CRM114-Status: GOOD (  11.92  )
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
 sound/soc/codecs/rt5668.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..4154bad27610 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -986,7 +987,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1054,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2355,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2399,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0


