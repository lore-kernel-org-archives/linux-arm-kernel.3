Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB998E7314E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqSNeInxt7ge3vHvXR2tpPnDw29vSc0mORPkcY/eAMk=; b=01KeMocnN6zlhmuiDexextLHHx
	raeC5j41OI+2Tm3TdvX3VMArDjk3rVG5U0GKMhVr3CIDxCOnf9iWw+GzWJY1M2FrcEUqU4ojXnND+
	r1kaELH0KW7a1B92NUalW0xOC9hogtEUzTkjmL25JjZ9/c3OEABZNS/VPmDjk+OtrT+5wf2P7L5sY
	XgtiZNwbNnUNqlDGfrFAzZWn47aGygNp34kwC6X8PQ0XkYM2imuWTPUYWnW4grVAiXlNVMiHQxWTd
	WZVXU+AdeA6zX8L3kpHlIdzK1Hl/UkXSscURZW7BjCHWGB1d50GH04UbzvBgZUY4JUMSCcKydDvuN
	C3wgjQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrUC-00000004r9x-30Lr;
	Mon, 02 Feb 2026 10:48:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrUA-00000004r9P-1ACe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:48:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7741F339;
	Mon,  2 Feb 2026 02:48:42 -0800 (PST)
Received: from [10.163.168.36] (unknown [10.163.168.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A5433F740;
	Mon,  2 Feb 2026 02:48:45 -0800 (PST)
Message-ID: <86888c49-4596-48ba-b480-bd317d386c72@arm.com>
Date: Mon, 2 Feb 2026 16:18:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64/mm: Enable batched TLB flush in
 unmap_hotplug_range()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260202042617.504183-1-anshuman.khandual@arm.com>
 <20260202042617.504183-2-anshuman.khandual@arm.com>
 <57bc3f07-c227-4117-8fb4-a2b198629215@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <57bc3f07-c227-4117-8fb4-a2b198629215@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_024850_405844_FD3EA41D 
X-CRM114-Status: GOOD (  30.58  )
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



On 02/02/26 2:48 PM, Ryan Roberts wrote:
> On 02/02/2026 04:26, Anshuman Khandual wrote:
>> During a memory hot remove operartion both linear and vmemmap mappings for
>> the memory range being removed, get unmapped via unmap_hotplug_range() but
>> mapped pages get freed only for vmemmap mapping. This is just a sequential
>> operation where each table entry gets cleared, followed by a leaf specific
>> TLB flush, and then followed by memory free operation when applicable.
>>
>> This approach was simple and uniform both for vmemmap and linear mappings.
>> But linear mapping might contain CONT marked block memory where it becomes
>> necessary to first clear out all entire in the range before a TLB flush.
>> This is as per the architecture requirement. Hence batch all TLB flushes
>> during the table tear down walk and finally do it in unmap_hotplug_range().
> 
> I might be worth mentioning the impact of not bein architecture compliant here?
> 
> Something like:
> 
>   Prior to this fix, it was hypothetically possible for a speculative access to
>   a higher address in the contiguous block to fill the TLB with shattered
>   entries for the entire contiguous range after a lower address had already been
>   cleared and invalidated. Due to the entries being shattered, the subsequent
>   tlbi for the higher address would not then clear the TLB entries for the lower
>   address, meaning stale TLB entries could persist.

Sounds good - will add in the commit message.

> 
>>
>> Besides it is helps in improving the performance via TLBI range operation
> 
> nit:         ^^ (remove)

Will fix that.

> 
>> along with reduced synchronization instructions. The time spent executing
>> unmap_hotplug_range() improved 97% measured over a 2GB memory hot removal
>> in KVM guest.
> 
> That's a great improvement :)
> 
>>
>> This scheme is not applicable during vmemmap mapping tear down where memory
>> needs to be freed and hence a TLB flush is required after clearing out page
>> table entry.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Closes: https://lore.kernel.org/all/aWZYXhrT6D2M-7-N@willie-the-truck/
>> Fixes: bbd6ec605c0f ("arm64/mm: Enable memory hot remove")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> I suggested the original shape of this and I see you have added my SOB. Final
> patch looks good to me - I'm not sure if it's correct for me to add Rb, but here
> it is regardless:
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Thanks !

> 
> 
>> ---
>>  arch/arm64/mm/mmu.c | 81 +++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 67 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8e1d80a7033e..8ec8a287aaa1 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1458,10 +1458,32 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>>  
>>  		WARN_ON(!pte_present(pte));
>>  		__pte_clear(&init_mm, addr, ptep);
>> -		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>> -		if (free_mapped)
>> +		if (free_mapped) {
>> +			/*
>> +			 * If page is part of an existing contiguous
>> +			 * memory block, individual TLB invalidation
>> +			 * here would not be appropriate. Instead it
>> +			 * will require clearing all entries for the
>> +			 * memory block and subsequently a TLB flush
>> +			 * for the entire range.
>> +			 */
>> +			WARN_ON(pte_cont(pte));
>> +
>> +			/*
>> +			 * TLB flush is essential for freeing memory.
>> +			 */
>> +			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>  			free_hotplug_page_range(pte_page(pte),
>>  						PAGE_SIZE, altmap);
>> +		}
>> +
>> +		/*
>> +		 * TLB flush is batched in unmap_hotplug_range()
>> +		 * for the entire range, when memory need not be
>> +		 * freed. Besides linear mapping might have CONT
>> +		 * blocks where TLB flush needs to be done after
>> +		 * clearing all relevant entries.
>> +		 */
>>  	} while (addr += PAGE_SIZE, addr < end);
>>  }
>>  
>> @@ -1482,15 +1504,32 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>>  		WARN_ON(!pmd_present(pmd));
>>  		if (pmd_sect(pmd)) {
>>  			pmd_clear(pmdp);
>> +			if (free_mapped) {
>> +				/*
>> +				 * If page is part of an existing contiguous
>> +				 * memory block, individual TLB invalidation
>> +				 * here would not be appropriate. Instead it
>> +				 * will require clearing all entries for the
>> +				 * memory block and subsequently a TLB flush
>> +				 * for the entire range.
>> +				 */
>> +				WARN_ON(pmd_cont(pmd));
>> +
>> +				/*
>> +				 * TLB flush is essential for freeing memory.
>> +				 */
>> +				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
>> +				free_hotplug_page_range(pmd_page(pmd),
>> +							PMD_SIZE, altmap);
>> +			}
>>  
>>  			/*
>> -			 * One TLBI should be sufficient here as the PMD_SIZE
>> -			 * range is mapped with a single block entry.
>> +			 * TLB flush is batched in unmap_hotplug_range()
>> +			 * for the entire range, when memory need not be
>> +			 * freed. Besides linear mapping might have CONT
>> +			 * blocks where TLB flush needs to be done after
>> +			 * clearing all relevant entries.
>>  			 */
>> -			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>> -			if (free_mapped)
>> -				free_hotplug_page_range(pmd_page(pmd),
>> -							PMD_SIZE, altmap);
>>  			continue;
>>  		}
>>  		WARN_ON(!pmd_table(pmd));
>> @@ -1515,15 +1554,20 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>>  		WARN_ON(!pud_present(pud));
>>  		if (pud_sect(pud)) {
>>  			pud_clear(pudp);
>> +			if (free_mapped) {
>> +				/*
>> +				 * TLB flush is essential for freeing memory.
>> +				 */
>> +				flush_tlb_kernel_range(addr, addr + PUD_SIZE);
>> +				free_hotplug_page_range(pud_page(pud),
>> +							PUD_SIZE, altmap);
>> +			}
>>  
>>  			/*
>> -			 * One TLBI should be sufficient here as the PUD_SIZE
>> -			 * range is mapped with a single block entry.
>> +			 * TLB flush is batched in unmap_hotplug_range()
>> +			 * for the entire range, when memory need not be
>> +			 * freed.
>>  			 */
>> -			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>> -			if (free_mapped)
>> -				free_hotplug_page_range(pud_page(pud),
>> -							PUD_SIZE, altmap);
>>  			continue;
>>  		}
>>  		WARN_ON(!pud_table(pud));
>> @@ -1553,6 +1597,7 @@ static void unmap_hotplug_p4d_range(pgd_t *pgdp, unsigned long addr,
>>  static void unmap_hotplug_range(unsigned long addr, unsigned long end,
>>  				bool free_mapped, struct vmem_altmap *altmap)
>>  {
>> +	unsigned long start = addr;
>>  	unsigned long next;
>>  	pgd_t *pgdp, pgd;
>>  
>> @@ -1574,6 +1619,14 @@ static void unmap_hotplug_range(unsigned long addr, unsigned long end,
>>  		WARN_ON(!pgd_present(pgd));
>>  		unmap_hotplug_p4d_range(pgdp, addr, next, free_mapped, altmap);
>>  	} while (addr = next, addr < end);
>> +
>> +	/*
>> +	 * Batched TLB flush only for linear mapping which
>> +	 * might contain CONT blocks, and does not require
>> +	 * freeing up memory as well.
>> +	 */
>> +	if (!free_mapped)
>> +		flush_tlb_kernel_range(start, end);
>>  }
>>  
>>  static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,
> 


