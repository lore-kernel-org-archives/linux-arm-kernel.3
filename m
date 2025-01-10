Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F74BE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7HsWD76wXG2HXsFEIHKr9PRhk3CAY4Cvi77Fuw6pDDU=; b=DATiyFOncPWZ7x4Pyik4h67fuy
	10/6oR6vdbLtAd9S6yIVwNo3eQ2S8ToS9zbZ5SUwBfJE46XYXiEqbrH0Kj0wgF0h3iXmHbfwHBfli
	eDulnW+Puf+/rygcXlzv6Q9mSqHKTPHD+iJLacOZyzGtX9BsFvM2EoEH452akXG/8NY82IAheRBYN
	2bsbx2AQTxcu0wbEraqqPTXS7Pz99c0H5+OAvlZAJlc2HCojINhPfkW0TL6jcxSciX0JrI9m44Eiy
	+90Z+Kzzt3tGT887yj8pAjqSqUomJvGHVbhLAoM5uZHXIv6wL3Klxa5yQj8YfmQFa7UDSVhmpmxtV
	IQwUGDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEW4-0000000FMON-2mVG;
	Fri, 10 Jan 2025 12:53:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWEHx-0000000FIpH-0qUh;
	Fri, 10 Jan 2025 12:39:00 +0000
X-UUID: d7798190cf4f11ef9048ed6ed365623b-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7HsWD76wXG2HXsFEIHKr9PRhk3CAY4Cvi77Fuw6pDDU=;
	b=nkdAGQ0FU3i9EpuAdmzo1xRuYRxt4FpXamzDn+/Pu1Xo/gmhllmXHMi4yFFo5w03pFmxyNW8sriKN/NP5x3Pn8fvWqPjJwoAjq3IO03Ttqqzaexo68Nv+ZmufhNvNS4RBDhUCw8IITZYRN5UOlXGUF99+0nWS7vJaIfhCk+xY7Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:44c2749b-d985-422b-af3a-21f4bb649267,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:60aa074,CLOUDID:4a33b037-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d7798190cf4f11ef9048ed6ed365623b-20250110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1039805744; Fri, 10 Jan 2025 05:38:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 20:38:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 20:38:46 +0800
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
Subject: [PATCH 09/12] drm/mediatek: add BLENDER support for MT8196
Date: Fri, 10 Jan 2025 20:34:05 +0800
Message-ID: <20250110123835.2719824-11-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_043857_296040_F450AB94 
X-CRM114-Status: GOOD (  19.62  )
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

From: "Nancy.Lin" <nancy.lin@mediatek.com>

BLENDER executes the alpha blending function for overlapping
layers from different sources, which is the primary function
of the overlapping system.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c     |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h     |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_blender.c | 352 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_blender.h |  17 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  12 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 8 files changed, 386 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_blender.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index db92f4fb353d..a7b9ebe27f68 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -3,6 +3,7 @@
 mediatek-drm-y := mtk_crtc.o \
 		  mtk_ddp_comp.o \
 		  mtk_disp_aal.o \
+		  mtk_disp_blender.o \
 		  mtk_disp_ccorr.o \
 		  mtk_disp_color.o \
 		  mtk_disp_exdma.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 3e0739d8e6f1..e65c6df987f2 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -445,6 +445,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DP_INTF] = "dp-intf",
 	[MTK_DPI] = "dpi",
 	[MTK_DSI] = "dsi",
+	[MTK_OVL_BLENDER] = "blender",
 	[MTK_OVL_EXDMA] = "exdma",
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 86dc0ee3924c..075ba5683f93 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -43,6 +43,7 @@ enum mtk_ddp_comp_type {
 	MTK_DPI,
 	MTK_DP_INTF,
 	MTK_DSI,
+	MTK_OVL_BLENDER,
 	MTK_OVL_EXDMA,
 	MTK_DDP_COMP_TYPE_MAX,
 };
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_blender.c b/drivers/gpu/drm/mediatek/mtk_disp_blender.c
new file mode 100644
index 000000000000..210906e017f6
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_blender.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_blend.h>
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
+#include "mtk_disp_drv.h"
+#include "mtk_drm_drv.h"
+#include "mtk_disp_blender.h"
+
+#define DISP_REG_OVL_BLD_DATAPATH_CON			0x010
+#define OVL_BLD_BGCLR_IN_SEL					BIT(0)
+#define OVL_BLD_BGCLR_OUT_TO_PROC				BIT(4)
+#define OVL_BLD_BGCLR_OUT_TO_NEXT_LAYER				BIT(5)
+
+#define DISP_REG_OVL_BLD_EN				0x020
+#define OVL_BLD_EN						BIT(0)
+#define OVL_BLD_FORCE_RELAY_MODE				BIT(4)
+#define OVL_RELAY_MODE						BIT(5)
+#define DISP_REG_OVL_BLD_RST				0x024
+#define OVL_BLD_RST						BIT(0)
+#define DISP_REG_OVL_BLD_SHADOW_CTRL			0x028
+#define DISP_OVL_BLD_BYPASS_SHADOW				BIT(2)
+#define DISP_OVL_BLD_BGCLR_BALCK			0xff000000
+#define DISP_REG_OVL_BLD_ROI_SIZE			0x030
+#define DISP_REG_OVL_BLD_L_EN				0x040
+#define OVL_BLD_L_EN						BIT(0)
+#define DISP_REG_BLD_OVL_OFFSET				0x044
+#define DISP_REG_BLD_OVL_SRC_SIZE			0x048
+#define DISP_REG_OVL_BLD_L0_CLRFMT			0x050
+#define OVL_BLD_CON_FLD_CLRFMT					GENMASK(3, 0)
+#define OVL_BLD_CON_CLRFMT_MAN					BIT(4)
+#define OVL_BLD_CON_FLD_CLRFMT_NB				GENMASK(9, 8)
+#define OVL_BLD_CON_CLRFMT_NB_10_BIT				BIT(8)
+#define OVL_BLD_CON_BYTE_SWAP					BIT(16)
+#define OVL_BLD_CON_RGB_SWAP					BIT(17)
+#define OVL_BLD_CON_CLRFMT_RGB565				0x000
+#define OVL_BLD_CON_CLRFMT_BGR888				0x001
+#define OVL_BLD_CON_CLRFMT_BGRA8888				0x002
+#define OVL_BLD_CON_CLRFMT_ABGRB8888				0x003
+#define OVL_BLD_CON_CLRFMT_UYVY					0x004
+#define OVL_BLD_CON_CLRFMT_YUYV					0x005
+#define OVL_BLD_CON_CLRFMT_BGR565				(0x000 | OVL_BLD_CON_BYTE_SWAP)
+#define OVL_BLD_CON_CLRFMT_RGB888				(0x001 | OVL_BLD_CON_BYTE_SWAP)
+#define OVL_BLD_CON_CLRFMT_RGBA8888				(0x002 | OVL_BLD_CON_BYTE_SWAP)
+#define OVL_BLD_CON_CLRFMT_ARGB8888				(0x003 | OVL_BLD_CON_BYTE_SWAP)
+#define OVL_BLD_CON_CLRFMT_VYUY					(0x004 | OVL_BLD_CON_BYTE_SWAP)
+#define OVL_BLD_CON_CLRFMT_YVYU					(0x005 | OVL_BLD_CON_BYTE_SWAP)
+#define OVL_BLD_CON_CLRFMT_PBGRA8888				(0x003 | OVL_BLD_CON_CLRFMT_MAN)
+#define OVL_BLD_CON_CLRFMT_PARGB8888				(OVL_BLD_CON_CLRFMT_PBGRA8888 | \
+								 OVL_BLD_CON_BYTE_SWAP)
+#define OVL_BLD_CON_CLRFMT_PRGBA8888				(OVL_BLD_CON_CLRFMT_PBGRA8888 | \
+								 OVL_BLD_CON_RGB_SWAP)
+#define OVL_BLD_CON_CLRFMT_PABGR8888				(OVL_BLD_CON_CLRFMT_PBGRA8888 | \
+								 OVL_BLD_CON_RGB_SWAP | \
+								 OVL_BLD_CON_BYTE_SWAP)
+#define DISP_REG_OVL_BLD_BGCLR_CLR			0x104
+#define DISP_REG_OVL_BLD_L_CON2				0x200
+#define OVL_BLD_L_ALPHA						GENMASK(7, 0)
+#define OVL_BLD_L_ALPHA_EN					BIT(12)
+#define DISP_REG_OVL_BLD_L0_PITCH			0x208
+#define OVL_L0_CONST_BLD					BIT(24)
+
+struct mtk_disp_blender {
+	void __iomem		*regs;
+	struct clk		*clk;
+	struct cmdq_client_reg	cmdq_reg;
+};
+
+static inline bool is_10bit_rgb(u32 fmt)
+{
+	switch (fmt) {
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRX1010102:
+	case DRM_FORMAT_BGRA1010102:
+		return true;
+	}
+	return false;
+}
+
+static unsigned int mtk_disp_blender_fmt_convert(unsigned int fmt, unsigned int blend_mode)
+{
+	/*
+	 * DRM_FORMAT: bit 32->0, BLD_FMT: bit 0->32,
+	 * so DRM_FORMAT_RGB888 = OVL_BLD_CON_CLRFMT_BGR888
+	 */
+	switch (fmt) {
+	default:
+	case DRM_FORMAT_BGR565:
+		return OVL_BLD_CON_CLRFMT_RGB565;
+	case DRM_FORMAT_RGB565:
+		return OVL_BLD_CON_CLRFMT_BGR565;
+	case DRM_FORMAT_RGB888:
+		return OVL_BLD_CON_CLRFMT_BGR888;
+	case DRM_FORMAT_BGR888:
+		return OVL_BLD_CON_CLRFMT_RGB888;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+		return ((blend_mode == DRM_MODE_BLEND_PREMULTI) ?
+			OVL_BLD_CON_CLRFMT_PABGR8888 : OVL_BLD_CON_CLRFMT_ABGRB8888) |
+			(is_10bit_rgb(fmt) ? OVL_BLD_CON_CLRFMT_NB_10_BIT : 0);
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRX1010102:
+	case DRM_FORMAT_BGRA1010102:
+		return ((blend_mode == DRM_MODE_BLEND_PREMULTI) ?
+			OVL_BLD_CON_CLRFMT_PARGB8888 : OVL_BLD_CON_CLRFMT_ARGB8888) |
+			(is_10bit_rgb(fmt) ? OVL_BLD_CON_CLRFMT_NB_10_BIT : 0);
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+		return ((blend_mode == DRM_MODE_BLEND_PREMULTI) ?
+			OVL_BLD_CON_CLRFMT_PBGRA8888 : OVL_BLD_CON_CLRFMT_BGRA8888) |
+			(is_10bit_rgb(fmt) ? OVL_BLD_CON_CLRFMT_NB_10_BIT : 0);
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+		return ((blend_mode == DRM_MODE_BLEND_PREMULTI) ?
+			OVL_BLD_CON_CLRFMT_PRGBA8888 : OVL_BLD_CON_CLRFMT_RGBA8888) |
+			(is_10bit_rgb(fmt) ? OVL_BLD_CON_CLRFMT_NB_10_BIT : 0);
+	case DRM_FORMAT_UYVY:
+		return OVL_BLD_CON_CLRFMT_UYVY;
+	case DRM_FORMAT_YUYV:
+		return OVL_BLD_CON_CLRFMT_YUYV;
+	}
+}
+
+void mtk_disp_blender_layer_config(struct device *dev, struct mtk_plane_state *state,
+				   struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_blender *priv = dev_get_drvdata(dev);
+	struct mtk_plane_pending_state *pending = &state->pending;
+	unsigned int align_width = ALIGN_DOWN(pending->width, 2);
+	unsigned int alpha;
+	unsigned int clrfmt;
+	unsigned int blend_mode = DRM_MODE_BLEND_PIXEL_NONE;
+
+	if (!pending->enable) {
+		mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+				   DISP_REG_OVL_BLD_L_EN, OVL_BLD_L_EN);
+		return;
+	}
+
+	mtk_ddp_write(cmdq_pkt, pending->y << 16 | pending->x, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_BLD_OVL_OFFSET);
+
+	mtk_ddp_write(cmdq_pkt, pending->height << 16 | align_width, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_BLD_OVL_SRC_SIZE);
+
+	if (state->base.fb && state->base.fb->format->has_alpha)
+		blend_mode = state->base.pixel_blend_mode;
+
+	clrfmt = mtk_disp_blender_fmt_convert(pending->format, blend_mode);
+
+	mtk_ddp_write_mask(cmdq_pkt, clrfmt, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_BLD_L0_CLRFMT, OVL_BLD_CON_CLRFMT_MAN |
+			   OVL_BLD_CON_RGB_SWAP |  OVL_BLD_CON_BYTE_SWAP |
+			   OVL_BLD_CON_FLD_CLRFMT | OVL_BLD_CON_FLD_CLRFMT_NB);
+
+	alpha = (0xFF & (state->base.alpha >> 8)) | OVL_BLD_L_ALPHA_EN;
+	mtk_ddp_write_mask(cmdq_pkt, alpha, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_BLD_L_CON2, OVL_BLD_L_ALPHA_EN | OVL_BLD_L_ALPHA);
+
+	mtk_ddp_write_mask(cmdq_pkt, OVL_BLD_L_EN, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_BLD_L_EN, OVL_BLD_L_EN);
+
+	if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE)
+		mtk_ddp_write_mask(cmdq_pkt, OVL_L0_CONST_BLD, &priv->cmdq_reg, priv->regs,
+				   DISP_REG_OVL_BLD_L0_PITCH, OVL_L0_CONST_BLD);
+	else
+		mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+				   DISP_REG_OVL_BLD_L0_PITCH, OVL_L0_CONST_BLD);
+}
+
+void mtk_disp_blender_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, enum mtk_disp_blender_layer blender,
+			     struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_blender *priv = dev_get_drvdata(dev);
+	unsigned int tmp;
+
+	dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
+
+	tmp = readl(priv->regs + DISP_REG_OVL_BLD_SHADOW_CTRL);
+	tmp = tmp | DISP_OVL_BLD_BYPASS_SHADOW;
+	writel(tmp, priv->regs + DISP_REG_OVL_BLD_SHADOW_CTRL);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_OVL_BLD_ROI_SIZE);
+	mtk_ddp_write(cmdq_pkt, DISP_OVL_BLD_BGCLR_BALCK, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_OVL_BLD_BGCLR_CLR);
+
+	if (blender == FIRST_BLENDER)
+		mtk_ddp_write_mask(cmdq_pkt, OVL_BLD_BGCLR_OUT_TO_NEXT_LAYER,
+				   &priv->cmdq_reg, priv->regs, DISP_REG_OVL_BLD_DATAPATH_CON,
+				   OVL_BLD_BGCLR_OUT_TO_PROC | OVL_BLD_BGCLR_OUT_TO_NEXT_LAYER |
+				   OVL_BLD_BGCLR_IN_SEL);
+	else if (blender == LAST_BLENDER)
+		mtk_ddp_write_mask(cmdq_pkt, OVL_BLD_BGCLR_OUT_TO_PROC | OVL_BLD_BGCLR_IN_SEL,
+				   &priv->cmdq_reg, priv->regs, DISP_REG_OVL_BLD_DATAPATH_CON,
+				   OVL_BLD_BGCLR_OUT_TO_PROC | OVL_BLD_BGCLR_OUT_TO_NEXT_LAYER |
+				   OVL_BLD_BGCLR_IN_SEL);
+	else if (blender == SINGLE_BLENDER)
+		mtk_ddp_write_mask(cmdq_pkt, OVL_BLD_BGCLR_OUT_TO_PROC,
+				   &priv->cmdq_reg, priv->regs, DISP_REG_OVL_BLD_DATAPATH_CON,
+				   OVL_BLD_BGCLR_OUT_TO_PROC | OVL_BLD_BGCLR_OUT_TO_NEXT_LAYER |
+				   OVL_BLD_BGCLR_IN_SEL);
+	else
+		mtk_ddp_write_mask(cmdq_pkt, OVL_BLD_BGCLR_OUT_TO_NEXT_LAYER | OVL_BLD_BGCLR_IN_SEL,
+				   &priv->cmdq_reg, priv->regs, DISP_REG_OVL_BLD_DATAPATH_CON,
+				   OVL_BLD_BGCLR_OUT_TO_PROC | OVL_BLD_BGCLR_OUT_TO_NEXT_LAYER |
+				   OVL_BLD_BGCLR_IN_SEL);
+}
+
+void mtk_disp_blender_start(struct device *dev, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_blender *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write_mask(cmdq_pkt, OVL_BLD_EN, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_BLD_EN, OVL_BLD_EN);
+}
+
+void mtk_disp_blender_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_blender *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_BLD_L_EN, OVL_BLD_L_EN);
+	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_BLD_EN, OVL_BLD_EN);
+	mtk_ddp_write_mask(cmdq_pkt, OVL_BLD_RST, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_BLD_RST, OVL_BLD_RST);
+	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_BLD_RST, OVL_BLD_RST);
+}
+
+int mtk_disp_blender_clk_enable(struct device *dev)
+{
+	struct mtk_disp_blender *priv = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(priv->clk);
+}
+
+void mtk_disp_blender_clk_disable(struct device *dev)
+{
+	struct mtk_disp_blender *priv = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(priv->clk);
+}
+
+static int mtk_disp_blender_bind(struct device *dev, struct device *master,
+				 void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_blender_unbind(struct device *dev, struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_disp_blender_component_ops = {
+	.bind	= mtk_disp_blender_bind,
+	.unbind = mtk_disp_blender_unbind,
+};
+
+static int mtk_disp_blender_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct mtk_disp_blender *priv;
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap blender\n");
+		return PTR_ERR(priv->regs);
+	}
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get blender clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg\n");
+#endif
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_disp_blender_component_ops);
+	if (ret)
+		dev_notice(dev, "Failed to add component: %d\n", ret);
+
+	return ret;
+}
+
+static void mtk_disp_blender_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_blender_component_ops);
+}
+
+static const struct of_device_id mtk_disp_blender_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8196-blender"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_disp_blender_driver_dt_match);
+
+struct platform_driver mtk_disp_blender_driver = {
+	.probe		= mtk_disp_blender_probe,
+	.remove		= mtk_disp_blender_remove,
+	.driver		= {
+		.name	= "mediatek-disp-blender",
+		.owner	= THIS_MODULE,
+		.of_match_table = mtk_disp_blender_driver_dt_match,
+	},
+};
+
+MODULE_AUTHOR("Nancy Lin <nancy.lin@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek Blender Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_blender.h b/drivers/gpu/drm/mediatek/mtk_disp_blender.h
new file mode 100644
index 000000000000..3f0dfd422afd
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_blender.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_BLENDER_H__
+#define __MTK_DISP_BLENDER_H__
+
+enum mtk_disp_blender_layer {
+	FIRST_BLENDER,
+	LAST_BLENDER,
+	SINGLE_BLENDER,
+	OTHERS,
+	BLENDER_LAYER_MAX,
+};
+
+#endif // __MTK_DISP_BLENDER_H__
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index f8291651dc80..719191f05b27 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -9,6 +9,7 @@
 #include <linux/soc/mediatek/mtk-cmdq.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
+#include "mtk_disp_blender.h"
 #include "mtk_mdp_rdma.h"
 #include "mtk_plane.h"
 
@@ -39,6 +40,17 @@ void mtk_color_config(struct device *dev, unsigned int w,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_color_start(struct device *dev);
 
+void mtk_disp_blender_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_blender_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
+int mtk_disp_blender_clk_enable(struct device *dev);
+void mtk_disp_blender_clk_disable(struct device *dev);
+void mtk_disp_blender_config(struct device *dev, unsigned int w,
+			     unsigned int h, unsigned int vrefresh,
+			     unsigned int bpc, enum mtk_disp_blender_layer blender,
+			     struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_blender_layer_config(struct device *dev, struct mtk_plane_state *state,
+				   struct cmdq_pkt *cmdq_pkt);
+
 int mtk_disp_exdma_clk_enable(struct device *dev);
 void mtk_disp_exdma_clk_disable(struct device *dev);
 void mtk_disp_exdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index ccbf46d0707a..e4a0d9fe4e2d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1259,6 +1259,7 @@ static struct platform_driver mtk_drm_platform_driver = {
 
 static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_aal_driver,
+	&mtk_disp_blender_driver,
 	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
 	&mtk_disp_exdma_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 898a75898775..89178de1478f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -70,6 +70,7 @@ struct mtk_drm_private {
 };
 
 extern struct platform_driver mtk_disp_aal_driver;
+extern struct platform_driver mtk_disp_blender_driver;
 extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
 extern struct platform_driver mtk_disp_exdma_driver;
-- 
2.34.1


