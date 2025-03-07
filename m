Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47125C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cFLCcUVpb4fVdYybTqcQl4iUfdLFhB/qPA6ZRJ3EzQ=; b=I4voJRkB+MLsxkGBMrpJOBk8it
	+48IYheCcqJJLCnDa+IJY/i2/pVr9s8itU4KlwHOzRJYelVroHicZsuhf4NCt4J6caitYHHSBoImh
	x6L9oGrCrGpjfzkKLEUUEkbfEIpDK00JxftelCDZb9jfqIMDhUmwiFF9VHtGkv86/vkDPuz72CU8P
	gyBFhV9JQ6HJss3KypLWmr/6AfCabr1KNYq/GnGrREW9gNffqtWxX7gkiQV6L0qdNrtt524LlZxtO
	V/togzJXcXbJdgv7kkdn2K67RKSbp3uey7Ci1GiHLVT63/Sg3tjnNWbFv03u7vGGVgFmWEJnxB8NT
	gv9y2w9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhLC-0000000FqKb-2haP;
	Fri, 07 Mar 2025 23:42:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhGM-0000000FpTU-3IxJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 23:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 645405C64F6;
	Fri,  7 Mar 2025 23:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E4DC4CED1;
	Fri,  7 Mar 2025 23:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741390674;
	bh=ua0QgEy0dtgEEi4JLJEBT5g3dBO7iHT7Cgd7aa1B+Bg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xa4liii3Xc5XxFFQL/XL0QZzGnmQmkhiGfhADFOcOCnT1EjvZ1UHgXBePJR6QYXV3
	 vRSyXotvvUma0enW3P3Hz5UchElelf+MHveAv49uy8ZtnWSa7B2pTGGtQufFMNwOhu
	 S7JMWx9w41is4jaJncM6XbSpZHKDQHIRFNU/i3pmhHyAyEjFuh/ZXoyq5qzZALLoSF
	 2DKkZ24v6T2wlcVkoQeFyeHPdaq+MeUc8kAlwNRs/WpRBskBiUBzhyzGjRa8yJHX+2
	 VbAmbRdLKNgDsWHmQ1fDIwPNcxqQY1vUplr99mv3a4Q26RKQBzX8gpZ1jxKEs7stBY
	 2ld1PzjsN/poQ==
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
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Niklas Cassel <cassel@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 1/4] PCI: dwc: Move cfg0 setup to dw_pcie_cfg0_setup()
Date: Fri,  7 Mar 2025 17:37:41 -0600
Message-Id: <20250307233744.440476-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307233744.440476-1-helgaas@kernel.org>
References: <20250307233744.440476-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_153754_881451_4FFE1FED 
X-CRM114-Status: GOOD (  12.10  )
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

Move pp->cfg0 setup to dw_pcie_cfg0_setup().  No functional change
intended.
---
 .../pci/controller/dwc/pcie-designware-host.c | 34 +++++++++++++------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 1206b26bff3f..de2f2dcf5c40 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -418,22 +418,12 @@ static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
 	}
 }
 
-int dw_pcie_host_init(struct dw_pcie_rp *pp)
+static int dw_pcie_cfg0_setup(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct device *dev = pci->dev;
-	struct device_node *np = dev->of_node;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct resource_entry *win;
-	struct pci_host_bridge *bridge;
 	struct resource *res;
-	int ret;
-
-	raw_spin_lock_init(&pp->lock);
-
-	ret = dw_pcie_get_resources(pci);
-	if (ret)
-		return ret;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "config");
 	if (!res) {
@@ -448,6 +438,28 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 	if (IS_ERR(pp->va_cfg0_base))
 		return PTR_ERR(pp->va_cfg0_base);
 
+	return 0;
+}
+
+int dw_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct device *dev = pci->dev;
+	struct device_node *np = dev->of_node;
+	struct resource_entry *win;
+	struct pci_host_bridge *bridge;
+	int ret;
+
+	raw_spin_lock_init(&pp->lock);
+
+	ret = dw_pcie_get_resources(pci);
+	if (ret)
+		return ret;
+
+	ret = dw_pcie_cfg0_setup(pp);
+	if (ret)
+		return ret;
+
 	bridge = devm_pci_alloc_host_bridge(dev, 0);
 	if (!bridge)
 		return -ENOMEM;
-- 
2.34.1


