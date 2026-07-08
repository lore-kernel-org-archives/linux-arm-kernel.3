Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8746EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=; b=Cn3D1S1awgqQpI73ej/JcTW4X9
	4O7ZgFYw0LE9X4JjLutoj5AR/eWx52NY8dIgouBN4zbnXu3IgaHYe56/TXs4LvBb1uZQxtVMHZY/b
	x5KRFL78TXQRjcWsiesqp7P6CuGH6tj5PoXq/WfQQGdiJz9GOBWYBJLw5gp5ohmOUAtxZVbFyQ1Jv
	wE4j4uKY6/4HECY3SdCOD+Gw+W4c4BBO/P0JFl36k+HI+7GVLJA95E4QVZKGCiyFgeNS5iqWfUU07
	tYp9H+c7KrzKL2mn+AVE5IjDEjkKn6dlhPuFzDXvMAn1+CPQYd/wTYaFkJ5XVxsT75xZzqCf/ckzG
	7gw0ybAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8f-0000000HHBp-0pNi;
	Wed, 08 Jul 2026 14:20:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8c-0000000HH8M-0iIO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:35 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-383adaa461fso538301a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520433; x=1784125233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=Un136uWQyMXe0500ARY/V1VBJwIbAkN7JshvyBet6HYlHmoa1/1EQZLqexn9eXx7gB
         E/nbMdbMZMjFnvNYxfzTsaIjPsu9VXwaiJ+OKNudDn2UiOzYDL0roiY+NOQnb8ii1Z/k
         R5HW7ztfjhyOCqQXXm4/W2MLdPAQGttPbmR7jzsNg0UOnWR1RqaTS21mVmtxhctlD0zP
         5HpBKH2Y90c/FFfsR7g/T7q9yO41PQFECMpKuyEyMamKrfRfr/PgIDjkn8rbSxu25eTG
         fd6qlEeSXWFPSmtHc2WxqtImag+q9bTlwFVFv0LeCFVDQthG8TCguTCTC6jRN4dA3Sva
         pmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520433; x=1784125233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=A9JoLBAQrZFzmRpLYMor1jihyRYTlaQZ0YtDKO1xmX7o0lFzVtjuWag/dQwl0pRxi0
         s4Q+2WC7s1Uw9omBBRPCg+wkJrb0NZeuZYI9ZQxfmgpdjHw2eHlJLQ4E7QB1VGFOnQzj
         6MRrI7kK0lRVHwygWvd8cOZY8+toDjJe1/Stl0BOF0Tf/C700q7fSWYbZtgqhPMlUX9T
         LHLOdPAxbh5jiuBmTrvn+wSbImhNXTu8R3HelxAf/Xu9JgJiZ/DNd+EFxSU0dDtsbiFf
         wsaGsEtPhmib0HQR7TS7/QKS0AdD1OldOreHB1wYCR2CJjT1k1Eb/+wqIG5hpDsZamM+
         UONQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMlXyVIFIHEGpZEGmVZMgSB5rcNV67LatMzfHvUTRcC4loTfH+GCgsPZFSp9oEkdAnWEN3M2Ji7TqpPNu39IHS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1LoFQ1WaXZGF6gcIbLbldvWZETl2f7vXLuanMUZmLjoLLstHa
	Duu/mSUo6Bcz93W68eSF4nRqQ5rvN081NRg9AYJjhO1sVfWb0k+mhSoJ
X-Gm-Gg: AfdE7clsuiVmgqWJ/38FBWTflk/yPV9gi6usPKFzFvWc4f+pKJ0TN3IhEdU0DIGMeNg
	X8LZwVvO8VTtLcbvwky7oE4QcZ3VkWLycAkwOzyAaxig3YVMKKCAWyHKtE15jw7hRQEH/yTiWsf
	Vc5M15vTdxVktzRVl2gOVD56SjGm9rujdZuucPKw5ahOb7PWJDDiCh+g3qCYUUs3YsTVS81z43B
	hWN1iI623KAODjMe/KyLAcbOpx4jVWu3n8/uW7TC+0NnMAw2kHsYqfLllpO2KjXHCJK5PuzaIhC
	EWe9VyJIJal65yq+5EROZwnfw1+SoNHkXdJV8kN+umZriuigmZIvgdhgIgOLCakk4yhIyysFb4f
	5f9ZYahtacLXoaKHj8tnAOa4i1ygWM+K6MVykL0SUeSQ6TNWDh8QHaXUvzfAfgIuTaT2xnCjvVn
	c3b+LWx4pLMfrED17DMIMGSNUH4Bbl6v0OZSrj11lmRdOqDeE=
X-Received: by 2002:a17:90b:1d51:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38942691945mr2587146a91.38.1783520431851;
        Wed, 08 Jul 2026 07:20:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:31 -0700 (PDT)
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
Subject: [PATCH v2 11/27] ASoC: codecs: madera: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:18 +0700
Message-ID: <20260708141734.578926-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072034_210314_CD390BFD 
X-CRM114-Status: GOOD (  20.39  )
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


