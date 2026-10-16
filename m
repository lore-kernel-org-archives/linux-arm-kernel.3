Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835C4CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 03:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FiSWddY//7cIxkgjPTVJ04fT7tu3WDIsuOMUv0HXBC4=; b=3E07A4KhWWjMR7rSbMFiuDQlfa
	usU04nJpz8TPmjVbQByN9qLA6hT2/kSxwDFgvmzk1vg594UIQRURKIarRn1u7rLCKbCl/vVZBvLBs
	D8jxWbRDznm56acJPgLG0IWriYHcyUrd1/K9EnrY3NaqJW+1HEdNBi5BByFtyvTrKpo3b+FV+/biM
	GUhcVksUzi+IXqyQ4txOXhFIQRz34FSmHGU7B+uXL9NHG8Y580sajSl0QNKkgbhLTT6786QacDLKZ
	vRr7SMBaqEQJyrH72aN/pju9GHAv5eXumadsy5nRoMSaPdRDpxRLzt+eoSQ7N+Xn/6HUxU0voOqqL
	2H49hgXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYoP-00000001rwl-1JlS;
	Fri, 16 Oct 2026 03:40:53 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYoM-00000001rw0-2mLM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 03:40:52 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5350d9ea106so72961311cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 20:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122049; x=1792726849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiSWddY//7cIxkgjPTVJ04fT7tu3WDIsuOMUv0HXBC4=;
        b=oFc2FbsPE4638AnYx5IfOozy/lsOpXrW5q39plFj+ooMNHp9sIP7MlICyFv7LnSdC3
         cNOIUd/aEU/vDOhYPK8FH0oHdkS1Lf5Hr/rZ+Q63AYxwiHFitsyebeKrBLNAzkXrPRBV
         Jn/6Esixb22Zuv9KF+L4iK7Uf+pQ53Y1uGpK22kExzDyaLsShNiakX4tEYL0nImqbfhO
         1wy515KWU80+0uCe8Va8pKGWXicAjzNJdL6w/uLV4tI9Uz7OrVq7e9T2/mXtVMTzP4ii
         XTyIiro78sYSSC0js0JBnu5QcPxHNAj/XZ1sZo0rHnuHZ1SzNgmrjOaqBVWMr5w+KQ47
         1aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122049; x=1792726849;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiSWddY//7cIxkgjPTVJ04fT7tu3WDIsuOMUv0HXBC4=;
        b=op+kbTb38vPxrKl7QgiZ24DL2Mh244pO6AGAzeYsoT6z9p1u8CIQTfP7XTcKctYWDM
         X8Cqi/7CsRHtmPscCH3n/GLa6MOkZsHMCLqY8AGXAKLjK3nBLhaw/XTiimeWi9jvd8jA
         UFRtTPFLew2HnQrHLPJtDe6b893Y+/qHCj4NVxCWx61l+Rn9W3lDW9HvBCsrE8us4X/X
         LmM1oM1PYiM8DHro8jlwtFLX//+e1yf5bHvan7ZA5vWijrTaf/gZh3ugI8FMh6dPytEw
         iueoIvPgKlHYxABnNziLXa2u634Ksnof1qpMLUFjq+cDjK5s3H81pXuoQ5NhFLWfIWfK
         1KIA==
X-Forwarded-Encrypted: i=1; AKwUvBx19lhcRbcOVGrC2hUZ+yR7jq3tDiMhFGI/IhuJl+Q9GUDnrdEKta/tUElx6Ox15BoXF8Eu57XTe79G4JwYYB6+@lists.infradead.org
X-Gm-Message-State: AFq9FYLQtxbBL2MWdueR/V+E1pNl2sIUrEH3OcX1hyGxAafXXbsEWxUN
	9+ss6cNqAT1owyUTxdP9YJtDh6YXZfhdp2uUag97C91vnEKax94luKU=
X-Gm-Gg: AYBFou1oHKVa5IMWyvK2mcyiyuxoipgpbHVT8uJZl0Qc4yMrYCVZ0Hagh1vxlTecaJP
	bshn1b/UEHZEWQnohAxLTuAZjkQZY6YXif8zKaR0j3lyh0aIunYc5LLX7VXQh4yKMWu2+VOF1h8
	CQjobMdem0vs2uZ8Ety0h17aiqUIR3DFNuip+aXNA7ha0DIdwjJKhr7A76W/aqswlK+W30bntxo
	Pl82sAC7PQeiAcpXY/pPZKLov1n73Oj/olyCRiHAGJdZpt/t/q5i0joMgEb3BieOWF0mCVoPg7F
	ktW7BtZfJ3twVZaeIWjaJSzPiMXGGR9HVsraZQ7xUnLbIKgR/1hmW21b4XKDKtX7Or6lTWFjSeO
	zYNZmTXoaHuLixV5MhEiI9/3LO3XoAc/qa+LtiYDhlsq7GSciZNLxbJJCNy0QO73U5V8ixxukD3
	cQjhdauRgYqzY74GLKo9Fac9QVZ5tKV/oIdr1URTqNCPH9vsm7Zvbg5Gv2qit+Np8VFCxlUzQNR
	WnJM+wz6iqQxfB7nok7c5WD7uS3mSpGFDR6ZwV1TAyjCUoPPeFyInVH/qhCFZyAgiEj3DxOdU89
	GU0Lm4S1LVwKvXN1QFezyOXRRCi6
X-Received: by 2002:a05:622a:558c:b0:535:232f:ca21 with SMTP id d75a77b69052e-5359f486ebemr346542441cf.11.1792122048786;
        Thu, 15 Oct 2026 20:40:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9dbdb5sm11198881cf.22.2026.10.15.20.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:40:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt2701: join the IRQ before managed cleanup
Date: Thu, 15 Oct 2026 23:40:45 -0400
Message-ID: <gm-top10-20261015191529-g154-c729db287fde@mhun512.gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_204050_729046_DA2D83E5 
X-CRM114-Status: GOOD (  21.19  )
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

The IRQ is published before the handler's arrays, regmap and clock state
are ready. Remove drops the PM reference before managed IRQ release, so
a handler may also overlap clock shutdown or subsequent resource
cleanup.

Initialize the dependencies and acquire the PM reference before
requesting the IRQ. Register a PM cleanup action before the IRQ
resource, and a final IRQ-disable action after component registration.
Reverse release then joins the IRQ, removes the components, frees the
IRQ and drops PM before releasing the backing arrays.

Disable and join the IRQ explicitly when component registration fails.
Use pm_runtime_resume_and_get() so a failed resume does not retain a new
usage reference. If manual clock resume succeeded while runtime PM
stayed disabled, unwind those clocks if the later PM get fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 43a6a7e71063 ("ASoC: mediatek: add mt2701 platform driver implementation.")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
The final devres action disables the IRQ rather than looking up and
freeing another managed resource during devres release. Independent
PCM/card lifetime and system-suspend clock ordering are outside this
change.

Compiled with Clang 22.1.2 and W=1 in the accompanying validation
bundle. The prior G154 diff received independent source review. The
revised manual-resume failure cleanup received coordinator
counterexample review. No runtime reproducer, hardware test or
full-kernel link was performed.

Base: 0fcb05b72344f40806cbe810de8872f1698bf053

 sound/soc/mediatek/mt2701/mt2701-afe-common.h |  1 +
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 65 ++++++++++++-------
 2 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-common.h b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
index c9477bc24ee9..c7ffae5b6fb0 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-common.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
@@ -89,6 +89,7 @@ struct mt2701_soc_variants {
 };
 
 struct mt2701_afe_private {
+	int irq_id;
 	struct clk *base_ck[MT2701_BASE_CLK_NUM];
 	struct clk *mrgif_ck;
 	struct clk *hadds2pll_ck;
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index d56b498e8c0c..ef051157a0c7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1591,12 +1591,31 @@ static int mt2701_afe_runtime_resume(struct device *dev)
 	return mt2701_afe_enable_clock(afe);
 }
 
+static void mt2701_afe_pm_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt2701_afe_runtime_suspend(dev);
+}
+
+static void mt2701_afe_irq_disable(void *data)
+{
+	struct mtk_base_afe *afe = data;
+	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+
+	disable_irq(afe_priv->irq_id);
+}
+
 static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	const struct mt2701_soc_variants *soc;
 	struct mtk_base_afe *afe;
 	struct mt2701_afe_private *afe_priv;
 	struct device *dev;
+	bool manual_resume = false;
 	int i, irq_id, ret;
 
 	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
@@ -1619,13 +1638,7 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq_byname(pdev, "asys");
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
-		return ret;
-	}
+	afe_priv->irq_id = irq_id;
 
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
@@ -1687,14 +1700,27 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 		ret = mt2701_afe_runtime_resume(dev);
 		if (ret)
 			goto err_pm_disable;
+		manual_resume = true;
 	}
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err_pm_disable;
+
+	/* Keep the AFE powered until the components and IRQ are released. */
+	ret = devm_add_action_or_reset(dev, mt2701_afe_pm_disable, dev);
+	if (ret)
+		return ret;
+
+	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_platform;
+		goto err_irq_disable;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -1703,27 +1729,23 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(mt2701_afe_pcm_dais));
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_platform;
+		goto err_irq_disable;
 	}
 
-	return 0;
+	/* Drain the IRQ before releasing the managed components. */
+	return devm_add_action_or_reset(dev, mt2701_afe_irq_disable, afe);
 
-err_platform:
-	pm_runtime_put_sync(dev);
+err_irq_disable:
+	disable_irq(irq_id);
+	return ret;
 err_pm_disable:
 	pm_runtime_disable(dev);
+	if (manual_resume)
+		mt2701_afe_runtime_suspend(dev);
 
 	return ret;
 }
 
-static void mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt2701_afe_runtime_suspend(&pdev->dev);
-}
-
 static const struct mt2701_soc_variants mt2701_soc_v1 = {
 	.i2s_num = 4,
 };
@@ -1752,7 +1774,6 @@ static struct platform_driver mt2701_afe_pcm_driver = {
 		   .pm = pm_ptr(&mt2701_afe_pm_ops),
 	},
 	.probe = mt2701_afe_pcm_dev_probe,
-	.remove = mt2701_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt2701_afe_pcm_driver);

