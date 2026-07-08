Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7DBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=; b=qo7UOJ1rAChxxWxSLakJqqC2Sy
	BSKcScrygzfMyhnYc2cq+C/dwC3XQKmb6UBT2XCiUXjalHxDqfjUSFGBGHCXFTF0FqSBtVWDlQMF2
	8E26Lg+/lD0Jqf4cXB+SvJ/K26+f53OcV2dKwXJtebxf/h5qCwKug0C9VcBtZfvDpuaR81NxxSBrG
	y+EEwnT7yus21VRtzjutFmjl1fmEQGppYOG0I7r8O0W+1Uic4C52f45hZQboWvfM2qmgtClVKkBbx
	cHpxNhAZBALO+1JzHSNXBuLXsZ7GjXiik5mreI70OmtYedy6s495EpNRuZHtpeVQbUCFmpQy9ERvC
	SkX0Ctqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9p-0000000HIAZ-3RDZ;
	Wed, 08 Jul 2026 14:21:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT9m-0000000HI7K-3vIa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:21:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cac59f8b64so8700605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520506; x=1784125306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=FJivnlB5pYlTxj3VGsvN6yEsBcZjRNj6g4Fb7+/ziHV8BqaiGXnYRTdYOXQuvgxagA
         Dj1GwiO7HyrQyMWZlIrBOHNWcYIiUOnvTxEJHtFMhVgmRcoaiKj57FgWsKlwC7q8k0We
         PaxRP7+vz7M9wTjFTcfki6uKdlwk9buzj58jEBtS7FozgSaw/2STeSuQcHG0G6OqVGqL
         72Z8v+mjrzUakjel6+Pw5h4Z5VN+vqjk6Z66SutqYipJIbygJP+Vr1TyQOySDyZA0HaZ
         5e42pEdKargR4/XJ4JE40LIyLUn7XIyshAtFfE+y5kqYJLWlWCAzJ7hTAZ85BIA+vm8+
         ngAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520506; x=1784125306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=ZEPTrz5QmPxykpdJJQXj3Yurt6dsn5Os8TvA8n9EwPX7fNsWxatAi0lccXApH5TjJu
         h/Ta+QFrs0qpq8b/QeRZV+9MI7A51jwuH0CBkhqTc+j/28e3E9AY+69EXuRt5ORU8uxV
         wMgyUnW4t4NsIQN0438XJ/qfG7rD399aWMKvGu4tUmA8FC9MqWV2dnG3zRnYRlq+eS0O
         /43n4MfoZjyWcxKrDu1UjzpSsPfNP5xY9g2eazQXQatc+iOyKp1dhMOUShnnDomrNeJd
         +6cwq6LKGj3EIp0XoZjpKbWDhm7sTUYbgMimRXXWZ56Z3TfBB0y5IrvW6o451/bwOHXv
         aKog==
X-Forwarded-Encrypted: i=1; AHgh+RqIfYmN8mS28n/FpjxaxXiOaWnnOgGqSdnqoO5CaJ7srFXC9157NEIZ6TMgeGv6SgptiQFmHS5ptJfDdZIOAusV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw++Ja32rYk6bQNq62eDGWTNF8Rmo5CvbqnneWpGg1M16/Zuheg
	u6af5YAAbGW3rbXrLXYjw2rvLuq4tPnkoTZCDZ8wWJOs12AKwIBjAdxn
X-Gm-Gg: AfdE7ckJ7FYcYQ0q89n5S6VQijqPi6Kl6n9rkwm8CWf2oOR50j5WyyL2gzbi2jjylAX
	1fQU668CJoLyeQE9Oc+4vlbH9Z3/dxEC5ShkeKDZajfrWfAfSp4X54g5LovpcXdxFK59vONFmUt
	vZGrLZJzI5q/X/GLFPhJ/rlh9w6iyE0+LYJsAgSZJHBwEHgLWpFQWiCa9L76fwSpOheGWuZbm59
	HGPERTsgd/dySdKLmPWDREMRGgdM6ajBiVNCnyJvS3ttTbDyfEYKadidz/lftB6gR6zL4xJ6BL6
	BcuDjoUvLdqgxi9JuJmjvD6g5GtVrooAYJpqeRfn16+r7QoygItjyV86vytE9JkiGADfQeimjyG
	K82/d6Gh3xoSfPP0EMSNhgfZ9FOff9/Tlkq622PYjjx1pXzT+AMT8fWkUJirKyCB0xKHPaFHuTx
	p7npc5SgMWQbKagK5+2/ikUge3T7PRar/Wsyz9M+fMO1XMuoc=
X-Received: by 2002:a17:903:2447:b0:2c9:97a8:afe7 with SMTP id d9443c01a7336-2ccea3cb09amr29387565ad.42.1783520506198;
        Wed, 08 Jul 2026 07:21:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:45 -0700 (PDT)
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
Subject: [PATCH v2 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:27 +0700
Message-ID: <20260708141734.578926-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072147_005268_F60E5881 
X-CRM114-Status: GOOD (  12.42  )
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


