Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670FAC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2607bFO7yiop4mgCElN+LDiX/SMfpX1LywD+vZ+PvGg=; b=2AbGTIMEmwazTmyIZnvt7I9OXj
	TBed44uzbwDSbBK57jvnNFwOUlRbcB+ER+QNLfmmmrNpcD0QKDd9gMRNy1BcfmNS1UnKYZopVjlFT
	dcRoRXDbTtGVpd+pdEKWYDnfiECv1i/nFgan0CwxXlhdKGl3UworIrTzjfVLth8DIvewf4gdLmqIR
	tkQQFg11WgFHjuMVBQiw5X+s8hm25+j3vBVWjvhSfnbpGowv9fZ2BIen96opspfKPL/SoIPfb366p
	h4LbEofXHvRqTPnGvV07WB6CQ4nSwqG+jUzDA2uwHnpKN9YMVFP9xlgYALlK8+JpEc/6agMjZ68K3
	lFd8P2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hwQ-0000000FkE1-2rNf;
	Fri, 18 Apr 2025 09:23:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5huY-0000000Fk1T-3mE5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 09:21:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BD5FAA4B35A;
	Fri, 18 Apr 2025 09:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A5CC4CEE2;
	Fri, 18 Apr 2025 09:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744968085;
	bh=fNbzTX4bJUFtShrgr0Hcpqfmfa8a26KAiBIpBmZ1Y5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=knANdacnNuaugZ83fQ0Ue9T/dgGs3AOR6+QIIf58yLS1+d3wGg0cdf1CUFgSIBzUm
	 VSMwOvRQJmm36D01HBjkZaSym1mEJ3yjMZ5ILZ2uA3jJOHzLJaiZdiC1VDUwxrgRcn
	 WudtkGo7S+d3MVkl65q0ZMqS4LXvUgWe/U6ECWU912+ESI+z4H55UVRkXsmaEm26Tw
	 y2Kb5bfLj8WDc60MwLF4qSv0EFUid1VDm+sfc7FX/w/UitXMOgEwWOr72W9s7GLZC0
	 w1qvv31QY90Iwml+d1VMnrDYUdt2L8bbdswAP1SO2pwcyEhu2kVJOjvMw4YzmdlRjK
	 Sx7fKHlyrsgWA==
Date: Fri, 18 Apr 2025 11:21:18 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <aAIZjmzlGxIHCuJl@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>
 <Z/ZH5IBQAZ8rc9Cz@lpieralisi>
 <e7e4e9f0-a9e4-48d4-9bed-a4c52453ee8e@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7e4e9f0-a9e4-48d4-9bed-a4c52453ee8e@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_022127_074851_50FAEE8F 
X-CRM114-Status: GOOD (  59.61  )
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

On Wed, Apr 09, 2025 at 12:56:52PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 9, 2025, at 12:11, Lorenzo Pieralisi wrote:
> > On Wed, Apr 09, 2025 at 10:23:57AM +0200, Arnd Bergmann wrote:
> >> On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
> >> > +static void irs_writeq(struct gicv5_irs_chip_data *irs_data, const u64 
> >> > val,
> >> > +		       const u64 reg_offset)
> >> > +{
> >> > +	writeq_relaxed(val, irs_data->irs_base + reg_offset);
> >> > +}
> >> 
> >> I think the use of _relaxed memory accessors needs some code
> >> comments here. The definition of these is that you don't care
> >> about ordering relative to DMA master accesses, yet you seem to
> >> very much have accesses to the 'ist' from the GIC, as well as
> >> DMA accesses from an MSI device, and I would expect both to
> >> require ordering.
> >
> > For the 1-level (linear) IST we allocate it in one go, write
> > the base address through relaxed access (that sets the IST
> > valid) and poll completion with a relaxed access. Memory is
> > cleaned and invalidated from the cache (if the IRS is not
> > coherent) before the MMIO sequence above, which implies a
> > dsb().
> >
> > After that memory is handed over to the GIC.
> >
> > For a 2-level IST, the code that updates L1 entries already add
> > a dma_rmb() barrier (ie gicv5_irs_iste_alloc()) to make sure we
> > order MMIO wait completion with the subsequent cache invalidate
> > (again, in the yet hypothetical case where the IRS is not coherent).
> >
> > I think I can add comments where the sequence to initialize the
> > tables is executed more than here, given that these helpers are
> > used for other purposes too.
> 
> Usually my recommendation is to have abstractions like this
> provide both relaxed and normal variants, and then only
> use the relaxed ones where it really matters for performance.
> 
> That way you can keep relatively short explanations where
> you call irs_writeq_relaxed() and use irs_writeq() without
> any code comments any place that doesn't care about saving
> a few cycles per call.

Technically, memory is always handed over to the GIC following a GICv5
MMIO register poll that guarantees the GIC has seen the change (whether
it is making an IST table valid, or enabling an ITS - that in turn means
device table (DT) translations are enabled).

One thing I could do is to make the readl_relaxed_poll_timeout_atomic()
readl_poll_timeout_atomic() on those "completion registers", which adds
the required barriers (I can add a comment to the related calling
sites).

That should also allow me to remove the dma_rmb() barrier that I need in:

gicv5_irs_iste_alloc()

to prevent the CPU from issuing a cache invalidation before the

readl_relaxed_poll_timeout_atomic()

loop has completed.

I don't see any other corner case where the _relaxed version would
not work I tried to follow other drivers where AFAICS the relaxed
version is used by default unless the non-relaxed one is strictly
needed (GICv3/SMMUv3).

I can obviously update the {irs/its}_ helpers to add a relaxed
name to make sure it is more obvious to understand what they do.

Would that work ?

Thanks,
Lorenzo

> >> > +/* Wait for completion of an IST change */
> >> > +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data 
> >> > *irs_data)
> >> > +{
> >> > +	int ret;
> >> > +	u32 val;
> >> > +
> >> > +	ret = readl_relaxed_poll_timeout_atomic(
> >> > +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
> >> > +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
> >> > +			USEC_PER_SEC);
> >> > +
> >> 
> >> What is the significance of the 1 second timeout? This is probably
> >> a million times longer than I would expect any hardware interaction
> >> to be specified to take. Are you waiting for another thread here?
> >
> > It is arbitrary, agreed.
> 
> Can you make either much shorter, or non-atomic then?
> 
> >> > +	l2istsz = BIT(n + 1);
> >> > +	if (l2istsz > KMALLOC_MAX_SIZE) {
> >> > +		u8 lpi_id_cap = ilog2(KMALLOC_MAX_SIZE) - 2 + istsz;
> >> > +
> >> > +		pr_warn("Limiting LPI ID bits from %u to %u\n",
> >> > +			lpi_id_bits, lpi_id_cap);
> >> > +		lpi_id_bits = lpi_id_cap;
> >> > +		l2istsz = KMALLOC_MAX_SIZE;
> >> > +	}
> >> 
> >> The use of KMALLOC_MAX_SIZE seem arbitrary here. I remember discussing
> >> this in the past and concluding that this is fine for all cases
> >> that may be relevant, but it would be good to explain the reasoning
> >> in a comment.
> >
> > We need contiguous physical memory that can be < PAGE_SIZE or larger.
> >
> > For allocations larger than the allocator caches kmalloc hands over to
> > the page allocator, MAX_ORDER is reflected into KMALLOC_MAX_SIZE AFAIU.
> >
> > That's the reasoning. Does it make sense ?
> 
> I'm more worried about what happens when KMALLOC_MAX_SIZE is
> really small -- did you show that the allocation is still
> going to work, or is this likely to cause runtime problems?
> 
> >> > +	if (irs_data->flags & IRS_FLAGS_NON_COHERENT)
> >> > +		dcache_clean_inval_poc((unsigned long)ist,
> >> > +				       (unsigned long)ist + l2istsz);
> >> > +	else
> >> > +		dsb(ishst);
> >> ...
> >> > +	baser = (virt_to_phys(ist) & GICV5_IRS_IST_BASER_ADDR_MASK) |
> >> > +		FIELD_PREP(GICV5_IRS_IST_BASER_VALID, 0x1);
> >> 
> >> Here it seems like you are open-coding the DMA mapping interface
> >> details, in particular the mapping of the 'ist' memory area into
> >> the gic's DMA master space, the coherency and the barrier that is
> >> normally part of a (non-relaxed) writeq().  Is there a reason
> >> you can't use the normal interfaces here, using dma_alloc_coherent()
> >> or dma_alloc_noncoherent()?
> >
> > The GIC IRS must be brought up early, it is not a struct device.
> 
> Right, that is rather unfortunate.
> 
> >> Do you expect actual implementation to not be cache-coherent?
> >
> > It is allowed by the architecture - I don't have a crystal ball
> > but if I want to add support for a non-coherent IRS the DMA mapping
> > like sequence above has to be there - alternatives are welcome.
> 
> I see that we have a few GICv3 implementations that are marked
> as non-coherent in DT. I don't understand why they'd do that,
> but I guess there is not much to be done about it.
> 
> The only other idea I have would be to use an uncached allocation
> for the non-coherent case, the same way that dma_alloc_coherent()
> or maybe dma_alloc_wc() does. This still has the same problem
> with bypassing the dma-mapping.h interface because of the lack
> of a device pointer, but it would at least avoid the cache flushes
> at runtime. If I read this code right, the data in here is only
> written by the CPU and read by the GIC, so a WC buffer wouldn't
> be more expensive, right?
> 
>        Arnd

