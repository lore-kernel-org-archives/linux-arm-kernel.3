Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78eN83RWVPj3usGOOjpXeDQAtr7LkbhNmieBoJ7adsI=; b=T88dQWHw+Op9VI9R7qwGf33wsn
	vBEUKkLIT59lnHSbGoHWOjdNHN+2woOfzMbNsYvqblpuD6Oi253uqEIn6xm3IuZbKYHIY+940vwcS
	sEgj7r7NlC+3Ar6bo0XswBsRqf1E4e6+fY5QwNy0lcC+NWTmAYR/7ip9uV7ubEUKEEYsZ8LUXCMn4
	Lf2j5ieFzX8xcXXJsKXLxNU+FpXcL+TCTsuaLrBbyn7b3Jzn8P2JqrNnJCwu5WEZL+c60ukUO8o4v
	ghkjdK1JFYwoEustNj0s76DW8oj/JYjPAIwQhis3YlQ+n0AR1ksvIXa1rxu9vWshuIGuIR82luGme
	JsdV+xwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6S-0000000Fzp5-2lTd;
	Tue, 30 Jun 2026 06:37:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6Q-0000000Fzls-2jyT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=78eN83RWVPj3usGOOjpXeDQAtr7LkbhNmieBoJ7adsI=; b=UeRmhoNXeww7Pmj5dnF3+HtwyX
	UnXN94tkr/vbLtHgmWdUmWpuJ9vXKrzblxtJzv3bSvEBbTCyPEXdJhfEiEU5dUxVuKW88kaRLitqw
	zh8J/b5G9yK40oS6VsNbR3T4K+++0q8QYF1LydlcIget7PNX+StqRPyqPq44JVwn3Ar4D9lT3F3T0
	cBoAekjF96//nV1u1xCzgYNftAmANaHEljIQTzCbyNUYXrfmd/rQCCWp6KAGBeRyf3mSwSNZzyZVW
	R3f2bgWhYSrTTRuofLhfyLCe1GPScIrtLXTNeGj7jaXyqYzel0ybknjdQpmPl6JFzAXckBmhGh6xh
	PepC6GZA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS6L-00000001ZP1-4AqG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:37:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8423f236418so2119773b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801464; x=1783406264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78eN83RWVPj3usGOOjpXeDQAtr7LkbhNmieBoJ7adsI=;
        b=CQJelmfnUYVv8+mFuXZNvtKelsWxQ55ZLk7saFNw422bSKSVzuF/UwRniOKrCP4KRT
         EA7GcBlHADPZ6juxiZOAsG2I03qz0kqKZAFlziGaFL92uhkl+ekkzkJHDHo9YVrrnSxW
         RPVlzO7/4gD2Wa6FOZVZJxoO1PMr1U+a4N76rTmSMXcyRByaWROaPqMeWGP/b93zNyze
         iZWmBw20Ew/8CHDvpO7eexYk770Tp+Pjj7c11CufB+dcBDus/BQE/pgs+9Gt5/tFxGwg
         5EEd+tXlC+xw0Ub8YHr7mbSZCwKmUVuQ0QolkMGraNRUMadIfPW1ihiOkaiN4+bJbl+u
         TSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801464; x=1783406264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=78eN83RWVPj3usGOOjpXeDQAtr7LkbhNmieBoJ7adsI=;
        b=cqQCOEUfxjBhZ4OTayBVbVDENzeVUwIQx9euKVcVRuK705dfeOx30/lEiK0LPKpIUv
         G5w/+y5ekhqpNJROR2cv+BFxd4dpFdB7Gdly8NKQVYiH0hiyw35dhMy96dw2w3cNJWLj
         ADfp2SF/ivrG0HHrx7IK2LilJVLNfQ7YHGKgsDfUxyi5mkxZwJbRuXc08GjLtLtxs/CO
         rBJlfulkoNAZ0yPQTXLcAicfkoXffsRmWu1H6CMm+6TNuteLqXMOmox6NTJKAKsg7Izl
         q9hqvFTE5CzvQ/7ri8UjSXPf4Ke53yJE7zytttTFc01mWI26+TH9sNI8WZnxitj82dcv
         e7Ig==
X-Forwarded-Encrypted: i=1; AHgh+Rogb64pgQ5xSsD8jAiP1uw/dtSSVu39rSg8MiG62uo+k0ZIfaUQlIPbQWbB7sXN2EGxrfl/q64rsuFV2PUp/sJN@lists.infradead.org
X-Gm-Message-State: AOJu0YwhEFTLg0NmjBdfB/6inE6UOIMsmlp6s6riizzCYNEZIh/3tFqX
	D//OFnadCtyaGwxsjU33RjJkDyEppQrURCjnfmbPYkz7Th5+BA6K3zXS
X-Gm-Gg: AfdE7clkigK2PXj4ritZq3I8fMQb9kGTXfDzyjWj+exT79QgNwpiI3jdxXrPy2Mcdpw
	5s+M7DeBOfjEa7kzotvNa3r7oOtFMm3hJ7vZdj2c/oO04CP27U35fddaxJ07cPJBo8+1zSQCV8a
	DAoVK/fyQPtZtDEEzfHMxnvXEevR2dT5KZqQn2FekxGbMeyXfYHhumJ7RWttEquZzKZEN9+eBgL
	hpTd6HyvmQCfZFT+e1i8UpPFtDvkqNgV/zO9vPZfvnNbPYWzbR/3402DGU11UEnm2oALpiPEYTs
	1hpAu4ekdo2VBGHO+22QyBgDpc+24JUyyOx3TWJ7nPtVHIR2nfrtIis7UF6nRxm1/5t1w1RCqKv
	pLNqTfuR7lfPxzVQ1JsMG1MJckCkIGAftPh4cqUmTzCoU3M/yYaOgaeMHwGiIoktgPZ4/KPejpF
	AbaXBKODTSELn6C0z+ycXUGclO6lb+UWawe6wfXjGUZ1O9yjg=
X-Received: by 2002:a05:6a00:130f:b0:842:5a8d:302c with SMTP id d2e1a72fcca58-8479f232c38mr1853902b3a.38.1782801464159;
        Mon, 29 Jun 2026 23:37:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:43 -0700 (PDT)
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
Subject: [PATCH 18/27] ASoC: codecs: rt5645: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:40 +0700
Message-ID: <20260630063449.503996-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073747_961092_C066B5D4 
X-CRM114-Status: GOOD (  16.08  )
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
 sound/soc/codecs/rt5645.c | 160 +++++++++++++++++++-------------------
 1 file changed, 79 insertions(+), 81 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index e9819653b30d..7cdca9774545 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -3323,93 +3324,90 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 	if (!rt5645->component)
 		return;
 
-	mutex_lock(&rt5645->jd_mutex);
-
-	switch (rt5645->pdata.jd_mode) {
-	case 0: /* Not using rt5645 JD */
-		if (rt5645->gpiod_hp_det) {
-			gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
-			if (rt5645->pdata.inv_hp_pol)
-				gpio_state ^= 1;
-			dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
-				gpio_state);
-			report = rt5645_jack_detect(rt5645->component, gpio_state);
+	scoped_guard(mutex, &rt5645->jd_mutex) {
+		switch (rt5645->pdata.jd_mode) {
+		case 0: /* Not using rt5645 JD */
+			if (rt5645->gpiod_hp_det) {
+				gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
+				if (rt5645->pdata.inv_hp_pol)
+					gpio_state ^= 1;
+				dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
+					gpio_state);
+				report = rt5645_jack_detect(rt5645->component, gpio_state);
+			}
+			snd_soc_jack_report(rt5645->hp_jack,
+					    report, SND_JACK_HEADPHONE);
+			snd_soc_jack_report(rt5645->mic_jack,
+					    report, SND_JACK_MICROPHONE);
+			return;
+		case 4:
+			val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
+			break;
+		default: /* read rt5645 jd1_1 status */
+			val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
+			break;
 		}
-		snd_soc_jack_report(rt5645->hp_jack,
-				    report, SND_JACK_HEADPHONE);
-		snd_soc_jack_report(rt5645->mic_jack,
-				    report, SND_JACK_MICROPHONE);
-		mutex_unlock(&rt5645->jd_mutex);
-		return;
-	case 4:
-		val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
-		break;
-	default: /* read rt5645 jd1_1 status */
-		val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
-		break;
-
-	}
 
-	if (!val && (rt5645->jack_type == 0)) { /* jack in */
-		report = rt5645_jack_detect(rt5645->component, 1);
-	} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
-		/* for push button and jack out */
-		btn_type = 0;
-		if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
-			/* button pressed */
-			report = SND_JACK_HEADSET;
-			btn_type = rt5645_button_detect(rt5645->component);
-			/* rt5650 can report three kinds of button behavior,
-			   one click, double click and hold. However,
-			   currently we will report button pressed/released
-			   event. So all the three button behaviors are
-			   treated as button pressed. */
-			switch (btn_type) {
-			case 0x8000:
-			case 0x4000:
-			case 0x2000:
-				report |= SND_JACK_BTN_0;
-				break;
-			case 0x1000:
-			case 0x0800:
-			case 0x0400:
-				report |= SND_JACK_BTN_1;
-				break;
-			case 0x0200:
-			case 0x0100:
-			case 0x0080:
-				report |= SND_JACK_BTN_2;
-				break;
-			case 0x0040:
-			case 0x0020:
-			case 0x0010:
-				report |= SND_JACK_BTN_3;
-				break;
-			case 0x0000: /* unpressed */
-				break;
-			default:
-				dev_err(rt5645->component->dev,
-					"Unexpected button code 0x%04x\n",
-					btn_type);
-				break;
+		if (!val && rt5645->jack_type == 0) { /* jack in */
+			report = rt5645_jack_detect(rt5645->component, 1);
+		} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
+			/* for push button and jack out */
+			btn_type = 0;
+			if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
+				/* button pressed */
+				report = SND_JACK_HEADSET;
+				btn_type = rt5645_button_detect(rt5645->component);
+				/*
+				 * rt5650 can report three kinds of button behavior,
+				 * one click, double click and hold. However,
+				 * currently we will report button pressed/released
+				 * event. So all the three button behaviors are
+				 * treated as button pressed.
+				 */
+				switch (btn_type) {
+				case 0x8000:
+				case 0x4000:
+				case 0x2000:
+					report |= SND_JACK_BTN_0;
+					break;
+				case 0x1000:
+				case 0x0800:
+				case 0x0400:
+					report |= SND_JACK_BTN_1;
+					break;
+				case 0x0200:
+				case 0x0100:
+				case 0x0080:
+					report |= SND_JACK_BTN_2;
+					break;
+				case 0x0040:
+				case 0x0020:
+				case 0x0010:
+					report |= SND_JACK_BTN_3;
+					break;
+				case 0x0000: /* unpressed */
+					break;
+				default:
+					dev_err(rt5645->component->dev,
+						"Unexpected button code 0x%04x\n",
+						btn_type);
+					break;
+				}
 			}
+			if (btn_type == 0)/* button release */
+				report =  rt5645->jack_type;
+			else
+				mod_timer(&rt5645->btn_check_timer,
+					  msecs_to_jiffies(100));
+		} else {
+			/* jack out */
+			report = 0;
+			snd_soc_component_update_bits(rt5645->component,
+						      RT5645_INT_IRQ_ST, 0x1, 0x0);
+			rt5645_jack_detect(rt5645->component, 0);
 		}
-		if (btn_type == 0)/* button release */
-			report =  rt5645->jack_type;
-		else {
-			mod_timer(&rt5645->btn_check_timer,
-				msecs_to_jiffies(100));
-		}
-	} else {
-		/* jack out */
-		report = 0;
-		snd_soc_component_update_bits(rt5645->component,
-				    RT5645_INT_IRQ_ST, 0x1, 0x0);
-		rt5645_jack_detect(rt5645->component, 0);
 	}
 
-	mutex_unlock(&rt5645->jd_mutex);
-
 	snd_soc_jack_report(rt5645->hp_jack, report, SND_JACK_HEADPHONE);
 	snd_soc_jack_report(rt5645->mic_jack, report, SND_JACK_MICROPHONE);
 	if (rt5645->en_button_func)
-- 
2.43.0


