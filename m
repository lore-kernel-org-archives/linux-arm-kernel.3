Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEE4C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02/kcO+MMhM7XJgHj91D/a9UFhsQBAGvRfsYmvCesR4=; b=JpBLlAmXKsyse+UuI8hFpXXCuJ
	uXeBeWYYhiTQS1jvygwxoX4YFqdUWxy08acTvQG8ENQXZFOUV2Jm6rys3SRLH51bsRe5Ev8lFA/fl
	wyZLve7CZkqszd93TKc8NfLy5ZwgeeWd7pJZHq4xMf5lFyoMICuDq8fwtd3yRLn09UnrQYmVXIRWS
	3+WTLl8Wz3G4+DfqiQtfch+94HpP5tu9VYX0vOqspf67AGuX0pZ1BjlgFsEl4yYnYU3+/zCsVAFm6
	aZr8f49nUptkL4hyq/f4QjBTSJ70mhI1M7VDtvAD4HxUxXqtBYTji9h+0NS3WKpIMkkqEPRhXGwhA
	tFq7ybMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVrC-00000000ISf-2NLo;
	Thu, 15 May 2025 10:30:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFVEa-00000000DfA-454v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:50:38 +0000
X-UUID: e64c5cf6316f11f0bed96b30c12bc3d6-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=02/kcO+MMhM7XJgHj91D/a9UFhsQBAGvRfsYmvCesR4=;
	b=hdxTT5eFq8jr7x00u7U30ZWxHyyQNagnJbNfEH0cnIeMxVKS6tjzstIL7MFuz1wgeHX5OmSmritFRKPpoUQx14OrKnZNUDfcT4ul0PZ6zo8CP/rLum2GgmncpGx0S1p1lTsIVkPZct5GePdtjt7UniUSuYerolEBpaqFytxbvMg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:df310395-74a9-4ea0-a0ef-3ee918a73f06,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:a197c297-7410-4084-8094-24619d975b02,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e64c5cf6316f11f0bed96b30c12bc3d6-20250515
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 17669342; Thu, 15 May 2025 02:35:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:35:10 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:35:10 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 14/17] drm/mediatek: add OUTPROC support for MT8196
Date: Thu, 15 May 2025 17:34:26 +0800
Message-ID: <20250515093454.1729720-15-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_025037_007588_7809097C 
X-CRM114-Status: GOOD (  25.19  )
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

From: Nancy Lin <nancy.lin@mediatek.com>

OUTPROC handles the post-stage of pixel processing in
the overlapping procedure.OUTPROC manages pixels for
gamma correction and ensures that pixel values are
within the correct range.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c     |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h     |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  14 ++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.c | 240 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_outproc.h |  22 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 8 files changed, 281 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_outproc.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index a7b9ebe27f68..9546bc6b7b2e 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -10,6 +10,7 @@ mediatek-drm-y := mtk_crtc.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_merge.o \
 		  mtk_disp_ovl.o \
+		  mtk_disp_outproc.o \
 		  mtk_disp_ovl_adaptor.o \
 		  mtk_disp_rdma.o \
 		  mtk_drm_drv.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index e65c6df987f2..cc780744f060 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -447,6 +447,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DSI] = "dsi",
 	[MTK_OVL_BLENDER] = "blender",
 	[MTK_OVL_EXDMA] = "exdma",
+	[MTK_OVL_OUTPROC] = "outproc",
 };
 
 struct mtk_ddp_comp_match {
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 075ba5683f93..b33d3289b8b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -45,6 +45,7 @@ enum mtk_ddp_comp_type {
 	MTK_DSI,
 	MTK_OVL_BLENDER,
 	MTK_OVL_EXDMA,
+	MTK_OVL_OUTPROC,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 39e3af1e2b16..3c519a662074 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -64,6 +64,20 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 			   unsigned int bpc, unsigned int cfg,
 			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt);
 
+void mtk_disp_outproc_start(struct device *dev);
+void mtk_disp_outproc_stop(struct device *dev);
+int mtk_disp_outproc_clk_enable(struct device *dev);
+void mtk_disp_outproc_clk_disable(struct device *dev);
+void mtk_disp_outproc_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_outproc_register_vblank_cb(struct device *dev,
+					 void (*vblank_cb)(void *),
+					 void *vblank_cb_data);
+void mtk_disp_outproc_unregister_vblank_cb(struct device *dev);
+void mtk_disp_outproc_enable_vblank(struct device *dev);
+void mtk_disp_outproc_disable_vblank(struct device *dev);
+
 void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
 unsigned int mtk_dpi_encoder_index(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_outproc.c b/drivers/gpu/drm/mediatek/mtk_disp_outproc.c
new file mode 100644
index 000000000000..bc0b2388e9d6
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_outproc.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+
+#include "mtk_crtc.h"
+#include "mtk_ddp_comp.h"
+#include "mtk_disp_outproc.h"
+#include "mtk_drm_drv.h"
+
+#define DISP_REG_OVL_OUTPROC_INTEN				0x004
+#define OVL_OUTPROC_FME_CPL_INTEN					BIT(1)
+#define DISP_REG_OVL_OUTPROC_INTSTA				0x008
+#define DISP_REG_OVL_OUTPROC_DATAPATH_CON			0x010
+#define OVL_OUTPROC_DATAPATH_CON_OUTPUT_CLAMP				BIT(26)
+
+#define DISP_REG_OVL_OUTPROC_EN					0x020
+#define OVL_OUTPROC_OVL_EN						BIT(0)
+#define DISP_REG_OVL_OUTPROC_RST				0x024
+#define OVL_OUTPROC_RST							BIT(0)
+#define DISP_REG_OVL_OUTPROC_SHADOW_CTRL			0x028
+#define OVL_OUTPROC_BYPASS_SHADOW					BIT(2)
+#define DISP_REG_OVL_OUTPROC_ROI_SIZE				0x030
+
+struct mtk_disp_outproc {
+	void __iomem		*regs;
+	struct clk		*clk;
+	void			(*vblank_cb)(void *data);
+	void			*vblank_cb_data;
+	int			irq;
+	struct cmdq_client_reg	cmdq_reg;
+};
+
+void mtk_disp_outproc_register_vblank_cb(struct device *dev,
+					 void (*vblank_cb)(void *),
+					 void *vblank_cb_data)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = vblank_cb;
+	priv->vblank_cb_data = vblank_cb_data;
+}
+
+void mtk_disp_outproc_unregister_vblank_cb(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	priv->vblank_cb = NULL;
+	priv->vblank_cb_data = NULL;
+}
+
+void mtk_disp_outproc_enable_vblank(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	writel(OVL_OUTPROC_FME_CPL_INTEN, priv->regs + DISP_REG_OVL_OUTPROC_INTEN);
+}
+
+void mtk_disp_outproc_disable_vblank(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	writel(0x0, priv->regs + DISP_REG_OVL_OUTPROC_INTEN);
+}
+
+static irqreturn_t mtk_disp_outproc_irq_handler(int irq, void *dev_id)
+{
+	struct mtk_disp_outproc *priv = dev_id;
+	u32 val;
+
+	val = readl(priv->regs + DISP_REG_OVL_OUTPROC_INTSTA);
+	if (!val)
+		return IRQ_NONE;
+
+	writel(0x0, priv->regs + DISP_REG_OVL_OUTPROC_INTSTA);
+
+	if (priv->vblank_cb)
+		priv->vblank_cb(priv->vblank_cb_data);
+
+	return IRQ_HANDLED;
+}
+
+void mtk_disp_outproc_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+	u32 tmp;
+
+	dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
+
+	writel((h << 16) | w, priv->regs + DISP_REG_OVL_OUTPROC_ROI_SIZE);
+
+	tmp = readl(priv->regs + DISP_REG_OVL_OUTPROC_DATAPATH_CON);
+	tmp = (tmp & ~OVL_OUTPROC_DATAPATH_CON_OUTPUT_CLAMP) |
+		  (OVL_OUTPROC_DATAPATH_CON_OUTPUT_CLAMP & OVL_OUTPROC_DATAPATH_CON_OUTPUT_CLAMP);
+	writel(tmp, priv->regs + DISP_REG_OVL_OUTPROC_DATAPATH_CON);
+}
+
+void mtk_disp_outproc_start(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+	unsigned int tmp;
+
+	tmp = readl(priv->regs + DISP_REG_OVL_OUTPROC_SHADOW_CTRL);
+	tmp = tmp | OVL_OUTPROC_BYPASS_SHADOW;
+	writel(tmp, priv->regs + DISP_REG_OVL_OUTPROC_SHADOW_CTRL);
+
+	writel(0, priv->regs + DISP_REG_OVL_OUTPROC_INTSTA);
+
+	tmp = readl(priv->regs + DISP_REG_OVL_OUTPROC_EN);
+	tmp = (tmp & ~OVL_OUTPROC_OVL_EN) | (OVL_OUTPROC_OVL_EN & OVL_OUTPROC_OVL_EN);
+	writel(tmp, priv->regs + DISP_REG_OVL_OUTPROC_EN);
+}
+
+void mtk_disp_outproc_stop(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	writel(0, priv->regs + DISP_REG_OVL_OUTPROC_EN);
+	writel(OVL_OUTPROC_RST, priv->regs + DISP_REG_OVL_OUTPROC_RST);
+	writel(0, priv->regs + DISP_REG_OVL_OUTPROC_RST);
+}
+
+int mtk_disp_outproc_clk_enable(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(priv->clk);
+}
+
+void mtk_disp_outproc_clk_disable(struct device *dev)
+{
+	struct mtk_disp_outproc *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk);
+}
+
+static int mtk_disp_outproc_bind(struct device *dev, struct device *master,
+				 void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_outproc_unbind(struct device *dev, struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_disp_outproc_component_ops = {
+	.bind	= mtk_disp_outproc_bind,
+	.unbind = mtk_disp_outproc_unbind,
+};
+
+static int mtk_disp_outproc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_outproc *priv;
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return dev_err_probe(dev, PTR_ERR(priv->regs), "failed to ioremap outproc\n");
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(dev, PTR_ERR(priv->clk), "failed to get outproc clk\n");
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg\n");
+#endif
+
+	if (of_property_read_u32_index(dev->of_node, "interrupts", 0, &ret)) {
+		dev_dbg(dev, "interrupts not defined\n");
+	} else {
+		priv->irq = platform_get_irq(pdev, 0);
+		if (priv->irq < 0)
+			priv->irq = 0;
+
+		if (priv->irq) {
+			ret = devm_request_irq(dev, priv->irq, mtk_disp_outproc_irq_handler,
+					       IRQF_TRIGGER_NONE, dev_name(dev), priv);
+			if (ret < 0) {
+				dev_err(dev, "Failed to request irq %d: %d\n", priv->irq, ret);
+				return ret;
+			}
+		}
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_disp_outproc_component_ops);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add component\n");
+
+	return ret;
+}
+
+static void mtk_disp_outproc_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_outproc_component_ops);
+}
+
+static const struct of_device_id mtk_disp_outproc_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8196-outproc"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_disp_outproc_driver_dt_match);
+
+struct platform_driver mtk_disp_outproc_driver = {
+	.probe		= mtk_disp_outproc_probe,
+	.remove		= mtk_disp_outproc_remove,
+	.driver		= {
+		.name	= "mediatek-disp-outproc",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_outproc_driver_dt_match,
+	},
+};
+
+MODULE_AUTHOR("Nancy Lin <nancy.lin@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek Output processing Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_outproc.h b/drivers/gpu/drm/mediatek/mtk_disp_outproc.h
new file mode 100644
index 000000000000..abb101979521
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_outproc.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_OUTPROC_H__
+#define __MTK_DISP_OUTPROC_H__
+
+void mtk_disp_outproc_start(struct device *dev);
+void mtk_disp_outproc_stop(struct device *dev);
+int mtk_disp_outproc_clk_enable(struct device *dev);
+void mtk_disp_outproc_clk_disable(struct device *dev);
+void mtk_disp_outproc_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_outproc_register_vblank_cb(struct device *dev,
+					 void (*vblank_cb)(void *),
+					 void *vblank_cb_data);
+void mtk_disp_outproc_unregister_vblank_cb(struct device *dev);
+void mtk_disp_outproc_enable_vblank(struct device *dev);
+void mtk_disp_outproc_disable_vblank(struct device *dev);
+#endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7a14f45d5f97..f7b9c7a982a7 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1280,6 +1280,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_exdma_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_merge_driver,
+	&mtk_disp_outproc_driver,
 	&mtk_disp_ovl_adaptor_driver,
 	&mtk_disp_ovl_driver,
 	&mtk_disp_rdma_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 89178de1478f..c4717c37b0f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -76,6 +76,7 @@ extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_exdma_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_merge_driver;
+extern struct platform_driver mtk_disp_outproc_driver;
 extern struct platform_driver mtk_disp_ovl_adaptor_driver;
 extern struct platform_driver mtk_disp_ovl_driver;
 extern struct platform_driver mtk_disp_rdma_driver;
-- 
2.45.2


