Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C7ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OaIbAjWTh8T2PMIUZB1cr5xLwcizvgkSYJjQ9roWZQ0=; b=vnbbqJERocUQKIiqmGBOB3ejfg
	zq+1YvT3DO488CV+et1XcGJBPqsnn6WggmpojVLgcfB5eHaZbP6CIO32l1K5tHEUwQCuZmu7x2dHR
	9R2ZLkJCP1csXVTn718gl9zsr9qwRMcL5v95apzPljqZhRxl1ARB2Rbx9zREwGRMOfuhhoXTmEs+f
	7U0De7edC5UOsDodQaRQR3EyjkilpK3W3mQ9SJ+NyGmcDRx6m9ANLvy5DuPf2tboGwByRQ2FsO74W
	UFfgJ2hk3JJ6dof0YnTVqvEIugvcUtfdm+ECN+aN9LdUTHv1xDusEY76BawIk0nhsliJcGaJavFoi
	EM2bHi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MsP-0000000GYnn-2XA5;
	Wed, 24 Sep 2025 10:37:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MsD-0000000GYYw-2EU8;
	Wed, 24 Sep 2025 10:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758710239;
	bh=zBsUv12CnB+eYEv/phnc2P7PAeGpmJaBNqHcFB5Huqg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DjpjYwUb5pOMFOpgc5Ffg1V9RI+Q2NHA9uv7N9HEy4JDU+sGEWERm9NJNmIYxIK0Y
	 bWSN2BXojWpqoxWqNoxaCWPULPMLnCLHBfjs9VsUWYkgN++pNztlxZYlZ/1u69egO/
	 E/MMa6w3OocHpTGsi/oIDnSRAWnonwOCaylCjeIWYIOBC4mjbWMKZnQr0IG458Zc07
	 2CMrHMLC/GvQ/qITeGf8b+ezFJSzcyAp/JGe6ZLcQKLMahG00tTjmYQMmYk55NzA3P
	 4YxVxtyjlqjYPussaH4fm/qKnM2UMLi/IwR9TJ8I4lg8hPxfzyeOevyW2n9UtTKlQS
	 CqjUbPidS6+oQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC33017E1389;
	Wed, 24 Sep 2025 12:37:18 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dmitry.osipenko@collabora.com,
	granquet@baylibre.com,
	rex-bc.chen@mediatek.com,
	ck.hu@mediatek.com,
	amergnat@baylibre.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 3/3] drm/mediatek: mtk_disp_rdma: Enable/disable interrupt on bind/unbind
Date: Wed, 24 Sep 2025 12:37:08 +0200
Message-ID: <20250924103708.19071-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
References: <20250924103708.19071-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_033721_733444_663DFF2D 
X-CRM114-Status: GOOD (  19.54  )
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

The RDMA driver is installing an ISR in the probe function but, if
the component is not bound yet, the interrupt handler may call the
vblank_cb ahead of time (while probing other drivers) or too late
(while removing other drivers), possibly accessing memory that it
should not try to access by reusing stale pointers.

In order to fix this, like done in the OVL driver, add a new `irq`
member to struct mtk_disp_ovl and then set the NOAUTOEN flag to
the irq before installing the ISR to manually disable and clear
the hwirqs with register writes, and enable_irq() and disable_irq()
in the bind and unbind callbacks respectively.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Link: https://lore.kernel.org/r/20250402083628.20111-6-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 34 ++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index c9d41d75e7f2..9fd9bb1ee544 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -81,6 +81,7 @@ struct mtk_disp_rdma_data {
 struct mtk_disp_rdma {
 	struct clk			*clk;
 	void __iomem			*regs;
+	int				irq;
 	struct cmdq_client_reg		cmdq_reg;
 	const struct mtk_disp_rdma_data	*data;
 	void				(*vblank_cb)(void *data);
@@ -295,13 +296,23 @@ void mtk_rdma_layer_config(struct device *dev, unsigned int idx,
 static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
 			      void *data)
 {
-	return 0;
+	struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
+
+	/* Disable and clear pending interrupts */
+	writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
+	writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
+
+	enable_irq(priv->irq);
 
+	return 0;
 }
 
 static void mtk_disp_rdma_unbind(struct device *dev, struct device *master,
 				 void *data)
 {
+	struct mtk_disp_rdma *priv = dev_get_drvdata(dev);
+
+	disable_irq(priv->irq);
 }
 
 static const struct component_ops mtk_disp_rdma_component_ops = {
@@ -313,16 +324,15 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_rdma *priv;
-	int irq;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
+	priv->irq = platform_get_irq(pdev, 0);
+	if (priv->irq < 0)
+		return priv->irq;
 
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk))
@@ -345,21 +355,17 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	if (ret && (ret != -EINVAL))
 		return dev_err_probe(dev, ret, "Failed to get rdma fifo size\n");
 
-	/* Disable and clear pending interrupts */
-	writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
-	writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
-
-	ret = devm_request_irq(dev, irq, mtk_disp_rdma_irq_handler,
-			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to request irq %d\n", irq);
-
 	priv->data = of_device_get_match_data(dev);
 
 	platform_set_drvdata(pdev, priv);
 
 	pm_runtime_enable(dev);
 
+	ret = devm_request_irq(dev, priv->irq, mtk_disp_rdma_irq_handler,
+			       IRQF_NO_AUTOEN, dev_name(dev), priv);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to request irq %d\n", priv->irq);
+
 	ret = component_add(dev, &mtk_disp_rdma_component_ops);
 	if (ret) {
 		pm_runtime_disable(dev);
-- 
2.51.0


