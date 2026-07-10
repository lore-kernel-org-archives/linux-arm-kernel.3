Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2A9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=; b=E+Ws+VjOwYSRZbBxibzEFQQAH0
	R94ap4Pe2Q2fdA2CUseDUD5ebp50X/LwM31r+8aA0Icytg+Yp13ir1BCPft8OVAU5zqZ5AYe3TgKO
	lTJvZugEK1hrpgWLlgctuOfnfO3z5HNwDz025dXbFK6O6t15XqIESyHiYXY0BRGQHm4zXqluNfMKj
	Uh0wLTUUzv+wzrFlndvm8TFh994qYw4NYv4TJZi+b6i+kDdOWcq8kCENl2hF5ouRNjdoHt8fW767N
	d0VoXCBKw8138KBgwp+huLDQlTEkxAo5k5VkTp+OcijoVhYKuWVTD85i8z2uSyLWOneAJCjffg+0r
	r3TtRVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RK-000000048Ea-2ITX;
	Fri, 10 Jul 2026 05:06:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3RG-000000048BG-1UXH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:06:17 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84783bce476so581460b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659973; x=1784264773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=gYK1+CFYtnXlGqoTT1NVlexvGgUqkp+bOywPo4zbfN1D3zoworNIZ/KKvb+c5S8Y+3
         l8r+x+4ATv5bhVQ1nJeSmoIT2Ad+e07GLyq5bV4k7F+usUeidC8pSbMX89W5E4e2qQzE
         V16WXK+/uT7R3jbSzwQng+uIzbWSUIsGvonWFkXXkhOHVyQfyQvYxUW2qG/mZjJ29D2/
         XZZd3k45TNb9ZMfK1lckEgi8u0MqOrQOV7UGRmznDX02ORU8twSBOdQD/vHJ1qOFAr4J
         mDacH7VbPK2Jqcljdm1pl9uIaFMF53LEJm0TgmLm6ZMeGkWnNugQ4FhNi+7mNC/6kjcV
         QM/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659973; x=1784264773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=TtXCedfqtGa6jo3wZ27KW/VekJsb5Bb+m5vv34X4Uvvz1gyU8Duh4DoJ+UHbsr6uMz
         8nqJOhxFl4RfRW7h2GNLqA/5MHBTK48HKqgb3J/s0Xf8wYgSh5LkprhW9xhjI4JvADYr
         9a+2o+lUIFSCszNsuFPw/DMT5+YramiT+z7eaOqVo20k21VD0Jds3zDB5tiZOznitoXL
         SzEidj3YHdmRI7M4BJgmXeLFmmI1HsMvoItYeXXt2lk+xyXQ80UyVfGHKQppvwHUBb/U
         4uSil4X10y1plB4g7H6Pr0dWS/QNa+/wwOhEUffpo4waoQEQniungoTuAv/JL+DkQLhM
         5EzA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3Wu/pQmMs+9apHlUrwJOsiftRw2XEFMExnj85cH6o28v2ZTiLCDkwwzcNNOXemGXf+i9Jjq7YpD6WvxRtF76m@lists.infradead.org
X-Gm-Message-State: AOJu0YyFtQDPGlcHdScCj4VAVl1mumtkDYPo2hCz05qtYjvtM0Z6OUiC
	gXD/O6uIBpZtVuruAkbvzkdSWWna6ErOY8Hb+8X8uCyDtvvm2ldQ3MJt
X-Gm-Gg: AfdE7cmsxqIRe1pZF2Hzb7U+IAXc7mD+z6q0YSUim8ylpYG8Q1vMAV5Fe67TWdkvqgb
	221iB/EYB/cnMy5pXrn//4+OXlZj5F2cSQSOKKhWGzalvjpzN2BOzEQj+E4la4AOWF4/7CRo/f3
	OBDFyhiQieJsn4yOzRs8oJjSy0HxLRAbSvF+bR+/6OPUEZJ33lKqI4sc6+4tdC23oxsa9/xD9zb
	LV9NsXNCwSZaizXWukRnIv3tNmCFyIBRLT5P/vmk/+im/XPHmbgOK9B7BUepKGiPozju7gIyzWF
	PxP8/7leg+1xGgA3UAsdSGeGEJ4OovBknJhORDpV2rUtipA8czqro9xMjSJgM0qWoqA1SWdQPkD
	KQt3J8y6btp7uc2T6kiR/kEzNgHHlORy6LqxbP0S3oomDCk92CmY7aok4nxtsPHK7VD0pBauDLe
	gXbwVQlSsE6DNvBVuiRXA12YV5BcTPaiTGdRcIjFDvYJHQLumDL/2MUHn9Kg==
X-Received: by 2002:a05:6a00:98d:b0:848:63c9:ee38 with SMTP id d2e1a72fcca58-84863c9f684mr4368247b3a.39.1783659973416;
        Thu, 09 Jul 2026 22:06:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:13 -0700 (PDT)
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
Subject: [PATCH v3 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:52 +0700
Message-ID: <20260710050511.14439-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220614_395964_12B20CA5 
X-CRM114-Status: GOOD (  12.83  )
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


