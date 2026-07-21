Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B750C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=xPxcCI7Os0w6hYHWVb1uqNvLL4
	MqVnnlmy9bJqvkuZZJ3/FQZ0YpyCyQPt9T0uMXhh30mZkryEidL1pZfYrYTOEE1o8LJ580qqTafHU
	iH2Q99CugdJ6Mc5GdUs3MnI2DHN1BIuCXP7//1Wj51yeZxig9Nz6hXLd/U4eAXEQDxLPoItmyfDFf
	xsRCB/oVLyKQUxCWDV/Y1uCIDy8AXyaXBo1HqqKWhF9xBG+H7cdr4OxK5w81xA8G4w8FCrUqSE4zS
	DE2Rq7oZDRMcIBP8dO2yspB+mMreghQ44stzUUoBteP1tKppyYJ3UIjMhL5SZMUhfLdNpYnDNUVEL
	rcgnyn/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7i3-000000099di-3Xry;
	Tue, 21 Jul 2026 10:28:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7hp-000000099M9-3iOH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jul 2026 10:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=; b=f5lcOfQ5HwxVuk6xht4OtAcM1T
	2TE5sGB3gleXkY569EpB3/Nu3SkY/rWpWOnjfktCqkyONWSSA4PqkqwdCwRE3kohOq2ows/P1tkP7
	P+VWGPhLAQQh9wd81aeVzWHl1X+Cjp3MekCtmabi9U73cud6sUEe7FVe0VPa3twNeNl9+v7VNYdba
	2LPItnqFDNr6tt5yE3PY4IitsuR0IOJYl95xpric5uRnT8AaTwoju6OoXttOgaiwGiR+zjwQpy1ho
	eARYyt4FCboURNVmuJ7ZQnJsfealH/NmWmFwf22PTqbC6X9YLe6Jb3qfrNgSzJC8evZbTwfwDmjJ0
	ONLymoeg==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wm7hm-0000000HRe7-0TVp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 10:28:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso127583585ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629684; x=1785234484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=s5HAObh4xSS7PhYDRbIFRHT69HqpgjbqmGs8rmSZwfhD/9hxOL7Ck6gcqLEiFH1GFj
         qfy3PJh0I7O7E/IpOwMbIFZff9qXZRskW+jMM9vTKABVmFwQoZ4VWS19FYTpwxu2hGp5
         KMw5Kl0hBs4vB1zLH2Tdm6IhXRQcQr2EVkCj0YFF0bs76GrIUnMn8c3Y4ITji5bPG90X
         MaVwTOWvCUSWzEuG/U7wqSp+is+3l3RwXBwupaFjlzaL8Yl59/CyqNoQW7iyovPdWyyW
         rBUfP8IsQ2/TVE8iud3ugMtzwawzetEu0QaqyqoDfc55XvrdOli05U8ECzNWA7YzXuEG
         iGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629684; x=1785234484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=SFaklureWnYy9qsPpXMGLZBFCa0yZailaVqbGv3sKGB3aRMW+Ds8V5MqtL9Px31b/s
         VlrCySgkzbgwDb/sT4Oql4cfQR9AsR1wZZ5iUE4wVCQZj6zmq3h81JZHNXpGxfNfIUkG
         VL7blSwamva6Zb/sll6u2W2vY4EkWssSz5iqI7Vek4PPRpRV73BQoOU4jz8oj1xaKSVq
         FJkqFdghFzqkOFea3A1LCyW+JUW4bH/a7g/4/dIIhFrK1UW+TAhfflAo8ncAX9RXL3Km
         5cvG/Lbm3HKwi8HNTQOOTxGAHH6o4Fglktg/+a+Dw/Czi6JIBolfY/QnRpty7plVgUS2
         2CZg==
X-Forwarded-Encrypted: i=1; AHgh+RpJUfPGr2sf+NHVrDRcdniwFw0EFQ66ROnzrIuGaggWYEG8/C41puxrSk6CFKJs64XgW14PnsjTeo75qh4OW3ke@lists.infradead.org
X-Gm-Message-State: AOJu0Yx72KgaCp6FmjlW4HeoaIDO2+eJfrQkqiNur244+98ttFyzuYF3
	3q0KHHO2eFiIJAh/kkl7zsQU5RKPCdf2awROi3dBTBC4lvkxdKEiiPxp
X-Gm-Gg: AfdE7cnGBEJOi6zN2ceDAD5ABFLFRnl3g5ft7p7xKLE2VS3GN+r7TyWswSAiAAFSqMM
	FoFaN6jKM17McM/zLSibaj1tUv381pP0LnxuD9tp82T1VJTdrrTB+Wvs4H8Q3n1mQpo7WLNNJon
	T6sOf80OrsenCV71PUYgi7JORAiIiJOjgk9t36Fu9rtqZotAMmbILbJq/7yf65u5uib4Wj9H6PY
	GdaEs9SPUIwCEUBBObHmPcQpvX3vO1oGAGeEfuhl2vHAVt2bNyZgFuj8hX3pAT4gVjMBLE6kfXT
	6+WFNFG9/qAH9irU6Nc1vV9UykioTc8XypnqAV/3BHFe8Rl6pVgj4fGMA4YVYPeggbCaskGAUWq
	okkoYdopVckv8Lr4Ny0CMTZjB4V6/iYVTdNxrn00Qp4g/TxdJjnskA/tQc17tU/t19cQk22uRJb
	kIkQ7G3FCXhvmkCV2s2xHR42HP5Vl3PwVbZNX+
X-Received: by 2002:a17:903:3bcf:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cf34a80342mr208350785ad.45.1784629683862;
        Tue, 21 Jul 2026 03:28:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:03 -0700 (PDT)
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
Subject: [PATCH v4 13/29] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:44 +0700
Message-ID: <20260721102600.523199-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_112806_357851_ADF74639 
X-CRM114-Status: GOOD (  13.76  )
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


