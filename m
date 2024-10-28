Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753F2D5B144
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+Os3sIDkyLTxp+Q1Etclyz80BkquFk+b0V9pAR3X4c=; b=u6G0q5nMxTir+u9Qn2Ww/hqTi/
	vxI9fVsXBiaOc0rFw0F4UXFylMvV/q7rXGS3De4d/8pSppaiQGuMQozfY3e5goWOwKXHJZNHPwuwm
	HMwWCNszmwb75EfbazBoto0aA7vPFE2fTTziNwrER0p9cPSjPNoPrFM/n9I1KXLYKRmXh6NuO1nkd
	zwj/iOxyJEizyIHMwQUtSgfZU4Gr6D8r70elysJByVZ67q9y9v0/+Q/HTBi2lcFNaXqdr+Pnoyo6m
	1uRFwemo6DrJBfseM1C1eV59eM8QAOjXulTIugwsRwBR/8sBTWFwiPsvJOVfO6gHG3Cqh8w04kWpe
	9XjJTkGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5W2T-0000000C6lj-0jmH;
	Mon, 28 Oct 2024 20:08:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5W0l-0000000C6Q4-1EHP;
	Mon, 28 Oct 2024 20:06:50 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730146005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N+Os3sIDkyLTxp+Q1Etclyz80BkquFk+b0V9pAR3X4c=;
	b=wCWqvspGE9QIMaJUGyQdB933wfrC6rd/+gheavMM5coROFeRKoleVj5oP8V/3rjek0e1F1
	HqjkRUJkYCyk8JQOCfLJN6t/+bQ1yF7IkG7eyMLXzI2JMQRQeB+uGwlSvieHnlfGD/WhkZ
	+WfMQprkjMzvZBSyVq2Ak2jisHyYBgCwFKtFoP5R2YxGI+a3uq8vD1VDdPZ4xn1es7/oaP
	5CwHLFc/pOUpeLJjt6Ht4FlIz21tAv4w3HKIMR1DJq0FPTam0QPG9aIC10vlkFqyGfPHGK
	aZJp5xX04/3cCkjmX6yDDviCees69d9G1X4TurGT6gkAcuFHjueyqKtNnZ5wvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730146005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N+Os3sIDkyLTxp+Q1Etclyz80BkquFk+b0V9pAR3X4c=;
	b=rRTjLwKvdpfoRhvKvGp33/j4XmzKcTNajXe2Xl17clcpcPsppXfrXC1itt+abaBYDLLBkA
	yoKPdoF+o+ucmoDA==
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 kw@linux.com, Philipp Zabel <p.zabel@pengutronix.de>, Andrea della Porta
 <andrea.porta@suse.com>, Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH v4 03/10] irqchip: Add Broadcom bcm2712 MSI-X interrupt
 controller
In-Reply-To: <20241025124515.14066-4-svarbanov@suse.de>
References: <20241025124515.14066-1-svarbanov@suse.de>
 <20241025124515.14066-4-svarbanov@suse.de>
Date: Mon, 28 Oct 2024 21:06:45 +0100
Message-ID: <87ttcw0z6y.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_130647_635134_1D3E7D0C 
X-CRM114-Status: GOOD (  21.15  )
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

On Fri, Oct 25 2024 at 15:45, Stanimir Varbanov wrote:

> Add an interrupt controller driver for MSI-X Interrupt Peripheral (MIP)
> hardware block found in bcm2712. The interrupt controller is used to
> handle MSI-X interrupts from peripherials behind PCIe endpoints like
> RP1 south bridge found in RPi5.
>
> There are two MIPs on bcm2712, the first has 64 consecutive SPIs
> assigned to 64 output vectors, and the second has 17 SPIs, but only
> 8 of them are consecutive starting at the 8th output vector.

This starts to converge nicely. Just a few remaining nitpicks.

> +static int mip_alloc_hwirq(struct mip_priv *mip, unsigned int nr_irqs,
> +			   unsigned int *hwirq)
> +{
> +	int bit;
> +
> +	spin_lock(&mip->lock);
> +	bit = bitmap_find_free_region(mip->bitmap, mip->num_msis,
> +				      ilog2(nr_irqs));
> +	spin_unlock(&mip->lock);

This should be

        scoped_guard(spinlock, &mip->lock)
		bit = bitmap_find_free_region(mip->bitmap, mip->num_msis, ilog2(nr_irqs));

> +	if (bit < 0)
> +		return bit;
> +
> +	if (hwirq)
> +		*hwirq = bit;

But what's the point of this conditional? The only call site hands in a
valid pointer, no?

> +	return 0;

And therefore the whole thing can be simplified to:

static int mip_alloc_hwirq(struct mip_priv *mip, unsigned int nr_irqs)
{
        guard(spinlock)(&mip_lock);
        return bitmap_find_free_region(mip->bitmap, mip->num_msis, ilog2(nr_irqs));
}

and the callsite becomes:

        irq = mip_alloc_hwirq(mip, nr_irqs);
        if (irq < 0)
        	return irq;
Hmm?

> +}
> +
> +static void mip_free_hwirq(struct mip_priv *mip, unsigned int hwirq,
> +			   unsigned int nr_irqs)
> +{
> +	spin_lock(&mip->lock);

	guard(spinlock)(&mip->lock);

> +	bitmap_release_region(mip->bitmap, hwirq, ilog2(nr_irqs));
> +	spin_unlock(&mip->lock);
> +}

> +	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &fwspec);
> +	if (ret) {
> +		mip_free_hwirq(mip, irq, nr_irqs);
> +		return ret;

                goto err_free_hwirq; ?

> +	}
> +
> +	for (i = 0; i < nr_irqs; i++) {
> +		irqd = irq_domain_get_irq_data(domain->parent, virq + i);
> +		irqd->chip->irq_set_type(irqd, IRQ_TYPE_EDGE_RISING);
> +
> +		ret = irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +						    &mip_middle_irq_chip, mip);
> +		if (ret)
> +			goto err_free;
> +
> +		irqd = irq_get_irq_data(virq + i);
> +		irqd_set_single_target(irqd);
> +		irqd_set_affinity_on_activate(irqd);
> +	}
> +
> +	return 0;
> +
> +err_free:
> +	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
> +	mip_free_hwirq(mip, irq, nr_irqs);
> +	return ret;
> +}
> +
> +static int __init mip_of_msi_init(struct device_node *node,
> +				  struct device_node *parent)

No line break required here.

> +{
> +	struct platform_device *pdev;
> +	struct mip_priv *mip;
> +	int ret;
> +
> +	pdev = of_find_device_by_node(node);
> +	of_node_put(node);
> +	if (!pdev)
> +		return -EPROBE_DEFER;
> +
> +	mip = kzalloc(sizeof(*mip), GFP_KERNEL);
> +	if (!mip)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&mip->lock);
> +	mip->dev = &pdev->dev;
> +
> +	ret = mip_parse_dt(mip, node);
> +	if (ret)
> +		goto err_priv;
> +
> +	mip->base = of_iomap(node, 0);
> +	if (!mip->base) {
> +		ret = -ENXIO;
> +		goto err_priv;
> +	}
> +
> +	mip->bitmap = bitmap_zalloc(mip->num_msis, GFP_KERNEL);
> +	if (!mip->bitmap) {
> +		ret = -ENOMEM;
> +		goto err_base;
> +	}
> +
> +	/*
> +	 * All MSI-X masked in for the host, masked out for the
> +	 * VPU, and edge-triggered.
> +	 */
> +	writel(0, mip->base + MIP_INT_MASKL_HOST);
> +	writel(0, mip->base + MIP_INT_MASKH_HOST);
> +	writel(~0, mip->base + MIP_INT_MASKL_VPU);
> +	writel(~0, mip->base + MIP_INT_MASKH_VPU);
> +	writel(~0, mip->base + MIP_INT_CFGL_HOST);
> +	writel(~0, mip->base + MIP_INT_CFGH_HOST);

What undoes that in case mpi_init_domains() fails? Or is it harmless? I
really have no idea what masked in and masked out means here.

> +	dev_dbg(&pdev->dev,
> +		"MIP: MSI-X count: %u, base: %u, offset: %u, msg_addr: %llx\n",

Please move the string up. You have 100 characters width available.

> +		mip->num_msis, mip->msi_base, mip->msi_offset, mip->msg_addr);

Thanks,

        tglx

