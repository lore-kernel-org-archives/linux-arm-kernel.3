Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFC6C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 10:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25rPvR2Hd/HuKLCJmWOloTx+aXVCgPfeX4HLQQ9Cxlc=; b=acNSKpO2XqvQLsqAVvyNFLw+S0
	+LfWKlUHZe1ivRqWDdKKVjUbW6fwRRV+oS9uTQzQSc+aGTMp6yRbZv9+EIBJ2Yus8Jmitauj/90cU
	QWB30V5Pz4e1mNsy7gsD9NvxB6kFYdPEVFIG9DrKs1HfJP9TYeIPZ+F9jNmcmm0Mcm6BHmit/Cwgs
	u/CZP01nrDnRZovYFfqYwvbHABhurncp3R4K82WT/SBqDEu6HvXDtxKtf50Is5ahp9Vt5PzUU+Lfc
	0HGRm8yDdvd029c1qccpzGqK5p/k/p2AECDRF3btkN5rOFEpDZTzLUDQ9SKT7kMtxxOxoeI01qCNE
	H3qswsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SRH-00000006o0W-2PgO;
	Wed, 09 Apr 2025 10:13:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SPU-00000006njk-2uZV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 10:11:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FED1A498B2;
	Wed,  9 Apr 2025 10:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3749AC4CEE3;
	Wed,  9 Apr 2025 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744193515;
	bh=RGF42t7ba2gAeFKFDl+Vmbdg5+GzN+Zs2MtQQeMaOzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fwUeGYpDLFK+5BGx2AbhI3UnKi4pDLqO80mF/ZArkv9w4uEn25194kz+ZQVL5Yfbq
	 1I2aYAqMrSfMogQbOKTS2P1eWRbIbsxujxh8wVKFsRDFefIzGt2yfVELOKkvb1peGc
	 ty4vT5Nqe7KmZQj+zTOyiPKansiizzmZMyEGr9vr6Yi0ms1BS0F4LKhc18kSO3Gxu6
	 oZfVrlAQKrHLsbcwlqWxtS+1pAgS8GgLzn9ZTrO/qJz/BZoJ4Pwr2ERQZlpyYFN03b
	 uVRedj9uJ57K+3l5aSvN3dazHwV1Jd8+Odd2YWOC8XeIS4kf5DIh88q5GbHR2VZpdT
	 pZ/4NmFqEm3RA==
Date: Wed, 9 Apr 2025 12:11:48 +0200
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
Message-ID: <Z/ZH5IBQAZ8rc9Cz@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_031156_864861_53E2226A 
X-CRM114-Status: GOOD (  37.06  )
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

On Wed, Apr 09, 2025 at 10:23:57AM +0200, Arnd Bergmann wrote:
> On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
> > @@ -22,12 +25,346 @@ static u32 irs_readl(struct gicv5_irs_chip_data 
> > *irs_data, const u64 reg_offset)
> >  	return readl_relaxed(irs_data->irs_base + reg_offset);
> >  }
> > 
> > +static u64 irs_readq(struct gicv5_irs_chip_data *irs_data, const u64 
> > reg_offset)
> > +{
> > +	return readq_relaxed(irs_data->irs_base + reg_offset);
> > +}
> > +
> >  static void irs_writel(struct gicv5_irs_chip_data *irs_data, const u32 
> > val,
> >  		       const u64 reg_offset)
> >  {
> >  	writel_relaxed(val, irs_data->irs_base + reg_offset);
> >  }
> > 
> > +static void irs_writeq(struct gicv5_irs_chip_data *irs_data, const u64 
> > val,
> > +		       const u64 reg_offset)
> > +{
> > +	writeq_relaxed(val, irs_data->irs_base + reg_offset);
> > +}
> 
> I think the use of _relaxed memory accessors needs some code
> comments here. The definition of these is that you don't care
> about ordering relative to DMA master accesses, yet you seem to
> very much have accesses to the 'ist' from the GIC, as well as
> DMA accesses from an MSI device, and I would expect both to
> require ordering.

For the 1-level (linear) IST we allocate it in one go, write
the base address through relaxed access (that sets the IST
valid) and poll completion with a relaxed access. Memory is
cleaned and invalidated from the cache (if the IRS is not
coherent) before the MMIO sequence above, which implies a
dsb().

After that memory is handed over to the GIC.

For a 2-level IST, the code that updates L1 entries already add
a dma_rmb() barrier (ie gicv5_irs_iste_alloc()) to make sure we
order MMIO wait completion with the subsequent cache invalidate
(again, in the yet hypothetical case where the IRS is not coherent).

I think I can add comments where the sequence to initialize the
tables is executed more than here, given that these helpers are
used for other purposes too.

> > +/* Wait for completion of an IST change */
> > +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data 
> > *irs_data)
> > +{
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
> > +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
> > +			USEC_PER_SEC);
> > +
> 
> What is the significance of the 1 second timeout? This is probably
> a million times longer than I would expect any hardware interaction
> to be specified to take. Are you waiting for another thread here?

It is arbitrary, agreed.

> > +	l2istsz = BIT(n + 1);
> > +	if (l2istsz > KMALLOC_MAX_SIZE) {
> > +		u8 lpi_id_cap = ilog2(KMALLOC_MAX_SIZE) - 2 + istsz;
> > +
> > +		pr_warn("Limiting LPI ID bits from %u to %u\n",
> > +			lpi_id_bits, lpi_id_cap);
> > +		lpi_id_bits = lpi_id_cap;
> > +		l2istsz = KMALLOC_MAX_SIZE;
> > +	}
> 
> The use of KMALLOC_MAX_SIZE seem arbitrary here. I remember discussing
> this in the past and concluding that this is fine for all cases
> that may be relevant, but it would be good to explain the reasoning
> in a comment.

We need contiguous physical memory that can be < PAGE_SIZE or larger.

For allocations larger than the allocator caches kmalloc hands over to
the page allocator, MAX_ORDER is reflected into KMALLOC_MAX_SIZE AFAIU.

That's the reasoning. Does it make sense ?

> > +	if (irs_data->flags & IRS_FLAGS_NON_COHERENT)
> > +		dcache_clean_inval_poc((unsigned long)ist,
> > +				       (unsigned long)ist + l2istsz);
> > +	else
> > +		dsb(ishst);
> ...
> > +	baser = (virt_to_phys(ist) & GICV5_IRS_IST_BASER_ADDR_MASK) |
> > +		FIELD_PREP(GICV5_IRS_IST_BASER_VALID, 0x1);
> 
> Here it seems like you are open-coding the DMA mapping interface
> details, in particular the mapping of the 'ist' memory area into
> the gic's DMA master space, the coherency and the barrier that is
> normally part of a (non-relaxed) writeq().  Is there a reason
> you can't use the normal interfaces here, using dma_alloc_coherent()
> or dma_alloc_noncoherent()?

The GIC IRS must be brought up early, it is not a struct device.

> Do you expect actual implementation to not be cache-coherent?

It is allowed by the architecture - I don't have a crystal ball
but if I want to add support for a non-coherent IRS the DMA mapping
like sequence above has to be there - alternatives are welcome.

Thanks a lot for reviewing.

Lorenzo

