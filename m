Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7955BC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmbgncPtKrUj6hpngz8TyZ+tnlOEdXbb4i+DSo713o0=; b=Up0rTox0uY9+5WA8IgyeGXxZJq
	k7CQo44sWTZDPd6vCEhZfZeWUHJaHlxEjGRInVj0n37MHyLmbiGQzrfMPx07j1hN4c4U2CmviHbqD
	0S0QpLbf+u+v40bY2ttlbc3lV3uAj1Snr6ey0RuTSpEboeTs2gzvK8PXbmNODochJN9mgucbovJr3
	eeHG0e+ZDeMfG1zoO23TyBLLQF1XUVQTR4yYUx+GtBbK8o1C83Dh/WkNjGApNrlqSYyZ1h55Cytb+
	43jotcdnH6J+AD+E/Pp4et6snGBTHvRed9k1Q3C2dCfNMrj+b4L+GjpGMJBbquWh+6iZMd/BSvsRI
	HXoQew9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5mH-0000000FplM-2vxu;
	Wed, 12 Aug 2026 10:01:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5mD-0000000FpkP-34Bu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:01:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2BC51596;
	Wed, 12 Aug 2026 03:01:30 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58C893F632;
	Wed, 12 Aug 2026 03:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786528894; bh=laAQxkCDgu5rybBDPLSZxhaA8e2vicoqRxfv8eyBppg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H9+Q3rweucDYcVESosYOqah1VsOK5/gZBmUDqRzZn63O1t3HEhDbFomEHapCTWR2C
	 4HjayAQgmAUs2cjgjubPrIW3CeX2n+B9zHWT7RcBq9sIXEnzQmXnFEsazv1HuywPNi
	 wqnvNT0Uoa+RgTsn5+EP2jUJQjbBJpJapx1rZX8o=
Date: Wed, 12 Aug 2026 11:01:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [RFC PATCH] dma: swiotlb: Size shared default pools for memory
 encryption
Message-ID: <anxEc8EHmJQywVI5@arm.com>
References: <20260811134056.756015-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811134056.756015-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_030137_879566_DA20EF88 
X-CRM114-Status: GOOD (  24.52  )
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

On Tue, Aug 11, 2026 at 07:10:56PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Systems with memory encryption use swiotlb to provide shared or
> unencrypted buffers for device DMA. Confidential guests may route all
> DMA through these buffers, while SME hosts use them for devices that
> cannot address encrypted memory. The default swiotlb pool can therefore
> be exhausted under I/O-intensive workloads.
> 
> Let architectures mark the default swiotlb pool as shared before
> swiotlb_init().

I thought we wanted even this decision to be moved out of the arch code.

> Move the existing x86 sizing policy into generic swiotlb
> code and add early pool marking for arm64 Realm guests, powerpc secure
> guests, s390 protected-virtualization guests, and x86 memory-encryption
> platforms. Use CC_ATTR_MEM_ENCRYPT on x86 to include host SME, whose
> swiotlb pool must also be decrypted for devices that cannot address
> encrypted memory.

That's a functional change for x86. For now, I'd keep it to
CC_ATTR_GUEST_MEM_ENCRYPT.

BTW, why does arm64 report CC_ATTR_MEM_ENCRYPT instead of the GUEST
option in realms?

> Move the powerpc secure-guest swiotlb enablement before initialization
> so that the shared pool is allocated with the required flags. pKVM
> guests continue to use a restricted DMA pool instead of the default
> swiotlb pool.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/mm/init.c                 |  6 ++-
>  arch/powerpc/mm/mem.c                |  7 +++
>  arch/powerpc/platforms/pseries/svm.c | 10 ----
>  arch/s390/mm/init.c                  |  2 +
>  arch/x86/mm/mem_encrypt.c            | 27 ++--------
>  include/linux/swiotlb.h              |  7 ++-
>  kernel/dma/swiotlb.c                 | 73 ++++++++++++++++++++++------
>  7 files changed, 82 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index e308a7cabd12..4c022e8aed43 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -338,8 +338,12 @@ void __init arch_setup_zero_pages(void)
>  void __init arch_mm_preinit(void)
>  {
>  	unsigned int flags = SWIOTLB_VERBOSE;
> +	/* pKVM uses restricted-dma-pool */
> +	bool cc_guest = is_realm_world();
>  
> -	if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
> +	if (cc_guest) {
> +		swiotlb_mark_default_cc_shared();
> +	} else if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
>  		/*
>  		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
>  		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.

With your other reworking, doesn't the core code know the swiotlb will
be shared? Can it not make the decision to resize at that point based
solely on CC_ATTR_GUEST_MEM_ENCRYPT?

I also wonder whether we could address Will's pKVM request not to
allocate a bounce buffer once pKVM guests will start reporting
CC_ATTR_GUEST_MEM_ENCRYPT. Some simple heuristic: if a
restricted-dma-pool is advertised in DT (it will end up in
rmem_swiotlb_setup()), skip resizing the default swiotlb. It's not
perfect but the bounce buffer can be overridden on the command line.

-- 
Catalin

