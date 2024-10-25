Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355E4D0C5EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7GKffupBzfLwE7D5fHoA26UgqV4l1meOQDhomQdcNxM=; b=lzDY1gWNqGsOv8wgXqV1DebUXg
	DdEWTt3s/IBAb6NhGOhmgXtQgkaUiEQF2Nuy5f9kScKyCvUtwRh1hfNzHcP/pTVfjMyzxjvYVteyU
	V9yhX1SWJ5Qhb7BM0h4OTo7ykZOKbpLIf+HoeGPfZgMrXqIDvsxVIHA7NgtgYk6McqEtENATPMDFf
	UznNRUwZ5N09Ygg4Cjg7WEjvTFLhUf/3k2/r7QKu+4fGKUjTI5tIT4+XgLvl/4oj/599ap4UqZCJm
	lDNUnH5LHkm11p9fb2WsgKOyoBqhiefDbNJBJUCf8IIROOm3JHwxfBFo8HDjoNpjr5by+YBAyg3eS
	GAu0nVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GQY-000000038JS-2tTM;
	Fri, 25 Oct 2024 09:16:14 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135] helo=cmccmta1.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FFk-00000002tRB-3AsA;
	Fri, 25 Oct 2024 08:01:06 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee3671b503001a-49836;
	Fri, 25 Oct 2024 16:00:52 +0800 (CST)
X-RM-TRANSID: 2ee3671b503001a-49836
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from leadsec.example.com.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee5671b50267c1-2dbc8;
	Fri, 25 Oct 2024 16:00:51 +0800 (CST)
X-RM-TRANSID: 2ee5671b50267c1-2dbc8
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] ASoC: mediatek: mt8192-afe-pcm: Simplify probe() with local dev variable
Date: Fri, 25 Oct 2024 16:00:26 +0800
Message-Id: <20241025080026.2393-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010101_403281_6A97C32E 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Simplify the function mt8192_afe_pcm_dev_probe() by
using local 'dev' instead of '&pdev->dev'.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 9b502f4cd..80cda7bf5 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2158,27 +2158,26 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
 	struct mt8192_afe_private *afe_priv;
-	struct device *dev;
+	struct device *dev = &pdev->dev;
 	struct reset_control *rstc;
 	int i, ret, irq_id;
 
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
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv),
 					  GFP_KERNEL);
 	if (!afe->platform_priv)
 		return -ENOMEM;
 	afe_priv = afe->platform_priv;
 
-	afe->dev = &pdev->dev;
-	dev = afe->dev;
+	afe->dev = dev;
 
 	/* init audio related clock */
 	ret = mt8192_init_clock(afe);
@@ -2196,7 +2195,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to trigger audio reset\n");
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
@@ -2212,13 +2211,13 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(dev);
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_config);
 	if (ret)
 		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
 	regcache_cache_only(afe->regmap, true);
@@ -2285,7 +2284,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_suspend = mt8192_afe_runtime_suspend;
 
 	/* register platform */
-	ret = devm_snd_soc_register_component(&pdev->dev,
+	ret = devm_snd_soc_register_component(dev,
 					      &mtk_afe_pcm_platform,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-- 
2.33.0




