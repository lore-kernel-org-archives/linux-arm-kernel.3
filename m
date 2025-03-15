Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5ABC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncZHhsb6fKlKAXgwtJOh4qXKkOy/NJijqhna5fMXPgk=; b=VFdQn0lOPOOXKaWfdP5N1DxdfC
	pduaMkDyrcFBKBQk8XECLpr5+ZRPNgLVvSj5htrGb/nuTOIK/RhIcHuURmc8K4Zz3BDyhgxzoLGq4
	Ew56BkgZpJnPaeuC1HzLcmGtGsPYmmAEaLFl6LAD3Yp8aZ+0tY4GCwHXZUch8aKFT4lRgpF+9Ocm0
	r/8tig7adB19i09+74hoTh9QJc+H+flI5FyPhJv6lNuzYucOh6blcuHH5O5JvYLTvJFwq1+URZw6q
	eD40kOXzFuN4TQ76dOQxpPVwgQng37L621H1coDJRxPsUX34xbf43FeSZkdPTgJT+fjduQZT+LXy9
	toq3JD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttYAw-0000000GpMd-3cee;
	Sat, 15 Mar 2025 20:32:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXvU-0000000GnU4-2ppN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 20:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B032CA48B98;
	Sat, 15 Mar 2025 20:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EC9C4CEE5;
	Sat, 15 Mar 2025 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742069768;
	bh=yxt53pJS4LPQZZrMvULyJRtF3Mxw2qD3s3q527wIweA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JDiS+o2VA6dvEjyUCWHUgJVtTZMxCiJKSKIs555J67zRmOwxkO0/8fjNv5SMBxRln
	 8c/kNjeX14+Hqn2cR4gyXmMLUjvFg8IBYl0gXMrOvzVbPZFC/pDgtbyfG9pqCNon6g
	 FaKmNSX2C61vK0my7c1zdlyA6JmGs/LEIxnvaCSjbBQDNPNMHJs3EZnuNA8o3U9L+z
	 oSoBsRKwmkj+V7Pt+OCNmX0+YeCM2hcgre0jmek/ZdBGjVAsnPbabT8itNnfYmfDGY
	 0Cv0SY8DIqJ5r9dsAAbPDOedItN3LY5ULYon8ODOCmTuxBy8DaJ/jiMYPgzUTEy4Fj
	 iaJqOSOY/FT8w==
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
Subject: [PATCH v12 08/13] PCI: dwc: ep: Call epc_create() early in dw_pcie_ep_init()
Date: Sat, 15 Mar 2025 15:15:43 -0500
Message-Id: <20250315201548.858189-9-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_131608_778303_7B87C016 
X-CRM114-Status: GOOD (  10.23  )
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

Move devm_pci_epc_create() to the beginning of dw_pcie_ep_init().

devm_pci_epc_create() is generic code that doesn't depend on any DWC
resource, so moving it earlier keeps all the subsequent devicetree-related
code together.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 .../pci/controller/dwc/pcie-designware-ep.c    | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 80ac2f9e88eb..100d26466f05 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -904,6 +904,15 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 
 	INIT_LIST_HEAD(&ep->func_list);
 
+	epc = devm_pci_epc_create(dev, &epc_ops);
+	if (IS_ERR(epc)) {
+		dev_err(dev, "Failed to create epc device\n");
+		return PTR_ERR(epc);
+	}
+
+	ep->epc = epc;
+	epc_set_drvdata(epc, ep);
+
 	ret = dw_pcie_get_resources(pci);
 	if (ret)
 		return ret;
@@ -918,15 +927,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 	if (ep->ops->pre_init)
 		ep->ops->pre_init(ep);
 
-	epc = devm_pci_epc_create(dev, &epc_ops);
-	if (IS_ERR(epc)) {
-		dev_err(dev, "Failed to create epc device\n");
-		return PTR_ERR(epc);
-	}
-
-	ep->epc = epc;
-	epc_set_drvdata(epc, ep);
-
 	ret = of_property_read_u8(np, "max-functions", &epc->max_functions);
 	if (ret < 0)
 		epc->max_functions = 1;
-- 
2.34.1


