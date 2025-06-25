Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADC3C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 03:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0KBGm2Z9iLRXAIDe5VoGTTaKpckXActfWq12mD0U20=; b=0eu68UTd2rgxPAVIB3exu39526
	TRk2znnlPVQgKaanjenvKJN9eaf6vae8xTueCbGtA8LuunlPvdOxqaaPp3KK8xqFI/WKQxEt65TgR
	CY4/eKTXz4t1DW3KKG3RBsrRdcF3Z/1its42pA8vj9ZaYTQUQqCY2EeNNtQt7eTeGQImyRdilfebD
	YSTPA/KScn9QVuUD4rLpli+mChkCfJmcGxZKkc3oBB5UeQlpYdLJ2PwR+QntGGkALx/KwXT68yzbb
	BnFPJu9KuUBC0Zl+ZcTRnePyO1qtQIWnLL6Z6J24u5VT7va7ArvzaYQ5PLbB8LPga8ob3DOp0+XP/
	z5CFu/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcqp-0000000AV3M-2Q6L;
	Thu, 26 Jun 2025 03:00:35 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcUu-0000000ASac-05OT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 02:37:58 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250626023754epoutp0156c3b8a1bf851360b48bc4268fc18e7e~Md0CWXwtC0838208382epoutp01A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:37:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250626023754epoutp0156c3b8a1bf851360b48bc4268fc18e7e~Md0CWXwtC0838208382epoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750905474;
	bh=z0KBGm2Z9iLRXAIDe5VoGTTaKpckXActfWq12mD0U20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=klTNCORwMgow+itX6xFE6Az9oyh3P5GJ4Qm5ERkWR7jpzWABJu1pjbpKXWoA8Ozpi
	 mSTgbL1XXfR0H10n97ptalIE8Q/lYXWNLbkWGul7qJXw5VuVxYSW4h0isJpSlLy1Qy
	 2Zy3p0ka/lk+2SACL2WXVffDXU9DdQfB5Flwp0WY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250626023753epcas5p24213f30c5d8fe7065b5ef595c4d66640~Md0Bxd52J3175331753epcas5p2t;
	Thu, 26 Jun 2025 02:37:53 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.180]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bSNC34p2Xz6B9mF; Thu, 26 Jun
	2025 02:37:51 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250625165327epcas5p2c51b6032a6439cd1a7a884b360be1354~MV1wB36CA0634006340epcas5p2J;
	Wed, 25 Jun 2025 16:53:27 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625165324epsmtip298c2ff07671bc186e195912ba4e23ca2~MV1tSs9zM1750917509epsmtip2X;
	Wed, 25 Jun 2025 16:53:24 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-fsd@tesla.com
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
Date: Wed, 25 Jun 2025 22:22:28 +0530
Message-ID: <20250625165229.3458-10-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625165229.3458-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625165327epcas5p2c51b6032a6439cd1a7a884b360be1354
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625165327epcas5p2c51b6032a6439cd1a7a884b360be1354
References: <20250625165229.3458-1-shradha.t@samsung.com>
	<CGME20250625165327epcas5p2c51b6032a6439cd1a7a884b360be1354@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_193756_366164_FD7DF5E9 
X-CRM114-Status: GOOD (  28.24  )
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

Add host and endpoint controller driver support for FSD SoC.

Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 331 +++++++++++++++++++++++-
 1 file changed, 323 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index dff23cf648f5..5b525156b9f5 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -20,6 +20,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 
 #include "pcie-designware.h"
 
@@ -49,17 +51,46 @@
 #define EXYNOS_PCIE_ELBI_SLV_ARMISC		0x120
 #define EXYNOS_PCIE_ELBI_SLV_DBI_ENABLE		BIT(21)
 
+#define FSD_IRQ2_STS				0x008
+#define FSD_IRQ_MSI_ENABLE			BIT(17)
+#define FSD_IRQ2_EN				0x018
+#define FSD_PCIE_APP_LTSSM_ENABLE		0x054
+#define FSD_PCIE_LTSSM_ENABLE			0x1
+#define FSD_PCIE_DEVICE_TYPE			0x080
+#define FSD_DEVICE_TYPE_RC			0x4
+#define FSD_DEVICE_TYPE_EP			0x0
+#define FSD_PCIE_CXPL_DEBUG_00_31		0x2C8
+
+/* to store different SoC variants of Samsung */
+enum samsung_pcie_variants {
+	FSD,
+	EXYNOS_5433,
+};
+
+/* Values to be written to SYSREG to view DBI space as CDM/DBI2/IATU/DMA */
+enum fsd_pcie_addr_type {
+	ADDR_TYPE_DBI = 0x0,
+	ADDR_TYPE_DBI2 = 0x12,
+	ADDR_TYPE_ATU = 0x36,
+	ADDR_TYPE_DMA = 0x3f,
+};
+
 struct samsung_pcie_pdata {
 	struct pci_ops				*pci_ops;
 	const struct dw_pcie_ops		*dwc_ops;
 	const struct dw_pcie_host_ops		*host_ops;
+	const struct dw_pcie_ep_ops		*ep_ops;
 	const struct samsung_res_ops		*res_ops;
+	unsigned int				soc_variant;
+	enum dw_pcie_device_mode		device_mode;
 };
 
 struct exynos_pcie {
 	struct dw_pcie			pci;
 	void __iomem			*elbi_base;
 	const struct samsung_pcie_pdata	*pdata;
+	struct regmap			*sysreg;
+	unsigned int			sysreg_offset;
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	*supplies;
@@ -69,6 +100,7 @@ struct exynos_pcie {
 struct samsung_res_ops {
 	int (*init_regulator)(struct exynos_pcie *ep);
 	irqreturn_t (*pcie_irq_handler)(int irq, void *arg);
+	void (*set_device_mode)(struct exynos_pcie *ep);
 };
 
 static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
@@ -326,11 +358,203 @@ static const struct dw_pcie_ops exynos_dw_pcie_ops = {
 	.start_link = exynos_pcie_start_link,
 };
 
+static void fsd_pcie_stop_link(struct dw_pcie *pci)
+{
+	u32 val;
+	struct exynos_pcie *ep = to_exynos_pcie(pci);
+
+	val = readl(ep->elbi_base + FSD_PCIE_APP_LTSSM_ENABLE);
+	val &= ~FSD_PCIE_LTSSM_ENABLE;
+	writel(val, ep->elbi_base + FSD_PCIE_APP_LTSSM_ENABLE);
+}
+
+static int fsd_pcie_start_link(struct dw_pcie *pci)
+{
+	struct exynos_pcie *ep = to_exynos_pcie(pci);
+	struct dw_pcie_ep *dw_ep = &pci->ep;
+
+	if (dw_pcie_link_up(pci))
+		return 0;
+
+	writel(FSD_PCIE_LTSSM_ENABLE, ep->elbi_base + FSD_PCIE_APP_LTSSM_ENABLE);
+
+	/* no need to wait for link in case of host as core files take care */
+	if (ep->pdata->device_mode == DW_PCIE_RC_TYPE)
+		return 0;
+
+	/* check if the link is up or not in case of EP */
+	if (!dw_pcie_wait_for_link(pci)) {
+		dw_pcie_ep_linkup(dw_ep);
+		return 0;
+	}
+
+	return -ETIMEDOUT;
+}
+
+static irqreturn_t fsd_pcie_irq_handler(int irq, void *arg)
+{
+	u32 val;
+	struct exynos_pcie *ep = arg;
+	struct dw_pcie *pci = &ep->pci;
+	struct dw_pcie_rp *pp = &pci->pp;
+
+	val = readl(ep->elbi_base + FSD_IRQ2_STS);
+	if ((val & FSD_IRQ_MSI_ENABLE) == FSD_IRQ_MSI_ENABLE) {
+		val &= FSD_IRQ_MSI_ENABLE;
+		writel(val, ep->elbi_base + FSD_IRQ2_STS);
+		dw_handle_msi_irq(pp);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void fsd_pcie_msi_init(struct exynos_pcie *ep)
+{
+	int val;
+
+	val = readl(ep->elbi_base + FSD_IRQ2_EN);
+	val |= FSD_IRQ_MSI_ENABLE;
+	writel(val, ep->elbi_base + FSD_IRQ2_EN);
+}
+
+static void __iomem *fsd_atu_setting(struct dw_pcie *pci, void __iomem *base)
+{
+	struct exynos_pcie *ep = to_exynos_pcie(pci);
+
+	if (base >= pci->atu_base) {
+		regmap_write(ep->sysreg, ep->sysreg_offset, ADDR_TYPE_ATU);
+		return (base - DEFAULT_DBI_ATU_OFFSET);
+	} else if (base == pci->dbi_base) {
+		regmap_write(ep->sysreg, ep->sysreg_offset, ADDR_TYPE_DBI);
+	} else if (base == pci->dbi_base2) {
+		regmap_write(ep->sysreg, ep->sysreg_offset, ADDR_TYPE_DBI2);
+	}
+
+	return base;
+}
+
+static u32 fsd_pcie_read_dbi(struct dw_pcie *pci, void __iomem *base,
+				u32 reg, size_t size)
+{
+	void __iomem *addr;
+	u32 val;
+
+	addr = fsd_atu_setting(pci, base);
+
+	dw_pcie_read(addr + reg, size, &val);
+
+	return val;
+}
+
+static void fsd_pcie_write_dbi(struct dw_pcie *pci, void __iomem *base,
+				u32 reg, size_t size, u32 val)
+{
+	void __iomem *addr;
+
+	addr = fsd_atu_setting(pci, base);
+
+	dw_pcie_write(addr + reg, size, val);
+}
+
+static void fsd_pcie_write_dbi2(struct dw_pcie *pci, void __iomem *base,
+				u32 reg, size_t size, u32 val)
+{
+	struct exynos_pcie *ep = to_exynos_pcie(pci);
+
+	fsd_atu_setting(pci, base);
+	dw_pcie_write(pci->dbi_base + reg, size, val);
+	regmap_write(ep->sysreg, ep->sysreg_offset, ADDR_TYPE_DBI);
+}
+
+static bool fsd_pcie_link_up(struct dw_pcie *pci)
+{
+	u32 val;
+	struct exynos_pcie *ep = to_exynos_pcie(pci);
+
+	val = readl(ep->elbi_base + FSD_PCIE_CXPL_DEBUG_00_31);
+	val &= PORT_LOGIC_LTSSM_STATE_MASK;
+
+	return (val == PORT_LOGIC_LTSSM_STATE_L0);
+}
+
+static int fsd_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct exynos_pcie *ep = to_exynos_pcie(pci);
+
+	phy_init(ep->phy);
+	fsd_pcie_msi_init(ep);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops fsd_pcie_host_ops = {
+	.init = fsd_pcie_host_init,
+};
+
+static int fsd_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
+				 unsigned int type, u16 interrupt_num)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+
+	switch (type) {
+	case PCI_IRQ_INTX:
+		return dw_pcie_ep_raise_intx_irq(ep, func_no);
+	case PCI_IRQ_MSIX:
+		dev_err(pci->dev, "EP does not support MSIX\n");
+		return -EINVAL;
+	case PCI_IRQ_MSI:
+		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
+	default:
+		dev_err(pci->dev, "UNKNOWN IRQ type\n");
+	}
+
+	return 0;
+}
+
+static const struct pci_epc_features fsd_pcie_epc_features = {
+	.linkup_notifier = false,
+	.msi_capable = true,
+	.msix_capable = false,
+};
+
+static const struct pci_epc_features *fsd_pcie_get_features(struct dw_pcie_ep *ep)
+{
+	return &fsd_pcie_epc_features;
+}
+
+static const struct dw_pcie_ep_ops fsd_ep_ops = {
+	.raise_irq	= fsd_pcie_raise_irq,
+	.get_features	= fsd_pcie_get_features,
+};
+
+static void fsd_set_device_mode(struct exynos_pcie *ep)
+{
+	if (ep->pdata->device_mode == DW_PCIE_RC_TYPE)
+		writel(FSD_DEVICE_TYPE_RC, ep->elbi_base + FSD_PCIE_DEVICE_TYPE);
+	else
+		writel(FSD_DEVICE_TYPE_EP, ep->elbi_base + FSD_PCIE_DEVICE_TYPE);
+}
+
+static const struct dw_pcie_ops fsd_dw_pcie_ops = {
+	.read_dbi	= fsd_pcie_read_dbi,
+	.write_dbi	= fsd_pcie_write_dbi,
+	.write_dbi2	= fsd_pcie_write_dbi2,
+	.start_link	= fsd_pcie_start_link,
+	.stop_link	= fsd_pcie_stop_link,
+	.link_up	= fsd_pcie_link_up,
+};
+
 static const struct samsung_res_ops exynos_res_ops_data = {
 	.init_regulator		= exynos_init_regulator,
 	.pcie_irq_handler	= exynos_pcie_irq_handler,
 };
 
+static const struct samsung_res_ops fsd_res_ops_data = {
+	.pcie_irq_handler	= fsd_pcie_irq_handler,
+	.set_device_mode	= fsd_set_device_mode,
+};
+
 static int exynos_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -353,6 +577,26 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(ep->phy))
 		return PTR_ERR(ep->phy);
 
+	if (ep->pdata->soc_variant == FSD) {
+		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(36));
+		if (ret)
+			return ret;
+
+		ep->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
+				"samsung,syscon-pcie");
+		if (IS_ERR(ep->sysreg)) {
+			dev_err(dev, "sysreg regmap lookup failed.\n");
+			return PTR_ERR(ep->sysreg);
+		}
+
+		ret = of_property_read_u32_index(dev->of_node, "samsung,syscon-pcie", 1,
+						 &ep->sysreg_offset);
+		if (ret) {
+			dev_err(dev, "couldn't get the register offset for syscon!\n");
+			return ret;
+		}
+	}
+
 	/* External Local Bus interface (ELBI) registers */
 	ep->elbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
 	if (IS_ERR(ep->elbi_base))
@@ -373,13 +617,43 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	platform_set_drvdata(pdev, ep);
-	ret = samsung_irq_init(ep, pdev);
-	if (ret)
-		goto fail_regulator;
-	ep->pci.pp.ops = pdata->host_ops;
-	ret = dw_pcie_host_init(&ep->pci.pp);
-	if (ret < 0)
+
+	if (pdata->res_ops->set_device_mode)
+		pdata->res_ops->set_device_mode(ep);
+
+	switch (ep->pdata->device_mode) {
+	case DW_PCIE_RC_TYPE:
+		ret = samsung_irq_init(ep, pdev);
+		if (ret)
+			goto fail_regulator;
+
+		ep->pci.pp.ops = pdata->host_ops;
+
+		ret = dw_pcie_host_init(&ep->pci.pp);
+		if (ret < 0)
+			goto fail_phy_init;
+
+		break;
+	case DW_PCIE_EP_TYPE:
+		phy_init(ep->phy);
+
+		ep->pci.ep.ops = pdata->ep_ops;
+
+		ret = dw_pcie_ep_init(&ep->pci.ep);
+		if (ret < 0)
+			goto fail_phy_init;
+
+		ret = dw_pcie_ep_init_registers(&ep->pci.ep);
+		if (ret)
+			goto fail_phy_init;
+
+		pci_epc_init_notify(ep->pci.ep.epc);
+
+		break;
+	default:
+		dev_err(dev, "invalid device type\n");
 		goto fail_phy_init;
+	}
 
 	return 0;
 
@@ -395,8 +669,11 @@ static void exynos_pcie_remove(struct platform_device *pdev)
 {
 	struct exynos_pcie *ep = platform_get_drvdata(pdev);
 
+	if (ep->pdata->device_mode == DW_PCIE_EP_TYPE)
+		return;
 	dw_pcie_host_deinit(&ep->pci.pp);
-	exynos_pcie_assert_core_reset(ep);
+	if (ep->pdata->soc_variant == EXYNOS_5433)
+		exynos_pcie_assert_core_reset(ep);
 	phy_power_off(ep->phy);
 	phy_exit(ep->phy);
 	samsung_regulator_disable(ep);
@@ -405,8 +682,16 @@ static void exynos_pcie_remove(struct platform_device *pdev)
 static int exynos_pcie_suspend_noirq(struct device *dev)
 {
 	struct exynos_pcie *ep = dev_get_drvdata(dev);
+	struct dw_pcie *pci = &ep->pci;
 
-	exynos_pcie_assert_core_reset(ep);
+	if (ep->pdata->device_mode == DW_PCIE_EP_TYPE)
+		return 0;
+
+	if (ep->pdata->dwc_ops->stop_link)
+		ep->pdata->dwc_ops->stop_link(pci);
+
+	if (ep->pdata->soc_variant == EXYNOS_5433)
+		exynos_pcie_assert_core_reset(ep);
 	phy_power_off(ep->phy);
 	phy_exit(ep->phy);
 	samsung_regulator_disable(ep);
@@ -421,6 +706,9 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
 
+	if (ep->pdata->device_mode == DW_PCIE_EP_TYPE)
+		return 0;
+
 	ret = samsung_regulator_enable(ep);
 	if (ret)
 		return ret;
@@ -437,11 +725,30 @@ static const struct dev_pm_ops exynos_pcie_pm_ops = {
 				  exynos_pcie_resume_noirq)
 };
 
+
+static const struct samsung_pcie_pdata fsd_hw3_pcie_rc_pdata = {
+	.dwc_ops		= &fsd_dw_pcie_ops,
+	.host_ops		= &fsd_pcie_host_ops,
+	.res_ops		= &fsd_res_ops_data,
+	.soc_variant		= FSD,
+	.device_mode		= DW_PCIE_RC_TYPE,
+};
+
+static const struct samsung_pcie_pdata fsd_hw3_pcie_ep_pdata = {
+	.dwc_ops		= &fsd_dw_pcie_ops,
+	.ep_ops			= &fsd_ep_ops,
+	.res_ops		= &fsd_res_ops_data,
+	.soc_variant		= FSD,
+	.device_mode		= DW_PCIE_EP_TYPE,
+};
+
 static const struct samsung_pcie_pdata exynos_5433_pcie_rc_pdata = {
 	.dwc_ops		= &exynos_dw_pcie_ops,
 	.pci_ops		= &exynos_pci_ops,
 	.host_ops		= &exynos_pcie_host_ops,
 	.res_ops		= &exynos_res_ops_data,
+	.soc_variant		= EXYNOS_5433,
+	.device_mode		= DW_PCIE_RC_TYPE,
 };
 
 static const struct of_device_id exynos_pcie_of_match[] = {
@@ -449,6 +756,14 @@ static const struct of_device_id exynos_pcie_of_match[] = {
 		.compatible = "samsung,exynos5433-pcie",
 		.data = (void *) &exynos_5433_pcie_rc_pdata,
 	},
+	{
+		.compatible = "tesla,fsd-pcie",
+		.data = (void *) &fsd_hw3_pcie_rc_pdata,
+	},
+	{
+		.compatible = "tesla,fsd-pcie-ep",
+		.data = (void *) &fsd_hw3_pcie_ep_pdata,
+	},
 	{ },
 };
 
-- 
2.49.0


