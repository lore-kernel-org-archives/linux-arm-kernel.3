Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F56CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=; b=2hh/fLmGPTtWuiB2UUYBX2LOXu
	lDmSQRESc6+Fn2ThYkEkLPHpb9cQZUPVUPT7AD6FkJ5scel89OpRcXk0qHiIgP0cq+8IoOwR0k+dm
	nFWXbN7pfmwcVZqfezmR17cixY8/bbk31zF6a7RhQpO3lzPECVKBQqHbRDFwZ9sxY4q9fJFTOCpiJ
	s0pXnH55PH7v4udRsm0o9mrO4ctN0vez0l6ok6W+CkAi1jW2MlRSZbvbKSwaB6jlL+8EzgRkSU586
	nHt9hdovq04AW17m1Lc+KaAWKMVqCRF9wuNQXCj0gm4882R0d0DYkOYfNXc3WF7i62/QK9Buv10Tt
	0ZsR9SCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdS-000000019mN-1d2d;
	Thu, 18 Jun 2026 11:10:14 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAdQ-000000019kV-2YL3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:10:13 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c8857a27041so367638a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781012; x=1782385812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=;
        b=S4bGZgEL9UtjS5lT/1Ii5W1aIPrGb4HFBWstsBTGWdYdgsytHNRDI9J84MQWOeSnHb
         GBDdoqu+ukHQynUJFlWcIt4zRgNesgg/TGx2KJ2yHxbA9ak4QaoN1qCeLUWKZTwawvuW
         FBhElrktWU87nPtBLzut57nmvIKbzZpCQw3Y0SUt7OOGnVPFRvNsgHYdndzDW2EDL2P9
         HbmOn3KalVRNXhvKZQ/D550NOOMsI0aAge/ttvEiSed2VTRjJdZ6TE6abqoKGoQvX51a
         FDC0q/wUvn4vC7O7J4H8yVtHcQduwT28op+9ycrE+koevSyrSKm9c6gjjzuVekhqyTi+
         iCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781012; x=1782385812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9U2r5uO0a4sNNWl3fg9q20Rk8WeevWmhUpMadyTlIYY=;
        b=jPcurXb6WcipJMzrIdBq++Z/CM5ispt94+PYskYUeMXOJGdhcoipinuMAlxjAPCvU9
         8tvD3aGmZfcvxdPgjvb4eKesIH8sw/hzkHfnB6fzwrRQcWiMWB5mHOASBvKhP08hACej
         jBSgVoq09hwNU6FGG3aPPQXCNZsku3ROYa+IVIQQ/9i+focLzN+02TbjAH4kgXFOZ763
         ZRBj+eYjEl5cqy/L14T/ggl43jssQ+KMeRGnvPxL10wuqWG4rEWtNI+dxL0idfJkCZvk
         Bc26j+VUCsLz2DJQBYh7fUbxcTJ0yyJP//1vWmW4m06kQxhoowgeWEW2KDIO4vTzZuSu
         MDcw==
X-Forwarded-Encrypted: i=1; AFNElJ/s8Z8liqBuWekAqGDRA1atYyFICBDv6PZR7Ds/F3XyieAdEUe4I1+TrJOgJ5YAjxdcalkLPImEPHcbVh2tQiG/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1Fxcw3x4VrkQrg6o4aal/Z5kTbGIbGNXOad/PMUyw0XVWMLa/
	1K583tfiULzEGjGoTzJ3o6EAgPYM/7aWW2Zh2XiKX/mQLcn2sA6ySVnd
X-Gm-Gg: AfdE7ckX/pzh3cD1adzQk0jEHIoGwqf4wTk3KuJ6fw82hciOmQNboqSbxI3DLiWDlk3
	AwNwdisFWROiQrScxuqxyk9vl+jArI6L6L4vvPdBj3LpIlI11jew0bl1nJodu0IUNPoIuE0qKUV
	Pbg/dqLZMX9uyk4L/uodAtQsW1iFIIhmpnRDeKy72s6cVKrL6ZNBZGs4SQzctvubUWKRgZ/vPhp
	83VPOrFSEOiYk6vNfva2gP6T63ng1iFHgzdFgeKHSFlHfh873ZyhsVty1ajrq5w0rfXx4lXe2VM
	9fG/GiTXEgBPn4oRT6AhOexyN2/vP1dQsXf8rOnweFi5Me4ipMy/H8YU4MijNqL44vHmMR8SAax
	n4h/C6JqFP8SrrZOzwrNufOFQdYgRn+Ck4H3jPhbalw+2HXF0Tiph/7UAO9DtSC3tkvV8kK7YCM
	l2267E5G6uMPAPjVe3W0mufK8/ZiACv+tkUBsH5vZPz59ZKiU=
X-Received: by 2002:a17:902:ec82:b0:2c0:b5c1:8e3e with SMTP id d9443c01a7336-2c6e472d580mr33156445ad.8.1781781011500;
        Thu, 18 Jun 2026 04:10:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:11 -0700 (PDT)
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
Subject: [PATCH 66/78] ASoC: codecs: wcd938x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:15 +0700
Message-ID: <20260618110827.232983-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041012_704143_9874882E 
X-CRM114-Status: GOOD (  14.25  )
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
 sound/soc/codecs/wcd938x.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c69e18667a85..9eef1ecec352 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1976,7 +1976,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1994,7 +1994,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd938x->micb_lock);
+	guard(mutex)(&wcd938x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2009,15 +2009,11 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD938X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD938X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2038,9 +2034,8 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd938x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0


