Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BCCC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsO/q/ehumTt0L+nbFzurWA/747fgUU5WJpQsRVUOVo=; b=mB5gYr8Qhx6C/pssyMm1KJ3lC5
	QsVXZ7aNzWLmeU9msH07rBxsr3Pjanag4gWpM/yk5S6QuqGsWhYDUQh4m5lJMoBcz/OPVKPLRKnbK
	V7S6qVSIQPUnhgVqeoHyQTcYeOgmQPEwr7MCTtyOEzKPJDn5yx3ZFoQnzqSTyZ5IAR1Q2+dhQ7vlb
	QxDFOqT3r4CFU0opHRvM8S8TxpcKeY2D6rSSSGC+IZ0LOuJP781h6RDY67R11v1VniRwBeL0bh3Jp
	nVhsnMFJY3dvnNaDHQBluUwqJtoGWXt6OBfHS5GjQddIQ/bp25FElMD1YUn8SLRtpMp2+aHf1XU4x
	RP/d6zVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufvmR-0000000CQiW-42sc;
	Sun, 27 Jul 2025 07:26:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufvd2-0000000CPsq-0uhV;
	Sun, 27 Jul 2025 07:17:05 +0000
X-UUID: b0f50b606ab911f09f706fa2197c6ceb-20250727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fsO/q/ehumTt0L+nbFzurWA/747fgUU5WJpQsRVUOVo=;
	b=JB/s8QIJenFNRztFXtUIEK9N+e7+QygZiFeMQAilUn9N0/F4nkdPktNxMbk5/3Uo3Yq4cca96PdSyJ7AoPkU9IfRz1GDn00KVFCBdg5uceTWx5Pk3FPRPyXPHvMCZpO/30BxmK5DD2aA9AcwlnfLWpp0D2S4sucY7vo4TVXjZUI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b0cefb0a-715f-49fb-9d1a-9af88ac6dc88,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:f55dd208-aadc-4681-92d7-012627504691,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b0f50b606ab911f09f706fa2197c6ceb-20250727
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1956226670; Sun, 27 Jul 2025 00:17:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 27 Jul 2025 15:16:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 27 Jul 2025 15:16:56 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jay Liu <jay.liu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/7] drm/mediatek: Add TDSHP component support for MT8196
Date: Sun, 27 Jul 2025 15:15:53 +0800
Message-ID: <20250727071609.26037-4-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250727071609.26037-1-jay.liu@mediatek.com>
References: <20250727071609.26037-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_001704_262476_32DB8D3F 
X-CRM114-Status: GOOD (  13.23  )
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

Add TDSHP component support for MT8196.
TDSHP is a hardware module designed to enhance the sharpness and
clarity of displayed images by analyzing and improving edges and
fine details in frames.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Jay Liu <jay.liu@mediatek.com>
Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 49 +++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 +
 3 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 850e3b18da61..c63a12c41215 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -57,6 +57,14 @@
 #define POSTMASK_RELAY_MODE				BIT(0)
 #define DISP_REG_POSTMASK_SIZE			0x0030
 
+#define DISP_REG_TDSHP_CTRL			0x0100
+#define DISP_TDSHP_CTRL_EN			BIT(0)
+#define DISP_REG_TDSHP_CFG			0x0110
+#define DISP_TDSHP_RELAY_MODE			BIT(0)
+#define DISP_REG_TDSHP_INPUT_SIZE		0x0120
+#define DISP_REG_TDSHP_OUTPUT_OFFSET		0x0124
+#define DISP_REG_TDSHP_OUTPUT_SIZE		0x0128
+
 #define DISP_REG_UFO_START			0x0000
 #define UFO_BYPASS				BIT(2)
 
@@ -261,6 +269,37 @@ static void mtk_postmask_stop(struct device *dev)
 	writel_relaxed(0x0, priv->regs + DISP_REG_POSTMASK_EN);
 }
 
+static void mtk_disp_tdshp_config(struct device *dev, unsigned int w,
+				  unsigned int h, unsigned int vrefresh,
+				  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_TDSHP_INPUT_SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_TDSHP_OUTPUT_SIZE);
+	mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_TDSHP_OUTPUT_OFFSET);
+
+	mtk_ddp_write(cmdq_pkt, DISP_TDSHP_RELAY_MODE, &priv->cmdq_reg,
+		      priv->regs, DISP_REG_TDSHP_CFG);
+}
+
+static void mtk_disp_tdshp_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(DISP_TDSHP_CTRL_EN, priv->regs + DISP_REG_TDSHP_CTRL);
+}
+
+static void mtk_disp_tdshp_stop(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel(0, priv->regs + DISP_REG_TDSHP_CTRL);
+}
+
 static void mtk_ufoe_start(struct device *dev)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
@@ -268,6 +307,14 @@ static void mtk_ufoe_start(struct device *dev)
 	writel(UFO_BYPASS, priv->regs + DISP_REG_UFO_START);
 }
 
+static const struct mtk_ddp_comp_funcs ddp_tdshp = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
+	.config = mtk_disp_tdshp_config,
+	.start = mtk_disp_tdshp_start,
+	.stop = mtk_disp_tdshp_stop,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_aal = {
 	.clk_enable = mtk_aal_clk_enable,
 	.clk_disable = mtk_aal_clk_disable,
@@ -441,6 +488,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_POSTMASK] = "postmask",
 	[MTK_DISP_PWM] = "pwm",
 	[MTK_DISP_RDMA] = "rdma",
+	[MTK_DISP_TDSHP] = "tdshp",
 	[MTK_DISP_UFOE] = "ufoe",
 	[MTK_DISP_WDMA] = "wdma",
 	[MTK_DP_INTF] = "dp-intf",
@@ -496,6 +544,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,		1, &ddp_rdma },
 	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,		2, &ddp_rdma },
 	[DDP_COMPONENT_RDMA4]		= { MTK_DISP_RDMA,		4, &ddp_rdma },
+	[DDP_COMPONENT_TDSHP0]		= { MTK_DISP_TDSHP,		0, &ddp_tdshp },
 	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,		0, &ddp_ufoe },
 	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,		0, NULL },
 	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,		1, NULL },
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 98a701ac4cde..a03fa3385d2f 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -38,6 +38,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_RDMA,
+	MTK_DISP_TDSHP,
 	MTK_DISP_UFOE,
 	MTK_DISP_WDMA,
 	MTK_DPI,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d5e6bab36414..042cf03c7a54 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -812,6 +812,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8195-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8196-disp-tdshp",
+	  .data = (void *)MTK_DISP_TDSHP },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
-- 
2.46.0


