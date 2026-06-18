Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE39CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=; b=37ZT70ssnQix6+0a9aQf/j65Qz
	lVnyX0qqmKo7ZJKhlk5rXpL1zJabhceu+pc00nCGPCHD6niOegrh/HOP9bU3HMHEen/wLZO/V3tX/
	+ROB78UM6judobVZV8+hMlrX0LBK+RXZ0alucIVRj34Z2lPOtrXLXa5RqpC96qeytx4eAkTJQWML0
	EVC/zjTNOMTOSOvV50lQxzOVbLwtUbxbcfBnTjOfsHdh0JsRERz3WkMjd7pUEzi3tSa0e9htXDcJX
	GeGud8nZAhu/MXwWuHixh5npNo73s7EeQ38EN58MWVC1qXLCtdYM3DEjZHvRziC3sCYQ+kHVTIuHu
	kKZLNzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAeg-00000001Amn-2XxO;
	Thu, 18 Jun 2026 11:11:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAef-00000001Al3-07ZE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:11:30 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bf22d29dabso5173335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781088; x=1782385888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=ARVkCd8PcvVQD4UgV7ioCFgLFsQRjPIRTj2+W3SO+0rB9Vd3eC7e5J/R0eik/ffT93
         9xgT6zVbQxIC52teQp6OmVBJEL4oiz8nNhPQAgl0ZJnqsNBRmyiSSIIDlNkvvs7XafmW
         Dp6itzV9MFcPFmiyOXSL/WvYPB7W4TZ1emmeLZ/c3kx/7yabIfMIomZCjXTmrkTzOcNG
         ZhI/2jx+53wYMk/WE4qfPa2y8GjPVxMaGRsi8wKSMPhTXWb8i1cDUcL0wsI45ET8CLyL
         XYE2TDSsxNIMj3GrYjs7H8qA51u3K5GDJZTOwy+p4IlIUYw/zN2DmHN5qTYUGdwMmpwS
         d/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781088; x=1782385888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLWN4LTtmd7hng+ZhZtLQKsiVn6dQ6fE8GmkqrRR6IA=;
        b=afmHBfrMKcvvTj8LAk3DS5QCg6qLiwMxizkszsV4eNGQzOFj2oSMGyxd+ga9tHR4nB
         MafGDO4pm9tzIxJuJJMK5EIDcNPwZM6QRjKdikJm01HNeO8Rxak0LHsCkAK42fS/y1b1
         zW+Vtn+Y9gqJK8AzfHwxJrMeUtONJe3W/FD1nHbBvWqadkZLUNvOa7pbtGG/A1n/ojTq
         hdwUte5SB1/xsEWb7N+l+FxkzcPJAOuyPwUszucT+AOeAYMGCsrrWmgaHnH2Mawfjqs2
         SUyODTNGZh4XUX5Abaec+ZmNMuXMG6X5UArCDAYqRN0lj4DK/vI2f7WogsvPJ8BZli59
         1X9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ocl0smaLw7UJrAIwqYHrBvh/NL/BuMsH0mbY1phBRaU5bvqccK1t12F/W4KMF0mjYb7wbr1QpLFhZleMzJnBH@lists.infradead.org
X-Gm-Message-State: AOJu0YwFECUx/4LBnSALgj60/BTiyuRRVLZfTCuewEIrDD9OBz1g1AfJ
	iA3RQlZDoAV2Zhp33AHf4QfbpXI0n1/tf7NH3XePHJiH2yzoXGOdVn8V
X-Gm-Gg: AfdE7cngqRIh5CIFoSylD/GhUCqEp8NBktSllgf9CTd9v8LVQRu9B08xTrhESj36HHR
	+BLs9uv251aN7NcfcxjItK15I4XguPqQ4VxsIAfh7USxT8lJHYVdkLQfBCZ7FRd0ObQ8uminbx2
	epFRK3+vZpel1tCZKR1irKh7wGH8XzKGSCQxpIBaUwHBf4mTHTBUOAUarJmQzghOK9LRpnjwVQF
	G1elM7vAI6yf01oP5vi/HlGOri5uxGvTRPseOr98yj/Nm18CpdN9kG4/moI26DOLWBe5ohbjMfC
	OD2ELO1UEhGJZVOOFfTz1PNcSSs2b8fAB1n6v3C2mxQgQuDh8C9dQSs7Q1CAECZ8dVs89KGXeb4
	960EUJTeqDBqytc7pvbAunrVoxoHpfcpFvYg/yT65l2qmzYK3DgZrZpATWW9zNDELLMrTLM8gUT
	XM0Na1TFyMV4mvnLy8UWLFlR7+Z/g4K+ZXN2eWKg0Uzs155Pl3XeRUwz+jFw==
X-Received: by 2002:a17:903:1a6f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2c6f340c78cmr24421195ad.1.1781781088169;
        Thu, 18 Jun 2026 04:11:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:27 -0700 (PDT)
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
Subject: [PATCH 75/78] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:24 +0700
Message-ID: <20260618110827.232983-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_041129_068724_6AB0A728 
X-CRM114-Status: GOOD (  13.69  )
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
 sound/soc/codecs/wm8994.c | 51 +++++++++++++++------------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 1d64c7c42ed1..58f18bb0057e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -766,7 +766,7 @@ static void active_reference(struct snd_soc_component *component)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount++;
 
@@ -775,8 +775,6 @@ static void active_reference(struct snd_soc_component *component)
 
 	/* If we're using jack detection go into audio mode */
 	wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_AUDIO);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void active_dereference(struct snd_soc_component *component)
@@ -784,7 +782,7 @@ static void active_dereference(struct snd_soc_component *component)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	u16 mode;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount--;
 
@@ -800,8 +798,6 @@ static void active_dereference(struct snd_soc_component *component)
 
 		wm1811_jackdet_set_mode(component, mode);
 	}
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static int clk_sys_event(struct snd_soc_dapm_widget *w,
@@ -3704,7 +3700,7 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 						  open_circuit_work.work);
 	struct device *dev = wm8994->wm8994->dev;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm1811_micd_stop(wm8994->hubs.component);
 
@@ -3718,8 +3714,6 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 	snd_soc_jack_report(wm8994->micdet[0].jack, 0,
 			    wm8994->btn_mask |
 			    SND_JACK_HEADSET);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void wm8958_mic_id(void *data, u16 status)
@@ -3785,27 +3779,25 @@ static void wm1811_mic_work(struct work_struct *work)
 		snd_soc_dapm_sync(dapm);
 	}
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	dev_dbg(component->dev, "Starting mic detection\n");
+	scoped_guard(mutex, &wm8994->accdet_lock) {
+		dev_dbg(component->dev, "Starting mic detection\n");
 
-	/* Use a user-supplied callback if we have one */
-	if (wm8994->micd_cb) {
-		wm8994->micd_cb(wm8994->micd_cb_data);
-	} else {
-		/*
-		 * Start off measument of microphone impedence to find out
-		 * what's actually there.
-		 */
-		wm8994->mic_detecting = true;
-		wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
+		/* Use a user-supplied callback if we have one */
+		if (wm8994->micd_cb) {
+			wm8994->micd_cb(wm8994->micd_cb_data);
+		} else {
+			/*
+			 * Start off measument of microphone impedence to find out
+			 * what's actually there.
+			 */
+			wm8994->mic_detecting = true;
+			wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);
 
-		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
-				    WM8958_MICD_ENA, WM8958_MICD_ENA);
+			snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
+						      WM8958_MICD_ENA, WM8958_MICD_ENA);
+		}
 	}
 
-	mutex_unlock(&wm8994->accdet_lock);
-
 	pm_runtime_put(component->dev);
 }
 
@@ -4028,11 +4020,8 @@ static void wm8958_mic_work(struct work_struct *work)
 
 	pm_runtime_get_sync(component->dev);
 
-	mutex_lock(&wm8994->accdet_lock);
-
-	wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
-
-	mutex_unlock(&wm8994->accdet_lock);
+	scoped_guard(mutex, &wm8994->accdet_lock)
+		wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
 
 	pm_runtime_put(component->dev);
 }
-- 
2.43.0


