Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F215C79FA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hQ4uICTlNXpekPtn9vswe4r0aAmTeEXI4c21WdWj3Rg=; b=pIRZjtbBrGV425
	iBqSRib3jUdM7ND9a9DGda/k3Xm8aTa6/1iMV+H6m0fWIMxq+Es4PVufLAdbr4mmXCuoczHvrKwKe
	akymOeKXcZbfkqmh2wQr/2eZMfF2HAgh0MATWJOirXHxkLA/DDJEPW4MOoatys+nKi4K1mJSh7svV
	n4LnWSQgVhXjDGPP/VVM49dNE3nXosxSaMsyiEmeeRxTQRIefwqoKqdiZrn0bsJsJp2/t/cEMV47y
	wRMGcLCmLWiGPKKwFUe/6dilfaLRLBDsvPKmhj7MW8sLOz0HseyRwzfpENEoyxtL0NmuOnE1Gq6Js
	KdByrBvi4B+vfPj4rFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoUU-0000000BqXZ-0ACQ;
	Mon, 05 Jan 2026 17:35:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoUS-0000000BqXJ-25cy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E99760010;
	Mon,  5 Jan 2026 17:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034C6C116D0;
	Mon,  5 Jan 2026 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767634535;
	bh=hRDqJrql8dctEWP20Bj6GrBkP/6rK2t9UtbGS9Tl++I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=liIZlzFhR9hQE/xJKCJAxhlo6ZD+9klal2OD/fPnl0tnPPOmGWCvjlUk49eulgzVd
	 tgXv/z2EoaboHYtvkORhUCs7wGU5MhwzrFIsTGRKsYpUgUZ4Q2uDx9xTybyFhtF7oT
	 kmPp+MAwvzGI9gfRQIrBMjuNYuXy4giW1ZKeVQWMh9+8BUdHRjWr0raqrzQcadpqpx
	 vk5jbBJut7BR4a1r3e+bP+sbrcyrquLaBtE7/tEJWqDi/qwauyxwy2sZg9ADWV7zZ5
	 vY6BWqS1xKewfo2q0klPQ0kvTSh5NmkFdf5r2g/UX06MEl/nmcWx0WuM0y40fb36UK
	 JN1rNMDUMa2Mw==
Date: Mon, 5 Jan 2026 11:35:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 4/7] PCI/MSI: Make the pci_msi_map_rid_ctlr_node()
 interface firmware agnostic
Message-ID: <20260105173533.GA322546@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-gicv5-host-acpi-v2-4-eec76cd1d40b@kernel.org>
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

On Thu, Dec 18, 2025 at 11:14:30AM +0100, Lorenzo Pieralisi wrote:
> To support booting with OF and ACPI seamlessly, GIC ITS parent code
> requires the PCI/MSI irqdomain layer to implement a function to retrieve
> an MSI controller fwnode and map an RID in a firmware agnostic way
> (ie pci_msi_map_rid_ctlr_node()).
> 
> Convert pci_msi_map_rid_ctlr_node() to an OF agnostic interface
> (fwnode_handle based) and update the GIC ITS MSI parent code to reflect
> the pci_msi_map_rid_ctlr_node() change.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Marc Zyngier <maz@kernel.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I assume this series will be merged via some non-PCI tree.  Let me
know if you need anything else.

> ---
>  drivers/irqchip/irq-gic-its-msi-parent.c |  8 ++++----
>  drivers/pci/msi/irqdomain.c              | 22 +++++++++++++++++-----
>  include/linux/msi.h                      |  3 ++-
>  3 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> index 12f45228c867..4d1ad1ee005d 100644
> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> @@ -104,7 +104,7 @@ static int its_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
>  static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
>  				  int nvec, msi_alloc_info_t *info)
>  {
> -	struct device_node *msi_node = NULL;
> +	struct fwnode_handle *msi_node = NULL;
>  	struct msi_domain_info *msi_info;
>  	struct pci_dev *pdev;
>  	phys_addr_t pa;
> @@ -116,15 +116,15 @@ static int its_v5_pci_msi_prepare(struct irq_domain *domain, struct device *dev,
>  
>  	pdev = to_pci_dev(dev);
>  
> -	rid = pci_msi_map_rid_ctlr_node(pdev, &msi_node);
> +	rid = pci_msi_map_rid_ctlr_node(domain->parent, pdev, &msi_node);
>  	if (!msi_node)
>  		return -ENODEV;
>  
> -	ret = its_translate_frame_address(msi_node, &pa);
> +	ret = its_translate_frame_address(to_of_node(msi_node), &pa);
>  	if (ret)
>  		return -ENODEV;
>  
> -	of_node_put(msi_node);
> +	fwnode_handle_put(msi_node);
>  
>  	/* ITS specific DeviceID */
>  	info->scratchpad[0].ul = rid;
> diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
> index a329060287b5..3136341e802c 100644
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -376,23 +376,35 @@ u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
>  }
>  
>  /**
> - * pci_msi_map_rid_ctlr_node - Get the MSI controller node and MSI requester id (RID)
> + * pci_msi_map_rid_ctlr_node - Get the MSI controller fwnode_handle and MSI requester id (RID)
> + * @domain:	The interrupt domain
>   * @pdev:	The PCI device
> - * @node:	Pointer to store the MSI controller device node
> + * @node:	Pointer to store the MSI controller fwnode_handle
>   *
> - * Use the firmware data to find the MSI controller node for @pdev.
> + * Use the firmware data to find the MSI controller fwnode_handle for @pdev.
>   * If found map the RID and initialize @node with it. @node value must
>   * be set to NULL on entry.
>   *
>   * Returns: The RID.
>   */
> -u32 pci_msi_map_rid_ctlr_node(struct pci_dev *pdev, struct device_node **node)
> +u32 pci_msi_map_rid_ctlr_node(struct irq_domain *domain, struct pci_dev *pdev,
> +			      struct fwnode_handle **node)
>  {
> +	struct device_node *of_node;
>  	u32 rid = pci_dev_id(pdev);
>  
>  	pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
>  
> -	return of_msi_xlate(&pdev->dev, node, rid);
> +	of_node = irq_domain_get_of_node(domain);
> +	if (of_node) {
> +		struct device_node *msi_ctlr_node = NULL;
> +
> +		rid = of_msi_xlate(&pdev->dev, &msi_ctlr_node, rid);
> +		if (msi_ctlr_node)
> +			*node = of_fwnode_handle(msi_ctlr_node);
> +	}
> +
> +	return rid;
>  }
>  
>  /**
> diff --git a/include/linux/msi.h b/include/linux/msi.h
> index 8003e3218c46..8ddb05d5c96a 100644
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -702,7 +702,8 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg);
>  void pci_msi_mask_irq(struct irq_data *data);
>  void pci_msi_unmask_irq(struct irq_data *data);
>  u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
> -u32 pci_msi_map_rid_ctlr_node(struct pci_dev *pdev, struct device_node **node);
> +u32 pci_msi_map_rid_ctlr_node(struct irq_domain *domain, struct pci_dev *pdev,
> +			      struct fwnode_handle **node);
>  struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
>  void pci_msix_prepare_desc(struct irq_domain *domain, msi_alloc_info_t *arg,
>  			   struct msi_desc *desc);
> 
> -- 
> 2.50.1
> 

