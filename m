Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F4ECA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPAZN0oQNOTlT28AVZKZkrChj6dbwv6rRrQ+C168c+4=; b=FweAjSnIiE6aUhrglj5K4jldkL
	0jptNznQUrWvqngZ16VUTe/d1u0Ao7ml7OjkYDfPsicgYL1NALXdyS6ztD05MW57GPDFsU1PFvA42
	MnRL2Mf90B1AZVc3+6EN55ZUG2Aah702n+Yf6LwFfF3rldwuVq4ilJWJdMOeZiBd4LBvy3R/+a3O2
	RKHGjO1k+UVsWD8KMBN6Pc7VnVl3N7iHxGkqGix6Emqs6CFT2RW5byAgsbmH/MS4qScLAjD71wlim
	/pazohuYDw3/jN4rpwznWSCKrsgyRs+ANKMJdv+adQdh8hXF/FTJ8q5/nDT+GugEyHExcHe/ybYRE
	muEeLBlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wQ-00000009SEH-0Ia8;
	Sun, 11 Oct 2026 22:22:50 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wM-00000009SAz-1nSB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 22:22:47 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-530e75d1ba1so14802331cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 15:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757365; x=1792362165; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YPAZN0oQNOTlT28AVZKZkrChj6dbwv6rRrQ+C168c+4=;
        b=n4YLsKcfgBrN/rZMfoVNTdC/h0IpnAuzZoPjRDZMtb+H/OkVJlTPQvS6R1P+nIy3Ht
         qbiTz7rSmiX9N21KRociCzbr6xiaG6WRW1oXfZgv3sjOBTYXupodaVw/gDlRCM+ZwNd6
         D8+OujWs2fIOB53oKWSlVJooAPW6Fk824dUaYbn+haL7ptf4P/B6cqvreDOeGGKuhUzl
         AStHQizUpFPiADbXyCEJPx+C5SKo/yzKBvNtZrH9Fey1k4L68wyxIxdludNEIO4Tsy88
         BxmKMbrQoqDv4XP2chXuGGUUcjOd0a9/y1Y2zw0mpRWEMboJA/BTP/S5Y2DlWKRIEf/+
         lXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757365; x=1792362165;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YPAZN0oQNOTlT28AVZKZkrChj6dbwv6rRrQ+C168c+4=;
        b=xlL//KA4T8NxgIjiKGtSyIKjjJls71VHDTrSeOXcjV4H/k7XxDDP++AdmTmwwIQPae
         PGo/8xjED5L4/z/AuuUTsuLl3gYirHCFjuifmkubB55f8PTCmeJm2IIPt/FcEfq8F3QN
         5JrGFaqmHq3wTt8JY5Uv83j9pY0Dy4pL6SVyq8+XhIjMeMbhywZlyRbbSYbcXzO3HBX6
         cN6Xzwk0+ZiUwvKvelLkV+eGqgoZb/zgHtvr7Kdti6vPJu3dU8d6qFbu3lRsVXo6kG/8
         1XXacRDfzFbBmlFOg4M+046duoPrOpNJx5gGJ/VCVeJfqbnk8gayo3kg08bvBSkSx/To
         L15Q==
X-Forwarded-Encrypted: i=1; AKwUvBwyMVrt6jfGuhpgBJLXCg+tCG5QumZELxS/d8Qp1jE1FZkmN/bcEeC2/HPgIEN7IotkhFTODvUAMCV6IpTZLelq@lists.infradead.org
X-Gm-Message-State: AFq9FYKjZNZRFSrfVCCOovEtwjKnmtoFloIdRjBHkKh5c5gX3RxTfrPq
	zN3RgxydLcI5MFSMKRoBvHmVWotw447qHrpDFgm1Q+GTrZQcU+lrD58=
X-Gm-Gg: AYBFou1QLe3eB3VEL0O5XQ7JvjVbZLsiGuvHul/ZobNQp+1MGjutNQLBMfSbQ4z9mpL
	DdwYi3KsPfTg7YScwP1sapmJ7vd2WXVKKiJWMziPspTxAi+xbsrbSzZnxOwIYV3P59wMxgUU2o6
	NFGdZRJuwpbxt3DVtOSDseivYyohJG89Dp9U9ixn1ehlNYMtQjRcbng3lUme2CUDy38VJhALfo7
	0dHjQ4yhrYacapXWrWiCNfGKXQFFu3G0ok8xA0I0HIw9pFLAXtAhThJWZ6/kf5ej8z22OpCUq85
	H9fZ3+v2gMi8ejkcG1/HxEm8dOVl4a+c223eEpmV1hRXgi67nhu41VmDLVw65lpNNcqcaR1P+PX
	VpGGzIoBKXigqGtAoPMFPxlnbDeiwLCoyaBC+bmt6q1UejGbryqURkli/+wxIPjYKcf/dzxvGdk
	PNiYkinb2E8f86/RZ1/lS0hwCs5DO3NVx95g/6BT8raaUHBQ3DQUlp2I3rXuWSntMxq7ulBmo+s
	/bjw1/R95NTHopTU84f3in3psNK9wHxL5qwptBvokkhhMjH8ufum9znfbwv1iFN1MkbQMUFWoBx
	MJ5CqgfTILBOxhVaQl/qPV5J++oy
X-Received: by 2002:a05:622a:2615:b0:535:1ee6:ab03 with SMTP id d75a77b69052e-5359fa73be1mr143610051cf.20.1791757365216;
        Sun, 11 Oct 2026 15:22:45 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:43 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt8189: Keep the AFE IRQ within its resource lifetime
Date: Sun, 11 Oct 2026 18:22:33 -0400
Message-ID: <20261011222234.2098904-3-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_152246_479264_394F4D7C 
X-CRM114-Status: GOOD (  18.14  )
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

The managed AFE IRQ is requested before the regmap is allocated. The
handler can therefore run before its regmap exists, and devres releases
the regmap before joining the IRQ. The remove callback also suspends the
AFE and disables its clocks before devres releases the IRQ.

Request the IRQ after initializing the regmap and before enabling MCU
IRQ routing. A failed request then takes the existing runtime PM unwind
without enabling that routing. Release the IRQ at the start of removal
before the explicit clock shutdown, using the IRQ number saved at probe.
The regmap's managed lifetime also encloses the IRQ on probe errors.

This issue was found by static analysis.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64).

 sound/soc/mediatek/mt8189/mt8189-afe-common.h |  1 +
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c    | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-common.h b/sound/soc/mediatek/mt8189/mt8189-afe-common.h
index 910d90d3d146..de715c92add5 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-common.h
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-common.h
@@ -202,6 +202,7 @@ enum {
 struct clk;
 
 struct mt8189_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct regmap *pmic_regmap;
 
diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..913c3b43fda8 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2507,12 +2507,7 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return dev_err_probe(dev, irq_id, "no irq found");
-
-	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", afe);
-	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2567,6 +2562,14 @@ static int mt8189_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
+	ret = devm_request_irq(dev, irq_id, mt8189_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		goto err_pm_put;
+	}
+
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
 	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
 	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
@@ -2596,8 +2599,11 @@ err_pm_put:
 static void mt8189_afe_pcm_dev_remove(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8189_afe_private *afe_priv = afe->platform_priv;
 	struct device *dev = &pdev->dev;
 
+	devm_free_irq(dev, afe_priv->irq_id, afe);
+
 	if (!pm_runtime_status_suspended(dev))
 		mt8189_afe_runtime_suspend(dev);
 

