Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6642DCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 05:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUsAVJggoi/K3HxTnoVgh3p7dIoAeKpu8pTBQY4Rgn0=; b=l2FI8wP+cv2TU+sKieFXC+Mr0P
	Hg0mcjnwvmRbLIOPKhFF35WncKZD+I/uYX9PryEQ9GKeJi24ukUDPDAnLiutrEiPTg/QYfwQDkR/Q
	WhhSRBtz9VCaA970qd+sw8ikOUiyDOz4Z0sCMs/uZGhHDy5VM69et8cbk3+1Y0iObp8L6G0sgpx0b
	fQKeWyXGY6AaRQCYlvpvOQ38kenna8D/5OY7zQFn/D8ge3UE47taKBZJVMWV7pIiz4vpEG3FdDqNN
	U85F37Efjtr6UZPY32/S4+7R4hlTH1dqnAcaIvhvvksC5nYjcRNEJrTK87Y5hiGVRrM2FM9flRx+3
	/o0biBPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTumw-0000000A8jc-49iA;
	Mon, 01 Jun 2026 05:02:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTumu-0000000A8ix-1c6u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 05:02:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52F1E1E8D;
	Sun, 31 May 2026 22:02:01 -0700 (PDT)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F0283F93E;
	Sun, 31 May 2026 22:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780290126; bh=eLhjNs220y5uHRNrMiXUfKBzDSiUq0OzoNZWUdU02Vw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MTu7+33HfwoK52MCslYpG45Jblw0DwK/LDvbi0t4eOltNGt78kgVEvlJRGfrJBx/W
	 gREOZmYytTMWcgIDztMaljJNvbxuLR+2oyvy65dX1Exw5c7S3L22pTBevM+cEJqcTO
	 c02jMugrIxXuWmnKfxvueYmYWbDyni8NrIDmIew0=
Message-ID: <944a2ca8-c3de-4053-97cc-34e9b4f08b77@arm.com>
Date: Mon, 1 Jun 2026 10:31:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 07/14] arm64/mm: Route all pgtable reads via pxxval_get()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, Usama Arif <usama.arif@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260513044547.4128549-1-anshuman.khandual@arm.com>
 <20260513044547.4128549-8-anshuman.khandual@arm.com>
 <c981c1ba-ab86-4865-b74b-df8d2005507b@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <c981c1ba-ab86-4865-b74b-df8d2005507b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_220208_526165_58493899 
X-CRM114-Status: GOOD (  22.59  )
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



On 27/05/26 7:41 PM, Ryan Roberts wrote:
> On 13/05/2026 05:45, Anshuman Khandual wrote:
>> Define arm64 platform specific implementations for new pXdp_get() helpers.
>> These resolve into READ_ONCE(), thus ensuring required single copy atomic
>> semantics for the page table entry reads.
>>
>> In future this infrastructure can be used for D128 to maintain single copy
>> atomicity semantics with inline asm blocks.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> Changes in RFC V2:
>>
>> - Renamed all ptdesc_ instances as pxxval_ instead
>> - Moved arm64 pgtable header READ_ONCE() replacements here in this patch
>>
>>  arch/arm64/include/asm/pgtable.h | 38 +++++++++++++++++++++++++++-----
>>  1 file changed, 32 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index cefe8ab86acd..72da582e8d12 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -84,6 +84,32 @@ static inline void arch_leave_lazy_mmu_mode(void)
>>  	arch_flush_lazy_mmu_mode();
>>  }
>>  
>> +#define pxxval_get(x)		READ_ONCE(x)
> 
> I think this would be better as an inline (or __force_inline) function, which
> takes a pointer, and dereferences it. READ_ONCE() is special - it's modifying
> how the dereference should be done, so it makes sense that the dereference is
> done in the caller.
> 
>> +
>> +#define pmdp_get pmdp_get
>> +static inline pmd_t pmdp_get(pmd_t *pmdp)
>> +{
>> +	return pxxval_get(*pmdp);
> 
> This is weird to read. It would be clearer as:
> 
> 	return pxxval_get(pmdp);

But being a macro enables pxxval_get() to be used for all page table
levels as the dereference is done in the callers. Otherwise we would
need separate inline functions which take the corresponding pointers
for each pgtable level. Just wondering - would that be any better ?

Although pxxval_get(*pmdp) format does look bit weird to read.
> 
> Thanks,
> Ryan
> 
>> +}
>> +
>> +#define pudp_get pudp_get
>> +static inline pud_t pudp_get(pud_t *pudp)
>> +{
>> +	return pxxval_get(*pudp);
>> +}
>> +
>> +#define p4dp_get p4dp_get
>> +static inline p4d_t p4dp_get(p4d_t *p4dp)
>> +{
>> +	return pxxval_get(*p4dp);
>> +}
>> +
>> +#define pgdp_get pgdp_get
>> +static inline pgd_t pgdp_get(pgd_t *pgdp)
>> +{
>> +	return pxxval_get(*pgdp);
>> +}
>> +
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>  
>> @@ -380,7 +406,7 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
>>  
>>  static inline pte_t __ptep_get(pte_t *ptep)
>>  {
>> -	return READ_ONCE(*ptep);
>> +	return pxxval_get(*ptep);
>>  }
>>  
>>  extern void __sync_icache_dcache(pte_t pteval);
>> @@ -1011,7 +1037,7 @@ static inline phys_addr_t pud_offset_phys(p4d_t *p4dp, unsigned long addr)
>>  {
>>  	BUG_ON(!pgtable_l4_enabled());
>>  
>> -	return p4d_page_paddr(READ_ONCE(*p4dp)) + pud_index(addr) * sizeof(pud_t);
>> +	return p4d_page_paddr(p4dp_get(p4dp)) + pud_index(addr) * sizeof(pud_t);
>>  }
>>  
>>  static inline
>> @@ -1025,7 +1051,7 @@ pud_t *pud_offset_lockless(p4d_t *p4dp, p4d_t p4d, unsigned long addr)
>>  
>>  static inline pud_t *pud_offset(p4d_t *p4dp, unsigned long addr)
>>  {
>> -	return pud_offset_lockless(p4dp, READ_ONCE(*p4dp), addr);
>> +	return pud_offset_lockless(p4dp, p4dp_get(p4dp), addr);
>>  }
>>  #define pud_offset	pud_offset
>>  
>> @@ -1134,7 +1160,7 @@ static inline phys_addr_t p4d_offset_phys(pgd_t *pgdp, unsigned long addr)
>>  {
>>  	BUG_ON(!pgtable_l5_enabled());
>>  
>> -	return pgd_page_paddr(READ_ONCE(*pgdp)) + p4d_index(addr) * sizeof(p4d_t);
>> +	return pgd_page_paddr(pgdp_get(pgdp)) + p4d_index(addr) * sizeof(p4d_t);
>>  }
>>  
>>  static inline
>> @@ -1148,7 +1174,7 @@ p4d_t *p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd, unsigned long addr)
>>  
>>  static inline p4d_t *p4d_offset(pgd_t *pgdp, unsigned long addr)
>>  {
>> -	return p4d_offset_lockless(pgdp, READ_ONCE(*pgdp), addr);
>> +	return p4d_offset_lockless(pgdp, pgdp_get(pgdp), addr);
>>  }
>>  
>>  static inline p4d_t *p4d_set_fixmap(unsigned long addr)
>> @@ -1346,7 +1372,7 @@ static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
>>  		unsigned long address, pmd_t *pmdp)
>>  {
>>  	/* Operation applies to PMD table entry only if FEAT_HAFT is enabled */
>> -	VM_WARN_ON(pmd_table(READ_ONCE(*pmdp)) && !system_supports_haft());
>> +	VM_WARN_ON(pmd_table(pmdp_get(pmdp)) && !system_supports_haft());
>>  	return __ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
>>  }
>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
> 


