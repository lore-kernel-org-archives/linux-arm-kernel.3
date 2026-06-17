Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2228FCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtDDrpvFiW9v2e0+BVdUVB419JMabOyntlf8qyBQjjg=; b=ngjidC0QQ43k3NkO61Eeqh07Fj
	809zjWKdUbDPgKSk3uIK/ztrQ12CbLIJmVU60J2iJcVSQ2ZKDXkw6ev+E4Z01QF56jA8w1hbFypmh
	n2RFUQqqIw6XohD1iF/NjtfSHQakIeFGyaiYoK0q2e4IA1e7XhAxRrxabtUgSV5Puuq9zeuVcLbxG
	92Gbpfn5/e6UboU8Wo/DO3uICpXlu9Q50+rBD65KNLPbH2g+l+ZaMyFZAzcD02uWSQzVvrtqcj78l
	o5cUqYP3icPXlrA6T1lkkQ1Gqrl5WGQ8xp5o59op2fOOdXZdS+ktp9VYfW9Nx8NfLaFu1tA6SOaEk
	WyMvnS3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZncC-0000000H5Fr-1YCJ;
	Wed, 17 Jun 2026 10:35:24 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnc8-0000000H5C0-179K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:22 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-30b6dad2382so6290874eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692520; x=1782297320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtDDrpvFiW9v2e0+BVdUVB419JMabOyntlf8qyBQjjg=;
        b=JyH6rYDpbr3wKDXA5EoYsO4tZrWyqloyKxttBdE1SpEZxwAn5GLtDwgFnWg61ihPgN
         9nEMGZhjNII28MYgZsVek20ZNQ1AWeF5p5VnvaFfH1Uy9yWwSBb0Q+h1kcO19tMweJFc
         ulx9YLc9NMr4nz41rm+hUDVY/wzJ7kutf0dlQ4WqfH75mszM2hzFIy6Kh/cBwXUDhFCW
         84MH5PXbbqrg82gLOp5o/UtakwDuZQPhidurqOQzGv1eN5VJmzbdfi4qYXZvKA7mICwX
         5j0u1djz3A5UcRc0QBCJDZOiibHP6cFCXZ4lO1ie92z4675ZxBOxkR8Cqj6eoBtxtaLx
         XRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692520; x=1782297320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtDDrpvFiW9v2e0+BVdUVB419JMabOyntlf8qyBQjjg=;
        b=YwkJ/bbeHwJeljbu1RLcoZiAbLQZU3zp8CwnnWIeu07nxdUDRTOXmNK9i+5iXVdr9s
         x20hzsflAoG/9YBEAavjI7/IUsJeV+ht/G1MFFI1br/yEpnOSXymVbOwpd7sSkQWoIfF
         3DxeqJqLjaYIlqQzbiVWCa+4oC+HvmRTMfJg+eaVmtWK+3qu2nmXuWzC5kj3Mi3PFLcf
         gKl19ACyIFcOu1Fo4CNFzdKXUXY83TI6ww1uQRvAILgeXSqmuFQ8F/KwVl7t64ziigRd
         J8P8ANjJwrUMA9AWuFs1Iheg6YufsCgTwTuesITCBPUJQw6x3+jCLH+/XuyRlop+U9FC
         qq7w==
X-Forwarded-Encrypted: i=1; AFNElJ/PzA/aRtUfXIPJC63PuKdtVRpFeEjVH5c9lnx2UjT/a2AM0zASRho09JZEwCofru8p46GChAPwE2fWtwInwIQl@lists.infradead.org
X-Gm-Message-State: AOJu0YxMeyWlKHCMJlI9KCUdJ5z/YxePVTeUKny5xSL0LoZmEaEIvoRf
	QagtF7BKmzXUc0glpzlK14zeu8kCexYrbPstkdQzQ/cvf7g+UP3sZmzY
X-Gm-Gg: AfdE7cm8fcnAya3E+oegkxEuj4G2daXlATjy+9rYr8jNb5atSQrz6xZ9k6/zuyWlCpw
	upnLLKq8XAlnZoqs0h46ugZpT27or1I9xFRkdTg1aZ1xGzXU8MImRFqbP1hM8k6sfIP81o+lEaB
	MxXUZdEmsWMZHIr6aWBWlFl1A7+4w06gAgxDMkhZB6cRDA8/Sc0NGbyJYIDAWbziQ4uaOZ97oyN
	/jWJELzpDCdaijSUA3/Nvk3zI++NKmO2Sz8aiQLhSvpnLgBFKQ0FLeMLcWAj1PUEO6MCkKXwJzF
	tfhx2BzXKJkoxExOq0n0RFHoGxS3Jx5ATWNL/7Bk+ssJ0Ra6cnuCRohbJXDmkZpBsX0wsahk/lX
	LUK2+dyO2+kc1dvI+BTv6vwESTTNnZyHHPDJ/i5+GLrY4/JIV+/lDN5+PjHvm/iz4nqKiWJRhra
	q15I/IMpu8Dr0Gvtb3O8hs5g+cvjXX2RMofVzEFHcZcX+Q3ck=
X-Received: by 2002:a05:693c:639b:20b0:30b:e4a3:44d2 with SMTP id 5a478bee46e88-30be4a363f6mr103693eec.8.1781692519548;
        Wed, 17 Jun 2026 03:35:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:19 -0700 (PDT)
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
Subject: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:32 +0700
Message-ID: <20260617103235.449609-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033520_326343_7ACFE06B 
X-CRM114-Status: GOOD (  15.05  )
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
 sound/soc/codecs/cs42l43-jack.c | 57 +++++++++++++--------------------
 sound/soc/codecs/cs42l43.c      | 16 +++------
 2 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 934666295ee3..d6c0f5139792 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -445,20 +445,18 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 		return iret;
 	}
 
-	mutex_lock(&priv->jack_lock);
-
-	if (priv->button_detect_running) {
-		dev_dbg(priv->dev, "Button release IRQ\n");
+	scoped_guard(mutex, &priv->jack_lock) {
+		if (priv->button_detect_running) {
+			dev_dbg(priv->dev, "Button release IRQ\n");
 
-		snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
+			snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
 
-		iret = IRQ_HANDLED;
-	} else {
-		dev_dbg(priv->dev, "Spurious button release IRQ\n");
+			iret = IRQ_HANDLED;
+		} else {
+			dev_dbg(priv->dev, "Spurious button release IRQ\n");
+		}
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return iret;
@@ -477,22 +475,20 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&priv->jack_lock);
-
-	if (cs42l43_jack_present(priv) && priv->button_detect_running) {
-		dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
+	scoped_guard(mutex, &priv->jack_lock) {
+		if (cs42l43_jack_present(priv) && priv->button_detect_running) {
+			dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
 
-		regmap_update_bits(cs42l43->regmap,
-				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK, 0);
-		regmap_update_bits(cs42l43->regmap,
-				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
+			regmap_update_bits(cs42l43->regmap,
+					   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK, 0);
+			regmap_update_bits(cs42l43->regmap,
+					   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
+		}
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	pm_runtime_put_autosuspend(priv->dev);
 }
 
@@ -895,9 +891,8 @@ int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 	ucontrol->value.integer.value[0] = priv->jack_override;
-	mutex_unlock(&priv->jack_lock);
 
 	return 0;
 }
@@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	if (override >= e->items)
 		return -EINVAL;
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
-	if (!cs42l43_jack_present(priv)) {
-		mutex_unlock(&priv->jack_lock);
+	if (!cs42l43_jack_present(priv))
 		return -EBUSY;
-	}
 
-	if (override == priv->jack_override) {
-		mutex_unlock(&priv->jack_lock);
+	if (override == priv->jack_override)
 		return 0;
-	}
 
 	priv->jack_override = override;
 
@@ -983,7 +974,5 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 				    cs42l43_jack_override_modes[override].report);
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	return 1;
 }
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f0d6ff0b2976..72c5c0340c48 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1208,14 +1208,12 @@ static void cs42l43_spk_vu_sync(struct cs42l43_codec *priv)
 {
 	struct cs42l43 *cs42l43 = priv->core;
 
-	mutex_lock(&priv->spk_vu_lock);
+	guard(mutex)(&priv->spk_vu_lock);
 
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, CS42L43_AMP1_2_VU_MASK);
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, 0);
-
-	mutex_unlock(&priv->spk_vu_lock);
 }
 
 static int cs42l43_shutter_get(struct cs42l43_codec *priv, unsigned int shift)
@@ -1602,7 +1600,7 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 	struct cs42l43 *cs42l43 = priv->core;
 	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
+	guard(mutex)(&cs42l43->pll_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1627,8 +1625,6 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&cs42l43->pll_lock);
-
 	return ret;
 }
 
@@ -2566,13 +2562,9 @@ static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
-	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
-	ret = cs42l43_set_pll(priv, src, freq);
-	mutex_unlock(&cs42l43->pll_lock);
-
-	return ret;
+	guard(mutex)(&cs42l43->pll_lock);
+	return cs42l43_set_pll(priv, src, freq);
 }
 
 static int cs42l43_component_probe(struct snd_soc_component *component)
-- 
2.43.0


