Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3B5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=; b=XAafCni7escPXoxrAO1Xb1QS9O
	rHBCVW1fZEeWu2Jc72+4v1YW8r9Jvu4H99wzJyqMXd51Ns3REjRi8w64+cANdzDC3BC5TKl5VeIxD
	q8acfj7xKX4tK+wCbsNnEcVN5OFcA1z51WTVqgd5p+j7clbmqtRTqBB46yllUL0XkjYMt9naNXVSZ
	xfQDdjFPuJV0lAJaiuxn0RAsdcrbh1jAdTYcmFH/68MJEY0IzJYAwr1Ekvw4enVJDZp7jYoF3G6nJ
	1fTM96kdm8nLiu4i1T38n1TEB9OzxLFk1hcAk3yCswL8vVOmWNkj/+4lzn1qqKmmtCzvspsgJG8yz
	k0HlXSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8H-0000000HGr6-18WG;
	Wed, 08 Jul 2026 14:20:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8C-0000000HGmb-30XZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ca70925c25so10397285ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520408; x=1784125208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=hvv8BH7RX09wp8EM9gAKFhiBWRah6GTPX/XMcrvspwcDptcXtMmY4AnBrizZDu7eXr
         EewpTFgTZP1IRUiVZYEgSEE+gPimQISR1yCiSr+oJSKCKbdqHwzwA7pEYjowSfgscPa/
         sCkZuB39QnF9vBdo6LLUUatNsbkzXVhJOy8gq+8PXep95T35kucqL7AUF20Q5RL33gS0
         66PbWGu5DZXFRf2tFu37ckYqPZj4kZZIyygdJKuh6xG30NIoQ5UmksPpvG3iEEQ9TD67
         VDFYL550braUp5UgIceYdmHMuBB0hB+8hSsjfd3S1/YBh3Ka8ovfPFUMmQ+JwZ440rMd
         LEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520408; x=1784125208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=pMK3Jm04vcEy7RagNwfqsGl5jQCfurUv02quALjIFVEMMBqr6bYy1/FSqNiB1VWGqg
         nl1EYJGDQXDYAhrCCIlPqR7wJU9/vzLJKxF2jFk1ZFv27DxIgoe9pC7g72Ld2JsrcE5o
         pmdVvyY1nhfuB8IEymM94qWUIUCMVQVf23u5cTqfbvWG4Rm/aX2zlTsGWGbVaExDf3R9
         3AbeTmcr7W7stqvUUYegpELfNIIYG4eI8hMxYdFiO5LsbVy0VN5igxL6Vfgx3lMMK94o
         LH6sR04H6k/+Pb7NBf07xJXruUMtU4JUUxAWy8UbEa71qnCk2AVeVK84nrdZDWkRUMIR
         hbnA==
X-Forwarded-Encrypted: i=1; AHgh+Rrb60ZxsOJymT0QFuevIsElB3qGWumbguKyhcRoLQJB6znI8jbr+jbZ4CZ1NU1Qs+DGYIZV3yYti+NdqEJbNrnp@lists.infradead.org
X-Gm-Message-State: AOJu0YyjuRglZPVSFvUZqCAjXIWtvEqF8XiqLfa4tM7qbC3OpIFBCxGx
	t6wcwvu3D7xfDq7KuFi8horsndRSBWUj1hdoz/0uYw3Ccak66f4bHs2a
X-Gm-Gg: AfdE7cm4cqDFPO4xrCWOANVd9HDRl6ekTiXikx4fbgcqsd8j9pL7uqWxgPzVDmpwL7D
	1gRbAl0Eu+sI2CJjJRPilhcM60pXkB5lfCkuKRuKulIh8Vgv1OcqqzAyEnbJs2wmaLmSCTfec0K
	F6vnV/QRj75fX+i1OHdamxms3R7/6CSUHWBfyTD+zpuB6/TZ+6xWsnuW0P9LHnDtJUx2oV8DrBP
	fkqB100ufuQ+fifFGLuFjyTnDfoADvzt39duqHzS9z5vJlmLM4FBQ4zWMH+/UBH+ye/JOs5ghAN
	LMQnpyigExfdN0jMfblkjGW15qTv/oR8+OV3S2OYuBjzg20tgqW1vmdMndISD0q9Mk4odcwEOH3
	NQ8BXpkUXRc0J9lKxsukpaUIAF8EkW4Yd5SkCnj32dyf7pVWhvEjeDQSNaK5NbmaBJACIMF+TOP
	t72ok390r4YTyrpPMGcHfKGUOBXuE9cTmCas9XSAQ3NDXxprPQNJ85XJis7g==
X-Received: by 2002:a17:902:ce82:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2ccea3a28e7mr30636245ad.43.1783520408022;
        Wed, 08 Jul 2026 07:20:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:07 -0700 (PDT)
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
Subject: [PATCH v2 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:15 +0700
Message-ID: <20260708141734.578926-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072008_911434_21348A5F 
X-CRM114-Status: GOOD (  13.41  )
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


