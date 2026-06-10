Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0822CD98C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QHcq+ldvvjOXKYe7v0SGXcqZmQygGGJknrasUV2jDg=; b=2JoYk1bk/+xEXN35KnWtAVeddM
	3DjQTCFx3YjsOg3hV9E3vBBdH0nCtMA+1TiKaTd+eHre9gfrzxyzKV6c9aunKijJ8SWDo4anB8/IF
	fucvxM1ylwSDaUZWcSF6NlXe9gkKka7nN2ruzFiCUC/AsCqB8v6xyBTzXzbq3y4ff8qaUWds1s52y
	4aj8HdGPBHctd/rdG88xFLdMiM+fJbRMrVplra469PYipc2omWmL6B+87Gcgrb+Ot5WqOcEksuRG7
	2D/KeVpNr5VNQXrgL/SBqbl0BAq/qVmsgyv8ItQnVAK1TmrPtI72TikUWfd7X4mnp1PnkGdCd9PKA
	ekipmHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDyO-0000000711c-1eoi;
	Wed, 10 Jun 2026 08:07:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDyN-0000000711M-0hja
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:07:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CCC5416F7;
	Wed, 10 Jun 2026 08:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4241F00893;
	Wed, 10 Jun 2026 08:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781078858;
	bh=0QHcq+ldvvjOXKYe7v0SGXcqZmQygGGJknrasUV2jDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UZtvV0j4JPtGHjZWg1UsD2g+GxuSXIcXg6UMmssH9fOxo7BYN9s2Ha3MdttDa9dbZ
	 Y3LzCfYH3mse4KAw7UN/JV6C0wueAFYRrIGQ2UJ5pq6jRXX5P53Ch4aOs4N4umLYYs
	 nxpDHYwre7gShpAf+irvZS6VbqPnGX2pway8OyS6BalzGhpCmqjZn2itF7oRY6PEU+
	 SWXC9gxC0MFuAqRGUuuWYv1ujhTOYVz8b0PbDvuNVvVsTNPknSMUQy9Bm3/tqwgaF8
	 CI7mgB3EIJsBnPozx7Kng480IYc8IOGEBcGtUzsuIOR3Srq3phPC6r3VzcvBTdg+8I
	 keGWA+6ChZARA==
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
In-Reply-To: <20260609143242.GK2764304@ziepe.ca>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-5-aneesh.kumar@kernel.org>
 <20260609143242.GK2764304@ziepe.ca>
Date: Wed, 10 Jun 2026 13:37:26 +0530
Message-ID: <yq5afr2uzum9.fsf@kernel.org>
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

> On Thu, Jun 04, 2026 at 02:09:43PM +0530, Aneesh Kumar K.V (Arm) wrote:
>>  struct page *dma_alloc_from_pool(struct device *dev, size_t size,
>> -		void **cpu_addr, gfp_t gfp,
>> +		void **cpu_addr, gfp_t gfp, unsigned long attrs,
>>  		bool (*phys_addr_ok)(struct device *, phys_addr_t, size_t))
>>  {
>> -	struct gen_pool *pool = NULL;
>> +	struct dma_gen_pool *dma_pool = NULL;
>>  	struct page *page;
>>  	bool pool_found = false;
>>  
>> -	while ((pool = dma_guess_pool(pool, gfp))) {
>> +	while ((dma_pool = dma_guess_pool(dma_pool, gfp))) {
>> +
>> +		if (dma_pool->unencrypted != !!(attrs & DMA_ATTR_CC_SHARED))
>> +			continue;
>
> I don't think you should be overloading DMA_ATTR_CC_SHARED like this.
>
> 	/*
> 	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
> 	 * attribute. The direct allocator uses it internally after it has
> 	 * decided that the backing pages must be shared/decrypted, so the
> 	 * rest of the allocation path can consistently select DMA addresses,
> 	 * choose compatible pools and restore encryption on free.
> 	 */
> 	if (attrs & DMA_ATTR_CC_SHARED)
> 		return NULL;
>
> 	if (force_dma_unencrypted(dev)) {
> 		attrs |= DMA_ATTR_CC_SHARED;
> 		mark_mem_decrypt = true;
> 	}
>
> It is fine to have a bit inside the attrs that is only used by the
> internal logic, but it needs to have a clearer name
> __DMA_ATTR_REQUIRE_CC_SHARED perhaps.
>

Are you suggesting adding another attribute in addition to
DMA_ATTR_CC_SHARED?

Is the idea that __DMA_ATTR_REQUIRE_CC_SHARED would be used in the
allocation path to request a CC_SHARED allocation, while
DMA_ATTR_CC_SHARED would be used in the mapping path to describe the
attribute of the address?



>
> The sashiko note does look legit though:
>
> 	if (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> 	    !gfpflags_allow_blocking(gfp) && !coherent) {
> 		page = dma_alloc_from_pool(dev, PAGE_ALIGN(size), &cpu_addr,
> 					   gfp, attrs, NULL);
> 		if (!page)
> 			return NULL;
>
> I don't see anything doing the force_dma_unencrypted test along this
> callchain..
>
> I guess it should be done one step up in dma_alloc_attrs() instead of
> in dma_direct_alloc()?
>

Yes, I'll move it there.

-aneesh

