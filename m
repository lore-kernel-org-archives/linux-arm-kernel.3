Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 394D3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCtgsRyXN0v3nkAYw3TkvB6MPKLX6VHzEkCdfv3s/Bo=; b=0fWYUpwBPfoKdDBNtvNiXb7wVp
	+PzaP0XHBr3x2n8drojDMgb5AyRXDMzFrO0O2RXXrts27LfSIbanEO2nGzJRLN4aQh5i/wKxznd/0
	oL33DUiukQsduH65Q0mydbuLnFvnRaNVMcX9jXCpulZlX77LSpN2kNNTtfNTv1opaoYiDa2v/oG3/
	GyTF6rNqa+Cna7zTORunhy864dYN/ZtNvp0xHb7t/rUOeTzetJeOwR2BRRnAwzCvTA3S/EqujN15N
	D68XYojbCXXEuzK/4n5C8tj0VCfDbTKy2TCl+piBbiFT4i/JUiWwGImkAvmoSMNy3iHt+Fg4ByFCF
	zY2+lLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGHs-00000009HIy-0XEF;
	Mon, 13 Jul 2026 13:01:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGHe-00000009H4F-2o3C;
	Mon, 13 Jul 2026 13:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783947675;
	bh=gsYAIXlViwS5g5QjHJFm9cbpi53ezhz4q/D38V/P3nQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y0AQVpndfm1kakjuywdqRbhF90ow7JoWZmjkl4aqpFUin5mURI0gwn9lDSMZ8TT9G
	 8a/OYH5uQGeR6KeI30A9PSuUffbCOUbjpUVfdawT+Y5QbfAT8GkJpiP/NXck79XJjS
	 sKXKaAlRoEkhRRJ6tSuoaNxUSHz9x3rLqXa009W/cw2KIJwar6cjqVTxy3n3msEahK
	 2WwwzcBA2NJCNsecWM67xHI2BUoHXMgsLT8rsP2b7w4oiquPSRwX1SkuolCjsB1C4D
	 pE5zV70K8Uy/E7Na4Fcg0d3sgRYzH4yDsymrtNCd1Gto3nE9xIPRi3rN/lIYf/kVdD
	 Ngz9bTkAgaVvw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADD2817E0DE6;
	Mon, 13 Jul 2026 15:01:14 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v3 04/10] drm/mediatek: mtk_dsi: Enable interrupt at component bind time
Date: Mon, 13 Jul 2026 15:00:57 +0200
Message-ID: <20260713130103.34654-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713130103.34654-1-angelogioacchino.delregno@collabora.com>
References: <20260713130103.34654-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060118_913745_4F02C7E5 
X-CRM114-Status: GOOD (  18.23  )
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

Having the DSI interrupt enabled before actually binding the DSI
component to the display controller driver is both useless and
dangerous: the main purpose of this interrupt is to signal CMD
done, LP RX data ready, or VideoMode done, or to reset the HW
engine if this doesn't come.

Should this interrupt come too late (during probe), the HW will
be reset only at the next occurrence of a timeout, which slows
down boot and may render artifacts to the DSI display.

Moreover, clearing the DSI interrupt while the display controller
is not ready yet, may result in an interrupt storm.

In order to prevent this from happening, request the interrupt
with IRQF_NO_AUTOEN, and enable it only when binding DSI to its
display controller component master.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4d9c38908da5..28e432d21f98 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -225,6 +225,7 @@ struct mtk_dsi {
 	int refcount;
 	bool enabled;
 	bool lanes_ready;
+	int irq;
 	u32 irq_data;
 	wait_queue_head_t irq_wait_queue;
 	const struct mtk_dsi_driver_data *driver_data;
@@ -1088,7 +1089,13 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	return device_reset_optional(dev);
+	ret = device_reset_optional(dev);
+	if (ret)
+		return ret;
+
+	enable_irq(dsi->irq);
+
+	return 0;
 }
 
 static void mtk_dsi_unbind(struct device *dev, struct device *master,
@@ -1096,6 +1103,8 @@ static void mtk_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	disable_irq(dsi->irq);
+
 	drm_encoder_cleanup(&dsi->encoder);
 }
 
@@ -1328,7 +1337,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	int irq_num;
 	int ret;
 
 	dsi = devm_drm_bridge_alloc(dev, struct mtk_dsi, bridge,
@@ -1361,9 +1369,9 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->phy))
 		return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get MIPI-DPHY\n");
 
-	irq_num = platform_get_irq(pdev, 0);
-	if (irq_num < 0)
-		return irq_num;
+	dsi->irq = platform_get_irq(pdev, 0);
+	if (dsi->irq < 0)
+		return dsi->irq;
 
 	dsi->host.ops = &mtk_dsi_ops;
 	dsi->host.dev = dev;
@@ -1372,17 +1380,15 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dsi);
 
+	ret = devm_request_irq(&pdev->dev, dsi->irq, mtk_dsi_irq,
+			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), dsi);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
+
 	ret = mipi_dsi_host_register(&dsi->host);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
 
-	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
-			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
-	if (ret) {
-		mipi_dsi_host_unregister(&dsi->host);
-		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
-	}
-
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 
-- 
2.54.0


