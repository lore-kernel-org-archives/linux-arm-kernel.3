Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76410C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEafIAxGzB7l2gkmWxTK+nnEiZ1ZsaKlNltEO9QdWCs=; b=zOfm1Uamz1886fQ1EziF+2u/0W
	8mgiyAqiiynqyIfSvedDEpA+gdDJ+Ofbh7SVvGS26ALKFLh3L08eHa2BboLezVW6EKMtZ/2Vwevoy
	K7eoPa2NpJG6L1NhMJJFkJ/Df9vm3pkKKn8sK88BXaPLs+iOlvPhM99pHqopk32X871OCf7XLA927
	M3OokjlAG4guhDfLiJL1N8r4vJAY9kgMu+XETbGNnw29nul4DcYbW5D4VWz8uZax6LCCGn40I4bzf
	1qj2YTiNtN3ZiPuPAd0QYZarrQzYDFKX5FiVlvoK7AlTFGZqBXPcXDTGms9/OpbAvX4JXU2MhznwA
	vTXEaD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetv9-00000001qRu-1Q01;
	Wed, 01 Jul 2026 12:20:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetv5-00000001qAh-0WDR;
	Wed, 01 Jul 2026 12:20:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908397;
	bh=3hFss8wW4yHbN3YY0Bt6ar1vtuwOE2OuFLnYEI9DUJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dn86QdUrxY3ylZmxmXLI7oyZLzPCQngTUR3FcPFS3QjwSCeKbJdmTfeOe4QMa08gK
	 EXj60OFAoh0ZyiopGFC7t73Y60+FFhtowS13msmmQQAn5MYe6rOwyGb76zKd9/UPrU
	 KXhWNzruwam0RyYA1PVyKF0vGit1Af74b9XC3zzaqElqXEXNGBnl22uvz+20Igwpag
	 Zqgt0yoVW9azTgr90EMVzZzTZWT8VRTSh+5JM+J+UQ/BRQa60kUCxPjWkue/mL8QKI
	 7v6zaQdetkYL45JRAtQ1ktccP3RmZokcqhXtzyx5+1HePdNENiSoMuvigPzX71WBG/
	 iCP8v2nYjhGEA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87D9617E0F44;
	Wed,  1 Jul 2026 14:19:56 +0200 (CEST)
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
Subject: [PATCH 04/10] drm/mediatek: mtk_dsi: Enable interrupt at component bind time
Date: Wed,  1 Jul 2026 14:19:44 +0200
Message-ID: <20260701121950.19454-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
References: <20260701121950.19454-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051959_325372_BEB7C8A0 
X-CRM114-Status: GOOD (  18.79  )
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
 drivers/gpu/drm/mediatek/mtk_dsi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 3fbcb22ee15e..56c69f80a2ef 100644
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
@@ -1048,7 +1049,13 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
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
@@ -1056,6 +1063,8 @@ static void mtk_dsi_unbind(struct device *dev, struct device *master,
 {
 	struct mtk_dsi *dsi = dev_get_drvdata(dev);
 
+	disable_irq(dsi->irq);
+
 	drm_encoder_cleanup(&dsi->encoder);
 }
 
@@ -1283,7 +1292,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	int irq_num;
 	int ret;
 
 	dsi = devm_drm_bridge_alloc(dev, struct mtk_dsi, bridge,
@@ -1316,9 +1324,9 @@ static int mtk_dsi_probe(struct platform_device *pdev)
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
@@ -1331,8 +1339,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register DSI host\n");
 
-	ret = devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
-			       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
+	ret = devm_request_irq(&pdev->dev, dsi->irq, mtk_dsi_irq,
+			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), dsi);
 	if (ret) {
 		mipi_dsi_host_unregister(&dsi->host);
 		return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n");
-- 
2.54.0


