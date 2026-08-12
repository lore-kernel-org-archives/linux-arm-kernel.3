Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAA3C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 11:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrG8DuqyrTgTLnhCEF0YR7wirnsbC3EpRyGJXVbGCIU=; b=rxQgpNLmg6nGfLxwM+5926CBBv
	xfBRXF4jYpz4XWJZORCIfpkPoePL+fr49Ue5W/wnGN80RgGo7JGAB0MDmynKaI3CV365kG8z1qWuS
	GenEEirYtTU7A4l+DsRu+84e9Ynjm0xkuTRbXbGFb6EKgbnRC9XRm1iq9ksfF/NtJ1U7Uh2xBiB7z
	otB5uwRf436HgHvZtq4jQHw9DNWpJZOWIaLoMdhpjz/OtOHcqhwXT/c8om9k2EfXZ+3vOk0/826lM
	WkE1R0EBbZ+Dx65rgZbNu+5Xdan20KxT5oxKC1VduI5tlnw/ctX2zH46snpmhfSftkWn1/Yl/Ny5G
	iwctgTLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6om-0000000G0OS-18qT;
	Wed, 12 Aug 2026 11:08:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6ok-0000000G0O7-0gSl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 11:08:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E350600E2;
	Wed, 12 Aug 2026 11:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332981F000E9;
	Wed, 12 Aug 2026 11:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786532896;
	bh=wrG8DuqyrTgTLnhCEF0YR7wirnsbC3EpRyGJXVbGCIU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=EkPSCeLDP67zu3BNdozJVWmVgN/lwbl/w5cX6yfGYw9yVFjo6oPLCa0KuCgxJq/bJ
	 KCRPGDosYj4GfgaVr2nyBLrLMQzyq56jcmCurtz+u98h44jUMGlYs5abspQ7HI6rsh
	 QfoHCmaUDsxiRzdFLpT+tVjAjEYbE4nO23QHgxFCh00LDfMeQi+Ph7C2SSyb7vjFYB
	 hmnKnnLtrOxIfLT7V/pLXlLtaxUOl4T+7oG8LNW7m3pliZ+JhFVaHDpU+gCrQUFKvh
	 ITPhU3LDVqetWIWSsynW6Wc8ICVklFrAdPPAB/k0svEdGHBfo3zvurKffjxX4mpEdJ
	 bjOpTJ9BJHYPw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
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
In-Reply-To: <anxEc8EHmJQywVI5@arm.com>
References: <20260811134056.756015-1-aneesh.kumar@kernel.org>
 <anxEc8EHmJQywVI5@arm.com>
Date: Wed, 12 Aug 2026 16:38:03 +0530
Message-ID: <yq5ajypvioks.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Tue, Aug 11, 2026 at 07:10:56PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> Systems with memory encryption use swiotlb to provide shared or
>> unencrypted buffers for device DMA. Confidential guests may route all
>> DMA through these buffers, while SME hosts use them for devices that
>> cannot address encrypted memory. The default swiotlb pool can therefore
>> be exhausted under I/O-intensive workloads.
>> 
>> Let architectures mark the default swiotlb pool as shared before
>> swiotlb_init().
>
> I thought we wanted even this decision to be moved out of the arch code.
>

Architectures may want to use an unencrypted swiotlb pool for different
reasons, one of them being CC_ATTR_GUEST_MEM_ENCRYPT. x86 hosts also
require unencrypted pool to support SME. We can cover both cases using
CC_ATTR_MEM_ENCRYPT. However, pKVM does not want an unencrypted SWIOTLB
pool. So I was thinking it would be much cleaner to let the architecture
code drive that decision.

>
>> Move the existing x86 sizing policy into generic swiotlb
>> code and add early pool marking for arm64 Realm guests, powerpc secure
>> guests, s390 protected-virtualization guests, and x86 memory-encryption
>> platforms. Use CC_ATTR_MEM_ENCRYPT on x86 to include host SME, whose
>> swiotlb pool must also be decrypted for devices that cannot address
>> encrypted memory.
>
> That's a functional change for x86. For now, I'd keep it to
> CC_ATTR_GUEST_MEM_ENCRYPT.
>
> BTW, why does arm64 report CC_ATTR_MEM_ENCRYPT instead of the GUEST
> option in realms?
>
>> Move the powerpc secure-guest swiotlb enablement before initialization
>> so that the shared pool is allocated with the required flags. pKVM
>> guests continue to use a restricted DMA pool instead of the default
>> swiotlb pool.
>> 
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  arch/arm64/mm/init.c                 |  6 ++-
>>  arch/powerpc/mm/mem.c                |  7 +++
>>  arch/powerpc/platforms/pseries/svm.c | 10 ----
>>  arch/s390/mm/init.c                  |  2 +
>>  arch/x86/mm/mem_encrypt.c            | 27 ++--------
>>  include/linux/swiotlb.h              |  7 ++-
>>  kernel/dma/swiotlb.c                 | 73 ++++++++++++++++++++++------
>>  7 files changed, 82 insertions(+), 50 deletions(-)
>> 
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index e308a7cabd12..4c022e8aed43 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -338,8 +338,12 @@ void __init arch_setup_zero_pages(void)
>>  void __init arch_mm_preinit(void)
>>  {
>>  	unsigned int flags = SWIOTLB_VERBOSE;
>> +	/* pKVM uses restricted-dma-pool */
>> +	bool cc_guest = is_realm_world();
>>  
>> -	if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
>> +	if (cc_guest) {
>> +		swiotlb_mark_default_cc_shared();
>> +	} else if (max_pfn <= PFN_DOWN(arm64_dma_phys_limit)) {
>>  		/*
>>  		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
>>  		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
>
> With your other reworking, doesn't the core code know the swiotlb will
> be shared? Can it not make the decision to resize at that point based
> solely on CC_ATTR_GUEST_MEM_ENCRYPT?
>
> I also wonder whether we could address Will's pKVM request not to
> allocate a bounce buffer once pKVM guests will start reporting
> CC_ATTR_GUEST_MEM_ENCRYPT. Some simple heuristic: if a
> restricted-dma-pool is advertised in DT (it will end up in
> rmem_swiotlb_setup()), skip resizing the default swiotlb. It's not
> perfect but the bounce buffer can be overridden on the command line.
>

For the same reason I mentioned above, architectures may have different
reasons for setting cc_shared = true. IMHO, it is cleaner to let the
architecture code make that decision before swiotlb_init().

-aneesh

