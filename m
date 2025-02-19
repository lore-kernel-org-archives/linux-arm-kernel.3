Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70ABC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojz46lwYrvC+/B96oirWUt9+aNCFGHjtvSOr+aVZyPo=; b=s3zVOw7fnrhViQEheiq0xIWXK/
	CSrI4gCm0xoH2PhyH0zhdHP1/z7D6j6qQRd/K/TW+AUlweIaq8RDwvS9A//IEpr/zAmohrh5o0F4p
	l7P3MmR0mOreOU0g6deYWUK6tAgJLuP8XneU71OSvPKHeWy7uhKaFyylN/3PLXS5+GjIiy1iqJ2QO
	cR0dubmTcGApXHGBSogXhUbTgxjUh5jXuyVXPtbN0rev2V4lsLF2Fwaokw7lznB5AIpPWy+qnO5l9
	NgwReg6Hgvjr25IOaWfuGyAjl/TBvuBT/E6F9Gq1yXiM1NQlSkLWYSwD4UEATqHjXYD59BcNa9VNZ
	Qa4vK2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgZ3-0000000BvgO-0z3J;
	Wed, 19 Feb 2025 09:40:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgGR-0000000Boc4-0Sdn;
	Wed, 19 Feb 2025 09:21:08 +0000
X-UUID: d6754fb4eea211efa1e849db4cc18d44-20250219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ojz46lwYrvC+/B96oirWUt9+aNCFGHjtvSOr+aVZyPo=;
	b=tmsH5njPU/sbbKgGbGgDtd6N6jcoMJI/K3LQB3sSNiBbikEpAaC2kS6VjWH001pgnHLHainlMQX8d6Eagdw52sR3qoc15UjGGOVlMf8cbI7DqDLm42Jjt7HuMOSn4D8SOjj6T0/jgkmFfAVmMX/zenUlbYXZ0cT5C/p9AmBubKM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:51fc3dae-f2c8-4ecd-9580-7e0d7bcf870c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:b82e13dc-d480-4873-806f-0f365159227b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d6754fb4eea211efa1e849db4cc18d44-20250219
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 987629525; Wed, 19 Feb 2025 02:21:02 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 19 Feb 2025 17:20:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 19 Feb 2025 17:20:58 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jay Liu
	<jay.liu@mediatek.com>
Subject: [PATCH 1/7] drm/mediatek: Add CCORR component support for MT8196
Date: Wed, 19 Feb 2025 17:20:34 +0800
Message-ID: <20250219092040.11227-2-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20250219092040.11227-1-jay.liu@mediatek.com>
References: <20250219092040.11227-1-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_012107_153948_07CC2CFB 
X-CRM114-Status: GOOD (  19.49  )
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

Add CCORR component support for MT8196.

CCORR is a hardware module that optimizes the visual effects of
images by adjusting the color matrix, enabling features such as
night light.

The 8196 hardware platform includes two CCORR (Color Correction) units.
However, the `mtk_ccorr_ctm_set` API only utilizes one of these units.
To prevent the unused CCORR unit from inadvertently taking effect,
we need to block it by adding mandatory_ccorr flag in the driver_data.

Signed-off-by: Jay Liu <jay.liu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |  3 ++-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index edc6417639e6..d7e230bac53e 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -457,7 +457,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,		0, &ddp_aal },
 	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,		1, &ddp_aal },
 	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,		0, NULL },
-	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
+	[DDP_COMPONENT_CCORR0]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
+	[DDP_COMPONENT_CCORR1]		= { MTK_DISP_CCORR,		1, &ddp_ccorr },
 	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,		0, &ddp_color },
 	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,		1, &ddp_color },
 	[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,		0, &ddp_dither },
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 10d60d2c2a56..94e82b3fa2d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -31,11 +31,13 @@
 
 struct mtk_disp_ccorr_data {
 	u32 matrix_bits;
+	enum mtk_ddp_comp_id mandatory_ccorr;
 };
 
 struct mtk_disp_ccorr {
 	struct clk *clk;
 	void __iomem *regs;
+	enum mtk_ddp_comp_id comp_id;
 	struct cmdq_client_reg cmdq_reg;
 	const struct mtk_disp_ccorr_data	*data;
 };
@@ -115,6 +117,9 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	if (!blob)
 		return;
 
+	if (ccorr->comp_id != ccorr->data->mandatory_ccorr)
+		return;
+
 	ctm = (struct drm_color_ctm *)blob->data;
 	input = ctm->matrix;
 
@@ -154,6 +159,7 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mtk_disp_ccorr *priv;
 	int ret;
+	enum mtk_ddp_comp_id comp_id;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -169,6 +175,14 @@ static int mtk_disp_ccorr_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->regs),
 				     "failed to ioremap ccorr\n");
 
+	comp_id = mtk_ddp_comp_get_id(dev->of_node, MTK_DISP_CCORR);
+	if (comp_id < 0) {
+		dev_err(dev, "Failed to identify by alias: %d\n", comp_id);
+		return comp_id;
+	}
+
+	priv->comp_id = comp_id;
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
@@ -192,10 +206,12 @@ static void mtk_disp_ccorr_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
 	.matrix_bits = 10,
+	.mandatory_ccorr = DDP_COMPONENT_CCORR0,
 };
 
 static const struct mtk_disp_ccorr_data mt8192_ccorr_driver_data = {
 	.matrix_bits = 11,
+	.mandatory_ccorr = DDP_COMPONENT_CCORR0,
 };
 
 static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
-- 
2.18.0


