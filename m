Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96C6C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQubO7qJO8mtxAZllvRBNDXcjV0ldAevPY1qvOooHQM=; b=jGwtvyAt8hcZ4elALWa0RUgZio
	l8YODOjm7So5mzQJhFxv5rG8NlJzvyv3aA55eNRqzulBFmwMAiFVg1sWOZUqWqDoUXD8NmYyEvmzK
	wkQRt+HVtkLE3K4XctrojLUF4psuHSPTOBF5+6X8L1fLh7FFZbJDeUtasJDPUl9KDjrqNgfHKHk5B
	7r2cCJAQmDFj/KbxoicVnupDoMYXRKZZkVbERizC0pFO6SpL2G9swRGUdfvfpowfMYK2KjphkJ5SK
	PoaOrQa2Y7EBXfQmr1nOvOaaONwHB09VTjmKHCDk7EfcGqaUYrb1KQsgGN2kJZH7xux0VqK5iiir5
	jT1z3/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZM-00000000Zwy-2k7H;
	Tue, 25 Feb 2025 17:18:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyFk-00000000UkU-1D2H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:57:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC69C1BCB;
	Tue, 25 Feb 2025 08:58:07 -0800 (PST)
Received: from [10.1.27.154] (XHFQ2J9959.cambridge.arm.com [10.1.27.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F24403F5A1;
	Tue, 25 Feb 2025 08:57:48 -0800 (PST)
Message-ID: <601fa2ab-aa75-4a34-8754-65c1d0b9a8c7@arm.com>
Date: Tue, 25 Feb 2025 16:57:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] arm64/mm: Support huge pte-mapped pages in vmap
Content-Language: en-GB
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250217140809.1702789-1-ryan.roberts@arm.com>
 <20250217140809.1702789-11-ryan.roberts@arm.com> <Z7xgKjhMZAY5mOwK@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z7xgKjhMZAY5mOwK@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_085752_418102_78C29E8B 
X-CRM114-Status: GOOD (  30.66  )
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

On 24/02/2025 12:03, Catalin Marinas wrote:
> On Mon, Feb 17, 2025 at 02:08:02PM +0000, Ryan Roberts wrote:
>> Implement the required arch functions to enable use of contpte in the
>> vmap when VM_ALLOW_HUGE_VMAP is specified. This speeds up vmap
>> operations due to only having to issue a DSB and ISB per contpte block
>> instead of per pte.
> 
> For non-cont PTEs, do you happen to know how often vmap_pte_range() is
> called for multiple entries? 

It's mostly when vmalloc_huge() is called and for remapping io regions I
believe. I don't have numbers though.

> It might be worth changing that to use
> set_ptes() directly and we get some benefit as well.

I thought about that, but it's a bit of a pain, given the current
arch_vmap_pte_range_map_size() opt-in for set_huge_pte_at().

Ideally I think we would just set_ptes() the whole lot (or at least in chunks of
max_page_shift so we honour the "must belong to same folio" requirement). Then
let contpte decide when to use contiguous mappings. But we currently block
contpte operations for kernel mappings because of the potential need to
invalidate, which can cause faults. So that would need work. And we would need
to rework powerpc somehow.

The alternative would be to keep the arch_vmap_pte_range_map_size() opt-in and
somehow expose the alignment/size requirements to vmap_pte_range() so it can do
set_ptes() in the gaps. But that all felt quite messy.

In the end, I decided we would be getting the benefits via arch_make_huge_pte()
for >=64K folios, and decided not to worry about the <=3K folio cases.

> 
>> But it also means that the TLB pressure reduces due
>> to only needing a single TLB entry for the whole contpte block.
>>
>> Since vmap uses set_huge_pte_at() to set the contpte, that API is now
>> used for kernel mappings for the first time. Although in the vmap case
>> we never expect it to be called to modify a valid mapping so
>> clear_flush() should never be called, it's still wise to make it robust
>> for the kernel case, so amend the tlb flush function if the mm is for
>> kernel space.
>>
>> Tested with vmalloc performance selftests:
>>
>>   # kself/mm/test_vmalloc.sh \
>> 	run_test_mask=1
>> 	test_repeat_count=5
>> 	nr_pages=256
>> 	test_loop_count=100000
>> 	use_huge=1
>>
>> Duration reduced from 1274243 usec to 1083553 usec on Apple M2 for 15%
>> reduction in time taken.
>>
>> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/vmalloc.h | 46 ++++++++++++++++++++++++++++++++
>>  arch/arm64/mm/hugetlbpage.c      |  5 +++-
>>  2 files changed, 50 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>> index 38fafffe699f..40ebc664190b 100644
>> --- a/arch/arm64/include/asm/vmalloc.h
>> +++ b/arch/arm64/include/asm/vmalloc.h
>> @@ -23,6 +23,52 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>  	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>  }
>>  
>> +#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
>> +static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>> +						unsigned long end, u64 pfn,
>> +						unsigned int max_page_shift)
>> +{
>> +	/*
>> +	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
>> +	 * aligned in both virtual and physical space, then we can pte-map the
>> +	 * block using the PTE_CONT bit for more efficient use of the TLB.
>> +	 */
>> +
> 
> Nit: unnecessary empty line.

Will fix.

> 
>> +	if (max_page_shift < CONT_PTE_SHIFT)
>> +		return PAGE_SIZE;
>> +
>> +	if (end - addr < CONT_PTE_SIZE)
>> +		return PAGE_SIZE;
>> +
>> +	if (!IS_ALIGNED(addr, CONT_PTE_SIZE))
>> +		return PAGE_SIZE;
>> +
>> +	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
>> +		return PAGE_SIZE;
>> +
>> +	return CONT_PTE_SIZE;
>> +}
>> +
>> +#define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
>> +static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long addr,
>> +							   pte_t *ptep)
>> +{
>> +	/*
>> +	 * The caller handles alignment so it's sufficient just to check
>> +	 * PTE_CONT.
>> +	 */
>> +	return pte_valid_cont(__ptep_get(ptep)) ? CONT_PTE_SIZE : PAGE_SIZE;
>> +}
>> +
>> +#define arch_vmap_pte_supported_shift arch_vmap_pte_supported_shift
>> +static inline int arch_vmap_pte_supported_shift(unsigned long size)
>> +{
>> +	if (size >= CONT_PTE_SIZE)
>> +		return CONT_PTE_SHIFT;
>> +
>> +	return PAGE_SHIFT;
>> +}
>> +
>>  #endif
>>  
>>  #define arch_vmap_pgprot_tagged arch_vmap_pgprot_tagged
>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>> index 8ac86cd180b3..a29f347fea54 100644
>> --- a/arch/arm64/mm/hugetlbpage.c
>> +++ b/arch/arm64/mm/hugetlbpage.c
>> @@ -217,7 +217,10 @@ static void clear_flush(struct mm_struct *mm,
>>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>>  		ptep_get_and_clear_anysz(mm, ptep, pgsize);
>>  
>> -	__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
>> +	if (mm == &init_mm)
>> +		flush_tlb_kernel_range(saddr, addr);
>> +	else
>> +		__flush_hugetlb_tlb_range(&vma, saddr, addr, pgsize, true);
>>  }
>>  
>>  void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>


