Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DE1CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 05:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpVsd6AyneahgdXaOC7X3UcZjG5J5t2hbUCwrp15vCc=; b=lNOwx2kXv5Gx3NoCLknV/JiMlC
	GoUCrb0422hgY5+GwaVJyVOPd8RL20j/1mvzeB7eronTd50SWGEBEzWEqGaXR278pzA1ytO50hJhu
	vHQZZ5in1rL5YqSJ/Ft2CHsmU/ffxceTL0EE9LOmhymkWjKUtXAmTalmani18GdKGljq94k0DFMSD
	aeDvrV1whVCNR3617zM3a7WnzFn7ZBGxmlpzC3e7/ZVScYHuhRON4Kxkh8xgeCB/vDgRClEeTIT4x
	wETgLZFB8XwFCcoVA9Y4OzajgvHuItT+MFkGGQ326d+wl1PYrwjhtUPpZ39xtZ4jqx+ezbfbNPyyn
	H5F3XotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulhOy-00000009rbo-2afK;
	Tue, 12 Aug 2025 05:18:25 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulh9O-00000009pVn-3Vms
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 05:02:20 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250812050217epoutp012bf1d611b1f9a373ea54397b12e132d1~a7Gg09quG1317113171epoutp01M
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:02:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250812050217epoutp012bf1d611b1f9a373ea54397b12e132d1~a7Gg09quG1317113171epoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754974937;
	bh=RpVsd6AyneahgdXaOC7X3UcZjG5J5t2hbUCwrp15vCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uSDIDNB4s8lEtTuy9LwP2Q1Vk3Rtt1blCEVRKUoRJa+35EqoLrCOmsSbrpVa02cxb
	 7vTPmVGnu2qKFk1ffETqSgLB4zR2xc5U/gzFCwuR+TWJembbjqYoROC5iy8Xee1+eR
	 0EUUlxAlL87PU79KFyeMbKj6FOtKPBcCUKSD2fVk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250812050216epcas5p21652a6c4ec5401eee3d1115a3d56147a~a7GgKSybv2502425024epcas5p2w;
	Tue, 12 Aug 2025 05:02:16 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c1K9z19SBz3hhTD; Tue, 12 Aug
	2025 05:02:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250811154716epcas5p44980091d5273073b9bf2031572c38376~awQXzzDDb1821518215epcas5p45;
	Mon, 11 Aug 2025 15:47:16 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250811154713epsmtip1541fb87e24feb81701b892c5299371e0~awQVL4KJ72560925609epsmtip1M;
	Mon, 11 Aug 2025 15:47:13 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v3 05/12] PCI: exynos: Add resource ops, soc variant and
 device mode
Date: Mon, 11 Aug 2025 21:16:31 +0530
Message-ID: <20250811154638.95732-6-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811154638.95732-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250811154716epcas5p44980091d5273073b9bf2031572c38376
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250811154716epcas5p44980091d5273073b9bf2031572c38376
References: <20250811154638.95732-1-shradha.t@samsung.com>
	<CGME20250811154716epcas5p44980091d5273073b9bf2031572c38376@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_220219_249107_202D9302 
X-CRM114-Status: GOOD (  27.46  )
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

Some resources might differ based on platforms and we need platform
specific functions to initialize or alter them. For better code
re-usability, making a separate res_ops which will hold all such
function pointers or other resource specific data. Include ops like
 - init_regulator (initialize the regulator data)
 - pcie_irq_handler (interrupt handler for PCIe)
 - set_device_mode (set device mode to EP or RC)

Some operations maybe specific to certain SoCs and not applicable
to others. For such use cases, adding an SoC variant data field
which can be used to distinguish between the variants.

Some SoCs may have dual-role PCIe controller which can work as
RC or EP. Add device_mode to store the role and take decisions
accordingly.

Make enable/disable of regulator and initialization of IRQ as
common functions to be used by all Samsung SoCs.

Suggested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 143 +++++++++++++++++++-----
 1 file changed, 116 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index c830b20d54f0..ef1f42236575 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -49,10 +49,18 @@
 #define EXYNOS_PCIE_ELBI_SLV_ARMISC		0x120
 #define EXYNOS_PCIE_ELBI_SLV_DBI_ENABLE		BIT(21)
 
+/* to store different SoC variants of Samsung */
+enum samsung_pcie_variants {
+	EXYNOS_5433,
+};
+
 struct samsung_pcie_pdata {
 	struct pci_ops				*pci_ops;
 	const struct dw_pcie_ops		*dwc_ops;
 	const struct dw_pcie_host_ops		*host_ops;
+	const struct samsung_res_ops		*res_ops;
+	unsigned int				soc_variant;
+	enum dw_pcie_device_mode		device_mode;
 };
 
 struct exynos_pcie {
@@ -61,7 +69,14 @@ struct exynos_pcie {
 	const struct samsung_pcie_pdata	*pdata;
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
-	struct regulator_bulk_data	supplies[2];
+	struct regulator_bulk_data	*supplies;
+	int				supplies_cnt;
+};
+
+struct samsung_res_ops {
+	int (*init_regulator)(struct exynos_pcie *ep);
+	irqreturn_t (*pcie_irq_handler)(int irq, void *arg);
+	void (*set_device_mode)(struct exynos_pcie *ep);
 };
 
 static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
@@ -74,6 +89,31 @@ static u32 exynos_pcie_readl(void __iomem *base, u32 reg)
 	return readl(base + reg);
 }
 
+static int samsung_regulator_enable(struct exynos_pcie *ep)
+{
+	int ret;
+
+	if (ep->supplies_cnt == 0)
+		return 0;
+
+	ret = regulator_bulk_enable(ep->supplies_cnt, ep->supplies);
+
+	return ret;
+}
+
+static void samsung_regulator_disable(struct exynos_pcie *ep)
+{
+	struct device *dev = ep->pci.dev;
+	int ret;
+
+	if (ep->supplies_cnt == 0)
+		return;
+
+	ret = regulator_bulk_disable(ep->supplies_cnt, ep->supplies);
+	if (ret)
+		dev_warn(dev, "failed to disable regulators: %d\n", ret);
+}
+
 static void exynos_pcie_sideband_dbi_w_mode(struct exynos_pcie *ep, bool on)
 {
 	u32 val;
@@ -244,7 +284,26 @@ static const struct dw_pcie_host_ops exynos_pcie_host_ops = {
 	.init = exynos_pcie_host_init,
 };
 
-static int exynos_add_pcie_port(struct exynos_pcie *ep,
+static int exynos_init_regulator(struct exynos_pcie *ep)
+{
+	struct device *dev = ep->pci.dev;
+	int ret = 0;
+
+	ep->supplies_cnt = 2;
+
+	ep->supplies = devm_kcalloc(dev, ep->supplies_cnt, sizeof(*ep->supplies), GFP_KERNEL);
+	if (!ep->supplies)
+		return -ENOMEM;
+
+	ep->supplies[0].supply = "vdd18";
+	ep->supplies[1].supply = "vdd10";
+
+	ret = devm_regulator_bulk_get(dev, ep->supplies_cnt, ep->supplies);
+
+	return ret;
+}
+
+static int samsung_irq_init(struct exynos_pcie *ep,
 				       struct platform_device *pdev)
 {
 	struct dw_pcie *pci = &ep->pci;
@@ -256,22 +315,15 @@ static int exynos_add_pcie_port(struct exynos_pcie *ep,
 	if (pp->irq < 0)
 		return pp->irq;
 
-	ret = devm_request_irq(dev, pp->irq, exynos_pcie_irq_handler,
+	ret = devm_request_irq(dev, pp->irq, ep->pdata->res_ops->pcie_irq_handler,
 			       IRQF_SHARED, "exynos-pcie", ep);
 	if (ret) {
 		dev_err(dev, "failed to request irq\n");
 		return ret;
 	}
 
-	pp->ops = &exynos_pcie_host_ops;
 	pp->msi_irq[0] = -ENODEV;
 
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -282,6 +334,11 @@ static const struct dw_pcie_ops exynos_dw_pcie_ops = {
 	.start_link = exynos_pcie_start_link,
 };
 
+static const struct samsung_res_ops exynos_res_ops_data = {
+	.init_regulator		= exynos_init_regulator,
+	.pcie_irq_handler	= exynos_pcie_irq_handler,
+};
+
 static int exynos_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -313,28 +370,46 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	ep->supplies[0].supply = "vdd18";
-	ep->supplies[1].supply = "vdd10";
-	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ep->supplies),
-				      ep->supplies);
-	if (ret)
-		return ret;
+	if (pdata->res_ops && pdata->res_ops->init_regulator) {
+		ret = ep->pdata->res_ops->init_regulator(ep);
+		if (ret)
+			return ret;
+	}
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	ret = samsung_regulator_enable(ep);
 	if (ret)
 		return ret;
 
 	platform_set_drvdata(pdev, ep);
 
-	ret = exynos_add_pcie_port(ep, pdev);
-	if (ret < 0)
-		goto fail_probe;
+	if (pdata->res_ops && pdata->res_ops->set_device_mode)
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
+	default:
+		dev_err(dev, "invalid device type\n");
+		ret = -EINVAL;
+		goto fail_regulator;
+	}
 
 	return 0;
 
-fail_probe:
+fail_phy_init:
 	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+fail_regulator:
+	samsung_regulator_disable(ep);
 
 	return ret;
 }
@@ -343,21 +418,29 @@ static void exynos_pcie_remove(struct platform_device *pdev)
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
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	samsung_regulator_disable(ep);
 }
 
 static int exynos_pcie_suspend_noirq(struct device *dev)
 {
 	struct exynos_pcie *ep = dev_get_drvdata(dev);
+	struct dw_pcie *pci = &ep->pci;
 
-	exynos_pcie_assert_core_reset(ep);
+	if (ep->pdata->device_mode == DW_PCIE_EP_TYPE)
+		return 0;
+
+	if (ep->pdata->soc_variant == EXYNOS_5433)
+		exynos_pcie_assert_core_reset(ep);
 	phy_power_off(ep->phy);
 	phy_exit(ep->phy);
-	regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	samsung_regulator_disable(ep);
 
 	return 0;
 }
@@ -369,7 +452,10 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 	struct dw_pcie_rp *pp = &pci->pp;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
+	if (ep->pdata->device_mode == DW_PCIE_EP_TYPE)
+		return 0;
+
+	ret = samsung_regulator_enable(ep);
 	if (ret)
 		return ret;
 
@@ -389,6 +475,9 @@ static const struct samsung_pcie_pdata exynos_5433_pcie_rc_pdata = {
 	.dwc_ops		= &exynos_dw_pcie_ops,
 	.pci_ops		= &exynos_pci_ops,
 	.host_ops		= &exynos_pcie_host_ops,
+	.res_ops		= &exynos_res_ops_data,
+	.soc_variant		= EXYNOS_5433,
+	.device_mode		= DW_PCIE_RC_TYPE,
 };
 
 static const struct of_device_id exynos_pcie_of_match[] = {
-- 
2.49.0


