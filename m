Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7524C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCCco9cVx1cOuMyiOEUiJ1UTQlQHfjoxsoHM/LTW3Ro=; b=NPeuaFUcR3Gw39qTNSL6U6JdCA
	dLDyYoRNRnFIu3rEyJXp2ZdlglXV0/Oqu+TRvl4BIS6XJQFTcIRQyG9gihKw+4/Z+Zgf0Y4E85gYe
	oq0weE/9Qo5JiL8RCP6miHcRv/tM2puEqbCc1uWg5UW3dfx521tKVmSNoS3aoAZXpnCiWI+vrVig6
	QUoq58BYhS5va/5LKij23RUfFUA2W7QK2ZDq08gld/NtBFmGtB96X21ghoe7JZKcw45xeUEvP1Yip
	2/OgGSpGD4HqaQqUgjaBrX07M6FbvqLfhoLITadhrAu4NhHhTOL2GXUvAAixjkFsTRvMQqdpftY0r
	GRKiaGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hq-000000099Nf-1eDm;
	Tue, 21 Jul 2026 10:28:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hc-0000000998q-3C9c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cf27856f9cso56698135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629676; x=1785234476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCCco9cVx1cOuMyiOEUiJ1UTQlQHfjoxsoHM/LTW3Ro=;
        b=qoWyKQGrzsXpYj84EKvgiSFy4v9PNHTC53Pyy8qYNG0ooXdI/Y/SqHOu8T+EsfiEnX
         2PdL8dI6lzdRXz3vKC0pFVk8jrgsNjVUtVbOpPhcvTwLniI3AmCHZUbxxIcbIbtTLFpA
         DaRF60nhD8gu+Qed9D+Ko+Ai2Kexj8+xVFTEpQI7f+raV90xIZVzVamD/svkUw7NQM6x
         GleslrrL+YkPPVEkDiT0mncFu1skDEWbdi7HvX0f2k91JgbYbjj4L/zsXZHiy2DB/eRh
         Gfe4KrtSK0bjnt/wedEN2dmmteDsTgwQSvw86DZXUa7iY+nD0Ehg/gM1rPGfbgCIG4DU
         7+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629676; x=1785234476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCCco9cVx1cOuMyiOEUiJ1UTQlQHfjoxsoHM/LTW3Ro=;
        b=s5d2E6xpcCF3NzbxijrhHX80E8gW/x0ZKiDVEQfSdWq6d/ArF57v5lQaUc610yiV8f
         XQy/Wbxu/GXpgVCag7J/ikh0tnrWqQQCrget4UKZ1hqnVx79Opv9eIRnIG1w2yelShoS
         jDgKgQECqJxJrG16aZ5zd5EGdPtTLdcGalkJXslVccibivoMGJbr6OWvVqqeb1FCcgns
         LLEmPXTo4CBnxQ97YDc9KN+vv096KgI36Y32Lbs7ZOjOFd3D/4fi67YRlMJuBaey/JMO
         oa2waAflLb3Y1yEOt5RPBiVz1LuDLFpe740H+06PjGm87yyNw4IKlHWcCSh7tnEHqAV4
         LNUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5pEFgYGH6rN0yVDUp15FRw9LMDEp0bOB9wCIuCeqM6fWrIun4obI12kcZfvWHb5+ltkShOI7GGy6ztt/4E/hi@lists.infradead.org
X-Gm-Message-State: AOJu0YyDNOlBjRzqDm2RxzKCsA+LiH1g4LIoz+6CMoC1TXahXW99cUxR
	hc3aN/fhPAHl4XiC51lCEKahYyR9dlCPd0VOyt+2PNmhPHnefq+qhUGz
X-Gm-Gg: AR+sD12hgzMUfhQIAhuEJ5y8V7w6+B8j1+0NQTU90mWxZjv0eHUoSMah/lQ+ti/2CgU
	bfhCfNpqxwpw22WlGlwcX3ci/hhaFic0qY+iiD7TWsnxc64dzoOtoIceeCgsTTc7RllUJR8Axuv
	3m758J5bHjXzz06DwmnHSSHo+L5kyWggDCkGpBpnBRirqLJRuXzRoX+ZVu5VViybV/d0+wzm9II
	QCqXdcd1rsvitlDGvD6RQCslAXB0MOQ9isi8dREHd2Nxv2387fanas3z7EduYIrNdyD+Y/YXU+e
	4cHhce/CWegTyU2oSEn/Tnp2D0v1WbWwOaQOq4jyl5ijQ6KG9ZTjiJSb3JL6/39BIGDlkwTm7+d
	5o3iU4k1uy1hFMCEPyd+EwrHaC7jkPuhlPDUVcLNiwmi01CK4ySls2niFdGsNEkJ6KQOXF3PuoS
	mRjTcTUmNtl7E8CSvarCkzCCK7SI6a1T560ZY2
X-Received: by 2002:a17:902:dac6:b0:2cc:307c:51f2 with SMTP id d9443c01a7336-2cf34948943mr194104795ad.22.1784629676095;
        Tue, 21 Jul 2026 03:27:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:55 -0700 (PDT)
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
Subject: [PATCH v4 12/29] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:43 +0700
Message-ID: <20260721102600.523199-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032756_849403_42A42155 
X-CRM114-Status: GOOD (  11.11  )
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
index 130b6694a634..d93436046849 100644
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


