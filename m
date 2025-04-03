Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CC1C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNzcbrLbSu9IlQAXBLVSfZ0H9gudsTEJ9VcSgRMIuRk=; b=PONWLB0vL3+cPZ079wRGzxfHRG
	45QFX8JMp5oQSIsNt1j3smbRp0blUQGv08YmjSTO6G0nLCN9N1/oeNAHvRVNUbBpWWezrjV8cWafL
	Ez9gx+1Aba1mwe9W5u4F3LeeSIZlXWzqNCbF8tJ0wsGcQLSIg0rMLKvhyQyygCkKJJTPHTYWAGP4s
	lKHv1VjbxzmB1j7T6/Ycq42qLSOASRtXWcad/1P0Z6PMf2Zkf/WcTFYiM+TWaTivYnDKXWdhlFaXc
	aS+QLBquG78lG1+c0i2lMbuq3ibJDfZqBoCBcK0Z5NKOQxwlgf7j1a7XI9VftJL+Vsuax8EZFhC3h
	Z50avyUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0IXm-00000008fiG-2tFa;
	Thu, 03 Apr 2025 11:15:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0I6y-00000008cHn-0GH2;
	Thu, 03 Apr 2025 10:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743677270;
	bh=x1wtdufQF5A9ff40c172tRf7AZns8UAMMhQfqRaFnN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nsp7uBpe5gwRIweVut4tJQ7obUSye6hB0kimMKqule2r8ctO9aEO+oMxU/x/nvHIu
	 wZ/tOU0XABIePTkwo/gbBbUrUpxShlk+odCVU6ictUi4juIhyklynbntc4PmIhHKbG
	 l9S2Y8NieIaXz8GDa+NkM9hv8EVrYyi6RDteJhOkbfZA24KhvctJO0Euip+K/JqlZc
	 mH5r8gAeNo+gTO/g/4Oe/kXdjeDpnAn7cFSJP3JBbYCgoGACfKboqZHLXhM9BC9e7/
	 QDFBcOXynMHmQaFZHcg3r8NqpqmXnKhNFI/BOprB5DFcqsZgDEXDoxUiWSDNdLQmp2
	 /6eWTvhLoUmyw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89D8317E0702;
	Thu,  3 Apr 2025 12:47:49 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nancy.lin@mediatek.com,
	ck.hu@mediatek.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v2 5/5] drm/mediatek: mtk_disp_rdma: Enable/disable interrupt on bind/unbind
Date: Thu,  3 Apr 2025 12:47:41 +0200
Message-ID: <20250403104741.71045-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
References: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_034752_411172_0836E31D 
X-CRM114-Status: GOOD (  21.02  )
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
member to struct mtk_disp_ovl and then add the IRQF_NO_AUTOEN flag
to the irq while installing the ISR to manually disable and clear
the hwirqs with register writes, and enable_irq() and disable_irq()
in the bind and unbind callbacks respectively.

Also, the call to devm_request_irq() was moved after the platform
data and drvdata assignment, but in this specific case it is just
to make it cosmetically correct, as with this change the ISR will
not execute until the component is bound, hence no dev_get_drvdata
happens before that.

Note that since IRQF_TRIGGER_NONE is effectively 0 and doing nothing
this (fake) flag was dropped.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Link: https://lore.kernel.org/r/20250402083628.20111-6-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 34 ++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index bf47790e4d6b..c1bc1bbad86d 100644
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
@@ -314,16 +325,15 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_rdma *priv;
 	struct resource *res;
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
@@ -347,21 +357,17 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
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
2.48.1


