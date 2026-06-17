Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E121CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=; b=GhN077pa/7IJX9Eus3jDzKbXQc
	tbMTCl9mX4wqY89w7MwyHcYwJ7+DkMAhzJTxAXHHlTFHx37RLztP5A5Oa1hDT+6vzUEud6vVLc/61
	ohGo0onOLMPszW5Xy+iqpvyqIdI8y9hR1T8D7iqAoYKyx03mWL4hPVskK5NXB8XdgwN54QOl0OVeI
	sVJIQhspaCi46wdstKv2G4ycSXgFw8X/VDwm9wUeefk87ic5ZHsy2oTVbkn5Ji26BnfF8n9mx26iQ
	Mckif4rSvwkXyLf0yU+ZkVZe9HxuM/DOFhMF5T8r8OWiesKAVGy7BELy6XLVeV2Jd0Br3+JnTx2Po
	OOl032aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnc1-0000000H56H-3Axy;
	Wed, 17 Jun 2026 10:35:13 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnbz-0000000H54V-16ig
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:35:13 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-30b9e755555so4893378eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692511; x=1782297311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=;
        b=rLecio2MTX9cCNVszobyh6Fy9A4QcmTlJo4GssZDwnt0FF5Xf+MYtg8WQn689+IRW3
         OSIYZGQmr37/SID/9EVb4dISTfQAcYaMLyI/bz7MKNocwTla93CHoSQwG2hxOiMn/Lbv
         CnVcqf3pyN0720rytjZyOtG6V/+yQvNbq95YXAVKMwJKErh/Rzp/8hU8rQ/bNg2KBKac
         yaLH+29nMQotfeNVbZ+rKnADb7LE4iuKDFkm46whD649MQVNLLH6zX4NRrvQTODsLxt0
         H7hJRW2CqrYO2z5l1+lz+uFH1M1VZ65ijgtq/7mpos/iP2BVmOGmjMJJGo+s1oRxyd8u
         NUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692511; x=1782297311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=;
        b=JU+LLS6zw69mfuYsXhcxmAqsRCn5lsEwMATl16osr1kQZkh6pD1DlBAsk4rBgpi5hX
         bfQi4A0LcAfxobTFDT0O0jG5nZc5lr5CLY9xuvYj1TXUUOVRanU2iQobhcVI1UgZzEHY
         BrEX1uk3zRLVermm5y3OyFJlRU4QEPjUr5mP7OyAmRm4BEJWF9V9V6IRAkXxJqPPQq8x
         /Ll8mWHc7E9OPM+2oe90KiKKRRSXP+Jjq6a55olkLnYBRjAbbxrlFwlh9Xyu21/omIZh
         rphIub0Y27SSqk4YjW/7EmErr/qEy1pjdYWxkMqGybzHOSMgyxawaRBdsHbYftfkpbIO
         PQ7w==
X-Forwarded-Encrypted: i=1; AFNElJ9r8rphaglaFzwEyEIn5pnDWCOaRu2HdwYQ2K2B1hKtaGKipnHF08bkvVf6a0SdJyCHrwOJT35n8odUcJX17PTW@lists.infradead.org
X-Gm-Message-State: AOJu0YxwqcFKeBY/t3OadTIHiwDdASTokvRjulnXSbmlbtBxn1f9nCs1
	T3Z/6V2nK9KMGI8wxXIrHeLOw/vqUm76I5krTU8EuKHFHrvsECmaoqam
X-Gm-Gg: AfdE7ckUsDwFNQGKua4rD13bq6RTa40rLBUD1QZPDnEuPe8G+CmhVcuVvG6xonGpJSV
	v2BwDIlvaZJ5gSkiPlI4QtzCc/BbEdccnI4wF4Q0gOznYcmssmtbVJV3hhyhqzWtmwAWYC29irk
	6TdfsUVHiTwsX8c9ME9X95+y1e3Anh6U6tN3p+9OPOFE/pbMfgt4sTKz4SAcvaBj23UtJdz28oU
	Z9wj/fcnAq6le2wWYBjlMfns4PKugeK7KqeepbrR/6QW7/HcDKyHuC3UsZ5d500UvI9I8NNaTb6
	Git0j4PImyyQJzKS9auNdnb6ct2jZ8noJweyw7TAS9XYg6Mndzl1b3JjDl1kxwXmsHiQF58qoV8
	5y2rdOOqngfhUJtShTEA+VQZ25y4Nm1LMrL48vwsapHOMIRcDJeERe8ktR4lIn14v5BPUW5SZKL
	1/LeKAYGNTlJmuyrMwj1RMPf499V0ByAOH1n/TZYjER82BwEE=
X-Received: by 2002:a05:7300:80d2:b0:2f1:496c:94bf with SMTP id 5a478bee46e88-30bca066cccmr1800405eec.16.1781692510527;
        Wed, 17 Jun 2026 03:35:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:10 -0700 (PDT)
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
Subject: [PATCH 14/78] ASoC: codecs: cs42l42: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:31 +0700
Message-ID: <20260617103235.449609-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033511_440275_6151B0BE 
X-CRM114-Status: GOOD (  20.59  )
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
 sound/soc/codecs/cs42l42.c | 222 ++++++++++++++++++-------------------
 1 file changed, 111 insertions(+), 111 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2652a639a79a..f9e02cc4e9f1 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -565,7 +565,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l42->irq_lock);
+	guard(mutex)(&cs42l42->irq_lock);
 	cs42l42->jack = jk;
 
 	if (jk) {
@@ -581,7 +581,6 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 			break;
 		}
 	}
-	mutex_unlock(&cs42l42->irq_lock);
 
 	return 0;
 }
@@ -1667,117 +1666,118 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	unsigned int current_plug_status;
 	unsigned int current_button_status;
 	unsigned int i;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	pm_runtime_get_sync(cs42l42->dev);
-	mutex_lock(&cs42l42->irq_lock);
-	if (cs42l42->suspended || !cs42l42->init_done) {
-		mutex_unlock(&cs42l42->irq_lock);
-		pm_runtime_put_autosuspend(cs42l42->dev);
-		return IRQ_NONE;
-	}
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		if (cs42l42->suspended || !cs42l42->init_done) {
+			ret = IRQ_NONE;
+			break;
+		}
 
-	/* Read sticky registers to clear interurpt */
-	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
-		regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
-				&(stickies[i]));
-		regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
-				&(masks[i]));
-		stickies[i] = stickies[i] & (~masks[i]) &
-				irq_params_table[i].mask;
-	}
+		/* Read sticky registers to clear interrupt */
+		for (i = 0; i < ARRAY_SIZE(stickies); i++) {
+			regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
+					&(stickies[i]));
+			regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
+					&(masks[i]));
+			stickies[i] = stickies[i] & (~masks[i]) &
+					irq_params_table[i].mask;
+		}
 
-	/* Read tip sense status before handling type detect */
-	current_plug_status = (stickies[11] &
-		(CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK)) >>
-		CS42L42_TS_PLUG_SHIFT;
+		/* Read tip sense status before handling type detect */
+		current_plug_status = (stickies[11] &
+			(CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK)) >>
+			CS42L42_TS_PLUG_SHIFT;
 
-	/* Read button sense status */
-	current_button_status = stickies[7] &
-		(CS42L42_M_DETECT_TF_MASK |
-		CS42L42_M_DETECT_FT_MASK |
-		CS42L42_M_HSBIAS_HIZ_MASK);
+		/* Read button sense status */
+		current_button_status = stickies[7] &
+			(CS42L42_M_DETECT_TF_MASK |
+			CS42L42_M_DETECT_FT_MASK |
+			CS42L42_M_HSBIAS_HIZ_MASK);
 
-	/*
-	 * Check auto-detect status. Don't assume a previous unplug event has
-	 * cleared the flags. If the jack is unplugged and plugged during
-	 * system suspend there won't have been an unplug event.
-	 */
-	if ((~masks[5]) & irq_params_table[5].mask) {
-		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
-			cs42l42_process_hs_type_detect(cs42l42);
-			switch (cs42l42->hs_type) {
-			case CS42L42_PLUG_CTIA:
-			case CS42L42_PLUG_OMTP:
-				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-				break;
-			case CS42L42_PLUG_HEADPHONE:
-				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-				break;
-			default:
-				break;
+		/*
+		 * Check auto-detect status. Don't assume a previous unplug event has
+		 * cleared the flags. If the jack is unplugged and plugged during
+		 * system suspend there won't have been an unplug event.
+		 */
+		if ((~masks[5]) & irq_params_table[5].mask) {
+			if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
+				cs42l42_process_hs_type_detect(cs42l42);
+				switch (cs42l42->hs_type) {
+				case CS42L42_PLUG_CTIA:
+				case CS42L42_PLUG_OMTP:
+					snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					break;
+				case CS42L42_PLUG_HEADPHONE:
+					snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					break;
+				default:
+					break;
+				}
+				dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 			}
-			dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 		}
-	}
 
-	/* Check tip sense status */
-	if ((~masks[11]) & irq_params_table[11].mask) {
-		switch (current_plug_status) {
-		case CS42L42_TS_PLUG:
-			if (cs42l42->plug_state != CS42L42_TS_PLUG) {
-				cs42l42->plug_state = CS42L42_TS_PLUG;
-				cs42l42_init_hs_type_detect(cs42l42);
-			}
-			break;
+		/* Check tip sense status */
+		if ((~masks[11]) & irq_params_table[11].mask) {
+			switch (current_plug_status) {
+			case CS42L42_TS_PLUG:
+				if (cs42l42->plug_state != CS42L42_TS_PLUG) {
+					cs42l42->plug_state = CS42L42_TS_PLUG;
+					cs42l42_init_hs_type_detect(cs42l42);
+				}
+				break;
 
-		case CS42L42_TS_UNPLUG:
-			if (cs42l42->plug_state != CS42L42_TS_UNPLUG) {
-				cs42l42->plug_state = CS42L42_TS_UNPLUG;
-				cs42l42_cancel_hs_type_detect(cs42l42);
+			case CS42L42_TS_UNPLUG:
+				if (cs42l42->plug_state != CS42L42_TS_UNPLUG) {
+					cs42l42->plug_state = CS42L42_TS_UNPLUG;
+					cs42l42_cancel_hs_type_detect(cs42l42);
 
-				snd_soc_jack_report(cs42l42->jack, 0,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					snd_soc_jack_report(cs42l42->jack, 0,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 
-				dev_dbg(cs42l42->dev, "Unplug event\n");
-			}
-			break;
+					dev_dbg(cs42l42->dev, "Unplug event\n");
+				}
+				break;
 
-		default:
-			cs42l42->plug_state = CS42L42_TS_TRANS;
+			default:
+				cs42l42->plug_state = CS42L42_TS_TRANS;
+			}
 		}
-	}
 
-	/* Check button detect status */
-	if (cs42l42->plug_state == CS42L42_TS_PLUG && ((~masks[7]) & irq_params_table[7].mask)) {
-		if (!(current_button_status &
-			CS42L42_M_HSBIAS_HIZ_MASK)) {
-
-			if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
-				dev_dbg(cs42l42->dev, "Button released\n");
-				snd_soc_jack_report(cs42l42->jack, 0,
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-			} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
-				snd_soc_jack_report(cs42l42->jack,
-						    cs42l42_handle_button_press(cs42l42),
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+		/* Check button detect status */
+		if (cs42l42->plug_state == CS42L42_TS_PLUG &&
+			((~masks[7]) & irq_params_table[7].mask)) {
+			if (!(current_button_status &
+				CS42L42_M_HSBIAS_HIZ_MASK)) {
+
+				if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
+					dev_dbg(cs42l42->dev, "Button released\n");
+					snd_soc_jack_report(cs42l42->jack, 0,
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+				} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
+					snd_soc_jack_report(cs42l42->jack,
+							    cs42l42_handle_button_press(cs42l42),
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+				}
 			}
 		}
 	}
 
-	mutex_unlock(&cs42l42->irq_lock);
 	pm_runtime_put_autosuspend(cs42l42->dev);
 
-	return IRQ_HANDLED;
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, "SND_SOC_CS42L42_CORE");
 
@@ -2163,22 +2163,22 @@ int cs42l42_suspend(struct device *dev)
 	 * future interrupts. This ensures a safe disable if the interrupt
 	 * is shared.
 	 */
-	mutex_lock(&cs42l42->irq_lock);
-	cs42l42->suspended = true;
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		cs42l42->suspended = true;
 
-	/* Save register values that will be overwritten by shutdown sequence */
-	for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
-		regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
-		save_regs[i] = (u8)reg;
-	}
+		/* Save register values that will be overwritten by shutdown sequence */
+		for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
+			regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
+			save_regs[i] = (u8)reg;
+		}
 
-	/* Shutdown codec */
-	regmap_multi_reg_write(cs42l42->regmap,
-			       cs42l42_shutdown_seq,
-			       ARRAY_SIZE(cs42l42_shutdown_seq));
+		/* Shutdown codec */
+		regmap_multi_reg_write(cs42l42->regmap,
+				       cs42l42_shutdown_seq,
+				       ARRAY_SIZE(cs42l42_shutdown_seq));
 
-	/* All interrupt sources are now disabled */
-	mutex_unlock(&cs42l42->irq_lock);
+		/* All interrupt sources are now disabled */
+	}
 
 	/* Wait for power-down complete */
 	msleep(CS42L42_PDN_DONE_TIME_MS);
@@ -2250,13 +2250,13 @@ void cs42l42_resume_restore(struct device *dev)
 	regcache_cache_only(cs42l42->regmap, false);
 	regcache_mark_dirty(cs42l42->regmap);
 
-	mutex_lock(&cs42l42->irq_lock);
-	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
-	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
-	regcache_sync(cs42l42->regmap);
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
+		regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
+		regcache_sync(cs42l42->regmap);
 
-	cs42l42->suspended = false;
-	mutex_unlock(&cs42l42->irq_lock);
+		cs42l42->suspended = false;
+	}
 
 	dev_dbg(dev, "System resumed\n");
 }
-- 
2.43.0


