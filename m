Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2022CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgQXnLuYZP9qq+qDcEvs7smqNEhL8gzcKfKL9qKTQmU=; b=vne643aSUoXPhWbkIWC5W/Vu7Z
	5W50Q+ru3OohUitwtUg9bFfY+rk4/agsV8ZnuRZZ7wLIjIvnAbIBRoZaeEXRjNMFA32wF8N0nSPzd
	830ZivbbhIgSzNokNaPr36gJLMljrNNVMpc8IA6d3squ6dKDEx9e1DICO/Mp/hIBIdum3nUbhiLXe
	DihdduJTnnL7a69cv9gvOZ1ycdYo1CiSoALuFz0W74fhVyan8QXjCCYo6qXH7noKknKlEnZM82m/P
	pHfIYxVNWdcDxSpd0Wf+TlB+ltyTjIE4YpXnaTyTZHs6Ow90ZwboKfFDe/PvBQGRMSeqMI+7LVjlu
	tvBD7koQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfM3-0000000HSPn-09At;
	Thu, 12 Dec 2024 09:19:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfJA-0000000HRtQ-1LZp;
	Thu, 12 Dec 2024 09:16:33 +0000
X-UUID: 9b58bd60b86711ef9048ed6ed365623b-20241212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CgQXnLuYZP9qq+qDcEvs7smqNEhL8gzcKfKL9qKTQmU=;
	b=hcgm2wZQ8mLwNq5F2EANfnyzXt3Lp52aOQnFOnNbWYv+OthErvm/HVUuy22YYm3HdeGq3M46NIIrIbnATDJUnsk6nzv/k8d5w4H206hoAZoy+FfElhOsLHp/Gu0JTs4p5P3jQ8lwZ/8N6RNrDF0N+GPOrG/Le2GZK3v/hAnttVQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2bccf39b-b702-419b-9148-52aa767ed0f0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:6493067,CLOUDID:00fd0413-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:1,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9b58bd60b86711ef9048ed6ed365623b-20241212
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1122745954; Thu, 12 Dec 2024 02:00:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 12 Dec 2024 17:00:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 12 Dec 2024 17:00:56 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 1/2] memory/mediatek: Add an interface to get current DDR data rate
Date: Thu, 12 Dec 2024 16:59:47 +0800
Message-ID: <20241212090029.13692-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241212090029.13692-1-crystal.guo@mediatek.com>
References: <20241212090029.13692-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_011632_360220_61A5480D 
X-CRM114-Status: GOOD (  25.34  )
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
 drivers/memory/Kconfig                 |   1 +
 drivers/memory/Makefile                |   1 +
 drivers/memory/mediatek/Kconfig        |  21 ++
 drivers/memory/mediatek/Makefile       |   2 +
 drivers/memory/mediatek/mtk-dramc.c    | 325 +++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-dramc.h |  41 ++++
 6 files changed, 391 insertions(+)
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c
 create mode 100644 include/linux/soc/mediatek/mtk-dramc.h

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
index d2e6ca9abbe0..cf1091449d2e 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_STM32_FMC2_EBI)	+= stm32-fmc2-ebi.o
 
 obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
+obj-$(CONFIG_HAVE_MTK_MC)	+= mediatek/
 obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
 obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
 
diff --git a/drivers/memory/mediatek/Kconfig b/drivers/memory/mediatek/Kconfig
new file mode 100644
index 000000000000..00764cdb157e
--- /dev/null
+++ b/drivers/memory/mediatek/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config HAVE_MTK_MC
+	bool "MediaTek Memory Controller support"
+	help
+	  This option allows to enable MediaTek memory controller drivers,
+	  which may include controllers for DRAM or others.
+	  Select Y here if you need support for MediaTek memory controller.
+	  If you don't need, select N.
+
+if HAVE_MTK_MC
+
+config MTK_DRAMC
+	tristate "MediaTek DRAMC driver"
+	depends on HAVE_MTK_MC
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
index 000000000000..9c2c8e187a4a
--- /dev/null
+++ b/drivers/memory/mediatek/mtk-dramc.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/printk.h>
+#include <linux/io.h>
+#include <linux/soc/mediatek/mtk-dramc.h>
+
+static struct platform_device *dramc_pdev;
+static struct platform_driver dramc_drv;
+
+static int fmeter_init(struct platform_device *pdev,
+		       struct fmeter_dev_t *fmeter_dev_ptr, unsigned int fmeter_version)
+{
+	struct device_node *dramc_node = pdev->dev.of_node;
+	int ret;
+
+	ret = of_property_read_u32(dramc_node,
+				   "crystal-freq", &(fmeter_dev_ptr->crystal_freq));
+	ret |= of_property_read_u32(dramc_node,
+				    "shu-of", &(fmeter_dev_ptr->shu_of));
+	ret |= of_property_read_u32_array(dramc_node,
+					  "shu-lv", (unsigned int *)&(fmeter_dev_ptr->shu_lv), 3);
+	ret |= of_property_read_u32_array(dramc_node,
+					  "pll-id", (unsigned int *)&(fmeter_dev_ptr->pll_id), 3);
+	ret |= of_property_read_u32_array(dramc_node,
+					  "sdmpcw", (unsigned int *)(fmeter_dev_ptr->sdmpcw), 6);
+	ret |= of_property_read_u32_array(dramc_node,
+					  "posdiv", (unsigned int *)(fmeter_dev_ptr->posdiv), 6);
+	ret |= of_property_read_u32_array(dramc_node,
+					  "fbksel", (unsigned int *)(fmeter_dev_ptr->fbksel), 6);
+	ret |= of_property_read_u32_array(dramc_node,
+					  "dqsopen", (unsigned int *)(fmeter_dev_ptr->dqsopen), 6);
+	if (fmeter_version == 1) {
+		fmeter_dev_ptr->version = 1;
+		ret |= of_property_read_u32_array(dramc_node,
+			"async-ca", (unsigned int *)(fmeter_dev_ptr->async_ca), 6);
+		ret |= of_property_read_u32_array(dramc_node,
+			"dq-ser-mode", (unsigned int *)(fmeter_dev_ptr->dq_ser_mode), 6);
+	}
+	return ret;
+}
+
+static ssize_t dram_data_rate_show(struct device_driver *driver, char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "DRAM data rate = %d\n",
+		mtk_dramc_get_data_rate());
+}
+
+static DRIVER_ATTR_RO(dram_data_rate);
+
+static int dramc_probe(struct platform_device *pdev)
+{
+	struct device_node *dramc_node = pdev->dev.of_node;
+	struct dramc_dev_t *dramc_dev_ptr;
+	unsigned int fmeter_version;
+	struct resource *res;
+	unsigned int i, size;
+	int ret;
+
+	pr_info("%s: module probe.\n", __func__);
+	dramc_pdev = pdev;
+	dramc_dev_ptr = devm_kmalloc(&pdev->dev,
+				     sizeof(struct dramc_dev_t), GFP_KERNEL);
+
+	if (!dramc_dev_ptr)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(dramc_node,
+				   "support-ch-cnt", &dramc_dev_ptr->support_ch_cnt);
+	if (ret) {
+		pr_info("%s: get support_ch_cnt fail\n", __func__);
+		return -EINVAL;
+	}
+
+	dramc_dev_ptr->sleep_base = of_iomap(dramc_node,
+					     dramc_dev_ptr->support_ch_cnt * 4);
+	if (IS_ERR(dramc_dev_ptr->sleep_base)) {
+		pr_info("%s: unable to map sleep base\n", __func__);
+		return -EINVAL;
+	}
+
+	size = sizeof(phys_addr_t) * dramc_dev_ptr->support_ch_cnt;
+	dramc_dev_ptr->dramc_chn_base_ao = devm_kmalloc(&pdev->dev,
+							size, GFP_KERNEL);
+	if (!(dramc_dev_ptr->dramc_chn_base_ao))
+		return -ENOMEM;
+	dramc_dev_ptr->dramc_chn_base_nao = devm_kmalloc(&pdev->dev,
+							 size, GFP_KERNEL);
+	if (!(dramc_dev_ptr->dramc_chn_base_nao))
+		return -ENOMEM;
+	dramc_dev_ptr->ddrphy_chn_base_ao = devm_kmalloc(&pdev->dev,
+							 size, GFP_KERNEL);
+	if (!(dramc_dev_ptr->ddrphy_chn_base_ao))
+		return -ENOMEM;
+	dramc_dev_ptr->ddrphy_chn_base_nao = devm_kmalloc(&pdev->dev,
+							  size, GFP_KERNEL);
+	if (!(dramc_dev_ptr->ddrphy_chn_base_nao))
+		return -ENOMEM;
+
+	for (i = 0; i < dramc_dev_ptr->support_ch_cnt; i++) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		dramc_dev_ptr->dramc_chn_base_ao[i] =
+			devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(dramc_dev_ptr->dramc_chn_base_ao[i])) {
+			pr_info("%s: unable to map ch%d DRAMC AO base\n",
+				__func__, i);
+			return -EINVAL;
+		}
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM,
+					    i + dramc_dev_ptr->support_ch_cnt);
+		dramc_dev_ptr->dramc_chn_base_nao[i] =
+			devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(dramc_dev_ptr->dramc_chn_base_nao[i])) {
+			pr_info("%s: unable to map ch%d DRAMC NAO base\n",
+				__func__, i);
+			return -EINVAL;
+		}
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM,
+					    i + dramc_dev_ptr->support_ch_cnt * 2);
+		dramc_dev_ptr->ddrphy_chn_base_ao[i] =
+			devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(dramc_dev_ptr->ddrphy_chn_base_ao[i])) {
+			pr_info("%s: unable to map ch%d DDRPHY AO base\n",
+				__func__, i);
+			return -EINVAL;
+		}
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM,
+					    i + dramc_dev_ptr->support_ch_cnt * 3);
+		dramc_dev_ptr->ddrphy_chn_base_nao[i] =
+			devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(dramc_dev_ptr->ddrphy_chn_base_nao[i])) {
+			pr_info("%s: unable to map ch%d DDRPHY NAO base\n",
+				__func__, i);
+			return -EINVAL;
+		}
+	}
+
+	ret = of_property_read_u32(dramc_node, "fmeter-version", &fmeter_version);
+	if (ret) {
+		pr_info("%s: get fmeter_version fail\n", __func__);
+		return -EINVAL;
+	}
+	pr_info("%s: fmeter_version(%d)\n", __func__, fmeter_version);
+
+	if (fmeter_version == 1) {
+		dramc_dev_ptr->fmeter_dev_ptr = devm_kmalloc(&pdev->dev,
+							     sizeof(struct fmeter_dev_t),
+							     GFP_KERNEL);
+		if (!(dramc_dev_ptr->fmeter_dev_ptr)) {
+			pr_info("%s: memory  alloc fail\n", __func__);
+			return -ENOMEM;
+		}
+		ret = fmeter_init(pdev, dramc_dev_ptr->fmeter_dev_ptr, fmeter_version);
+		if (ret) {
+			pr_info("%s: fmeter_init fail\n", __func__);
+			return -EINVAL;
+		}
+	} else {
+		dramc_dev_ptr->fmeter_dev_ptr = NULL;
+	}
+	ret = driver_create_file(pdev->dev.driver, &driver_attr_dram_data_rate);
+	if (ret) {
+		pr_info("%s: fail to create dram_data_rate sysfs\n", __func__);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, dramc_dev_ptr);
+	pr_info("%s: DRAM data rate = %d\n", __func__,
+		mtk_dramc_get_data_rate());
+
+	return ret;
+}
+
+static unsigned int fmeter_v1(struct dramc_dev_t *dramc_dev_ptr)
+{
+	struct fmeter_dev_t *fmeter_dev_ptr =
+		(struct fmeter_dev_t *)dramc_dev_ptr->fmeter_dev_ptr;
+	unsigned int shu_lv_val;
+	unsigned int pll_id_val;
+	unsigned int sdmpcw_val;
+	unsigned int posdiv_val;
+	unsigned int ckdiv4_val;
+	unsigned int offset;
+	unsigned int vco_freq;
+	unsigned int fbksel;
+	unsigned int dqsopen;
+	unsigned int async_ca;
+	unsigned int dq_ser_mode;
+
+	shu_lv_val = (readl(dramc_dev_ptr->ddrphy_chn_base_ao[0] +
+		fmeter_dev_ptr->shu_lv.offset) &
+		fmeter_dev_ptr->shu_lv.mask) >>
+		fmeter_dev_ptr->shu_lv.shift;
+
+	pll_id_val = (readl(dramc_dev_ptr->ddrphy_chn_base_ao[0] +
+		fmeter_dev_ptr->pll_id.offset) &
+		fmeter_dev_ptr->pll_id.mask) >>
+		fmeter_dev_ptr->pll_id.shift;
+
+	offset = fmeter_dev_ptr->sdmpcw[pll_id_val].offset +
+		fmeter_dev_ptr->shu_of * shu_lv_val;
+	sdmpcw_val = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
+		fmeter_dev_ptr->sdmpcw[pll_id_val].mask) >>
+		fmeter_dev_ptr->sdmpcw[pll_id_val].shift;
+
+	offset = fmeter_dev_ptr->posdiv[pll_id_val].offset +
+		fmeter_dev_ptr->shu_of * shu_lv_val;
+	posdiv_val = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
+		fmeter_dev_ptr->posdiv[pll_id_val].mask) >>
+		fmeter_dev_ptr->posdiv[pll_id_val].shift;
+
+	offset = fmeter_dev_ptr->fbksel[pll_id_val].offset +
+		fmeter_dev_ptr->shu_of * shu_lv_val;
+	fbksel = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
+		fmeter_dev_ptr->fbksel[pll_id_val].mask) >>
+		fmeter_dev_ptr->fbksel[pll_id_val].shift;
+
+	offset = fmeter_dev_ptr->dqsopen[pll_id_val].offset +
+		fmeter_dev_ptr->shu_of * shu_lv_val;
+	dqsopen = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
+		fmeter_dev_ptr->dqsopen[pll_id_val].mask) >>
+		fmeter_dev_ptr->dqsopen[pll_id_val].shift;
+
+	offset = fmeter_dev_ptr->async_ca[pll_id_val].offset +
+		fmeter_dev_ptr->shu_of * shu_lv_val;
+	async_ca = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
+		fmeter_dev_ptr->async_ca[pll_id_val].mask) >>
+		fmeter_dev_ptr->async_ca[pll_id_val].shift;
+
+	offset = fmeter_dev_ptr->dq_ser_mode[pll_id_val].offset +
+		fmeter_dev_ptr->shu_of * shu_lv_val;
+	dq_ser_mode = (readl(dramc_dev_ptr->ddrphy_chn_base_nao[0] + offset) &
+		fmeter_dev_ptr->dq_ser_mode[pll_id_val].mask) >>
+		fmeter_dev_ptr->dq_ser_mode[pll_id_val].shift;
+	ckdiv4_val = (dq_ser_mode == 1); // 1: DIV4, 2: DIV8, 3: DIV16
+
+	posdiv_val &= ~(0x4);
+
+	vco_freq = ((fmeter_dev_ptr->crystal_freq) *
+		(sdmpcw_val >> 7)) >> posdiv_val >> 1 >> ckdiv4_val
+		<< fbksel;
+
+	if ((dqsopen == 1) && (async_ca == 1))
+		vco_freq >>= 1;
+
+	return vco_freq;
+}
+
+/*
+ * mtk_dramc_get_data_rate - calculate DRAM data rate
+ *
+ * Returns DRAM data rate (MB/s)
+ */
+unsigned int mtk_dramc_get_data_rate(void)
+{
+	struct dramc_dev_t *dramc_dev_ptr;
+	struct fmeter_dev_t *fmeter_dev_ptr;
+
+	if (!dramc_pdev)
+		return 0;
+
+	dramc_dev_ptr =
+		(struct dramc_dev_t *)platform_get_drvdata(dramc_pdev);
+
+	fmeter_dev_ptr = (struct fmeter_dev_t *)dramc_dev_ptr->fmeter_dev_ptr;
+	if (!fmeter_dev_ptr)
+		return 0;
+
+	if (fmeter_dev_ptr->version == 1)
+		return fmeter_v1(dramc_dev_ptr);
+	return 0;
+}
+EXPORT_SYMBOL(mtk_dramc_get_data_rate);
+
+static int dramc_remove(struct platform_device *pdev)
+{
+	dramc_pdev = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id dramc_of_ids[] = {
+	{.compatible = "mediatek,common-dramc",},
+	{}
+};
+
+static struct platform_driver dramc_drv = {
+	.probe = dramc_probe,
+	.remove = dramc_remove,
+	.driver = {
+		.name = "dramc_drv",
+		.owner = THIS_MODULE,
+		.of_match_table = dramc_of_ids,
+	},
+};
+
+static int __init dramc_drv_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&dramc_drv);
+	if (ret) {
+		pr_info("%s: init fail, ret 0x%x\n", __func__, ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+module_init(dramc_drv_init);
+
+MODULE_AUTHOR("Mediatek Corporation");
+MODULE_DESCRIPTION("MediaTek DRAMC Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/mediatek/mtk-dramc.h b/include/linux/soc/mediatek/mtk-dramc.h
new file mode 100644
index 000000000000..95e7dbfe7d0e
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk-dramc.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __MTK_DRAMC_H__
+#define __MTK_DRAMC_H__
+
+struct reg_ctrl_t {
+	unsigned int offset;
+	unsigned int mask;
+	unsigned int shift;
+};
+
+struct fmeter_dev_t {
+	unsigned int version;
+	unsigned int crystal_freq;
+	unsigned int shu_of;
+	struct reg_ctrl_t shu_lv;
+	struct reg_ctrl_t pll_id;
+	struct reg_ctrl_t sdmpcw[2];
+	struct reg_ctrl_t posdiv[2];
+	struct reg_ctrl_t fbksel[2];
+	struct reg_ctrl_t dqsopen[2];
+	struct reg_ctrl_t async_ca[2];
+	struct reg_ctrl_t dq_ser_mode[2];
+};
+
+struct dramc_dev_t {
+	unsigned int support_ch_cnt;
+	void __iomem **dramc_chn_base_ao;
+	void __iomem **dramc_chn_base_nao;
+	void __iomem **ddrphy_chn_base_ao;
+	void __iomem **ddrphy_chn_base_nao;
+	void __iomem *sleep_base;
+	void *fmeter_dev_ptr;
+};
+
+unsigned int mtk_dramc_get_data_rate(void);
+
+#endif /* __MTK_DRAMC_H__ */
-- 
2.18.0


