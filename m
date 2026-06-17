Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE69CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=; b=jWcLUAHc+7fwge53RWNIEVaNmq
	RhK85dmbYMoe5fyhaZN7IX4OSVjKore7Z3m6Mp5qQaHyaMLEXvzeq5Yz9snnCMfaXbDacdBGHS1NK
	vEtAKbK1gzTlQOgNhZBVVX8qU7jB0C57sl1kUECHcQpp9VDvekQf6o8xrUKbsQK8hvavyYQ6DLQs8
	qFkMe/ffJdrvtpf9UxbMnwj6HVJ3Egr9psI+CxjyljxPL3hnYSlFp7vfHvfGVe4015Wuv6P23atNr
	3eeblKNIyWDsESisSl21m73T5+CaTDC3OMwnsk6IlLolSULvghYWiA69sduXxX03cHVu3tQe1wUTO
	dW/oLRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZneh-0000000H7Pd-1oWm;
	Wed, 17 Jun 2026 10:37:59 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZned-0000000H7Lm-1CFH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:37:57 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-30b9e755555so4897992eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692675; x=1782297475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=rfNlha7t6TfDeydDzJQufKwGUspHtGxPt23GKbyp0oXQ1jvamg5Tw9wamC04PZYCrw
         JjEGcvbRwcfbjBucvEZbzhg9lZhcfAVhaB99FfooWcQzh5Rf9Z9vRVlHUtJ1gIJxl004
         OqOJZbk5M3vwI+ufP2ACRxV+/RoJKRVPH81UG25bM8Mm9pLhP+KhWYM5cVLSrPds/e7U
         UtnWgj1st1NDfPyUm8BE058uXpzr6eWHQnap5Zj8o9AEFIBHgqFv6z8XVOui3GJlL4UT
         ZKFuQpwH11lA1ODtgqgTOP8rEzb9YC7yzPj6D9sePHofVu1Vk5e3JLMfP/Sh02E4xAD7
         suAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692675; x=1782297475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=cfZT/z15ay2AMJlBzZ6jiVfTFFrqfurLb2PHcdMUzA4Bb2fzRiBvFNE3IjUuPVUGgE
         yz3oSS2/NDixAKg3ZovNMg0F49DDA04l/58psBJurSiMZ++/6kRzAVDWzQPVWU6aouNO
         Dvv8pxlli9sn8FWWXDyj1Xvnp+FJm+XH763vE7n+oYQPUp4Yql7w3cy2xC4VZesGBIFi
         XtbTOylOWtuVmsiSie0EMf46P/21lWt2f/P3uuRI5XZwhU+WJBoEfrjeqKZKwISw4i0n
         f4tDRMOtCEsK/s9ri4iETADQ4a/2wRt2ueAoyDihf8k08ajOCIkKYq+Gm4lRWk7Nbe/m
         GTxA==
X-Forwarded-Encrypted: i=1; AFNElJ9gYzdBgw2MNfiZE3Hzm+T4STKHOSCUkF/bZSW+Nv3x/V3PUbg5MHVMnomb40YcD+nro1dCk3YwFwAp4GDivLcC@lists.infradead.org
X-Gm-Message-State: AOJu0YwCU7f+74mxoMj7i1ZvTdY8SWyapnjb6D6CUHVovu3vmH9+oNFL
	ZKDboNXyh+sub/RJaP9pBExBiITRA72yFt1U3BL981cQ1PhPnbkGCUEn
X-Gm-Gg: AfdE7cldFU/eK4VtmXNGUfwyC8oZlYg46M3MG8owWp+4hVFLxBlVL1f2Qs6iGcwkX+r
	P3h/UyWj4yzDgPyHRkTiAvjCBKGSa9y4rOYxVCRZzETYQ+J8AV2PROLj0EvOid/h0/ykLkZCBxh
	mSOjJvj42V8HK/6oa0Q5vC4H224kBLUaI58XsPOb/oVzAUn4x6QEloO5UE5iHeLT0X4Eil5exYn
	u+iuwp939yze0iaP1XgEYV0/hueg83xHT583Jd+BnMycXKy8XoB8e7c1QoybV5+33pxc0J7FvYM
	n1DJ35mPsigbHH3Dq9HzCqCVQgDaTr+lsZrTRIfjZrceM6489aR4ZfVxYlVfwPyDgHg3A4scJjn
	ATkheN+0gCgOXVMhcsLW8T0gE9eVSLnHy3bupv8TXei8OLEKAL6eRTVgJYaFGjSSXKtlzdkd9De
	JRKcg/nlt61J3MfPJPQj5dKqEcd3vb2bKpjsG/qO4kkgRKKS0=
X-Received: by 2002:a05:693c:2288:b0:304:de2b:446f with SMTP id 5a478bee46e88-30bca0aadf5mr1738283eec.28.1781692674617;
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
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
Subject: [PATCH 32/78] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:49 +0700
Message-ID: <20260617103235.449609-33-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033755_345587_7C83C736 
X-CRM114-Status: GOOD (  11.17  )
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
 sound/soc/codecs/hdmi-codec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..608a0bf28887 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -452,31 +452,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +483,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +500,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
-	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
+	scoped_guard(mutex, &hcp->lock)
+		hcp->busy = false;
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0


