Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCE0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=xIoyjuV5Xwmke7ONLV2geZRw88
	yNnLF+Dk+E3SXOJyl7TBlSFoFI9eIAKJOZJwmolsUadbJ5FhMrEgBM7p4CoTgXPh0RY1aoPGAVTcI
	tBdP3HDJFpBuNzWtIKfnE5wA+g/HhnBm9NWaZtbrLFxWUATBcAyfLoBffArgUtFQEv1n1PRAerpR5
	Lbalod6SnVDyeTWL3nSgjlJIsBQMAsZSJ8n7Ka2iPMZ6LyKSJ4RrueKam6tbchfzxFyS+d/myOw6h
	AL/Bwir+8lwEcoQ13XKuPSyN5oB+mKkmfbhbutL3pyBBmSw9kxJ/1/6544S/mWMKdv1ZuO3s0kQn6
	kHxPjWFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3S0-000000048pv-0RVY;
	Fri, 10 Jul 2026 05:07:00 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Rw-000000048mc-3qIO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:06:58 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso467486b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660016; x=1784264816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=Oi2Uqw1NTl1TKmJiPfROxtCDv2+jBHpbTpy8u44M/CKf4C9B8YkW9r34cncR/p4NfS
         jg/YHyqzZQx+ADX+Dd8CQny9eRYIsQOSMMOmclg03G2MtNeg8L6fLfrG6pIHsWYMLGJa
         TDjukdGiMmv0cUyAlF1bpeI16FZkxp+hbLUPxSnmu7Qq/Xd92MPv09dp0JBh+klbrAq6
         zGryX9uS5itd1PFoktJHJEHaYkUBiLaG3hPqzmT2ALgm1WX9JQpi03o45GfKle/xBaFf
         /kzWrS+3Fq3oZ51XpLs3t1Tzz/N+Bvu1gByCRXzIsJDk4yGLYoxejSQj4zB8kr4A7R5Q
         zISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660016; x=1784264816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=njRNDttmyetbpNiFZSU1zyS/r635WWNhbcMBIvTE95s1eh4nlLG0LEyxuOoDpx8a5o
         VPcOd5l+Ea2H0UreMRhGmoMMh3CqWaW5l6pES4zBaWYGSNqPsjKFmXT1JCik/Ccgb1bJ
         w+eVccK87JoJwa+NlHg8df/Du1eStl0/ugOYwzxfEffrZ6VMcOL5bC81aBW/1U1xlg7R
         91vDlwG7uTEDO7UXUZ9c1GUcCmh8goTN36XUxsO7BsRc82KLHQfv14u19Qjy9JnZMpna
         0q9Gq4Z8jgp7CGSqomRuZtWOyQULL4uziJYg+DTQul4y6iFsnpLUbc0/5chQ67lKnWop
         OVqw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8yD9HZgrib/evExeo8m2j9drOOS+vlJSCYiJi3CIsw2YfwZoIK42cJ3tklXLi7BTI9kxHrVj0LfYEnSoYfCVH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1DFcAT03sgiwGav006CfwyU8TJyaXJ1cmXWou04NWchncauH2
	61PBVaT3565anvex0YW1mDgjd87box8evQhcy6mbnezpm4hk9VvGqH6E
X-Gm-Gg: AfdE7clmgQZxRQS+MUJOOaL0kDyE5hkvaqonM3OP9h3KQpuWVbrEVHN10FJYgLrekas
	bgQXmkSHJbJUrKCShy2oaz23ma5Q+DT8r8h10y1vSrGXIJMByJ7gJ3slNbkcT7UCLJAMdkjQsK4
	3OtVKnkMAmudGkj60Z1SQ0GUqwFp5V78tbj75idmZoyU++uKLlBJkkKBU7U+TQJ5YlXbRzf760F
	lCpRT2Ti96BvdKzvHWuK2yW/rvV0bJQt4JJ3amIGejb5DyjPAR3roSs2tlK5nMPeZ66oWAPtIgC
	aOHSSXm/qT1teNzMVtRDputSHrG4xpN0S4TuTGtVKlBtlopbXWscE6z4I1MgxaJjQ2Nf7j09Xxq
	sJ7s/vKFMiYVZZ815itBKCb4Hanb1IYO9dDCzZ6lI+KWV7swL53+MKvIFsRlJgb+fsNHtL2+CDe
	pS/gEJ2rci+7xKkAVstfcDY3pJw8dlrKGJ4DjoGRb8rA+h3Es=
X-Received: by 2002:a05:6a00:9487:b0:848:4b27:36a3 with SMTP id d2e1a72fcca58-8484b274223mr7138346b3a.72.1783660016109;
        Thu, 09 Jul 2026 22:06:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:55 -0700 (PDT)
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
Subject: [PATCH v3 13/27] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:57 +0700
Message-ID: <20260710050511.14439-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220656_985369_A61CE367 
X-CRM114-Status: GOOD (  13.57  )
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


