Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8097FCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=; b=VA39nxD/6rpKP5f/6ytAybNI6Z
	8Lb/Qekcd5iy/x8IU8P1ZmLK3uGBEuO0hOLyweQH8yhsxf10jy300JzH774RUB0kOPoeId3RCFAl8
	otsBeH/H72EGnux47Jqhsdp9gJS3Y/yxAdhwmT/zQpLnBZ9Fgjk8v0s74Sy6Ql0bT1VOvObAWuawQ
	Hot2x384MMKG5C8kP+exlGNbezE52izTTKqJbcCElLfdMB2BPBrvfZah7SuddAzC6xyftSI4MzIF4
	8pCV9JGikAyaFCEOdaMzKXOMnAjr78uYqNNTJo07AjXE6CHUsYgQ90RMKO41FbRK1Kh4zDYzO4+gr
	sZ090hqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74K-00000002EAm-1PQE;
	Wed, 13 May 2026 10:44:00 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74H-00000002E9H-19Qi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 10:43:58 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c801912c903so3071383a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 03:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778669036; x=1779273836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
        b=pJA3c2QXLpajuJi5dzFniaQhGZGptX21kas7pd/+KE5B445sHh9itgXDuy+iWdl5r8
         QVW06mr4emNccy8TjaH1Wr4Ku/yUuSOPT9fO8YKG7rn3krbSgzFo/EOmzU7TOlOGLbQu
         Bls/Ju1dwt8pNlW2yxbaZNU53JWlcLsh3ay+f3zfpzUP+PhxOO0z7Z4KNg0xWFlGe6hQ
         J//xctFYaJ93t8KLMHWzkGHBjUp1QhUq34/8D8p/wzYeb3LbeVB4j3U3nPBXk/rYe9qP
         mf2SwDyHPfP7k+Uxsudgr1frPfCNpgdEtZvExnUcVge9uj0agNuDVGMO3FoedYX5vyYD
         zFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778669036; x=1779273836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B1yp7453+aCL7dXR5kUmqcZGPzPOdPMr0TKvujORRBA=;
        b=QdghqMCrDXScecmLNDGHzmmroOFCoV6PjkqkF05MIyPmpuF+JGm4RmH5/FsV/rr/wz
         e/lCtXvbLRM33TMNMGs+hJyrW3/aEMWsXe1qOK+tS1VHNKkG7jAO7JsaINOCx7gd+48y
         S8ko1JGLOoxb/l1rf6yXdhrxlBR1AmxRyQh9/viWAuM3q8PQJWueW6G9sErU1k1HgARt
         HbIzw1cljb0g64ANWpMgdNn+ZRscI4sryFE3HhG3MfNVdFXkNPA54gXvlrjAjsSybN1K
         GczhzMjt5P4BKJhpcvEkwjK8ERevBt2kru4YvC6V12RXrJTBvi5Uj2FpXllYlZ7U4QSZ
         zQkg==
X-Forwarded-Encrypted: i=1; AFNElJ+OGVhIpKUp7e3nBfpVSGFMl07huk7vxm1i1qvNx/8eglrh7OQ8S+oLtOomWEI28+5YOnJl3NruLVWJq706vBvG@lists.infradead.org
X-Gm-Message-State: AOJu0YyId73CusjvgypKHAfIfa9y2+Tc9kvCu9exsai2ascuJnZwukWF
	E+sPQL+yO0pSVcTNPOVaHmmyiUCMeuDWtRBtUxUoVu/CrdIyflPoz0ev
X-Gm-Gg: Acq92OE0Iqxue051EsCZIE+Wui9bRTVoJZ9uMn6KeiJQIBn99MEeT/5QsUnI56eF78a
	uSb9lFo05MgImjcgWmMea8YERN7A+fK/usDph7pEGaLgmNR8or4Rwm13wDGo+m7w0Fm/bq1mUBF
	hrdS/PJ1CAza6Lm4iq5ZaSsPXE4C+q/5yTLGDE4y0DZlN4GJh3bmZdfVWPVbg5+5DpdmR0AbKrW
	EJcRxkiAivywx1kv3y9gY5spU7fuAEDv6ESEvvNGBdBJ4vUdsS7SNJAXR9n+PSS669yoHnq4PHs
	MyD5Ia9TzsfL7ZuDIqAAGInAYUou4BjViEzKghA7fHAT11WxrTAF6YPhm0iiIKIAg+4ShMEi3OF
	9218NPcpyH2JyIhYcGiZdcNVxBZSO+sYYVnVCGvLCf6hoMQEqV7PxQFnWwNG1OtsdU+v+ZBHANB
	Bc59gWgLCzkGbbIsgmvWj9PxvfzXAG42a1s0zSKdFbafdczVEN+GhtYcC043mOTo5+YuO8
X-Received: by 2002:a17:902:ba98:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2bd26f75ee2mr21419305ad.0.1778669036225;
        Wed, 13 May 2026 03:43:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm170479535ad.39.2026.05.13.03.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:43:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: stm: stm32_adfsdm: Use guard() for mutex locks
Date: Wed, 13 May 2026 17:43:26 +0700
Message-ID: <20260513104329.81592-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513104329.81592-1-phucduc.bui@gmail.com>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_034357_322235_CC10A05D 
X-CRM114-Status: GOOD (  12.29  )
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
 sound/soc/stm/stm32_adfsdm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 0f6d32814c22..a585cb9fc011 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -62,12 +62,11 @@ static void stm32_adfsdm_shutdown(struct snd_pcm_substream *substream,
 {
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
 	}
-	mutex_unlock(&priv->lock);
 }
 
 static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
@@ -76,7 +75,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	struct stm32_adfsdm_priv *priv = snd_soc_dai_get_drvdata(dai);
 	int ret;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	if (priv->iio_active) {
 		iio_channel_stop_all_cb(priv->iio_cb);
 		priv->iio_active = false;
@@ -88,7 +87,7 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 	if (ret < 0) {
 		dev_err(dai->dev, "%s: Failed to set %d sampling rate\n",
 			__func__, substream->runtime->rate);
-		goto out;
+		return ret;
 	}
 
 	if (!priv->iio_active) {
@@ -100,9 +99,6 @@ static int stm32_adfsdm_dai_prepare(struct snd_pcm_substream *substream,
 				__func__, ret);
 	}
 
-out:
-	mutex_unlock(&priv->lock);
-
 	return ret;
 }
 
-- 
2.43.0


