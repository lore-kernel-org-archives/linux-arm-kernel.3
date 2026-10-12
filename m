Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C58CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OvxSb9ZmbrBCCxXRSH0eP07By9mubA8iC8WBFfeHQc0=; b=Wsqx4pLHk/hOTbgVOtiDF9xM2X
	lWVUvN4cfppAPSsbhSIaLq39WvCyI8W64HFuxz1tmyBwI/SWtW3vPEE5ppb9M5PY1Oa9sorWIfod+
	Rm6o/98kevWQH5PS/Usq9hkxw0SqNKjuU8QFtQpCWbrRl4BGFtRViIAWQ2eXvRJ7skBS1WJHuW1Ar
	7LYAtv1kkZM5fAcgZmPSqULoPOb2mk1JpwgkAdqcpfxvp3+/PoX6Cg9kRC3kWKQSo5+G6+l/onOPl
	w9fFEfk2dv+1CePtC7qdq5wjTCFPJCekBEmVX54KvfGPRA5X1eO5EYOVS3scyRDRCY1znx5zqD4dz
	ui8dCNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNrx-0000000BZqY-3mal;
	Mon, 12 Oct 2026 21:47:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNrw-0000000BZqC-1lTH;
	Mon, 12 Oct 2026 21:47:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8027F6025A;
	Mon, 12 Oct 2026 21:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC1FA1F008A2;
	Mon, 12 Oct 2026 21:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791841659;
	bh=OvxSb9ZmbrBCCxXRSH0eP07By9mubA8iC8WBFfeHQc0=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Ym7jp0bJ7zKj7jIiFoDence3wt6IpkVvey1gesMB5OsqL2FVyhxTIAFWTt6omO/sQ
	 /CmI9b7J43eDT68M/CAsJhUUSsscRmDhWIUFKXNyFHnEeUTNa9QMdCBMmhJ1HguYIq
	 zmpHwkthBmdY10jvkBozYby4xESTzM/U/V2WLvYIu1nya6SpZ2Kcat4VNrgHixj9+a
	 xDJa+L9sBCGNUVkTkDpKJA8Py6BOAH10pQZpwEf1//+lSXpfKviAkZg5PyM8ZIcARR
	 SqH7wjchxOPfN+QLEf05WDWcJ1hmV671akqyyyknFUvZtyF4vVMCcIPA4vvKXblKTL
	 11Gj1dG2pJsZg==
Date: Mon, 12 Oct 2026 16:47:37 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Han / =?utf-8?B?7ZWc7IOB7JqwU2FuZ3dvbw==?= <sangwoo.han@nearthlab.com>
Cc: Thomas Gleixner <tglx@kernel.org>, jim2101024@gmail.com,
	florian.fainelli@broadcom.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com,
	bcm-kernel-feedback-list@broadcom.com, robh@kernel.org,
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
Message-ID: <20261012214737.GA1400495@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <871pa9gqy0.ffs@fw13>
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

On Thu, Oct 01, 2026 at 09:29:27PM +0200, Thomas Gleixner wrote:
> On Mon, Sep 21 2026 at 18:05, Han / 한상우Sangwoo wrote:
> > I tested Thomas's patch on the same hardware setup with the 5-vector
> > MSI endpoint. The patch was applied as posted on top of 6.12.93
> > (rpi-6.12.y).
> >
> > With the patch applied:
> >
> > - The MSI base hwirq remained at 0x8 across 200 driver reload cycles.
> > - The driver got all 5 requested vectors on every cycle, with no
> > single-MSI fallback. Multiple Message Enable remained at 8.
> > - The brcmstb inner-domain mapping returned to baseline after each
> > unload/reload, with 12 mapped while the driver was loaded and 4 after
> > unload.
> > - A kprobe showed one allocation of 8 vectors followed by eight
> > single-vector frees, with nothing left over.
> 
> 8 single vector frees?
> 
> Seems I got something wrong there verus the bulk free. Updated patch
> below.
> 
> > The MSI vector exhaustion issue I originally observed no longer
> > reproduces with the patch.
> 
> Good. Can you please retest with the updated patch?

Sangwoo, any update on this?

I don't see this patch in linux-next (next-20261012), so I don't think
this will be fixed for v7.4 unless something moves it ahead.

> > I also observed a KASAN report with managed affinity. Using a small
> > out-of-tree test module bound to the same endpoint and requesting 1..3
> > vectors with PCI_IRQ_MSI | PCI_IRQ_AFFINITY, a request for 3 vectors
> > resulted in:
> >
> > BUG: KASAN: slab-out-of-bounds in __irq_alloc_descs+0x158/0x460
> >
> > Requests for 5 and 7 vectors were capped to 4 on this 4-CPU system and
> > did not trigger the report. I have not checked this against the
> > unpatched kernel yet, so I cannot tell whether it is related to the
> > patch.
> 
> Any updates on that? Also please provide the source for that test.
> 
> Thanks,
> 
>         tglx
> ---
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -1610,6 +1610,17 @@ static void irq_domain_free_irqs_hierarc
>  	if (!domain->ops->free)
>  		return;
>  
> +	/*
> +	 * MSI device domains are capable of bulk free.
> +	 *
> +	 * CHECKME: Are all MSI parent domains capable?
> +	 */
> +	if (domain->flags & (IRQ_DOMAIN_FLAG_MSI_DEVICE | IRQ_DOMAIN_FLAG_MSI_PARENT)) {
> +		if (irq_domain_get_irq_data(domain, irq_base))
> +			domain->ops->free(domain, irq_base, nr_irqs);
> +		return;
> +	}
> +
>  	for (i = 0; i < nr_irqs; i++) {
>  		if (irq_domain_get_irq_data(domain, irq_base + i))
>  			domain->ops->free(domain, irq_base + i, 1);
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -1333,20 +1333,28 @@ static int __msi_domain_alloc_irqs(struc
>  
>  		ops->set_desc(&arg, desc);
>  
> -		virq = __irq_domain_alloc_irqs(domain, -1, desc->nvec_used,
> +		/* Make sure a MULTI-MSI allocation is power of two */
> +		unsigned int nvec_aligned = roundup_pow_of_two(desc->nvec_used);
> +
> +		virq = __irq_domain_alloc_irqs(domain, -1, nvec_aligned,
>  					       dev_to_node(dev), &arg, false,
>  					       desc->affinity);
>  		if (virq < 0)
>  			return msi_handle_pci_fail(domain, desc, allocated);
>  
> -		for (i = 0; i < desc->nvec_used; i++) {
> +		for (i = 0; i < nvec_aligned; i++) {
>  			irq_set_msi_desc_off(virq, i, desc);
>  			irq_debugfs_copy_devname(virq + i, dev);
>  			ret = msi_init_virq(domain, virq + i, vflags);
>  			if (ret)
>  				return ret;
>  		}
> +
>  		if (info->flags & MSI_FLAG_DEV_SYSFS) {
> +			/*
> +			 * This only exposes desc->nvec_used and ignores the
> +			 * overallocated MULTI-MSI ones.
> +			 */
>  			ret = msi_sysfs_populate_desc(dev, desc);
>  			if (ret)
>  				return ret;
> @@ -1610,13 +1618,15 @@ static void __msi_domain_free_irqs(struc
>  			continue;
>  
>  		/* Make sure all interrupts are deactivated */
> -		for (i = 0; i < desc->nvec_used; i++) {
> +		unsigned int nvec_aligned = roundup_pow_of_two(desc->nvec_used);
> +
> +		for (i = 0; i < nvec_aligned; i++) {
>  			irqd = irq_domain_get_irq_data(domain, desc->irq + i);
>  			if (irqd && irqd_is_activated(irqd))
>  				irq_domain_deactivate_irq(irqd);
>  		}
>  
> -		irq_domain_free_irqs(desc->irq, desc->nvec_used);
> +		irq_domain_free_irqs(desc->irq, nvec_aligned);
>  		if (info->flags & MSI_FLAG_DEV_SYSFS)
>  			msi_sysfs_remove_desc(dev, desc);
>  		desc->irq = 0;

