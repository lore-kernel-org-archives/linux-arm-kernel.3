Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2DDC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZ7udzms0JczLDj9lbjmgLMVfiwvfgEjvNF7ei/PyOc=; b=Mj/aIx0zG3gQ5k46gjkq6xuHgF
	d2dTSyeREk2UT2t/9b9nQaM8jmnQsfnyxlGVBBlKdtY6OJFcznL0feXwcK7IThxUhfQJFRDelfJrH
	s8Is/1RDxG4bGgieSyEzVpUpZvbVlewm22F0RB6VK7kB8j1Awm3sFZup2G5DpEboZ4/N1BYuGfUdS
	fUajr60Fj5kbV9eChtMnplcoNnxN0vH+GX9idSK9rHUvfHsopAzU8UXifmN4+HdmmCu8ox/2CAAc8
	amdJBkS836sYJP5eIUvMQIhoKOW/oEIHu3PdMDtZmHTl0l2hG0zB+fEIeDvWvzES4TDpL+T6KGwJk
	hnn9wljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjaO-0000000BGkE-1a9e;
	Mon, 05 Jan 2026 12:21:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcjaL-0000000BGje-2pt0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:21:23 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlD004KnWzJ46bf;
	Mon,  5 Jan 2026 20:20:16 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id EA91C4056B;
	Mon,  5 Jan 2026 20:21:16 +0800 (CST)
Received: from localhost (10.48.157.23) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 12:21:16 +0000
Date: Mon, 5 Jan 2026 12:21:14 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Marc
 Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-pci@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] PCI/MSI: Make the pci_msi_map_rid_ctlr_node()
 interface firmware agnostic
Message-ID: <20260105122114.000035e8@huawei.com>
In-Reply-To: <20251218-gicv5-host-acpi-v2-4-eec76cd1d40b@kernel.org>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
	<20251218-gicv5-host-acpi-v2-4-eec76cd1d40b@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.157.23]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_042122_002829_646EC55A 
X-CRM114-Status: GOOD (  24.62  )
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

On Thu, 18 Dec 2025 11:14:30 +0100
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

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
Hi Lorenzo,

A few minor comments inline.  All in the 'up to you' category.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---

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

I haven't read on but my assumption is of_node is never used for anything else.
I'd make that explicit by not having the local variable.
	if (irq_domain_get_of_node(domain))

Might even be worth a comment to say this is just checking of is in use for the
domain in general?

> +		struct device_node *msi_ctlr_node = NULL;
> +
> +		rid = of_msi_xlate(&pdev->dev, &msi_ctlr_node, rid);
> +		if (msi_ctlr_node)

Do you need the protection? Ultimately that depends on whether
setting *node = NULL on failure to match is a problem.
It's a bit subtle, but if your new code matches behavior of old code
then *node was always NULL at entry to this function so setting it
to NULL again (which is what happens if ms_ctrl_node == NULL) should
be fine.

Maybe it's all a bit subtle though so perhaps the check is worth having.

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


