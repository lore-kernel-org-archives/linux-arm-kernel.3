Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1574C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 21:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=xJond9/AMaPD2lJUBcD0GN/ohHQIrKYDVHQ1utL3UZ8=; b=jKY+zNORxR5yBz
	MEHEROhaAHXaOPBTcfUHkjuBn7kkAsecya18O0QM/cL6AgEoAaj/zBebu5oldjw7RpHfsU+X0yz58
	0x8Y64UZRp0bgVWqLP0pBWHNg0oJTJnpiXAYJBgT+jxanhh7iplPzr6XDq1GwWJE/PZR4OQXRYvY5
	6h7TM/hNeNdbYRTCGzCFP1+P5smJAQsOYcNntmdAtHy2omM7R/yU97pJ+0u9uzW5Oc9/TDkgFDMAZ
	sgWHKMxxBNPPWOsto3Z6PThmbayfSAWAu6ZUDz9dKLT+g6oc00j5AdzD1UCcjYYWNu6sDsrqqVIyj
	7RJvkJlNStPfG065h7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYu3w-00000001Pqk-0H8o;
	Fri, 17 Jan 2025 21:39:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYu2f-00000001Plf-3PX4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 21:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 825805C64BD;
	Fri, 17 Jan 2025 21:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979E6C4CEDD;
	Fri, 17 Jan 2025 21:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737149892;
	bh=HFQNhfd47610NSNP8MfcXIi0KpUPmKVTLUViSqR9iOQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Q4CfQ94O2VZh4MeIwIt9KG+/zBOncA/41aDOsSSdnZ1m3cDwbQ56kg6GxLGNw20Cq
	 FARj4j83qiPiJvoUViFVpmuBSPwTnn/lwdAzIBnN7/xJie8etNOrrsDpczP4A3xUr3
	 qyBt0/FTF737KV8YO6de7MhEOVZEH0OAcUTmWUZM/ZhGUkIceK75OJhRX5hbRuOhok
	 RJKfvZoQf6k3tNQkoL3WhmnCdbNuaq/csmoPZ1EuvRpigwDey53ykTOck6v25lx4Lc
	 phiKD3gJGzAeL2Tfp9WeDupNHScVUHqLwLZWMgbGCXIFvLdGlyJ8UWuNzG3FOgW5eS
	 QoIp1tWR+4JNA==
Date: Fri, 17 Jan 2025 15:38:10 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:PCI DRIVER FOR IMX6" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR IMX6" <linux-arm-kernel@lists.infradead.org>,
	"open list:PCI DRIVER FOR IMX6" <imx@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] PCI: imx6: Add CONFIG_PCIE_DW_HOST check for
 suspend/resume
Message-ID: <20250117213810.GA656803@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117180722.2354290-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_133813_944663_86FEEAF7 
X-CRM114-Status: GOOD (  12.61  )
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

On Fri, Jan 17, 2025 at 01:07:22PM -0500, Frank Li wrote:
> Add CONFIG_PCIE_DW_HOST check for suspend/resume to avoid build issue
> when CONFIG_PCIE_DW_HOST is not defined but CONFIG_PCIE_DW_EP defined.
> 
> Only host support suspend/resume at i.MX chips.

What would you think of inserting the following patch before
"[PATCH v7 08/10] PCI: imx6: Use dwc common suspend resume method"?

Then we wouldn't need to add #ifdefs in every driver that supports
both RC and EP mode and also supports power management for RC mode.

Bjorn


commit d3b04bf25988 ("PCI: dwc: Add dw_pcie_suspend_noirq(), dw_pcie_resume_noirq() stubs for !CONFIG_PCIE_DW_HOST")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Fri Jan 17 15:03:04 2025 -0600

    PCI: dwc: Add dw_pcie_suspend_noirq(), dw_pcie_resume_noirq() stubs for !CONFIG_PCIE_DW_HOST
    
    Previously pcie-designware.h declared dw_pcie_suspend_noirq() and
    dw_pcie_resume_noirq() unconditionally, even though they were only
    implemented when CONFIG_PCIE_DW_HOST was defined.
    
    Add no-op stubs for them when CONFIG_PCIE_DW_HOST is not defined so
    drivers that support both Root Complex and Endpoint modes don't need
    
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>


diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 8c0222f019d7..f400f562700e 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -500,9 +500,6 @@ void dw_pcie_iatu_detect(struct dw_pcie *pci);
 int dw_pcie_edma_detect(struct dw_pcie *pci);
 void dw_pcie_edma_remove(struct dw_pcie *pci);
 
-int dw_pcie_suspend_noirq(struct dw_pcie *pci);
-int dw_pcie_resume_noirq(struct dw_pcie *pci);
-
 static inline void dw_pcie_writel_dbi(struct dw_pcie *pci, u32 reg, u32 val)
 {
 	dw_pcie_write_dbi(pci, reg, 0x4, val);
@@ -680,6 +677,8 @@ static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 }
 
 #ifdef CONFIG_PCIE_DW_HOST
+int dw_pcie_suspend_noirq(struct dw_pcie *pci);
+int dw_pcie_resume_noirq(struct dw_pcie *pci);
 irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp);
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
 int dw_pcie_host_init(struct dw_pcie_rp *pp);
@@ -688,6 +687,16 @@ int dw_pcie_allocate_domains(struct dw_pcie_rp *pp);
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 				       int where);
 #else
+static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+{
+	return 0;
+}
+
+static inline int dw_pcie_resume_noirq(struct dw_pcie *pci)
+{
+	return 0;
+}
+
 static inline irqreturn_t dw_handle_msi_irq(struct dw_pcie_rp *pp)
 {
 	return IRQ_NONE;

