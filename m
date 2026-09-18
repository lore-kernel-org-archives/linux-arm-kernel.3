Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE3DC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YT138mzFYBzcp/KszwOIxLaJLDjOMSjvrIa4MLAD/i4=; b=dv+dYqN7QYk/FK
	lJIOwwKX97H7n1FZsKkSyhQdLRBW35GSZhAGonSxOd65L7eApMjGTmAH9jI+30/JG0tL3ykYHiXJE
	4MYmoJeBAzFaa5mFpIi9O6hIHnSkPVAnyQ34nFJi9n0ms+6D0tF8gA+/oGc68Ect6Pk3YU3xsnDWP
	Dorx/TTsvTI7wv01nZb6xmQTnnDnWoUxmuR9DNL3sb8+SBZEOc4YpxUJVLupYVCpQzacuxbNB5ntr
	KSPjqL+CnH/y6OURwDCsAhmiOCxy3JzfKgUjyORaIp8pl2DGYWJnXigdNJ9xJd+TSJ9gdZVi1wfpe
	hdAC9Qyt1/oOsFuYpt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aKh-0000000EqlT-2UHQ;
	Fri, 18 Sep 2026 15:16:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7aKe-0000000EqkT-1t0m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 15:16:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E929E168F;
	Fri, 18 Sep 2026 08:16:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31C553F7B4;
	Fri, 18 Sep 2026 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789744611; bh=a5utTgTrQwCtDxIq1a+n9f+R6vI9xlTx+AyFq50CaAg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TB9/msUHN2vrWlQICZPC+83cf1IB/i9/2I3Z/TrF6MORPdTsqSiyRyZ2ANfolctQh
	 2ByVOQm6mphvT4Q0jPKHlFkmiTDKzOHNc8fCuy7eInksOMWoRusFG/dgFliyApexUa
	 W8RUrbqXZuAK7JBy+Xtm7ryZmh0cTjMK4M5MbI7E=
Date: Fri, 18 Sep 2026 16:16:46 +0100
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
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
Message-ID: <aq1V3oeDdvXobt8J@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904103452.1197239-8-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_081656_951717_7F8F3651 
X-CRM114-Status: GOOD (  30.92  )
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

First, none of the DMA-BUF maintainers have been cc'ed. It might be fine
for an RFC but this series got to version 6. We need their feedback.

On Fri, Sep 04, 2026 at 04:04:50PM +0530, Aneesh Kumar K.V (Arm) wrote:
> The system heap can allocate buffers that are decrypted and shared with the
> host. For confidential-computing guests, those shared buffers must cover
> whole shared-buffer granule; otherwise a userspace mmap of the dma-buf may
> expose only part of a host-managed granule and allow unintended access to
> adjacent private memory.
> 
> Require cc-shared system-heap allocations to have a size aligned to
> mem_cc_shared_granule_size(), and allocate pages at least as large as the
> required granule. Keep the allocation bounded by the existing heap orders,
> but fall back to an exact minimum-order allocation when the required
> granule is not one of the preferred heap orders.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 50 +++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index c8959eadc71d..9cbfcebe2088 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -55,7 +55,6 @@ struct dma_heap_attachment {
>  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
>  				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
>  				| __GFP_COMP)
> -static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
>  /*
>   * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
>   * to match with the sizes often found in IOMMUs. Using order 4 pages instead
> @@ -375,26 +374,44 @@ static const struct dma_buf_ops system_heap_buf_ops = {
>  	.release = system_heap_dma_buf_release,
>  };
>  
> +static struct page *system_heap_alloc_order(unsigned int order)
> +{
> +	gfp_t flags = order ? HIGH_ORDER_GFP : LOW_ORDER_GFP;
> +
> +	if (mem_accounting)
> +		flags |= __GFP_ACCOUNT;
> +
> +	return alloc_pages(flags, order);
> +}
> +
>  static struct page *alloc_largest_available(unsigned long size,
> -					    unsigned int max_order)
> +					    unsigned int max_order,
> +					    unsigned int min_order)
>  {
>  	struct page *page;
>  	int i;
> -	gfp_t flags;
>  
>  	for (i = 0; i < NUM_ORDERS; i++) {
>  		if (size <  (PAGE_SIZE << orders[i]))
>  			continue;
> -		if (max_order < orders[i])
> +
> +		if (max_order < orders[i] || orders[i] < min_order)
>  			continue;
> -		flags = order_flags[i];
> -		if (mem_accounting)
> -			flags |= __GFP_ACCOUNT;
> -		page = alloc_pages(flags, orders[i]);
> +
> +		page = system_heap_alloc_order(orders[i]);
>  		if (!page)
>  			continue;
>  		return page;
>  	}
> +	/*
> +	 * The required minimum order might not be one of the preferred heap
> +	 * orders. Allocate exactly min_order when it does not exceed the
> +	 * remaining size.
> +	 */
> +	if (min_order && min_order <= max_order &&
> +	    size >= (PAGE_SIZE << min_order))
> +		return system_heap_alloc_order(min_order);
> +
>  	return NULL;
>  }
>  
> @@ -409,6 +426,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	unsigned int max_order = orders[0];
>  	struct system_heap_priv *priv = dma_heap_get_drvdata(heap);
>  	bool cc_shared = priv->cc_shared;
> +	unsigned int min_order = 0;
> +	size_t cc_granule_size;
>  	struct dma_buf *dmabuf;
>  	struct sg_table *table;
>  	struct scatterlist *sg;
> @@ -425,6 +444,18 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
>  	buffer->heap = heap;
>  	buffer->len = len;
>  	buffer->cc_shared = cc_shared;
> +	if (cc_shared_buffer(buffer)) {
> +		cc_granule_size = mem_cc_shared_granule_size();
> +		if (!IS_ALIGNED(len, cc_granule_size)) {
> +			ret = -EINVAL;
> +			goto free_buffer;
> +		}
> +		min_order = get_order(cc_granule_size);
> +		if (min_order > max_order) {
> +			ret = -EINVAL;
> +			goto free_buffer;
> +		}
> +	}
>  
>  	INIT_LIST_HEAD(&pages);

You need to get a proper base so that Sashiko can review this series. I
ran it through Claude and the above is wrong to go to free_buffer which
walks over the pages list that has not been initialised yet.

Another issue, I'm just copying it verbatim:

drivers/dma-buf/heaps/system_heap.c:379 (patch 7/9)
system_heap_alloc_order() picks "order ? HIGH_ORDER_GFP :
LOW_ORDER_GFP".  HIGH_ORDER_GFP clears __GFP_RECLAIM and sets
__GFP_NORETRY, which was fine while orders 8/4 always had order 0 as a
fallback.  The new min_order fallback at line 411 has no smaller order
to fall back to - it is the mandatory minimum.  On a 16K-page host with
a 4K-page guest, min_order = get_order(SZ_16K) = 2, which is not in
orders[] = {8, 4, 0}, and order 0 is filtered out by "orders[i] <
min_order".  Every tail allocation below 64K therefore goes through the
non-reclaiming fallback and returns -ENOMEM under pressure that ordinary
reclaim would have cleared.  Note any fix must keep __GFP_COMP:
compound_order()/page_size() are used on the result
(system_heap_set_page_decrypted(), the free paths and sg_set_page()).

-- 
Catalin

