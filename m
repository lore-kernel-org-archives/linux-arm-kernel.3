Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4063CC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddcn6csaeeV+h8a6qan45mbc5QA320UytwqG7KT7p5k=; b=sRSd5ry3AA+BWP4zXH96yX5zMd
	ZuC4rV/JPYv7z9s+vFPSHTTh/JJNWRdge3s0VecWzFFOjQw028crIc42JiE91pY8XzXcQIg2F6Siy
	4GImf3o2sxcnC9rMolEEi7d8+StdZBBTjHeg1rs9FUdzQlNPETSh0T43ogPboCFtsJolh1z+uF1yX
	kYopULkuy0RHISl+mFA4jj8d33lbmfuA9t5CC4VJML1YUzUpk3+3UCgFg5JatZZjh9cuvWUl5Di+e
	HR3wXCxqx+l9CZPscNyjjHq+FNt5Xu6bOHdn30q/FZTuEwo3MxP79bVxyg2Samn4GWF7qzHoEJWgY
	UNeCqPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdPP-0000000CdvY-0BMK;
	Thu, 12 Jun 2025 08:35:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgw-0000000CVYd-2bWn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:43 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2352400344aso6200775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 00:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714582; x=1750319382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddcn6csaeeV+h8a6qan45mbc5QA320UytwqG7KT7p5k=;
        b=dJYQcL12mbcyZkEPvs253FZqfu28bSF/FwCZssCY1kB/tnFNnJhmdocxH8egUE4pix
         k9dkp9IGiYwNDdFQklGTOuHUJNLTAMwa8yP79qc2FPF8xrUOsRKH2F/pOR7oqzGlx4P0
         wsoFLvheqpk7OqmTAbLKxX6W+ZOBcd+S8MeQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714582; x=1750319382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddcn6csaeeV+h8a6qan45mbc5QA320UytwqG7KT7p5k=;
        b=pRGjtX8ixAl2jhZ2xdJpssBZB3TCCX9GMANrlBbxV7uU9gmNAhnEWRf0Gl9RLBPY2B
         K7x7bBgiNKTJ14iZ0GBQ80dWolKLBacO1S5t2o8y0bGt5Or8eQydtJgIeP/JfiMbBxVx
         cZslX5LEUGpwnOD/9p2x+itz+iP4/CaC9CkWLtES1jv8YMjhUF9c18ItEPvxR1wuEJ0e
         7iN+I76jx7ZKAJnuytBxmu/a1zqfgXPs0pCbYPqiXkl/Y/mFfQLsxh+Zxhgktw4XnTn9
         FTV2vnrMTA5d3TNZbCkmatorpNS5Ehpegl77UpoO93P9zv3j9IAdeBqSBAXL8/P9SB3X
         NFTw==
X-Forwarded-Encrypted: i=1; AJvYcCX8rBDBOYoetIYoEA7+HvOHP6dRTR3ldcZolBqWD734RzmqIUb88QxCjZ1UPWB1k43SVC8rNuIb5pHU8zod9TuA@lists.infradead.org
X-Gm-Message-State: AOJu0YzUccZCnpA/CescylfTd6TKcOn63L2s+usIBBol3LFuyuusl+Df
	6ybYQUXjJk1RlSg5CXbmTmyGsFH3VDIgAe+/C/Zz+c/FR2i9RXjcGJ8cwGbOYgd9zQ==
X-Gm-Gg: ASbGncs8vxpLkgwrRRp+AwrDcpL3qznSpNovRyUE1UgRNwb7NFsuHhhnSCGfaCIAYUm
	Qj5yX4Fezerm4gyKgFvCWwLaX2a0aamZ0HXhqHLxqk5/8MWzsIr0hOi6WSSe9g/Dsm3z6W5AmmU
	ERYnlK8dN5PcrJayTvhBqgGjBTGggJ3+UCVpl3OyHtq6lHxI4awQRPZeEP2rLeoapPhmSZa/l7p
	9ZIqTdDyH+/zbVKk7KyCuzKw1FvrVCwuC+0/Zu5MdWniKK3JxRZn5NQQZBQeg2hVsZ+jcR53ZRN
	KXDOYbWZp8Hvlp84m90qzG8aw2fQBSc3iiJ2LiAoD98VLkVRL/x0xhZRNF66RiRDyLgxO+xuD4R
	h8ok=
X-Google-Smtp-Source: AGHT+IGBp6g9KafxxLhpwpCbKXrP6FojB0bp0d+xTc5kKarZApwn/2KeJhM/CNXIUtiGxu8HhD0Ecw==
X-Received: by 2002:a17:902:f684:b0:234:b41e:37a2 with SMTP id d9443c01a7336-23641aa223amr95318655ad.11.1749714581947;
        Thu, 12 Jun 2025 00:49:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver callbacks
Date: Thu, 12 Jun 2025 15:49:00 +0800
Message-ID: <20250612074901.4023253-10-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004942_658142_1BC9847B 
X-CRM114-Status: GOOD (  18.94  )
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

The probe and remove functions in the mt8183-afe-pcm driver repeatedly uses
`&pdev->dev` for |struct device *|, but then assigns this value to
`afe->dev` and uses that in other places in the same function.

Store `&pdev->dev` in a local pointer and use that exclusively to avoid
the numerous dereferences and to make the code more consistent. Lines
are reflowed where it makes sense.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 37 ++++++++++------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 7383184097a4..a7fef772760a 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -770,27 +770,25 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
 	struct mt8183_afe_private *afe_priv;
-	struct device *dev;
+	struct device *dev = &pdev->dev;
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
 	if (ret)
 		return ret;
 
-	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, afe);
 
-	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
-					  GFP_KERNEL);
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
 	if (!afe->platform_priv)
 		return -ENOMEM;
 
 	afe_priv = afe->platform_priv;
-	afe->dev = &pdev->dev;
-	dev = afe->dev;
+	afe->dev = dev;
 
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
@@ -835,7 +833,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(dev);
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
 	if (ret) {
@@ -843,7 +841,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
 	regcache_cache_only(afe->regmap, true);
@@ -901,7 +899,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
 		ret = dai_register_cbs[i](afe);
 		if (ret) {
-			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
+			dev_warn(dev, "dai register i %d fail, ret %d\n",
 				 i, ret);
 			goto err_pm_disable;
 		}
@@ -910,8 +908,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* init dai_driver and component_driver */
 	ret = mtk_afe_combine_sub_dai(afe);
 	if (ret) {
-		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
-			 ret);
+		dev_warn(dev, "mtk_afe_combine_sub_dai fail, ret %d\n", ret);
 		goto err_pm_disable;
 	}
 
@@ -923,16 +920,14 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_suspend = mt8183_afe_runtime_suspend;
 
 	/* register component */
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mtk_afe_pcm_platform,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
 		goto err_pm_disable;
 	}
 
-	ret = devm_snd_soc_register_component(afe->dev,
-					      &mt8183_afe_pcm_dai_component,
+	ret = devm_snd_soc_register_component(dev, &mt8183_afe_pcm_dai_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
 	if (ret) {
@@ -943,15 +938,17 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
 static void mt8183_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8183_afe_runtime_suspend(&pdev->dev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt8183_afe_runtime_suspend(dev);
 }
 
 static const struct of_device_id mt8183_afe_pcm_dt_match[] = {
-- 
2.50.0.rc1.591.g9c95f17f64-goog


