Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C304CCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIu5mk7+fDzBkFE8LUyyxyRKu1YjSQcW0/cQDtsXGSI=; b=MLsp3ORYPbXE4aAKeSR0aBAGL1
	MOw3j1vjYsz/etTQH2E5FFlB7Gv8KQ0KSkRAVRgTtX5pgNeRdJfvLw1gIfQ/s7NAdIoA3Mo6RTsVk
	pWiWfF+V01xxmmi8aSC/jcLIpWyjGvXD6sj855zh9A+zk7Sh47ef3OSZVlCV2uTk9/G+D4VWCQBOL
	T79Ue7z0fz7dv3icxVnXi/dTMkxn0qabQUQYBYVHFBG9qC7vmDAkvFRRtadcCSErDqCEwUwHQZRip
	hdRujAKn96yygs8u+J4Bo2KW++ukRJKihm9fRKcoMD3x8DLQT5GOLuMqJ0fJw5VvrdtzQbZhjCQ7z
	cYFVF+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEa2-000000077U6-06HU;
	Wed, 10 Jun 2026 08:46:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEa0-000000077Tf-4BT0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47E4A6001A;
	Wed, 10 Jun 2026 08:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954211F00893;
	Wed, 10 Jun 2026 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781081191;
	bh=GIu5mk7+fDzBkFE8LUyyxyRKu1YjSQcW0/cQDtsXGSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gqceO5WtU+8o4iRLg+54E8X01VwOX/Pcl7CIT39DQ0pqmrHHo/vBxeK7jsaOAcCaS
	 YBgcKllYIQj1HWF/hPyROXVFlBBcsVf7biqD1SoLBFLlOCDPz2cSZKwrkPq2JjJeON
	 Ktk7ZoQL/je6Tm7V0x4WHLl6FPfnSFgfRLowvXIjL0V6x/Z73L5zTuiKuUCUObt8VJ
	 vIsqW9AMwRWNEkg0dDhmgKSYTJ0+WlZY+fHkDiYP/mNT/IAr5DJi+PSaHxr1QXu7ax
	 U6yoqsWAiXT9wxpMsRUn8xlVD4N61bGUJO8A/UMw01rLgt/SDu1HpcZ4IbOjfgm+V1
	 vidQTXP2nKKgg==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Petr Tesarik <ptesarik@suse.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
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
Subject: Re: [PATCH v6 06/20] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
In-Reply-To: <20260609144836.4ecea34e@mordecai>
References: <20260604083959.1265923-1-aneesh.kumar@kernel.org>
 <20260604083959.1265923-7-aneesh.kumar@kernel.org>
 <20260609144836.4ecea34e@mordecai>
Date: Wed, 10 Jun 2026 14:16:17 +0530
Message-ID: <yq5acxxyzsti.fsf@kernel.org>
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

Petr Tesarik <ptesarik@suse.com> writes:

> On Thu,  4 Jun 2026 14:09:45 +0530
> "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:
>

...

>>  /*
>>   * If memory encryption is supported, phys_to_dma will set the memory encryption
>>   * bit in the DMA address, and dma_to_phys will clear it.
>> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
>> index 29187cec90d8..4dcbf3931be1 100644
>> --- a/include/linux/swiotlb.h
>> +++ b/include/linux/swiotlb.h
>> @@ -81,6 +81,7 @@ struct io_tlb_pool {
>>  	struct list_head node;
>>  	struct rcu_head rcu;
>>  	bool transient;
>> +	bool unencrypted;
>
> IIUC this is a copy of the unencrypted member in the corresponding
> struct io_tlb_mem. In other words, if pools are allocated dynamically,
> all pools must have the same encryption state, correct?
>

That is correct. The reason we have the unencrypted member in struct
io_tlb_pool is that we need it in swiotlb_dyn_free().

When freeing memory from an unencrypted pool, we need to convert the
memory back to private/encrypted

>
>>  #endif
>>  };
>>  
>> @@ -111,6 +112,7 @@ struct io_tlb_mem {
>>  	struct dentry *debugfs;
>>  	bool force_bounce;
>>  	bool for_alloc;
>> +	bool unencrypted;
>>  #ifdef CONFIG_SWIOTLB_DYNAMIC
>>  	bool can_grow;
>>  	u64 phys_limit;
>> @@ -282,7 +284,8 @@ static inline void swiotlb_sync_single_for_cpu(struct device *dev,
>>  extern void swiotlb_print_info(void);

....

>> @@ -604,30 +621,26 @@ static struct page *alloc_dma_pages(gfp_t gfp, size_t bytes, u64 phys_limit)
>>   * @dev:	Device for which a memory pool is allocated.
>>   * @bytes:	Size of the buffer.
>>   * @phys_limit:	Maximum allowed physical address of the buffer.
>> + * @attrs:	DMA attributes for the allocation.
>>   * @gfp:	GFP flags for the allocation.
>>   *
>>   * Return: Allocated pages, or %NULL on allocation failure.
>>   */
>>  static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>> -		u64 phys_limit, gfp_t gfp)
>> +		u64 phys_limit, unsigned long attrs, gfp_t gfp)
>
> If my assumption above is correct, then I prefer to add a struct
> io_tlb_mem *mem parameter here and calculate the allocation attributes
> inside this function, so you don't have to repeat it in the callers.
>

Will switch to that. That is, we will use struct io_tlb_mem->unencrypted
to determine the pool attribute instead of using unsigned long attrs

>
>>  {
>>  	struct page *page;
>> -	unsigned long attrs = 0;
>>  
>>  	/*
>>  	 * Allocate from the atomic pools if memory is encrypted and
>>  	 * the allocation is atomic, because decrypting may block.
>>  	 */
>> -	if (!gfpflags_allow_blocking(gfp) && dev && force_dma_unencrypted(dev)) {
>> +	if (!gfpflags_allow_blocking(gfp) && (attrs & DMA_ATTR_CC_SHARED)) {
>
> You're removing the check that dev is non-NULL. This is fine, because
> the only call with dev == NULL is from swiotlb_dyn_alloc(), and that one
> uses GFP_KERNEL (i.e. allows blocking). However, if this is an intended
> optimization, I'd rather have it in a separate commit, with this
> explanation why it's OK to do it.
>
> The rest of the patch looks good to me.
>

I'll add that back.

-aneesh

