Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB306C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 12:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOJOMq58jKAKMa59MPVaGQhSJiELzNeCXp/dame3PA4=; b=sT72O2LARLdaiQJlbsL+jQTkZY
	2cItKWIMhSIw5SRxnw5buOLaJ7zB4xHKUC+7Voko6u0YsW77RKDcEwfDodw0Bs3RDhzllD/6U2yAA
	0wVycNqlm3xD7Es7pczPNv75t+LeUbzdmHoMkMbL3X+2DGoUJqlW8IAPPaXST9MP45DkX+qQVuCRU
	xWiBFZ2oxia7DmilZqxh1CtmlLkyNioEXWwii27+Co4EoclMbmnVgVJe6kM/UdRd24bHjCLeDdO6Y
	NjiGfqXzoao1KMQhAVs4Ochcl/UblxPyxneLSgadMXilzMUuOwir5AGnvCypACTBWjRXFhmN0FbUz
	zrV2Fu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulROY-00000007bfJ-0Rpf;
	Mon, 11 Aug 2025 12:12:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulRLu-00000007bFw-2L5k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 12:10:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 856C01D13;
	Mon, 11 Aug 2025 05:09:59 -0700 (PDT)
Received: from [10.57.5.137] (unknown [10.57.5.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22B1B3F738;
	Mon, 11 Aug 2025 05:09:59 -0700 (PDT)
Message-ID: <8fd39851-4bbc-4a31-84d9-5939b519d308@arm.com>
Date: Mon, 11 Aug 2025 13:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 1/2] dma/pool: Use vmap() address for memory
 encryption helpers on ARM64
To: Mike Rapoport <rppt@kernel.org>,
 Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Steven Price <steven.price@arm.com>, linux-arm-kernel@lists.infradead.org,
 Gavin Shan <gshan@redhat.com>, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>, Dev Jain <dev.jain@arm.com>,
 David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250811005036.714274-1-sdonthineni@nvidia.com>
 <20250811005036.714274-2-sdonthineni@nvidia.com>
 <aJmuXTNUzsq1jKEK@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <aJmuXTNUzsq1jKEK@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_051010_679969_D3A2B635 
X-CRM114-Status: GOOD (  18.63  )
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

On 2025-08-11 9:48 am, Mike Rapoport wrote:
> On Sun, Aug 10, 2025 at 07:50:34PM -0500, Shanker Donthineni wrote:
>> In atomic_pool_expand(), set_memory_encrypted()/set_memory_decrypted()
>> are currently called with page_to_virt(page). On ARM64 with
>> CONFIG_DMA_DIRECT_REMAP=y, the atomic pool is mapped via vmap(), so
>> page_to_virt(page) does not reference the actual mapped region.
>>
>> Using this incorrect address can cause encryption attribute updates to
>> be applied to the wrong memory region. On ARM64 systems with memory
>> encryption enabled (e.g. CCA), this can lead to data corruption or
>> crashes.
>>
>> Fix this by using the vmap() address ('addr') on ARM64 when invoking
>> the memory encryption helpers, while retaining the existing
>> page_to_virt(page) usage for other architectures.
>>
>> Fixes: 76a19940bd62 ("dma-direct: atomic allocations must come from atomic coherent pools")
>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>> ---
>>   kernel/dma/pool.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
>> index 7b04f7575796b..ba08a301590fd 100644
>> --- a/kernel/dma/pool.c
>> +++ b/kernel/dma/pool.c
>> @@ -81,6 +81,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>>   {
>>   	unsigned int order;
>>   	struct page *page = NULL;
>> +	void *vaddr;
>>   	void *addr;
>>   	int ret = -ENOMEM;
>>   
>> @@ -113,8 +114,8 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>>   	 * Memory in the atomic DMA pools must be unencrypted, the pools do not
>>   	 * shrink so no re-encryption occurs in dma_direct_free().
>>   	 */
>> -	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
>> -				   1 << order);
>> +	vaddr = IS_ENABLED(CONFIG_ARM64) ? addr : page_to_virt(page);
> 
> There's address calculation just before this code:
> 
> #ifdef CONFIG_DMA_DIRECT_REMAP
> 	addr = dma_common_contiguous_remap(page, pool_size,
> 					   pgprot_dmacoherent(PAGE_KERNEL),
> 					   __builtin_return_address(0));
> 	if (!addr)
> 		goto free_page;
> #else
> 	addr = page_to_virt(page);
> #endif
> 
> It should be enough to s/page_to_virt(page)/addr in the call to
> set_memory_decrypted().

Indeed, and either way this is clearly a DMA_DIRECT_REMAP concern rather 
than just an ARM64 one.

Thanks,
Robin.

>> +	ret = set_memory_decrypted((unsigned long)vaddr, 1 << order);
>>   	if (ret)
>>   		goto remove_mapping;
>>   	ret = gen_pool_add_virt(pool, (unsigned long)addr, page_to_phys(page),
>> @@ -126,8 +127,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
>>   	return 0;
>>   
>>   encrypt_mapping:
>> -	ret = set_memory_encrypted((unsigned long)page_to_virt(page),
>> -				   1 << order);
>> +	ret = set_memory_encrypted((unsigned long)vaddr, 1 << order);
>>   	if (WARN_ON_ONCE(ret)) {
>>   		/* Decrypt succeeded but encrypt failed, purposely leak */
>>   		goto out;
>> -- 
>> 2.25.1
>>
> 


