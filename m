Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327ACC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 18:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=U2pgX2929lgiRZeMx88Pme3kZDXM1ob1DUqx09/G8z4=; b=MtnOs/02DLbRKV
	EjC6plTUPlLDVeQE6W2yMv6lUPfksLs4/AY8zXVGu0PkSwsf+JN9JJWSgSu6/g6PechgU4zrYbEDz
	XLvQofrc9+W0UYi/oCUvofSm9993lq5pxEiqIxxtkrpFbeF/2xXsVo0h9z14Y6bhA0jhM4BlRJVEr
	pamGH9jXsdcSGnot75X3aYlPsbirnDdnYwDiJkAh4fNEWZmjuOg8j7t9Wm4I9GhaZyH/YBRhGBewC
	RC/ViPrzrfxsme5hu5nMr6bUuzLl90lyR+uT1yP9YOy9tbUY++P+cxL22sFutJZJSP22gzJY/VC3o
	bR5+w45co7gJAnDeY2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttWaw-0000000GinW-3ZUW;
	Sat, 15 Mar 2025 18:50:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttWZF-0000000GigR-3rTO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 18:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3922CA489CD;
	Sat, 15 Mar 2025 18:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D6FC4CEE5;
	Sat, 15 Mar 2025 18:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742064544;
	bh=OnKnsixMsIfR9PWM2GKcKb1NM2Qu2lps2DgKe5a/iVM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SC2mtGbhf3T7iUSmBYdVeklwCEwI13OQ6a3CqVJG9hdTduV8tMC8viwCK5PQ5svgt
	 yEFwpbQLSaMovvNo1DNNefn270I4Y9SmAYepdWmGF1MrsZeUpF0i3fAo4inK54pOG0
	 L1gMGSoCR0of0daaOOodYfCP662k/xMF040MMUZ9NsYjiQXym4MYKxKO7qDvid3sTo
	 WkOrWCyoYBuXRICkq5ZpEQyirDW90mN0J2qI74H3xxsjoI9IxeZATbGITayZiz9pZQ
	 AIQvWwR+kA/Me6BczXJbR4gkhcjMt2l5z0GTgKpd4AhA2hUQVs02M2A1EHulV0TXJU
	 dR2CF94O0F6cw==
Date: Sat, 15 Mar 2025 13:49:03 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
	catalin.marinas@arm.com, conor+dt@kernel.org,
	dan.carpenter@linaro.org, dave.hansen@linux.intel.com,
	decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com,
	joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com,
	kys@microsoft.com, lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, yuzenghui@huawei.com,
	devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	x86@kernel.org, apais@microsoft.com, benhill@microsoft.com,
	bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v6 11/11] PCI: hv: Get vPCI MSI IRQ domain
 from DeviceTree
Message-ID: <20250315184903.GA848938@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315001931.631210-12-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_114906_092614_78B6DF3D 
X-CRM114-Status: GOOD (  25.85  )
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

On Fri, Mar 14, 2025 at 05:19:31PM -0700, Roman Kisel wrote:
> The hyperv-pci driver uses ACPI for MSI IRQ domain configuration on
> arm64. It won't be able to do that in the VTL mode where only DeviceTree
> can be used.
> 
> Update the hyperv-pci driver to get vPCI MSI IRQ domain in the DeviceTree
> case, too.
> 
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Looks good to me; trivial whitespace comment below.

> ---
>  drivers/pci/controller/pci-hyperv.c | 73 ++++++++++++++++++++++++++---
>  1 file changed, 67 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index 6084b38bdda1..cbff19e8a07c 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -50,6 +50,7 @@
>  #include <linux/irqdomain.h>
>  #include <linux/acpi.h>
>  #include <linux/sizes.h>
> +#include <linux/of_irq.h>
>  #include <asm/mshyperv.h>
>  
>  /*
> @@ -817,9 +818,17 @@ static int hv_pci_vec_irq_gic_domain_alloc(struct irq_domain *domain,
>  	int ret;
>  
>  	fwspec.fwnode = domain->parent->fwnode;
> -	fwspec.param_count = 2;
> -	fwspec.param[0] = hwirq;
> -	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
> +	if (is_of_node(fwspec.fwnode)) {
> +		/* SPI lines for OF translations start at offset 32 */
> +		fwspec.param_count = 3;
> +		fwspec.param[0] = 0;
> +		fwspec.param[1] = hwirq - 32;
> +		fwspec.param[2] = IRQ_TYPE_EDGE_RISING;
> +	} else {
> +		fwspec.param_count = 2;
> +		fwspec.param[0] = hwirq;
> +		fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
> +	}
>  
>  	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
>  	if (ret)
> @@ -887,10 +896,47 @@ static const struct irq_domain_ops hv_pci_domain_ops = {
>  	.activate = hv_pci_vec_irq_domain_activate,
>  };
>  
> +#ifdef CONFIG_OF
> +
> +static struct irq_domain *hv_pci_of_irq_domain_parent(void)
> +{
> +	struct device_node *parent;
> +	struct irq_domain *domain;
> +
> +	parent = of_irq_find_parent(hv_get_vmbus_root_device()->of_node);
> +	if (!parent)
> +		return NULL;
> +	domain = irq_find_host(parent);
> +	of_node_put(parent);
> +
> +	return domain;
> +}
> +
> +#endif
> +
> +#ifdef CONFIG_ACPI
> +
> +static struct irq_domain *hv_pci_acpi_irq_domain_parent(void)
> +{
> +	struct irq_domain *domain;
> +	acpi_gsi_domain_disp_fn gsi_domain_disp_fn;
> +
> +	if (acpi_irq_model != ACPI_IRQ_MODEL_GIC)
> +		return NULL;
> +	gsi_domain_disp_fn = acpi_get_gsi_dispatcher();
> +	if (!gsi_domain_disp_fn)
> +		return NULL;
> +	return irq_find_matching_fwnode(gsi_domain_disp_fn(0),
> +				     DOMAIN_BUS_ANY);
> +}
> +
> +#endif
> +
>  static int hv_pci_irqchip_init(void)
>  {
>  	static struct hv_pci_chip_data *chip_data;
>  	struct fwnode_handle *fn = NULL;
> +	struct irq_domain *irq_domain_parent = NULL;
>  	int ret = -ENOMEM;
>  
>  	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
> @@ -907,9 +953,24 @@ static int hv_pci_irqchip_init(void)
>  	 * way to ensure that all the corresponding devices are also gone and
>  	 * no interrupts will be generated.
>  	 */
> -	hv_msi_gic_irq_domain = acpi_irq_create_hierarchy(0, HV_PCI_MSI_SPI_NR,
> -							  fn, &hv_pci_domain_ops,
> -							  chip_data);
> +#ifdef CONFIG_ACPI
> +	if (!acpi_disabled)
> +		irq_domain_parent = hv_pci_acpi_irq_domain_parent();
> +#endif
> +#if defined(CONFIG_OF)
> +	if (!irq_domain_parent)
> +		irq_domain_parent = hv_pci_of_irq_domain_parent();
> +#endif
> +	if (!irq_domain_parent) {
> +		WARN_ONCE(1, "Invalid firmware configuration for VMBus interrupts\n");
> +		ret = -EINVAL;
> +		goto free_chip;
> +	}
> +
> +	hv_msi_gic_irq_domain = irq_domain_create_hierarchy(
> +		irq_domain_parent, 0, HV_PCI_MSI_SPI_NR,
> +		fn, &hv_pci_domain_ops,
> +		chip_data);

This is a different style of indenting the parameters than other
similar cases in this file, which line up parameters on subsequent
lines under the open parenthesis.

>  	if (!hv_msi_gic_irq_domain) {
>  		pr_err("Failed to create Hyper-V arm64 vPCI MSI IRQ domain\n");
> -- 
> 2.43.0
> 

