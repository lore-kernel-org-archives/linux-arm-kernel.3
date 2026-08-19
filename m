Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9706AC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 19:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e22S2Y9/EK7c6rFE1KVoXB90JmbtRnFORvBglPDPLsA=; b=15EUXUaL2K6Uh/FGNMSRK7SMQq
	jx8QIfbi7rgO5714WxfH9jRsGnwzwsKGu4/X/rBGP08oHcWSl7pqFkoxNr9UDmXIQe5RUsXZHtAg/
	YWhWPPuIRsZhrVARRK0Wo84R936L52oj18Ey829zkkIBl7bH+k0KpaGQ8lwiJKACRudyxsu3EGh1Z
	R77NmgF6Lj1BthiMDVvJaq1KXE7PBwEc8b5NsmQ+9aOH/LJYbZYgQNETDasyXVujXH4CTZu24gD+E
	oglD+yJv7uk0B9MACCNwtFL5iqPSZWr3X5wDDWDNJaQhlRub131QaJ4EuRSknQu+42mpcVAHUhWw9
	Y25BED9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwm2J-0000000ASvC-1Q9l;
	Wed, 19 Aug 2026 19:33:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwm2G-0000000ASsR-35RB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 19:33:18 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787167991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e22S2Y9/EK7c6rFE1KVoXB90JmbtRnFORvBglPDPLsA=;
	b=TfftlYHaSsJWJa0wh07u57mBK6QGrkKCSS/vJ6CMV8HGjWEHLHxLaO31xAS7KmYRcdzg8m
	rajGKi/S7JlPQkUlcVSmC9Wb5TCIWEPujTbtx4I9G+JhZZb2g5m+YV0+MmhYsVaZSeoA1S
	f3inu8mE356lhEfd7c5YZVVCGoTaqRTKo2iE3B5XblVQH1zHxxZygun+FuOgnxyr0eJgsF
	a4gIfMvN8P/NnyUaMPa+FLWsLMjM661aGXpxuz7/aQI78vU7UaA5Z+MFsDH4xJCJvs2HQJ
	+85ohrEczzEHynqoLAaaoWY2MRtcVRPox5Dbgna7Q0TQ+9QwxkAZ1+ZQJORkPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787167991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e22S2Y9/EK7c6rFE1KVoXB90JmbtRnFORvBglPDPLsA=;
	b=wVzU0ySrUHCpDnIdbOekvDw7Ci8LLrP6Obq/7zEnUIdYwMy4HdtdPodoM1INRErKccdA7G
	fNFRR3m4Gvq/g1Dw==
To: Tushar Nimkar <tushar.nimkar@amd.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Michal Simek <michal.simek@amd.com>, Anirudha Sarangi
 <anirudha.sarangi@amd.com>, git-dev@amd.com, Tushar Nimkar
 <tushar.nimkar@amd.com>
Subject: Re: [PATCH 2/2] irqchip: Add Xilinx Versal NET SMMU CSR interrupt
 controller driver
In-Reply-To: <20260817105251.1557770-1-tushar.nimkar@amd.com>
References: <20260817105251.1557770-1-tushar.nimkar@amd.com>
Date: Wed, 19 Aug 2026 21:33:10 +0200
Message-ID: <87ik55kirt.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_123316_954856_105FA0CB 
X-CRM114-Status: GOOD (  21.41  )
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

On Mon, Aug 17 2026 at 16:22, Tushar Nimkar wrote:
> +/**
> + * struct xilinx_smmu_csr - SMMU CSR interrupt controller context
> + * @base: MMIO base address of the CSR registers
> + * @domain: IRQ domain for the child interrupts
> + * @parent_irq: parent (GIC) IRQ this block is chained to
> + * @lock: protects the SMMU_CSR_IER/IDR/ISR read and writes

Please make the member descriptions tabular aligned

    @base:	MMIO ...
    @domain:	Interrupt domain

And yes, use interrupt and not IRQ. This is not twitter.

> +static void xilinx_smmu_csr_irq_mask(struct irq_data *d)
> +{
> +	struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
> +	u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
> +
> +	if (!mask)
> +		return;
> +
> +	raw_spin_lock(&csr->lock);

  guard(raw_spinlock)(&crs->lock);

> +	writel(mask, csr->base + SMMU_CSR_IDR);
> +	raw_spin_unlock(&csr->lock);
> +}
> +
> +static void xilinx_smmu_csr_irq_unmask(struct irq_data *d)
> +{
> +	struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
> +	u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
> +
> +	if (!mask)
> +		return;
> +
> +	raw_spin_lock(&csr->lock);

Ditto

> +	writel(mask, csr->base + SMMU_CSR_IER);
> +	raw_spin_unlock(&csr->lock);
> +}
> +
> +static void xilinx_smmu_csr_irq_ack(struct irq_data *d)
> +{
> +	struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
> +	u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
> +
> +	if (!mask)
> +		return;
> +
> +	raw_spin_lock(&csr->lock);

Ditto.

> +	writel(mask, csr->base + SMMU_CSR_ISR);
> +	raw_spin_unlock(&csr->lock);
> +}
> +
> +static struct irq_chip xilinx_smmu_csr_chip = {
> +	.name		= "xlnx-smmu-csr",
> +	.irq_mask	= xilinx_smmu_csr_irq_mask,
> +	.irq_unmask	= xilinx_smmu_csr_irq_unmask,
> +	.irq_ack	= xilinx_smmu_csr_irq_ack,
> +};
> +
> +static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
> +{
> +	struct xilinx_smmu_csr *csr = irq_desc_get_handler_data(desc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	u32 status, pending;
> +
> +	chained_irq_enter(chip, desc);
> +	raw_spin_lock(&csr->lock);

scoped_guard() if you can explain what the lock is actually protecting
here ...

> +	status = readl(csr->base + SMMU_CSR_ISR);
> +	raw_spin_unlock(&csr->lock);
> +
> +	/* Only service sources we support; SMMU_CSR_ISR latches raw status */
> +	pending = status & SMMU_INTR_ALL;
> +
> +	while (pending) {
> +		irq_hw_number_t hwirq = __ffs(pending);
> +		int ret;
> +
> +		ret = generic_handle_domain_irq(csr->domain, hwirq);
> +		if (ret) {
> +			raw_spin_lock(&csr->lock);
> +			writel(BIT(hwirq), csr->base + SMMU_CSR_ISR);
> +			raw_spin_unlock(&csr->lock);

... and here. There is _ONE_ chained demultiplex handler per chip, so where
is the concurrency vs. the read and write from/to SMMU_CSR_ISR?

The irq_ack() callback of the demultiplexed interrupts cannot happen
concurrently because that happens in the context of the demultiplexed
handler invoked by generic_handle_domain_irq(). No?

Not that I care about the performance of your code, but I care about
code clarity. If there is a reason for this magic lock voodoo here, then
please explain it in a comment.

Also this write here wants a comment. Why is the pending bit written
back in the failure case? I assume to acknowlegde the interrupt. How are
the interrupts which are handled acknowledged?

Also if this happens, then this code should make sure to mask this
interrupt line because if something left it unmasked it will come back
forever.

> +			pr_err_ratelimited("xilinx-smmu-csr: Failed to handle domain IRQ %lu: %d\n",
> +					   hwirq, ret);
> +		}
> +
> +		pending &= ~BIT(hwirq);
> +	}
> +static int __init xilinx_smmu_csr_init(struct device_node *node,
> +				       struct device_node *parent)

No line break required. You have 100 characters. Please fix that up all over the place.

> +{
> +	struct xilinx_smmu_csr *csr;
> +	int ret;
> +
> +	if (WARN_ON_ONCE(!parent))
> +		return -EINVAL;
> +
> +	if (irq_find_matching_fwnode(of_fwnode_handle(node),
> +				     DOMAIN_BUS_ANY))
> +		return -ENODEV;
> +
> +	csr = kzalloc(sizeof(*csr), GFP_KERNEL);

devm_kzalloc()

> +	if (!csr)
> +		return -ENOMEM;
> +
> +	raw_spin_lock_init(&csr->lock);
> +
> +	csr->base = of_iomap(node, 0);

devm_of_iomap()

> +	if (!csr->base) {
> +		ret = -ENOMEM;
> +		goto free;
> +	}
> +
> +	/* Start from a known state: all sources disabled, latches cleared. */
> +	writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_IDR);
> +	writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_ISR);
> +
> +	csr->domain = irq_domain_create_linear(of_fwnode_handle(node), SMMU_CSR_IRQ_NR,
> +					       &xilinx_smmu_csr_domain_ops,
> +					       csr);

devm_irq_domain_instantiate() or use this one:

 https://lore.kernel.org/lkml/20260819090543.585131-2-Zhipeng.wang_1@oss.nxp.com/

It's not merged into tip yet, but it will be.

> +	if (!csr->domain) {
> +		pr_err("%pOF: failed to create irq domain\n", node);
> +		ret = -ENOMEM;
> +		goto unmap;

with that all these 'ret = -ERROR; goto foo;' go away.

Thanks,

        tglx

