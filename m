Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E16C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=; b=gNj//HM1MS9c5nFwIiY8IGYGvi
	XvPNl5salhKMJ84dWwyljF7M8Ro0uloxcQrHp0Q8diOlKBjAIzK8ihs4vHE5wxVbJ+9ssRgbus4YO
	tX2Gs+n5xPZDNWF1PxOCLs7aow2HGjzG74S0isAISX1CD0Oex3HDJBcymzasFeZQtSSNPuRi6S+9J
	GzP35r4Pw8XPzqq/SJGlqMk1lNyyspZ8vEjCDRtUJuVy83/57vJoJUp8OOFtQSSkqBKnb0bxZUnhb
	Yx4URl1BpKVuJKhaB/6YfC+wFmLzroSEXctpl/+F/TKhubkA+X0fbCn6K72S7JC0B8LWO8hw5zbGj
	UfyenVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7in-00000009AMU-3BoY;
	Tue, 21 Jul 2026 10:29:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7id-00000009ABe-3Tvk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:29:02 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc891373e0so139055035ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629739; x=1785234539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=Gy77fo37ZC3B6ZZbhG0e/LoxTE/SOvol/31dVzUxeFY5RStfAwlBNiKNOzZd9tc+9S
         inXdanUVqtjLX7ltWXVral/GMwgO7nYX/p5YoPYqDtUKyN9MJvhmkBkKed2K8e3LXakp
         b1E/fI8MMs1PrR5k/gVm3GF6TUdR5sQZV/2C+6+tQURFBSDxJJfUvuSjRguHWGY2uOpU
         2Qd8tEJ2kuRKZq/1Ba/AXyhjzd+IJKcdK7lb8srg8+2dhkJoqHzAfcfAce0c4Eb8yAwK
         qSCSbiHjIKrZs72eXtoVj+tqOlyiOhAr+CiuUtrn43VUYlImOFC9z3vQSdn07xLlw2w2
         A/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629739; x=1785234539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=IFwI1s/MInQIKMXsL4fj5tidCpeodLnh81yjUczzrh5ilwvU+JCOc/WN+fDEVkbmuY
         dSAffeeW5Pa2RaRfSiqxZ6gg3U0GEWgKRcorTm4M+1XrDxpx3rgpOI7RoxQrcC6uPmb5
         soQjcTxtjtxlrBYoJ/0+/820REu4acWJloctlYI0R6L0uzhoNeTajdDRSQzkV5LpwLQf
         lLrrL+xSzCw2Pkq5UOUApTyInEDEv1IkkkNpg3500NHhuEJ0Qodc3XWvpZdMd+4NRzun
         rSNRhYZXjUp2R6MKPzZV7L5NXpgH6amvUhv7hsAMC6SSiKMufp1eyZz0pa7DbhpL7oRS
         3fkw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/6K99ZwQffqITQnKhmU8ed2Sl1kj5OEMkMa1kz2lmYYWqEHGy87wTHmDcAvcPmfYiAZaqBdrNkHCkishF8na+@lists.infradead.org
X-Gm-Message-State: AOJu0YyCRMltStyzBIlamtUkN5mDLeLWnaSOQORE3P0wydqB+8NVsYHK
	7cmRITJ33jNjJbfq3a7PNBeNsUaj/IjvA8QRC0S/X10qsz67pOFvByJ5
X-Gm-Gg: AR+sD13LZZe6UVGF47Pv2uNZcXf5pF8s/pI+mCaYjRTrmf7ZRTYntsdOOS6Cat6oeLK
	lPNlrOPbUH6GbeVam+cxlyjl72Iio5O7DYKYz32pqRjBBCAE9x9KpCrHEkBasV3Ao1g/vg82SpH
	HDtriyjO5LKqTMhefZVqMh4NnxjVN7q93czfmS/o3whkTzEgce7w7loBuarPQ0aT1F/sh+UlDYU
	KEGjFs+RWNpt4tzllnd/BZ4CK85E82EXnDQ72CbLLlwMI1IAnucRBv+3V4xJ/yu+jc/hYmAf8sB
	mW1BPo594OIUYoqdbGPtmfYfgmsS9gIZ6J6mj5dHIlm0uaH372g/qJ3xTZWUG22rV0L65qyR3p8
	e0t82sivmG6HqQNTpYP8aJWdA/lt/BqJUr1inznuq1MySc0hm4jrFmQ9Nd+ELFECs3G01LEg0RS
	6n8/+fKkmIHLu7CF2MCRcFW+xR3Z72HxGLm59Q
X-Received: by 2002:a17:902:e54b:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2cf348547d0mr202166025ad.12.1784629738893;
        Tue, 21 Jul 2026 03:28:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:58 -0700 (PDT)
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
Subject: [PATCH v4 20/29] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:51 +0700
Message-ID: <20260721102600.523199-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_032859_981029_68926C35 
X-CRM114-Status: GOOD (  12.18  )
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
 sound/soc/codecs/rt5668.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..4154bad27610 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -986,7 +987,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1054,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2355,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2399,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0


