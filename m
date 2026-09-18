Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB991C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFd1IUwyr+chznkcPatvaTzK6aSPWvxoNS1zKhhkLdo=; b=R2mNo5yF2vQSKfSbuUHz907hwu
	NXChG2e9ed/RLKiV7bY4568l9iasNYychvf4p91E55PPjf7p2HgjDspDozta8aVvNzfsMezlNmvUW
	mE67eW9cZWqi27wvc6Nf7EYc1OliZ7K4t6EWL34LpCJhDr9ABHlO+H3We+j96oFvoHazv8foRa0kI
	02ZVBvFKdzSs1t5++p1HCDyDamnWLLa6jO0mP77PQLFBctcoY3J/oAIKkTbSRnuMFWSC0HnCY4cYe
	I407sSQXo63qBKJ6YAuSV48btXeTq4xZjH4rgLVEv3+uu4Znkjb+mPlv5t/mwQR5O9g8W0AjliUkP
	DJ67+24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bpI-0000000F5fy-3XkR;
	Fri, 18 Sep 2026 16:52:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bpG-0000000F5ek-1TzM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:52:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19733143D;
	Fri, 18 Sep 2026 09:52:33 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AC8B3F86C;
	Fri, 18 Sep 2026 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789750356; bh=ZTeeLN7t3TI0l6Ecl49KHOYATspDK7jw9NQofUeOSMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyU7iiU2t6wOm/wKjIMebzpBdo6WI+VbuWFdUxJhEj3XPVNW7yvN6XRLPFj6O6Dor
	 tcZXdb+0Jk3umRH+vlItPoO3vqDgiGicWu0MpoWjWW7XYuhTQVI6VvBJ/1bUl0xJsx
	 ccwZMIOE9wzbJVDaQqaE6egAI9o4Kpfos9lFJT9A=
Date: Fri, 18 Sep 2026 17:52:31 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment for
 shared buffers
Message-ID: <aq1sT2EDsGaomqST@arm.com>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095238_483767_BC118904 
X-CRM114-Status: GOOD (  25.65  )
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

On Fri, Sep 04, 2026 at 04:04:43PM +0530, Aneesh Kumar K.V (Arm) wrote:
> This series tightens the alignment requirements for buffers that are shared
> between confidential-computing guests and the host.
> 
> When a guest runs with private memory, buffers shared with the hypervisor
> are not only accessed by the guest. They are also accessed by the host
> kernel, and the host may manage the corresponding shared/private state at a
> granularity larger than the guest page size.
> 
> This matters for CCA systems where the Realm stage-2 mappings managed by
> the RMM can still operate at 4K granularity, while the non-secure host may
> manage the IPA state change at a larger page size, for example 64K. In that
> case, allowing a guest to convert and share only a 4K subrange of a
> host-managed granule is unsafe.
> 
> Architectures such as Arm can detect incorrect accesses to Realm physical
> address space PFNs through GPC faults. However, relying on that as the only
> line of defence is fragile and can still lead to kernel crashes. The risk
> is especially visible for shared buffers that are later mmapped into
> userspace, such as guest_memfd or dma-buf backed allocations. Once
> userspace can access the mapping, the kernel cannot guarantee that
> applications will only touch the intended 4K region rather than the whole
> host page mapped into their address space. Those userspace addresses may
> also be passed back into the kernel and accessed through the linear map,
> resulting in a GPC fault.
> 
> To avoid this, shared buffers must satisfy two constraints:
> 
>   - the address must be aligned to the CoCo shared-granule size
>   - the size must be a multiple of that granule size
> 
> The series adds generic helpers for this:
> 
>   - mem_cc_shared_granule_size()
>   - mem_cc_align_to_shared_granule()
> 
> The generic implementation defaults to PAGE_SIZE. arm64 CCA overrides this
> by querying the host IPA state change granule size through RHI and exposing that
> value through the arm64 memory-encryption operations.
> 
> The patche series update the main shared-buffer allocation paths that can
> be used by private-memory guests:
> 
>   - arm64 set_memory_encrypted()/set_memory_decrypted() now reject unaligned
>     addresses or sizes.
>   - GIC ITS shared allocations are rounded to the shared granule size.
>   - dma-direct and atomic DMA pool allocations use aligned allocation and
>     conversion sizes.
>   - SWIOTLB pools, including dynamic pools, are allocated and converted at the
>     shared granule size.
>   - restricted-dma-pool regions are checked and rejected if firmware did not
>     provide a base and size aligned to the shared granule size.
>   - dma-buf system heap cc-shared allocations require aligned sizes and use at
>     least the required allocation order.

While I understand why you want it, I think that's maintenance burden
longer term. It's already touching about seven allocators (ITS,
dma-direct, CMA, atomic pool, swiotlb, restricted DMA pools, dma-buf).
Although most are in the DMA code, we still need to keep track of their
changes and what else may be coming. Can we even test all these
combinations in a CCA realm?

I assume for trusted devices we can skip this forced alignment.

TBH, I'm tempted not to support this configuration at all, just fail
gracefully if the realm page size doesn't match the host's. However, if
that's a real world configuration, I wonder whether could we leverage
the swiotlb mechanism but with a separate io_tlb_mem as a shared coco
allocator with the right alignment and use this pool when
force_dma_unencrypted() instead of specific alloc_pages() with adjusted
order.

-- 
Catalin

