Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B800C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKqRcXDTZ2AUkUtA/CqdSn+DCaTTyr1WUIIDbJXdQ3w=; b=NC9qHHQFYewdGvOHSdcqB7D0r6
	qJqQ2DeZld/S/rj5qTDz4khdUH+3i423O2xml6YUWSkMlGVYvCTQ4p92SpCk8MxmZhLM2p/3L2m9n
	qgDbMPJ4c56XzbpOQMlF7lZ6Kjg5gqEmoxg+GkTxLxMmhzISrur5oZt44DCy4cdDN/pmKG0S/h/9k
	5qs2OgQaEnY2cYQl+z1CG3hbmm+juIb/M5pEcVULp6xmmIrRgdCfM8IeK1pv4pdR7ayCZ54mEQ+lq
	dPQs7fg74awpS5abUYl7+c/ugRyg7orgekvK2ByiFmiGohpyjruUu6pmENEdNjlxRZM9WK2WHBOKM
	J33jiy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3SB-00000004909-0ybg;
	Fri, 10 Jul 2026 05:07:11 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3S5-000000048ug-2Mu5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:07:09 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so529763b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660025; x=1784264825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKqRcXDTZ2AUkUtA/CqdSn+DCaTTyr1WUIIDbJXdQ3w=;
        b=XFsZGL5otl/cyicYrvaPX0COO+3AQdKli5X5ZuTia725I6sI7tLPs0s6ojUH2Wg2qS
         0NsJXxPGwbrltpi5aEJeCo4l0DH2kt/IJvq8fEPwuwmbEZtus4e53CRMXkvBl+PGikgR
         95JPOwKvo3lHhoCRLDU8RhyznFznKvIQaNOYPwLy/CzF0ap9Ea60AFWxm4kCpRV9UFJg
         xZFH5CE2FPxT52RxPJgNb70VfRzP1fnC2D8ZxOaHJvxp+u5bLBeH4n1s3MskzLgIe3z7
         ZCjB8Y25ahsWEYppQws2VGss9sD1cHHX+hoZckZbQQ0L/Yl1Bl6G+p+s8dbKcbiIbq4q
         vSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660025; x=1784264825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cKqRcXDTZ2AUkUtA/CqdSn+DCaTTyr1WUIIDbJXdQ3w=;
        b=HmBniEx33JeEhnV6OaZXAlP94T1ke2cdgMvsDD96i1zxwWUxBpnECzOsDDkTiZRtPb
         byYkKRlpobQZmL1S1zacTopYwB+g/od0U6yZpDktoCjnQMvr7oBJxs9gOoH03qw76spz
         gJ4EdTV4lOTY/yGU9nZWSjMhh7DLzTGh43wjzuwcndlx9bFXg4xuvCEhTTkGmlG6BO3G
         V4K2RARZbx9se58WjHOzd3aCe8ltLnyhNlyW4f1odtBkLI8wfYOGpkjLLWIhK8jOV0TG
         +SNDgjS+g5QGSvgFrjP7zkNlNPlWnqacyJTYlCFI3oe+YrEeoSBXTNQ7TVPKlYTqQeQ6
         P1fA==
X-Forwarded-Encrypted: i=1; AHgh+RoEOkV/y/PGuap9nM0Tr1pA4gHGmMBExJcdQe9nr199p9/OuPeZmQFFSDt6OyDcVIrllhuEvU5y1fK+yK6BSMBM@lists.infradead.org
X-Gm-Message-State: AOJu0YyOyFvikDMnCdKfpnbDEE8SrEo6zsiKQfIIqIcE+XYBdOpXhRbv
	C8UAIh71sjJCV5gCe8MJsIM+lPE9UcXbUYk2VTNCXIcG5F5DlJcPsUKr
X-Gm-Gg: AfdE7cnK/4wG39J3H3kiF/qSmHeW1mic65GvTbkqpeNk9tblLKZeKfHCc8YBtiY4csx
	fbAhtMRg0SRoUjDzXHCce8xDF7zoOpDZJIXUkwGwdKPCJCSXEz1QabqKMI3x7bW3yV6Qk8Jnar5
	oH6rRQQIQZsr9HVdYbVyLpt/lwW6gwFfSE/orTOJR9cLN2YuOS65yawHc58mdx6l1tdfSwMmzU5
	LdzbYLtG83GMcg2/8+OvNNsNXByNaLKw3g1tOZrtqn7axjV7c5BCSZwSwMlWwmtyRCb6f5lgTNZ
	UG18q4HqpJJ91LMK7hWWxw05+lQ88tZN/GAF8yQZ9aCD5WlR/xyXe3Aq+yOf3WlMFeSSFzCwoBs
	Nw8yTgf4guef9B4Zp8M/y4l4UZ0SrmWWmPDP25pLlmTcfGVOgpOcF3oEZrzoPsDeA/1j9Kytqlm
	nkvPvdwilDoHC9UOSDElf+nHc7zkWCK8ThBbR1VXMnaVOryzU=
X-Received: by 2002:a05:6a00:b45:b0:847:b45b:fef3 with SMTP id d2e1a72fcca58-84870b7040cmr1847885b3a.27.1783660024823;
        Thu, 09 Jul 2026 22:07:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:04 -0700 (PDT)
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
Subject: [PATCH v3 14/27] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:58 +0700
Message-ID: <20260710050511.14439-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220705_617848_17276280 
X-CRM114-Status: GOOD (  13.09  )
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
 sound/soc/codecs/pcm512x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fe3b5011fa16..88e235de1107 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -6,7 +6,7 @@
  *		Copyright 2014 Linaro Ltd
  */
 
-
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
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


