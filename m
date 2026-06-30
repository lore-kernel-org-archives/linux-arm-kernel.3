Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7B1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oFPEhR4KdzvrM3sAID4Cucf366Ob4IDS2zrn5wLPtbs=; b=4dV1V2l9V4CfmLocd1/iXBUwXV
	iEve9jP/6GL3TUPEameneyQdj/MkEhV1VlB7rR1wzfd9Optse3PW/HqvR76ihT/jzY87e5XGORDjm
	qcmiTFO4E2zCkLWuP3XLtg/jKLYPeQg1a4E4xJE/uqUe0k/jebnMeq38PSUhwPxnCiHHFRmPcSB12
	EZRxJrqQjM6ylfyBV3wZSzVajYjO13H2MJ4QiSxGbzZ//UM9ZTo4XxrgfhYZat67TpsUgYWi1YSo8
	xz50Y1UF0crMYD9T0Qy7YJdSQGXFZRxY1Sa2nQvGhNEaVLTOTskvijUkcY9rkiZDd6s3oOGNBB++B
	G1IT4iIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5b-0000000Fyxw-1Yfk;
	Tue, 30 Jun 2026 06:36:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5Y-0000000Fyun-1IMX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oFPEhR4KdzvrM3sAID4Cucf366Ob4IDS2zrn5wLPtbs=; b=j1TqpdG0iR/qVxygf0Sk+RPzYI
	B2uXJXQ1F0ANSjUKyRtU1G0kEq9T4xs+MYRbm+sH+HjzvgUlpD5CmfPILL3p8reWoDBFMMLbBn6tb
	vN7UZMU43+r1xWFrSkfFoPVGe45p/UqAFh0PaQPPNJ+3tsXf0t2AM3YKkjwDHhi8EFq2C7xe5EQyc
	q5ebWPchi/No/yRgu+x18yIpqU9ms3coH+IWuZB0aFu5xOj5cZJFEzhEeE8336l+s1EzMhd3xGGv1
	8urhQ2bVERqXjVMX75kM00VAOoFm+hJ112LWtO0Sjyz8LSez0N+zDcEiUD9ZxcwD6hjmc2r7ls+7D
	Y1QdBnjA==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS5U-00000001ZH8-2yQh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:36:54 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8423f236418so2119224b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801410; x=1783406210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFPEhR4KdzvrM3sAID4Cucf366Ob4IDS2zrn5wLPtbs=;
        b=fGoX25uWuumWmRe711ZpnLW/HlR5feFpDYCMU3DbO0D0u3cwugJgXMMPiB1Yf+dzvs
         34uR8Td7Lc+Nbbp4FOCBZOxaTth1B5KfQoQbjWbYPAPalU7PVL3vFs7O8pW36dlTxRt0
         t0ZBBuTKb38pkR8OnyT4nqM8ChW2zsbRubl/pgtCUFkXo2d7foM/JlVi4/q+AFmSRG0i
         SlC9VrpGviu2JKaCpOP/POxhag3tAkviPCUjsasMe0Z6u28avwafPgGUecvV5091YPcA
         d+kf4dE7w7NO1erpeet6L2loBsfhIZLc/7H6btSnVUovr/vBLc1BaO2vuPWJSfZRnWcH
         pDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801410; x=1783406210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oFPEhR4KdzvrM3sAID4Cucf366Ob4IDS2zrn5wLPtbs=;
        b=Xw9nB4xJwCIiLM/R9J1XFoEgj8KKgqWVtAll09DVvItCMSue07BWwEIkAL24vk1evR
         HwT+aMlFnr5aurdoMhFH3lWWoAuuiTH87rpe/1fpvkmJEkZSk1a1n4Q0OTLl6aYDH4sC
         YS9j4o4ZqBqK9i6tbBXIrULiIZmKwQgmV/KZkSRhthwREfDVLT9OSJmOCayDSA/bSvQ3
         AzOK7as7ZjTfkaXnRaL/Cde7vhPsvnqIjY4gAUdfmd5h19cDBSQen/1vNHgN7EFRD/vp
         IvZMUmPYBgwwzgvNqcYssgTI347Ga/AsD8ax/PLRm/jI7hwWIQth3Sv/TiNPA9MBOtOD
         aDpA==
X-Forwarded-Encrypted: i=1; AHgh+Ro76IxKKl8EYi6m4OQQSWFS5lZmw+sR+CrcqnZ5HnXcfAJqFfzL9txJhsf7HlmxN8enOFVfFmVuk3PrE7uL25AZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy3agUX0NEFEBh2HfXhXhrpPBAT3QLm0FXjlzBv9VzXyhmWYlR
	2anaUW4zpeP9Wo6ElxSa4b0RF5SPOMbQyb+6F2zWhORr5fOEBnWbfzq5
X-Gm-Gg: AfdE7cnM65BIeL4tms/NI4CZtEt8tboWfl4W5dM/9Hb6u1kApVafDRZ7noDMQjitk+v
	XTHjtyNBhLFl+FbGuRZ16g2D0u5AZdp4bLS1vr1L16MkQy8CiBNytG4/FonCqmKCGBhDL0HQsXT
	4sTMPOJdLn3tBJGDWv9kRRL+RrMctUw2yEGAbrH95X+2hVAYDWQIj43XeM5JaDtYxHvNZi0s3TF
	Als8+z9VM2QFgE7Ssdo8+VjLiU4rA0i6f2dCBU/fc/1C3rhVxgnRyr/NhXowGwpdBfy/2RXu5Ub
	Cm6t8i4t3R9oYSUOp8+hPw8M5QLi8pvD7QVQWi4Bc0Ilwt+caGqD5pUjacZ89Va8Z/Ig93Rx5xY
	zwSoVhIb7yuFvlqcq2YaPqWZ2PqHV05dYD9n4ChSwvYm8VlZMERwOP7BlZv+pqwsT0/zhX5TTCC
	DnyK/K1QnLvBH1B6b1ZLtneAwmwZNGLtPXUW6o4o323s4tWvU=
X-Received: by 2002:a05:6a00:2c89:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-8479eed0fa5mr1777284b3a.5.1782801410446;
        Mon, 29 Jun 2026 23:36:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:50 -0700 (PDT)
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
Subject: [PATCH 11/27] ASoC: codecs: madera: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:33 +0700
Message-ID: <20260630063449.503996-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073653_135827_D77ED298 
X-CRM114-Status: GOOD (  16.03  )
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
 sound/soc/codecs/madera.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8..7f1db2a7e703 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -513,7 +514,7 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 	 * We can't rely on the DAPM mutex for locking because we need a lock
 	 * that can safely be called in hw_params
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -532,8 +533,6 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 
 	madera_debug_dump_domain_groups(priv);
 
-	mutex_unlock(&priv->rate_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(madera_domain_clk_ev);
@@ -875,9 +874,8 @@ static int madera_adsp_rate_get(struct snd_kcontrol *kcontrol,
 	const int adsp_num = e->shift_l;
 	int item;
 
-	mutex_lock(&priv->rate_lock);
-	cached_rate = priv->adsp_rate_cache[adsp_num];
-	mutex_unlock(&priv->rate_lock);
+	scoped_guard(mutex, &priv->rate_lock)
+		cached_rate = priv->adsp_rate_cache[adsp_num];
 
 	item = snd_soc_enum_val_to_item(e, cached_rate);
 	ucontrol->value.enumerated.item[0] = item;
@@ -903,7 +901,7 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	 * maintain consistent behaviour that rate domains cannot be changed
 	 * while in use since this is a hardware requirement
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, priv->adsp[adsp_num].cs_dsp.base)) {
 		dev_warn(priv->madera->dev,
@@ -916,8 +914,6 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 		ret = 1;
 	}
 
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
@@ -1061,15 +1057,13 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 	 * Prevent the domain powering up while we're checking whether it's
 	 * safe to change rate domain
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	val = snd_soc_component_read(component, e->reg);
 	val >>= e->shift_l;
 	val &= e->mask;
-	if (snd_soc_enum_item_to_val(e, item) == val) {
-		ret = 0;
-		goto out;
-	}
+	if (snd_soc_enum_item_to_val(e, item) == val)
+		return 0;
 
 	if (!madera_can_change_grp_rate(priv, e->reg)) {
 		dev_warn(priv->madera->dev,
@@ -1082,8 +1076,6 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 		ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 		madera_spin_sysclk(priv);
 	}
-out:
-	mutex_unlock(&priv->rate_lock);
 
 	return ret;
 }
@@ -3041,12 +3033,11 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 	if ((cur & MADERA_AIF1_RATE_MASK) == (tar & MADERA_AIF1_RATE_MASK))
 		return 0;
 
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, base + MADERA_AIF_RATE_CTRL)) {
 		madera_aif_warn(dai, "Cannot change rate while active\n");
-		ret = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}
 
 	/* Guard the rate change with SYSCLK cycles */
@@ -3055,9 +3046,6 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 				      MADERA_AIF1_RATE_MASK, tar);
 	madera_spin_sysclk(priv);
 
-out:
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
-- 
2.43.0


