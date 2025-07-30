Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ED1C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhsdzqKEnJnlYI1GmS4h5GfX7ZOFnkL47YV3JHC98D4=; b=1RVRtZlxp7em/Oo4T67vOhSX+S
	TtJzaSnzHOnpTucvIPIKTxyVw4A+14CIN6L/rXny4EWNXVMRF1h1GkxT+9ZG5nMQnRQ42L2UvUaYx
	xzo+FtE77gk/XiTy9nwvA5hg9d+Vvk+ubAm9iB1NdNAKWOc+MLemlRjfmHiaTohRuJ5bNMh5wvFWN
	7ryjasXb+d0kGLyLJv9QwSRldFUcJmKMdAJBIuxQECXWIKukKuKFnT/rvylFwmyWqosBWSvJeiCOx
	GwJLc2m17n9Aana6PD0Gh38E9xiw05tXtGPrRWeqt0znye7Q6FSHBLhQK2IpA0IPO4VeaGeUZ1oD/
	0AXHaWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5G3-00000001Nc9-2Acb;
	Wed, 30 Jul 2025 11:46:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4W3-00000001HAF-1MeM;
	Wed, 30 Jul 2025 10:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753873114;
	bh=P6lOWfJXlu4sXBtqu9+qc703no/4DoDYfCWebJsDNk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DeAGsRzNKUdZyu7ABzSDUBoAhXr9wPKaoFH7RrndbeX0P0Scky6DA+SKbziuwXmu5
	 H3pyItzInjVKykTXBc2IvuRAsg2mtj94mS1q9UTPzLjl3GtfEpvxHKgM4kIfFj4OlL
	 sKHMRasdp8isqh7/d0fhBJbabBtm+sfAmoQQYvS4JQvjKrkcF8OgoImoIDYDaa9oAv
	 tcs1HjHuNwNCoGJCQts7ObXxF00t4GVHxIU1egXaN7ZBeKhv481y6+F4VOWR/Qbbmj
	 DvmUENR2LevF+L6KBSzimaLWSbI4IHCcyj4AK0bchjSSM0aI217xxMWmUSrB4rdeA/
	 1oifvZvzAe0mA==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:4db2:e926:c82d:3276])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA51C17E1572;
	Wed, 30 Jul 2025 12:58:32 +0200 (CEST)
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
Subject: [PATCH v3 20/27] clk: mediatek: Add MT8196 mfg clock support
Date: Wed, 30 Jul 2025 12:56:46 +0200
Message-Id: <20250730105653.64910-21-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730105653.64910-1-laura.nao@collabora.com>
References: <20250730105653.64910-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_035835_509327_EA427735 
X-CRM114-Status: GOOD (  18.46  )
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

Add support for the MT8196 mfg clock controller, which provides PLL
control for the GPU.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/Kconfig          |   7 ++
 drivers/clk/mediatek/Makefile         |   1 +
 drivers/clk/mediatek/clk-mt8196-mfg.c | 149 ++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8196-mfg.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 8ae5a0546202..fd3514325b45 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -1089,6 +1089,13 @@ config COMMON_CLK_MT8196_MDPSYS
 	help
 	  This driver supports MediaTek MT8196 mdpsys clocks.
 
+config COMMON_CLK_MT8196_MFGCFG
+	tristate "Clock driver for MediaTek MT8196 mfgcfg"
+	depends on COMMON_CLK_MT8196
+	default m
+	help
+	  This driver supports MediaTek MT8196 mfgcfg clocks.
+
 config COMMON_CLK_MT8196_PEXTPSYS
 	tristate "Clock driver for MediaTek MT8196 pextpsys"
 	depends on COMMON_CLK_MT8196
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 5c327a7239bc..8a152c6e475f 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -166,6 +166,7 @@ obj-$(CONFIG_COMMON_CLK_MT8196) += clk-mt8196-apmixedsys.o clk-mt8196-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT8196_IMP_IIC_WRAP) += clk-mt8196-imp_iic_wrap.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MCUSYS) += clk-mt8196-mcu.o
 obj-$(CONFIG_COMMON_CLK_MT8196_MDPSYS) += clk-mt8196-mdpsys.o
+obj-$(CONFIG_COMMON_CLK_MT8196_MFGCFG) += clk-mt8196-mfg.o
 obj-$(CONFIG_COMMON_CLK_MT8196_PEXTPSYS) += clk-mt8196-pextp.o
 obj-$(CONFIG_COMMON_CLK_MT8196_UFSSYS) += clk-mt8196-ufs_ao.o
 obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365-apmixedsys.o clk-mt8365.o
diff --git a/drivers/clk/mediatek/clk-mt8196-mfg.c b/drivers/clk/mediatek/clk-mt8196-mfg.c
new file mode 100644
index 000000000000..f3b6cb35cb5a
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8196-mfg.c
@@ -0,0 +1,149 @@
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
+#define MFGPLL_CON0	0x008
+#define MFGPLL_CON1	0x00c
+#define MFGPLL_CON2	0x010
+#define MFGPLL_CON3	0x014
+#define MFGPLL_SC0_CON0	0x008
+#define MFGPLL_SC0_CON1	0x00c
+#define MFGPLL_SC0_CON2	0x010
+#define MFGPLL_SC0_CON3	0x014
+#define MFGPLL_SC1_CON0	0x008
+#define MFGPLL_SC1_CON1	0x00c
+#define MFGPLL_SC1_CON2	0x010
+#define MFGPLL_SC1_CON3	0x014
+
+#define MT8196_PLL_FMAX		(3800UL * MHZ)
+#define MT8196_PLL_FMIN		(1500UL * MHZ)
+#define MT8196_INTEGER_BITS	8
+
+#define PLL(_id, _name, _reg, _en_reg, _en_mask, _pll_en_bit,	\
+	    _flags, _rst_bar_mask,				\
+	    _pd_reg, _pd_shift, _tuner_reg,			\
+	    _tuner_en_reg, _tuner_en_bit,			\
+	    _pcw_reg, _pcw_shift, _pcwbits) {			\
+		.id = _id,					\
+		.name = _name,					\
+		.reg = _reg,					\
+		.en_reg = _en_reg,				\
+		.en_mask = _en_mask,				\
+		.pll_en_bit = _pll_en_bit,			\
+		.flags = _flags,				\
+		.rst_bar_mask = _rst_bar_mask,			\
+		.fmax = MT8196_PLL_FMAX,			\
+		.fmin = MT8196_PLL_FMIN,			\
+		.pd_reg = _pd_reg,				\
+		.pd_shift = _pd_shift,				\
+		.tuner_reg = _tuner_reg,			\
+		.tuner_en_reg = _tuner_en_reg,			\
+		.tuner_en_bit = _tuner_en_bit,			\
+		.pcw_reg = _pcw_reg,				\
+		.pcw_shift = _pcw_shift,			\
+		.pcwbits = _pcwbits,				\
+		.pcwibits = MT8196_INTEGER_BITS,		\
+	}
+
+static const struct mtk_pll_data mfg_ao_plls[] = {
+	PLL(CLK_MFG_AO_MFGPLL, "mfgpll", MFGPLL_CON0, MFGPLL_CON0, 0, 0, 0,
+	    BIT(0), MFGPLL_CON1, 24, 0, 0, 0,
+	    MFGPLL_CON1, 0, 22),
+};
+
+static const struct mtk_pll_data mfgsc0_ao_plls[] = {
+	PLL(CLK_MFGSC0_AO_MFGPLL_SC0, "mfgpll-sc0", MFGPLL_SC0_CON0,
+	    MFGPLL_SC0_CON0, 0, 0, 0, BIT(0), MFGPLL_SC0_CON1, 24, 0, 0, 0,
+	    MFGPLL_SC0_CON1, 0, 22),
+};
+
+static const struct mtk_pll_data mfgsc1_ao_plls[] = {
+	PLL(CLK_MFGSC1_AO_MFGPLL_SC1, "mfgpll-sc1", MFGPLL_SC1_CON0,
+	    MFGPLL_SC1_CON0, 0, 0, 0, BIT(0), MFGPLL_SC1_CON1, 24, 0, 0, 0,
+	    MFGPLL_SC1_CON1, 0, 22),
+};
+
+static const struct of_device_id of_match_clk_mt8196_mfg[] = {
+	{ .compatible = "mediatek,mt8196-mfgpll-pll-ctrl",
+	  .data = &mfg_ao_plls },
+	{ .compatible = "mediatek,mt8196-mfgpll-sc0-pll-ctrl",
+	  .data = &mfgsc0_ao_plls },
+	{ .compatible = "mediatek,mt8196-mfgpll-sc1-pll-ctrl",
+	  .data = &mfgsc1_ao_plls },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_mfg);
+
+static int clk_mt8196_mfg_probe(struct platform_device *pdev)
+{
+	const struct mtk_pll_data *plls;
+	struct clk_hw_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	const int num_plls = 1;
+	int r;
+
+	plls = of_device_get_match_data(&pdev->dev);
+	if (!plls)
+		return -EINVAL;
+
+	clk_data = mtk_alloc_clk_data(num_plls);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_plls(node, plls, num_plls, clk_data);
+	if (r)
+		goto free_clk_data;
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
+	mtk_clk_unregister_plls(plls, num_plls, clk_data);
+free_clk_data:
+	mtk_free_clk_data(clk_data);
+
+	return r;
+}
+
+static void clk_mt8196_mfg_remove(struct platform_device *pdev)
+{
+	const struct mtk_pll_data *plls = of_device_get_match_data(&pdev->dev);
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(plls, 1, clk_data);
+	mtk_free_clk_data(clk_data);
+}
+
+static struct platform_driver clk_mt8196_mfg_drv = {
+	.probe = clk_mt8196_mfg_probe,
+	.remove = clk_mt8196_mfg_remove,
+	.driver = {
+		.name = "clk-mt8196-mfg",
+		.of_match_table = of_match_clk_mt8196_mfg,
+	},
+};
+module_platform_driver(clk_mt8196_mfg_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8196 GPU mfg clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5


