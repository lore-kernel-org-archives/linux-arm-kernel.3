Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14421CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 11:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8LdGAqsfcmS6f/Ul6N/0WVNFent59i8FxrE+ZjstpE=; b=t/fopW/Ua4UG+VLYWWUclnFGaQ
	cRI2JcvlEGLOUc7SnRppci8cabEIz2pfWYkyOm4xb8jHSn1AaXg0t9aAx9DiHVQIe4r4KmV+9EdK4
	LcEa1JT03z/On9fup9083Lhy+/gGn1Xbqc7mkB6iX2wUbMoQs/XfKuh/c5M5z1uncvheT6CMS1j5k
	Gf+e6/Ca6JfND/FLb4B2UIR10glUOK6uwNW/cYZMjcbr8y9LaxN5bGhUVnDY6GFHXMXp+mEIEmn7A
	BfmqUB1IpD+5asJ1ooY3YIW39XaZiEPXsMeyG3vjBC1KnNdTlUYtjnWtGwrkz7HfTv8wQ0xsB2GdT
	trrXqX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxB8-00000005TD3-2W8f;
	Fri, 29 Aug 2025 11:21:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvIM-000000057rk-20Zs;
	Fri, 29 Aug 2025 09:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756459277;
	bh=XqM5fW6gSqYyJwHknYv/5HPHMd6Z2vobWjqceSP9tJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQkM98P12oQGjW9A9Vwkb+0cYZu8zbXpI5E5ojhWcsUPdI4MN603+TqqxCCswUpcK
	 T231cIAuiNO46lgY2Nn1gfCOFBspj0CvQ6lcwUMmezXR/qPS/yG3Vb/PRsoStZ3q2H
	 JFFr8IiBBsA9vTBE8AFIZnAqVLqWxbxSX61rPxTZxPSaTEILuSZnxr+25D6X4l5rb6
	 C4BeweHCW+mvF2hpPSUMHdotgV1iIePiV3qYEtaied8ssLT4HbfVQha2tS9bPcnSWV
	 tsbAXz/88e2PTTyeME7ykEp+USutppxknjyKveDD9w9IODEMhuK6MPqARayyA3WrN9
	 wWfnQRQGtwPbA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:f5b1:db54:a11a:c333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09C3D17E12A2;
	Fri, 29 Aug 2025 11:21:15 +0200 (CEST)
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
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v5 19/27] clk: mediatek: Add MT8196 mdpsys clock support
Date: Fri, 29 Aug 2025 11:19:05 +0200
Message-Id: <20250829091913.131528-20-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250829091913.131528-1-laura.nao@collabora.com>
References: <20250829091913.131528-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_022118_693918_63F03702 
X-CRM114-Status: GOOD (  15.81  )
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

Add support for the MT8196 mdpsys clock controller, which provides clock
gate control for MDP.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Kconfig             |   7 +
 drivers/clk/mediatek/Makefile            |   1 +
 drivers/clk/mediatek/clk-mt8196-mdpsys.c | 186 +++++++++++++++++++++++
 3 files changed, 194 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mdpsys.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 8e5cdae80748..68ac08cf8e82 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1024,6 +1024,13 @@ config COMMON_CLK_MT8196_MCUSYS
 	help
 	  This driver supports MediaTek MT8196 mcusys clocks.
 
+config COMMON_CLK_MT8196_MDPSYS
+	tristate "Clock driver for MediaTek MT8196 mdpsys"
+	depends on COMMON_CLK_MT8196
+	default COMMON_CLK_MT8196
+	help
+	  This driver supports MediaTek MT8196 mdpsys clocks.
+
 config COMMON_CLK_MT8196_PEXTPSYS
 	tristate "Clock driver for MediaTek MT8196 pextpsys"
 	depends on COMMON_CLK_MT8196
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 46358623c3e5..d2d8bc43e45b 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -155,6 +155,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-topckgen.o
 				   clk-mt8196-peri_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) += clk-mt8196-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) += clk-mt8196-mcu.o
+obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) += clk-mt8196-mdpsys.o
 obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
 obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
diff --git a/drivers/clk/mediatek/clk-mt8196-mdpsys.c b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
new file mode 100644
index 000000000000..a46b1627f1f3
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-mdpsys.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ *                    Guangjie Song <guangjie.song@mediatek.com>
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    Laura Nao <laura.nao@collabora.com>
+ */
+#include <dt-bindings/clock/mediatek,mt8196-clock.h>
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs mdp0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mdp1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs mdp2_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+#define GATE_MDP0(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &mdp0_cg_regs,			\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_MDP1(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &mdp1_cg_regs,			\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+#define GATE_MDP2(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &mdp2_cg_regs,			\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+static const struct mtk_gate mdp1_clks[] = {
+	/* MDP1-0 */
+	GATE_MDP0(CLK_MDP1_MDP_MUTEX0, "mdp1_mdp_mutex0", "mdp", 0),
+	GATE_MDP0(CLK_MDP1_SMI0, "mdp1_smi0", "mdp", 1),
+	GATE_MDP0(CLK_MDP1_APB_BUS, "mdp1_apb_bus", "mdp", 2),
+	GATE_MDP0(CLK_MDP1_MDP_RDMA0, "mdp1_mdp_rdma0", "mdp", 3),
+	GATE_MDP0(CLK_MDP1_MDP_RDMA1, "mdp1_mdp_rdma1", "mdp", 4),
+	GATE_MDP0(CLK_MDP1_MDP_RDMA2, "mdp1_mdp_rdma2", "mdp", 5),
+	GATE_MDP0(CLK_MDP1_MDP_BIRSZ0, "mdp1_mdp_birsz0", "mdp", 6),
+	GATE_MDP0(CLK_MDP1_MDP_HDR0, "mdp1_mdp_hdr0", "mdp", 7),
+	GATE_MDP0(CLK_MDP1_MDP_AAL0, "mdp1_mdp_aal0", "mdp", 8),
+	GATE_MDP0(CLK_MDP1_MDP_RSZ0, "mdp1_mdp_rsz0", "mdp", 9),
+	GATE_MDP0(CLK_MDP1_MDP_RSZ2, "mdp1_mdp_rsz2", "mdp", 10),
+	GATE_MDP0(CLK_MDP1_MDP_TDSHP0, "mdp1_mdp_tdshp0", "mdp", 11),
+	GATE_MDP0(CLK_MDP1_MDP_COLOR0, "mdp1_mdp_color0", "mdp", 12),
+	GATE_MDP0(CLK_MDP1_MDP_WROT0, "mdp1_mdp_wrot0", "mdp", 13),
+	GATE_MDP0(CLK_MDP1_MDP_WROT1, "mdp1_mdp_wrot1", "mdp", 14),
+	GATE_MDP0(CLK_MDP1_MDP_WROT2, "mdp1_mdp_wrot2", "mdp", 15),
+	GATE_MDP0(CLK_MDP1_MDP_FAKE_ENG0, "mdp1_mdp_fake_eng0", "mdp", 16),
+	GATE_MDP0(CLK_MDP1_APB_DB, "mdp1_apb_db", "mdp", 17),
+	GATE_MDP0(CLK_MDP1_MDP_DLI_ASYNC0, "mdp1_mdp_dli_async0", "mdp", 18),
+	GATE_MDP0(CLK_MDP1_MDP_DLI_ASYNC1, "mdp1_mdp_dli_async1", "mdp", 19),
+	GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC0, "mdp1_mdp_dlo_async0", "mdp", 20),
+	GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC1, "mdp1_mdp_dlo_async1", "mdp", 21),
+	GATE_MDP0(CLK_MDP1_MDP_DLI_ASYNC2, "mdp1_mdp_dli_async2", "mdp", 22),
+	GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC2, "mdp1_mdp_dlo_async2", "mdp", 23),
+	GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC3, "mdp1_mdp_dlo_async3", "mdp", 24),
+	GATE_MDP0(CLK_MDP1_IMG_DL_ASYNC0, "mdp1_img_dl_async0", "mdp", 25),
+	GATE_MDP0(CLK_MDP1_MDP_RROT0, "mdp1_mdp_rrot0", "mdp", 26),
+	GATE_MDP0(CLK_MDP1_MDP_MERGE0, "mdp1_mdp_merge0", "mdp", 27),
+	GATE_MDP0(CLK_MDP1_MDP_C3D0, "mdp1_mdp_c3d0", "mdp", 28),
+	GATE_MDP0(CLK_MDP1_MDP_FG0, "mdp1_mdp_fg0", "mdp", 29),
+	GATE_MDP0(CLK_MDP1_MDP_CLA2, "mdp1_mdp_cla2", "mdp", 30),
+	GATE_MDP0(CLK_MDP1_MDP_DLO_ASYNC4, "mdp1_mdp_dlo_async4", "mdp", 31),
+	/* MDP1-1 */
+	GATE_MDP1(CLK_MDP1_VPP_RSZ0, "mdp1_vpp_rsz0", "mdp", 0),
+	GATE_MDP1(CLK_MDP1_VPP_RSZ1, "mdp1_vpp_rsz1", "mdp", 1),
+	GATE_MDP1(CLK_MDP1_MDP_DLO_ASYNC5, "mdp1_mdp_dlo_async5", "mdp", 2),
+	GATE_MDP1(CLK_MDP1_IMG0, "mdp1_img0", "mdp", 3),
+	GATE_MDP1(CLK_MDP1_F26M, "mdp1_f26m", "clk26m", 27),
+	/* MDP1-2 */
+	GATE_MDP2(CLK_MDP1_IMG_DL_RELAY0, "mdp1_img_dl_relay0", "mdp", 0),
+	GATE_MDP2(CLK_MDP1_IMG_DL_RELAY1, "mdp1_img_dl_relay1", "mdp", 8),
+};
+
+static const struct mtk_clk_desc mdp1_mcd = {
+	.clks = mdp1_clks,
+	.num_clks = ARRAY_SIZE(mdp1_clks),
+	.need_runtime_pm = true,
+};
+
+
+static const struct mtk_gate mdp_clks[] = {
+	/* MDP0 */
+	GATE_MDP0(CLK_MDP_MDP_MUTEX0, "mdp_mdp_mutex0", "mdp", 0),
+	GATE_MDP0(CLK_MDP_SMI0, "mdp_smi0", "mdp", 1),
+	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp", 2),
+	GATE_MDP0(CLK_MDP_MDP_RDMA0, "mdp_mdp_rdma0", "mdp", 3),
+	GATE_MDP0(CLK_MDP_MDP_RDMA1, "mdp_mdp_rdma1", "mdp", 4),
+	GATE_MDP0(CLK_MDP_MDP_RDMA2, "mdp_mdp_rdma2", "mdp", 5),
+	GATE_MDP0(CLK_MDP_MDP_BIRSZ0, "mdp_mdp_birsz0", "mdp", 6),
+	GATE_MDP0(CLK_MDP_MDP_HDR0, "mdp_mdp_hdr0", "mdp", 7),
+	GATE_MDP0(CLK_MDP_MDP_AAL0, "mdp_mdp_aal0", "mdp", 8),
+	GATE_MDP0(CLK_MDP_MDP_RSZ0, "mdp_mdp_rsz0", "mdp", 9),
+	GATE_MDP0(CLK_MDP_MDP_RSZ2, "mdp_mdp_rsz2", "mdp", 10),
+	GATE_MDP0(CLK_MDP_MDP_TDSHP0, "mdp_mdp_tdshp0", "mdp", 11),
+	GATE_MDP0(CLK_MDP_MDP_COLOR0, "mdp_mdp_color0", "mdp", 12),
+	GATE_MDP0(CLK_MDP_MDP_WROT0, "mdp_mdp_wrot0", "mdp", 13),
+	GATE_MDP0(CLK_MDP_MDP_WROT1, "mdp_mdp_wrot1", "mdp", 14),
+	GATE_MDP0(CLK_MDP_MDP_WROT2, "mdp_mdp_wrot2", "mdp", 15),
+	GATE_MDP0(CLK_MDP_MDP_FAKE_ENG0, "mdp_mdp_fake_eng0", "mdp", 16),
+	GATE_MDP0(CLK_MDP_APB_DB, "mdp_apb_db", "mdp", 17),
+	GATE_MDP0(CLK_MDP_MDP_DLI_ASYNC0, "mdp_mdp_dli_async0", "mdp", 18),
+	GATE_MDP0(CLK_MDP_MDP_DLI_ASYNC1, "mdp_mdp_dli_async1", "mdp", 19),
+	GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC0, "mdp_mdp_dlo_async0", "mdp", 20),
+	GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC1, "mdp_mdp_dlo_async1", "mdp", 21),
+	GATE_MDP0(CLK_MDP_MDP_DLI_ASYNC2, "mdp_mdp_dli_async2", "mdp", 22),
+	GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC2, "mdp_mdp_dlo_async2", "mdp", 23),
+	GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC3, "mdp_mdp_dlo_async3", "mdp", 24),
+	GATE_MDP0(CLK_MDP_IMG_DL_ASYNC0, "mdp_img_dl_async0", "mdp", 25),
+	GATE_MDP0(CLK_MDP_MDP_RROT0, "mdp_mdp_rrot0", "mdp", 26),
+	GATE_MDP0(CLK_MDP_MDP_MERGE0, "mdp_mdp_merge0", "mdp", 27),
+	GATE_MDP0(CLK_MDP_MDP_C3D0, "mdp_mdp_c3d0", "mdp", 28),
+	GATE_MDP0(CLK_MDP_MDP_FG0, "mdp_mdp_fg0", "mdp", 29),
+	GATE_MDP0(CLK_MDP_MDP_CLA2, "mdp_mdp_cla2", "mdp", 30),
+	GATE_MDP0(CLK_MDP_MDP_DLO_ASYNC4, "mdp_mdp_dlo_async4", "mdp", 31),
+	/* MDP1 */
+	GATE_MDP1(CLK_MDP_VPP_RSZ0, "mdp_vpp_rsz0", "mdp", 0),
+	GATE_MDP1(CLK_MDP_VPP_RSZ1, "mdp_vpp_rsz1", "mdp", 1),
+	GATE_MDP1(CLK_MDP_MDP_DLO_ASYNC5, "mdp_mdp_dlo_async5", "mdp", 2),
+	GATE_MDP1(CLK_MDP_IMG0, "mdp_img0", "mdp", 3),
+	GATE_MDP1(CLK_MDP_F26M, "mdp_f26m", "clk26m", 27),
+	/* MDP2 */
+	GATE_MDP2(CLK_MDP_IMG_DL_RELAY0, "mdp_img_dl_relay0", "mdp", 0),
+	GATE_MDP2(CLK_MDP_IMG_DL_RELAY1, "mdp_img_dl_relay1", "mdp", 8),
+};
+
+static const struct mtk_clk_desc mdp_mcd = {
+	.clks = mdp_clks,
+	.num_clks = ARRAY_SIZE(mdp_clks),
+	.need_runtime_pm = true,
+};
+
+static const struct of_device_id of_match_clk_mt8196_mdpsys[] = {
+	{ .compatible = "mediatek,mt8196-mdpsys1", .data = &mdp1_mcd },
+	{ .compatible = "mediatek,mt8196-mdpsys0", .data = &mdp_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mdpsys);
+
+static struct platform_driver clk_mt8196_mdpsys_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8196-mdpsys",
+		.of_match_table = of_match_clk_mt8196_mdpsys,
+	},
+};
+module_platform_driver(clk_mt8196_mdpsys_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8196 Multimedia Data Path clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


