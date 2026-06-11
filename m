Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BA9CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 04:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBiy+4NJTiyF3LHnq3yC4vQA0dZTq2HR/NSC6xodkWE=; b=QuDL5SFjipPSUrK3cIYp4zeDN1
	9gU/94/jTGv59oBaHRmYtQ1EeihoRBZ95SxZjh4iCMldkgLUeiDlN8zfytE0tHRdodS0kUpq3XXZz
	QHVeIFT76j7+x9zIZ3qwQ3FpS8T1X7eDmnY3KuE/ZONk4i4uYnWn3L0A9NbNkT0MufqHzyxjFyeQo
	PCM3RnlkJ3uN4BUSUg3jC9Lbj437zJmhaHf7x1odgjS+gPawki1cX+aHVs5/v9RMw5BjGwJy9h5dF
	E1iGHzyLwRYBBynbkb4ge6nzMNLgSmTe17qnjQsNo54hQ1xbuWyXdKaM7yQHJf0c31q+GCa23Wc7s
	g0e+lRxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXOi-00000008h3j-0wWu;
	Thu, 11 Jun 2026 04:52:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXXOg-00000008h3Z-1KAQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 04:52:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 30C8960208;
	Thu, 11 Jun 2026 04:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7F91F00893;
	Thu, 11 Jun 2026 04:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781153524;
	bh=wBiy+4NJTiyF3LHnq3yC4vQA0dZTq2HR/NSC6xodkWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ts3BC0lkCTucNM5739E2sZWz64sGR4ecSh89snHNUabM8DL3qL/i5Kq+0zSdhZxPE
	 3IZAI7m2ZKxzRkXYvD0cOOn1kHucsWMKFDN2YQCOWL2HCAGBQJRJYdYgdhuXgQDoB0
	 xS76QAA6BADLXCd8Uk9rx8RDBZWdltgbcZD/G/g9NCSJg3YPNIf09a1hOZb5YsaWNW
	 cTHImEPPmMXXBur/QKqsc2TV1/RXePiFHwN1KlK7PzRnOpzDixMzwOgpz7B2Xc9BNt
	 b2S6KKPd/v/Y8W+d40YF35LmJhBqAvMdRQd3T+uCEhgOq+dTseOnBJ3ptzf22P8UiP
	 EzBsszicXXFaA==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v6 04/20] dma-pool: track decrypted atomic pools and
 select them via attrs
In-Reply-To: <20260610164153.GQ2764304@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-5-aneesh.kumar@kernel.org>
 <20260609143242.GK2764304@ziepe.ca> <yq5afr2uzum9.fsf@kernel.org>
 <20260610164153.GQ2764304@ziepe.ca>
Date: Thu, 11 Jun 2026 10:21:50 +0530
Message-ID: <yq5acxxxn0gp.fsf@kernel.org>
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Wed, Jun 10, 2026 at 01:37:26PM +0530, Aneesh Kumar K.V wrote:
>> Jason Gunthorpe <jgg@ziepe.ca> writes:
>> 
>> > On Thu, Jun 04, 2026 at 02:09:43PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> >>  struct page *dma_alloc_from_pool(struct device *dev, size_t size,
>> >> -		void **cpu_addr, gfp_t gfp,
>> >> +		void **cpu_addr, gfp_t gfp, unsigned long attrs,
>> >>  		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
>> >>  {
>> >> -	struct gen_pool *pool = NULL;
>> >> +	struct dma_gen_pool *dma_pool = NULL;
>> >>  	struct page *page;
>> >>  	bool pool_found = false;
>> >>  
>> >> -	while ((pool = dma_guess_pool(pool, gfp))) {
>> >> +	while ((dma_pool = dma_guess_pool(dma_pool, gfp))) {
>> >> +
>> >> +		if (dma_pool->unencrypted != !!(attrs & DMA_ATTR_CC_SHARED))
>> >> +			continue;
>> >
>> > I don't think you should be overloading DMA_ATTR_CC_SHARED like this.
>> >
>> > 	/*
>> > 	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
>> > 	 * attribute. The direct allocator uses it internally after it has
>> > 	 * decided that the backing pages must be shared/decrypted, so the
>> > 	 * rest of the allocation path can consistently select DMA addresses,
>> > 	 * choose compatible pools and restore encryption on free.
>> > 	 */
>> > 	if (attrs & DMA_ATTR_CC_SHARED)
>> > 		return NULL;
>> >
>> > 	if (force_dma_unencrypted(dev)) {
>> > 		attrs |= DMA_ATTR_CC_SHARED;
>> > 		mark_mem_decrypt = true;
>> > 	}
>> >
>> > It is fine to have a bit inside the attrs that is only used by the
>> > internal logic, but it needs to have a clearer name
>> > __DMA_ATTR_REQUIRE_CC_SHARED perhaps.
>> >
>> 
>> Are you suggesting adding another attribute in addition to
>> DMA_ATTR_CC_SHARED?
>> 
>> Is the idea that __DMA_ATTR_REQUIRE_CC_SHARED would be used in the
>> allocation path to request a CC_SHARED allocation, while
>> DMA_ATTR_CC_SHARED would be used in the mapping path to describe the
>> attribute of the address?
>
> Yeah, it is a thought at least
>
> Maybe a comment is good enough.
>
> I just find it hard to follow when we have this dual usage. Like the
> code above for dma_pool->unencrypted is completely wrong if it is an
> "attribute of an address". Easy to cut & paste that into the wrong
> context.
>
> Especially if you move things up higher.. having the alloc set both
> CC_SHARED and REQUIRE_CC_SHARED or maybe ALLOC_CC_SHARED would make it
> clearer that the alloc code lives under that callchain
>
> Jason
>

If we are adding DMA_ATTR_ALLOC_SHARED, should we also allow
dma_alloc_attrs() to take that attribute value?

Does this look okay? 
(Note: Parts of the documentation text were updated using Codex.)

modified   Documentation/core-api/dma-attributes.rst
@@ -179,3 +179,32 @@ interface when building their uAPIs, when possible.
 
 It must never be used in an in-kernel driver that only works with
 kernel memory.
+
+DMA_ATTR_CC_SHARED
+------------------
+
+This attribute indicates that a DMA mapping is shared, or decrypted, for
+confidential computing guests. For normal system memory, the caller must
+already have marked the memory decrypted with set_memory_decrypted(). CPU
+PTEs for the mapping must use pgprot_decrypted(), and the same shared
+semantic may be passed to a vIOMMU when it sets up the IOPTE.
+
+This attribute describes an existing mapping. It does not allocate shared
+backing pages and must not be passed to dma_alloc_attrs(). For MMIO, use
+this together with DMA_ATTR_MMIO to indicate shared MMIO. Unless
+DMA_ATTR_MMIO is provided, the mapping requires a struct page.
+
+DMA_ATTR_ALLOC_CC_SHARED
+------------------------
+
+This attribute indicates that a dma_alloc_attrs() allocation must use
+shared, or decrypted, backing pages for confidential computing guests.
+Allocation paths use this request when they select shared DMA pools,
+decrypt newly allocated pages or restore encryption on free.
+
+DMA_ATTR_ALLOC_CC_SHARED differs from DMA_ATTR_CC_SHARED in that it
+requests shared backing memory from the allocation path. DMA_ATTR_CC_SHARED
+describes an already-shared mapping and requires the caller to have
+prepared normal system memory before mapping it. Callers that need shared
+memory from dma_alloc_attrs() should request DMA_ATTR_ALLOC_CC_SHARED
+instead of DMA_ATTR_CC_SHARED.
modified   include/linux/dma-mapping.h
@@ -103,6 +103,13 @@
  */
 #define DMA_ATTR_CC_SHARED	(1UL << 13)
 
+/*
+ * DMA_ATTR_ALLOC_CC_SHARED: Allocates DMA memory as shared (decrypted) for
+ * confidential computing guests. Unlike DMA_ATTR_CC_SHARED, this attribute
+ * is used by dma_alloc_attrs() paths that create shared backing pages;
+ * DMA_ATTR_CC_SHARED describes an already-shared mapping.
+ */
+#define DMA_ATTR_ALLOC_CC_SHARED	(1UL << 14)
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
  * be given to a device to use as a DMA source or target.  It is specific to a

