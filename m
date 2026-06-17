Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3DDCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJIy1+pwCeD5f5eJrcAwlX5FxN6nvvTgLzD/CiIu9zI=; b=aDsxZE5loHCXUqN0DedfV5xnTH
	tJqMu0MCugiBlVDEwGaaXp1fAKUdN+7rPKiWo27/fsLGw5oUGTvGZ+E19pqFe6uv5wWKb8u4XjQ80
	Pf/KzwylpsPi/7/usPfPPyKTY8NECkNip+UNIHFgwcAc6Yeo2Egyu9ubE8bN6TqPm1SJkUewSx/UR
	ljbQviFca8fQuwboJgAKWMVt8XhtuxJObAJ3bZAw35TyCYk5iRLcAuwVQlVk+oky7lMNm81UvLKdq
	ZVh/RGm1Damhg23v9T5l08hTP06C2Q3xelRy3u6Fma1XG2M839QrrGWPQFd+5NWNA8g6jBXJRhGHb
	amKPLctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfQ-0000000H80Q-0REK;
	Wed, 17 Jun 2026 10:38:44 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfL-0000000H7x7-1xGo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:38:41 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-3042a388168so431114eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692719; x=1782297519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJIy1+pwCeD5f5eJrcAwlX5FxN6nvvTgLzD/CiIu9zI=;
        b=Btzq8u7/Xswm9ieYBHIfOhk+wT6ThCbI+rGpgWFAm0ILfHR5JL5pRxH/9NOmkkr1H1
         6MQ8G8LvnQgTo9JqU46Q41JRBZZ67WMMqtuDjBwiOcdkYyDRRwD4BrhD+0T3YL7OUKKd
         MpDEP5hzhC5dJ8Q8TuGig4okLa752drFnKr5/bDukLzkAbEs0WM3s6RbobCUs6nYPekS
         SyXZzQkoOhIkDITPl4gh6vkJTvveNuEaYj0/97CIUuvogJTm9BCS+dec1awB1n85/NF+
         5L3JkbJOeRiXQFpww/t+z97MWo8Gw+KNpKL1K7UuBJMvXomV+JXf+lIDfxApJi0nSiJy
         Ws8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692719; x=1782297519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJIy1+pwCeD5f5eJrcAwlX5FxN6nvvTgLzD/CiIu9zI=;
        b=cWO9tKZGtLXyAVxlc2ww0T2skUL284TqDWfLA1gvy/9mzupR6TtKyNMzE4PscqJcEU
         f4gOysSP3w+8xubyUm/NiO5No7fbSuGlIxDQFB5RmmC2fOoVzUp4FSEPLpQOVni16kPw
         gtkWb1ZSryV/w/m6SPeZNBfy7PHOrJRxKqAuwoFR4EIYpvXIkuq+mwhwyhn7hoUWLD5a
         UIiZ73itxl7y7EkEofccP51jlxZG+MZpk5eEudHk4R2hC0hThMhmC37Jo51CarHxVdcJ
         XtApNvWtpn92gDrtEtXezmJb+1CU2ptGUJRV7E3tU6uzCzPqvIIqgfGx4i6gB+8D2Tjf
         5v7w==
X-Forwarded-Encrypted: i=1; AFNElJ+17q+0uTXxuYuAp+/t3bxGtq/IT2isI7MiABxKi9Ilv9fmkAI2esLyjgWWzA0ENoXDN4CDWWUDfiHsUt2gxvqN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf8VsXs94sO9UuNk168daJQpcDtNh4IdGyqqzeOUuSQEUBnJs/
	glnjUyThBk9DXZFb+4jg+3lhJSWGi4LUzIl7jysB6cCwtwXXBB/e4pVS
X-Gm-Gg: AfdE7clFCOEa1pYd6O0LLq7DuNtZVBS5NkigCDxaZe1lSLJur9xq05kceCUGcwzeUVl
	OesByTcOxAAGVOZEHcE/1J920ZukdYEKFvxtXcc/0keA4TL68yun8gGW7+uoFvJGU2yP0RkaFIc
	95rNxffL6PigqzcL1sYP9jhgDrFz9EsSr/5mwDgEs3I+G9WV6TAwHU2X1SIGieq/4Tb2vPCA+96
	gxj1/6UtW3iaptyz9dX4xZYKe4QEGY4beJpK0Ul4Ir/FoE2sCDogg9j8jRWT1eadP3ldE7yfxE5
	SfFKjovGWNgxACGEnbC3wxvjmb8gMS5yK3qBM3SWAf4WUz/VhgO9FrqH6o2Agb/yek/NSS5pshk
	iPWyEI3zl6ntd9oDHxa/5QYi1G4twGRQb0l1oLIx+EgXNxjqwCP9Xw88J8LpXT5pzzlqsZATudz
	e9zZVPDK2aD5FhKv1Icem5tdtfDRudHgx1uAEUS8BbeNIQEz4=
X-Received: by 2002:a05:7301:1192:b0:30b:d86b:f250 with SMTP id 5a478bee46e88-30bd86c5dcfmr429093eec.0.1781692718566;
        Wed, 17 Jun 2026 03:38:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:38 -0700 (PDT)
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
Subject: [PATCH 36/78] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:53 +0700
Message-ID: <20260617103235.449609-37-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033839_522743_1A497ABB 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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
 sound/soc/codecs/max98095.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..7cdb76f3813b 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1532,15 +1532,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1685,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0


