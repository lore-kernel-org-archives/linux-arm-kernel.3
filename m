Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFDCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=; b=v+4AVoUvj2AMC+i1R3AJZciPbI
	gEiQWH3rDw4nMvQBzvm8r4CeO8TtlqpxRYDQS4UGAMJe8oUdhhnOo9ZcFz4KOTyUGpVs2tJ7Ixth4
	XAq+XeOhPP0FAU/N2pZHdq6NfUlHGHz22Qo1UoJU9ZdbbCLzk1kt4IMLvSlSFhksitGq2hDlMen5r
	2N0/0FeBsg6oSC6+5j29m5FWikH8xzNfc9viM5vFD06nGdiaCVF4hMEwsj6mVEc8pxdxvPUpaLYPH
	9RKIDKRFLzqFxmk6KOHay9dScQz+te7MSYNyIqBdnuY1qh7F9dCfnzwE1ni4NQk1XXY49wOOmTOGL
	Ghw5aAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5D-0000000FydE-02SY;
	Tue, 30 Jun 2026 06:36:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS5B-0000000Fybk-2B9I
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=; b=m7F+T2nfwHHUihoB6JIGQTTIS6
	XxkU+2jP2BJjjIOi8Rf0pEkaCFKK8T/yqDufggNyvA12uoJN/HiYYjcR0+uFUwxzgNJSHbxyRxei+
	6AHjPSiZCpk9R4JVoJBi7SAsa5BCpLaTqKBuic0h3WxUIIbg/12OYR2NYerZFfOtImOML2FppRoLH
	TbEtm5W9TSMv4Fv3Zr9OuXL9e9DjxHB4M3nv06ooWJCsrQMyw4XPbn8/4LrcDb7j4ZNw1YiHY7CB3
	DjbsZN6iqpl2Yf7Ci1aZcy6QlemRuMu4zsrIELXCc5aHh7580iqvq0f5X8BzNhzQ600YRopxhoX6n
	eYIY/VwA==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS57-00000001ZCh-2deJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:36:32 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8478a25f268so1050587b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801387; x=1783406187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=GAcJDKOpQzWI4ZsYAjmUA3QQGc28u5OEXMLcKjXeQ8J+nlqfJfOO3AEQ8svk5fO6FD
         2Yf0I+OQROYYxZA0lBTXO0FqRmiKKUWmvKVWqcDWpEljBq/OYSTkoTgUJNWFA4G+FqTT
         eHIc1mL/czVlLnpoTdTztVOQhAnwX45cW3ZEzIObZZ2Bz9PYYlXceUVqPAkiPTDmXQYP
         YQ/gvJLlYHQMawRb4e3JMmFnbCCvUHjFYjnE+LWNS5xUVbOpgy4iq6E57JirIlIJhPds
         1CpEPX8VMf6YPgb2JH89w0N6AiFe02VF6xVI9YolO2QzC3HLdYoNNZFd/CBRN5JhjXHk
         Cgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801387; x=1783406187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=bOABpV90JjHHGPbw8bGYrtV5x4YltzpGZ5LivLILIntDMQEFQRhaq2Bidcwe1GH/T5
         uTE90rsYPH+ozbJkPggXZQW9du0IP45GVe2VokBGJ8KocjOyoPGDiPxoKphQZ/NAmu7/
         zKRxrYhYPCDFR87xhG9Lsmxhb2x7yNTgUgjc/H8sjx6BD37oL0YsYFlp+zJRkDDW48H7
         Ax9NIURp3CC5XYEnGuNDnAjWFUe1Xfs8kW7EN37TEEVUOII3tAhOIlK9NhYw/Cxk14qw
         dDO4eWq9gAeS4YWRxvvzvxAFVc+CaVdSY4KhwX1V+Gqlf83Ak2uObV1y8JJf9H04RFQo
         IngQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqg3rkZYaQoojcIsIkrjytzXhglpzteUpakcQB4q6JNOezAmhjvHjz/evivUKQkOc1NkSKurvfYYZOV2GyU67wh@lists.infradead.org
X-Gm-Message-State: AOJu0YzSvZdup83mzDEJX0//b4PfTXRWJkDTaskF7VAGzG3e0GSozB/a
	wC7ByaH9Tj74ZZqX4AUT745oEC1xIO53ROXC/q4oLLPGmAJTVaeAkrTy
X-Gm-Gg: AfdE7cmNhOB6eUDGsNwwABL8NF3hBi2Ud044skc8awYnXOXB8q0vBT5iUGoV+CIoDHz
	wvZD0WdMdmZpt7Vr3IYvif9P9ftFX+cJf2DClUfnWGzI/uZMoFvnSkuiPpIeAvfdgPdPCY/tuJv
	rY2THH+ryIjj9bDH1fz9jSubW1AMj94Tiln0nc7yTrxSqjvQyKZ9rqesIxc/QIQluK2BugbyaCL
	hdKnA8xRl+z2yCAf2wCtgD2qqkrD1L51ltM1Buv9VSNSHgtCt/FNoW9bdEL0M4o82jN0CVyLfRn
	qCFUsUMlgPqNHuV/S2AcjTqgPGGzE24otBAQFqZjQuMwPiRCBv1GdxIUdh/c6PzdmwExDMmccJR
	apNEioat8pTK+/2IKpBdsKRJiGbitMJcy8dfKTAuhUzIAneNf/JHYy3q0Ud3Cc/+b/I4XNx73BE
	LAkFiYnw/G54u0ToB1dH8SiqDtiPSrxoQyrSEUsjmKacS40sY=
X-Received: by 2002:a05:6a00:995:b0:846:169c:d815 with SMTP id d2e1a72fcca58-8479f2d139dmr2002482b3a.60.1782801387427;
        Mon, 29 Jun 2026 23:36:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:27 -0700 (PDT)
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
Subject: [PATCH 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:30 +0700
Message-ID: <20260630063449.503996-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073629_826066_898A7FDA 
X-CRM114-Status: GOOD (  12.70  )
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


