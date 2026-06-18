Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A03CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B+5iMTEe+TMtLaXRee64f4hO5oI+4SkVEwQJjwWAAKo=; b=TZTuWfB5fkp7D3LFJ7crB+obVY
	jsXQAuBLse25z5modUAjmoiZKQ1qIk3XsjSoXXS4KWBgn2YKrn4NRj4OMGc0jpff52Lj8MVgZXAYK
	msQltXtU0z62/6WNB/KsqBYIeH+W5LkmfLAkBaKn9PxJ0Ta00W0RmbOW8gcBaJj9mGEvRd3zb0p6q
	YZViuSQI3/Nk1tHEg7XId9W2UufXymnGXu+fln+vTkdtfPjl4fKSDvwH8tRnFS7UsSl0CRg6rElxe
	RwAV9BUkH6aoHEVFtP5uhfwzkSodKLqlhz0tG3g9QFFMyBE9InP6vGceYNkJk7itKKJ7LaJWkCyJ2
	bNCAbSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAd3-000000019S3-1si0;
	Thu, 18 Jun 2026 11:09:49 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAd0-000000019PO-3NR3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:09:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf3781ca51so7468705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780986; x=1782385786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+5iMTEe+TMtLaXRee64f4hO5oI+4SkVEwQJjwWAAKo=;
        b=Mcv0FfPa/g5Jn3cjJ1NCZMzfGh3LwI0AbiSmkgjhEaatkalEGR18/1U+dMxXWPkw0B
         cSounyzavwF8MlaeBxKPiJWhHlWcqIHGq7z8SBVE7vvH8dDzaI78Frqp0AHG48C7eaGT
         +tCJiNCJWMuVzpaXe5nSe7Vuiz3kL54wManZ+5f3h4FFUafsdnRC4OoZQLPjE5r9dQuv
         m7c/Xx8PXGtkRZMFRcpJEzEi37o6+72L3F3Ni4VG4NXQ3Ap+VMKvwecGcIGM6eVxUGV1
         xT8f0LoEpLYwlScNuxR08ARpQ6rKqW0FffAwVTFU5/IUC+MHBzp4GE70qgRdKAvpWU1t
         zfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780986; x=1782385786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+5iMTEe+TMtLaXRee64f4hO5oI+4SkVEwQJjwWAAKo=;
        b=AMTMZdQIcf49GVx9lLGkGH14o2a/Asfmu6Ae/Pke/fK0wBObqA5or9mwH8rAEL6k/n
         sppPAXCHfYefMZ+2/RX9JBt+YRe9IOQChSQDPK2jjAvseuO9n3FYqwPsuKexmerWEuBn
         lt4dNXAQxg0OmvR5NwyFMd9oBfog/g6pqhsEuMxodSO4905SnU/EWuZIQnutx8UvwTsp
         brogVt75Db6YT1zrOVbqKvteCEEzqF/S3iWE0/1+FAxfqBQf0JUjBrSrdCsR15ieBm/Z
         NSa7hvfrM/Q2jmfMskoD0/14hF45tWOGCBVql1c0QkG/Z7LFP/B2BnB8wh1ShbZcfYAZ
         XWlA==
X-Forwarded-Encrypted: i=1; AFNElJ+kyEzdIqc49klMHyVYyb63exp8kI3rCZldVcpP4gWVrjb6WAcpftJBDAbLPOMbV3JybmBchpPsz54uutnm0eB/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp28dzIylV+U4eNKAbbW08xF7gH3YSqXa1WNPAgNy5rTZ5mf0F
	xruPveV7C96znpQQ0Q3kLGICLyyjR6rfuJ/yWYXXpilkud9nmNbEhkYH
X-Gm-Gg: AfdE7ckHZ+dZ2/hQL+yEp20pjEV0bdvs4b1N8jXdT8tJBuuPS/LJaLp/goZRZQ1Qlkc
	xU7TILYKz9J29ttGKHnwA8gJRrRW6Nfbci8YTWBZ+tN9Vr7x0Nj147bL5c20CU8m5l5lElqQ93X
	vzEd5UYwlohnI0gCeAgz9GlbEm/WbXTcrhGqdMHrdqWWayDHNYsT3wyhzrD8kiwznw26+ZLJKlf
	vKe4JUgHscBwBq3v1IsCVwxpLlQD3B8oovsyBOWFSeD3ZRRAOsoZcHXMktA1+ntYIq7TdTpVmjr
	JxliWsZ9FWtQgM9oXYNwFWqEC7D/A3xjyUyq9dN5sy7V9Fcg27rGZ5iobwIS8Zb8bLaileNt6vQ
	pkF6Jm3g7XVm2lB7innaTZFgJJ0mXsplBcBaFYBzfDPicf7G43xdgqJppozCz7GcfzIqI5fIHB2
	tsEvSkCUTqDvsNbZQB0ICjeKxY2bqo61dxWEhbU3ewzEVGRmY=
X-Received: by 2002:a17:902:f681:b0:2bf:175a:db61 with SMTP id d9443c01a7336-2c6e471a08fmr36744085ad.7.1781780986069;
        Thu, 18 Jun 2026 04:09:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:45 -0700 (PDT)
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
Subject: [PATCH 63/78] ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:12 +0700
Message-ID: <20260618110827.232983-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040946_852499_8208DDCA 
X-CRM114-Status: GOOD (  18.12  )
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
 sound/soc/codecs/wcd-mbhc-v2.c | 142 +++++++++++++++------------------
 1 file changed, 66 insertions(+), 76 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index bb0c8478a8eb..b8e87d0b79b1 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -419,9 +419,8 @@ static void wcd_cancel_hs_detect_plug(struct wcd_mbhc *mbhc,
 				      struct work_struct *work)
 {
 	mbhc->hs_detect_work_stop = true;
-	mutex_unlock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	cancel_work_sync(work);
-	mutex_lock(&mbhc->lock);
 }
 
 static void wcd_mbhc_cancel_pending_work(struct wcd_mbhc *mbhc)
@@ -458,7 +457,7 @@ static void wcd_mbhc_find_plug_and_report(struct wcd_mbhc *mbhc,
 	if (mbhc->current_plug == plug_type)
 		return;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 
 	switch (plug_type) {
 	case MBHC_PLUG_TYPE_HEADPHONE:
@@ -481,7 +480,6 @@ static void wcd_mbhc_find_plug_and_report(struct wcd_mbhc *mbhc,
 		     mbhc->current_plug, plug_type);
 		break;
 	}
-	mutex_unlock(&mbhc->lock);
 }
 
 static void wcd_schedule_hs_detect_plug(struct wcd_mbhc *mbhc,
@@ -517,7 +515,7 @@ static void mbhc_plug_detect_fn(struct work_struct *work)
 	enum snd_jack_types jack_type;
 	bool detection_type;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 
 	mbhc->in_swch_irq_handler = true;
 
@@ -578,7 +576,6 @@ static void mbhc_plug_detect_fn(struct work_struct *work)
 
 exit:
 	mbhc->in_swch_irq_handler = false;
-	mutex_unlock(&mbhc->lock);
 }
 
 static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int irq, void *data)
@@ -673,29 +670,28 @@ static irqreturn_t wcd_mbhc_btn_press_handler(int irq, void *data)
 	int mask;
 	unsigned long msec_val;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	wcd_cancel_btn_work(mbhc);
 	mbhc->is_btn_press = true;
 	msec_val = jiffies_to_msecs(jiffies - mbhc->jiffies_atreport);
 
 	/* Too short, ignore button press */
 	if (msec_val < MBHC_BUTTON_PRESS_THRESHOLD_MIN)
-		goto done;
+		return IRQ_HANDLED;
 
 	/* If switch interrupt already kicked in, ignore button press */
 	if (mbhc->in_swch_irq_handler)
-		goto done;
+		return IRQ_HANDLED;
 
 	/* Plug isn't headset, ignore button press */
 	if (mbhc->current_plug != MBHC_PLUG_TYPE_HEADSET)
-		goto done;
+		return IRQ_HANDLED;
 
 	mask = wcd_mbhc_get_button_mask(mbhc);
 	mbhc->buttons_pressed |= mask;
 	if (schedule_delayed_work(&mbhc->mbhc_btn_dwork, msecs_to_jiffies(400)) == 0)
 		WARN(1, "Button pressed twice without release event\n");
-done:
-	mutex_unlock(&mbhc->lock);
+
 	return IRQ_HANDLED;
 }
 
@@ -704,14 +700,14 @@ static irqreturn_t wcd_mbhc_btn_release_handler(int irq, void *data)
 	struct wcd_mbhc *mbhc = data;
 	int ret;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	if (mbhc->is_btn_press)
 		mbhc->is_btn_press = false;
 	else /* fake btn press */
-		goto exit;
+		return IRQ_HANDLED;
 
 	if (!(mbhc->buttons_pressed & WCD_MBHC_JACK_BUTTON_MASK))
-		goto exit;
+		return IRQ_HANDLED;
 
 	ret = wcd_cancel_btn_work(mbhc);
 	if (ret == 0) { /* Reporting long button release event */
@@ -725,8 +721,6 @@ static irqreturn_t wcd_mbhc_btn_release_handler(int irq, void *data)
 		}
 	}
 	mbhc->buttons_pressed &= ~WCD_MBHC_JACK_BUTTON_MASK;
-exit:
-	mutex_unlock(&mbhc->lock);
 
 	return IRQ_HANDLED;
 }
@@ -768,62 +762,60 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 		return ret;
 	}
 
-	mutex_lock(&mbhc->lock);
-
-	if (mbhc->cfg->typec_analog_mux)
-		mbhc->swap_thr = GND_MIC_USBC_SWAP_THRESHOLD;
-	else
-		mbhc->swap_thr = GND_MIC_SWAP_THRESHOLD;
-
-	/* setup HS detection */
-	if (mbhc->mbhc_cb->hph_pull_up_control_v2)
-		mbhc->mbhc_cb->hph_pull_up_control_v2(component,
-				mbhc->cfg->typec_analog_mux ?
-					HS_PULLUP_I_OFF : HS_PULLUP_I_DEFAULT);
-	else if (mbhc->mbhc_cb->hph_pull_up_control)
-		mbhc->mbhc_cb->hph_pull_up_control(component,
-				mbhc->cfg->typec_analog_mux ?
-					I_OFF : I_DEFAULT);
-	else
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_CTRL,
-				mbhc->cfg->typec_analog_mux ? 0 : 3);
-
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_HPHL_PLUG_TYPE, mbhc->cfg->hphl_swh);
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_GND_PLUG_TYPE, mbhc->cfg->gnd_swh);
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_SW_HPH_LP_100K_TO_GND, 1);
-	if (mbhc->cfg->gnd_det_en && mbhc->mbhc_cb->mbhc_gnd_det_ctrl)
-		mbhc->mbhc_cb->mbhc_gnd_det_ctrl(component, true);
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, 1);
-
-	/* Plug detect is triggered manually if analog goes through USBCC */
-	if (mbhc->cfg->typec_analog_mux)
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 0);
-	else
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 1);
-
-	if (mbhc->cfg->typec_analog_mux)
-		/* Insertion debounce set to 48ms */
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 4);
-	else
-		/* Insertion debounce set to 96ms */
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 6);
+	scoped_guard(mutex, &mbhc->lock) {
+		if (mbhc->cfg->typec_analog_mux)
+			mbhc->swap_thr = GND_MIC_USBC_SWAP_THRESHOLD;
+		else
+			mbhc->swap_thr = GND_MIC_SWAP_THRESHOLD;
+
+		/* setup HS detection */
+		if (mbhc->mbhc_cb->hph_pull_up_control_v2)
+			mbhc->mbhc_cb->hph_pull_up_control_v2(component,
+					mbhc->cfg->typec_analog_mux ?
+						HS_PULLUP_I_OFF : HS_PULLUP_I_DEFAULT);
+		else if (mbhc->mbhc_cb->hph_pull_up_control)
+			mbhc->mbhc_cb->hph_pull_up_control(component,
+					mbhc->cfg->typec_analog_mux ?
+						I_OFF : I_DEFAULT);
+		else
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_CTRL,
+					     mbhc->cfg->typec_analog_mux ? 0 : 3);
+
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_HPHL_PLUG_TYPE, mbhc->cfg->hphl_swh);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_GND_PLUG_TYPE, mbhc->cfg->gnd_swh);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_SW_HPH_LP_100K_TO_GND, 1);
+		if (mbhc->cfg->gnd_det_en && mbhc->mbhc_cb->mbhc_gnd_det_ctrl)
+			mbhc->mbhc_cb->mbhc_gnd_det_ctrl(component, true);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, 1);
+
+		/* Plug detect is triggered manually if analog goes through USBCC */
+		if (mbhc->cfg->typec_analog_mux)
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 0);
+		else
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 1);
 
-	/* Button Debounce set to 16ms */
-	wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_DBNC, 2);
+		if (mbhc->cfg->typec_analog_mux)
+			/* Insertion debounce set to 48ms */
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 4);
+		else
+			/* Insertion debounce set to 96ms */
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 6);
 
-	/* enable bias */
-	mbhc->mbhc_cb->mbhc_bias(component, true);
-	/* enable MBHC clock */
-	if (mbhc->mbhc_cb->clk_setup)
-		mbhc->mbhc_cb->clk_setup(component,
-				mbhc->cfg->typec_analog_mux ? false : true);
+		/* Button Debounce set to 16ms */
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_DBNC, 2);
 
-	/* program HS_VREF value */
-	wcd_program_hs_vref(mbhc);
+		/* enable bias */
+		mbhc->mbhc_cb->mbhc_bias(component, true);
+		/* enable MBHC clock */
+		if (mbhc->mbhc_cb->clk_setup)
+			mbhc->mbhc_cb->clk_setup(component,
+					mbhc->cfg->typec_analog_mux ? false : true);
 
-	wcd_program_btn_threshold(mbhc, false);
+		/* program HS_VREF value */
+		wcd_program_hs_vref(mbhc);
 
-	mutex_unlock(&mbhc->lock);
+		wcd_program_btn_threshold(mbhc, false);
+	}
 
 	pm_runtime_put_autosuspend(component->dev);
 
@@ -1327,7 +1319,7 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 	unsigned long timeout;
 	int adc_threshold, output_mv, retry = 0;
 
-	mutex_lock(&mbhc->lock);
+	guard(mutex)(&mbhc->lock);
 	timeout = jiffies + msecs_to_jiffies(WCD_FAKE_REMOVAL_MIN_PERIOD_MS);
 	adc_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
 
@@ -1342,7 +1334,7 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 
 		/* Check for fake removal */
 		if ((output_mv <= adc_threshold) && retry > FAKE_REM_RETRY_ATTEMPTS)
-			goto exit;
+			return IRQ_HANDLED;
 	} while (!time_after(jiffies, timeout));
 
 	/*
@@ -1359,8 +1351,6 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
 	wcd_mbhc_elec_hs_report_unplug(mbhc);
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
 
-exit:
-	mutex_unlock(&mbhc->lock);
 	return IRQ_HANDLED;
 }
 
@@ -1622,10 +1612,10 @@ void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
 	free_irq(mbhc->intr_ids->mbhc_btn_press_intr, mbhc);
 	free_irq(mbhc->intr_ids->mbhc_sw_intr, mbhc);
 
-	mutex_lock(&mbhc->lock);
-	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
-	cancel_work_sync(&mbhc->mbhc_plug_detect_work);
-	mutex_unlock(&mbhc->lock);
+	scoped_guard(mutex, &mbhc->lock) {
+		wcd_cancel_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
+		cancel_work_sync(&mbhc->mbhc_plug_detect_work);
+	}
 
 	kfree(mbhc);
 }
-- 
2.43.0


