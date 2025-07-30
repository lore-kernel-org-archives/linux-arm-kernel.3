Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13907C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frRJaI+/GFFJ/SpWR1yN9YcGhISQbzyqodYgVA9Qm04=; b=vdZ2WoIiyoVNDu/JO8JIdmAJHK
	a9NAh2Zjz55bsTB1dCDUYtXDRjYb5cXIw4l5bYjY2cD1/2Ur2gbpaRcSNHF/LnV1zNcCzxONuzPnE
	RWMStfi//8W9RXHwnO8EZOhR3/tZZvfyluIUtvOE7Loh5hK3LaYe34OP0nRVb//H9k96BYjfTIedG
	VkvGz0xDp+dWC1CP3dLuXsmTlJE73JXBk8PLpoquNlAX+7wtGi8xjC/70c1OUgfYDAWyS0Uue119i
	avZqFEjwVtohW6jjIjiJCTpt/U09xn5z14CSr6m6ckP9prcLzugS1R4oIs+QKkhBceGQJ+OYFhpZS
	TYJm4Beg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4rU-00000001KnE-20T1;
	Wed, 30 Jul 2025 11:20:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4Vp-00000001H4u-3mKv;
	Wed, 30 Jul 2025 10:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753873100;
	bh=bLdIhLFhvsupOFA5sbeUZ0llNwHAphTOBLLDMIPeDpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hoYvMW7c7h6P8Rwij3iJDK4aEL8/8qUmlc2tzHKaLfcbMPc5DkC6T3lhld9wyUFo5
	 C/76yRVkrElqtYxu4WjWSyRcq5bu765JI/6mi/NOCloF1jy2dZulIVDPgeu6Hc+Qp+
	 PENRur38kDKbnENN7pVDq3gggcFbqeS0Sq96H5McwrGuczdKsDfRMOb3yEw/Dmi78O
	 uJEpyhvZB9gpQxHqtlBPz8P2U6fTrQWLzcKovl2bhRiR1BgSZRVckBfx1wJ1JQByvh
	 O8T98H8kF/lyPPwxpgSwGHL69aJhDhjlce3loPSn+e8el6hTtcFAikwwPBydDH9z/+
	 MxkQ30vBvSESA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4db2:e926:c82d:3276])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77B8417E1439;
	Wed, 30 Jul 2025 12:58:19 +0200 (CEST)
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
Subject: [PATCH v3 10/27] clk: mediatek: Add MT8196 apmixedsys clock support
Date: Wed, 30 Jul 2025 12:56:36 +0200
Message-Id: <20250730105653.64910-11-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730105653.64910-1-laura.nao@collabora.com>
References: <20250730105653.64910-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_035822_235526_0BA279CE 
X-CRM114-Status: GOOD (  19.02  )
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

Add support for the MT8196 apmixedsys clock controller, which provides
PLLs generated from SoC 26m.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Kconfig                 |   8 +
 drivers/clk/mediatek/Makefile                |   1 +
 drivers/clk/mediatek/clk-mt8196-apmixedsys.c | 203 +++++++++++++++++++
 3 files changed, 212 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-apmixedsys.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index ff8a87112969..c55a7c8bdcc5 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1060,6 +1060,14 @@ config COMMON_CLK_MT8195_VENCSYS
 	help
 	  This driver supports MediaTek MT8195 vencsys clocks.
 
+config COMMON_CLK_MT8196
+	tristate "Clock driver for MediaTek MT8196"
+	depends on ARM64 || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
+	default ARCH_MEDIATEK
+	help
+	  This driver supports MediaTek MT8196 basic clocks.
+
 config COMMON_CLK_MT8365
 	tristate "Clock driver for MediaTek MT8365"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 73004e318702..b1773d2bcb3d 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -160,6 +160,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS) += clk-mt8195-vdo0.o clk-mt8195-vdo1.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) += clk-mt8195-venc.o
 obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) += clk-mt8195-vpp0.o clk-mt8195-vpp1.o
 obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) += clk-mt8195-wpe.o
+obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
 obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
 obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
diff --git a/drivers/clk/mediatek/clk-mt8196-apmixedsys.c b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
new file mode 100644
index 000000000000..4bd617d30295
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-apmixedsys.c
@@ -0,0 +1,203 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ *                    Guangjie Song <guangjie.song@mediatek.com>
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    Laura Nao <laura.nao@collabora.com>
+ */
+#include <dt-bindings/clock/mediatek,mt8196-clock.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-pll.h"
+
+/* APMIXEDSYS PLL control register offsets */
+#define MAINPLL_CON0	0x250
+#define MAINPLL_CON1	0x254
+#define UNIVPLL_CON0	0x264
+#define UNIVPLL_CON1	0x268
+#define MSDCPLL_CON0	0x278
+#define MSDCPLL_CON1	0x27c
+#define ADSPPLL_CON0	0x28c
+#define ADSPPLL_CON1	0x290
+#define EMIPLL_CON0	0x2a0
+#define EMIPLL_CON1	0x2a4
+#define EMIPLL2_CON0	0x2b4
+#define EMIPLL2_CON1	0x2b8
+#define NET1PLL_CON0	0x2c8
+#define NET1PLL_CON1	0x2cc
+#define SGMIIPLL_CON0	0x2dc
+#define SGMIIPLL_CON1	0x2e0
+
+/* APMIXEDSYS_GP2 PLL control register offsets*/
+#define MAINPLL2_CON0	0x250
+#define MAINPLL2_CON1	0x254
+#define UNIVPLL2_CON0	0x264
+#define UNIVPLL2_CON1	0x268
+#define MMPLL2_CON0	0x278
+#define MMPLL2_CON1	0x27c
+#define IMGPLL_CON0	0x28c
+#define IMGPLL_CON1	0x290
+#define TVDPLL1_CON0	0x2a0
+#define TVDPLL1_CON1	0x2a4
+#define TVDPLL2_CON0	0x2b4
+#define TVDPLL2_CON1	0x2b8
+#define TVDPLL3_CON0	0x2c8
+#define TVDPLL3_CON1	0x2cc
+
+#define PLLEN_ALL	0x080
+#define PLLEN_ALL_SET	0x084
+#define PLLEN_ALL_CLR	0x088
+
+#define FENC_STATUS_CON0	0x03c
+
+#define MT8196_PLL_FMAX		(3800UL * MHZ)
+#define MT8196_PLL_FMIN		(1500UL * MHZ)
+#define MT8196_INTEGER_BITS	8
+
+#define PLL_FENC(_id, _name, _reg, _fenc_sta_ofs, _fenc_sta_bit,\
+			_flags, _pd_reg, _pd_shift,		\
+			_pcw_reg, _pcw_shift, _pcwbits,		\
+			_pll_en_bit) {				\
+		.id = _id,					\
+		.name = _name,					\
+		.reg = _reg,					\
+		.fenc_sta_ofs = _fenc_sta_ofs,			\
+		.fenc_sta_bit = _fenc_sta_bit,			\
+		.flags = _flags,				\
+		.fmax = MT8196_PLL_FMAX,			\
+		.fmin = MT8196_PLL_FMIN,			\
+		.pd_reg = _pd_reg,				\
+		.pd_shift = _pd_shift,				\
+		.pcw_reg = _pcw_reg,				\
+		.pcw_shift = _pcw_shift,			\
+		.pcwbits = _pcwbits,				\
+		.pcwibits = MT8196_INTEGER_BITS,		\
+		.en_reg = PLLEN_ALL,				\
+		.en_set_reg = PLLEN_ALL_SET,			\
+		.en_clr_reg = PLLEN_ALL_CLR,			\
+		.pll_en_bit = _pll_en_bit,			\
+		.ops = &mtk_pll_fenc_clr_set_ops,		\
+}
+
+struct mtk_pll_desc {
+	const struct mtk_pll_data *clks;
+	size_t num_clks;
+};
+
+static const struct mtk_pll_data apmixed_plls[] = {
+	PLL_FENC(CLK_APMIXED_MAINPLL, "mainpll", MAINPLL_CON0, FENC_STATUS_CON0,
+		 7, PLL_AO, MAINPLL_CON1, 24, MAINPLL_CON1, 0, 22, 0),
+	PLL_FENC(CLK_APMIXED_UNIVPLL, "univpll", UNIVPLL_CON0, FENC_STATUS_CON0,
+		 6, 0, UNIVPLL_CON1, 24, UNIVPLL_CON1, 0, 22, 1),
+	PLL_FENC(CLK_APMIXED_MSDCPLL, "msdcpll", MSDCPLL_CON0, FENC_STATUS_CON0,
+		 5, 0, MSDCPLL_CON1, 24, MSDCPLL_CON1, 0, 22, 2),
+	PLL_FENC(CLK_APMIXED_ADSPPLL, "adsppll", ADSPPLL_CON0, FENC_STATUS_CON0,
+		 4, 0, ADSPPLL_CON1, 24, ADSPPLL_CON1, 0, 22, 3),
+	PLL_FENC(CLK_APMIXED_EMIPLL, "emipll", EMIPLL_CON0, FENC_STATUS_CON0, 3,
+		 PLL_AO, EMIPLL_CON1, 24, EMIPLL_CON1, 0, 22, 4),
+	PLL_FENC(CLK_APMIXED_EMIPLL2, "emipll2", EMIPLL2_CON0, FENC_STATUS_CON0,
+		 2, PLL_AO, EMIPLL2_CON1, 24, EMIPLL2_CON1, 0, 22, 5),
+	PLL_FENC(CLK_APMIXED_NET1PLL, "net1pll", NET1PLL_CON0, FENC_STATUS_CON0,
+		 1, 0, NET1PLL_CON1, 24, NET1PLL_CON1, 0, 22, 6),
+	PLL_FENC(CLK_APMIXED_SGMIIPLL, "sgmiipll", SGMIIPLL_CON0, FENC_STATUS_CON0,
+		 0, 0, SGMIIPLL_CON1, 24, SGMIIPLL_CON1, 0, 22, 7),
+};
+
+static const struct mtk_pll_desc apmixed_desc = {
+	.clks = apmixed_plls,
+	.num_clks = ARRAY_SIZE(apmixed_plls),
+};
+
+static const struct mtk_pll_data apmixed2_plls[] = {
+	PLL_FENC(CLK_APMIXED2_MAINPLL2, "mainpll2", MAINPLL2_CON0, FENC_STATUS_CON0,
+		 6, 0, MAINPLL2_CON1, 24, MAINPLL2_CON1, 0, 22, 0),
+	PLL_FENC(CLK_APMIXED2_UNIVPLL2, "univpll2", UNIVPLL2_CON0, FENC_STATUS_CON0,
+		 5, 0, UNIVPLL2_CON1, 24, UNIVPLL2_CON1, 0, 22, 1),
+	PLL_FENC(CLK_APMIXED2_MMPLL2, "mmpll2", MMPLL2_CON0, FENC_STATUS_CON0,
+		 4, 0, MMPLL2_CON1, 24, MMPLL2_CON1, 0, 22, 2),
+	PLL_FENC(CLK_APMIXED2_IMGPLL, "imgpll", IMGPLL_CON0, FENC_STATUS_CON0,
+		 3, 0, IMGPLL_CON1, 24, IMGPLL_CON1, 0, 22, 3),
+	PLL_FENC(CLK_APMIXED2_TVDPLL1, "tvdpll1", TVDPLL1_CON0, FENC_STATUS_CON0,
+		 2, 0, TVDPLL1_CON1, 24, TVDPLL1_CON1, 0, 22, 4),
+	PLL_FENC(CLK_APMIXED2_TVDPLL2, "tvdpll2", TVDPLL2_CON0, FENC_STATUS_CON0,
+		 1, 0, TVDPLL2_CON1, 24, TVDPLL2_CON1, 0, 22, 5),
+	PLL_FENC(CLK_APMIXED2_TVDPLL3, "tvdpll3", TVDPLL3_CON0, FENC_STATUS_CON0,
+		 0, 0, TVDPLL3_CON1, 24, TVDPLL3_CON1, 0, 22, 6),
+};
+
+static const struct mtk_pll_desc apmixed2_desc = {
+	.clks = apmixed2_plls,
+	.num_clks = ARRAY_SIZE(apmixed2_plls),
+};
+
+static int clk_mt8196_apmixed_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	const struct mtk_pll_desc *mcd;
+	int r;
+
+	mcd = device_get_match_data(&pdev->dev);
+	if (!mcd)
+		return -EINVAL;
+
+	clk_data = mtk_alloc_clk_data(mcd->num_clks);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_plls(node, mcd->clks, mcd->num_clks, clk_data);
+	if (r)
+		goto free_apmixed_data;
+
+	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (r)
+		goto unregister_plls;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	return r;
+
+unregister_plls:
+	mtk_clk_unregister_plls(mcd->clks, mcd->num_clks, clk_data);
+free_apmixed_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static void clk_mt8196_apmixed_remove(struct platform_device *pdev)
+{
+	const struct mtk_pll_desc *mcd = device_get_match_data(&pdev->dev);
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(mcd->clks, mcd->num_clks, clk_data);
+	mtk_free_clk_data(clk_data);
+}
+
+static const struct of_device_id of_match_clk_mt8196_apmixed[] = {
+	{ .compatible = "mediatek,mt8196-apmixedsys", .data = &apmixed_desc },
+	{ .compatible = "mediatek,mt8196-apmixedsys-gp2",
+	  .data = &apmixed2_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_apmixed);
+
+static struct platform_driver clk_mt8196_apmixed_drv = {
+	.probe = clk_mt8196_apmixed_probe,
+	.remove = clk_mt8196_apmixed_remove,
+	.driver = {
+		.name = "clk-mt8196-apmixed",
+		.of_match_table = of_match_clk_mt8196_apmixed,
+	},
+};
+module_platform_driver(clk_mt8196_apmixed_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8196 apmixedsys clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


