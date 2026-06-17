Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE2ACD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yE860yX5MeluInu/xHweWVTpSgNi/lSdv92MvT4+EVI=; b=wFEM2ei/2YFfCcja5JrCl5HQb4
	m/0cHIuxWKDbAjIQiLRt9zxmN2Xs8QGh4T+gzHVkUNaOPxJ+ioT2Fzhc7wUGQ6qCSLFOy2j3QziYP
	/PRBVwUqvkwfDsmsc7HwlsbJAAxZpBQfFeCKv6bfXdF+UZv5ubvQlfHKLHPoF4Ih/jgifReX+UDlX
	hcKr7Merx4n+/tBvm2xpqOyGzhDesPqWTlBDbdFEfBR6RkGT/4QU9LnsaM9djeALnabbf5rjO5EU/
	RsfhnjCJzMqK2vi+b2LC88kT3gwYXazhAg2uZDrsgO6Rv0pwViGEgJOkfC+2lPdklcKPI08yNvLpG
	p5xAKz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnaX-0000000H3sh-1A2g;
	Wed, 17 Jun 2026 10:33:41 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnaU-0000000H3q2-2KMa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:33:39 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so149714eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692418; x=1782297218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yE860yX5MeluInu/xHweWVTpSgNi/lSdv92MvT4+EVI=;
        b=N197lNhINyeRwPZTKBsTGNZGJaemNoR1wsdB0w7M+yi3+JKfFJZRiLFCJuiBKUW4Cv
         wOBduZJJInufULUHnEkoXnuc+gKWeQJLRjn/U+vKq+YeswM/VMONqCsSm69JeEI/EI7f
         RvsU3WomXDyaM/avEntZVGTvDFd6FeSA5PkJuHJogfv82OA9vu5egK71ISkFz6ETXDL9
         FeD/i4PHOlfhCswk9mgFmeJuEkGIUX/5LkbQYnK9Y5d2w27RJEND7K7idX9M5Xhn85K9
         o+0MNquHYuAPTFgAbyb2N5rgGGV1Su91uYsbpILMJR7xym0XVwTPiqeCmpavhOUzexN4
         Kpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692418; x=1782297218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yE860yX5MeluInu/xHweWVTpSgNi/lSdv92MvT4+EVI=;
        b=KWka6gEYl4O2gFrq3lOrMSb2kK8lYRKE99jKUMhN68SB1zP2XiqVgpVW/AvOeUyWGZ
         A4fb6i+mHnvKFka5eQnbEBpTMQuMKg9S2rM66+CLDE6ure6inqrqKOy7fcDjNnUPvzur
         KTUK9JQq4UDMLciXuXYLRVhR837MPkTp5kozkg1fha6qT2ynnd1guLoxyVJElf/Wc1R7
         UbeCYocdu3eYZrdsKrBCtMHxUwDRRWrG03+q+Xw8Yfc/vVOH2dZ6fS8c9D/ZB7ccfOdY
         fFbGqb1iZ496MsN4qxyckMM3Hssh+gJUcKag1f+vbjs9+YZk6O253rpZThraWmlOSwbW
         iNKg==
X-Forwarded-Encrypted: i=1; AFNElJ/Qu9GFFufQYZRHxcJ6EflZPO4mGIRBhj+XD8qjqZat7n6sKIRCRhNBDSD16S4rvyqDk3SjL5ge1AzwLnEhoNxF@lists.infradead.org
X-Gm-Message-State: AOJu0YyHEVnQUzH7kE+JUOz1gHYSwbfzhd2qeaqjnpup3iPgSFDmKxYZ
	/I+ylvl4QYHmAjooWJJfrVg8t5905wR1m0wuvvvlqE4y0xmwyoCZlCNy
X-Gm-Gg: AfdE7cldH3RjHLq49KniYf4eLeWR+ne7zqFnye+YO2k99ITTXR+z5Cvh3f3qP99cqZG
	6j4F/5cfUo+eYSpxeRQ9yJvHlzHpnrIZRk+O4+m+kZrZHv80ihJe4FuuF1m11SwBH31JjdrFTMr
	u+acOupuuLKHjsR0GwTppzE+uAG6dPDARm6PoYgugYcALJyGejIOepomri/106zIj4Moy/C9/G5
	lXKVwmTxhHPBJQIamCujfb8QLCeZ81MyWVFkAwnmqNfhc8aBHzVMMrkB8YWH6fDutKPlpyzBXiM
	OnWSE04pGMSA05Ct1OOlTZNqgPMa8asIY9uzWwliCZobkHMDSOPmn9UYlwAfaklv0SRm7JTqWem
	83tGjanDT1v9PL0HydBO/9kHFdqhXlILxgl4qvOmG9C6XCk9K7V1NCBQzdp1XQHyuQJkQZX8Wzq
	QEKV9aGkdvWpPQRHGqRtpuN9y+/mM8yYJPn3iYO9dvKC1u+4s=
X-Received: by 2002:a05:7300:a599:b0:307:286d:c14e with SMTP id 5a478bee46e88-30bcf72520emr1179356eec.17.1781692417477;
        Wed, 17 Jun 2026 03:33:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:37 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/78] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:21 +0700
Message-ID: <20260617103235.449609-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033338_586509_E880DD54 
X-CRM114-Status: GOOD (  12.14  )
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
 sound/soc/codecs/arizona.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c..77bd02def9c7 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -1158,17 +1158,16 @@ int arizona_dvfs_up(struct snd_soc_component *component, unsigned int flags)
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	if (!priv->dvfs_cached && !priv->dvfs_reqs) {
 		ret = arizona_dvfs_enable(component);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	priv->dvfs_reqs |= flags;
-err:
-	mutex_unlock(&priv->dvfs_lock);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_up);
@@ -1179,7 +1178,7 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	unsigned int old_reqs;
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	old_reqs = priv->dvfs_reqs;
 	priv->dvfs_reqs &= ~flags;
@@ -1187,7 +1186,6 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	if (!priv->dvfs_cached && old_reqs && !priv->dvfs_reqs)
 		ret = arizona_dvfs_disable(component);
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_down);
@@ -1199,7 +1197,7 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1222,7 +1220,6 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_sysclk_ev);
@@ -1657,13 +1654,11 @@ static void arizona_wm5102_set_dac_comp(struct snd_soc_component *component,
 		{ 0x80, 0x0 },
 	};
 
-	mutex_lock(&arizona->dac_comp_lock);
-
-	dac_comp[1].def = arizona->dac_comp_coeff;
-	if (rate >= 176400)
-		dac_comp[2].def = arizona->dac_comp_enabled;
-
-	mutex_unlock(&arizona->dac_comp_lock);
+	scoped_guard(mutex, &arizona->dac_comp_lock) {
+		dac_comp[1].def = arizona->dac_comp_coeff;
+		if (rate >= 176400)
+			dac_comp[2].def = arizona->dac_comp_enabled;
+	}
 
 	regmap_multi_reg_write(arizona->regmap,
 			       dac_comp,
-- 
2.43.0


