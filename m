Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF791CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYWRPoZz4ae7K4jnXXMDEkNAOT3Lgww531flfNqozJE=; b=RtC4iVRPMChBgC4gFsiy69zAYH
	cs7xPeLKR0mWwrq7Y3Rs6IFWGEh1okG+aR+p7Mh1HGQQnpxAaKmEj4yK4VHyE62kB12KEzW8P3P8B
	UUvPEeIJGb4aE9oFzkL/KqsPHqDTKBWxIGjDf3+u2kbJs/PQHDeDH3hZlb/ptW3HoTsO/R+ANB7lC
	RpOQCG086dB1VyUPfD1qpdJJC1MdctdDx6RVJYm42jnn+pz4h0+gE1JIxPj/VdFvPzpwK8ckIyl1o
	otJcmMEdzmOJoofLQAqE1cH+gFJX/5rWU6B+OPz5X4REcoNnasa7Ao7HIwmFNCFk9FnDwUg/2I+2Y
	h46iEjmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfr-0000000H8Kn-3fP4;
	Wed, 17 Jun 2026 10:39:11 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfp-0000000H8JF-0K5u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:39:10 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5793108eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692748; x=1782297548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYWRPoZz4ae7K4jnXXMDEkNAOT3Lgww531flfNqozJE=;
        b=aeC+n5QL1K+78DYAJu2Ist3WpLUs2qyFINuvi44qTtlgGM9du7wd4mUDSG7PvXx2uk
         NSqPLnmzNxnz3Lgvx4s09hGp57kSeaPqCk/i/dXU30hm+RSLn8ixqXiocaVsxfGwEf+9
         VU/RdO012l+sdV0fW2o60ixD3qUPEdOPSrDUm5xUvkN1I0Z4lLB9X76sOrfLTGXlhcNd
         kfvkF2SvKV1SxB2S/R6xkqCDAqkjD81EQvUTJpFYkx5E+wrdoOm16gXpFndKMtti4k7h
         YLCeU/GFDNGD+g488gg5qWPaa7FET57SxOpvzX54f4wDYmh3kqMZRwta0BzB2LyEzfgD
         c3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692748; x=1782297548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IYWRPoZz4ae7K4jnXXMDEkNAOT3Lgww531flfNqozJE=;
        b=AGxEQVPGirtLcITD3BkfBiky0pqPiRgAtQPsFnXAKLXLuESIqAjqShdrv79N1tNlUz
         GQwjmWKVRuca323AivMdiaPFpXo7Whbk8zZwRAlIGqlszqqey8fLisUTBkXPbDpi5pHw
         +q73LaSMf+mLBQpBcdzkNFMA8z1FzQm9YYnmbfCu/gD5gRben1jpUB9jmWjeISa3QexW
         0hfv3053wAWJUkT8K0RT6VU77kd6i9aGuxqMLrt4UU4OWNY1a879f0Nb1EFyFvHK9pMj
         ZoA/HLiQhq2gbv1dUi9SlXw0IjzLH+b2oeijttxQH13qvxVKzulNuU+C+NCM417eJy3y
         t+Rw==
X-Forwarded-Encrypted: i=1; AFNElJ+oHl5UC4kUkV/OwfmoL4FusYrTGjJgRPEZH0pHVk46EtrYB1T58QLI8TzjGYxOheNGtJEgnCP5H2jna+uLUiwi@lists.infradead.org
X-Gm-Message-State: AOJu0YzvKZaOfx6xZkintHgiwUBIXjDOWva5vQlEbbQ1Rno6X/ZGQz/A
	5vq8wBnDf0Ljsp1XDIkkll9fi/q8kD03dzbjdG1GpnXuhZqO7zA81+fk
X-Gm-Gg: AfdE7cmX+PzMLozM9ufyaHyyYVxvzzBra6Ej93rNyc8JNJB59nDjZEat2msWuOJf5Dl
	bqIXzs945m8yZMoxaam2QmofFZG+Y9M3FhBkYI8TRo3+RLIrYQRiEdCwnsDX6WJSw+3Df2Q0Ljc
	RVPb3OpPGlSwoTgEkWZditg2NAbUgHlRAG6B+W4lvsmbJTLS4WKeGbQ3Q7OHB3PdFrs8kW59Ma2
	TGeL7+sHKgp55xs3+IMsVWsyNDCx0tTQmIP2xmJo3yg5SwEWnoeOYXlP0SqySNWgv9U6WtboWvR
	zjuUPyq0cABmNufqOGExlrDJfbHNorRPs9crPYfgP046k/KUc9sLe3Wc/7gnMXCXVkJWyPdThuu
	O7oPsB8Cac/4QP7Kb625MWY5zjVjP6Wnc/IkRO1Nm+t71/Yg4lnVqNcJYyVy2awRckB3gv0vvjl
	q+R5fzOxxI4OwFP0t97yKe8IJwJ22bXPgUHmV5Iv+yzOopLqGe6aQXq6BrJQ==
X-Received: by 2002:a05:7300:2388:b0:30b:8862:db15 with SMTP id 5a478bee46e88-30bca100cc9mr1489898eec.28.1781692748156;
        Wed, 17 Jun 2026 03:39:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:07 -0700 (PDT)
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
Subject: [PATCH 39/78] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:56 +0700
Message-ID: <20260617103235.449609-40-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033909_121332_6F555ED4 
X-CRM114-Status: GOOD (  12.68  )
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
 sound/soc/codecs/pcm6240.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 4ac4448ac3c8..984fabc6d578 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -605,7 +605,7 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int val;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	if (pcm_dev->chip_id == PCM1690) {
 		ret = pcmdev_dev_read(pcm_dev, dev_no, PCM1690_REG_MODE_CTRL,
@@ -613,18 +613,18 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 		if (ret) {
 			dev_err(pcm_dev->dev, "%s: read mode err=%d\n",
 				__func__, ret);
-			goto out;
+			return ret;
 		}
 		val &= PCM1690_REG_MODE_CTRL_DAMS_MSK;
 		/* Set to wide-range mode, before using vol ctrl. */
 		if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -25500;
-			goto out;
+			return ret;
 		}
 		/* Set to fine mode, before using fine vol ctrl. */
 		if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -12750;
-			goto out;
+			return ret;
 		}
 	}
 
@@ -632,15 +632,14 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: read err=%d\n",
 			__func__, ret);
-		goto out;
+		return ret;
 	}
 
 	val = (val >> shift) & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
 	ucontrol->value.integer.value[0] = val;
-out:
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return ret;
 }
 
@@ -678,7 +677,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int val, val_mask;
 	unsigned int reg = mc->reg;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	val = ucontrol->value.integer.value[0] & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
@@ -702,7 +701,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 			__func__, rc);
 	else
 		rc = 1;
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1580,7 +1579,7 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 	const struct firmware *fw_entry = NULL;
 	int ret, i, j;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	pcm_dev->component = comp;
 
@@ -1634,7 +1633,6 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 out:
 	release_firmware(fw_entry);
 
-	mutex_unlock(&pcm_dev->codec_lock);
 	return ret;
 }
 
@@ -1645,9 +1643,8 @@ static void pcmdevice_comp_remove(struct snd_soc_component *codec)
 
 	if (!pcm_dev)
 		return;
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_config_info_remove(pcm_dev);
-	mutex_unlock(&pcm_dev->codec_lock);
 }
 
 static const struct snd_soc_dapm_widget pcmdevice_dapm_widgets[] = {
@@ -1890,9 +1887,9 @@ static int pcmdevice_mute(struct snd_soc_dai *dai, int mute, int stream)
 	else
 		block_type = PCMDEVICE_BIN_BLK_PRE_POWER_UP;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_select_cfg_blk(pcm_dev, pcm_dev->cur_conf, block_type);
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return 0;
 }
 
-- 
2.43.0


