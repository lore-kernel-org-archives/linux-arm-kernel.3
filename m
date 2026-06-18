Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A76CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=; b=hwQOZu9A3GWCcLacJU8yYQSgXA
	+S2yFz3rYkRvcHiaKuJCTuNpg3bfvl5IG1hdh3+GhXrmwQlQP0ToLYkXHjViEz+vGjvPMjxV5j9LP
	A3ya6ccq2eLZwHCXzyGqb+EbidbBgwc15+J2q3KPRVgcWFWZ0lYNwrvHgB9YmwRvHBgppiC/dMTHt
	WViRJ0ZuYQeOUY25TkInHjCZxSF/+7JxmdbulJR9slr32TddqO8U67OHF9xvCLzbog0ICPXPm5MAa
	PanZWBcLeuQl8pcxP2AeEZ9Q5fKjm/tvK9xIlBknotNoeyIdgm4hGpFYEr+Gy/+flF7VvBYsfu4g9
	RDmkgEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAce-00000001995-2EzV;
	Thu, 18 Jun 2026 11:09:24 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcb-0000000196x-3naA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:09:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c6bb8a5980so5691275ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780961; x=1782385761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=;
        b=fhIZDRnIR7UhN/2JoRhIp6YMKJRJFS2S1JVR2RFKdKelHCp/zyFXrpbLXvzVRgqecr
         7+tQKUM1dYgpedZPmmkdo/w7K17ZZSbnp9gEflOffRGeSnyacm1lx+h2IZVFXkGImqgo
         pKRCZBgKl5KLAotsy+WNuulVCUFzkiP1KA5BSft4DzSAr8Dzf33n6vZPf5YJdytCkfmx
         3ZmYyEwhsr+wIg3SPrT1KqIGbRiVC+bqPJuPDfFRNQqnd3cCbjYGU6wv+CTZpjaxhQql
         41iowK5WzRvPdVJLm5Wx6XNJAv8mV1PV4OsUleAUOuieJAJJmF2Zv7k//p6CEuIAxzRe
         9T9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780961; x=1782385761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=;
        b=XnqkMq9rYqgZQoSw6k6e0ln5ir1sFEkXpGGYZlQgl3qyf+dCNyGUhNUNjefAGcMFNW
         xYNKrZ5+PteEm1glM8oLpXSjQgp6obUPGBtLJkUTJ+723HFk254OJBI3rTVZ3hG+LNl9
         +9lLQV6j+EwtQA3kNfrNhcRva9DoIY6u7omAXIuPsUKwM/mcN81UosZv7/0ebvsl/hod
         FXlygX5UHZfkUGeukD3mpQ5eizrmGgBBMPKQCziXFShGHocp9IAhcCznVALwKOmAFE10
         XR97LR6TqkgpkzGyZOfdn5vplfeSAWPclrrFQRLitWIUGULEz/VDGkes/tnboltkZM/V
         QmMA==
X-Forwarded-Encrypted: i=1; AFNElJ/AIU8+pHssxmxPd32VzkA53CDK8cf5o0pwKQQMZ+XS4Ks+KgzqoFlRTSdigzV8ce9C1CZAm3HPbnb9sF9AJqOP@lists.infradead.org
X-Gm-Message-State: AOJu0YwLWItXQsuPuqj478zrDpQ0aqKqueGlr6V98Y9oTESnLOSzg7Ss
	3TFSVPBqn0qPok/vuASOIui4Z7XBlvsQL8PUwgz8cADUGnHGehx0fd5l
X-Gm-Gg: AfdE7cmIkTwhHuyj/melCWbH0LLx1QzQ9SUKjnFtKfDnbOB5Joth6nVi98Lw9kZY+7s
	IsNMqxOfF3bHfCTHp64J2ypiJXtFbgCPzwizi26dIeixW5wfxOzwufVhSE0p2cj/5eF3CrbQJ8I
	JynMDyRYKKDpUjoHj8vkpbj8dAuVDm/igr3Q7ttq1qFsz/M9PkhBAuGKZvmWwhDg8y9PlF1iGdY
	zaSfpUFrA91cZTKMZlbQSTu8F6EAD10N6y+4u8vZzvLhJplrvK1/XF4vnrJuIWkMo71NY4Mkvhy
	eRekpCfrhAWd5KWFJoMVpSn38PkrA5iSlJLB3Cv4dEJe6luFkBmxF4ULq06X+KlSFyiQhFLzL12
	3Q5Y5OtA16QaFN8oavzMEe43QK1djH8tB8IDYOS+LF4dxr0mZhw3qYRU10nzWieypKR62zkOBTc
	ngGcKu3qffvqXBbE2xhrRy6oslj1FmbmEr4aYDZIp33EXfNe4=
X-Received: by 2002:a17:902:f688:b0:2c6:c66b:4b03 with SMTP id d9443c01a7336-2c6e4746cb1mr34135155ad.10.1781780960796;
        Thu, 18 Jun 2026 04:09:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:20 -0700 (PDT)
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
Subject: [PATCH 60/78] ASoC: codecs: tscs42xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:09 +0700
Message-ID: <20260618110827.232983-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040921_958719_842969A9 
X-CRM114-Status: GOOD (  12.06  )
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
 sound/soc/codecs/tscs42xx.c | 44 ++++++++++++-------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index dba581857920..66810b992935 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -210,23 +210,21 @@ static int power_up_audio_plls(struct snd_soc_component *component)
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C, mask, val);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL on (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	if (!plls_locked(component)) {
 		dev_err(component->dev, "Failed to lock plls\n");
 		ret = -ENOMSG;
-		goto exit;
+		return ret;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
 
 	return ret;
 }
@@ -236,26 +234,24 @@ static int power_down_audio_plls(struct snd_soc_component *component)
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL1,
 			RV_PLLCTL1C_PDB_PLL1_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL2,
 			RV_PLLCTL1C_PDB_PLL2_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
 
 	return ret;
 }
@@ -269,13 +265,11 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 		(struct coeff_ram_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	memcpy(ucontrol->value.bytes.data,
 		&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE], params->max);
 
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
 	return 0;
 }
 
@@ -290,14 +284,14 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 	unsigned int coeff_cnt = params->max / COEFF_SIZE;
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	tscs42xx->coeff_ram_synced = false;
 
 	memcpy(&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE],
 		ucontrol->value.bytes.data, params->max);
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	if (plls_locked(component)) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram,
@@ -305,16 +299,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to flush coeff ram cache (%d)\n", ret);
-			goto exit;
+			return ret;
 		}
 		tscs42xx->coeff_ram_synced = true;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
 
 	return ret;
 }
@@ -385,19 +375,17 @@ static int dac_event(struct snd_soc_dapm_widget *w,
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	if (!tscs42xx->coeff_ram_synced) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram, 0x00,
 			COEFF_RAM_COEFF_COUNT);
 		if (ret < 0)
-			goto exit;
+			return ret;
 		tscs42xx->coeff_ram_synced = true;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
 
 	return ret;
 }
@@ -926,12 +914,10 @@ static int setup_sample_rate(struct snd_soc_component *component,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->samplerate = rate;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
@@ -1253,12 +1239,10 @@ static int tscs42xx_set_dai_bclk_ratio(struct snd_soc_dai *codec_dai,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->bclk_ratio = ratio;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
-- 
2.43.0


