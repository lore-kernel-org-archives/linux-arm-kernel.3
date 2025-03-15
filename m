Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081AAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrnlKj8sSo9riL3hDutZp5tUCG42S5hCP5t/7KI5BsE=; b=F9bbdfjHDXx92cWGIxwPChX8mC
	vjdkHCnlVEWN//xkJOUOG/EjgpnCzb3ndwxC7FI9kVwCBxv2m9s0IkphV7SAEA6Izn77wT2V+hFyo
	yckxp7CO6ohwsKDUF7U8pO1SLZOsuh6JPg8Rnfdv1nMlXOmZZSodCcoeZnBnffwWpbg/gbWgbOyMD
	AgPUOEkpGXmE5na25BBi6DA8P68ZXS3xaBGT7+DxjRctrSoB2xRwkuvKlEYHS744K3qf1GWwhsuYN
	N7fcm5WFfLawzv1fTgKttiW1Hk03t2cQ96qogJREbuhgbRgVj3nKl8cXJxfciDnssLn7xLwRePWfy
	urR5vjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttY4K-0000000Gook-3yAo;
	Sat, 15 Mar 2025 20:25:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttXvP-0000000GnSo-3GlV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 20:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5A9EEA48B85;
	Sat, 15 Mar 2025 20:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 143E7C113CF;
	Sat, 15 Mar 2025 20:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742069762;
	bh=CpTQVdmtXh0uTx65c9F5PQoTrjYzcny7+9eiEMKtE/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rt74XQ34r5n1G30d4C5QLmhvGYhqtsM5ePEZ58Oc4IqMG9sBy9XR8xvhB8JcyOjzb
	 kuxktKG3tnl8vCzlYIIjkwdBz1D66shG3pZmj7Lxcwd3KjQMyNXj0lDLrejzRsV2eD
	 0TAFR6cNwPiLRU3rJKifXVEVbg42FzVxZAVTUYFvUKe1wx2EclDyrxx0v5hoTVONv5
	 1QnpgTq19p3pc4IdJdCXz8R1mJzaB1bFTR34jN3Eq+vVCBzm4+EGOxgnvSIc/jrCVd
	 2frTdiiq9jDT3rkwNm+vllPK8LNZpKAI3mXivT9ixE7f2X2ndZMt8epfQ0RTL5287A
	 wY+Sc6Gzt07DQ==
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
Subject: [PATCH v12 04/13] PCI: dwc: Consolidate devicetree handling in dw_pcie_host_get_resources()
Date: Sat, 15 Mar 2025 15:15:39 -0500
Message-Id: <20250315201548.858189-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>
References: <20250315201548.858189-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_131603_958683_EC13941B 
X-CRM114-Status: GOOD (  11.54  )
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

Consolidate devicetree resource handling in dw_pcie_host_get_resources().
No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 .../pci/controller/dwc/pcie-designware-host.c | 37 +++++++++++++------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 5636243fb90e..9ce06b1ee266 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -418,25 +418,15 @@ static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
 	}
 }
 
-int dw_pcie_host_init(struct dw_pcie_rp *pp)
+static int dw_pcie_host_get_resources(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct device *dev = pci->dev;
-	struct device_node *np = dev->of_node;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource_entry *win;
-	struct pci_host_bridge *bridge;
 	struct resource *res;
 	int ret;
 
-	raw_spin_lock_init(&pp->lock);
-
-	bridge = devm_pci_alloc_host_bridge(dev, 0);
-	if (!bridge)
-		return -ENOMEM;
-
-	pp->bridge = bridge;
-
 	ret = dw_pcie_get_resources(pci);
 	if (ret)
 		return ret;
@@ -455,13 +445,36 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
 		return PTR_ERR(pp->va_cfg0_base);
 
 	/* Get the I/O range from DT */
-	win = resource_list_first_type(&bridge->windows, IORESOURCE_IO);
+	win = resource_list_first_type(&pp->bridge->windows, IORESOURCE_IO);
 	if (win) {
 		pp->io_size = resource_size(win->res);
 		pp->io_bus_addr = win->res->start - win->offset;
 		pp->io_base = pci_pio_to_address(win->res->start);
 	}
 
+	return 0;
+}
+
+int dw_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct device *dev = pci->dev;
+	struct device_node *np = dev->of_node;
+	struct pci_host_bridge *bridge;
+	int ret;
+
+	raw_spin_lock_init(&pp->lock);
+
+	bridge = devm_pci_alloc_host_bridge(dev, 0);
+	if (!bridge)
+		return -ENOMEM;
+
+	pp->bridge = bridge;
+
+	ret = dw_pcie_host_get_resources(pp);
+	if (ret)
+		return ret;
+
 	/* Set default bus ops */
 	bridge->ops = &dw_pcie_ops;
 	bridge->child_ops = &dw_child_pcie_ops;
-- 
2.34.1


