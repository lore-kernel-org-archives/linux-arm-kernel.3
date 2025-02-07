Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D354FC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 11:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygkGGNrxbK5UAhgNlSRwbcjrO+ZHQ46zbepkL/0I/6Y=; b=U6egFRM/S9zpuIy8CvRCfM0yZ5
	AoxRJnOllpfjshVbwSG6dQifi1zS1Hmd4/JacgqLiu0MLLHyBqJ1V6pThXmNqQ6mzjnop7tbjxbUl
	Ds2RGbE/aoc0AUdTHfZK0M0/uuWHNU/faWiFVm8tKrcoasIhfPzLoavrClJctr7WAXN9ZgZwKFQSC
	cr1D0amujbd/JDGdeOQK5D1ytpxbuMKws+PafzOIExh/rEf9dGlFk+XrCfJ+RODJ+r8jsUoz8wKaJ
	zol5a3oFhov8ehjBb2Ma5LEVRdveFRABksB8xwnNb+lpMmM/uVkHVEPS+pIAIOcRCfC4PT/i55Csw
	pG2F+TLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMQw-00000009Ku0-2S7P;
	Fri, 07 Feb 2025 11:22:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgMPY-00000009Kgs-0jzZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 11:20:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31571113E;
	Fri,  7 Feb 2025 03:21:02 -0800 (PST)
Received: from [10.57.81.111] (unknown [10.57.81.111])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51F5E3F63F;
	Fri,  7 Feb 2025 03:20:36 -0800 (PST)
Message-ID: <21da59a8-165d-4423-a00d-d5859f42ec11@arm.com>
Date: Fri, 7 Feb 2025 11:20:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/16] arm64/mm: Support huge pte-mapped pages in vmap
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-13-ryan.roberts@arm.com>
 <9a0d3009-18fc-4b53-941a-b6d830fce36a@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <9a0d3009-18fc-4b53-941a-b6d830fce36a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_032040_312504_7A0A8AB6 
X-CRM114-Status: GOOD (  25.20  )
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

On 07/02/2025 10:04, Anshuman Khandual wrote:
> 
> 
> On 2/5/25 20:39, Ryan Roberts wrote:
>> Implement the required arch functions to enable use of contpte in the
>> vmap when VM_ALLOW_HUGE_VMAP is specified. This speeds up vmap
>> operations due to only having to issue a DSB and ISB per contpte block
>> instead of per pte. But it also means that the TLB pressure reduces due
>> to only needing a single TLB entry for the whole contpte block.
> 
> Right.
> 
>>
>> Since vmap uses set_huge_pte_at() to set the contpte, that API is now
>> used for kernel mappings for the first time. Although in the vmap case
>> we never expect it to be called to modify a valid mapping so
>> clear_flush() should never be called, it's still wise to make it robust
>> for the kernel case, so amend the tlb flush function if the mm is for
>> kernel space.
> 
> Makes sense.
> 
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
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/vmalloc.h | 40 ++++++++++++++++++++++++++++++++
>>  arch/arm64/mm/hugetlbpage.c      |  5 +++-
>>  2 files changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>> index 38fafffe699f..fbdeb40f3857 100644
>> --- a/arch/arm64/include/asm/vmalloc.h
>> +++ b/arch/arm64/include/asm/vmalloc.h
>> @@ -23,6 +23,46 @@ static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>  	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>  }
>>  
>> +#define arch_vmap_pte_range_map_size arch_vmap_pte_range_map_size
>> +static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
>> +						unsigned long end, u64 pfn,
>> +						unsigned int max_page_shift)
>> +{
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
> 
> A small nit:
> 
> Should the rationale behind picking CONT_PTE_SIZE be added here as an in code
> comment or something in the function - just to make things bit clear.

I'm not sure what other size we would pick?

> 
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
> 
> I guess it is safe to query the CONT_PTE from the mapped entry itself.

Yes I don't see why not. Is there some specific aspect you're concerned about?

> 
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
>> index 02afee31444e..a74e43101dad 100644
>> --- a/arch/arm64/mm/hugetlbpage.c
>> +++ b/arch/arm64/mm/hugetlbpage.c
>> @@ -217,7 +217,10 @@ static void clear_flush(struct mm_struct *mm,
>>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
>>  		___ptep_get_and_clear(mm, ptep, pgsize);
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
> Otherwise LGTM.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Thanks!


