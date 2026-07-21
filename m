Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFBDC44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbjfsvMUtOM597sXFYSy4LMyCCKlivTlN6bg0GYZbig=; b=IOmUOmIpROtR/nDj3IGTW33Uqv
	kBCelNffqDByZwsptjR97t61o8dZkLuSbRz0BevNJjrRxNUbCBebCCHR7bRqnPvz07B7/Ad3HF88c
	yTA63JDHAVD2XTR+dKL8/OIiMB+nfbGPianhKPVe2uLqJpV/3WanlQHMpbrR4OzBthf3YS8W36v9F
	Lhel7XoQugHegiJ+zPcAj7FB2Eb/YyVx38GrjlYeHmcDZ9LikG2+mMijh+5NuIVJyzD2GL+pwTBL1
	stEIa1DLAW5pZSX/WAKawB1QPgOHfW+2hOwrl/b0R9Fw/tQ/75HqE47buHG+pj221PXqRrCd6eN9u
	BjKt6dGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBfL-00000009gHZ-1q03;
	Tue, 21 Jul 2026 14:41:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBfJ-00000009gHS-35ZC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:41:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB94842D81;
	Tue, 21 Jul 2026 14:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F6E1F00AC4;
	Tue, 21 Jul 2026 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784644908;
	bh=cbjfsvMUtOM597sXFYSy4LMyCCKlivTlN6bg0GYZbig=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=a9sMx8TlLU2rGUvpHoxNcYyMDx/kraTiQ25aOr5lNDOnmZaWccTNeAMKsWTIfXblc
	 Ep70skfYp6qXTCsQAA/kIwueiGEp4e7ZiYRPJYNmsnVW0fa1/6Hqf2cphc4qIQ78FB
	 xwK26DYrQnIMXproaXvVtR8riyHv/FmjZBQcRCCIz3L556YvFQ4sx8zc70mUNJOkMX
	 y/G46IpQzBIjnS7IWD7Id+pYRhSq5V+YCyP0xMGyXBEG0eqv0Jj39WI9et8O6YsJoq
	 /1FpVoYDunZEVtzPRG/eSUAmdBc/cDXEl8oWt4qLu7jZ4duE3/2D5WVldSKMmAXEVv
	 0Uyp0VWxjGPYQ==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
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
	Jason Gunthorpe <jgg@nvidia.com>,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v8 02/23] dma-pool: fix page leak in
 atomic_pool_expand() cleanup
In-Reply-To: <20260721123107.GJ110966@unreal>
References: <20260717180442.110954-1-aneesh.kumar@kernel.org>
 <20260717180442.110954-3-aneesh.kumar@kernel.org>
 <20260721123107.GJ110966@unreal>
Date: Tue, 21 Jul 2026 20:11:34 +0530
Message-ID: <yq5aqzkw76ch.fsf@kernel.org>
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

Leon Romanovsky <leon@kernel.org> writes:

> On Fri, Jul 17, 2026 at 11:34:20PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> atomic_pool_expand() frees the allocated pages from the remove_mapping
>> error path only when CONFIG_DMA_DIRECT_REMAP is enabled.
>> 
>> When CONFIG_DMA_DIRECT_REMAP is disabled, failures after page allocation,
>> such as gen_pool_add_virt(), jump to remove_mapping and return without
>> freeing the pages.
>> 
>> Move __free_pages(page, order) out of the CONFIG_DMA_DIRECT_REMAP block so
>> that cleanup paths always release the allocation.
>> 
>> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> Tested-by: Michael Kelley <mhklinux@outlook.com>
>> Tested-by: Mostafa Saleh <smostafa@google.com>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>  kernel/dma/pool.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>> 
>> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
>> index 2b2fbb709242..b0303efbc153 100644
>> --- a/kernel/dma/pool.c
>> +++ b/kernel/dma/pool.c
>> @@ -81,6 +81,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>>  {
>>  	unsigned int order;
>>  	struct page *page = NULL;
>> +	bool leak_pages = false;
>>  	void *addr;
>>  	int ret = -ENOMEM;
>>  
>> @@ -115,8 +116,10 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>>  	 */
>>  	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
>>  				   1 << order);
>> -	if (ret)
>> +	if (ret) {
>> +		leak_pages = true;
>>  		goto remove_mapping;
>> +	}
>>  	ret = gen_pool_add_virt(pool, (unsigned long)addr, page_to_phys(page),
>>  				pool_size, NUMA_NO_NODE);
>>  	if (ret)
>> @@ -130,14 +133,15 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>>  				   1 << order);
>>  	if (WARN_ON_ONCE(ret)) {
>>  		/* Decrypt succeeded but encrypt failed, purposely leak */
>> -		goto out;
>> +		leak_pages = true;
>
> Instead of doing this dance with temporal variable, change "goto out" to
> be "return true".
>


I didn't follow the return true part. A failure in
set_memory_encrypted() or set_memory_decrypted() requires the pages to
be leaked, so this is not the only call site that sets leak_pages =
true. There is a similar case a few lines above.


>
>>  	}
>>  remove_mapping:
>>  #ifdef CONFIG_DMA_DIRECT_REMAP
>>  	dma_common_free_remap(addr, pool_size);
>>  free_page:
>
> Remove free_page label, and change leftover of "goto free_page" to be
> "goto out"
>
>> -	__free_pages(page, order);
>>  #endif
>> +	if (!leak_pages)
>> +		__free_pages(page, order);
>
> Put these checks under out label and rely on page != NULL as a marker.
> if (page)
>  __free_pages(page, order);
>
>>  out:
>>  	return ret;
>>  }
>> -- 
>> 2.43.0
>> 
>> 

-aneesh

