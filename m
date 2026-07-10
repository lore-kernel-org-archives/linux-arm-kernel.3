Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8488C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=; b=aGHzNkQgAyz4BTJc2QzAhBulf4
	6dpKMIiI3vsnQndWQTQtclRbG0Jitbv/cMrzxJiMao7KyeEJT/mYQy7HiYmZEj/JHy47nzO9qfbr8
	fKu6BUTt66pjr1KPGlmtfqN//mt+xB2asfyDVP0b0Tj1UBJosaKtcHVaobnzXqPSGlFMI/2UU/oRf
	gt4feXOTciBjUF4bPPVY9G5EC5ELTvnUofNTg14iQLGTb7NcrgxxwpaCgFytDhblg/caf8g0C3YOD
	L+/IWSUeiJhaXREHQguTyw/cW6qdwDtkJCrdby6c6fmSiBMa2+gsiOfiH66Yiy+dyga1oA8+ko53Q
	Pmw46qLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3SX-000000049I9-0XEG;
	Fri, 10 Jul 2026 05:07:33 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3SU-000000049G2-2OxR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:07:31 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8454160043aso451301b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660050; x=1784264850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=ovBGjsoHpu8Ie7codUYymW0rBqXSLquok8iEPRjA3U7bu3TZF4oC5A1OOfLzlDZZPk
         B0fL6kch1yP5VU3/6BC8u5/EGgPPe0eZ/eDQFLzhDpMzsrXyfDq4POPL+Pk1ww9/jtEo
         KOFJKtIKNhQ8yrdIQzBUo5Xc2w+Gmh4PXRw1ubD6qV81phIWp8bkrTkL3oo7Ov5cjOw5
         SLsRkrwoRqzaPHqyqcG63SFQZuTYTW3cyKk7B8v2AreYHFm76UGErF4WrYYIgNGJs/Kn
         5DS+LIoTBa71KtIVqen3aFPRlTYS5P3yYl5QsQUjNUHZ9JHDPQaInaiO4x4++J3yNyLd
         xQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660050; x=1784264850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=ANC6tRouRVch34B9ZaGVEB0cJWR9+T3Nw8gFbDOTRS521/c2NRdw8H+SqLlCgfhf/5
         /tb2ppX3FLihcRyJpDqjvv2QOdbk0dhEADAws2mM+OLnXyyQ9n4Z8T1G4x5pIt6Obea+
         R6dxCVH7YE/NL2Rgb4huMRLnrnaZ1xGKhdMUyoX6//RSwm5g9RYZD3XCexEaZ54TRb2l
         sr4gq6d7RDgG0hHLcm/+43u88tQG8gKehSJCksthjVM1caPQKaFXFaWV1oJpeIyTj6Bx
         ttXAnea2pLAVbZZnVG/ej+MSQqVG4SER3ybZuMDlAMkieFvr4pMw0feOoaVTCDcgSGPM
         N9IQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWUmeG57lwNi59jpR+3K4Upqh8TvKKZtYNdbZ+Ju8f6yhgraovVu/UToI9RHv1rezuBCXdEHEtllGBKwR3ZzC8@lists.infradead.org
X-Gm-Message-State: AOJu0YzDhdBkUdcENTcWY5mdH2LkNj5awkc+GjmP+p7JBki12Wao+V57
	WQIqDgJaMGlFSgvRHJ8MPwv5zTU2GyLW8FZzsE3zxPK8fTd38v366bY2
X-Gm-Gg: AfdE7ckdfxjTYZ8fF2XXh/pYitryhPDM0qVESzeKqHoEu38D89MI8DWvKOEpHO9w/Bj
	rAOqE6hzRAK2ZQ0HO9cAPiby3Xenzh6YQxTrhJuhO8t4PJwTuqxpFls9L1VWdS3nK9fbPNBAPgc
	DN5X31JjyHFQo+U1EeRCLFWp2vC585fRbcYJJA7ydSWx0Re3t4RSFcUovRlXOAcz7o3oI1GgIQk
	7OnNBLAgMxuanCJVL3qc0UxFg/Wg3kVCgLWrvqa0ufP7DXiufI1Nyi4AJ7PskJ8JCUbbaDW/ZDe
	8g2+eAuPud//rhOseji5KoSQWiboo8uFOmJz0W9lsQGVhOmWcDel4CnQoJWvx0XzDKBeAfUnD7C
	Hf7pwwfQyqLWapQmupOUCfIiBgvzGgTcewd7fV/J5l56nnLFBZBy5mMwz+i4f1rX6NU8k2Q+/wd
	wkmda0+mF6ZYSfH+HqwcrvaAb4pwy4J3NYxJA8JH4/Lv4E+iQ=
X-Received: by 2002:a05:6a00:198f:b0:848:6f63:8d37 with SMTP id d2e1a72fcca58-8486f639411mr2153035b3a.61.1783660049877;
        Thu, 09 Jul 2026 22:07:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:29 -0700 (PDT)
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
Subject: [PATCH v3 17/27] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:01 +0700
Message-ID: <20260710050511.14439-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220730_628861_C7893E20 
X-CRM114-Status: GOOD (  13.30  )
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
 sound/soc/codecs/rt5514-spi.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 199507d12841..91290bfe8daa 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -6,6 +6,7 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/input.h>
 #include <linux/spi/spi.h>
@@ -79,17 +80,17 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	unsigned int cur_wp, remain_data;
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	if (!rt5514_dsp->substream) {
 		dev_err(rt5514_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5514_dsp->substream->runtime;
 	period_bytes = snd_pcm_lib_period_bytes(rt5514_dsp->substream);
 	if (!period_bytes) {
 		schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-		goto done;
+		return;
 	}
 
 	if (rt5514_dsp->buf_size % period_bytes)
@@ -111,7 +112,7 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 
 		if (remain_data < period_bytes) {
 			schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-			goto done;
+			return;
 		}
 	}
 
@@ -146,9 +147,6 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	snd_pcm_period_elapsed(rt5514_dsp->substream);
 
 	schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-
-done:
-	mutex_unlock(&rt5514_dsp->dma_lock);
 }
 
 static void rt5514_schedule_copy(struct rt5514_dsp *rt5514_dsp)
@@ -216,7 +214,7 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 		snd_soc_component_get_drvdata(component);
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	rt5514_dsp->substream = substream;
 	rt5514_dsp->dma_offset = 0;
 
@@ -225,8 +223,6 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 	if (buf[0] & RT5514_IRQ_STATUS_BIT)
 		rt5514_schedule_copy(rt5514_dsp);
 
-	mutex_unlock(&rt5514_dsp->dma_lock);
-
 	return 0;
 }
 
@@ -236,9 +232,8 @@ static int rt5514_spi_hw_free(struct snd_soc_component *component,
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5514_dsp->dma_lock);
-	rt5514_dsp->substream = NULL;
-	mutex_unlock(&rt5514_dsp->dma_lock);
+	scoped_guard(mutex, &rt5514_dsp->dma_lock)
+		rt5514_dsp->substream = NULL;
 
 	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
 
-- 
2.43.0


