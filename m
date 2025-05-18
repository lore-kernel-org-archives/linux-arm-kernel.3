Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFB5C54756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kri/rf6JyQa2611OX6tgyLofpFbOtaP/i+pbrhIk82I=; b=GQt8tv0EtTSNdGoy/Qt+m+C+Du
	+sWVJXtLkFMOLQDjyoYaUyhxth/cD+URPPWkeANjGo/vXz33gSL5a+SM4RsHFP3VhpQ79XTHpYOLE
	tMliECujDwPWNqQgfg1NWSwv+ONCxTTP/ZnQAI+bGamMxSo9b/F3obxuSFQajUpRYqeNB3O6ds708
	Y4a4p2IQDfXWqS/9ykYzwCpUN8x2ZxtcaXsfGB9K+j0hfXIH3wy+jderUgz/gjotq+FtL/QdMg80S
	Kt7s2fLyM1533P8eF4AuLtZwsf7hkQUZPf+7LQOacJuu5JKODvvHgMqRZp2XL9VE3BAT+JdeKjqee
	12hEcecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx4N-00000008dv3-3bNH;
	Mon, 19 May 2025 09:46:03 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwod-00000008ZRA-0bLW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 09:29:48 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250519092944epoutp0498dfa93b5fc59d67d43606041e3a339f~A46xkiT7H1579015790epoutp04U
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 09:29:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250519092944epoutp0498dfa93b5fc59d67d43606041e3a339f~A46xkiT7H1579015790epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747646985;
	bh=kri/rf6JyQa2611OX6tgyLofpFbOtaP/i+pbrhIk82I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m+pb/Pg96GLP6EsD0mNwsbJajFPGlab8S4FDbKmBmbeO21wh/t/ZzoEf4+5Ewl8PY
	 hE2/OqyDj8FIXWMa5VuEO2cms3yb8LzfrNc1GD3IarX4U4bo65KgxptJTG8f5Pnmg4
	 sIJ4EwNF/Mv2avcrsmLZ8mVWPgjgHaKJpAh7OMnU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250519092944epcas5p30963fd58c3ff137b3485a8519631fbc5~A46w8LK1C2598025980epcas5p36;
	Mon, 19 May 2025 09:29:44 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.183]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4b1C7p322cz3hhTD; Mon, 19 May
	2025 09:29:42 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250518193239epcas5p4cb4112382560f38ad9708e000eb2335f~Atf54DPB01869218692epcas5p44;
	Sun, 18 May 2025 19:32:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250518193239epsmtrp152a40df9dae4832cff5cfad71e4b6d0e~Atf53Bh3b2445124451epsmtrp1e;
	Sun, 18 May 2025 19:32:39 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-2a-682a35d78a58
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	92.C1.08766.7D53A286; Mon, 19 May 2025 04:32:39 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250518193236epsmtip1a2a9de1995dc37a809fae778aa737597~Atf3CuesD1176111761epsmtip1F;
	Sun, 18 May 2025 19:32:36 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, Shradha Todi
	<shradha.t@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH 04/10] PCI: exynos: Add platform device private data
Date: Mon, 19 May 2025 01:01:46 +0530
Message-ID: <20250518193152.63476-5-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518193152.63476-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsWy7bCSnO51U60Mg/M7TCwezNvGZvF30jF2
	iyVNGRZr9p5jsph/5ByrxY1fbawWK77MZLc42vqf2eLlrHtsFg09v1ktNj2+xmpxedccNouz
	846zWUxY9Y3F4uz3BUwWLX9aWCzWHrnLbnG3pZPVYtHWL+wW//fsYLfoPVxrsfPOCWYHMY/f
	vyYxeuycdZfdY8GmUo9NqzrZPO5c28Pm8eTKdCaPzUvqPfq2rGL0OPJ1OovH501yAVxRXDYp
	qTmZZalF+nYJXBmXemYzF+yWqpj0ZTl7A+NH0S5GTg4JAROJxkPHWbsYuTiEBHYzStz61sMM
	kZCU+HxxHROELSyx8t9zdoiiT4wSS162sYMk2AS0JBq/doE1iAicYJTou2UJUsQsMItZYua3
	HhaQhLCAi0T7jSVgDSwCqhJ7vneDxXkFrCTOzDnD1sXIAbRBXqK/QwIkzClgLbFt/VSwxUJA
	JQuf7GSEKBeUODnzCVgrM1B589bZzBMYBWYhSc1CklrAyLSKUTK1oDg3PbfYsMAwL7Vcrzgx
	t7g0L10vOT93EyM4LrU0dzBuX/VB7xAjEwfjIUYJDmYlEd5VmzUyhHhTEiurUovy44tKc1KL
	DzFKc7AoifOKv+hNERJITyxJzU5NLUgtgskycXBKNTBJ3jbb0f/2823ZD813PxRuWhH1nmO+
	+p2nPJarszRDvv2v/n9DwyJqfvDEu5fPcLx2tfxyoUnuUMuxI5ZdmexxM+RcF1ycOvlCZMnG
	vOzyJb7vd7113xPYXuJexunxxV9qh0uE++WHEkHzi71eM3ScPLa56Z2fgRnHnEflpw4waQvl
	ufqp6+vm8a86P+WdbnFfHsMTRy3fr9xt8ScXnudevidm7xru5vRJm/w0Cndx1JuGcq/pa+Wp
	+jr5xmnPV1ubHNZ5yq5ua+Pyjn+W7v4n8N3BiaoJxpvfVpxR3WyqO+kM8+2am4vUZ1/h7CmI
	tBGZ9JNx8qNPC3VPl81Y+k9zjvqjnafuzJq9fdKZ6a9SlFiKMxINtZiLihMB8uCLLjoDAAA=
X-CMS-MailID: 20250518193239epcas5p4cb4112382560f38ad9708e000eb2335f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250518193239epcas5p4cb4112382560f38ad9708e000eb2335f
References: <20250518193152.63476-1-shradha.t@samsung.com>
	<CGME20250518193239epcas5p4cb4112382560f38ad9708e000eb2335f@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_022947_499940_77854D04 
X-CRM114-Status: GOOD (  19.56  )
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
index 286f4987d56f..540612e76f4b 100644
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


