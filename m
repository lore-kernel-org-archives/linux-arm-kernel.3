Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D904CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 10:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCUXvrbdh2cMObj7Yx72xMWUVLVGbJrlQPkt6NyxLyU=; b=jg+eD00rbXXhv0E3O8pB9Q6c6a
	lC9/3vlYt3K7K7xhfgtyLvXt0HuNHHCfimKdYTb1JL09jppsMrgmKQvR86E9jpIJc67xxI+bLdpKq
	XTT+5lZiwssu73BaLlJ7x9GfurSQxVq1upWpvfOTeT/1mjMpVI02pcA7yXCGZE4whyVKYnSEuNyGB
	QvqCbdYCvR0TgyOQEDsJpXrHrWvHAd201V6BhF7aAA6AgGR5C/DrMQjnpPj73ZEyoo5BjnVJmL+0h
	yOVEwLubzs4Bj/5acPa2u2f5o632CgxYURY4LZwMz/6kwX8p/2KhzTWQi8JwOxqlLL+uE8jTpEkCv
	ZrD0zUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfY-0000000H85v-1lLq;
	Wed, 17 Jun 2026 10:38:52 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZnfV-0000000H83a-3I0P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 10:38:51 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so151927eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692729; x=1782297529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCUXvrbdh2cMObj7Yx72xMWUVLVGbJrlQPkt6NyxLyU=;
        b=W09vvcumZ/en0nvy7zol/2Fj30dwUsn8t4lMUC0fdGTCSbO0NwNW7Y46WVziFyHYWC
         CWF+3wbXyAVnh6JknG6nGz3eMgqg4d/R028EyPw4BfVkaJpXJmkjDLBohjFUwCozaPjQ
         b1iOiuiKjeUOpEt5ybpr44RK554YU8e3zomtNwWCfwg2jaPA0PM90KoB4jqCEYuTARbX
         iASCXl4j4aha8E4RHIZtIJH3n38vlD3douVV1wuxr5dfdp8gp0IoPxdKZz5GAnNtRWF2
         jG2/1l4hnu7iJpomYf6l5DhMq6yXcePr4OxPyPpUqa7WdlvMqGGpWTxvk8YMZYFypBwk
         nA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692729; x=1782297529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oCUXvrbdh2cMObj7Yx72xMWUVLVGbJrlQPkt6NyxLyU=;
        b=T2K5uz5Q0jv+XaQZAAVdhwH6hxl8t4qksep9D2+wkKR/JTPQ5ZQcHTOp0DSBkRiL3B
         X9qF/Ox+eykX1/qCVuoozWI5lM10ZlVASAAFxTO9WtZ785vP+CBd2S7ytZyPYUC9oZPo
         WyKv7qzW5EVM8zoVH6uzk1PhNbFAQXB/VXX6pTpTCBhHYcDO4o7tEUYHJxIsnGUNzizv
         BySnf2QNKI1merI6FEjk6nNxUPSce9aq6NOvWrQeUOsKOZToYJ0289f+QP6bFVXQCLXp
         cOC0xsCqToAwASuJD4m1qT8PPKAe9DbW9VY2oURkdaxdfrtt7tzYtIQns61HSjnwI0sg
         OPbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wZJd5dE7Q2UOO0CrtMRtO1IgJgIIj5s3scAJDyBLJh5+dXXHQQLUinM7feW9bPqQxAB3oLWrGe+FsajcpdnuW@lists.infradead.org
X-Gm-Message-State: AOJu0YylSK5xENi4cwRDQbleuqSchRzQ59ev33O3igafBE6UU9ldHJjV
	VYjOyk6syJiog9rzaWUPJ3VW8rKagm2XALvAUdkw/oeq9ZI3quF1E3h0
X-Gm-Gg: AfdE7cmD5zhI0+KoCqx5Wv4x9i43sw4rKDfTheX/DKSILNWHhXIkzWExwK5coG/+IC7
	/MRsAbaR8WGqTQbsB80tbc9H+d7D9wyDvo57NfeFzRt4qw4kF/98b5xsh4ijgNSSzz00N7pAz+5
	36OiYGX9m1+mRDTMSvGa4mXlFpk2+mR6Utgy9PlkHChdSd2+u0gZcjeBsF365dmr9nqyJaOe2aG
	1nwdcxPg7hTiAQV6qODmUyZxJT37kohkT+zX0F75y7YJu9q9rBGJmgTBtIzIPqdRuPfWAY4gwNG
	jjF2Xm9e/07cZOVeiuWOxqBtftsYn5tBfH9V11s7H7nsRyO7FbR9a+gPthgSq6wTj0L0aywlKro
	GxmoR1q3gHNSuFWUZYyVtPTmLCydHP9VD1uhpxsfyC3zPt3ANzR1cJCrMEndrm0VQwezQkXUKIh
	o2OzfIGeQ5XscSdmLsygBTlpW2MIwbwEg2ce2H9DU2RQCOYxY=
X-Received: by 2002:a05:7300:3aa8:b0:30b:df3b:fe94 with SMTP id 5a478bee46e88-30bdf3c0705mr265671eec.3.1781692728927;
        Wed, 17 Jun 2026 03:38:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:48 -0700 (PDT)
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
Subject: [PATCH 37/78] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:54 +0700
Message-ID: <20260617103235.449609-38-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_033849_834479_DAC5AEFD 
X-CRM114-Status: GOOD (  12.19  )
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
 sound/soc/codecs/mt6359-accdet.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..5feefd0cad75 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -398,14 +398,13 @@ static void mt6359_accdet_work(struct work_struct *work)
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
@@ -416,7 +415,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +449,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +457,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +472,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +495,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +517,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +535,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0


