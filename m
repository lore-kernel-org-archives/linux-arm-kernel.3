Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3096CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAAlHsrpjipt9gkBkJt0Nmks4T8SC6yYNzmCZza5V2Y=; b=WNXiOH9wSCiCj27d5xW5mMNQHf
	YT3l/x77+YOwnHgw8eb4t4+I9WdDlEtU345m4KBSALrIW/S64i50iUsZYerP0Fs0xH3niN3gOy9Rf
	/zbjb15ZNVKqqCorWS8GJ6slVkiYWDr0V205HO7izXYbwU7qKFrfIuU5aVLFk9tG+att/pZsBOHdL
	BPk9mSxoG7GC7mAs+KWjnAm1govejIHgvNPNZotE1wH84CM+s8mXl3sEwHbC7Itgqzg5hkYZ9I22f
	krxLDqQu7qMMt9Y4hIDMjO66QcwMB2rajF9x6tm2aN7VHwni3I8LERLVgij0HilZngBlKTV2t46yi
	a/TcVKdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7x-0000000HGat-3DdD;
	Wed, 08 Jul 2026 14:19:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT7v-0000000HGYE-2wLC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:19:52 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so7481965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520391; x=1784125191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vAAlHsrpjipt9gkBkJt0Nmks4T8SC6yYNzmCZza5V2Y=;
        b=sH06ndHtcarqjy8VMkpYqQWZTQ+xG/dS+HSplHG+4I+r9Q2nzalRKufHp6AWA/PBwK
         dygVyzOn4qazqRcj6euYdJa/612qONSwCsEdgrkiP4RN5Su+22mwjUCb4I94mUVW6BQS
         dNclBzVeBgvW91RwGkEj9aWCZHvHeiWaCEGbAH3bGs4GAgts/akVUiSzge0kqI3wPr5d
         W3V7JVxZSNjpBEw+JaVKCsDbwnG16hkAIUGk8DCu/5kby01E26qozsvv13b4nYGr6Kgs
         cmOs4Uf4Ly/KGLsDwbsZcqjNzqeAGvA6NJRuc9wa4O3TKU3glwnWu1kSVsg7CrpaKkKb
         W2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520391; x=1784125191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vAAlHsrpjipt9gkBkJt0Nmks4T8SC6yYNzmCZza5V2Y=;
        b=DFM4LlQTAW/xyHiFvKl/Bf+iW6afsPT5YhK+z3Yp+YHgyOa7xnTXuApdeRNJAtV9KH
         gWUXcn99frLcV62tpPLBFf3k6tlS2HgfwS1V3n2N2TcYhxShvoJC24GeOMcuSATv7re3
         FNMQgUoy+533CH77MvyY+Wxm8fVgc3XKz6G/BVBwK8R5NxkwMHTwjHd3CnGZfkvZUTmO
         m4tqp6ctnOf+vJzM3gyiTxX1Ul9p4TUeNECFoTF1KJqm1MbK3LZzbY+yQITnIxh12gRz
         rKhjSaBH85VmmHYnmESIRfE389I3kO/lyfFlxQ916by2IX2X8E7d6Bp6kcuboB3gyj+W
         8COQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr/zolwSinEx4s8T0kULa6veiQlMYZJ7iMo24edMZ11/wMW/Heux1T56ToSPa+8o1v1VelYd64nV5kFgi0C2jRQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwqRlFvzmtdLyb+pZ8uEleWCWC//PEnTdoSzB7WPv7OYND1C8oJ
	2wMDWke3SMV5hMO9imgbQKH4OfXAq5lDIhVTUFu0jB1MK/uYx4y0YYnd
X-Gm-Gg: AfdE7cmzQZU3ToMIjimHy/1mi+VLJMbMI9MEgtUYhxtoQq3mAsLmNdNj+R8j+obXduG
	oGUBqe1gXefeza//l1IRDSNS0XsXgNX/4Hnodx1Ompc/xg1nENOyEnlXusdR5qx77FVV+z14sn2
	2ScJ/z7AbisNix9Ua9mOFFcxOFuQFSFCjPutGFOtjNKiORGrz4I9Hcszh5JvotoOOzvYCawPNaB
	MklbgiX/H1ujBDk5T8OMwAvfsV3fqd3TLk03R+1U96I6qi/A8YPWPqDkK0bbpA9ZtV8zhiaZEM8
	JK3ZS62d30R56tYNITy+lMb5wUsUiLIKvTVX3H8cgShJ4K55/Pu8shD2Q/2hQd3fPGB+ch+RCdU
	VR7UqDnP/Sy88PyoCtJ3ZPs/kaTp5GQZiCtTrjywO0pcCuZOY29GfCt9VhyoZmKo5zkSp1LxoSc
	T4deWfsH0wmBxzTH2zwlfPsQJtw0+xIPPMjew6CQ9tcXlUXPg=
X-Received: by 2002:a17:903:2307:b0:2ca:6d2a:871 with SMTP id d9443c01a7336-2ccea47c7a5mr27670295ad.37.1783520390737;
        Wed, 08 Jul 2026 07:19:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:50 -0700 (PDT)
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
Subject: [PATCH v2 06/27] ASoC: codecs: fs210x: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:13 +0700
Message-ID: <20260708141734.578926-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_071951_744247_0CE3C2DF 
X-CRM114-Status: GOOD (  18.42  )
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
 sound/soc/codecs/fs210x.c | 89 ++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 58 deletions(-)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index 5f381fe063e8..dce525ae50dd 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -4,6 +4,7 @@
 //
 // Copyright (C) 2016-2025 Shanghai FourSemi Semiconductor Co.,Ltd.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -770,9 +771,8 @@ static int fs210x_dai_hw_params(struct snd_pcm_substream *substream,
 	if (fs210x->devid == FS2105S_DEVICE_ID && fs210x->srate == 16000)
 		return -EOPNOTSUPP;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_set_hw_params(fs210x);
-	mutex_unlock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock)
+		ret = fs210x_set_hw_params(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set hw params: %d\n", ret);
 
@@ -789,15 +789,11 @@ static int fs210x_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	if (mute) {
 		cancel_delayed_work_sync(&fs210x->fault_check_work);
 		cancel_delayed_work_sync(&fs210x->start_work);
@@ -816,15 +812,11 @@ static int fs210x_dai_trigger(struct snd_pcm_substream *substream,
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -852,13 +844,11 @@ static void fs210x_start_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, start_work.work);
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	ret = fs210x_dev_play(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to start playing: %d\n", ret);
-
-	mutex_unlock(&fs210x->lock);
 }
 
 static void fs210x_fault_check_work(struct work_struct *work)
@@ -869,15 +859,13 @@ static void fs210x_fault_check_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, fault_check_work.work);
 
-	mutex_lock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing)
+			return;
 
-	if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return;
+		ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
 	}
 
-	ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
-	mutex_unlock(&fs210x->lock);
 	if (ret)
 		return;
 
@@ -990,7 +978,7 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	if (fs210x->scene_id < 1)
 		return -EINVAL;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 	/*
 	 * FS210x has scene(s) as below:
 	 * init scene: id = 0
@@ -999,7 +987,6 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	 */
 	index = fs210x->scene_id - 1;
 	ucontrol->value.integer.value[0] = index;
-	mutex_unlock(&fs210x->lock);
 
 	return 0;
 }
@@ -1018,7 +1005,7 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	/*
 	 * FS210x has scene(s) as below:
@@ -1028,17 +1015,14 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	 */
 	scene_id = ucontrol->value.integer.value[0] + 1;
 	scene_count = fs210x->amp_lib.scene_count - 1; /* Skip init scene */
-	if (scene_id < 1 || scene_id > scene_count) {
-		mutex_unlock(&fs210x->lock);
+	if (scene_id < 1 || scene_id > scene_count)
 		return -ERANGE;
-	}
 
 	if (scene_id != fs210x->scene_id)
 		is_changed = true;
 
 	if (fs210x->is_suspended) {
 		fs210x->scene_id = scene_id;
-		mutex_unlock(&fs210x->lock);
 		return is_changed;
 	}
 
@@ -1046,8 +1030,6 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set scene: %d\n", ret);
 
-	mutex_unlock(&fs210x->lock);
-
 	if (!ret && is_changed)
 		return 1;
 
@@ -1061,12 +1043,10 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 	struct fs210x_priv *fs210x = snd_soc_component_get_drvdata(cmpnt);
 	int ret = 0;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	if (fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
+	if (fs210x->is_suspended)
 		return 0;
-	}
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1087,8 +1067,6 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	return ret;
 }
 
@@ -1219,11 +1197,9 @@ static int fs210x_probe(struct snd_soc_component *cmpnt)
 	if (ret)
 		return ret;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_init_chip(fs210x);
-	mutex_unlock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	return ret;
+	return fs210x_init_chip(fs210x);
 }
 
 static void fs210x_remove(struct snd_soc_component *cmpnt)
@@ -1250,15 +1226,15 @@ static int fs210x_suspend(struct snd_soc_component *cmpnt)
 
 	regcache_cache_only(fs210x->regmap, true);
 
-	mutex_lock(&fs210x->lock);
-	fs210x->cur_scene = NULL;
-	fs210x->is_inited = false;
-	fs210x->is_playing = false;
-	fs210x->is_suspended = true;
+	scoped_guard(mutex, &fs210x->lock) {
+		fs210x->cur_scene = NULL;
+		fs210x->is_inited = false;
+		fs210x->is_playing = false;
+		fs210x->is_suspended = true;
 
-	gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
-	fsleep(30000); /* >= 30ms */
-	mutex_unlock(&fs210x->lock);
+		gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
+		fsleep(30000); /* >= 30ms */
+	}
 
 	cancel_delayed_work_sync(&fs210x->start_work);
 	cancel_delayed_work_sync(&fs210x->fault_check_work);
@@ -1287,14 +1263,11 @@ static int fs210x_resume(struct snd_soc_component *cmpnt)
 		return ret;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	fs210x->is_suspended = false;
-	ret = fs210x_init_chip(fs210x);
 
-	mutex_unlock(&fs210x->lock);
-
-	return ret;
+	return fs210x_init_chip(fs210x);
 }
 #else
 #define fs210x_suspend NULL
-- 
2.43.0


