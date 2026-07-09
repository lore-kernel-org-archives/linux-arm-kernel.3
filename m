Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49541C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 05:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=; b=bZJofak6qxm36czdENp+uLSX9k
	/7QSNk60fVscgOT2x/Bns+yoLbgglz8Xip+0KAe6swKiKogXVkoV3fsNrNGbyl5oSryhupwTUfbyJ
	Hwa+lWluHjlueqQaeQT+d2bdGNtPTkQOjkiRfRJrzFZjUQ/ko2e/1ybdDR73Q9sKTXypKDZH0EiFA
	/5MOwsE9mmPbbzoWOX5g6qmtZqHKqf/Ovc/gjD2pD9tUgQzg0+mb5+RquxNgszEhAzSf1JUJFzw2q
	jtJhndcAl1N+WIDc/5NVqwUJL2CTlQZMrl007iVukQMn5NHWjzyriJ1fJXgpC2nyUf3RX43g7SDU/
	XNx6KTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgrn-000000011t3-3mVB;
	Thu, 09 Jul 2026 05:00:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whgrj-000000011r3-1aeo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 05:00:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3811e59df58so946267a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 22:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783573202; x=1784178002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=ihKmQdKcxpzjQzm/uSlnQu97tEaSyc5l+AOtL7LLCq6yBLmLZXtYlkHWQO+6YtfvK2
         fk7wkqpheQTWK4o/WkyZsbP2XK839aGbJxTnhbUEzvk1+CjlhC1VO8TWnzYiS3jk6qc1
         RUuJEWelE9YDUIUxwKIUOY6XbA+4JZuPV27IbXaZTDJVG+43ltj4TgB/kLBWfR/x790l
         GP72iSPzJbrw8DPYJLKKgX8eSWOX+b+QFVbG7FxvAetaNGuaRnYnLoRt5TDDHyGBApgP
         EfwHIRoZlQHlxOtXintSreg3zBOFZ5UQnyCr3YILye5C2cDVoiN2NxL+QtUSlcjqTw7r
         KTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783573202; x=1784178002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=CygQP5RNuI+6nuU9UuSXwowqij5R7HKqsnEtaXwuhc2mJyv5d7ytPsAJ7XlTalVV0c
         JaspbzjxWvTy0nbwuOsZxH3WLxOVu8NWquFV0wBN7wYguZKePJr3BGDfL6OM18l0xBPR
         RCdWyH8hmwtFx7/W5WaIQfSY9JXCa3UVMYgzH7WV9FuE8ZJPoRa3AyTxigPe08u+50Xx
         sUmRLtBVWcHSDk+q/gZTs+QpeUSJr/prTNcQDMbtXjbkYfeNfxLBHrcPh4awNpF2dlMi
         xuyBXzlTwiBhSe56x3rGQeToZWVi66tH+nMyFf9ideonBSceOGnAGK3oRYcI48cujWnP
         sycQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMaqVyx5Ar8AV+R7T3KN6+z5jse+rwD+mbQoaIGuKXZVS6NgVlMyu7x7FZoDRp1lFhiorZ34VCb8rpiyhmMAJL@lists.infradead.org
X-Gm-Message-State: AOJu0YxoONAWE5Imc+EYGJz/sYU/YxfMgx4+k8K6NinBfoxW7vpXVFWQ
	ZE1uR16hW4qnD5N20H8NC8NjTZOWQaN+hcxmrwEvFzTWHHVNSCX1fMlz
X-Gm-Gg: AfdE7ck0pdgRlySANFJBDrLBCDGMGgeUTxyXxjOsh4jt1nMIBZRDywAcrbU02qZvN9Y
	3XckbRxq06p9MPgdFOvD1BsiZqnfAFvk/7mLclZYB/Lks79aExHj97UH1tfNdLULGW2pchPBQOe
	hGr7iAKEhRmraMyiOReOOkOISSGy9cRPmFGrBDw3afDED8kRZzhYqqYyqqKNLhz7rmxuHzUwQOx
	tbDdNXvHkpiZctSgBr9WRYTqzrH5QhtkFQE5JDvmHo/Gell2RHV8+IIzxbulQ8qTLOVg02qayvo
	qJsBGj8n4wFjC7s/uUU22Ys9ghTN7xixXFwq6lUuK00hGBwDmJttY66uc9h4CVXNY3XxYX04wQj
	x5jpdsPtsiHiWH5vgnmqiFoCR/Eb0o4tvGXmi4UXyUhuzAXfE3+siV/jdGvBdm02KyXSHgC4Rp+
	4QIsPXAqsmxeenXO1+SZ6yqTfG1LnFxTskIzjqh3v1oCoLyeQ=
X-Received: by 2002:a17:90b:5384:b0:387:e0bb:57fe with SMTP id 98e67ed59e1d1-389421ae15amr5296615a91.37.1783573202444;
        Wed, 08 Jul 2026 22:00:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b47esm490481a91.3.2026.07.08.21.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 22:00:02 -0700 (PDT)
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
Subject: [PATCH v3 02/27] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Thu,  9 Jul 2026 11:58:37 +0700
Message-ID: <20260709045902.498848-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_220003_430039_19A2FBA5 
X-CRM114-Status: GOOD (  15.12  )
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
 sound/soc/codecs/da7219.c | 62 ++++++++++++---------------------------
 1 file changed, 19 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..f6d371e93549 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -256,13 +257,10 @@ static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -270,13 +268,10 @@ static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -284,13 +279,10 @@ static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -298,13 +290,10 @@ static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -422,9 +411,8 @@ static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock)
+		ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -456,12 +444,11 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 	ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7219->regmap, reg,
-				&val_new, sizeof(val_new));
-	mutex_unlock(&da7219->ctrl_lock);
+				       &val_new, sizeof(val_new));
 
 	if (ret < 0)
 		return ret;
@@ -1167,15 +1154,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (da7219->clk_src == clk_id && da7219->mclk_rate == freq)
 		return 0;
-	}
 
-	if ((freq < 2000000) || (freq > 54000000)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (freq < 2000000 || freq > 54000000) {
 		dev_err(codec_dai->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1193,7 +1177,6 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		break;
 	default:
 		dev_err(codec_dai->dev, "Unknown clock source %d\n", clk_id);
-		mutex_unlock(&da7219->pll_lock);
 		return -EINVAL;
 	}
 
@@ -1203,17 +1186,13 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		freq = clk_round_rate(da7219->mclk, freq);
 		ret = clk_set_rate(da7219->mclk, freq);
 		if (ret) {
-			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
-				freq);
-			mutex_unlock(&da7219->pll_lock);
+			dev_err(codec_dai->dev, "Failed to set clock rate %d\n", freq);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1296,13 +1275,10 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->pll_lock);
-	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	return ret;
+	return da7219_set_pll(component, source, fout);
 }
 
 static int da7219_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
-- 
2.43.0


