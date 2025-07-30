Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E54BC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uPvWhcJdBgReO1y+OOcgrsu9E3SdBlKm/z9J8+c+bo=; b=rY+aRQnv52F7XVYVchYwuskhwP
	vTDZ9fYI7cTZFBU7dmp8b1iCUNms/ye7xClo4F5oBHKI+23UD0p3qrlcw/yF8EZTBmHqrZCGvGnET
	lzZjSsIUoY8a7NAamjfxN+y0SSFBRXEFANirrUFSQ5bGZVavyf2rS8s8Jz2nDZ170AEyALWrQqetF
	l3aMX9l24Ao4ck9o716REpK0PGu468OI2HJ5SZYIatPHVgd+X59VZeOjX3PEifTkBTudnBUlw/Igq
	B46aXDIj6K3SIONhS5LDS5nT2wGe4U8PAzXnCvP82W+CSoR4BeKeSaXXQPRvRi8LZCZ6wAIkFyEYs
	jwXTJsyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5Pt-00000001Oa3-0lFg;
	Wed, 30 Jul 2025 11:56:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4W8-00000001HCm-2lcT;
	Wed, 30 Jul 2025 10:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753873119;
	bh=jQVoYVyQqXtck7S8IIBw1lIfD7T0mj6av0Dpu5t/61M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ltrJ+KLHnLOd0TAC1m3Rt6o3fH3Yz8RaGN50Yekvby50TWuZHlSkv+QkSGILc2S3F
	 m2ELDoI0ydxoI28wFIta1Fh0PO/tFLDd4PCkQz8tB1/YHrb2/93OX0g6NKFmPYl0y5
	 gB94Jb1NSfl3EVcZwY1n9q1+6YZ7x6quEZwz7CpvovrSmNhgxODCk8kjgfgzlNt7PL
	 DhauXB/kXgkkDTysgyDexQ9pVhqCGCb8VdsWq3aXwdFYEb+RRp51D8Pho7L+9XJ2wx
	 BNjpbsSIWAShYr1k69pYcYpMK6QKwXPuF4L4A3OIUOVdKfvX738IOrUK6DP3kOL+SX
	 lnKRgOLAOWSTA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4db2:e926:c82d:3276])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3537A17E130E;
	Wed, 30 Jul 2025 12:58:38 +0200 (CEST)
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
Subject: [PATCH v3 24/27] clk: mediatek: Add MT8196 ovl0 clock support
Date: Wed, 30 Jul 2025 12:56:50 +0200
Message-Id: <20250730105653.64910-25-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730105653.64910-1-laura.nao@collabora.com>
References: <20250730105653.64910-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_035840_843682_531F4538 
X-CRM114-Status: GOOD (  16.54  )
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

Add support for the MT8196 ovl0 clock controller, which provides clock
gate control for the display system. It is integrated with the mtk-mmsys
driver, which registers the ovl0 clock driver via
platform_device_register_data().

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Makefile          |   3 +-
 drivers/clk/mediatek/clk-mt8196-ovl0.c | 154 +++++++++++++++++++++++++
 2 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-ovl0.c

diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 4318b6dd4085..25b03519ee81 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -167,7 +167,8 @@ obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) += clk-mt8196-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) += clk-mt8196-mcu.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) += clk-mt8196-mdpsys.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MFGCFG) += clk-mt8196-mfg.o
-obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-mt8196-disp1.o clk-mt8196-vdisp_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-mt8196-disp1.o clk-mt8196-vdisp_ao.o \
+					 clk-mt8196-ovl0.o
 obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
 obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
diff --git a/drivers/clk/mediatek/clk-mt8196-ovl0.c b/drivers/clk/mediatek/clk-mt8196-ovl0.c
new file mode 100644
index 000000000000..3527a1c0c08b
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-ovl0.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ *                    Guangjie Song <guangjie.song@mediatek.com>
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    Laura Nao <laura.nao@collabora.com>
+ */
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+#include <dt-bindings/clock/mediatek,mt8196-clock.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+static const struct mtk_gate_regs ovl0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs ovl0_hwv_regs = {
+	.set_ofs = 0x0060,
+	.clr_ofs = 0x0064,
+	.sta_ofs = 0x2c30,
+};
+
+static const struct mtk_gate_regs ovl1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs ovl1_hwv_regs = {
+	.set_ofs = 0x0068,
+	.clr_ofs = 0x006c,
+	.sta_ofs = 0x2c34,
+};
+
+#define GATE_HWV_OVL0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ovl0_cg_regs,			\
+		.hwv_regs = &ovl0_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_HWV_OVL1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &ovl1_cg_regs,			\
+		.hwv_regs = &ovl1_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate ovl_clks[] = {
+	/* OVL0 */
+	GATE_HWV_OVL0(CLK_OVLSYS_CONFIG, "ovlsys_config", "disp", 0),
+	GATE_HWV_OVL0(CLK_OVL_FAKE_ENG0, "ovl_fake_eng0", "disp", 1),
+	GATE_HWV_OVL0(CLK_OVL_FAKE_ENG1, "ovl_fake_eng1", "disp", 2),
+	GATE_HWV_OVL0(CLK_OVL_MUTEX0, "ovl_mutex0", "disp", 3),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA0, "ovl_exdma0", "disp", 4),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA1, "ovl_exdma1", "disp", 5),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA2, "ovl_exdma2", "disp", 6),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA3, "ovl_exdma3", "disp", 7),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA4, "ovl_exdma4", "disp", 8),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA5, "ovl_exdma5", "disp", 9),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA6, "ovl_exdma6", "disp", 10),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA7, "ovl_exdma7", "disp", 11),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA8, "ovl_exdma8", "disp", 12),
+	GATE_HWV_OVL0(CLK_OVL_EXDMA9, "ovl_exdma9", "disp", 13),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER0, "ovl_blender0", "disp", 14),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER1, "ovl_blender1", "disp", 15),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER2, "ovl_blender2", "disp", 16),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER3, "ovl_blender3", "disp", 17),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER4, "ovl_blender4", "disp", 18),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER5, "ovl_blender5", "disp", 19),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER6, "ovl_blender6", "disp", 20),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER7, "ovl_blender7", "disp", 21),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER8, "ovl_blender8", "disp", 22),
+	GATE_HWV_OVL0(CLK_OVL_BLENDER9, "ovl_blender9", "disp", 23),
+	GATE_HWV_OVL0(CLK_OVL_OUTPROC0, "ovl_outproc0", "disp", 24),
+	GATE_HWV_OVL0(CLK_OVL_OUTPROC1, "ovl_outproc1", "disp", 25),
+	GATE_HWV_OVL0(CLK_OVL_OUTPROC2, "ovl_outproc2", "disp", 26),
+	GATE_HWV_OVL0(CLK_OVL_OUTPROC3, "ovl_outproc3", "disp", 27),
+	GATE_HWV_OVL0(CLK_OVL_OUTPROC4, "ovl_outproc4", "disp", 28),
+	GATE_HWV_OVL0(CLK_OVL_OUTPROC5, "ovl_outproc5", "disp", 29),
+	GATE_HWV_OVL0(CLK_OVL_MDP_RSZ0, "ovl_mdp_rsz0", "disp", 30),
+	GATE_HWV_OVL0(CLK_OVL_MDP_RSZ1, "ovl_mdp_rsz1", "disp", 31),
+	/* OVL1 */
+	GATE_HWV_OVL1(CLK_OVL_DISP_WDMA0, "ovl_disp_wdma0", "disp", 0),
+	GATE_HWV_OVL1(CLK_OVL_DISP_WDMA1, "ovl_disp_wdma1", "disp", 1),
+	GATE_HWV_OVL1(CLK_OVL_UFBC_WDMA0, "ovl_ufbc_wdma0", "disp", 2),
+	GATE_HWV_OVL1(CLK_OVL_MDP_RDMA0, "ovl_mdp_rdma0", "disp", 3),
+	GATE_HWV_OVL1(CLK_OVL_MDP_RDMA1, "ovl_mdp_rdma1", "disp", 4),
+	GATE_HWV_OVL1(CLK_OVL_BWM0, "ovl_bwm0", "disp", 5),
+	GATE_HWV_OVL1(CLK_OVL_DLI0, "ovl_dli0", "disp", 6),
+	GATE_HWV_OVL1(CLK_OVL_DLI1, "ovl_dli1", "disp", 7),
+	GATE_HWV_OVL1(CLK_OVL_DLI2, "ovl_dli2", "disp", 8),
+	GATE_HWV_OVL1(CLK_OVL_DLI3, "ovl_dli3", "disp", 9),
+	GATE_HWV_OVL1(CLK_OVL_DLI4, "ovl_dli4", "disp", 10),
+	GATE_HWV_OVL1(CLK_OVL_DLI5, "ovl_dli5", "disp", 11),
+	GATE_HWV_OVL1(CLK_OVL_DLI6, "ovl_dli6", "disp", 12),
+	GATE_HWV_OVL1(CLK_OVL_DLI7, "ovl_dli7", "disp", 13),
+	GATE_HWV_OVL1(CLK_OVL_DLI8, "ovl_dli8", "disp", 14),
+	GATE_HWV_OVL1(CLK_OVL_DLO0, "ovl_dlo0", "disp", 15),
+	GATE_HWV_OVL1(CLK_OVL_DLO1, "ovl_dlo1", "disp", 16),
+	GATE_HWV_OVL1(CLK_OVL_DLO2, "ovl_dlo2", "disp", 17),
+	GATE_HWV_OVL1(CLK_OVL_DLO3, "ovl_dlo3", "disp", 18),
+	GATE_HWV_OVL1(CLK_OVL_DLO4, "ovl_dlo4", "disp", 19),
+	GATE_HWV_OVL1(CLK_OVL_DLO5, "ovl_dlo5", "disp", 20),
+	GATE_HWV_OVL1(CLK_OVL_DLO6, "ovl_dlo6", "disp", 21),
+	GATE_HWV_OVL1(CLK_OVL_DLO7, "ovl_dlo7", "disp", 22),
+	GATE_HWV_OVL1(CLK_OVL_DLO8, "ovl_dlo8", "disp", 23),
+	GATE_HWV_OVL1(CLK_OVL_DLO9, "ovl_dlo9", "disp", 24),
+	GATE_HWV_OVL1(CLK_OVL_DLO10, "ovl_dlo10", "disp", 25),
+	GATE_HWV_OVL1(CLK_OVL_DLO11, "ovl_dlo11", "disp", 26),
+	GATE_HWV_OVL1(CLK_OVL_DLO12, "ovl_dlo12", "disp", 27),
+	GATE_HWV_OVL1(CLK_OVLSYS_RELAY0, "ovlsys_relay0", "disp", 28),
+	GATE_HWV_OVL1(CLK_OVL_INLINEROT0, "ovl_inlinerot0", "disp", 29),
+	GATE_HWV_OVL1(CLK_OVL_SMI, "ovl_smi", "disp", 30),
+};
+
+static const struct mtk_clk_desc ovl_mcd = {
+	.clks = ovl_clks,
+	.num_clks = ARRAY_SIZE(ovl_clks),
+};
+
+static const struct platform_device_id clk_mt8196_ovl0_id_table[] = {
+	{ .name = "clk-mt8196-ovl0", .driver_data = (kernel_ulong_t)&ovl_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, clk_mt8196_ovl0_id_table);
+
+static struct platform_driver clk_mt8196_ovl0_drv = {
+	.probe = mtk_clk_pdev_probe,
+	.remove = mtk_clk_pdev_remove,
+	.driver = {
+		.name = "clk-mt8196-ovl0",
+	},
+	.id_table = clk_mt8196_ovl0_id_table,
+};
+module_platform_driver(clk_mt8196_ovl0_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8196 ovl0 clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


