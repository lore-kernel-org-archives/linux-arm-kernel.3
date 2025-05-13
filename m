Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82913C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFzbwOA81P5sS+hYMBCOhRe8L6e57vhIa9vpahzlRbk=; b=q66LtrzdeYf+9JjcppG9kwNjxc
	tfSEfIzueJzzV7uWohTnODSbn0AM4sxvzr5TwwjwxW0IuyXrMYpfGPwTrUHj1MN5GiUO3MeHNzKnc
	1//t47U5wzxYkAh+wqoLfHQB8h/50VG6YOuSrlcSBBJw7EJXRohivdydFF0rNt852niIQW//zUOhg
	bhBYknSbeeALNKd7cqMZF//tBUykFjI3fmGlJx2Y7VVv508HZ82jX2H2N+5RElE0I9tAu31VRtcDz
	iblA+CyWoCwEPO+V5Fw93qFoBoB3WsSlwcqwvZzk/25MESyezVBAxxSTMZzEvUNEzhvwC1KjKkCfp
	6fVod3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEukz-0000000DIol-3GGm;
	Tue, 13 May 2025 18:53:37 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEu1d-0000000DCLl-3G91
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 18:06:47 +0000
Date: Tue, 13 May 2025 14:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1747159601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFzbwOA81P5sS+hYMBCOhRe8L6e57vhIa9vpahzlRbk=;
	b=NCH+txNr+FH6s7cvCCufHbFl9gjJ7CG4d9M4HbjCjESVWYm51bl/RZJnUn+SJBVWkxSda6
	ll52LC69nokIUQ4s/dfb0zl5pUkmvahVcnfRuk1gBCpp5LQzdLoO7pTkb4xBcRROkMbjRx
	y7bmI7Yb/weMzdLy5tXCX0nQaQemLVZNcTu6Nv+2onm1CzBzxQpYGLLwdugKhM5isuJU0y
	8MlPwbFhmOjm73RPl1uw+NZhjhUdBxjGcAwgBDM3SxAQwiOMGgoCu4dLMXKx5X5mP8FPjw
	MzeUcB6VlfQ+gjtPC5GtPzXJPUZ5DUp63KLU2doPoC8Jkd+dApJe4IniiewyyQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 7/9] PCI: apple: Convert to MSI parent infrastructure
Message-ID: <aCOKLCaU64JLbfKB@blossom>
References: <20250513172819.2216709-1-maz@kernel.org>
 <20250513172819.2216709-8-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513172819.2216709-8-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_110646_443832_CBD977EB 
X-CRM114-Status: GOOD (  24.26  )
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

Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Tue , May 13, 2025 at 06:28:17PM +0100, Marc Zyngier a écrit :
> In an effort to move arm64 away from the legacy MSI setup,
> convert the apple PCIe driver to the MSI-parent infrastructure
> and let each device have its own MSI domain.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/pci/controller/Kconfig      |  1 +
>  drivers/pci/controller/pcie-apple.c | 62 ++++++++++-------------------
>  2 files changed, 22 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> index 9800b76810540..98a62f4559dfd 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -40,6 +40,7 @@ config PCIE_APPLE
>  	depends on OF
>  	depends on PCI_MSI
>  	select PCI_HOST_COMMON
> +	select IRQ_MSI_LIB
>  	help
>  	  Say Y here if you want to enable PCIe controller support on Apple
>  	  system-on-chips, like the Apple M1. This is required for the USB
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 18e11b9a7f464..6c88b4dd34151 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -22,6 +22,7 @@
>  #include <linux/kernel.h>
>  #include <linux/iopoll.h>
>  #include <linux/irqchip/chained_irq.h>
> +#include <linux/irqchip/irq-msi-lib.h>
>  #include <linux/irqdomain.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> @@ -133,7 +134,6 @@ struct apple_pcie {
>  	struct mutex		lock;
>  	struct device		*dev;
>  	void __iomem            *base;
> -	struct irq_domain	*domain;
>  	unsigned long		*bitmap;
>  	struct list_head	ports;
>  	struct completion	event;
> @@ -162,27 +162,6 @@ static void rmw_clear(u32 clr, void __iomem *addr)
>  	writel_relaxed(readl_relaxed(addr) & ~clr, addr);
>  }
>  
> -static void apple_msi_top_irq_mask(struct irq_data *d)
> -{
> -	pci_msi_mask_irq(d);
> -	irq_chip_mask_parent(d);
> -}
> -
> -static void apple_msi_top_irq_unmask(struct irq_data *d)
> -{
> -	pci_msi_unmask_irq(d);
> -	irq_chip_unmask_parent(d);
> -}
> -
> -static struct irq_chip apple_msi_top_chip = {
> -	.name			= "PCIe MSI",
> -	.irq_mask		= apple_msi_top_irq_mask,
> -	.irq_unmask		= apple_msi_top_irq_unmask,
> -	.irq_eoi		= irq_chip_eoi_parent,
> -	.irq_set_affinity	= irq_chip_set_affinity_parent,
> -	.irq_set_type		= irq_chip_set_type_parent,
> -};
> -
>  static void apple_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
>  {
>  	msg->address_hi = upper_32_bits(DOORBELL_ADDR);
> @@ -226,8 +205,7 @@ static int apple_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
>  
>  	for (i = 0; i < nr_irqs; i++) {
>  		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> -					      &apple_msi_bottom_chip,
> -					      domain->host_data);
> +					      &apple_msi_bottom_chip, pcie);
>  	}
>  
>  	return 0;
> @@ -251,12 +229,6 @@ static const struct irq_domain_ops apple_msi_domain_ops = {
>  	.free	= apple_msi_domain_free,
>  };
>  
> -static struct msi_domain_info apple_msi_info = {
> -	.flags	= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
> -		   MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX),
> -	.chip	= &apple_msi_top_chip,
> -};
> -
>  static void apple_port_irq_mask(struct irq_data *data)
>  {
>  	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
> @@ -595,6 +567,18 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	return 0;
>  }
>  
> +static const struct msi_parent_ops apple_msi_parent_ops = {
> +	.supported_flags	= (MSI_GENERIC_FLAGS_MASK	|
> +				   MSI_FLAG_PCI_MSIX		|
> +				   MSI_FLAG_MULTI_PCI_MSI),
> +	.required_flags		= (MSI_FLAG_USE_DEF_DOM_OPS	|
> +				   MSI_FLAG_USE_DEF_CHIP_OPS	|
> +				   MSI_FLAG_PCI_MSI_MASK_PARENT),
> +	.chip_flags		= MSI_CHIP_FLAG_SET_EOI,
> +	.bus_select_token	= DOMAIN_BUS_PCI_MSI,
> +	.init_dev_msi_info	= msi_lib_init_dev_msi_info,
> +};
> +
>  static int apple_msi_init(struct apple_pcie *pcie)
>  {
>  	struct fwnode_handle *fwnode = dev_fwnode(pcie->dev);
> @@ -625,21 +609,17 @@ static int apple_msi_init(struct apple_pcie *pcie)
>  		return -ENXIO;
>  	}
>  
> -	parent = irq_domain_create_hierarchy(parent, 0, pcie->nvecs, fwnode,
> -					     &apple_msi_domain_ops, pcie);
> +	parent = msi_create_parent_irq_domain(&(struct irq_domain_info){
> +			.fwnode		= fwnode,
> +			.ops		= &apple_msi_domain_ops,
> +			.size		= pcie->nvecs,
> +			.host_data	= pcie,
> +			.parent		= parent,
> +		}, &apple_msi_parent_ops);
>  	if (!parent) {
>  		dev_err(pcie->dev, "failed to create IRQ domain\n");
>  		return -ENOMEM;
>  	}
> -	irq_domain_update_bus_token(parent, DOMAIN_BUS_NEXUS);
> -
> -	pcie->domain = pci_msi_create_irq_domain(fwnode, &apple_msi_info,
> -						 parent);
> -	if (!pcie->domain) {
> -		dev_err(pcie->dev, "failed to create MSI domain\n");
> -		irq_domain_remove(parent);
> -		return -ENOMEM;
> -	}
>  
>  	return 0;
>  }
> -- 
> 2.39.2
> 

