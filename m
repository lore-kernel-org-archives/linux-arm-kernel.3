Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72ECC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 02:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xf3YPNC1heVOAJxZqyxWo/MOXXbE2oMpczXgzqz6nhk=; b=pjjb2QVXytC6TgqVYVEcFXBbzG
	KmFuAGNhhZE2jT7W+rqsV1Wzssol6quXo1G7oQq0nMhHlvMyU6lz6EzgtqSqqHBWPb+4ncoa7kx6J
	ocFJPBp4FULJMn1XWWbWVxoEN6jG8jPeNvl0Ykk50aMUWHl+ehD/PJ8UQgM1WR0DEat1R+4sxNHv6
	/4KeQI+pQnewqrVMH6vpq31/RIB9t54JgLJOz8qNcCgyHF9gct8zbaiIUSKnwnmeRnGo+F+0Wjru+
	RC4U0SMlGaqY1oUQi2dmSS4ZyOJHQgUISZNUGFYuJZvSgtBjPv6hg9RKRvxRHx1lqSjUWOYHVsFAT
	m67AkXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thgUi-00000002Lto-2P5u;
	Tue, 11 Feb 2025 02:59:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thgP8-00000002KZi-1hVM;
	Tue, 11 Feb 2025 02:53:44 +0000
X-UUID: 64623b42e82311ef9048ed6ed365623b-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Xf3YPNC1heVOAJxZqyxWo/MOXXbE2oMpczXgzqz6nhk=;
	b=d7wAAjWdjJ9T1n7LIh48Vf9mpC3CiCvtI3+85pn1InA8XIkwPrD/vdac9+m1K9MZ4lK0SCrUKzJMhPR9Tx4QZx/jiTwfq5oxmVWgKWN7B4SqZGAZ2OW5xue4g8jaX8m4m8MPkabwccZpG/SWnrDEgghYt0lP8PkDYw/sKGQza8w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:b0910a65-5883-4c31-9f42-7426569889d6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:d2ca627f-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 64623b42e82311ef9048ed6ed365623b-20250210
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1199159679; Mon, 10 Feb 2025 19:53:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:53:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:53:34 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Fei Shao <fshao@chromium.org>, Pin-yen Lin
	<treapking@chromium.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	"Nancy Lin" <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	"Paul Chen --cc=devicetree @ vger . kernel . org"
	<paul-pl.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Sunny Shen
	<sunny.shen@mediatek.com>
Subject: [PATCH 4/5] drm/mediatek: Add MDP-RSZ component support for MT8196
Date: Tue, 11 Feb 2025 10:52:53 +0800
Message-ID: <20250211025317.399534-5-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211025317.399534-1-sunny.shen@mediatek.com>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_185342_447881_08F8F49E 
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

Add MDP-RSZ component support for MT8196.

Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 ++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 7f09a8977965..65878d3fe8a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -46,6 +46,10 @@
 #define DSC_BYPASS				BIT(4)
 #define DSC_UFOE_SEL				BIT(16)
 
+#define DISP_REG_MDP_RSZ_EN			0x0000
+#define DISP_REG_MDP_RSZ_INPUT_SIZE		0x0010
+#define DISP_REG_MDP_RSZ_OUTPUT_SIZE		0x0014
+
 #define DISP_REG_OD_EN				0x0000
 #define DISP_REG_OD_CFG				0x0020
 #define OD_RELAYMODE				BIT(0)
@@ -235,6 +239,18 @@ static void mtk_od_start(struct device *dev)
 	writel(1, priv->regs + DISP_REG_OD_EN);
 }
 
+static void mtk_mdp_rsz_config(struct device *dev, unsigned int w,
+			       unsigned int h, unsigned int vrefresh,
+			       unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MDP_RSZ_INPUT_SIZE);
+	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_MDP_RSZ_OUTPUT_SIZE);
+}
+
 static void mtk_postmask_config(struct device *dev, unsigned int w,
 				unsigned int h, unsigned int vrefresh,
 				unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -391,6 +407,12 @@ static const struct mtk_ddp_comp_funcs ddp_ovlsys_adaptor = {
 	.get_num_formats = mtk_ovlsys_adaptor_get_num_formats,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_mdp_rsz = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
+	.config = mtk_mdp_rsz_config,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_postmask = {
 	.clk_enable = mtk_ddp_clk_enable,
 	.clk_disable = mtk_ddp_clk_disable,
@@ -454,6 +476,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_DITHER] = "dither",
 	[MTK_DISP_DSC] = "dsc",
 	[MTK_DISP_GAMMA] = "gamma",
+	[MTK_DISP_MDP_RSZ] = "mdp-rsz",
 	[MTK_DISP_MERGE] = "merge",
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
@@ -515,6 +538,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX]
 	[DDP_COMPONENT_DSI2]		= { MTK_DSI,			2, &ddp_dsi },
 	[DDP_COMPONENT_DSI3]		= { MTK_DSI,			3, &ddp_dsi },
 	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,		0, &ddp_gamma },
+	[DDP_COMPONENT_MDP_RSZ0]	= { MTK_DISP_MDP_RSZ,		0, &ddp_mdp_rsz},
 	[DDP_COMPONENT_MERGE0]		= { MTK_DISP_MERGE,		0, &ddp_merge },
 	[DDP_COMPONENT_MERGE1]		= { MTK_DISP_MERGE,		1, &ddp_merge },
 	[DDP_COMPONENT_MERGE2]		= { MTK_DISP_MERGE,		2, &ddp_merge },
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index badb42bd4f7c..87f573fcc903 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -36,6 +36,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_OVLSYS_ADAPTOR,
 	MTK_DISP_OVL_2L,
 	MTK_DISP_OVL_ADAPTOR,
+	MTK_DISP_MDP_RSZ,
 	MTK_DISP_POSTMASK,
 	MTK_DISP_PWM,
 	MTK_DISP_RDMA,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 50f5f81a7da1..b810a197f58b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -885,6 +885,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8195-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
+	{ .compatible = "mediatek,mt8196-disp-mdp-rsz",
+	  .data = (void *)MTK_DISP_MDP_RSZ },
 	{ .compatible = "mediatek,mt8195-disp-merge",
 	  .data = (void *)MTK_DISP_MERGE },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
-- 
2.34.1


