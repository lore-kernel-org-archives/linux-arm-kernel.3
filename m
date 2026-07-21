Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEEFC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=; b=KqwNUfA+Qx4dzsRvvCilXGDgvY
	h7z8gHk4NnigI3LC6K/BLuUPGzOaqxWScSuwv4MBeK8cgnC28zmDVLrkUeC1pt1O/i/D6zRr9Lagf
	a1APdmTkYEzXDr8qlNnPY/fIoAvJ7STbMezDG9Sc7XQMQmYErhbCa6vRF/Y6ZrBr+qJWI966bLys2
	sGfckSomBq21i3B8lX1K+SxODfVqaGvxKjnLe0yWm+TetOXPHZXTXxD6EFhyD/tteIuKH1OLDds3G
	We5O+mzWCVBbdm9BxEbKzbYjVpTaz9ZI1wjvPAxJOUX9cD24VuvMhSx5JK/qnwWoeT2s07rWc5fmT
	XFxQB4AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hB-000000098cN-3n8x;
	Tue, 21 Jul 2026 10:27:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7h6-000000098Wn-3qjA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:27:27 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cc61541f8cso56978675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629644; x=1785234444; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=D5HcPnvXCyY/n3Y29KHxHgksLHF2VC3DOibsE0vdPCOXRpHSKl51+yMyaQB9u1L926
         uEWfwwaPqCi6w6uYj/uI7EVAjZfqJmzM3D27NNf7F+r+LXHFspYYT9tuLcSqZysV6+Kg
         qXOOidpXLVjGqEugdxXEKkNwgjcmu//rHO/zVm9zxWPszcHGAYu/PfWfrN2blMexk8gJ
         dQMCPhTlI/SZ3MZx6gquPSO/x4l89aagaMsKV/ZEOfkbgIcBfn/A9oNEqM95RN6cZhi7
         hkOeLsYCGSYlvOh2nAjB7tK6rIMgtcYXf92opTUJuqUqckc2/2MmErrZKckks1Ol9P/D
         Ha2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629644; x=1785234444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=aglZVsRk8csUTpwBGsk4j9wtcradePli8Vn9PKSTUqVGiw4g7/z+HsAk0e/+tbnvuO
         UirJMWUJREnPiDhSPgdeIovngm718CIsqyvCN0tFpgUaVdU24NpTmJqfiK/PZI03OTTV
         ACSf0SwfVGX0L9HK6flnVgvagHF/sL8qtdgqpBdV8caCUbE0GAFI024KyAc/7USyu4UH
         ZtYX4uJWUrdRKS2HvgpWpORfkpFdDBtqRGUGx/y5SK3qVTdgJmlBurCKQZQeHVAdx3wQ
         xqCNbFhCOqoVX3pzOVII1y1r1qLVM8X2nq1c6ELb9HLfLMfqISQUiMzL7371i8ixOv45
         EVWA==
X-Forwarded-Encrypted: i=1; AHgh+RpY1vOnVvpYpE/zBmtHa0BhZMgm0ce+XX+F0v3OiOnE+Yp00Th/UKaypbPUS9v7AH4nMIbKg51JNJ0cAHyH0SF1@lists.infradead.org
X-Gm-Message-State: AOJu0YwfIY3pdqfc+Uuqu+rLJSFOq3/ucqnNQsHlgHpsLLN0uK0K384B
	hLuxc6nGnGA1SrJIrENUrxGJZklwLwQOlT38QMVNe426FyEcVLzW7lSK
X-Gm-Gg: AR+sD12aaziGLgI3eKkhwhFwuw8E5dpQsF4u11vnshdeB4WRDlpqCyObFVLZZHv4u9A
	SNJU8KJGa8dLckvx10vpQ96F39yRMDysWEGhgaCRCPPm8pEnubxFsu+6dupoaIJy7lHyI7CGmct
	IKmvO6jeVDCQAT2+FiSrD5EEVRCGjxDHXEzub23oK8U/XuseTfIlhuGWNWbueCm+ZxMnHXbOlHR
	ncldNFF71w2ZVfLZkGR5pZifocJmaWNj3X5ZO1Hs7YVcrH8Kec4F3kWJia1OG6AD7CxaltPt0RK
	L/xgb755Qx81rRz7GReT6SvWG/6G3BO4EPW6OvBu1gY0ammtoJgbR+6/cYD6hZSzyMQLPtP1U0e
	nDfJ6/onilFfb3O1YDNutRJcT8RJunJpOzcBUMCAjWKIYYDabiVWeM7HdmNCsuluV0tYstVdIda
	1gag4TchCWVGTfd5/dzJ3Be+t4SksfMGd1NTSj
X-Received: by 2002:a17:902:e885:b0:2ce:d958:e3b with SMTP id d9443c01a7336-2cf1f570c5amr218336625ad.25.1784629644219;
        Tue, 21 Jul 2026 03:27:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:23 -0700 (PDT)
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
Subject: [PATCH v4 08/29] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:39 +0700
Message-ID: <20260721102600.523199-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032724_971155_E64F6332 
X-CRM114-Status: GOOD (  13.07  )
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
 sound/soc/codecs/hdmi-codec.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..bc2c22436ba6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/core.h>
@@ -452,31 +453,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
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
@@ -484,8 +484,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +501,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0


