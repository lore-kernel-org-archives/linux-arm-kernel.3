Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6C6C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=; b=CANuji1Cecv//5cwQlAdW5IbM9
	9k4j33IFp0p7JaFBzlAqlrxVfvxpd2Bql2dxcb5On2wlizt5pQDWO2Y3mgZuLBYvDNEEABFRz2/FL
	2/lSM0nUbmK8/2EbXrVkETT66FgKi5zMIgWti3prO1uuoz13v/FpbeoSpBmvcezcjFAc0fgsglhF3
	FDJYSH01RBPpSIbmtIpfb+BpHk6jtQM20YgSkFBkQxmemMLDF26fJIpyNGr7ULe8db2pLV1FOtgVK
	erXyOKRDfZwj7pkDM7qBClC/jiItdA0VBP/9G/1mG8VgjB9CsbWe8EfBhWfYfjXfyxrsV+rQKgm3x
	uU5SLLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9F-0000000HHcR-09X3;
	Wed, 08 Jul 2026 14:21:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8z-0000000HHS9-2kuV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso9387255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520457; x=1784125257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=EWazGrvVTPG2vIoR+uZjrCc/eMTJt2IOFEJxC/I/zPvfknr2dnQe+FLcaTL9IGdqDU
         aew1uJbPO98njVqvZOcfe6XZE/OXRpBOt89U11bQku/INkGFPSwPoxlS6dORPmpIdl5g
         k1hEHA141blrlLrkLS789PHKn6I2KICdJmf2F9/MQ34P6TrrouxeC85pK81rFHeMr7Ph
         kKcTqgT+MJCHO1we/8W6hMtawxovlmrI8LumgpZ1N/173CCdmWIBvItM32JHMnKAawRU
         pIZvRR8Qjbi5sRP6cYKVOju9goTEcniDg/IU4hhZfVkmD3eQw+jhefTU6Tlq/eMjmgI3
         i9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520457; x=1784125257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=a+3B60/urm9cM4XKYojEhIpoorQgV7+C4qta1NkUQIHsS1m5jfsw3VzGjAjArC7uG3
         20zzoS2qEqOpDGXcEr9xjyy8PVWMoydbXuI6S1khBM3mhTpra/1FkDPl2bLJQ2h6t4ct
         5XjqlKVj6qbDheD7iac7NnBh5bZhz2uIvY2S5IwhvWS/ljWe1Y1iv01/Cx6r1B0W5j/1
         Z7g2L7ALLSWVR97YmGQPFjdZztFKUgMHuLC5wP92GxDJxwoFEFxefmU9Fvk4fg1cW1lj
         MnBEdSs5JLQa3jg97l0Ihzo6MUN7jh9pTifZiP1YICk9R0ok/zDYN21zsxUqyemXfbBr
         axow==
X-Forwarded-Encrypted: i=1; AHgh+RpDIXJthvuueAzF9ihMUnjm9YAXcp+yx7pMp7/DbXsYigJ6lbINZlU1Nm5+vxgQ/jIijUVl7zQzNFfguEN7AU4v@lists.infradead.org
X-Gm-Message-State: AOJu0YwewY7vaMZYO3SnGRZllf1nEK51FwvQAEmuIpMUpRd3UVyx1Y6m
	tCukgu83C0r5XqE8V5uOe2PXz3lJyVcbGtTeTMIh8Fo/117NuqrTFs22
X-Gm-Gg: AfdE7ckYESGxqzcftqki9gnIjnB/b8KlEyOKJweHNGCkJZoXyMpBsvLJItNdwsjExfh
	dUtCBCiAxPRxWSfHecMgwpar5sBdEjmD7FBxDimXDb0uo+mizP78u2FqHq+PqSqCJJuNd/iI6Ge
	p1whdwIr/UoTPkAku6F5xL9NdoTREGkSZ8H7s9SBvqDD2SO9NbvdGmTS9/Y1FRV5HbBysB1P/BE
	g47/+WaauMV/jdyh0iviFDY1HLctF1lW+Zsh7/Exr4rhax2uyVm6EWzaQSa5nXEWnOGbeBdemLR
	nUmurYL2HUyE8xmzgtq98Y6a3QxChhUimRRc6bmhN4IQbfJgwQk6DVpXiyiM+kLbJHYs+N0gxA2
	V+BGljJXli7PNyH7OLQHIX2e61Mh77cEOhGL091/Di03PNmf89+idNDlWIfxRd0SIBM5NtXnYDo
	CrNQ55aXrA0ICsjKBc6OV+uSDCE3RnuCNGmInnBoLGWLAtPDY=
X-Received: by 2002:a17:902:dac3:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2ccea599232mr28329495ad.43.1783520456871;
        Wed, 08 Jul 2026 07:20:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:56 -0700 (PDT)
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
Subject: [PATCH v2 14/27] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:21 +0700
Message-ID: <20260708141734.578926-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072057_693506_131B92C5 
X-CRM114-Status: GOOD (  13.66  )
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
index fdef98ce52f1..bc777a53dff3 100644
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


