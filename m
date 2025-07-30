Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5271C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 12:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkLQCyU6G4p8OD11CGpE76i95meWE5qnfBf7Ha+JRJ4=; b=vIO+I/CyUctXnlgoQIfZEFIoht
	xTnBALiy0CEme/yg2dSZo7bmmRDiCwLZS3c3XpdV2xlpQcNjCioVTTx7N3V6aqoPDKO8GLoHYIPLd
	qvRBXfPFbHHwFYzNvuhpnQm6ZhWWLun13wn6k/WE45xPpE0bfr5MvTNaE5TEKtDCy+qlaKMVRcdX0
	7H0P5QTjRXYPt/BIl2hZ0YB0gb3dddg0lsb5UCOhVAQHzA2sTGJ4KTWn0GLY54vRQQwrJUqtoKHzE
	YQf2TQbHpbECFwmJ5JO2XZmDstx2JTy5dpcRCiWQxXnaQ7J9NszZBNzXcsRxhdCqwAPcrlt3rAnOW
	J32fjiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5Un-00000001PHm-2qxE;
	Wed, 30 Jul 2025 12:01:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4WB-00000001HE3-1vDq;
	Wed, 30 Jul 2025 10:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753873122;
	bh=eZYo/RXi2oEUbgKJl7ypUjggvlCGovI8M0gGf2Ej3+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E5qoLfuMxGNc3Sxi67nWaTxSBMUzn/bb6A+AOyD8WrnKZqqDg11a6jEZTEYcqnP8F
	 qd27A9xdOGWYSqBOSe0kPT2h4UlcRdQx9KJycfjZoS7BGk3Ufw0CullLuiZEfadNuQ
	 UsoJYnC1VtvNht/cgPE3fa1X7dwStjUyver6jqVtWCXtTOZDSTBQYFWkDd2FOS+LOs
	 awO2/HUnuHzd1JixB1KxxP3mdneVLVyAKa50NC9aOyV62M+Bi3VoZu/6GuuEjKJvoV
	 bX0TQ6O4MDJKuGh73+HUbDJ6SK0Lqqj2AiS0Dx1Yx6hvCeMJyJr3NnD4Blm1JXRDjU
	 bKq7cOimAYBmw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4db2:e926:c82d:3276])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF72F17E1439;
	Wed, 30 Jul 2025 12:58:40 +0200 (CEST)
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
Subject: [PATCH v3 26/27] clk: mediatek: Add MT8196 vdecsys clock support
Date: Wed, 30 Jul 2025 12:56:52 +0200
Message-Id: <20250730105653.64910-27-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730105653.64910-1-laura.nao@collabora.com>
References: <20250730105653.64910-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_035843_674530_FD2DEC4A 
X-CRM114-Status: GOOD (  16.87  )
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

Add support for the MT8196 vdecsys clock controller, which provides
clock gate control for the video decoder.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Kconfig           |   7 +
 drivers/clk/mediatek/Makefile          |   1 +
 drivers/clk/mediatek/clk-mt8196-vdec.c | 253 +++++++++++++++++++++++++
 3 files changed, 261 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-vdec.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 81c2df501844..4c7f6715ed63 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1117,6 +1117,13 @@ config COMMON_CLK_MT8196_UFSSYS
 	help
 	  This driver supports MediaTek MT8196 ufssys clocks.
 
+config COMMON_CLK_MT8196_VDECSYS
+	tristate "Clock driver for MediaTek MT8196 vdecsys"
+	depends on COMMON_CLK_MT8196
+	default m
+	help
+	  This driver supports MediaTek MT8196 vdecsys clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 7e8d7d5fce68..54e895b73ecf 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196_MMSYS) += clk-mt8196-disp0.o clk-mt8196-disp1.o c
 					 clk-mt8196-ovl0.o clk-mt8196-ovl1.o
 obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
 obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8196_VDECSYS) += clk-mt8196-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-vdec.c b/drivers/clk/mediatek/clk-mt8196-vdec.c
new file mode 100644
index 000000000000..9de07a6c0db7
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-vdec.c
@@ -0,0 +1,253 @@
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
+static const struct mtk_gate_regs vde20_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vde20_hwv_regs = {
+	.set_ofs = 0x0088,
+	.clr_ofs = 0x008c,
+	.sta_ofs = 0x2c44,
+};
+
+static const struct mtk_gate_regs vde21_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vde21_hwv_regs = {
+	.set_ofs = 0x0080,
+	.clr_ofs = 0x0084,
+	.sta_ofs = 0x2c40,
+};
+
+static const struct mtk_gate_regs vde22_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+static const struct mtk_gate_regs vde22_hwv_regs = {
+	.set_ofs = 0x0078,
+	.clr_ofs = 0x007c,
+	.sta_ofs = 0x2c3c,
+};
+
+#define GATE_HWV_VDE20(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &vde20_cg_regs,			\
+		.hwv_regs = &vde20_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_HWV_VDE21(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &vde21_cg_regs,			\
+		.hwv_regs = &vde21_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_HWV_VDE22(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &vde22_cg_regs,			\
+		.hwv_regs = &vde22_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
+		.flags = CLK_OPS_PARENT_ENABLE |	\
+			 CLK_IGNORE_UNUSED,		\
+	}
+
+static const struct mtk_gate vde2_clks[] = {
+	/* VDE20 */
+	GATE_HWV_VDE20(CLK_VDE2_VDEC_CKEN, "vde2_vdec_cken", "vdec", 0),
+	GATE_HWV_VDE20(CLK_VDE2_VDEC_ACTIVE, "vde2_vdec_active", "vdec", 4),
+	GATE_HWV_VDE20(CLK_VDE2_VDEC_CKEN_ENG, "vde2_vdec_cken_eng", "vdec", 8),
+	/* VDE21 */
+	GATE_HWV_VDE21(CLK_VDE2_LAT_CKEN, "vde2_lat_cken", "vdec", 0),
+	GATE_HWV_VDE21(CLK_VDE2_LAT_ACTIVE, "vde2_lat_active", "vdec", 4),
+	GATE_HWV_VDE21(CLK_VDE2_LAT_CKEN_ENG, "vde2_lat_cken_eng", "vdec", 8),
+	/* VDE22 */
+	GATE_HWV_VDE22(CLK_VDE2_LARB1_CKEN, "vde2_larb1_cken", "vdec", 0),
+};
+
+static const struct mtk_clk_desc vde2_mcd = {
+	.clks = vde2_clks,
+	.num_clks = ARRAY_SIZE(vde2_clks),
+	.need_runtime_pm = true,
+};
+
+static const struct mtk_gate_regs vde10_hwv_regs = {
+	.set_ofs = 0x00a0,
+	.clr_ofs = 0x00a4,
+	.sta_ofs = 0x2c50,
+};
+
+static const struct mtk_gate_regs vde11_cg_regs = {
+	.set_ofs = 0x1e0,
+	.clr_ofs = 0x1e0,
+	.sta_ofs = 0x1e0,
+};
+
+static const struct mtk_gate_regs vde11_hwv_regs = {
+	.set_ofs = 0x00b0,
+	.clr_ofs = 0x00b4,
+	.sta_ofs = 0x2c58,
+};
+
+static const struct mtk_gate_regs vde12_cg_regs = {
+	.set_ofs = 0x1ec,
+	.clr_ofs = 0x1ec,
+	.sta_ofs = 0x1ec,
+};
+
+static const struct mtk_gate_regs vde12_hwv_regs = {
+	.set_ofs = 0x00a8,
+	.clr_ofs = 0x00ac,
+	.sta_ofs = 0x2c54,
+};
+
+static const struct mtk_gate_regs vde13_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vde13_hwv_regs = {
+	.set_ofs = 0x0098,
+	.clr_ofs = 0x009c,
+	.sta_ofs = 0x2c4c,
+};
+
+static const struct mtk_gate_regs vde14_hwv_regs = {
+	.set_ofs = 0x0090,
+	.clr_ofs = 0x0094,
+	.sta_ofs = 0x2c48,
+};
+
+#define GATE_HWV_VDE10(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &vde20_cg_regs,			\
+		.hwv_regs = &vde10_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_HWV_VDE11(_id, _name, _parent, _shift) {		\
+		.id = _id,					\
+		.name = _name,					\
+		.parent_name = _parent,				\
+		.regs = &vde11_cg_regs,				\
+		.hwv_regs = &vde11_hwv_regs,			\
+		.shift = _shift,				\
+		.ops = &mtk_clk_gate_hwv_ops_setclr_inv,	\
+		.flags = CLK_OPS_PARENT_ENABLE,			\
+	}
+
+#define GATE_HWV_VDE12(_id, _name, _parent, _shift) {		\
+		.id = _id,					\
+		.name = _name,					\
+		.parent_name = _parent,				\
+		.regs = &vde12_cg_regs,				\
+		.hwv_regs = &vde12_hwv_regs,			\
+		.shift = _shift,				\
+		.ops = &mtk_clk_gate_hwv_ops_setclr_inv,	\
+		.flags = CLK_OPS_PARENT_ENABLE			\
+	}
+
+#define GATE_HWV_VDE13(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &vde13_cg_regs,			\
+		.hwv_regs = &vde13_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+#define GATE_HWV_VDE14(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &vde22_cg_regs,			\
+		.hwv_regs = &vde14_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr_inv,\
+		.flags = CLK_OPS_PARENT_ENABLE |	\
+			 CLK_IGNORE_UNUSED,		\
+	}
+
+static const struct mtk_gate vde1_clks[] = {
+	/* VDE10 */
+	GATE_HWV_VDE10(CLK_VDE1_VDEC_CKEN, "vde1_vdec_cken", "vdec", 0),
+	GATE_HWV_VDE10(CLK_VDE1_VDEC_ACTIVE, "vde1_vdec_active", "vdec", 4),
+	GATE_HWV_VDE10(CLK_VDE1_VDEC_CKEN_ENG, "vde1_vdec_cken_eng", "vdec", 8),
+	/* VDE11 */
+	GATE_HWV_VDE11(CLK_VDE1_VDEC_SOC_IPS_EN, "vde1_vdec_soc_ips_en", "vdec", 0),
+	/* VDE12 */
+	GATE_HWV_VDE12(CLK_VDE1_VDEC_SOC_APTV_EN, "vde1_aptv_en", "ck_tck_26m_mx9_ck", 0),
+	GATE_HWV_VDE12(CLK_VDE1_VDEC_SOC_APTV_TOP_EN, "vde1_aptv_topen", "ck_tck_26m_mx9_ck", 1),
+	/* VDE13 */
+	GATE_HWV_VDE13(CLK_VDE1_LAT_CKEN, "vde1_lat_cken", "vdec", 0),
+	GATE_HWV_VDE13(CLK_VDE1_LAT_ACTIVE, "vde1_lat_active", "vdec", 4),
+	GATE_HWV_VDE13(CLK_VDE1_LAT_CKEN_ENG, "vde1_lat_cken_eng", "vdec", 8),
+	/* VDE14 */
+	GATE_HWV_VDE14(CLK_VDE1_LARB1_CKEN, "vde1_larb1_cken", "vdec", 0),
+};
+
+static const struct mtk_clk_desc vde1_mcd = {
+	.clks = vde1_clks,
+	.num_clks = ARRAY_SIZE(vde1_clks),
+	.need_runtime_pm = true,
+};
+
+static const struct of_device_id of_match_clk_mt8196_vdec[] = {
+	{ .compatible = "mediatek,mt8196-vdecsys", .data = &vde2_mcd },
+	{ .compatible = "mediatek,mt8196-vdecsys-soc", .data = &vde1_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vdec);
+
+static struct platform_driver clk_mt8196_vdec_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8196-vdec",
+		.of_match_table = of_match_clk_mt8196_vdec,
+	},
+};
+module_platform_driver(clk_mt8196_vdec_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8196 Video Decoders clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


