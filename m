Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4291FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VylQ7k8yohnNcjotAcWmjWSVKpnetqoHH5hY+v4seCw=; b=pxC5+LTIDVHlgbkXMNiEuWhNLe
	HrlRfbqietGa1qudUhWap7UDHhjXvFH1jgJGJB4TqDgJBhXMpGw9bqSE8zLB7tvBRCNfXsSBQZ79b
	FD1oxlZy+UaO8uf9sa7CgKulspNumcIo3Li4a7YhabNUs/poHYyjZJMYZRD8Bw32ABBJ/XYWK59uu
	MsIxCjMvNqw45OyuBCKpLj7IanjcD8USNKOg8O0G09AZPKrBtKxGvO83BxRKPN2Fxt4RKpZaxtNYd
	UGTFUT4VvuLUDcERtCnjXjoWoTlf7NfAwiLhumtGf6ySKfLdXhnvDZtIlzssKBVPreDJXA/Sswgso
	ct22ao8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PvV-00000006R1Z-08x4;
	Wed, 09 Apr 2025 07:32:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Ptk-00000006QqD-19CR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 085DB68432;
	Wed,  9 Apr 2025 07:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC10C4CEE3;
	Wed,  9 Apr 2025 07:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744183859;
	bh=v3n5JgwpE6270eRrZMtFhK0CZ0KtsCC90coVUAGG9aE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oq9TuK38hrQocohwoPsnURn+ULs/oGCy9Y9IBcW4pjU6px6xjpvUzanY9a+Tahu3l
	 afwfMQxG3wf0pGQizMQWWc2tiywjUWmISG1LCARkEV9qODEgWCj4Wffh0dPFnrUpRA
	 aazDJpiwoq6Pl3PHRspEk+yrYY4DgZ2x5t1hF+osaryN5AyEz/fG+AEJr8EtnWpmKH
	 xUYQ3GqH4GUAi1T0xDEQyw3fEeewIt7TX3JUOy0kXCNSdmOyY3jO8B6MY9fz9wFJcd
	 62VyS6lK9aXKHvfN4dxeL62ZShJWS68w2CKXBWRNgDFJ2/OoAkQG0LriOrsl8ABqvb
	 NZ/KJlsP8jQ8Q==
Date: Wed, 9 Apr 2025 09:30:52 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 18/24] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <Z/YiLNzRvXUgcHFc@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-18-1f26db465f8d@kernel.org>
 <877c3uuy7u.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c3uuy7u.ffs@tglx>
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

On Tue, Apr 08, 2025 at 11:42:29PM +0200, Thomas Gleixner wrote:
> On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> > +
> > +static void gicv5_ppi_priority_init(void)
> > +{
> > +	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRIORITY_MI),
> > +				 SYS_ICC_PPI_PRIORITYR0_EL1);
> 
> Just let stick it out. You have 100 characters. All over the place...

I will do.

> > +static int gicv5_ppi_irq_set_irqchip_state(struct irq_data *d,
> > +					   enum irqchip_irq_state which,
> > +					   bool val)
> > +{
> > +	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> > +
> > +	switch (which) {
> > +	case IRQCHIP_STATE_PENDING:
> > +		if (val) {
> > +			if (d->hwirq < 64)
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_SPENDR0_EL1);
> > +			else
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_SPENDR1_EL1);
> > +
> > +		} else {
> > +			if (d->hwirq < 64)
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_CPENDR0_EL1);
> > +			else
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_CPENDR1_EL1);
> > +		}
> > +
> > +		return 0;
> > +	case IRQCHIP_STATE_ACTIVE:
> > +		if (val) {
> > +			if (d->hwirq < 64)
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_SACTIVER0_EL1);
> > +			else
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_SACTIVER1_EL1);
> > +		} else {
> > +			if (d->hwirq < 64)
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_CACTIVER0_EL1);
> > +			else
> > +				write_sysreg_s(hwirq_id_bit,
> > +					       SYS_ICC_PPI_CACTIVER1_EL1);
> > +		}
> 
> You already precalculate hwirq_id_bit. Can't you do something similar
> for the registers?
> 
> 	case IRQCHIP_STATE_PENDING:
>         	u32 reg = val ? SYS_ICC_PPI_SPENDR1_EL1 : SYS_ICC_PPI_SPENDR0_EL1;
> 
>                 write_sysreg_s(hwirq_id_bit, reg);
>                 return 0;
> 	case IRQCHIP_STATE_ACTIVE:
>                 ....
> 
> Ditto in the get_state() function.
> 
> No?

Yes, more readable.

> > +static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
> > +					  struct irq_fwspec *fwspec,
> > +					  irq_hw_number_t *hwirq,
> > +					  unsigned int *type)
> > +{
> > +	if (is_of_node(fwspec->fwnode)) {
> 
> It'd be way more readable to invert this check
> 
>      if (!is_of_node(...))
>      	return -EINVAL;
> 
> so that the subsequent checks are just a read through.

Will do.

> > +		if (fwspec->param_count < 3)
> > +			return -EINVAL;
> > +
> > +		if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI)
> > +			return -EINVAL;
> > +
> > +		*hwirq = fwspec->param[1];
> > +		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
> > +
> > +		return 0;
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> 
> > +static void gicv5_irq_ppi_domain_free(struct irq_domain *domain,
> > +				      unsigned int virq, unsigned int nr_irqs)
> > +{
> > +	struct irq_data *d;
> > +
> > +	if (WARN_ON(nr_irqs != 1))
> 
> WARN_ON_ONCE ?

Yes.

> > +		return;
> > +
> > +	d = irq_domain_get_irq_data(domain, virq);
> > +
> > +	irq_set_handler(virq, NULL);
> > +	irq_domain_reset_irq_data(d);
> > +}
> > +
> > +static int gicv5_irq_ppi_domain_select(struct irq_domain *d,
> > +				       struct irq_fwspec *fwspec,
> > +				       enum irq_domain_bus_token bus_token)
> > +{
> > +	/* Not for us */
> > +	if (fwspec->fwnode != d->fwnode)
> > +		return 0;
> > +
> > +	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI) {
> > +		// only handle PPIs
> 
> Commenting the obvious?
> 

Will remove it.

> > +		return 0;
> > +	}
> > +
> > +	return (d == gicv5_global_data.ppi_domain);
> > +}
> > +
> > +static const struct irq_domain_ops gicv5_irq_ppi_domain_ops = {
> > +	.translate	= gicv5_irq_ppi_domain_translate,
> > +	.alloc		= gicv5_irq_ppi_domain_alloc,
> > +	.free		= gicv5_irq_ppi_domain_free,
> > +	.select		= gicv5_irq_ppi_domain_select
> > +};
> > +
> > +static inline void handle_irq_per_domain(u32 hwirq)
> > +{
> > +	u32 hwirq_id;
> > +	struct irq_domain *domain = NULL;
> > +	u8 hwirq_type = FIELD_GET(GICV5_HWIRQ_TYPE, hwirq);
> 
> So far you managed to comply with the documented reverse fir tree
> ordering.
> 
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations
> 
> Why are you changing coding style in the middle of the code?

Mea culpa, don't bother commenting on this further, point taken.

> > +	hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, hwirq);
> > +
> > +	if (hwirq_type == GICV5_HWIRQ_TYPE_PPI)
> > +		domain = gicv5_global_data.ppi_domain;
> > +
> > +	if (generic_handle_domain_irq(domain, hwirq_id)) {
> > +		pr_err("Could not handle, hwirq = 0x%x", hwirq_id);
> 
> pr_err_once() perhaps?
> 
> > +		gicv5_hwirq_eoi(hwirq_id, hwirq_type);
> > +	}
> > +}
> > +
> > +static asmlinkage void __exception_irq_entry
> > +gicv5_handle_irq(struct pt_regs *regs)
> > +{
> > +	u64 ia;
> > +	bool valid;
> > +	u32 hwirq;
> 
> See above
> 
> > +	ia = gicr_insn(GICV5_OP_GICR_CDIA);
> > +	valid = GICV5_GIC_CDIA_VALID(ia);
> 
> And please move that to the declaration lines
> 
> > +static int __init gicv5_init_domains(struct fwnode_handle *handle)
> > +{
> > +	gicv5_global_data.fwnode = handle;
> > +	gicv5_global_data.ppi_domain = irq_domain_create_linear(
> > +		handle, 128, &gicv5_irq_ppi_domain_ops, NULL);
> 
> The ever changing choice of coding styles across functions is really
> interesting. Obviously the length of 'gicv5_global_data.ppi_domain'
> forces ugly, but that does not mean it needs to be that way:
> 
>        struct irqdomain *d;
> 
>        d = irq_domain_create_linear(handle, 128, &gicv5_irq_ppi_domain_ops, NULL);
>        if (!d)
>        		return - ENOMEM;
> 
>        irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
>        gicv5_global_data.fwnode = handle;
>        gicv5_global_data.ppi_domain = d;
>        return 0;
> 
> No?

Yes it is better.

> > +static int __init gicv5_of_init(struct device_node *node,
> > +				struct device_node *parent)
> > +{
> > +	int ret;
> > +
> > +	ret = gicv5_init_domains(&node->fwnode);
> > +	if (ret)
> > +		return ret;
> > +
> > +	gicv5_set_cpuif_pribits();
> > +
> > +	ret = gicv5_starting_cpu(smp_processor_id());
> 
> You invoke the CPU hotplug callback for the boot CPU explicitly, but
> what the heck installs the actual hotplug callback for the secondary
> CPUs?

That comes with a subsequent patch[21]. I mentioned in the cover letter
that I tried to split the functionality into interrupt types to ease
review (well, it does not look like I succeeded, sorry) and then in
patch [21] (when LPIs backing IPIs are implemented), enable SMP.

The point is, we need patches [18-21] to enable SMP booting.

I can squash [18-21] all together or I can enable the hotplug callback
here but this patch stand alone is not functional for the reasons
above, let me know please what's best in your opinion and I will do.

Above all, thank you very much for reviewing the series.

Lorenzo

