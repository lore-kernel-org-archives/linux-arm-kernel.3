Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B9DC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWm2NE/IuMCfn/DQORBBNK2WOS92lOJvjTCw/zxxtHA=; b=GIzOo6/npvd2So+6YeMXhQMAOz
	+hwaW2uie2hUekF1Xqzp1mAGnjCxORql7URF9hNQGv9tbrtqluktjR2p0l4DRahC9tvNwtQIbAAbq
	/gaKoDmxVzZOY3qN8f4fpWwpELFDcc2MMHdpRaugJoIN8XBWqCsVJqxcrin7/8q/mRWvfINzIhijy
	yaGPn2zPh5h5GuLYLr6aWozQWn1mCVmhwjcrK1Z1zeyvIEDk+Oh/9u7dOzAZBLwbMi+AIPNqCIhAU
	NE4ItnbHBxGroz/vXM7HEbCM/xqyBV3k8MvV0t3XH27bJaKsAJFhHjSUXBfPo5CHh7REXQ9KpWT5U
	8JCvgukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TDM-00000006vrz-3Hlj;
	Wed, 09 Apr 2025 11:03:28 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T7N-00000006v0L-1kVI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 10:57:19 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D60F5114002D;
	Wed,  9 Apr 2025 06:57:15 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 06:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744196235;
	 x=1744282635; bh=uWm2NE/IuMCfn/DQORBBNK2WOS92lOJvjTCw/zxxtHA=; b=
	OFkm2Wy7p07VJ0jHAgwUbZ1WqR2AT10rZ2moBuYAcqAWCsWPwsVwWO73mP4KRaeV
	BnnwhOmh7s1fCHEObRoY500jEVTkQVyTdsufpPaeDGcugCq9d0vG5y9GQK0LR4k7
	Hm6Qr0xPu3UPe3V5FYySP7od4JyFEQ4eVxsySmw9i+6W3qpuO1VPo6D+PknS6JuJ
	IXnLA/5qF2tP9Ygi8JkCjwXxVtEirGdWzLIG0wsDlL36+4PCw9iMeEmFcBUPoSxZ
	EXNgp/t+fD6zYaMC8SmETSKsiDkI4gAgV7AYuAzKnlF/HHeoTvL2WphFzwe7dyPo
	M5cmOoMXVsu5E/0rzvp8/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744196235; x=
	1744282635; bh=uWm2NE/IuMCfn/DQORBBNK2WOS92lOJvjTCw/zxxtHA=; b=d
	PBKFJ4zjIxK/rtsgaUGu82JGMk1gQ6GOOdO/eJSWvgiGcq6Bx/zqOLgaCw2L2LIy
	KPbJeHcMtebgEnqr2DNP9Ddb+zYesi8UKyo8n4md8QSTensmh7BUpOt16AybMn5L
	xrm3cd3kBYKfYvBvdCUziAYVMiv07vsZv7DkxvLfoh36SzpfoVgTf8lFeWIi/hsi
	xJqPuEqf5eTwpFEjiYEDtBaup5Pu5BiiCJIgyftHCLcntUrNLjnrBiXF6ZTs4iLb
	I0U/WjMpkdY9CNE2zou2vO5Fz5PvSezORPkcA6o3OoDEE7SwTpnfMHvFFaZI3Zmt
	muHaq2nHzcWKtDWR/vE4g==
X-ME-Sender: <xms:i1L2Z1HCHzGQT13IRupI9t1a4tSG2cUwXxCcjvahFjxCzQpH1McToQ>
    <xme:i1L2Z6WevBv7h8kw8DO9g-k2quKOjikdF_S7xWGLMk7igtWQeYnjwJdMahB3Vkgt1
    wGkAkKseVnwvEFSPoM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehkeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshgrshgthhgrrdgsihhstghhohhffhes
    rghrmhdrtghomhdprhgtphhtthhopehtihhmohhthhihrdhhrgihvghssegrrhhmrdgtoh
    hmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlih
    hsiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:i1L2Z3IiVJP-N-x9HB5gq2ubKKGUv2n_Xl2zeM0wytbi0tReHMXbxA>
    <xmx:i1L2Z7GCwDPglZxkaouRtfLqXrnVo26z_G0kgpi1QpotBZg59GIwWg>
    <xmx:i1L2Z7Vv0jMlEJ4Vga8HQKVgyhvG6C9fM2R4mwBxP2cjAbXj6JSAiA>
    <xmx:i1L2Z2PKuJICfQge-i7dIThPzjCRg3fGNDul7WF8DGrrzoeBiQ0ItQ>
    <xmx:i1L2Z7BFFsTNsp4ZounQ-w-YcwJ-BIi5OQ4zdzB7zpegWfAgQDzGXTA2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6226A2220073; Wed,  9 Apr 2025 06:57:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T274101974a25e0dd
Date: Wed, 09 Apr 2025 12:56:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>
Cc: "Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Sascha Bischoff" <sascha.bischoff@arm.com>,
 "Timothy Hayes" <timothy.hayes@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <e7e4e9f0-a9e4-48d4-9bed-a4c52453ee8e@app.fastmail.com>
In-Reply-To: <Z/ZH5IBQAZ8rc9Cz@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>
 <Z/ZH5IBQAZ8rc9Cz@lpieralisi>
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_035717_789618_AB51085C 
X-CRM114-Status: GOOD (  44.60  )
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

On Wed, Apr 9, 2025, at 12:11, Lorenzo Pieralisi wrote:
> On Wed, Apr 09, 2025 at 10:23:57AM +0200, Arnd Bergmann wrote:
>> On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
>> > +static void irs_writeq(struct gicv5_irs_chip_data *irs_data, const u64 
>> > val,
>> > +		       const u64 reg_offset)
>> > +{
>> > +	writeq_relaxed(val, irs_data->irs_base + reg_offset);
>> > +}
>> 
>> I think the use of _relaxed memory accessors needs some code
>> comments here. The definition of these is that you don't care
>> about ordering relative to DMA master accesses, yet you seem to
>> very much have accesses to the 'ist' from the GIC, as well as
>> DMA accesses from an MSI device, and I would expect both to
>> require ordering.
>
> For the 1-level (linear) IST we allocate it in one go, write
> the base address through relaxed access (that sets the IST
> valid) and poll completion with a relaxed access. Memory is
> cleaned and invalidated from the cache (if the IRS is not
> coherent) before the MMIO sequence above, which implies a
> dsb().
>
> After that memory is handed over to the GIC.
>
> For a 2-level IST, the code that updates L1 entries already add
> a dma_rmb() barrier (ie gicv5_irs_iste_alloc()) to make sure we
> order MMIO wait completion with the subsequent cache invalidate
> (again, in the yet hypothetical case where the IRS is not coherent).
>
> I think I can add comments where the sequence to initialize the
> tables is executed more than here, given that these helpers are
> used for other purposes too.

Usually my recommendation is to have abstractions like this
provide both relaxed and normal variants, and then only
use the relaxed ones where it really matters for performance.

That way you can keep relatively short explanations where
you call irs_writeq_relaxed() and use irs_writeq() without
any code comments any place that doesn't care about saving
a few cycles per call.

>> > +/* Wait for completion of an IST change */
>> > +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data 
>> > *irs_data)
>> > +{
>> > +	int ret;
>> > +	u32 val;
>> > +
>> > +	ret = readl_relaxed_poll_timeout_atomic(
>> > +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
>> > +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
>> > +			USEC_PER_SEC);
>> > +
>> 
>> What is the significance of the 1 second timeout? This is probably
>> a million times longer than I would expect any hardware interaction
>> to be specified to take. Are you waiting for another thread here?
>
> It is arbitrary, agreed.

Can you make either much shorter, or non-atomic then?

>> > +	l2istsz = BIT(n + 1);
>> > +	if (l2istsz > KMALLOC_MAX_SIZE) {
>> > +		u8 lpi_id_cap = ilog2(KMALLOC_MAX_SIZE) - 2 + istsz;
>> > +
>> > +		pr_warn("Limiting LPI ID bits from %u to %u\n",
>> > +			lpi_id_bits, lpi_id_cap);
>> > +		lpi_id_bits = lpi_id_cap;
>> > +		l2istsz = KMALLOC_MAX_SIZE;
>> > +	}
>> 
>> The use of KMALLOC_MAX_SIZE seem arbitrary here. I remember discussing
>> this in the past and concluding that this is fine for all cases
>> that may be relevant, but it would be good to explain the reasoning
>> in a comment.
>
> We need contiguous physical memory that can be < PAGE_SIZE or larger.
>
> For allocations larger than the allocator caches kmalloc hands over to
> the page allocator, MAX_ORDER is reflected into KMALLOC_MAX_SIZE AFAIU.
>
> That's the reasoning. Does it make sense ?

I'm more worried about what happens when KMALLOC_MAX_SIZE is
really small -- did you show that the allocation is still
going to work, or is this likely to cause runtime problems?

>> > +	if (irs_data->flags & IRS_FLAGS_NON_COHERENT)
>> > +		dcache_clean_inval_poc((unsigned long)ist,
>> > +				       (unsigned long)ist + l2istsz);
>> > +	else
>> > +		dsb(ishst);
>> ...
>> > +	baser = (virt_to_phys(ist) & GICV5_IRS_IST_BASER_ADDR_MASK) |
>> > +		FIELD_PREP(GICV5_IRS_IST_BASER_VALID, 0x1);
>> 
>> Here it seems like you are open-coding the DMA mapping interface
>> details, in particular the mapping of the 'ist' memory area into
>> the gic's DMA master space, the coherency and the barrier that is
>> normally part of a (non-relaxed) writeq().  Is there a reason
>> you can't use the normal interfaces here, using dma_alloc_coherent()
>> or dma_alloc_noncoherent()?
>
> The GIC IRS must be brought up early, it is not a struct device.

Right, that is rather unfortunate.

>> Do you expect actual implementation to not be cache-coherent?
>
> It is allowed by the architecture - I don't have a crystal ball
> but if I want to add support for a non-coherent IRS the DMA mapping
> like sequence above has to be there - alternatives are welcome.

I see that we have a few GICv3 implementations that are marked
as non-coherent in DT. I don't understand why they'd do that,
but I guess there is not much to be done about it.

The only other idea I have would be to use an uncached allocation
for the non-coherent case, the same way that dma_alloc_coherent()
or maybe dma_alloc_wc() does. This still has the same problem
with bypassing the dma-mapping.h interface because of the lack
of a device pointer, but it would at least avoid the cache flushes
at runtime. If I read this code right, the data in here is only
written by the CPU and read by the GIC, so a WC buffer wouldn't
be more expensive, right?

       Arnd

