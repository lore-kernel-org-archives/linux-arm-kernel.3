Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E43CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=; b=jQHGUvUeFeYFXLGUVlSV6IUJDD
	vwXo7IISLbAz3XTbbbcjkz3birf2w7PxH6UrDVEkmIE7L/RN978eSY5OmPE02j2jCoChhwwhP0GS4
	2pCd1Rw1Tr9Njq7aWYqjXnL4e6iFyndEfD2OAZHM0ZAcIpDQqbv8EUq9jyErlw3/csMWAakQRnn12
	+hqA4dMa2lSjMBbe2cPS1iCOUCKXMi/6+qa9y8q5c10kCae3To6kKhObgA3mb/f+VCHzyVn1ek0K3
	Dfun20D9rqoeSVx0Egw+Bg3Gu8jXHHIGQjry/9ifuhU1HMYZZ7MU9korJ4EBk4LDxVPLb2iHJwN75
	ZSKkcVQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfi-0000000H8Eq-3Bes;
	Wed, 17 Jun 2026 10:39:02 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfe-0000000H8B8-3KMp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:39:01 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3042a388168so431263eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692738; x=1782297538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=YDbFtsHk+rTVloUQrdR0gfi2Y4rpzS6lReodl94rsgZyyDGG2tWso9lBUkDydgjcUX
         RvS8sEAB8/Q5De6kxda0k1YXk600Lzxba6JgIs5WOH9EFcp7sZrkywErb/rrigwxl2bf
         9hg32jDJSDE6A1+S6uWkFb4AoJcUwX6G9AWUAN3X7Z8SDsaCDGCq4P821VKlPILFLWwm
         BhnYX3AgggdYPvKITRgdwcjVmGtAMhknSQ9HNDbug0fWvJ04E9cYWnQCAQFMB5cuDURJ
         5VLTeIDLwuiBGXK9kOwpYjjeEdWNDzUo2zbflX+FVxXWy5//XCQw70neZXnoxfcQdIg9
         E7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692738; x=1782297538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=d5Xf+YkeQOPIXszzBFCeufilsp/2FLZLqYNUnT7ADXPTTfQfCoAgesSo67mLnin/Xz
         wCATyT5WaWWczwScNcLtJO3tnFEq3KQsGbO7/q8Y+XqMTeqrJoI3Cp+V5kIemiTHXWP8
         NIEwisnXZshSpHuxTnCz24gi5LuRHCjX1e25ZaWzsmv+4u77plK6uDtEFAxP7WZr4cGD
         QKH/gHEfxQVsUZB7u3VogIfWjxohLKIdiwh84y4zA3y7jHkQS3sZRapP1qtzBh9KHECd
         0OqG1BpzOBVtjHHevAUP/heyJ9QFm5O24c9ZZeD9btdSqrx9Kv6pbeu0iUelHlrVe178
         JVTg==
X-Forwarded-Encrypted: i=1; AFNElJ/8u2tflo3GFAv9jNKSGukQCETy34Piqnkfx7LMKX64JxddzK5FGlXTJJY4vwel4086z/C8sChDG3vf2cMZa/Xu@lists.infradead.org
X-Gm-Message-State: AOJu0YzzZJFXqX5pjs+hKw1+kGh1e8OJT6OwVIqo0TqhfJLXkY6o/bON
	v3Ol2P7lTwOCVs3EcpJeVBHe+v+k81V8aN24chHkUEPdNXJnKJiAaeio
X-Gm-Gg: AfdE7ck29FABu6AJriAR7sKP4OInAPVDjH70vWSPbB3FAm1J5hjDAzfmF0N2D19IEPn
	vZ0hrzG/B2NdPe7eh0JP4uaCSoU7TydQ1BJhrN2amdIyC1p2ktsbYknHabto66yGtp8Oo417F5y
	gkp5NPElT47fxPIL/46dmg8PicjLyTo/Pg1l6afsxcVioLTeh8JyBsSZKWtLePE65jVwGfA5EC6
	0VjiwaEx5Ig8YhpRLXveyWBOmBLmEZReBhogSkCykF1S1YNpi4K1EmYRFlYi6BTo7VyiX17aFSX
	JOnX/GhY8nkps5BZ4OoYrML8vIJgNXR4ZZp6EC5UqsaJJ1hlAwxO+ohW5JZpucS4nvJjpCH056U
	wnBqUC+VZGMIoJUxvd2m2jIkhZHxThIk2PPMVteQzCLT+CeK548L+asiVUFcox4wEShfXg8705M
	SaEeAo1yPZzrfJQBQNI1YpxRwflUD2pkqRMQDSiVXZkEC20LKYqClOXCSuug==
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr1293252eec.9.1781692737916;
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
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
Subject: [PATCH 38/78] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:55 +0700
Message-ID: <20260617103235.449609-39-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033858_825330_AEC74EB7 
X-CRM114-Status: GOOD (  11.94  )
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
 sound/soc/codecs/pcm512x.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..f4206f49f5b6 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0


