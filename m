Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=; b=2bAz3KsDl7bqrvKhCBh0oOrY99
	Thiz571d1NbA9q1R/KNW5T6lqAdlL4z6i+WAXAhJ+DW0v5Znxh2KWkC6gS5PV1TYyHKaXOHylpdxr
	1/OqoMiCEJgpLUzknGWcH2AAU4F7yWyqc9ELRJJY91KO2o/N/9OAMVNdxcmoxmmoxa4nFueDkLSx9
	oURFnLOkzoHQHuuww6HeAd1rFn4peWst0q0sM/a/YBLgViSkcajyz05opR/x19RkBL6maRXEQPMPh
	bldHAKKOjN+AQ+RtDLn+KFIKQ/yjNpJDzv6CHce7Fgum46AJv/Cju4yvxMJCdeeaSCXDJLWI9CPdW
	vc3WaNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8m-0000000HHIb-1lcH;
	Wed, 08 Jul 2026 14:20:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8j-0000000HHFi-2mPL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2caced6038eso9634115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520441; x=1784125241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=H4cvGD9A/rfcRZTQ1T69QyqeZNtX7b6S8ZRUnucG9jn0Z5q0S+6WzD0uHfeH9yVm1Y
         9PBFOdTX/sdha4Z6SoE7YJJRPjikRlSEgK71Wo1O8mtmMyVMXU8cz4m7nM/JZZgltLZy
         /KQSkTjtVLJD8e0pBEolHE4/2A28UdbdiHVA7dRqkwdnx0NBpZXqG7s/Ou0ub2Ks3v3x
         MhM4ZxHAhDDl58/+GJfUnNK9gQtfuCw2XvY6bAU3ybri7YubycYCT0UFbxwC3ZX5L2eP
         c8VDSqoD6RdRV1fYiyipaoIY5axiJVGo72dgYcRvkZeWLHvsrVrySooZo+lTvnz9IqiI
         FIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520441; x=1784125241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=OZoZ1p/HBtsl25byfhMAILjUUvlryB6scRw4yRg9YNE4M3eFY7Pcw452759tF/4tRY
         WWIC2fzHm76r9EZL6BhfCRTIVgS+HNFRwZzWiacXVbCHFPB1JoKcYuXvCIMRY8WqFcfa
         YScZO2gyiu2O2Nw4AjRf7DGmvaLEURuNn8pbF+FvvA+JhxwL1QUmujlV7iEp4EkHd0yB
         6MFgb4w/veP3H/+h+MRJ16ErAwnoo0NbE1kriCohXGQEIj/rgNAAi5OWbmw60IPi1CH8
         FZKXSAXg23M7weCoazLvSuKuZABTFiZ5OmXwEVvbl4/asgOQN/IW/SooN3T2DPGRbAkG
         WOQA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/x2oZqf44MU2JPBIn8BdLFrC4numcSs7SP/3V0eRf0eqXxHXy9zG9pqJ2a/KliNTyFx04sPIlMS+R8bEz2MBu@lists.infradead.org
X-Gm-Message-State: AOJu0Yz12RpuDVpypJPTKtq7tHZCjK195DyJLbmj/ZT2Qe4d07uGcz+T
	tuNF2HWEwMIqn35q8KVd89ThekgG70UIgPsXZUI1WWfAoejJ5jg0dLcI
X-Gm-Gg: AfdE7clt07OcKPRc4/MyaWYbDUI1IXmZRkZvhQeULfCDVXPV28CmKI4/p4L+U78xPvQ
	9lCCxnr+HpO8mpniHsiy7VRbc9rZ4rUaL2uN02HUs7upzrOm5LmzRXFmfLdYnKcABU/D1fRkpCV
	QFjMvSMHTM0dhnWyhmNU9XslVkeXjyAniELtzfVhISvi0SGlrtDvIZ2NuLEVeznsg6wFc5vi8tF
	YZrDDtMQ06wir+6KE+zMcsj3f7gQlLpu1mWCqw61LbolPnEqq0SjDhJRfhHQcogbPEYy2/g6cxT
	zlPq9CtUFNEPCsyZ2gglE6Yq4TkUJly3oMtv4EZjIE4+Jf9wE3WYvxOVd17EuoX4IF0vLJ1CJ+/
	hxu7u8mJEkaZSy77e3iM0N5M7ihkvgTtLCqPIaTPMNEkhWlP5+1x2fjzhR9+5RBOYyZdzm6Gh8l
	nzAnbLr3IQylaTCWwdaIC5+UhRBAEBLD7cOkudXZc3N0NFy7A=
X-Received: by 2002:a17:902:ce04:b0:2c9:fc4c:8142 with SMTP id d9443c01a7336-2cce9f79c01mr26690085ad.2.1783520440899;
        Wed, 08 Jul 2026 07:20:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:40 -0700 (PDT)
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
Subject: [PATCH v2 12/27] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:19 +0700
Message-ID: <20260708141734.578926-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072041_718104_EE8327E4 
X-CRM114-Status: GOOD (  11.46  )
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
 sound/soc/codecs/max98095.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..c47bfa2378b8 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Maxim Integrated Products
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1532,15 +1533,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
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
@@ -1683,12 +1686,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
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


