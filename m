Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8104FCAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pSYAmEawMPSlaPmEDHSKxSS5pll9/52AvfUuoIt0BM=; b=DENqZ2XmABB3yjjCOk7pf15hqG
	IxCJLMXpC3GfMNMqIEdSatYyzMoblGf5OjjxAI1w4pEcNaRXHuohnPUkZEcoBVVK4VYyU8QrcnIvy
	TqwL2fYzfUpXosY0a8p/y/4AxGpdLDOflmujIv95+AVC49phZjhMBrMiJXZQOL3idPFtGxJGdKnLu
	7kjzPqX3L0NjT/S8vVizo69EsL/W1whWokloEDouO1AQeMxnug3BjAvAfTMd/XTxfF1diwzRCuVQL
	r8ojCm6BZKx7BTIyhXpYj/rGce/bOMfiGJZZdYW2KI/ZNz7TqfCLOExRpbAFciQOd70Xjuf1vGeqj
	lP2kSX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyB1x-00000004tfh-02UY;
	Mon, 15 Sep 2025 15:22:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyB1V-00000004swH-2cSs;
	Mon, 15 Sep 2025 15:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757949703;
	bh=xZiTUJoml1PcEKEopIk/v+FM1m3yh+F+ryseknfNl+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pwhowDQ6cQcDh6TLX5jELj/EEHCOBkG9HO34mDv+RaS2KYjK/aFJbXQFJkmCYAQ3S
	 lcv4jMzvUG2xMNn9+Woh/H1zDmDAB/COFjeszWocvI0fUp7daxV7FptfT9orVIZGTd
	 wnH6qmGtrRbccP8R2cQSzEMDXtp1u3SW6Su9/4gtlZybwFpE+VeNh0ApqflPMkeTyb
	 hvVIY5FIsW4AlT4zgojcibL1OTBJrjhv2pnk0Ceb6sWC8bkmrZ3ZhMy4ZI6D5yZQZA
	 EFjLDaG6nLBJ/MkiqGCNazwmkX8zVd6JrzNRVS2bimq0ZE2uEyyxyxTBMOulCzHLru
	 5hw2qikG6ip4g==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:1c8d:f5ba:823d:730b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 938B917E046C;
	Mon, 15 Sep 2025 17:21:42 +0200 (CEST)
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
Subject: [PATCH v6 17/27] clk: mediatek: Add MT8196 I2C clock support
Date: Mon, 15 Sep 2025 17:19:37 +0200
Message-Id: <20250915151947.277983-18-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250915151947.277983-1-laura.nao@collabora.com>
References: <20250915151947.277983-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_082145_895591_A9A4BB6F 
X-CRM114-Status: GOOD (  16.08  )
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

Add support for the MT8196 I2C clock controller, which provides clock
gate control for I2C.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Kconfig                  |   7 ++
 drivers/clk/mediatek/Makefile                 |   1 +
 .../clk/mediatek/clk-mt8196-imp_iic_wrap.c    | 118 ++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index c977719046a4..fe2697b64ef0 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1010,6 +1010,13 @@ config COMMON_CLK_MT8196
 	help
 	  This driver supports MediaTek MT8196 basic clocks.
 
+config COMMON_CLK_MT8196_IMP_IIC_WRAP
+	tristate "Clock driver for MediaTek MT8196 imp_iic_wrap"
+	depends on COMMON_CLK_MT8196
+	default COMMON_CLK_MT8196
+	help
+	  This driver supports MediaTek MT8196 i2c clocks.
+
 config COMMON_CLK_MT8196_PEXTPSYS
 	tristate "Clock driver for MediaTek MT8196 pextpsys"
 	depends on COMMON_CLK_MT8196
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 88f7d8a229c2..241e7f5e7316 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -153,6 +153,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
 obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-topckgen.o \
 				   clk-mt8196-topckgen2.o clk-mt8196-vlpckgen.o \
 				   clk-mt8196-peri_ao.o
+obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) += clk-mt8196-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
 obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
diff --git a/drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c
new file mode 100644
index 000000000000..a63241671650
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-imp_iic_wrap.c
@@ -0,0 +1,118 @@
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
+static const struct mtk_gate_regs imp_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &imp_cg_regs,			\
+		.shift = _shift,			\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+		.ops = &mtk_clk_gate_ops_setclr,	\
+	}
+
+static const struct mtk_gate impc_clks[] = {
+	GATE_IMP(CLK_IMPC_I2C11, "impc_i2c11", "i2c_p", 0),
+	GATE_IMP(CLK_IMPC_I2C12, "impc_i2c12", "i2c_p", 1),
+	GATE_IMP(CLK_IMPC_I2C13, "impc_i2c13", "i2c_p", 2),
+	GATE_IMP(CLK_IMPC_I2C14, "impc_i2c14", "i2c_p", 3),
+};
+
+static const struct mtk_clk_desc impc_mcd = {
+	.clks = impc_clks,
+	.num_clks = ARRAY_SIZE(impc_clks),
+};
+
+static const struct mtk_gate impe_clks[] = {
+	GATE_IMP(CLK_IMPE_I2C5, "impe_i2c5", "i2c_east", 0),
+};
+
+static const struct mtk_clk_desc impe_mcd = {
+	.clks = impe_clks,
+	.num_clks = ARRAY_SIZE(impe_clks),
+};
+
+static const struct mtk_gate_regs impn_hwv_regs = {
+	.set_ofs = 0x0000,
+	.clr_ofs = 0x0004,
+	.sta_ofs = 0x2c00,
+};
+
+#define GATE_HWV_IMPN(_id, _name, _parent, _shift) {	\
+		.id = _id,				\
+		.name = _name,				\
+		.parent_name = _parent,			\
+		.regs = &imp_cg_regs,			\
+		.hwv_regs = &impn_hwv_regs,		\
+		.shift = _shift,			\
+		.ops = &mtk_clk_gate_hwv_ops_setclr,	\
+		.flags = CLK_OPS_PARENT_ENABLE,		\
+	}
+
+static const struct mtk_gate impn_clks[] = {
+	GATE_IMP(CLK_IMPN_I2C1, "impn_i2c1", "i2c_north", 0),
+	GATE_IMP(CLK_IMPN_I2C2, "impn_i2c2", "i2c_north", 1),
+	GATE_IMP(CLK_IMPN_I2C4, "impn_i2c4", "i2c_north", 2),
+	GATE_HWV_IMPN(CLK_IMPN_I2C7, "impn_i2c7", "i2c_north", 3),
+	GATE_IMP(CLK_IMPN_I2C8, "impn_i2c8", "i2c_north", 4),
+	GATE_IMP(CLK_IMPN_I2C9, "impn_i2c9", "i2c_north", 5),
+};
+
+static const struct mtk_clk_desc impn_mcd = {
+	.clks = impn_clks,
+	.num_clks = ARRAY_SIZE(impn_clks),
+};
+
+static const struct mtk_gate impw_clks[] = {
+	GATE_IMP(CLK_IMPW_I2C0, "impw_i2c0", "i2c_west", 0),
+	GATE_IMP(CLK_IMPW_I2C3, "impw_i2c3", "i2c_west", 1),
+	GATE_IMP(CLK_IMPW_I2C6, "impw_i2c6", "i2c_west", 2),
+	GATE_IMP(CLK_IMPW_I2C10, "impw_i2c10", "i2c_west", 3),
+};
+
+static const struct mtk_clk_desc impw_mcd = {
+	.clks = impw_clks,
+	.num_clks = ARRAY_SIZE(impw_clks),
+};
+
+static const struct of_device_id of_match_clk_mt8196_imp_iic_wrap[] = {
+	{ .compatible = "mediatek,mt8196-imp-iic-wrap-c", .data = &impc_mcd },
+	{ .compatible = "mediatek,mt8196-imp-iic-wrap-e", .data = &impe_mcd },
+	{ .compatible = "mediatek,mt8196-imp-iic-wrap-n", .data = &impn_mcd },
+	{ .compatible = "mediatek,mt8196-imp-iic-wrap-w", .data = &impw_mcd },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_imp_iic_wrap);
+
+static struct platform_driver clk_mt8196_imp_iic_wrap_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt8196-imp_iic_wrap",
+		.of_match_table = of_match_clk_mt8196_imp_iic_wrap,
+	},
+};
+module_platform_driver(clk_mt8196_imp_iic_wrap_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8196 I2C Wrapper clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


