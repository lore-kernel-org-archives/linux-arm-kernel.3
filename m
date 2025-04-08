Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAA3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 21:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dn5vQVdpj+6NFg9syCTLQKAefF57K+DJA73qfxXP2lA=; b=CCn171sJO8S9b0X6OSgPMTeNCi
	NQHN1gTLGYLqXhWz+jKOYQpwgLJKperGk13r2/AILPOEHuP4VMn4JBlub3qFPRdT/DKNfj1FbhHXP
	ctWu+ksI42RKQoKD6ZJgIzggJqamr2y4aDwaLjBmEo0VwAgNWkQowqy8Yg5bpF/gJi03OyZ/KwB8W
	zaD9EOLFTilmfyJHCRieEE30EywnWL+52ARvUhVd+pc2mUXamg0N4XoIuvdqJ3oYi68ITLV2d15Er
	jyryysElimaVUS541GOciW/ic/nL3IESy581xmKLrt5LfFTGvl3RJIjk8mGDz9bbhCeB3tEVlKwXN
	JQQMdNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Gk3-00000005TK5-0ZdM;
	Tue, 08 Apr 2025 21:44:23 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GiG-00000005T7M-2cUh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 21:42:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744148549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn5vQVdpj+6NFg9syCTLQKAefF57K+DJA73qfxXP2lA=;
	b=MFLpieLp0m41URh28V6jjWQ0WR8q2sIR0yLReJmbwQtRe/uVoWZT8PeP8Tce3jD2y8EXBK
	gugJoTXoUILS3MCReboMvC4kmFsqxnLfX8c/XElVFupkHdsRonI9JuNZC1Scj9ltIG1fxy
	zZsELf5QaZqCKDvyAD/tjELojEcgnaZ91YHWMSAg1SNELgVfWUAhq1FEgeZqM09eh1noHn
	B71+Aehbw+iRxend+b8iAwWvx7pMAAttp0gm3Y8AqnZAUvuikEdqI0Sul0X+Fd3gG99dMO
	G1rKoLxEjjvAvt/8XU9cHtxhtrpq0BXIbVwrKWDFVJHFAP/cAB3oN60GkiW+cQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744148549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dn5vQVdpj+6NFg9syCTLQKAefF57K+DJA73qfxXP2lA=;
	b=77EC+vEQ9WRjg5BR8Alx0YlpnaD9y8tA0EUeJZkVtxXzcDMp/CTNOxJDEUCyu8iNONtqJ3
	SVymjvzcKekwHeAw==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Timothy Hayes
 <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 18/24] irqchip/gic-v5: Add GICv5 PPI support
In-Reply-To: <20250408-gicv5-host-v1-18-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-18-1f26db465f8d@kernel.org>
Date: Tue, 08 Apr 2025 23:42:29 +0200
Message-ID: <877c3uuy7u.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_144232_943856_ED0BD613 
X-CRM114-Status: GOOD (  20.84  )
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

On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> +
> +static void gicv5_ppi_priority_init(void)
> +{
> +	write_sysreg_s(REPEAT_BYTE(GICV5_IRQ_PRIORITY_MI),
> +				 SYS_ICC_PPI_PRIORITYR0_EL1);

Just let stick it out. You have 100 characters. All over the place...

> +static int gicv5_ppi_irq_set_irqchip_state(struct irq_data *d,
> +					   enum irqchip_irq_state which,
> +					   bool val)
> +{
> +	u64 hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> +
> +	switch (which) {
> +	case IRQCHIP_STATE_PENDING:
> +		if (val) {
> +			if (d->hwirq < 64)
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_SPENDR0_EL1);
> +			else
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_SPENDR1_EL1);
> +
> +		} else {
> +			if (d->hwirq < 64)
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_CPENDR0_EL1);
> +			else
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_CPENDR1_EL1);
> +		}
> +
> +		return 0;
> +	case IRQCHIP_STATE_ACTIVE:
> +		if (val) {
> +			if (d->hwirq < 64)
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_SACTIVER0_EL1);
> +			else
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_SACTIVER1_EL1);
> +		} else {
> +			if (d->hwirq < 64)
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_CACTIVER0_EL1);
> +			else
> +				write_sysreg_s(hwirq_id_bit,
> +					       SYS_ICC_PPI_CACTIVER1_EL1);
> +		}

You already precalculate hwirq_id_bit. Can't you do something similar
for the registers?

	case IRQCHIP_STATE_PENDING:
        	u32 reg = val ? SYS_ICC_PPI_SPENDR1_EL1 : SYS_ICC_PPI_SPENDR0_EL1;

                write_sysreg_s(hwirq_id_bit, reg);
                return 0;
	case IRQCHIP_STATE_ACTIVE:
                ....

Ditto in the get_state() function.

No?

> +static int gicv5_irq_ppi_domain_translate(struct irq_domain *d,
> +					  struct irq_fwspec *fwspec,
> +					  irq_hw_number_t *hwirq,
> +					  unsigned int *type)
> +{
> +	if (is_of_node(fwspec->fwnode)) {

It'd be way more readable to invert this check

     if (!is_of_node(...))
     	return -EINVAL;

so that the subsequent checks are just a read through.

> +		if (fwspec->param_count < 3)
> +			return -EINVAL;
> +
> +		if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI)
> +			return -EINVAL;
> +
> +		*hwirq = fwspec->param[1];
> +		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
> +
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}

> +static void gicv5_irq_ppi_domain_free(struct irq_domain *domain,
> +				      unsigned int virq, unsigned int nr_irqs)
> +{
> +	struct irq_data *d;
> +
> +	if (WARN_ON(nr_irqs != 1))

WARN_ON_ONCE ?

> +		return;
> +
> +	d = irq_domain_get_irq_data(domain, virq);
> +
> +	irq_set_handler(virq, NULL);
> +	irq_domain_reset_irq_data(d);
> +}
> +
> +static int gicv5_irq_ppi_domain_select(struct irq_domain *d,
> +				       struct irq_fwspec *fwspec,
> +				       enum irq_domain_bus_token bus_token)
> +{
> +	/* Not for us */
> +	if (fwspec->fwnode != d->fwnode)
> +		return 0;
> +
> +	if (fwspec->param[0] != GICV5_HWIRQ_TYPE_PPI) {
> +		// only handle PPIs

Commenting the obvious?

> +		return 0;
> +	}
> +
> +	return (d == gicv5_global_data.ppi_domain);
> +}
> +
> +static const struct irq_domain_ops gicv5_irq_ppi_domain_ops = {
> +	.translate	= gicv5_irq_ppi_domain_translate,
> +	.alloc		= gicv5_irq_ppi_domain_alloc,
> +	.free		= gicv5_irq_ppi_domain_free,
> +	.select		= gicv5_irq_ppi_domain_select
> +};
> +
> +static inline void handle_irq_per_domain(u32 hwirq)
> +{
> +	u32 hwirq_id;
> +	struct irq_domain *domain = NULL;
> +	u8 hwirq_type = FIELD_GET(GICV5_HWIRQ_TYPE, hwirq);

So far you managed to comply with the documented reverse fir tree
ordering.

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

Why are you changing coding style in the middle of the code?

> +
> +	hwirq_id = FIELD_GET(GICV5_HWIRQ_ID, hwirq);
> +
> +	if (hwirq_type == GICV5_HWIRQ_TYPE_PPI)
> +		domain = gicv5_global_data.ppi_domain;
> +
> +	if (generic_handle_domain_irq(domain, hwirq_id)) {
> +		pr_err("Could not handle, hwirq = 0x%x", hwirq_id);

pr_err_once() perhaps?

> +		gicv5_hwirq_eoi(hwirq_id, hwirq_type);
> +	}
> +}
> +
> +static asmlinkage void __exception_irq_entry
> +gicv5_handle_irq(struct pt_regs *regs)
> +{
> +	u64 ia;
> +	bool valid;
> +	u32 hwirq;

See above

> +	ia = gicr_insn(GICV5_OP_GICR_CDIA);
> +	valid = GICV5_GIC_CDIA_VALID(ia);

And please move that to the declaration lines

> +static int __init gicv5_init_domains(struct fwnode_handle *handle)
> +{
> +	gicv5_global_data.fwnode = handle;
> +	gicv5_global_data.ppi_domain = irq_domain_create_linear(
> +		handle, 128, &gicv5_irq_ppi_domain_ops, NULL);

The ever changing choice of coding styles across functions is really
interesting. Obviously the length of 'gicv5_global_data.ppi_domain'
forces ugly, but that does not mean it needs to be that way:

       struct irqdomain *d;

       d = irq_domain_create_linear(handle, 128, &gicv5_irq_ppi_domain_ops, NULL);
       if (!d)
       		return - ENOMEM;

       irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
       gicv5_global_data.fwnode = handle;
       gicv5_global_data.ppi_domain = d;
       return 0;

No?

> +static int __init gicv5_of_init(struct device_node *node,
> +				struct device_node *parent)
> +{
> +	int ret;
> +
> +	ret = gicv5_init_domains(&node->fwnode);
> +	if (ret)
> +		return ret;
> +
> +	gicv5_set_cpuif_pribits();
> +
> +	ret = gicv5_starting_cpu(smp_processor_id());

You invoke the CPU hotplug callback for the boot CPU explicitly, but
what the heck installs the actual hotplug callback for the secondary
CPUs?

Thanks,

        tglx

