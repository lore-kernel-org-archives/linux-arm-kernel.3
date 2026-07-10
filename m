Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C560CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=; b=ryoqTsOt9F15hzZS6AknZjeYnh
	z7hVwiXPSSwMuL3BgVJQELR5Ijyn0BaGLQyl/0X4a6Z1aad9UWX+QvQiYkAsqNCw3PdXG2cpzY8Dm
	sV7/fToYlxfmW1vCLWFo7gnjROINWcpoqwNoLFfvMqsCkQqOB9+YgBSf2mvmlUSm3ajG1ihrbsvd/
	8q8t2e1CL8pcUMh5j2sB5DThu+CMS6oZvtP6LnU8MwJDsl7CaWUrtVOhd5V3sj9CLCGYx9PRSPQq+
	ZE8/iOmv40P7NIKKpTv/8DTJ+8XWqBhtmO4QQ2vlnNTqiKmewBUxOJaUVNRkEJYwbvNIGrteaNouH
	5r5UvXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Rs-000000048ih-3E4L;
	Fri, 10 Jul 2026 05:06:52 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Ro-000000048e7-2Hhr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:06:51 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84874b52eabso456239b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660008; x=1784264808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=QSzt8Hys4T71GMVvJwFgIiNYpT65Kg4kAPYChSRA8mqfqMTkLLcZqt5iU9rjlLB6o5
         B3W/si9lfbApRinZPHzNTuHvs4f3ZoFKkRaIMbAbgPqa8/1B85cJfHV2j7mh7rFFStEA
         N0kPmLvlpAgzx35W6GPwJMOA8kxw4bewofHt2kao67cUTKeA02cpx7JHtUSB94wi8vcs
         pcn5hzfqrD1qF4VTHoSx5jS9XHrKFPlaUS2/89DDvO2osL5NF1UpDjXAqYCOZTyz/AxR
         160scUumii9DgdR30yYixfALKfRifO1PHCC+zQhCF5yVw6XLbyH5YvPpv491vx7HIJd7
         Ushg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660008; x=1784264808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=WG/+vbunWbiHYn4D6egNVONlP0dYQTAN80t1wm+lWKNSyKemVPjys25dVEUQQlbcnW
         mC95bo4e5r0VFHfHFpH7vKfFfN6+z+QG4uTfLZBjh0QYrYW8qDlVa7bFlfUfwfwXOJ5K
         aXekQ2e4u53VkxfTaqITbbUbAUMvseVy1j2sWBCcrKdN4AinZscB6GrK/JMxL83BvkNh
         m/nV/FZBW2A+MnK/PSl2QF3ivw/KOEPiH6nmGqe6mcpQXdgveNK5N2O2iGUwuRC3iUYb
         Zq+WfktPu9qv8aydyPro/rS4S7fhI+PwFXNRv0pJUgdpo+hIRo4nI9Nr0E8sS/87QNJm
         4KsA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+tQWKYsChEUT1KWJhhekrgzSOuTE1XVT7Kk5DvmafimYjNYIZ2rdyJfZl6CTlA/nGHjHL5vcHozCI/ebpLqgs@lists.infradead.org
X-Gm-Message-State: AOJu0YzJYFtI7o0pXUBuC5R3l9OmRhegpRcNlcut/+S5gE11HNZNpp7j
	W5SgFzL8jAfCzhNlMXvCIe1y4KNnQdQw7EAE7hy4DtLibpNgarDhPmMQ
X-Gm-Gg: AfdE7cmpUF6UlVwdtXez/dv11vFzRlcYzICsQC7Kf98NZCherHuI5laGE2aoXQ/55ok
	BukKucoovv6k4GdQF2fiuxnjxU7yG5ik9MM3Fw7HYYZVUsYwoy/xW0PybDswP8DfA78B/hmEcZS
	pILQD9DcQQjGenOM4Y6RRh1kJXFWc3vy3L88X1+PLi7JFBL/rqDgK1o/Pmu64Lmnw94VqkIFEKE
	gtbz5mg2hPn1uuRkAxfQGJzRD9cj7RJQCqofKHUYUCRKzZusgLAi46dZqrMCqxZu0F7SZkbG4hV
	LQQm471u95L8s6oNk2IbSOWesJho9PuzfqsneJjGV4KC1RLULBK4HMXn2VNghkeBHHh8ArLz4P/
	msqGxfcAgsYfNH1dvxWiMQJpAFKFnKESnaPQRslWP7MSWzJssksZEr5j8aXmEzcs44nKOhV/UGf
	PFEho2WYBK0b6Fay6lOe5FqEqQ8NCsEQHdBvC9XUOv7PnHKLg=
X-Received: by 2002:a05:6a00:a15:b0:848:2f77:e2df with SMTP id d2e1a72fcca58-8484392f4a8mr10653484b3a.72.1783660007641;
        Thu, 09 Jul 2026 22:06:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:47 -0700 (PDT)
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
Subject: [PATCH v3 12/27] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:56 +0700
Message-ID: <20260710050511.14439-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220648_586433_48664720 
X-CRM114-Status: GOOD (  10.88  )
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
 sound/soc/codecs/max98095.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..c47bfa2378b8 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Maxim Integrated Products
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1532,15 +1533,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1686,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0


