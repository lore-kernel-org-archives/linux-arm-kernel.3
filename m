Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F384C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=; b=OJ0sDT+Fjw6a7Ybpiv/ZId302w
	wAfodOHUubgVlv6uj4hzaBzhm+PNTe8idwBnl/FN/3paMo81/nDUoUSZbB9VrcObuT09dUlpprb1o
	l5mzEtxQFKMRSSF9zHNhJN2B0cXSbESfvepDiFrRoeyhqB6XOjGQxhndN3CCUUxGV9SzrZOFXQ7Xl
	LExrGdSBvF0odm91yoNh6ct5QTtc0MUFlQUMe/P6Z/ljHetLw3VPzE+tin8Ko/31/3H0kTIB2s0oS
	n2+bg2Vg33BTkVJNdRNyw10P84CmJTqe3XunQBzMfa6owiCA0iP5aCVK3iwH2j8kno7mKBPqjSKrQ
	Nj8RMcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hp-000000099Mj-3q5B;
	Tue, 21 Jul 2026 10:28:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hb-0000000996t-0qWg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jul 2026 10:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=; b=SyUofT2itRq7K6jDthIPBzaTtj
	jEJOWGcIn+i59molYwsYewiUG7p/Qczyg3rP+OfOvHGi9OJafokn1/cVhS+7MyXSi5kJ9PMdHSXdF
	4S7rsLyonIyORHFhxDKckDpVRkfaEpqdnOCfOIsBUjNUNe1IKpKYVmTW79qtcCoFpHIyAkPB0jikj
	L4SvLRpc3CTbTnj0QuHB1zGOSoRzBgM4yvvxmgycaxIqchUIsJI6FSrC4TfUPvswoH5czI7MCGEpd
	x7Zc2ptfJ6HDuR7rh/tpl6pB/YPKA7qZdmd3XmLV/kfP33h9dbFr4W19v32nRNQHqqkcLjuG41qhg
	6XGfA3lw==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm7hW-0000000HRaZ-0osx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so119957765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629668; x=1785234468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=UL/1RwSLLtegnX03037x8XAhg/dCD4gFvIS/R1FiGw60bFupvONDaJc6hd04IyCEwx
         8fDzXYrQkqN9TZAtLe307JIsAHIYgzrWdgwhGuHpjAQs8P/JYq8gh3Z3pBD11cY8BXWb
         yyClGGWpb2uGTqBdzu9z0rqoMGh+y2c+Cw3A7EJE5sAekJM2bTpy7T7Oe5vqLXcHjL4n
         nU93jas1EYKzgyVdR3GiO89RlmKWfGIPTPAEdv9DJBMdAQL87gQSfsNbWL0k4Xw1IW6D
         Cyl1JLKoNsVAHT6rrIkv2JR4fENJeYGuoXszvpIFzeOA4UHxuXljuS0mxQa9Pc5mQER6
         DIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629668; x=1785234468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=AsKnXrGqXesTkjPs3q4BsMkSK0IxN1eJ9/kMkz3J7+aOoW43ADgH30DDRVpNvWI4Ti
         c0wBsjvJ9aXn03KGykHhWk231LniEJFvBo/QbAKmzfd8P/daGHSGvn2/OxvAV1osDzrl
         JT/xNnBoMAAophaX4/ewJIwIx9PzFL7nJ4TJXgW8RaOsNy3n8zfwAS3Uhin/Wr516kT2
         wLRfPfkuRqnS+IZgqv0mvGwLMUfWysUuqgsKRPWYOc9/DEdIzVpM3wWEs+EM9j2nWqEu
         ycDsaJuwsKnAUZjnPuGEpmaq3rxVzWDmcVh2HrUf2x8KqbVD+w1DPdNCspb74kjMK/0g
         XhfA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6CQHhgfkuisWYBrXBSGwsyI9b9r4nRTepNcRTyS9GhArI2lYxTFt6usK6jjnFN/Qg+eF4W6DvQ9gOZI75giDd@lists.infradead.org
X-Gm-Message-State: AOJu0YzsreocdAd56z/yYLASrtPdD+/BmqUHw7DJxFYqjyYXNlfp0qoW
	GbueZYSrbSpBflnmATqaImpfzv6AVLAARZ6oI+mwsqUAx8BFWj0dxdE7
X-Gm-Gg: AR+sD12iVGgJDAXbxI3Fueci5hlysrWyZeJIbJJ0XuGbdBpXRdxwHu1nbF706fjNKpz
	gp6fRo/RLYKiw0AACR9I+4I862qai0YfxmkD5yVbb09ylne6Unil90qWehaDkp3jHrDvxeOtiWZ
	nI5LRh29uS/5I13FSHEZvu53AP4/QHbdhd0aJ9+B5+/KBZnZu6V7AJmJivrHFc9h83pAzj8TF5M
	Wz+T3O6rHoyh9KdezcXmOrbDsyex0Vr9wO9NLE20QOStklOCm5/r0qMEZLOW/ZRQAv4PoiVpKAQ
	DZS+3EcVwuBxVMdi9gr/KC8P0C/mBi7Bcpghql5wFNf4SVkUMd78N6/6YAJsLENRoOpx/Bf8rZk
	vUy9a6BLRC65JqWwPr3MkW1drChBPo8PvsVN9IwjYjZByqCrWkO6c3qo8wE2JAyAsmV3gUO6YWY
	tlkhQHoo/D9tnlr/G70pBHD4QJFlaBcIvjraql
X-Received: by 2002:a17:902:ea03:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2cf34832689mr196284065ad.5.1784629667940;
        Tue, 21 Jul 2026 03:27:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:47 -0700 (PDT)
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
Subject: [PATCH v4 11/29] ASoC: codecs: madera: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:42 +0700
Message-ID: <20260721102600.523199-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112750_443504_2D4D9FE8 
X-CRM114-Status: GOOD (  20.09  )
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Add Reviewed-by tags from Charles
 - Remove the temporary `ret` variable and return directly in 
   madera_adsp_rate_put().

 sound/soc/codecs/madera.c | 39 +++++++++++++--------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8..55ea6950ca90 100644
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
@@ -893,7 +891,6 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	const int adsp_num = e->shift_l;
 	const unsigned int item = ucontrol->value.enumerated.item[0];
-	int ret = 0;
 
 	if (item >= e->items)
 		return -EINVAL;
@@ -903,22 +900,20 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	 * maintain consistent behaviour that rate domains cannot be changed
 	 * while in use since this is a hardware requirement
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, priv->adsp[adsp_num].cs_dsp.base)) {
 		dev_warn(priv->madera->dev,
 			 "Cannot change '%s' while in use by active audio paths\n",
 			 kcontrol->id.name);
-		ret = -EBUSY;
+		return -EBUSY;
 	} else if (priv->adsp_rate_cache[adsp_num] != e->values[item]) {
 		/* Volatile register so defer until the codec is powered up */
 		priv->adsp_rate_cache[adsp_num] = e->values[item];
-		ret = 1;
+		return 1;
 	}
 
-	mutex_unlock(&priv->rate_lock);
-
-	return ret;
+	return 0;
 }
 
 static const struct soc_enum madera_adsp_rate_enum[] = {
@@ -1061,15 +1056,13 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
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
@@ -1082,8 +1075,6 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 		ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 		madera_spin_sysclk(priv);
 	}
-out:
-	mutex_unlock(&priv->rate_lock);
 
 	return ret;
 }
@@ -3041,12 +3032,11 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
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
@@ -3055,9 +3045,6 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 				      MADERA_AIF1_RATE_MASK, tar);
 	madera_spin_sysclk(priv);
 
-out:
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
-- 
2.43.0


