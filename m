Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EFACD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6I1cU0uB+Ybu2EHEeduQ3ny6eKqLEtOuo8klPvt1zY=; b=hZU2/AaEDzLd44vtJ2m69mA52a
	5VTrNwjrNv8QifWnRtWxaMNd7sY4HIF/ccIvIosBSn4EWjEY/dVEIWyeu96A/BNzZ86HnQ3mogcFR
	qKm8HgyNsYdb5ZAAHvCFzkuQVzGcx6vmNeOTiloZZR9Pm1Hr2AwItjFAH9M+p9rBX9WsZvt2UpCvL
	HFqSvPGbFoSPylfU5H113wNapYJVzr9q9sL9wX+yAp+/6/Cm54ThKovz48HHaqWNg++nIKdjgzO3Q
	9HfTkyPvPqss4qdAOjUS9MpYRVWEWF+1pmkyrzfLQdGAez2sIQNlIgcG/ZhSy76YZJPW/GUwDRAFJ
	vg5738Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcl-000000019Dh-2kT6;
	Thu, 18 Jun 2026 11:09:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAcj-000000019CI-3bHl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:09:31 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2bf2247e38eso9685545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780969; x=1782385769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6I1cU0uB+Ybu2EHEeduQ3ny6eKqLEtOuo8klPvt1zY=;
        b=TcmM3Lu2mj/AEZdiTG/XnpWPFfX60uo7LP2GiyJSNtYBJI+xdriAl2EbPUc3Udev5v
         UrQqyJr2IXNHE6FoTJmqMpPiAtCvn74GDiU+Db+1xksgdJZjznEl2bOva8byzZQ1NlpB
         tgjXO1ivkcCg5gbc+09TSf5qm+zU7ChnH2Vukwl0AsC4bufx2+g0Bh4EuL8KCNPRb0SZ
         dEN+zfzs4wUlxqEbM19YRGs7xjjnpjoof2I2SsRA1nqrZt7mHCxuqA67m/GmowUMAWMn
         F/VSDvkte4wfR0NTPePtAIhVz6pJTJmNGp/OIhG4lS8KtZKDXWtHyoo6T/LqS+hxMT/J
         Hx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780969; x=1782385769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6I1cU0uB+Ybu2EHEeduQ3ny6eKqLEtOuo8klPvt1zY=;
        b=a68/pUr5Mmz1n1tge5mgIAlcwz/mBx/DpwixHzf2ypkhtCtN90FBMR1plVck7qaP4A
         U90bi8+RR5I+9jFjcbWSptjyTJssnuYLUK44P1tESgek3PW4zqSnt5g996/CrxxjabJW
         aMSF9IoZRu2jTBjdbR5mcxeVYzjw/WmZnnIX4bM8pAg8Lyt2uQZZWqpvEloOQlTF14Zt
         EN7ASLywXZZSN56QE0xnVXiA1TRBgk9XTfrAKB9FbMwxgi7T47RaSr+Twajh6zOIGcvX
         CdwH1XBTn/ulfSw4G0DEeBaVMECYYwkURmHnQ8YCSoLb7Mi4XsOdgylbuW4MrL44ithM
         QyJg==
X-Forwarded-Encrypted: i=1; AFNElJ8qV+h5y7ysLA4Mcp7CySAa6TwDhsc+TgkADaHuIYSK9D2C6WgGCyZIg3tN2BR494/kQzRqEDKGAx9ajTMQ5aY9@lists.infradead.org
X-Gm-Message-State: AOJu0YxKy/Oss+XgqCdJiolVLGsvmKG04WlVJuRVqORDvB0nhxy7Y5JU
	R7IU2ZRI3iSRa8fPvhMMW8nc1DoWcmI9KaoKzNLfpbhrzV+ceK9JFN4G
X-Gm-Gg: AfdE7cmR4kQwkIxJTzoa4pq1lLulOhknTviXuAqkoz4Pp8uwjC2ifsp2+SRYn93UCB5
	+igTeDX77BlKyoGhQtV2mqgiBgKf8SSIXPHcNKBPSYHcpvQaNrkWy6j9im0CM71yvgLovMBZX2Q
	pChYDkB3CoLg/lmXwChPEqAsAG/bwqDdF58CWMO2XR8ghpllEJyXw87yFRsDArWjNV85fYr6PnZ
	NNiYOpKPR6X09nJ/5j3rhB5SRp0nZyQhhYSRfkXgZp0aA9k/2J9a8hmt6z9vuFvltDMauePdGKu
	FydOissYsSIh1ULb2zME1Jx58OoxVsAx/bdi1ar4jRTcbB2SdaGjf5GuQJX2sf3dRygGnV4jJc+
	MdgZbzJw30yTaR6VJ0xnxDI/1SM/qDfEKcJ7sN67jV7Y92hKx79LxFGUjJ4EwdW7vivsHxR5UgS
	Yh8Ic8bIe2viMTljwoyLnIcaQ8dR70gIzcjScnGkU68eyO+89Nk0kzsVaacA==
X-Received: by 2002:a17:902:d58d:b0:2c0:cb90:1dfc with SMTP id d9443c01a7336-2c6bc0b5952mr91663075ad.12.1781780969257;
        Thu, 18 Jun 2026 04:09:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:28 -0700 (PDT)
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
Subject: [PATCH 61/78] ASoC: codecs: tscs454: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:10 +0700
Message-ID: <20260618110827.232983-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040929_905437_E68E7B93 
X-CRM114-Status: GOOD (  14.46  )
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
 sound/soc/codecs/tscs454.c | 106 ++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 65 deletions(-)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index aad394937ce6..af0c21ca3a16 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -329,12 +329,10 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(coeff_ram_lock);
-
-	memcpy(ucontrol->value.bytes.data,
-		&coeff_ram[ctl->addr * COEFF_SIZE], params->max);
-
-	mutex_unlock(coeff_ram_lock);
+	scoped_guard(mutex, coeff_ram_lock) {
+		memcpy(ucontrol->value.bytes.data,
+		       &coeff_ram[ctl->addr * COEFF_SIZE], params->max);
+	}
 
 	return 0;
 }
@@ -428,15 +426,15 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(coeff_ram_lock);
+	guard(mutex)(coeff_ram_lock);
 
 	*coeff_ram_synced = false;
 
 	memcpy(&coeff_ram[ctl->addr * COEFF_SIZE],
 		ucontrol->value.bytes.data, params->max);
 
-	mutex_lock(&tscs454->pll1.lock);
-	mutex_lock(&tscs454->pll2.lock);
+	guard(mutex)(&tscs454->pll1.lock);
+	guard(mutex)(&tscs454->pll2.lock);
 
 	val = snd_soc_component_read(component, R_PLLSTAT);
 	if (val) { /* PLLs locked */
@@ -446,18 +444,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to flush coeff ram cache (%d)\n", ret);
-			goto exit;
+			return ret;
 		}
 		*coeff_ram_synced = true;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs454->pll2.lock);
-	mutex_unlock(&tscs454->pll1.lock);
-	mutex_unlock(coeff_ram_lock);
-
-	return ret;
+	return 0;
 }
 
 static inline int coeff_ram_sync(struct snd_soc_component *component,
@@ -465,41 +457,35 @@ static inline int coeff_ram_sync(struct snd_soc_component *component,
 {
 	int ret;
 
-	mutex_lock(&tscs454->dac_ram.lock);
-	if (!tscs454->dac_ram.synced) {
-		ret = write_coeff_ram(component, tscs454->dac_ram.cache,
-				R_DACCRS, R_DACCRADD, R_DACCRWDL,
-				0x00, COEFF_RAM_COEFF_COUNT);
-		if (ret < 0) {
-			mutex_unlock(&tscs454->dac_ram.lock);
-			return ret;
+	scoped_guard(mutex, &tscs454->dac_ram.lock) {
+		if (!tscs454->dac_ram.synced) {
+			ret = write_coeff_ram(component, tscs454->dac_ram.cache,
+					      R_DACCRS, R_DACCRADD, R_DACCRWDL,
+					      0x00, COEFF_RAM_COEFF_COUNT);
+			if (ret < 0)
+				return ret;
 		}
 	}
-	mutex_unlock(&tscs454->dac_ram.lock);
 
-	mutex_lock(&tscs454->spk_ram.lock);
-	if (!tscs454->spk_ram.synced) {
-		ret = write_coeff_ram(component, tscs454->spk_ram.cache,
-				R_SPKCRS, R_SPKCRADD, R_SPKCRWDL,
-				0x00, COEFF_RAM_COEFF_COUNT);
-		if (ret < 0) {
-			mutex_unlock(&tscs454->spk_ram.lock);
-			return ret;
+	scoped_guard(mutex, &tscs454->spk_ram.lock) {
+		if (!tscs454->spk_ram.synced) {
+			ret = write_coeff_ram(component, tscs454->spk_ram.cache,
+					      R_SPKCRS, R_SPKCRADD, R_SPKCRWDL,
+					      0x00, COEFF_RAM_COEFF_COUNT);
+			if (ret < 0)
+				return ret;
 		}
 	}
-	mutex_unlock(&tscs454->spk_ram.lock);
 
-	mutex_lock(&tscs454->sub_ram.lock);
-	if (!tscs454->sub_ram.synced) {
-		ret = write_coeff_ram(component, tscs454->sub_ram.cache,
-				R_SUBCRS, R_SUBCRADD, R_SUBCRWDL,
-				0x00, COEFF_RAM_COEFF_COUNT);
-		if (ret < 0) {
-			mutex_unlock(&tscs454->sub_ram.lock);
-			return ret;
+	scoped_guard(mutex, &tscs454->sub_ram.lock) {
+		if (!tscs454->sub_ram.synced) {
+			ret = write_coeff_ram(component, tscs454->sub_ram.cache,
+					      R_SUBCRS, R_SUBCRADD, R_SUBCRWDL,
+					      0x00, COEFF_RAM_COEFF_COUNT);
+			if (ret < 0)
+				return ret;
 		}
 	}
-	mutex_unlock(&tscs454->sub_ram.lock);
 
 	return 0;
 }
@@ -658,16 +644,14 @@ static int set_sysclk(struct snd_soc_component *component)
 
 static inline void reserve_pll(struct pll *pll)
 {
-	mutex_lock(&pll->lock);
+	guard(mutex)(&pll->lock);
 	pll->users++;
-	mutex_unlock(&pll->lock);
 }
 
 static inline void free_pll(struct pll *pll)
 {
-	mutex_lock(&pll->lock);
+	guard(mutex)(&pll->lock);
 	pll->users--;
-	mutex_unlock(&pll->lock);
 }
 
 static int pll_connected(struct snd_soc_dapm_widget *source,
@@ -679,15 +663,13 @@ static int pll_connected(struct snd_soc_dapm_widget *source,
 	int users;
 
 	if (strstr(source->name, "PLL 1")) {
-		mutex_lock(&tscs454->pll1.lock);
-		users = tscs454->pll1.users;
-		mutex_unlock(&tscs454->pll1.lock);
+		scoped_guard(mutex, &tscs454->pll1.lock)
+			users = tscs454->pll1.users;
 		dev_dbg(component->dev, "%s(): PLL 1 users = %d\n", __func__,
 				users);
 	} else {
-		mutex_lock(&tscs454->pll2.lock);
-		users = tscs454->pll2.users;
-		mutex_unlock(&tscs454->pll2.lock);
+		scoped_guard(mutex, &tscs454->pll2.lock)
+			users = tscs454->pll2.users;
 		dev_dbg(component->dev, "%s(): PLL 2 users = %d\n", __func__,
 				users);
 	}
@@ -806,7 +788,7 @@ static inline int aif_free(struct snd_soc_component *component,
 {
 	struct tscs454 *tscs454 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tscs454->aifs_status_lock);
+	guard(mutex)(&tscs454->aifs_status_lock);
 
 	dev_dbg(component->dev, "%s(): aif %d\n", __func__, aif->id);
 
@@ -829,8 +811,6 @@ static inline int aif_free(struct snd_soc_component *component,
 		free_pll(tscs454->internal_rate.pll);
 	}
 
-	mutex_unlock(&tscs454->aifs_status_lock);
-
 	return 0;
 }
 
@@ -3174,7 +3154,7 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
 	unsigned int val;
 	int ret;
 
-	mutex_lock(&tscs454->aifs_status_lock);
+	guard(mutex)(&tscs454->aifs_status_lock);
 
 	dev_dbg(component->dev, "%s(): aif %d fs = %u\n", __func__,
 			aif->id, fs);
@@ -3207,14 +3187,14 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
 	ret = set_aif_fs(component, aif->id, fs);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set aif fs (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	ret = set_aif_sample_format(component, params_format(params), aif->id);
 	if (ret < 0) {
 		dev_err(component->dev,
 				"Failed to set aif sample format (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	set_aif_status_active(&tscs454->aifs_status, aif->id,
@@ -3223,11 +3203,7 @@ static int tscs454_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(component->dev, "Set aif %d active. Streams status is 0x%x\n",
 		aif->id, tscs454->aifs_status.streams);
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs454->aifs_status_lock);
-
-	return ret;
+	return 0;
 }
 
 static int tscs454_hw_free(struct snd_pcm_substream *substream,
-- 
2.43.0


