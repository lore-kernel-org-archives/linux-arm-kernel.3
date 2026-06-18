Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1556CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=; b=QRrjCGhu5GRqPmdIrGDJJj4yF+
	m9FaE6iEKIqkDemi01hBIQ9hMq5qtU0m8RElgXu0AMfsK/W+bBMUewJxsVbh9HGJ+sMW7K9VFTxuW
	cdGlmOQ4GYrnh6wGLCX2A4oFKa4WXe4Ju3gwSM1bL8IpfOpcGlFbMZKI467oTown/WshMzdb05kRl
	e2nPKnHcDTloKJR7ps0n0ZgyhmDgnpH1KqKWZ1OplmzuoRJRiCr6T/5mB4KlCiqApsYRXDnPjjxcI
	sj/PiVf6T21H/U0fExsxyGptmz2isyxRfo1k37opMTMy2q+JA/A1muM9wt11ZMe/H1SU7dkcptIS3
	DJyIeKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAds-00000001A8n-3XXV;
	Thu, 18 Jun 2026 11:10:40 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdq-00000001A69-1OyC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c40397e746so5406005ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781037; x=1782385837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=;
        b=G1Q71DFO6c8/PCHNsDPj4S+CL3RZtSSMy+rd7rIyO065MXw1g1dTFsAvzUhT2MRBWj
         TZ9hiq+MbDiRLhFQGiJpDGWKwphNy9zIDPSBcGPRJBy8zVylX3wxdgRyKLIF+xTX8cDW
         9Crmr+WUKju1BkdvhH3lfsZUgfi+zC2lBEJr7FDeAVIGiC8Pe2fU85LtOdVYOqCna9qi
         QyIh7twxIfqB0TaaxB/7dcuwlYOUsMNKKgb4g+YI99Tx3gNnnxHiC8NyeoWgmOWw0naB
         QQeZz5ALT0bf9hQbdKnKalamJctfzql40nIBfRMbL2OT3dJiYMsaGMP6mToHcAIl3f8m
         6trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781037; x=1782385837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GCvpI9caCdCJQKq9fbLR0v07NU2fYhKI7H79tQqdsi8=;
        b=IaDltuXcyq/v1mClMVDnt4tcqnkFZyl3XYfmNnBa3S69mn/ZV7Td3zPUHrj6F20ms4
         pxVVfgQlLDhSN/zsKwgfIwtIU2qbrBFlPmFZ2H0Dztjm3UHwsHA2nc3oe7epYcmSmVNR
         j0kf5qDLlshhjPolENC7xjkQ2DcyWmaBrxE9ZL7PUvLKPJ+Yu+E39s/+4XOeIkKvmfZm
         /30Jsp5Z7H/e9Dw8VWIq74z9GwmWIRx3UuILW/2pHyfSIiRvAeZxt3/f3ND5K+ZuEqHw
         mqciPDIco21BAntkSYQIsQGerA/fUMKI6deELR0b8jyPHTu4jqVVqLO1LsF8lnAxG7Nl
         Eedw==
X-Forwarded-Encrypted: i=1; AFNElJ+4cJDj6p0RziXI2wV3HqLFjoxM9Ypi4yq+7LqGtJuxhapKOEhOm4jJLq3WXu4TA8poYi+FIrA9F5iDdnxBzfkA@lists.infradead.org
X-Gm-Message-State: AOJu0YxViLCBwZkUJkKCVP/WXieKMSIImQOMEVlhKFAGC4qi07CbO8to
	Wl5bil093t/5JksByrCgACsEUfUlPVu+IRq9zdWXAI/4JAU894y6dbsV
X-Gm-Gg: AfdE7ckt+bxDTdVt0M4mgYDoyjxITet5eFjAMUSIBHcWOYTvStSf70fLl4kZuJwJdam
	rM3oAdsY+0FBfE6sUbQRErAZjpedpicBK57rSfhqnpFsMyKdf+OB0+55cHnLCoHlszzORNAgLra
	Hep4W4WgyYPQOd03n1KGgjiM/gtfvOHN7J9YvPcoq0Q4E64bJ0aAqmMmaotbPqkvROjADi3cyqo
	R/jNl5UNH7LKMCvQht3/0W1HzR7rQOX40QRdPCOwa1TByHy2Pi/DlblYndmwCl8RgyFk7Q9Z2N9
	kyT/RcvkTv6MXIgyUtCv5+w2N121iQ1r4dwq0jVc95TAmauMT6MdZM8Pm0QLkMZRy3cjWFTPwos
	/xM2CMz9tN3KE/h7CjdQZDEmug/N+GC2Yc9fGYVC6OiiGpNFCKmuPT/m1J4WdlBRa4BpnQDcq8j
	pKgmtMji3dYDmkI6AvueCCkNPc3/Vb7bYWZywrbMXQnCs1Z+A=
X-Received: by 2002:a17:903:1a6f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c6f340c78cmr24378815ad.1.1781781037629;
        Thu, 18 Jun 2026 04:10:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:37 -0700 (PDT)
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
Subject: [PATCH 69/78] ASoC: codecs: wm2000: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:18 +0700
Message-ID: <20260618110827.232983-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041038_375848_A1A7E63E 
X-CRM114-Status: GOOD (  12.74  )
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
 sound/soc/codecs/wm2000.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 9b68ee69324b..775f138fdf3f 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -612,20 +612,15 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int anc_active = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (anc_active > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->anc_active = anc_active;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
@@ -645,20 +640,15 @@ static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int val = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (val > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->spk_ena = val;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_kcontrol_new wm2000_controls[] = {
@@ -676,9 +666,8 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
-	int ret;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		wm2000->anc_eng_ena = 1;
@@ -686,11 +675,7 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_OFF(event))
 		wm2000->anc_eng_ena = 0;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_soc_dapm_widget wm2000_dapm_widgets[] = {
-- 
2.43.0


