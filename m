Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED45DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=juK7jt65tJFm4YsC8q9jQ1mHXB
	SIn1jEIvFMZf9iZjfyEAyxwJJlgwAfLKVdjHXJaddLl6xuUX8pVHftsWmNAAvVx4jeUs23fOf+XA4
	WIydaca2SFChwRPudsK3vW9VaxoNfglEddvQDqMECEdNwwn8IV4+u4up9l23O5wE5IeyZ8klNkOKC
	hFw9j+NKLj4+Z0CPYF3shu4Sq5+RHS8gVedNB5cvDOPKoH0pihkmLLt3vj3LtPmb/TU7E7bzPeDoK
	rwljgXfm4T4AnL1UWvY9UoIiMv+fbu6YSPSB0OrCsJBcwAS/9vusoCZSlDBYU4XNo1eV6ypjvrhfJ
	3HgJmP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT91-0000000HHTP-2S48;
	Wed, 08 Jul 2026 14:20:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whT8r-0000000HHNI-2htw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:20:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c7cfa17fedso8139075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520449; x=1784125249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=SkyIFkJiyg4T3rsEuWL8QeLJmi7zT2k+GLbLrVyoOPs6TD8RnwfbtOC4GHlxmV2ITs
         h9qXp60Y+ZMJI/ooiwNSBOQswKMYvtfDYKkkP59hC8sgZCt0LilUp10gXwYI+tbjG9LL
         xHqVeT5Hlb+X1HfC5US9c/yepVJHsHjPV85kBi/zdi6B62dd5PelQlWj1C6VNN++Za7h
         zDECVEWQA54pbIjAa5Vgk5XuOfxrwebGpt03a6pvBPpfNn6Of5DtAlsP1gJT5Jcm805c
         MzV7WzlvEcdAWr39EFkNl+OTFvOgiBToY2mzHswKplIFjFhi+kRR630VTRlnM3hC3lMh
         Oayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520449; x=1784125249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=fGA8/qwvALr7FSxZCa8B4zd4EmQHynLi4Sx2fvThQ+7vwEFGC92ziIDmt9psjHlUyw
         McjMvunH4erBKy5RRv+UZzbUj78zjImFcpLaXuSaimL1Zzp4U9kMyJNOcB5ii8r8+sVJ
         b1tVwWLLe2BegBagz5fbQfQmtvc7HM1Gkpqaz6wnD9Io9nf9AxGAPQZPXBzjzDJ2PUH3
         AsaOVJieZsIeVRQbrumR6I+yoQQc0McPdupoNig95rm+cVQ1gRh3Hnahp+cfYRCMnPJF
         +eze5sJtit4DA9faWLQjBGIGScMysuYqze7MfglwzNN517Tb5OoDlnpFM/YCJpXXSbNg
         c6NA==
X-Forwarded-Encrypted: i=1; AHgh+RrAHCD1Jd6XgR3ESOWBqguy3d+M7yVaMZ6X2tXNgMNe7E90ks3KLm/3z5ftDvG/G2CLCTMUWmuDz5pEtKLyIHRb@lists.infradead.org
X-Gm-Message-State: AOJu0YyMYLoLw9K35IIFJ31d26PHvgKNDY9J4kEcYYhgjX2icO8TfDuH
	WHllJZtTlZzUdYKEth7i5vb+RIf1tDuDNc63vomQfg55qhFX7sZoVTi9
X-Gm-Gg: AfdE7clZHe1bAp7YW0Qaq2zxPmj7kYA9nhjyf+BvDXg54150X7oOT4kk0RhNMX4w82k
	HWTqPh9s5puST25QknL1lnjiY+qd5cVOc0mKiGT3bajWI9z2whmsDPL4TxKnphzHvAQ6oLR1z2U
	gynoWCL1gaQ0F5llB+3BUxnmTorMXeg6nzZsxuINkH8ZUgB0cre/RyN5UBqzRe0GBwdJY/H3tOg
	87wghb9dpgTb2jEJ4FEjskoUqCf9izayjdz3B5sMKjfMxDQS4idbdbCeM+5FMaXNUa/gMc44XzW
	aWIU8GCTkeWt2N1jTMrbTiDlZryzK+I7MTvsW9UO0FXu9vTURLC6FGK73w9qHZ0pAx6w7eWbYtI
	lJ1h7Cg3ve5Ic7VOnG9W/LV+V4pQus1YLvcPFKy5CnibHU7NXgQVeueYSrVy3+exCMiCFLp8Gws
	liXe8VIOe5meTo/NrQd/ZLIrhRGiyKi4mrkMrjslOOd2O9/+o=
X-Received: by 2002:a17:902:f64f:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2ccea2d7881mr31360455ad.7.1783520448903;
        Wed, 08 Jul 2026 07:20:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:48 -0700 (PDT)
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
Subject: [PATCH v2 13/27] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:20 +0700
Message-ID: <20260708141734.578926-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072049_699510_0BF8CF20 
X-CRM114-Status: GOOD (  14.12  )
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
 sound/soc/codecs/mt6359-accdet.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..e1190c644021 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -6,6 +6,7 @@
 // Author: Argus Lin <argus.lin@mediatek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/of.h>
 #include <linux/input.h>
 #include <linux/kthread.h>
@@ -398,14 +399,13 @@ static void mt6359_accdet_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, accdet_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	priv->pre_accdet_status = priv->accdet_status;
 	check_jack_btn_type(priv);
 
 	if (priv->jack_plugged &&
 	    priv->pre_accdet_status != priv->accdet_status)
 		mt6359_accdet_jack_report(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static void mt6359_accdet_jd_work(struct work_struct *work)
@@ -416,7 +416,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +450,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +458,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +473,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +496,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +518,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +536,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0


