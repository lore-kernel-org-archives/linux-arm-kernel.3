Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01F1C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 07:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IW64XxtWB3loxLkaTfVE71+NTrk/5zxg+NXL4WIDjrc=; b=SfPr9ZjBoGgJkD7/CkUyoTm4A2
	Sl1glhjGjo6EsHIqPK1JikBaaXMpaDJuRR6QXPc7BHY4Ai8sYmeyTGG3RqQ4baI0JMyEbVQmORZJa
	dubNdrH/7hgdzkYLrScSRtw6ZwfG/g57DY9+nf1eHooVuPleop1kl7chFpZMKQOzp7UmCYaZdTuqR
	rtuq3Al4+n5xrUX3LqGw+GMjOdxtcVI58pSIps8RRryMy8jqxOvn/lkGg2jvu5ZJH6fh9aO3dtKWj
	z4yHocfMwCxrDuvOeDejjRJIW9QxHLwSTvwTV1LoojYfejQLUvR17/Mv3q5hq82mprVLoyCIZIL+X
	CS+GtPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTUa-00000004BhS-1Ql4;
	Wed, 23 Jul 2025 07:02:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueTRZ-00000004BHy-2jq8;
	Wed, 23 Jul 2025 06:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EAC80445E3;
	Wed, 23 Jul 2025 06:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3BEC4CEE7;
	Wed, 23 Jul 2025 06:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753253952;
	bh=zeuIaU8cqKTdhTRyjKP+bKeTvoJA6oWm+SnTvG8Gs0A=;
	h=From:To:Cc:Subject:Date:From;
	b=EK36zhtZGaE+lCdwPOm076nMdFqFhA11W3IVIuimZf5L9SUbpc3745cCpqdJIVNbK
	 jJY34ERQBuRtvp8yFxIefvuUjHb0SH/HT+1WMglQ8cY4Vhnv47bibqftB6Wp0iFCLY
	 5lxlLFSmp9wBRfUmMZ6NKSK/WDGoBT+1JcVJqrYvF3jg2rKiFNAYypB/wcbsgOoqLk
	 MbN6jcparCj4qB2XAiA4pQtW8k7yO8MmJdCTTiyvXLMEoS3XYGwx3lIEUq8zmXPg/y
	 QsqbOxekTyl69bcI7Iptao+V6F6B+sCpLRsmGwvj+goC5moSHnHddWxJXSfHAyHUOO
	 yaVcwXKW7mK2Q==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: bhelgaas@google.com
Cc: tglx@linutronix.de,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Michal Simek <michal.simek@amd.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] PCI: controller: use dev_fwnode()
Date: Wed, 23 Jul 2025 08:59:07 +0200
Message-ID: <20250723065907.1841758-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_235913_730829_92BD2159 
X-CRM114-Status: GOOD (  12.79  )
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

All irq_domain functions now accept fwnode instead of of_node. But many
PCI controllers still extract dev to of_node and then of_node to fwnode.

Instead, clean this up and simply use the dev_fwnode() helper to extract
fwnode directly from dev. Internally, it still does dev => of_node =>
fwnode steps, but it's now hidden from the users.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Link: https://lore.kernel.org/all/4ee9c7c0-4a3f-4afa-ae5a-7fd8a750c92b@kernel.org/
Link: https://lore.kernel.org/all/4bc0e1ca-a523-424a-8759-59e353317fba@kernel.org/
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Cc: Joyce Ooi <joyce.ooi@intel.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>
---
Cc: linux-pci@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/dwc/pcie-designware-host.c    | 3 +--
 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c | 3 +--
 drivers/pci/controller/pcie-altera-msi.c             | 3 +--
 drivers/pci/controller/pcie-mediatek.c               | 4 +---
 drivers/pci/controller/pcie-xilinx-dma-pl.c          | 3 +--
 drivers/pci/controller/pcie-xilinx-nwl.c             | 3 +--
 drivers/pci/controller/plda/pcie-plda-host.c         | 3 +--
 7 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 4af7da14b350..952f8594b501 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -214,9 +214,8 @@ static const struct irq_domain_ops dw_pcie_msi_domain_ops = {
 int dw_pcie_allocate_domains(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct fwnode_handle *fwnode = of_fwnode_handle(pci->dev->of_node);
 	struct irq_domain_info info = {
-		.fwnode		= fwnode,
+		.fwnode		= dev_fwnode(pci->dev),
 		.ops		= &dw_pcie_msi_domain_ops,
 		.size		= pp->num_vectors,
 		.host_data	= pp,
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
index d17e887b6b61..dbc72c73fd0a 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -439,13 +439,12 @@ static const struct irq_domain_ops msi_domain_ops = {
 static int mobiveil_allocate_msi_domains(struct mobiveil_pcie *pcie)
 {
 	struct device *dev = &pcie->pdev->dev;
-	struct fwnode_handle *fwnode = of_fwnode_handle(dev->of_node);
 	struct mobiveil_msi *msi = &pcie->rp.msi;
 
 	mutex_init(&msi->lock);
 
 	struct irq_domain_info info = {
-		.fwnode		= fwnode,
+		.fwnode		= dev_fwnode(dev),
 		.ops		= &msi_domain_ops,
 		.host_data	= pcie,
 		.size		= msi->num_of_vectors,
diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/controller/pcie-altera-msi.c
index 2e48acd632c5..ea2ca2e70f20 100644
--- a/drivers/pci/controller/pcie-altera-msi.c
+++ b/drivers/pci/controller/pcie-altera-msi.c
@@ -166,9 +166,8 @@ static const struct irq_domain_ops msi_domain_ops = {
 
 static int altera_allocate_domains(struct altera_msi *msi)
 {
-	struct fwnode_handle *fwnode = of_fwnode_handle(msi->pdev->dev.of_node);
 	struct irq_domain_info info = {
-		.fwnode		= fwnode,
+		.fwnode		= dev_fwnode(&msi->pdev->dev),
 		.ops		= &msi_domain_ops,
 		.host_data	= msi,
 		.size		= msi->num_of_vectors,
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 3ac5d14dd543..24cc30a2ab6c 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -487,12 +487,10 @@ static const struct msi_parent_ops mtk_msi_parent_ops = {
 
 static int mtk_pcie_allocate_msi_domains(struct mtk_pcie_port *port)
 {
-	struct fwnode_handle *fwnode = of_fwnode_handle(port->pcie->dev->of_node);
-
 	mutex_init(&port->lock);
 
 	struct irq_domain_info info = {
-		.fwnode		= fwnode,
+		.fwnode		= dev_fwnode(port->pcie->dev),
 		.ops		= &msi_domain_ops,
 		.host_data	= port,
 		.size		= MTK_MSI_IRQS_NUM,
diff --git a/drivers/pci/controller/pcie-xilinx-dma-pl.c b/drivers/pci/controller/pcie-xilinx-dma-pl.c
index fbc379fd118b..b037c8f315e4 100644
--- a/drivers/pci/controller/pcie-xilinx-dma-pl.c
+++ b/drivers/pci/controller/pcie-xilinx-dma-pl.c
@@ -465,9 +465,8 @@ static int xilinx_pl_dma_pcie_init_msi_irq_domain(struct pl_dma_pcie *port)
 	struct device *dev = port->dev;
 	struct xilinx_msi *msi = &port->msi;
 	int size = BITS_TO_LONGS(XILINX_NUM_MSI_IRQS) * sizeof(long);
-	struct fwnode_handle *fwnode = of_fwnode_handle(port->dev->of_node);
 	struct irq_domain_info info = {
-		.fwnode		= fwnode,
+		.fwnode		= dev_fwnode(port->dev),
 		.ops		= &dev_msi_domain_ops,
 		.host_data	= port,
 		.size		= XILINX_NUM_MSI_IRQS,
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index de76c836915f..05b8c205493c 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -498,10 +498,9 @@ static int nwl_pcie_init_msi_irq_domain(struct nwl_pcie *pcie)
 {
 #ifdef CONFIG_PCI_MSI
 	struct device *dev = pcie->dev;
-	struct fwnode_handle *fwnode = of_fwnode_handle(dev->of_node);
 	struct nwl_msi *msi = &pcie->msi;
 	struct irq_domain_info info = {
-		.fwnode		= fwnode,
+		.fwnode		= dev_fwnode(dev),
 		.ops		= &dev_msi_domain_ops,
 		.host_data	= pcie,
 		.size		= INT_PCI_MSI_NR,
diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/controller/plda/pcie-plda-host.c
index 92866840875e..8e2db2e5b64b 100644
--- a/drivers/pci/controller/plda/pcie-plda-host.c
+++ b/drivers/pci/controller/plda/pcie-plda-host.c
@@ -153,13 +153,12 @@ static const struct msi_parent_ops plda_msi_parent_ops = {
 static int plda_allocate_msi_domains(struct plda_pcie_rp *port)
 {
 	struct device *dev = port->dev;
-	struct fwnode_handle *fwnode = of_fwnode_handle(dev->of_node);
 	struct plda_msi *msi = &port->msi;
 
 	mutex_init(&port->msi.lock);
 
 	struct irq_domain_info info = {
-		.fwnode		= fwnode,
+		.fwnode		= dev_fwnode(dev),
 		.ops		= &msi_domain_ops,
 		.host_data	= port,
 		.size		= msi->num_vectors,
-- 
2.50.1


