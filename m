Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D48E67A6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 05:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwparYnPENMdxpAwe8ErJK9N0xMFNw1YoMwre4zcz5A=; b=EjYbB+dJ1/fBaOBf9ve80wn0cl
	rAGr5yq9ugO3PgCUEfaJzVHgNd3fo2J+S0ngFxaCDuVclnik/U/aGZOO8WbW7TdZZ2E863+e2aqxN
	A2Qv0lQhiu1YxheeBRP1lr5b9YZP5wMl9LhEbEu4s8NDncb5h8761a39v84r8WpM7NYYs/aDIgFf3
	UYz/Kk/zn0EUI7YQ9u/I2thY/kcPjnmv26dmRn0+J9zbjCrV6exQmk3L3duODzI2jsDz5nwSrA7mV
	QDxHtvoIf1AuLVTMUcr/7dTgwAubpNJAK0UGGJLoBLMM8MsjNVwDxPB7FXVDYhw7DXnkgBvkWO6WC
	yOjL9yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIiw-0000000EZYZ-3PJs;
	Tue, 03 Mar 2026 05:55:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxIit-0000000EZXz-3lkt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 05:55:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72B54497;
	Mon,  2 Mar 2026 21:55:01 -0800 (PST)
Received: from [10.164.18.51] (unknown [10.164.18.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C53633F73B;
	Mon,  2 Mar 2026 21:55:04 -0800 (PST)
Message-ID: <f417f7fd-1fc9-4bd8-92a0-4b7c09d5296e@arm.com>
Date: Tue, 3 Mar 2026 11:25:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] arm64/mm: Enable batched TLB flush in
 unmap_hotplug_range()
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>, Christoph Lameter <cl@gentwo.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260224062423.972404-1-anshuman.khandual@arm.com>
 <20260224062423.972404-2-anshuman.khandual@arm.com>
 <bf956adb-06bc-4b68-b846-7dddb9413867@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <bf956adb-06bc-4b68-b846-7dddb9413867@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_215512_046139_89F2677D 
X-CRM114-Status: GOOD (  35.49  )
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



On 02/03/26 8:58 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 07:24, Anshuman Khandual wrote:
>> During a memory hot remove operation, both linear and vmemmap mappings for
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
>>
>> Prior to this fix, it was hypothetically possible for a speculative access
>> to a higher address in the contiguous block to fill the TLB with shattered
>> entries for the entire contiguous range after a lower address had already
>> been cleared and invalidated. Due to the table entries being shattered, the
>> subsequent TLB invalidation for the higher address would not then clear the
>> TLB entries for the lower address, meaning stale TLB entries could persist.
>>
>> Besides it also helps in improving the performance via TLBI range operation
>> along with reduced synchronization instructions. The time spent executing
>> unmap_hotplug_range() improved 97% measured over a 2GB memory hot removal
>> in KVM guest.
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
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/mm/mmu.c | 81 +++++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 67 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index a6a00accf4f9..dfb61d218579 100644
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
> 
> I'm not sure about repeating these longish comments a couple of times :)
> 
> For example, I think you can drop the ones regarding the TLB flush
> ("TLB flush is batched in unmap_hotplug_range ...") completely.
> unmap_hotplug_range(), the only caller, is pretty clear about that. And
> anybody reading that code should be able to spot the "!free_mapped" case
> easily.
> 
> Alternatively, just say
> 
> 	/* unmap_hotplug_range() flushes TLB for !free_mapped */

Will replace as suggested.

> 
> "TLB flush is essential for freeing memory." is rather obvious when
> freeing memory, so I would drop that as well.
> 
> Regarding pte_cont(), can we shorten that to
> 
> 	/* CONT blocks in the vmemmap are not supported. */
> 
> Anybody who wants to figure *why* can lookup your patch where you add
> that comment+check.

Sure will drop the comment about CONT mapping TLB flush and mention that
such mappings are not supported for vmemmap.

> 
> 
> I did not check whether people suggested to add these comments in
> previous versions. But to me they don't add a lot of real value that
> couldn't be had from the code already (or common sense: freeing requires
> prior TLB flush).

Dropped all these comments - "TLB flush is essential for freeing memory".

> 
>> +			WARN_ON(pte_cont(pte));
>> +
>> +			/*
>> +			 * TLB flush is essential for freeing memory.
>> +			 */
>> +			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>  			free_hotplug_page_range(pte_page(pte),
>>  						PAGE_SIZE, altmap);
>> +		}
> 
> [...]
> 
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
> 
> Also, here, I don't think the comment really adds value.
> 
> * !free_mapped -> linear mapping, no freeing of memory
> * CONT blocks -> irrelevant, you can batch in either case

Dropped the comment.

> 
>> +	if (!free_mapped)
>> +		flush_tlb_kernel_range(start, end);
>>  }


