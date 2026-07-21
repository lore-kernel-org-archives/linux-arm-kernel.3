Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D061AC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lC5JKraJutUXVC1Tg679SCSVEJKwIHZajpWUsgP58mY=; b=JkfM+ef5GybDGm5R79E9C+Vrje
	ICNHa7MwU8sBy5AfJ0X13kZ4RNJtgOUyqfg4B8fXBSOnvTafDjwTstF97owqOoBJ6f3VacgdbKr3T
	8UsYMjfK93y5E1eMYtdoLsTxvkoXXr8PJinwMx97CBYxvfeUDM6MVeTp7CfgytKg+8V5yXKeQxw5f
	QzpSSY3oLUB5PoHKLQUfd8ASKLH5+qTiCaShaUlwvz22wLysQ8opzV47inXeh3k4cxJiCQAtnNM4Z
	vnIClx1chCbnfzRVqj51qjS8voHg/XpHM5fK7zXf2uDTHU1Y+6Cwgp/1e1o+0M/tlemZk/DMb4Kpe
	8IVAnf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7ia-00000009A8P-43qX;
	Tue, 21 Jul 2026 10:28:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7iN-000000099vl-3oBv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cad4170e8eso156541045ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629723; x=1785234523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lC5JKraJutUXVC1Tg679SCSVEJKwIHZajpWUsgP58mY=;
        b=AwWIy9scZQUHMnbCDiRS3NPtFhRDLNsMPg/BB+ooA7A3AXyI+hPCBz3wKkX24/tdcC
         v2O8Y1jSOrItXpROFE2JuzGsgeITk9MCIiHASl7Zea07mHRTkZWxNNe6cSjDqwCEs64v
         3jh85sXDT2DA5mo0Frxocs94wIgFZPFENUTf06dY6Xk9YitkGwr95gWgpPMmngw+itxz
         Az2/jWcRK6zhx4QwzvFR6nObCzjmfIHwncxG1L+ptJRNoe0NagLTMQblnjz7mIgP6wv/
         j4KoevbEv9Y3hC5cy9rxOTNz2JK2DGLZp07+W+YmJ2GVWgFu58gBm1JwO32tkuDbbAdZ
         6/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629723; x=1785234523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lC5JKraJutUXVC1Tg679SCSVEJKwIHZajpWUsgP58mY=;
        b=PlWRgR8hjbDGGQsF8sZLk/3XEBvVhSQxBSUDsheiOevoJ54jpNcx/4AoeAmiLAri7J
         k+71C0qfcJ5xa7pIUUc0vGY/93Pa6ELaBgq84N/9/2xC9e6US2nSniY4AxNr9YxFf4wZ
         XfUwMKQLv10sXX44Kqq1Y81dMQHVmdXoQCRgeTEwJplCZBgMw5vygBaXFRx40tBu8Cwv
         cy93NSYNoP4kYrqxmoEBiud///6PJKBA3GkfR2NuadtjXFKMHz9aUeEzuBMP7IxQHfdP
         Fa0rMd0Pmjw52pfnMiux2uZn3RYWleXEarOh7arNkgo3e/ph0LCXAiMkSgkMgyhsNlym
         FJTw==
X-Forwarded-Encrypted: i=1; AHgh+Roz9KX+J6yVWutHx3oHYyAX2n1T4OccxRWTg6gnGAV1NLG2K3AYSgCr6IkfS/cxBSEIXe+sMwtGrgvIKeH3sQ/j@lists.infradead.org
X-Gm-Message-State: AOJu0YwlzwNab+lr9OcpGXA5Of0BRpyQ1dPglQkvEW6QoRbyxK78rSXj
	ERAzl6MVCwCb7KOvBWaxVd+jDtk7Gx2Nfgxg+SvgvBIb/7RIb4Yuuagp
X-Gm-Gg: AR+sD130WX2sWb5gzXYPQ5xpcO/NyMWC6nXHEHxCG3H1g3jb9tJLltK+OMAqKvoY+HE
	9QG0XPhDxnAzOJ/lHP7IxHmxmnI6NI2nTgvWbQlJBgq3u5uws5+2oXqz7P1odg4hgmKBSe4jHMi
	+gg6d3noik9Iob4VtatW9ZdRNaam2+WbHLkAgmK2/Ac86OJJjotO1QDjiAJ+awajGbvlAMTJhku
	BFQUDSCIB8u4LSIL57aTjYCmy+cHEKgAi5ONLbwCwLM48YNpZjCxlNiosD7pXBvuxkiWaba60MC
	d0m897Pv5qAQNTSZl3PnKy3J2/rCBuyszykhKE/nkyR4G5/92wzzMu/TVJNBUZgRbMpqwjQmi7P
	SzrQDSODbGYoHQFb/vVdn4B1mu6Z5CH6UMT+jOhnzpQQHEFqbZivBFnS4xyy7Z6iXaeE9YAPZFt
	Ztm+eBZAQR05JbpV5MGa46YzQqpa3Oq0sdLVq3
X-Received: by 2002:a17:902:c941:b0:2cb:14b3:4cfe with SMTP id d9443c01a7336-2cf34a0774cmr215182775ad.45.1784629723081;
        Tue, 21 Jul 2026 03:28:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:42 -0700 (PDT)
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
Subject: [PATCH v4 18/29] ASoC: codecs: rt5645: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:49 +0700
Message-ID: <20260721102600.523199-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032843_984145_28BA5AAF 
X-CRM114-Status: GOOD (  16.66  )
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
index 93a4148ccccd..0d546fb34e52 100644
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


