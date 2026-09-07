Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D051C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2KE0p1ANOYskMb814mDpz+QLuRe12o7f1q8RtEEwvAE=; b=zZJEbT2cKhb90m
	0V9uZMEJyPeoeUNnnRrL5CdxjZlFXTFoA3dZOjDaVOVQh/vkF0NoZuBqyTGESXLsMXu7vielMrSPv
	Ed/FX/4JypAlaZzl5aU3FNX4trVP7oy/wf9QV03jtjqSHM6t9EHuZgHKKFMOf9C9DY0yZXNe+NqoC
	t1TWA33cwKBl5d7ylHrV9LXaKbUgWHCb0/S/B8MGBDPWocI/YxpFsohXcJBTw7+G1jKC3dllqa0P/
	rPmf0xNUr09yQZmrywzm/oNl3Ruj4c5Sni55joryPTcEgEB9Zq7iPEWSUA3CFf9zK52UzlI0Hxq0H
	Q+O83DiUHZCQy3p9EBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cJ6-00000007JEH-1aJy;
	Mon, 07 Sep 2026 16:34:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cJ4-00000007JE1-3b5S;
	Mon, 07 Sep 2026 16:34:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4374A41382;
	Mon,  7 Sep 2026 16:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF021F00A3A;
	Mon,  7 Sep 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788798894;
	bh=2KE0p1ANOYskMb814mDpz+QLuRe12o7f1q8RtEEwvAE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=l3OKWJQKG0Mp9BLMNyiKZXxHGk19I9JDMXljZnLCvtxvUZf87I8bdjKmra8oPXKTw
	 rTdT3S5GAkgxxs2/0ktOyWbVTEuJnLrrosUbGWK06sOOyoULHouUJ/SMQSC6JVAN5b
	 3U4XJ/VQsFH3/EXlu2Y53bpwHWJYNqP2CFDYch7zF5Y5TcFHcOX5W8PDIc4JAcQAyW
	 WHsPgVaiUvjfIQkMMYK/DFzq7Mpx2Qa8qM4BUY55qLka0yKeyx5/h+vDEVKEg8B5Lo
	 20+qRxzW1jiczTEPiyZMviMmXu/T/Zf1kAaj3Fo76tc/kycFK/9FuDWVsCwMuuU0zl
	 FphsgMDlWBXyA==
Date: Mon, 7 Sep 2026 11:34:52 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sangwoo Han <sangwoo.han@nearthlab.com>
Cc: jim2101024@gmail.com, florian.fainelli@broadcom.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, bcm-kernel-feedback-list@broadcom.com,
	robh@kernel.org, linux-pci@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH] PCI: brcmstb: Reserve only the MSI vectors that are
 handed out
Message-ID: <20260907163452.GA2526539@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730072215.2090974-1-sangwoo.han@nearthlab.com>
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

[+cc Thomas, Inochi for MSI expertise]

On Thu, Jul 30, 2026 at 04:22:15PM +0900, Sangwoo Han wrote:
> brcm_msi_alloc() reserves a naturally aligned power-of-two region with
> bitmap_find_free_region(order_base_2(nr_irqs)), but the irqdomain core
> releases the vectors of a block one at a time:
> 
>   /* irq_domain_free_irqs_hierarchy() */
>   for (i = 0; i < nr_irqs; i++)
>           if (irq_domain_get_irq_data(domain, irq_base + i))
>                   domain->ops->free(domain, irq_base + i, 1);
> 
> That loop is the only caller of an irq_domain's ops->free(), so
> brcm_irq_domain_free() always sees nr_irqs == 1 and
> bitmap_release_region() clears exactly one bit per call. A request whose
> vector count is not a power of two therefore reserves
> roundup_pow_of_two(nr_irqs) bits but releases only nr_irqs of them, and
> the difference stays set for the lifetime of the controller.
> 
> Multi-MSI regions are order-aligned and the controller has at most 32
> MSIs, so the pool is quickly exhausted. Observed on a BCM2712 with a
> 5-vector endpoint behind a 4-port PCIe switch: the switch ports take
> hwirq 0x0-0x3 and the endpoint's block walks 0x8 -> 0x10 -> 0x18 across
> three driver reloads until no aligned order-3 region is left.
> pci_alloc_irq_vectors() then falls back to a single vector for the rest
> of the boot, silently multiplexing the endpoint's four completion
> interrupts onto one hwirq.
> 
> Devices that ask for a non-power-of-two vector count are not exotic:
> wil6210 asks for 3, the MHI modems for 5 (Quectel EM1xx, Foxconn SDX55,
> Telit FN990, MediaTek MV3x) or 7 (Qualcomm v1), ath11k WCN6750 for 28
> and ptp_ocp for 17. MSI-X is unaffected because it allocates one
> descriptor per vector with nvec_used == 1, so the order is always zero.
> 
> Reserve exactly the vectors that are handed out, at a base found with
> bitmap_find_next_zero_area(), and clear exactly the vectors that are
> freed. The number of reserved bits then matches the number the core
> releases, whatever arity it uses.
> 
> The base still has to be aligned: PCI Local Bus Specification 3.0
> (section 6.8.1.6) lets the endpoint encode the vector number in the low
> order_base_2(nr_irqs) bits of the Message Data register, and in this
> controller those bits are the hwirq itself. The alignment mask has to be
> roundup_pow_of_two(nr_irqs) - 1 rather than nr_irqs - 1:
> bitmap_find_next_zero_area() requires a mask of the form 2^k - 1. No
> align_offset is needed because the bitmap index is the value the
> endpoint ORs in, see brcm_msi_compose_msi_msg().
> 
> For a power-of-two nr_irqs the alignment and the region length are both
> nr_irqs, so the base returned is the same as before and those
> allocations are unaffected.
> 
> Fixes: 198acab1772f ("PCI: brcmstb: Enable Multi-MSI")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sangwoo Han <sangwoo.han@nearthlab.com>
> ---
> 
> Notes:
>     Tested on a BCM2712 (Raspberry Pi 5) with a 5-vector endpoint behind a
>     4-port PCIe switch, running 6.12.25 where brcm_msi_alloc() and
>     brcm_msi_free() are byte-identical to mainline. Without the patch the
>     endpoint's block walks 0x8 -> 0x10 -> 0x18 over three driver reloads and
>     then falls back to a single vector for the rest of the boot; with it the
>     block returns to 0x8 on all of eight reload cycles and the inner
>     domain's mapped count round-trips cleanly.
>     
>     Compile-tested on mainline for arm64 with W=1 and C=1 (sparse); no new
>     warnings.
> 
>  drivers/pci/controller/pcie-brcmstb.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 8a0c353d2a..6c5166666d 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -595,11 +595,22 @@ static struct irq_chip brcm_msi_bottom_irq_chip = {
>  
>  static int brcm_msi_alloc(struct brcm_msi *msi, unsigned int nr_irqs)
>  {
> +	/*
> +	 * brcm_msi_compose_msi_msg() puts hwirq in the low order bits of the
> +	 * message data, which a Multi-MSI endpoint rewrites per vector, so a
> +	 * block's base must be aligned to the Multiple Message Enable count.
> +	 */
> +	unsigned long align_mask = roundup_pow_of_two(nr_irqs) - 1;
>  	int hwirq;
>  
>  	mutex_lock(&msi->lock);
> -	hwirq = bitmap_find_free_region(msi->used, msi->nr,
> -					order_base_2(nr_irqs));
> +	hwirq = bitmap_find_next_zero_area(msi->used, msi->nr, 0, nr_irqs,
> +					   align_mask);
> +	if (hwirq >= msi->nr) {
> +		mutex_unlock(&msi->lock);
> +		return -ENOSPC;
> +	}
> +	bitmap_set(msi->used, hwirq, nr_irqs);
>  	mutex_unlock(&msi->lock);
>  
>  	return hwirq;
> @@ -609,7 +620,7 @@ static void brcm_msi_free(struct brcm_msi *msi, unsigned long hwirq,
>  			  unsigned int nr_irqs)
>  {
>  	mutex_lock(&msi->lock);
> -	bitmap_release_region(msi->used, hwirq, order_base_2(nr_irqs));
> +	bitmap_clear(msi->used, hwirq, nr_irqs);
>  	mutex_unlock(&msi->lock);
>  }

I want to revive this thread because I think there's a real problem
here, and we should solve it for all the PCI controller drivers.

There's nothing brcm-specific about the bitmap alloc/free except the
size of the msi->used bitmap, so I don't want to copy/paste this sort
of fix in all the affected drivers.

I'd also like to avoid the extra align_mask and
bitmap_find_next_zero_area() followed by manual bitmap_set().
bitmap_find_free_region() already takes care of the alignment and
setting the allocated bits.

The MSI Multiple Message Enable situation of enabling more vectors in
the device than the driver wants is generic to all devices that
advertise Multiple Message Capable, and I don't think we should have
to deal with this in every host controller driver.

If a driver requests 3 vectors, we have to enable 4 because MSI only
supports power-of-two number of vectors.  This tells the device it is
allowed to use all 4 vectors, and I think the PCI MSI core should
assume they all *will* be used instead of relying on the driver's
claim that it will only use 3.

