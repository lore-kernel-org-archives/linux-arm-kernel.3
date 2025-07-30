Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC53C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 11:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJytOdQJnmsM7RsH9GBPDiimfmn6eGhKj1OxVbd3T0c=; b=NUgqjPvrNK8KKmNFDFYV+yYjM7
	/UEO7JdL+m6qOVkNVJCXj1LDVaQ66te/meZkCKgOOKV5nZ+3eAQsFQFzeo82sN1w2ODQmKdrDHZlk
	WIDJB5zlmfC0Og2l83r6oz6Jgv5/uXPrrhcfQ5ESmnltqVNxTgnTjQPNniBatduTizk99dKgV5Fa0
	t+WWaxebtLktcG/ZwNQBQ48kaa8yJieI3XpeCOEropD9TDCad8I0b86NKTmv+C5Dx1E653yFy930b
	z2ENFzwMBRoTUsmhdA2BJofW3UXUjKGjyn0jtOskdqMQ214cubBui1Y7ZQU6vZjMYFTv3AbT1wdwv
	Dx25e7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5IV-00000001NvJ-2e4N;
	Wed, 30 Jul 2025 11:48:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4W4-00000001HBB-2eEY;
	Wed, 30 Jul 2025 10:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753873115;
	bh=uErK45btDYGc5b/MpSvUB4PZ/D9AjKfnvb37Cs1aRAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VAXGrQL/Qlm+igFUVr54GsSmi8relPVR2K8eGBezrWcTH0L32fT8/1QKul/nzBq/i
	 mFzH3d3S6r8QKFLyAd9jr3x57nWktJ2NYnruuChOe9SpBbFLERK6Ox/XMy53IWIvly
	 M3aafitvTQ8qdlC1htdZnHPhZQU9tsr4k6/sLIPFi2vGLsRb+v2+5ZAxIy91XeJC76
	 is6+60kqkvNeCZx6Cg3DIe/lABNwpbrH/+02sJ9Khz62u+oyiRD0K0ZULUPM9v2EXN
	 JyizFE8RMPP7JKDrhSg5pL3wVmbvxuzyJ/MiyP25gQDtBZ5a7cE3cOIJQ9MV09KxM3
	 6B3EtiWQ5E9gw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4db2:e926:c82d:3276])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B80417E1319;
	Wed, 30 Jul 2025 12:58:34 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v3 21/27] clk: mediatek: Add MT8196 disp0 clock support
Date: Wed, 30 Jul 2025 12:56:47 +0200
Message-Id: <20250730105653.64910-22-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730105653.64910-1-laura.nao@collabora.com>
References: <20250730105653.64910-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_035836_816341_F16B971E 
X-CRM114-Status: GOOD (  16.83  )
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

Add support for the MT8196 disp0 clock controller, which provides clock
gate control for the display system. It is integrated with the mtk-mmsys
driver, which registers the disp0 clock driver via
platform_device_register_data().

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Kconfig            |   7 +
 drivers/clk/mediatek/Makefile           |   1 +
 drivers/clk/mediatek/clk-mt8196-disp0.c | 169 ++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-disp0.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index fd3514325b45..81c2df501844 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1096,6 +1096,13 @@ config COMMON_CLK_MT8196_MFGCFG
 	help
 	  This driver supports MediaTek MT8196 mfgcfg clocks.
 
+config COMMON_CLK_MT8196_MMSYS
+	tristate "Clock driver for MediaTek MT8196 mmsys"
+	depends on COMMON_CLK_MT8196
+	default m
+	help
+	  This driver supports MediaTek MT8196 mmsys clocks.
+
 config COMMON_CLK_MT8196_PEXTPSYS
 	tristate "Clock driver for MediaTek MT8196 pextpsys"
 	depends on COMMON_CLK_MT8196
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 8a152c6e475f..badcde62c3d1 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -167,6 +167,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) += clk-mt8196-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) += clk-mt8196-mcu.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) += clk-mt8196-mdpsys.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MFGCFG) += clk-mt8196-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o
 obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
 obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
diff --git a/drivers/clk/mediatek/clk-mt8196-disp0.c b/drivers/clk/mediatek/clk-mt8196-disp0.c
new file mode 100644
index 000000000000..ed74b6e3103f
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-disp0.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ *                    Guangjie Song <guangjie.song@mediatek.com>
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    Laura Nao <laura.nao@collabora.com>
+ */
+#include <dt-bindings/clock/mediatek,mt8196-clock.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs mm0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mm0_hwv_regs = {
+	.set_ofs = 0x0020,
+	.clr_ofs = 0x0024,
+	.sta_ofs = 0x2c10,
+};
+
+static const struct mtk_gate_regs mm1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs mm1_hwv_regs = {
+	.set_ofs = 0x0028,
+	.clr_ofs = 0x002c,
+	.sta_ofs = 0x2c14,
+};
+
+#define GATE_MM0(_id, _name, _parent, _shift) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &mm0_cg_regs,		\
+		.shift = _shift,		\
+		.flags = CLK_OPS_PARENT_ENABLE,	\
+		.ops = &mtk_clk_gate_ops_setclr,\
+	}
+
+#define GATE_HWV_MM0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &mm0_cg_regs,			\
+		.hwv_regs = &mm0_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr,	\
+		.flags =  CLK_OPS_PARENT_ENABLE		\
+	}
+
+#define GATE_MM1(_id, _name, _parent, _shift) {	\
+		.id = _id,			\
+		.name = _name,			\
+		.parent_name = _parent,		\
+		.regs = &mm1_cg_regs,		\
+		.shift = _shift,		\
+		.flags = CLK_OPS_PARENT_ENABLE,	\
+		.ops = &mtk_clk_gate_ops_setclr,\
+	}
+
+#define GATE_HWV_MM1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &mm1_cg_regs,			\
+		.hwv_regs = &mm1_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate mm_clks[] = {
+	/* MM0 */
+	GATE_HWV_MM0(CLK_MM_CONFIG, "mm_config", "disp", 0),
+	GATE_HWV_MM0(CLK_MM_DISP_MUTEX0, "mm_disp_mutex0", "disp", 1),
+	GATE_HWV_MM0(CLK_MM_DISP_AAL0, "mm_disp_aal0", "disp", 2),
+	GATE_HWV_MM0(CLK_MM_DISP_AAL1, "mm_disp_aal1", "disp", 3),
+	GATE_MM0(CLK_MM_DISP_C3D0, "mm_disp_c3d0", "disp", 4),
+	GATE_MM0(CLK_MM_DISP_C3D1, "mm_disp_c3d1", "disp", 5),
+	GATE_MM0(CLK_MM_DISP_C3D2, "mm_disp_c3d2", "disp", 6),
+	GATE_MM0(CLK_MM_DISP_C3D3, "mm_disp_c3d3", "disp", 7),
+	GATE_MM0(CLK_MM_DISP_CCORR0, "mm_disp_ccorr0", "disp", 8),
+	GATE_MM0(CLK_MM_DISP_CCORR1, "mm_disp_ccorr1", "disp", 9),
+	GATE_MM0(CLK_MM_DISP_CCORR2, "mm_disp_ccorr2", "disp", 10),
+	GATE_MM0(CLK_MM_DISP_CCORR3, "mm_disp_ccorr3", "disp", 11),
+	GATE_MM0(CLK_MM_DISP_CHIST0, "mm_disp_chist0", "disp", 12),
+	GATE_MM0(CLK_MM_DISP_CHIST1, "mm_disp_chist1", "disp", 13),
+	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "disp", 14),
+	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "disp", 15),
+	GATE_MM0(CLK_MM_DISP_DITHER0, "mm_disp_dither0", "disp", 16),
+	GATE_MM0(CLK_MM_DISP_DITHER1, "mm_disp_dither1", "disp", 17),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC0, "mm_disp_dli_async0", "disp", 18),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC1, "mm_disp_dli_async1", "disp", 19),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC2, "mm_disp_dli_async2", "disp", 20),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC3, "mm_disp_dli_async3", "disp", 21),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC4, "mm_disp_dli_async4", "disp", 22),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC5, "mm_disp_dli_async5", "disp", 23),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC6, "mm_disp_dli_async6", "disp", 24),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC7, "mm_disp_dli_async7", "disp", 25),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC8, "mm_disp_dli_async8", "disp", 26),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC9, "mm_disp_dli_async9", "disp", 27),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC10, "mm_disp_dli_async10", "disp", 28),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC11, "mm_disp_dli_async11", "disp", 29),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC12, "mm_disp_dli_async12", "disp", 30),
+	GATE_HWV_MM0(CLK_MM_DISP_DLI_ASYNC13, "mm_disp_dli_async13", "disp", 31),
+	/* MM1 */
+	GATE_HWV_MM1(CLK_MM_DISP_DLI_ASYNC14, "mm_disp_dli_async14", "disp", 0),
+	GATE_HWV_MM1(CLK_MM_DISP_DLI_ASYNC15, "mm_disp_dli_async15", "disp", 1),
+	GATE_HWV_MM1(CLK_MM_DISP_DLO_ASYNC0, "mm_disp_dlo_async0", "disp", 2),
+	GATE_HWV_MM1(CLK_MM_DISP_DLO_ASYNC1, "mm_disp_dlo_async1", "disp", 3),
+	GATE_HWV_MM1(CLK_MM_DISP_DLO_ASYNC2, "mm_disp_dlo_async2", "disp", 4),
+	GATE_HWV_MM1(CLK_MM_DISP_DLO_ASYNC3, "mm_disp_dlo_async3", "disp", 5),
+	GATE_HWV_MM1(CLK_MM_DISP_DLO_ASYNC4, "mm_disp_dlo_async4", "disp", 6),
+	GATE_HWV_MM1(CLK_MM_DISP_DLO_ASYNC5, "mm_disp_dlo_async5", "disp", 7),
+	GATE_HWV_MM1(CLK_MM_DISP_DLO_ASYNC6, "mm_disp_dlo_async6", "disp", 8),
+	GATE_HWV_MM1(CLK_MM_DISP_DLO_ASYNC7, "mm_disp_dlo_async7", "disp", 9),
+	GATE_HWV_MM1(CLK_MM_DISP_DLO_ASYNC8, "mm_disp_dlo_async8", "disp", 10),
+	GATE_MM1(CLK_MM_DISP_GAMMA0, "mm_disp_gamma0", "disp", 11),
+	GATE_MM1(CLK_MM_DISP_GAMMA1, "mm_disp_gamma1", "disp", 12),
+	GATE_MM1(CLK_MM_MDP_AAL0, "mm_mdp_aal0", "disp", 13),
+	GATE_MM1(CLK_MM_MDP_AAL1, "mm_mdp_aal1", "disp", 14),
+	GATE_HWV_MM1(CLK_MM_MDP_RDMA0, "mm_mdp_rdma0", "disp", 15),
+	GATE_HWV_MM1(CLK_MM_DISP_POSTMASK0, "mm_disp_postmask0", "disp", 16),
+	GATE_HWV_MM1(CLK_MM_DISP_POSTMASK1, "mm_disp_postmask1", "disp", 17),
+	GATE_HWV_MM1(CLK_MM_MDP_RSZ0, "mm_mdp_rsz0", "disp", 18),
+	GATE_HWV_MM1(CLK_MM_MDP_RSZ1, "mm_mdp_rsz1", "disp", 19),
+	GATE_HWV_MM1(CLK_MM_DISP_SPR0, "mm_disp_spr0", "disp", 20),
+	GATE_MM1(CLK_MM_DISP_TDSHP0, "mm_disp_tdshp0", "disp", 21),
+	GATE_MM1(CLK_MM_DISP_TDSHP1, "mm_disp_tdshp1", "disp", 22),
+	GATE_HWV_MM1(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "disp", 23),
+	GATE_HWV_MM1(CLK_MM_DISP_Y2R0, "mm_disp_y2r0", "disp", 24),
+	GATE_HWV_MM1(CLK_MM_SMI_SUB_COMM0, "mm_ssc", "disp", 25),
+	GATE_HWV_MM1(CLK_MM_DISP_FAKE_ENG0, "mm_disp_fake_eng0", "disp", 26),
+};
+
+static const struct mtk_clk_desc mm_mcd = {
+	.clks = mm_clks,
+	.num_clks = ARRAY_SIZE(mm_clks),
+};
+
+static const struct platform_device_id clk_mt8196_disp0_id_table[] = {
+	{ .name = "clk-mt8196-disp0", .driver_data = (kernel_ulong_t)&mm_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, clk_mt8196_disp0_id_table);
+
+static struct platform_driver clk_mt8196_disp0_drv = {
+	.probe = mtk_clk_pdev_probe,
+	.remove = mtk_clk_pdev_remove,
+	.driver = {
+		.name = "clk-mt8196-disp0",
+	},
+	.id_table = clk_mt8196_disp0_id_table,
+};
+module_platform_driver(clk_mt8196_disp0_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8196 disp0 clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


