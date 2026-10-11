Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9349FCA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKkUPTCtltFdZ9C+7fT/K+z9vZg2YGtaLvZ8HrFAoZs=; b=zCEPbEmlsBkJr/r7bE0HWDttsr
	AER+Yk9hlLm5Ok8HYsU7wxvmVfpuVzPepI59+JLoisX7kmJ+ITEtwy2GJVnP/YWBej1k6DvPcRAor
	JGzc3Daf9tuJy7tSby9pbehpUxpVdLoCA0Diy3hjJCkp1LSI05UMrxCPlqS832H0UIgWgfaJqwpLx
	RBh4zjPNj/djTVC1JUpuOtJ+19181wCnWrp3IxqHP3jJfuiLikYmZrkwpZdhH3sieZ6iu7X1q0ys8
	gv0+bnSo8UuCAWYKArl33AkSXPfE7w45J4tx2a6+xVZ/TVpZ7vpcCXHeOVCPnMsIiqY1f+RldOFN3
	7/T6M1qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wP-00000009SDr-3eYh;
	Sun, 11 Oct 2026 22:22:49 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wK-00000009SAM-3JWV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 22:22:46 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-91b55859245so26021326d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 15:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757363; x=1792362163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKkUPTCtltFdZ9C+7fT/K+z9vZg2YGtaLvZ8HrFAoZs=;
        b=ANCelbEc4cyIsufr6+Xq3kft9/Rewa0u/76NDyvkseKPuMaI++5ktSLRB2sew2TUr/
         AOh+K810F3GYtnEoXXiOACHG3gPFd/l/TASFcWx0611nUrUNNuNS3hGy3oTYNiWs3oYp
         r+bRZz3k4X/Yr46WUSQuUv2KdvDUo4KBrTXeapFaYfb0d1qCxdIer2+sdUwA1NE9ke1Z
         ANMsIa4vSxXdHQt0qf3nFD9+2uDz1xNpLMfv9zOvLHAIs930WesfByEDOQZgn5kItdvb
         o8xbKyPg5gIpi9A2ErWtAyKFsDm4oFztjDWWzbzK0pFL3i5JInTxX/M/3BKg/I4SFT4T
         dPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757363; x=1792362163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKkUPTCtltFdZ9C+7fT/K+z9vZg2YGtaLvZ8HrFAoZs=;
        b=xoQiEHJAr0ouugPIhJr09Qsc3nksvFva384pfywEMzLBap7P+e6+uqFtMjhjcMQ1gh
         4xts/lH6wtrBEl6VAtMaBvQrPhSDEc+O7OogEcorqPvlVPu6RCZid9bRnn3jPP6H+mYD
         JSKnfLh1w05Z64VXcTIHdtum1jdo9EJUPPJnSMOw0a3GuNkWcOmlBvJlvQom+FM5Bh52
         gbstF99vrxtYa/lu83PZLIZl1IefdjMjAXdpvKqE8Lh+RBfZWnDcupY7PEmDaNlbSTDC
         EbcnKYD0ZByiAV938tHajIJ5Fib3cq/mPzvZkbKjYjj4eLOilESPrnyYs2Sfq8YEQNfm
         4P8g==
X-Forwarded-Encrypted: i=1; AKwUvBz2oxw6tS6NIHyUWr/lyKIkjbPJMb/WtsmVxKK21r2lyIkdQVu86CooTQPZr5vxFnKoR/ekOul2VeAMAbtttJI8@lists.infradead.org
X-Gm-Message-State: AFq9FYK5FCcmdzk/5uFBJwvsR1fiMHxpwft5leHeDwsesh2QX0MwkXin
	I6bBB34KvHU4BdIIkQW8I9tetsQVWn4OpQQm/2aYNlPQrNQd2r7VVlg=
X-Gm-Gg: AYBFou2gtt516EnnlpRHf47dwwW1yFgkrO4KpHBxf1Q+Gs/IegecQugVySNIbLJg0pA
	tqG01/g5Xqrw5RrSWW1Uu1T3ljLoMsHteq8JUmC/vJosmffy9THEsWSEoqGKw7w48DDqucRZo7z
	fZzhc66vlcX0bAyo5Qp8oApYppAR4i+CbtTKzW1WUylDfBb72GUfLYUarrHSpu2hJfDn7Wl39o4
	HzYPCO226AeOjIA0G/yGzyM4d3e89rOnKQmDiicHFz+sUXzMFW35J19T7135zfTDaBMyuUA4I9l
	RGWlYq0lq0kmpZ3+ABSuJfTqMIfjTx41sFSHHZq2nG/fk6vRoq2o7yiVBx0Z1/rVTaBK/XYzKa6
	TXaiRHeS4ekL4C9ylGSkjg5DmhbIO+1ofDeUme/cvsg+gjBgnM8GdtvD5UHJvooiZqi7eH81fo5
	IEYM1yUYY1dpgOVNK2ZQ1D3NTZhXdcpfbeY0VmsqFEFUF7v4wARBXnrETkr9h3opUt9ww8QF2BB
	otPHPVzgP7YnMGBq8AkMupK7RBz1z2pgbNE60t6WsW342Vz48BW1D44/dxOefQ/5t+O9E2zBq5f
	U/AuTxUBZa0joBldNUJ//DexFo4+
X-Received: by 2002:a05:622a:4d07:b0:535:8518:a4ae with SMTP id d75a77b69052e-5359fdfce6amr134688601cf.61.1791757363408;
        Sun, 11 Oct 2026 15:22:43 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:41 -0700 (PDT)
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
Subject: [PATCH 1/3] ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
Date: Sun, 11 Oct 2026 18:22:32 -0400
Message-ID: <20261011222234.2098904-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_152245_288347_3E95B508 
X-CRM114-Status: GOOD (  20.57  )
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

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the regmap is initialized. Apart from allowing an early interrupt
to use an uninitialized regmap, the reverse devres order releases the
regmap before the IRQ on probe failure and removal.

Request the IRQ after the regmap and the handler's other inputs have been
initialized. Release and synchronize it explicitly on removal before the
managed ASoC components start tearing down their state. Balance the IRQ
wake setting on removal and on the remaining probe error paths, and keep
the existing runtime PM error cleanup for a failed IRQ request. Save the
IRQ number in the private state for final cleanup.

This issue was found by static analysis.

Fixes: 097e874ad3fc ("ASoC: mediatek: mt8186: add platform driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64).

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 44 ++++++++++++++-----
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-common.h b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
index d59258520995..d03e59ca7d65 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-common.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
@@ -139,6 +139,7 @@ struct mtk_base_irq_data;
 struct clk;
 
 struct mt8186_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct clk_lookup **lookup;
 	struct regmap *topckgen;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..ea61fa5fe372 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2884,16 +2884,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id <= 0)
 		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
 				     "no irq found");
-
-	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", (void *)afe);
-	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
-
-	ret = enable_irq_wake(irq_id);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2946,6 +2937,20 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8186_afe_runtime_resume;
 	afe->runtime_suspend = mt8186_afe_runtime_suspend;
 
+	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		goto err_pm_disable;
+	}
+
+	ret = enable_irq_wake(irq_id);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+		goto err_free_irq;
+	}
+
 	/* register platform */
 	dev_dbg(dev, "%s(), devm_snd_soc_register_component\n", __func__);
 
@@ -2955,14 +2960,14 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->num_dai_drivers);
 	if (ret) {
 		dev_err(dev, "err_dai_component\n");
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 	}
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
 		dev_err(dev, "failed to suspend device: %d\n", ret);
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 	}
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
@@ -2971,6 +2976,10 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_disable_irq_wake:
+	disable_irq_wake(irq_id);
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_pm_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
@@ -2978,6 +2987,16 @@ err_pm_disable:
 	return ret;
 }
 
+static void mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int irq_id = afe_priv->irq_id;
+
+	disable_irq_wake(irq_id);
+	devm_free_irq(&pdev->dev, irq_id, afe);
+}
+
 static const struct of_device_id mt8186_afe_pcm_dt_match[] = {
 	{ .compatible = "mediatek,mt8186-sound", },
 	{},
@@ -2996,6 +3015,7 @@ static struct platform_driver mt8186_afe_pcm_driver = {
 		   .pm = pm_ptr(&mt8186_afe_pm_ops),
 	},
 	.probe = mt8186_afe_pcm_dev_probe,
+	.remove = mt8186_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8186_afe_pcm_driver);

