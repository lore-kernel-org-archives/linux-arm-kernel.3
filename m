Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8E1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=; b=0ytCIXw4guF8x5pgJ62HwM1/xa
	uJdlYKrfgRnjJ6SVhEUKnvAWn3a9z95/wwcnFtQ2ulYdgoQQDf9+jVqvkSm/X9L3zvnwNe/VN6REn
	Jobcmw4l4Lag7XYvUESb3iMB3tXPlaE2R5P6WR6p/V94tYXsC5uEGjqNuc4E38+ShzKsdahVscku2
	7i8U+bhInc0EiM59vfOOpy1gLK3bLyXFwJi/2ZIK5mmG1OfM5+gvm57MkKlh7PYLfIUxO0y6NqQi3
	eRcsWHFwvx+M2vgGoQQlnARF+PE5Gk6rLBD4Huyqt7YykO+VeyDqkWEC1Ofq6dZEhFErWmCh8AY6q
	n/9tQb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4R-0000000Fy5w-3RzP;
	Tue, 30 Jun 2026 06:35:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS4Q-0000000Fy4g-0cZQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 30 Jun 2026 06:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=; b=ZQKscQG++mmEEmu061XrJBIQaI
	4MqJZcMn4TlaPKUNkVcgfIzGt1iLBkWYURlLcQZd3Ib+9SN+HMO/MzoP36Ob5su4khUT2Ba/279Oa
	eg5xZPXGYCzcrk6YmYgSfGWl7DBgICcN/9uJxRmdm2hnokb5dmKuzPxB1rfZxr94SKy383h3wveR3
	XUNNToD10+wVx8W/NXbDP52ZJy6MAHefHKAwQVNmxmMsHWHmOx1MzJBxfLWJpn+a93VQRG/IbtxqL
	4wEb7+z3uAXV9GsdQ4+8q5Q77az7QJ3m+ExL/q5rD1MYHMFiqdg/Kq8XNPd8RoBSDqeG00pTIAqlZ
	uIWRzbnQ==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weS4J-00000001Z6h-2IP1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:35:44 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8478fe07f65so798737b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801337; x=1783406137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=YOY6nfStT6+PeASm0OkoxbNrzs95RU+CFmpnP0GZIJIKmX5yukiYh3iju1Ch00c72/
         biq/fILuMmnQ9GF7iT1lMK5O+tF54oRmBhpxg0T8gFdnYfY8qwQ62rnq+g50yS1ygCuo
         KKagIMo+Fdjl57lI1AiRMPuy1cD9xb6SYr8LKNhYWEj8IDR3h/WSAumE5egjcNVqDSDo
         Hx4oN0cCDN0Uvjc6Sk2Rx1a56mXLBzDjnbwDIG9INvjNgSxPAZnf251TqBx58GAlcbI4
         2pwkdGMTIJ8+mv9lqGxFcv3UiIf7+fj0r0r43FH68mzvjgQ9qMo6AP44xVAbGDEzUiMK
         OKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801337; x=1783406137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=c7jYGFNG/Wto+Nh+wHnGhbCbC1UKoTk7gPBy/GV3dJ4062I4Z/QaGd/7roLoFdIgkH
         7l9H6mp+zn/X0+C1Je1FG6Tty18IZNFaXQ+XtU/WS21p+lLFyC11NBF3fCGYMrSS+LbF
         fC27PpLzp9J4yTdtCutVkVbb4w6vaCjr3X3G8p2xW15Pb3zL0+Wtey4BdsNdY/G3kAYM
         +EJH9Oqgdx4RRtHKHdb8Fu8oTaPhHshJuXaLEra6qTLDzU9TL46OXze1M90WWkgVx9sM
         lj70yny9BdHu5SdRLOw1ejgsG5dfIoL/tflA8Y9DMNKrni1iTJYQbi0Km3Wc6rBLIXqc
         fv5g==
X-Forwarded-Encrypted: i=1; AHgh+RoguhdOhvs2+n+9PV6F6WfdAI5ME4xn5/nD9upneT8luMhOpA0fYBgKpcT0ZGXxB06gR+rz7ur2pt3lDqJ44r/9@lists.infradead.org
X-Gm-Message-State: AOJu0YxWkd0zsM8kC6oTQT33YybKMurMaC0dumw3BC740/yEr3cHebnC
	aNFwknqSz8vMXeOtxGmGDfY9/Eo5iems9rpk1gdFJiN8cctZ6sEhmeoJByqRyA==
X-Gm-Gg: AfdE7cmgOULpDPYxA623oV+RZHdOqHrM7GsVhlc+WQ9l5JCdBgKebpFvIgkPbbaqpGT
	9tDbDfiv7ub+UPkiHVWssTYSiPZWAXVzl1cyxUjOc41lvtquiNZRhPptFunaee1Wp1VNsQhoMvh
	Wdu0py9nZ24Jd67kUyZDAiTUGlb6pzfrvEut866kij3jWiWbshSr9gn2b5um5PJewImND4kZrUC
	+HuOdNGzb1wtNUFVg4o/JtFWQ4XWA6jgeIO2mFlrI+P3ujuuzDsm1zRJGp3Ml5Z5fHRfcWi05WG
	B+Lu0pZJilPONi7fYb3gKVB0lA63Q8Bd6FyPWsnDpzljTcjBq0Tsf+sYsXoRZuR1DDl6GQbpBv8
	b4H7A7+vW1PvS1uuKN8lCX7QSgT6HIFj4f3UpS0+GECOAfKwIIMCypgBoOOe0kTAhK807wx5elS
	gZCsmSGIs5eMjptIBsMFTVbYv4kJmasj8v8t/XLKbsC+euWSE=
X-Received: by 2002:a05:6a00:1894:b0:847:888f:9b16 with SMTP id d2e1a72fcca58-8479eed1d62mr2006682b3a.18.1782801337316;
        Mon, 29 Jun 2026 23:35:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:35:37 -0700 (PDT)
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
Subject: [PATCH 04/27] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:26 +0700
Message-ID: <20260630063449.503996-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_073543_173906_5C2F2FBA 
X-CRM114-Status: GOOD (  14.48  )
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
 sound/soc/codecs/es8326.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da35099..c5460589a88b 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -6,6 +6,7 @@
 // Authors: David Yang <yangxiaohua@everest-semi.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -790,7 +791,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
@@ -845,7 +846,6 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		}
 		es8326_disable_micbias(es8326->component);
 	}
-	mutex_unlock(&es8326->lock);
 }
 
 static void es8326_jack_detect_handler(struct work_struct *work)
@@ -855,7 +855,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_component *comp = es8326->component;
 	unsigned int iface;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
@@ -873,7 +873,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
 					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
 					~es8326->jack_pol : es8326->jack_pol));
-		goto exit;
+		return;
 	}
 
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
@@ -930,7 +930,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			queue_delayed_work(system_dfl_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
-			goto exit;
+			return;
 		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
@@ -939,7 +939,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_dfl_wq, &es8326->button_press_work, 10);
-			goto exit;
+			return;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
 			dev_dbg(comp->dev, "Headphone detected\n");
@@ -958,8 +958,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			usleep_range(10000, 15000);
 		}
 	}
-exit:
-	mutex_unlock(&es8326->lock);
 }
 
 static irqreturn_t es8326_irq(int irq, void *dev_id)
@@ -1200,13 +1198,12 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&es8326->lock);
-	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
-					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
-	es8326->jack = jack;
-
-	mutex_unlock(&es8326->lock);
+	scoped_guard(mutex, &es8326->lock) {
+		if (es8326->jd_inverted)
+			snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
+						      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
+		es8326->jack = jack;
+	}
 	es8326_irq(es8326->irq, es8326);
 }
 
@@ -1219,13 +1216,12 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
 		return; /* Already disabled (or never enabled) */
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	if (es8326->jack->status & SND_JACK_MICROPHONE) {
 		es8326_disable_micbias(component);
 		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 	}
 	es8326->jack = NULL;
-	mutex_unlock(&es8326->lock);
 }
 
 static int es8326_set_jack(struct snd_soc_component *component,
-- 
2.43.0


