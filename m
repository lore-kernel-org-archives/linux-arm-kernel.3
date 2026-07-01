Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91306C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMk6vKm5A+EcbVaObLIyIsRazhdW2VuembDejh1DoFo=; b=RRjgU5NClq3MaVazBElHPqEz3s
	8PsqlQIc9LihHkMujDwYZtzWBWBIbWv90MNNkPyEFkzfXe097yC+idn/gYvOOpRfjsL7hDbfenZQd
	Cw8sC9yXqGav/LLcFNmR9s/8pIEkL1vlMRHby3ihCRzZiWA2wYOGuMfu1YcS0qGfy0qjmKNyYJ14h
	/Hcbo1QFxtfqEoEyCDgPskasOgyQMRacDUrwz5mLh6DWEPuBDWg1KY7610hyefi+aJcS19fOL79Lq
	t8qwu8Q7lbPNU2EfKPg3IYZWJ0ZeMXZjI+3NvhKU0ltZfrSfZ3KURoZuKzmukmFO0ItDnka3fOhaB
	DXOxrhEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetxe-00000001xnE-3AYe;
	Wed, 01 Jul 2026 12:22:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetx3-00000001vqm-1L76;
	Wed, 01 Jul 2026 12:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nMk6vKm5A+EcbVaObLIyIsRazhdW2VuembDejh1DoFo=; b=B7J3hWX/tES2d2PtmzVdL/SEPU
	OWQlYPTEPYZ3OHxmA3pNWVx4BkTg6ZwIqprcl4vhzjAWTSOiZZ891ouSBp+//LxQErbL4/XS/ZiQD
	macQfHU6zICXUExhzJaBbel4FibfB+3+HjeT0XTpRYolKZwtiokuFXExcvN9rb771UO3cjGtkqka2
	VZpDka4EV/RIR6f8cFeVhWk+Cdv3w1DzWVVR41d/dXoZ/P+JAyZjcNrUALqjlTaAfWrcgfUb9bCyQ
	zt8OffAGrBqvqbziLEg7tPebbb04OcbORyZIxTc6dlWriLK7pvkK9yLp+yGELO1ElG6qLogrnQQjS
	+otUFotw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetx0-00000006b3t-0egA;
	Wed, 01 Jul 2026 12:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782908517;
	bh=lEDe4ORE+LlmZXkgjItIKio8yYndkmek8VU5o9Rq0/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eQRtzP2W8GOf/spLJJfaSavMUN9TmC3pbw+PJPS0XZynUB6nmo34mtzsQg4nss4aJ
	 FB3ruvcSROlg42idEjIaqfM+nTjXlZwl68HBoz+MN9h5nC2vhJrd5uLc+hM99rG/Z/
	 nhPciGrafMXgTOl/9t+1UWWDI/xcWvI6j733YpPcBn2vRlHru7EmHZjkpiHjmfqD8h
	 25f9Ehg8sza7n5qu64Hc/6ItUhOf1eyLZIMqjSAMmVAz6bx/hW2p3SuSKVe77LWRog
	 Uq8pDnbiOhYppxNp83Hu6aidy5vRyJHZfb1GcjhTWfVfYHNJMHKHmijEND9/Nwtixg
	 pfK1rVr/33tAg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E8CC17E35FB;
	Wed,  1 Jul 2026 14:21:56 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH 41/42] drm/mediatek: Add support for Display Image Resizer (Scaler)
Date: Wed,  1 Jul 2026 14:20:56 +0200
Message-ID: <20260701122057.19648-42-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_132158_430434_BC15C067 
X-CRM114-Status: GOOD (  12.99  )
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

Add basic support for the Image Resizer hardware found in some
MediaTek Display Controller IPs, like the one found in MT8196.

This is currently set in bypass mode and used to pass the frame
buffer from a RSZ input component to supported RSZ outputs.
Full implementation of hardware-accelerated DRM scaling will be
done later.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index ea09af8d4705..453a4a9ad565 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -56,6 +56,10 @@
 #define POSTMASK_RELAY_MODE				BIT(0)
 #define DISP_REG_POSTMASK_SIZE			0x0030
 
+#define DISP_REG_RSZ_EN				0x0000
+#define DISP_REG_RSZ_INPUT_SIZE			0x0010
+#define DISP_REG_RSZ_OUTPUT_SIZE		0x0014
+
 #define DISP_REG_UFO_START			0x0000
 #define UFO_BYPASS				BIT(2)
 
@@ -230,6 +234,16 @@ static void mtk_postmask_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
+static void mtk_rsz_config(struct mtk_ddp_comp *comp, unsigned int w,
+			   unsigned int h, unsigned int vrefresh,
+			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(comp->dev);
+
+	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_REG_RSZ_INPUT_SIZE);
+	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_REG_RSZ_OUTPUT_SIZE);
+}
+
 static void mtk_ufoe_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
@@ -414,6 +428,12 @@ static const struct mtk_ddp_comp_funcs ddp_rdma = {
 	.get_num_formats = mtk_rdma_get_num_formats,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_rsz = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
+	.config = mtk_rsz_config,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_tdshp = {
 	.clk_enable = mtk_tdshp_clk_enable,
 	.clk_disable = mtk_tdshp_clk_disable,
@@ -489,6 +509,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_POSTMASK] = "postmask",
 	[MTK_DISP_PWM] = "pwm",
 	[MTK_DISP_RDMA] = "rdma",
+	[MTK_DISP_RSZ] = "resizer",
 	[MTK_DISP_TDSHP] = "tdshp",
 	[MTK_DISP_UFOE] = "ufoe",
 	[MTK_DISP_WDMA] = "wdma",
@@ -517,6 +538,7 @@ static const struct mtk_ddp_comp_funcs *mtk_ddp_funcs[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_POSTMASK]		= &ddp_postmask,
 	[MTK_DISP_PWM]			= NULL,
 	[MTK_DISP_RDMA]			= &ddp_rdma,
+	[MTK_DISP_RSZ]			= &ddp_rsz,
 	[MTK_DISP_TDSHP]		= &ddp_tdshp,
 	[MTK_DISP_UFOE]			= &ddp_ufoe,
 	[MTK_DISP_WDMA]			= &ddp_wdma,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index b96cf2f435e5..f5c9fe1588d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -699,6 +699,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8195-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8196-disp-rsz",
+	  .data = (void *)MTK_DISP_RSZ },
 	{ .compatible = "mediatek,mt8196-disp-tdshp",
 	  .data = (void *)MTK_DISP_TDSHP },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
-- 
2.54.0


