Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C33C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 02:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCjJPMBrsTZ0lEVw44tKYRd0FGCL7YY4EZJtpYnUOU8=; b=VKI8pLprPWG4X7iOfptgq/Esfk
	8xWl1CdiOFgg+9tygko76Cnzyyr/Xj62xuWldLD+01xaOPY18t6od1d3vBpwJjTJWNbacGL4fb/3M
	5ywSGwvGAO0u8GL/ZV5lgt7deYxUZGpM40xfcoxA364PQPm98vKFZXuhG97B83X4dPdaPzgcgbPQf
	GjH+FnFiLuqJjkWQwMCE+gqgY8h980bBRRqu76iYgNssQ1ftqSO9XzRJAlYSDF22OZISHmkJGUuzr
	hPV+/atuRWwVT5NdFFKKjRVynRLt8L3lqEI+cakEmUcUyxfJXy7L4gtTjD/0CDJFtHaJ9QmGYSs7L
	OwJA975g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcdE-0000000AU0n-2jPP;
	Thu, 26 Jun 2025 02:46:32 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcUU-0000000ASQm-3QWQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 02:37:32 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250626023727epoutp01a5fe7e73aba674c80a4abd4585a08bec~MdzpZ6w1j0957509575epoutp01H
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 02:37:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250626023727epoutp01a5fe7e73aba674c80a4abd4585a08bec~MdzpZ6w1j0957509575epoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750905447;
	bh=oCjJPMBrsTZ0lEVw44tKYRd0FGCL7YY4EZJtpYnUOU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GKoFCgMExCp/ExtL6ZnZ6QOuaMr0cMoKy0Dt/N29oM7zDG93zhnTcDf7cCaz15quv
	 X1Vr30+qBqpmwqgpC48+ZGURg4F+3Knt0MUCgPr2GnCTj8+LXaMtVNNQ6y/hSQglEA
	 QFZhsKPurwyxVdMcuMkoiEgTyRmBcgw1pkPJqZ5A=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250626023726epcas5p4afb783bf2def49582295a91ff5c3983c~MdzozS-At0277702777epcas5p4R;
	Thu, 26 Jun 2025 02:37:26 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.183]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bSNBY0kQTz3hhT9; Thu, 26 Jun
	2025 02:37:25 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250625165305epcas5p31ee49285a57e2fb88a005ec1dfed4199~MV1bs_I-z0056800568epcas5p3N;
	Wed, 25 Jun 2025 16:53:05 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625165303epsmtip25d7b64d4dc2f8317a860099aa1b13b66~MV1Y9u-jp1746917469epsmtip2O;
	Wed, 25 Jun 2025 16:53:02 +0000 (GMT)
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
Subject: [PATCH v2 04/10] PCI: exynos: Add platform device private data
Date: Wed, 25 Jun 2025 22:22:23 +0530
Message-ID: <20250625165229.3458-5-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625165229.3458-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625165305epcas5p31ee49285a57e2fb88a005ec1dfed4199
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625165305epcas5p31ee49285a57e2fb88a005ec1dfed4199
References: <20250625165229.3458-1-shradha.t@samsung.com>
	<CGME20250625165305epcas5p31ee49285a57e2fb88a005ec1dfed4199@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_193731_164150_1D3F358C 
X-CRM114-Status: GOOD (  19.93  )
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

In order to extend this driver to all Samsung manufactured SoCs having
DWC PCIe controller, add private data structure which will hold platform
device specific information. It holds function ops like DWC host ops,
DWC generic ops, and PCI read/write ops which will be used as driver
data for different compatibles.

Suggested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 32 ++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index b4ec167b0583..c830b20d54f0 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -49,9 +49,16 @@
 #define EXYNOS_PCIE_ELBI_SLV_ARMISC		0x120
 #define EXYNOS_PCIE_ELBI_SLV_DBI_ENABLE		BIT(21)
 
+struct samsung_pcie_pdata {
+	struct pci_ops				*pci_ops;
+	const struct dw_pcie_ops		*dwc_ops;
+	const struct dw_pcie_host_ops		*host_ops;
+};
+
 struct exynos_pcie {
 	struct dw_pcie			pci;
 	void __iomem			*elbi_base;
+	const struct samsung_pcie_pdata	*pdata;
 	struct clk_bulk_data		*clks;
 	struct phy			*phy;
 	struct regulator_bulk_data	supplies[2];
@@ -220,7 +227,7 @@ static int exynos_pcie_host_init(struct dw_pcie_rp *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct exynos_pcie *ep = to_exynos_pcie(pci);
 
-	pp->bridge->ops = &exynos_pci_ops;
+	pp->bridge->ops = ep->pdata->pci_ops;
 
 	exynos_pcie_assert_core_reset(ep);
 
@@ -268,7 +275,7 @@ static int exynos_add_pcie_port(struct exynos_pcie *ep,
 	return 0;
 }
 
-static const struct dw_pcie_ops dw_pcie_ops = {
+static const struct dw_pcie_ops exynos_dw_pcie_ops = {
 	.read_dbi = exynos_pcie_read_dbi,
 	.write_dbi = exynos_pcie_write_dbi,
 	.link_up = exynos_pcie_link_up,
@@ -279,6 +286,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct exynos_pcie *ep;
+	const struct samsung_pcie_pdata *pdata;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -286,8 +294,11 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (!ep)
 		return -ENOMEM;
 
+	pdata = of_device_get_match_data(dev);
+
+	ep->pdata = pdata;
 	ep->pci.dev = dev;
-	ep->pci.ops = &dw_pcie_ops;
+	ep->pci.ops = pdata->dwc_ops;
 
 	ep->phy = devm_of_phy_get(dev, np, NULL);
 	if (IS_ERR(ep->phy))
@@ -363,9 +374,9 @@ static int exynos_pcie_resume_noirq(struct device *dev)
 		return ret;
 
 	/* exynos_pcie_host_init controls ep->phy */
-	exynos_pcie_host_init(pp);
+	ep->pdata->host_ops->init(pp);
 	dw_pcie_setup_rc(pp);
-	exynos_pcie_start_link(pci);
+	ep->pdata->dwc_ops->start_link(pci);
 	return dw_pcie_wait_for_link(pci);
 }
 
@@ -374,8 +385,17 @@ static const struct dev_pm_ops exynos_pcie_pm_ops = {
 				  exynos_pcie_resume_noirq)
 };
 
+static const struct samsung_pcie_pdata exynos_5433_pcie_rc_pdata = {
+	.dwc_ops		= &exynos_dw_pcie_ops,
+	.pci_ops		= &exynos_pci_ops,
+	.host_ops		= &exynos_pcie_host_ops,
+};
+
 static const struct of_device_id exynos_pcie_of_match[] = {
-	{ .compatible = "samsung,exynos5433-pcie", },
+	{
+		.compatible = "samsung,exynos5433-pcie",
+		.data = (void *) &exynos_5433_pcie_rc_pdata,
+	},
 	{ },
 };
 
-- 
2.49.0


