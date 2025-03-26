Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF56C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 06:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3M60JeCSn2pGOvEmA1Fg/RS61NlVnIgN2BJbNhjZiVQ=; b=RAepGovbEIy76zSPsQi2ppysml
	BV3D0UzABfbuCet4wAjENALaZuR5QNBudlQkEXDhF/c+ZIWYufLQilkQJgxO1lGE0Mgiq3DuoH77g
	6V2nEbqCBOUxubNy3LjZqwpaz/mDi5N5veRMnofLNIvBwrTyRVIQXjoj9fuDzvofTvmgVRxIOSa3D
	jc6pDq90jU+y2h46lnJ8/2FVbaDf8JgKcPJzjlpMacIgs6f70xA/UiFzKenjgkokd+H/UdGFc78aw
	IAcKJfNZ4/MhTSFaB4G2+s+mp+/pmuexjI71mxTWm5/69yZlJ20ECS1rZauM5D7rF83Omz2+C91U/
	CwlR+XMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKLM-00000007fcm-2j2V;
	Wed, 26 Mar 2025 06:34:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKHx-00000007fHV-0ebk;
	Wed, 26 Mar 2025 06:30:58 +0000
X-UUID: dd4add660a0b11f083f2a1c9db70dae0-20250325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3M60JeCSn2pGOvEmA1Fg/RS61NlVnIgN2BJbNhjZiVQ=;
	b=nWWFm+1bPcQGElpT3/llMBzTbYXXCnsH75bInltCxyQ58T3szPxuEtHBQxXgM6BV40HuDzK6oPTFUBhR+WKj40BgiZe2sQNK8qpNwkI/uj/olzAU3C/kex/+BFN65I3F/FpkdPz/SjHPYiDjMpFf19/yUXLKnYi4oN+HaTcFMTU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:182199df-aee3-4851-8090-b583ebb0a576,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:2355cfc6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dd4add660a0b11f083f2a1c9db70dae0-20250325
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 257998950; Tue, 25 Mar 2025 23:30:52 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 26 Mar 2025 14:30:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 26 Mar 2025 14:30:48 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v3,2/2] memory/mediatek: Add an interface to get current DDR data rate
Date: Wed, 26 Mar 2025 14:30:32 +0800
Message-ID: <20250326063041.7126-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250326063041.7126-1-crystal.guo@mediatek.com>
References: <20250326063041.7126-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_233057_200421_91402993 
X-CRM114-Status: GOOD (  22.85  )
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

Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 drivers/memory/Kconfig              |   1 +
 drivers/memory/Makefile             |   1 +
 drivers/memory/mediatek/Kconfig     |  21 +++
 drivers/memory/mediatek/Makefile    |   2 +
 drivers/memory/mediatek/mtk-dramc.c | 232 ++++++++++++++++++++++++++++
 5 files changed, 257 insertions(+)
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index c82d8d8a16ea..b1698549ff81 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -227,5 +227,6 @@ config STM32_FMC2_EBI
 
 source "drivers/memory/samsung/Kconfig"
 source "drivers/memory/tegra/Kconfig"
+source "drivers/memory/mediatek/Kconfig"
 
 endif
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index d2e6ca9abbe0..c0facf529803 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_STM32_FMC2_EBI)	+= stm32-fmc2-ebi.o
 
 obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
+obj-$(CONFIG_MEDIATEK_MC)	+= mediatek/
 obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
 obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
 
diff --git a/drivers/memory/mediatek/Kconfig b/drivers/memory/mediatek/Kconfig
new file mode 100644
index 000000000000..3f238e0d9647
--- /dev/null
+++ b/drivers/memory/mediatek/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config MEDIATEK_MC
+	bool "MediaTek Memory Controller support"
+	help
+	  This option allows to enable MediaTek memory controller drivers,
+	  which may include controllers for DRAM or others.
+	  Select Y here if you need support for MediaTek memory controller.
+	  If you don't need, select N.
+
+if MEDIATEK_MC
+
+config MTK_DRAMC
+	tristate "MediaTek DRAMC driver"
+	default y
+	help
+	  This option selects the MediaTek DRAMC driver, which provides
+	  an interface for reporting the current data rate of DRAM.
+	  Select Y here if you need support for the MediaTek DRAMC driver.
+	  If you don't need, select N.
+
+endif
diff --git a/drivers/memory/mediatek/Makefile b/drivers/memory/mediatek/Makefile
new file mode 100644
index 000000000000..a1395fc55b41
--- /dev/null
+++ b/drivers/memory/mediatek/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_MTK_DRAMC)		+= mtk-dramc.o
diff --git a/drivers/memory/mediatek/mtk-dramc.c b/drivers/memory/mediatek/mtk-dramc.c
new file mode 100644
index 000000000000..22042c9d8e42
--- /dev/null
+++ b/drivers/memory/mediatek/mtk-dramc.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+
+static unsigned int read_reg_field(void __iomem *base, unsigned int offset, unsigned int mask)
+{
+	unsigned int val = readl(base + offset);
+	unsigned int shift = __ffs(mask);
+
+	return (val & mask) >> shift;
+}
+
+struct mtk_dramc_pdata {
+	u8 fmeter_version;
+	u8 ref_freq_mhz;
+	const u16 *regs;
+	const u32 *masks;
+	u32 posdiv_purify;
+	u8 prediv;
+	u16 shuffle_offset;
+};
+
+struct mtk_dramc_dev_t {
+	void __iomem *anaphy_base;
+	void __iomem *ddrphy_base;
+	const struct mtk_dramc_pdata *pdata;
+};
+
+enum mtk_dramc_reg_index {
+	DRAMC_DPHY_DVFS_STA,
+	DRAMC_APHY_SHU_PHYPLL2,
+	DRAMC_APHY_SHU_CLRPLL2,
+	DRAMC_APHY_SHU_PHYPLL3,
+	DRAMC_APHY_SHU_CLRPLL3,
+	DRAMC_APHY_SHU_PHYPLL4,
+	DRAMC_APHY_ARPI0,
+	DRAMC_APHY_CA_ARDLL1,
+	DRAMC_APHY_B0_TX0,
+};
+
+enum mtk_dramc_mask_index {
+	DRAMC_DPHY_DVFS_SHU_LV,
+	DRAMC_DPHY_DVFS_PLL_SEL,
+	DRAMC_APHY_PLL2_SDMPCW,
+	DRAMC_APHY_PLL3_POSDIV,
+	DRAMC_APHY_PLL4_FBKSEL,
+	DRAMC_APHY_ARPI0_SOPEN,
+	DRAMC_APHY_ARDLL1_CK_EN,
+	DRAMC_APHY_B0_TX0_SER_MODE,
+};
+
+static const u16 mtk_dramc_regs_mt8196[] = {
+	[DRAMC_DPHY_DVFS_STA] = 0xe98,
+	[DRAMC_APHY_SHU_PHYPLL2] = 0x908,
+	[DRAMC_APHY_SHU_CLRPLL2] = 0x928,
+	[DRAMC_APHY_SHU_PHYPLL3] = 0x90c,
+	[DRAMC_APHY_SHU_CLRPLL3] = 0x92c,
+	[DRAMC_APHY_SHU_PHYPLL4] = 0x910,
+	[DRAMC_APHY_ARPI0] = 0x0d94,
+	[DRAMC_APHY_CA_ARDLL1] = 0x0d08,
+	[DRAMC_APHY_B0_TX0] = 0x0dc4,
+};
+
+static const u32 mtk_dramc_masks_mt8196[] = {
+	[DRAMC_DPHY_DVFS_SHU_LV] = GENMASK(15, 14),
+	[DRAMC_DPHY_DVFS_PLL_SEL] = GENMASK(25, 25),
+	[DRAMC_APHY_PLL2_SDMPCW] = GENMASK(18, 3),
+	[DRAMC_APHY_PLL3_POSDIV] = GENMASK(13, 11),
+	[DRAMC_APHY_PLL4_FBKSEL] = GENMASK(6, 6),
+	[DRAMC_APHY_ARPI0_SOPEN] = GENMASK(26, 26),
+	[DRAMC_APHY_ARDLL1_CK_EN] = GENMASK(0, 0),
+	[DRAMC_APHY_B0_TX0_SER_MODE] = GENMASK(4, 3),
+};
+
+static int mtk_dramc_probe(struct platform_device *pdev)
+{
+	struct mtk_dramc_dev_t *dramc;
+	const struct mtk_dramc_pdata *pdata;
+
+	dramc = devm_kzalloc(&pdev->dev, sizeof(struct mtk_dramc_dev_t), GFP_KERNEL);
+	if (!dramc)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Failed to allocate memory\n");
+
+	pdata = of_device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return dev_err_probe(&pdev->dev, -EINVAL, "No platform data available\n");
+
+	dramc->pdata = pdata;
+
+	dramc->anaphy_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(dramc->anaphy_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dramc->anaphy_base),
+				     "Unable to map ANAPHY base\n");
+
+	dramc->ddrphy_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(dramc->ddrphy_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dramc->ddrphy_base),
+				     "Unable to map DDRPHY base\n");
+
+	platform_set_drvdata(pdev, dramc);
+	return 0;
+}
+
+static unsigned int mtk_fmeter_v1(struct mtk_dramc_dev_t *dramc)
+{
+	const struct mtk_dramc_pdata *pdata = dramc->pdata;
+	unsigned int shu_level, pll_sel, offset;
+	unsigned int sdmpcw, posdiv, clkdiv, fbksel, sopen, async_ca, ser_mode;
+	unsigned int prediv_freq, posdiv_freq, vco_freq;
+	unsigned int final_rate;
+
+	shu_level = read_reg_field(dramc->ddrphy_base, pdata->regs[DRAMC_DPHY_DVFS_STA],
+				   pdata->masks[DRAMC_DPHY_DVFS_SHU_LV]);
+	pll_sel = read_reg_field(dramc->ddrphy_base, pdata->regs[DRAMC_DPHY_DVFS_STA],
+				 pdata->masks[DRAMC_DPHY_DVFS_PLL_SEL]);
+	offset = pdata->shuffle_offset * shu_level;
+
+	sdmpcw = read_reg_field(dramc->anaphy_base,
+				((pll_sel == 0) ?
+				pdata->regs[DRAMC_APHY_SHU_PHYPLL2] :
+				pdata->regs[DRAMC_APHY_SHU_CLRPLL2]) + offset,
+				pdata->masks[DRAMC_APHY_PLL2_SDMPCW]);
+	posdiv = read_reg_field(dramc->anaphy_base,
+				((pll_sel == 0) ?
+				pdata->regs[DRAMC_APHY_SHU_PHYPLL3] :
+				pdata->regs[DRAMC_APHY_SHU_CLRPLL3]) + offset,
+				pdata->masks[DRAMC_APHY_PLL3_POSDIV]);
+	fbksel = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_SHU_PHYPLL4] + offset,
+				pdata->masks[DRAMC_APHY_PLL4_FBKSEL]);
+	sopen = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_ARPI0] + offset,
+			       pdata->masks[DRAMC_APHY_ARPI0_SOPEN]);
+	async_ca = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_CA_ARDLL1] + offset,
+				  pdata->masks[DRAMC_APHY_ARDLL1_CK_EN]);
+	ser_mode = read_reg_field(dramc->anaphy_base, pdata->regs[DRAMC_APHY_B0_TX0] + offset,
+				  pdata->masks[DRAMC_APHY_B0_TX0_SER_MODE]);
+
+	clkdiv = (ser_mode == 1) ? 1 : 0;
+	posdiv &= ~(pdata->posdiv_purify);
+
+	prediv_freq = pdata->ref_freq_mhz * (sdmpcw >> pdata->prediv);
+	posdiv_freq = (prediv_freq >> posdiv) >> 1;
+	vco_freq = posdiv_freq << fbksel;
+	final_rate = vco_freq >> clkdiv;
+
+	if (sopen == 1 && async_ca == 1)
+		final_rate >>= 1;
+
+	return final_rate;
+}
+
+/*
+ * mtk_dramc_get_data_rate - calculate DRAM data rate
+ *
+ * Returns DRAM data rate (MB/s)
+ */
+static unsigned int mtk_dramc_get_data_rate(struct device *dev)
+{
+	struct mtk_dramc_dev_t *dramc_dev = dev_get_drvdata(dev);
+
+	if (!dramc_dev) {
+		dev_err(dev, "DRAMC device data not found\n");
+		return -EINVAL;
+	}
+
+	if (dramc_dev->pdata) {
+		if (dramc_dev->pdata->fmeter_version == 1)
+			return mtk_fmeter_v1(dramc_dev);
+
+		dev_err(dev, "Unsupported fmeter version\n");
+		return -EINVAL;
+	}
+	dev_err(dev, "DRAMC platform data not found\n");
+	return -EINVAL;
+}
+
+static ssize_t dram_data_rate_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "DRAM data rate = %u\n",
+			mtk_dramc_get_data_rate(dev));
+}
+
+static DEVICE_ATTR_RO(dram_data_rate);
+
+static struct attribute *mtk_dramc_attrs[] = {
+	&dev_attr_dram_data_rate.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(mtk_dramc);
+
+static const struct mtk_dramc_pdata dramc_pdata_mt8196 = {
+	.fmeter_version = 1,
+	.ref_freq_mhz = 26,
+	.regs = mtk_dramc_regs_mt8196,
+	.masks = mtk_dramc_masks_mt8196,
+	.posdiv_purify = BIT(2),
+	.prediv = 7,
+	.shuffle_offset = 0x700,
+};
+
+static const struct of_device_id mtk_dramc_of_ids[] = {
+	{ .compatible = "mediatek,mt8196-dramc", .data = &dramc_pdata_mt8196 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, mtk_dramc_of_ids);
+
+static struct platform_driver mtk_dramc_driver = {
+	.probe = mtk_dramc_probe,
+	.driver = {
+		.name = "mtk_dramc_drv",
+		.of_match_table = mtk_dramc_of_ids,
+		.dev_groups = mtk_dramc_groups,
+	},
+};
+
+module_platform_driver(mtk_dramc_driver);
+
+MODULE_AUTHOR("Crystal Guo <crystal.guo@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek DRAM Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.18.0


