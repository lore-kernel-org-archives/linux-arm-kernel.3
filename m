Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C674DC54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49h1VdeF+Zg75pYUFKdBO+lS3yePgIwfgX1PP2SoBhU=; b=TyTB/Bi3PZJObPNALY3Sa2rt94
	ZFYDjCeXM2g3FhTattl3HryrIr6oXpdvrV1avJglxOYvEUieHpXQTFdVGizLKyfe/7ChSOpsG8C7I
	nCnt7NhW0o7kPvJeoZrlGUw1q3IYWJ6Zt/uCQvKYutUE4URnPfHmxZ0LD0mCqkIrxh8JDozTJ6zGM
	MinIYeyBpB2/9sJDDm64UbFX+mJtX7qwZQfDZO2GGVeE64ZhBz5iQ9XxepwKe+ZqkyOfp1CNNbidP
	yHXjrbIv0Jt8GfGks7jJsh25x/q3JpRNJFfo8gdmGGGJaJ8XB9dDvkQGXSdUHQWTgUNoA9UvspYuS
	xL/X03LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxG-00000004mwV-0c9n;
	Tue, 28 Jul 2026 09:18:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxD-00000004muO-0qKW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:18:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cacb8416a1so34257545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230306; x=1785835106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49h1VdeF+Zg75pYUFKdBO+lS3yePgIwfgX1PP2SoBhU=;
        b=l3e+4nDecDTTKjReHuuYHFxuUwrvh3xc8FaVx0s99TbUGR3Dv0/CJXCxafiHxNaUEy
         zitzSNTR5zxdkPjB/GDSPY0hV3kJRTRs3wIB84UZ1LYpY/55GBZDIp19YLXybyyb8ZXy
         SOuhtcymZZMD1g4PUSp3RSJ0UKjACrT9RnYFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230306; x=1785835106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=49h1VdeF+Zg75pYUFKdBO+lS3yePgIwfgX1PP2SoBhU=;
        b=qX1Da8SQHCn6T1/VYShPt4ZMuNSf+oXg8sV+mJ9KrRxx/S5XMOV7tv1qClaINtrRq4
         GngldBq8BYW83KY6Zs60MC3Er8h7Wy+1N19HVbl1dCCk5XFNkP9J90IeBiCFdMTHY2mZ
         ugKgGQ03dNX1DhwYBEsUG4oy+gFSTPcMS4kZSK3FNzYTrjy+Yu4ZDpFgK+zNkZ3GNRr9
         Yx3mSs9htKorp5mKul0p4VtYXzmc/gx1QQegk9/UYv++JhQKusEQfkLuz1LOEjW3Nm7t
         4tTcoFDAyzCfwdbRSkBsJIwBWB0O7Y9CRr1OIKLSuFxjgpvF/VkB1jJ9tE34nuFtcNq4
         4ixw==
X-Forwarded-Encrypted: i=1; AHgh+RrSv9ath66OlcAYu3Ove72cFc+4huFoqbH0uqFKWRm0KmSonVFm60Tn9YOAODRqw18ZjAOHDG/xEqUfsVl3Cr4p@lists.infradead.org
X-Gm-Message-State: AOJu0YwJztzzpRqb8uG+rwUIx/fcDr8k/rl3dvp9+Q6IWFGXNi+aR+qy
	SQcPon8Cm0CL6I3PMkTmAmk/EybYfFckW3AjTSBzCdBBl9JvUJNqwZx+LAv5+Jc6Jw==
X-Gm-Gg: AR+sD10r1lq6jMwnpl3MReWnx0sJZAytArqU5fSaaYouNgBmr9YV2eovkryr7+fgem/
	VdlUxMRPPGQVxqZKHM4rTvO/bwGUxxACCobZ0xq8PZJwByG0mssWGfWTR4e7erJ08WNJDptJJQ7
	Vppfq5w07pGPnMHLbdw5WAjn3dzWAzRN3i47Mp6Iip8T0Somyj8lhN5YvYshlffuHbf22+ZY/OE
	Sz+XuMakTl1s4O5tFnun3V/3mveTV8FMZUCufTvbU7nnEeQcA6ggLNOTk33lkXiU4+PZEqprgMh
	pdzAXNGMSIvMF8b06X+cm0Q5nD+KEsa08BxMTvBi/QbC1lXgiItzd6or5QPItl0jHaAy2YBVWNJ
	cXejYINOehbT1p3Vj4Uh43iXsT/gh6ibJ/y4mNJzbk0C858GZDac0d7LDFzgohXV4ebh6/sqglb
	Qtl4XvGLxKYd47yTXlvQMxOBv3skApd18C2HF8fV3dWIAEeczp7w3BNJ76Xbk=
X-Received: by 2002:a17:903:2f0e:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2d015ac45camr19804365ad.3.1785230306195;
        Tue, 28 Jul 2026 02:18:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v4 2/5] clk: mediatek: Add mt8173-mfgtop driver
Date: Tue, 28 Jul 2026 17:18:00 +0800
Message-ID: <20260728091804.382753-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021827_253467_FBFE0C01 
X-CRM114-Status: GOOD (  28.57  )
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

The MFG (GPU) block on the MT8173 has a small glue layer, named MFG_TOP
in the datasheet, that contains clock gates, some power sequence signal
delays, and other unknown registers that get toggled when the GPU is
powered on.

The clock gates are exposed as clocks provided by a clock controller,
while the power sequencing bits are exposed as one singular power domain.

Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Changed pm_runtime_put() to pm_runtime_put_sync()
- Added missing of_node_put() in remove function

Changes since v2:
- Made COMMON_CLK_MT8173_MFGTOP depend on PM
  - Needed since the driver implements PM domains using the generic PM
    domain library, which also depends on PM
  - Fixes build breakage (kernel test robot)
- Fixed "RST_DELAY_CNT" name (Brian)
- Dropped unused mfg_desc (Brian)
- Added check of clk_prepare_enable()'s return value in
  clk_mt8173_mfgtop_power_on() (Brian)
- Saved error value for return in IS_ERR(data->clk_26m) branch
  (Dan Carpenter / kernel test robot w/ smatch)
---
 drivers/clk/mediatek/Kconfig             |  10 +
 drivers/clk/mediatek/Makefile            |   1 +
 drivers/clk/mediatek/clk-mt8173-mfgtop.c | 242 +++++++++++++++++++++++
 3 files changed, 253 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt8173-mfgtop.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 2c09fd729bab..8eea3766a910 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -537,6 +537,16 @@ config COMMON_CLK_MT8173_IMGSYS
 	help
 	  This driver supports MediaTek MT8173 imgsys clocks.
 
+config COMMON_CLK_MT8173_MFGTOP
+	tristate "Clock and power driver for MediaTek MT8173 mfgtop"
+	depends on COMMON_CLK_MT8173
+	depends on PM
+	default COMMON_CLK_MT8173
+	select PM_GENERIC_DOMAINS
+	select PM_GENERIC_DOMAINS_OF
+	help
+	  This driver supports MediaTek MT8173 mfgtop clocks and power domain.
+
 config COMMON_CLK_MT8173_MMSYS
        tristate "Clock driver for MediaTek MT8173 mmsys"
        depends on COMMON_CLK_MT8173
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index d8736a060dbd..892a54eeb281 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_COMMON_CLK_MT8167_VDECSYS) += clk-mt8167-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT8173) += clk-mt8173-apmixedsys.o clk-mt8173-infracfg.o \
 				   clk-mt8173-pericfg.o clk-mt8173-topckgen.o
 obj-$(CONFIG_COMMON_CLK_MT8173_IMGSYS) += clk-mt8173-img.o
+obj-$(CONFIG_COMMON_CLK_MT8173_MFGTOP) += clk-mt8173-mfgtop.o
 obj-$(CONFIG_COMMON_CLK_MT8173_MMSYS) += clk-mt8173-mm.o
 obj-$(CONFIG_COMMON_CLK_MT8173_VDECSYS) += clk-mt8173-vdecsys.o
 obj-$(CONFIG_COMMON_CLK_MT8173_VENCSYS) += clk-mt8173-vencsys.o
diff --git a/drivers/clk/mediatek/clk-mt8173-mfgtop.c b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
new file mode 100644
index 000000000000..5669ca9954dc
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt8173-mfgtop.c
@@ -0,0 +1,242 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 Google LLC
+ * Author: Chen-Yu Tsai <wenst@chromium.org>
+ *
+ * Based on driver in downstream ChromeOS v5.15 kernel.
+ *
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Chiawen Lee <chiawen.lee@mediatek.com>
+ */
+
+#include <dt-bindings/clock/mt8173-clk.h>
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs mfg_cg_regs = {
+	.sta_ofs = 0x0000,
+	.clr_ofs = 0x0008,
+	.set_ofs = 0x0004,
+};
+
+#define GATE_MFG(_id, _name, _parent, _shift, _flags)	\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfg_cg_regs, _shift, &mtk_clk_gate_ops_setclr, _flags)
+
+/* TODO: The block actually has dividers for the core and mem clocks. */
+static const struct mtk_gate mfg_clks[] = {
+	GATE_MFG(CLK_MFG_AXI, "mfg_axi", "axi_mfg_in_sel", 0, CLK_SET_RATE_PARENT),
+	GATE_MFG(CLK_MFG_MEM, "mfg_mem", "mem_mfg_in_sel", 1, CLK_SET_RATE_PARENT),
+	GATE_MFG(CLK_MFG_G3D, "mfg_g3d", "mfg_sel", 2, CLK_SET_RATE_PARENT),
+	GATE_MFG(CLK_MFG_26M, "mfg_26m", "clk26m", 3, 0),
+};
+
+struct mt8173_mfgtop_data {
+	struct clk_hw_onecell_data *clk_data;
+	struct regmap *regmap;
+	struct generic_pm_domain genpd;
+	struct of_phandle_args parent_pd, child_pd;
+	struct clk *clk_26m;
+};
+
+/* Delay count in clock cycles */
+#define MFG_ACTIVE_POWER_CON0	0x24
+ #define RST_B_DELAY_CNT	GENMASK(7, 0)	/* pwr_rst_b de-assert delay during power-up */
+ #define CLK_EN_DELAY_CNT	GENMASK(15, 8)	/* CLK_DIS deassert delay during power-up */
+ #define CLK_DIS_DELAY_CNT	GENMASK(23, 16)	/* CLK_DIS assert delay during power-down */
+ #define FORCE_ABORT		BIT(30)		/* write 1 to force abort a power event */
+ #define ACTIVE_PWRCTL_EN	BIT(31)		/* enable ACTIVE_POWER */
+
+#define MFG_ACTIVE_POWER_CON1	0x28
+ #define PWR_ON_S_DELAY_CNT	GENMASK(7, 0)	/* pwr_on_s assert delay during power-up */
+ #define ISO_DELAY_CNT		GENMASK(15, 8)	/* ISO assert delay during power-down */
+ #define ISOOFF_DELAY_CNT	GENMASK(23, 16)	/* ISO de-assert delay during power-up */
+ #define RST_DELAY_CNT		GENMASK(31, 24) /* pwr_rsb_b assert delay during power-down */
+
+static int clk_mt8173_mfgtop_power_on(struct generic_pm_domain *domain)
+{
+	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
+	int ret;
+
+	/* drives internal power management */
+	ret = clk_prepare_enable(data->clk_26m);
+	if (ret)
+		return ret;
+
+	/* Power on/off delays for various signals */
+	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON0,
+		     FIELD_PREP(RST_B_DELAY_CNT, 77) |
+		     FIELD_PREP(CLK_EN_DELAY_CNT, 61) |
+		     FIELD_PREP(CLK_DIS_DELAY_CNT, 60) |
+		     FIELD_PREP(ACTIVE_PWRCTL_EN, 0));
+	regmap_write(data->regmap, MFG_ACTIVE_POWER_CON1,
+		     FIELD_PREP(PWR_ON_S_DELAY_CNT, 11) |
+		     FIELD_PREP(ISO_DELAY_CNT, 68) |
+		     FIELD_PREP(ISOOFF_DELAY_CNT, 69) |
+		     FIELD_PREP(RST_DELAY_CNT, 77));
+
+	/* Magic numbers related to core switch sequence and delays */
+	regmap_write(data->regmap, 0xe0, 0x7a710184);
+	regmap_write(data->regmap, 0xe4, 0x835f6856);
+	regmap_write(data->regmap, 0xe8, 0x002b0234);
+	regmap_write(data->regmap, 0xec, 0x80000000);
+	regmap_write(data->regmap, 0xa0, 0x08000000);
+
+	return 0;
+}
+
+static int clk_mt8173_mfgtop_power_off(struct generic_pm_domain *domain)
+{
+	struct mt8173_mfgtop_data *data = container_of(domain, struct mt8173_mfgtop_data, genpd);
+
+	/* Magic numbers related to core switch sequence and delays */
+	regmap_write(data->regmap, 0xec, 0);
+
+	/* drives internal power management */
+	clk_disable_unprepare(data->clk_26m);
+
+	return 0;
+}
+
+static int clk_mt8173_mfgtop_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct mt8173_mfgtop_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, data);
+
+	data->clk_data = mtk_devm_alloc_clk_data(dev, ARRAY_SIZE(mfg_clks));
+	if (!data->clk_data)
+		return -ENOMEM;
+
+	/* MTK clock gates also uses regmap */
+	data->regmap = device_node_to_regmap(node);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap), "Failed to get regmap\n");
+
+	data->child_pd.np = node;
+	data->child_pd.args_count = 0;
+	ret = of_parse_phandle_with_args(node, "power-domains", "#power-domain-cells", 0,
+					 &data->parent_pd);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to parse power domain\n");
+
+	devm_pm_runtime_enable(dev);
+	/*
+	 * Do a pm_runtime_resume_and_get() to workaround a possible
+	 * deadlock between clk_register() and the genpd framework.
+	 */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to runtime resume device\n");
+		goto put_of_node;
+	}
+
+	ret = mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mfg_clks),
+				     data->clk_data);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register clock gates\n");
+		goto put_pm_runtime;
+	}
+
+	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
+	if (IS_ERR(data->clk_26m)) {
+		ret = dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
+		goto unregister_clks;
+	}
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
+		goto put_26m_clk;
+	}
+
+	data->genpd.name = "mfg-top";
+	data->genpd.power_on = clk_mt8173_mfgtop_power_on;
+	data->genpd.power_off = clk_mt8173_mfgtop_power_off;
+	ret = pm_genpd_init(&data->genpd, NULL, true);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add power domain\n");
+		goto del_clk_provider;
+	}
+
+	ret = of_genpd_add_provider_simple(node, &data->genpd);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to add power domain OF provider\n");
+		goto remove_pd;
+	}
+
+	ret = of_genpd_add_subdomain(&data->parent_pd, &data->child_pd);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to link PM domains\n");
+		goto del_pd_provider;
+	}
+
+	pm_runtime_put(dev);
+	return 0;
+
+del_pd_provider:
+	of_genpd_del_provider(node);
+remove_pd:
+	pm_genpd_remove(&data->genpd);
+del_clk_provider:
+	of_clk_del_provider(node);
+put_26m_clk:
+	clk_put(data->clk_26m);
+unregister_clks:
+	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
+put_pm_runtime:
+	pm_runtime_put_sync(dev);
+put_of_node:
+	of_node_put(data->parent_pd.np);
+	return ret;
+}
+
+static void clk_mt8173_mfgtop_remove(struct platform_device *pdev)
+{
+	struct mt8173_mfgtop_data *data = platform_get_drvdata(pdev);
+	struct device_node *node = pdev->dev.of_node;
+
+	of_genpd_remove_subdomain(&data->parent_pd, &data->child_pd);
+	of_genpd_del_provider(node);
+	pm_genpd_remove(&data->genpd);
+	of_clk_del_provider(node);
+	clk_put(data->clk_26m);
+	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
+	of_node_put(data->parent_pd.np);
+}
+
+static const struct of_device_id of_match_clk_mt8173_mfgtop[] = {
+	{ .compatible = "mediatek,mt8173-mfgtop" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt8173_mfgtop);
+
+static struct platform_driver clk_mt8173_mfgtop_drv = {
+	.probe = clk_mt8173_mfgtop_probe,
+	.remove = clk_mt8173_mfgtop_remove,
+	.driver = {
+		.name = "clk-mt8173-mfgtop",
+		.of_match_table = of_match_clk_mt8173_mfgtop,
+	},
+};
+module_platform_driver(clk_mt8173_mfgtop_drv);
+
+MODULE_DESCRIPTION("MediaTek MT8173 mfgtop clock driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0.229.g6434b31f56-goog


