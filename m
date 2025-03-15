Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F7EC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3+7QLmfG0lSMvBtDlIp1/xHKg2SwhzQBOU/IXSJNgY=; b=qrTP0ozRPZyLhSrebz++uOP/yw
	mwuxQPlc+nKE2cr9I/MiUKJinpKM3eNTBNpoXrPhp7cEfe5FDRzZOJGff6o2fM7nogYpt6xV7hUkC
	T3+PSRHy5bg933WdNr8bQRlbAvVFIfy7XktVTnX2xTsgkUfBozTkEvwuB2EtfBS3nMu96P4OkXtHk
	Zm0LJeiu/7K74/yhP50zfTEEFs4JBaM1CUFn2+Zq4FDpTCECM2QikWl5T6HqZsuBzalMdHkT5Emr2
	uNUWdZA8MLjOAThW5u6lTSCj0w07Q7gN5G6vWsK4ZeSlkLdi3bpTXzmIlUwcfm2cGvokFQzTiQozC
	s3Ed74QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttYCb-0000000GpUS-2hnO;
	Sat, 15 Mar 2025 20:33:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXvW-0000000GnVz-375E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 20:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 53894A48B82;
	Sat, 15 Mar 2025 20:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E483C4CEE5;
	Sat, 15 Mar 2025 20:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742069769;
	bh=sQygIqg4qV1xiOq77OkyiaeYdUXtZIaj/l0SEvW8lvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B+vyVat5vCFT2D2kEQKSYPAfHjHV7WTithLM+T1omrIWQ1pilyFBvPCnGWOp2UZg/
	 1bP8D+/r1sWmQb506r03Kd40Sicgb9OO6d/dCG5w+M6T3eo2c4gaplnJilaX7c2+nO
	 Td5sy18tq/1LzPtwjCHXRjZc4umPwyb3wb/gUBYCYZ6Oi86n0aYfTBlW/b+Gudx/qd
	 S2SlN8cAr8VXFJimIo3qY3dXN59gRjtAGnrllrO/3S2AZ0bbwie1ME7+23ZR94LV1u
	 BLThqb8pQI2BZWH0SmiwrFv1f6zXp5vKdUKP0Hpazo3AUYSqpLVVEJTV6PvWsCJ82P
	 npUUwgjIJmyzA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v12 09/13] PCI: dwc: ep: Consolidate devicetree handling in dw_pcie_ep_get_resources()
Date: Sat, 15 Mar 2025 15:15:44 -0500
Message-Id: <20250315201548.858189-10-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_131610_914744_2F1DC137 
X-CRM114-Status: GOOD (  14.28  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

Consolidate devicetree resource handling in dw_pcie_ep_get_resources().
No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 68 +++++++++++--------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 100d26466f05..2db834345ec2 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -883,35 +883,15 @@ void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
 
-/**
- * dw_pcie_ep_init - Initialize the endpoint device
- * @ep: DWC EP device
- *
- * Initialize the endpoint device. Allocate resources and create the EPC
- * device with the endpoint framework.
- *
- * Return: 0 if success, errno otherwise.
- */
-int dw_pcie_ep_init(struct dw_pcie_ep *ep)
+static int dw_pcie_ep_get_resources(struct dw_pcie_ep *ep)
 {
-	int ret;
-	struct resource *res;
-	struct pci_epc *epc;
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct device *dev = pci->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *np = dev->of_node;
-
-	INIT_LIST_HEAD(&ep->func_list);
-
-	epc = devm_pci_epc_create(dev, &epc_ops);
-	if (IS_ERR(epc)) {
-		dev_err(dev, "Failed to create epc device\n");
-		return PTR_ERR(epc);
-	}
-
-	ep->epc = epc;
-	epc_set_drvdata(epc, ep);
+	struct pci_epc *epc = ep->epc;
+	struct resource *res;
+	int ret;
 
 	ret = dw_pcie_get_resources(pci);
 	if (ret)
@@ -924,13 +904,47 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	ep->phys_base = res->start;
 	ep->addr_size = resource_size(res);
 
-	if (ep->ops->pre_init)
-		ep->ops->pre_init(ep);
-
 	ret = of_property_read_u8(np, "max-functions", &epc->max_functions);
 	if (ret < 0)
 		epc->max_functions = 1;
 
+	return 0;
+}
+
+/**
+ * dw_pcie_ep_init - Initialize the endpoint device
+ * @ep: DWC EP device
+ *
+ * Initialize the endpoint device. Allocate resources and create the EPC
+ * device with the endpoint framework.
+ *
+ * Return: 0 if success, errno otherwise.
+ */
+int dw_pcie_ep_init(struct dw_pcie_ep *ep)
+{
+	int ret;
+	struct pci_epc *epc;
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct device *dev = pci->dev;
+
+	INIT_LIST_HEAD(&ep->func_list);
+
+	epc = devm_pci_epc_create(dev, &epc_ops);
+	if (IS_ERR(epc)) {
+		dev_err(dev, "Failed to create epc device\n");
+		return PTR_ERR(epc);
+	}
+
+	ep->epc = epc;
+	epc_set_drvdata(epc, ep);
+
+	ret = dw_pcie_ep_get_resources(ep);
+	if (ret)
+		return ret;
+
+	if (ep->ops->pre_init)
+		ep->ops->pre_init(ep);
+
 	ret = pci_epc_mem_init(epc, ep->phys_base, ep->addr_size,
 			       ep->page_size);
 	if (ret < 0) {
-- 
2.34.1


