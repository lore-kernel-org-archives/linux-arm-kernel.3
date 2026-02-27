Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556BEFD9E3E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fy8I4DfvDIaiPhoKT5gdF9vbgVJgKjiNms1TxDu+mH4=; b=KEM8vWoTWqGatDjXg9nr7riAX2
	ybzspIHdgpJ/ExFG2I/1lmsXeaImSjCRqwcPyfwVa+SjSQhM4LqqLESv9KVejaPajWLLvRoveGkEW
	hWWNpHGJ9uQWB3y/H+Aau+ei9To6DHL+7qEO2nxEdCouecwhhx1oODqH8pRNQ8Ne+zqV6zuvD5Eif
	a8nAtQ1RTLI3vdTMJ1YW6JOsL8++3fY7qNMjg4AAaBevUleP2JpmzXzQ62u/w2dvObojEjL1R2VUS
	z5l1QeX9wEvqjSFmrm7FebWZCKUR6FVJCY2oXkCkuL7vAoJWyQuc+MmUYB90gFYn5FQr64vBKzlLb
	rQEZuUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrC6-00000007lVc-177C;
	Fri, 27 Feb 2026 06:19:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrC2-00000007lVG-20ah
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:19:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9450214BF;
	Thu, 26 Feb 2026 22:19:09 -0800 (PST)
Received: from [10.164.18.47] (unknown [10.164.18.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 446B43F7BD;
	Thu, 26 Feb 2026 22:19:12 -0800 (PST)
Message-ID: <7f59b3ea-9346-46eb-b6c1-ae27b718f7e6@arm.com>
Date: Fri, 27 Feb 2026 11:49:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 10/16] arm64/mm: Route all pgtable writes via
 ptdesc_set()
To: Ryan Roberts <ryan.roberts@arm.com>, Usama Arif <usama.arif@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260226123747.801496-1-usama.arif@linux.dev>
 <0ee7ff56-ac0c-458e-9772-b3c026389e65@arm.com>
 <917f3bc3-1f17-4712-836d-ac75fdef3d16@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <917f3bc3-1f17-4712-836d-ac75fdef3d16@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_221918_607434_06B97DB8 
X-CRM114-Status: GOOD (  19.10  )
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



On 26/02/26 6:49 PM, Ryan Roberts wrote:
> On 26/02/2026 12:54, Anshuman Khandual wrote:
>>
>>
>> On 26/02/26 6:07 PM, Usama Arif wrote:
>>> On Tue, 24 Feb 2026 10:41:47 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>>
>>>> Currently ptdesc_set() is defined as WRITE_ONCE() but this will change for
>>>> D128 pgtable builds, for which WRITE_ONCE() is not sufficient for single
>>>> copy atomicity.
>>>>
>>>> In future this infrastructure can be used for D128 to maintain single copy
>>>> atomicity semantics with inline asm blocks.
>>>>
>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>> Cc: Will Deacon <will@kernel.org>
>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>> ---
>>>>  arch/arm64/include/asm/pgtable.h | 11 ++++++-----
>>>>  arch/arm64/mm/mmu.c              |  4 ++--
>>>>  mm/debug_vm_pgtable.c            |  4 ++--
>>>>  3 files changed, 10 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>>> index 804ef49aea88..42124d2f323d 100644
>>>> --- a/arch/arm64/include/asm/pgtable.h
>>>> +++ b/arch/arm64/include/asm/pgtable.h
>>>> @@ -85,6 +85,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
>>>>  }
>>>>  
>>>>  #define ptdesc_get(x)		READ_ONCE(x)
>>>> +#define ptdesc_set(x, val)	WRITE_ONCE(x, val)
>>>>  
>>>>  #define pmdp_get pmdp_get
>>>>  static inline pmd_t pmdp_get(pmd_t *pmdp)
>>>> @@ -389,7 +390,7 @@ static inline pte_t pte_clear_uffd_wp(pte_t pte)
>>>>  
>>>>  static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>>>>  {
>>>> -	WRITE_ONCE(*ptep, pte);
>>>> +	ptdesc_set(*ptep, pte);
>>>>  }
>>>>  
>>>>  static inline void __set_pte_complete(pte_t pte)
>>>> @@ -856,7 +857,7 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>>>>  	}
>>>>  #endif /* __PAGETABLE_PMD_FOLDED */
>>>>  
>>>> -	WRITE_ONCE(*pmdp, pmd);
>>>> +	ptdesc_set(*pmdp, pmd);
>>>>  
>>>>  	if (pmd_valid(pmd))
>>>>  		queue_pte_barriers();
>>>> @@ -917,7 +918,7 @@ static inline void set_pud(pud_t *pudp, pud_t pud)
>>>>  		return;
>>>>  	}
>>>>  
>>>> -	WRITE_ONCE(*pudp, pud);
>>>> +	ptdesc_set(*pudp, pud);
>>>>  
>>>>  	if (pud_valid(pud))
>>>>  		queue_pte_barriers();
>>>> @@ -999,7 +1000,7 @@ static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
>>>>  		return;
>>>>  	}
>>>>  
>>>> -	WRITE_ONCE(*p4dp, p4d);
>>>> +	ptdesc_set(*p4dp, p4d);
>>>>  	queue_pte_barriers();
>>>>  }
>>>>  
>>>> @@ -1120,7 +1121,7 @@ static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
>>>>  		return;
>>>>  	}
>>>>  
>>>> -	WRITE_ONCE(*pgdp, pgd);
>>>> +	ptdesc_set(*pgdp, pgd);
>>>>  	queue_pte_barriers();
>>>>  }
>>>>  
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index bcf32d1a92de..ffd307c546f5 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -83,7 +83,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
>>>>  	 * writable in the kernel mapping.
>>>>  	 */
>>>>  	if (rodata_is_rw) {
>>>> -		WRITE_ONCE(*pgdp, pgd);
>>>> +		ptdesc_set(*pgdp, pgd);
>>>>  		dsb(ishst);
>>>>  		isb();
>>>>  		return;
>>>> @@ -91,7 +91,7 @@ void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
>>>>  
>>>>  	spin_lock(&swapper_pgdir_lock);
>>>>  	fixmap_pgdp = pgd_set_fixmap(__pa_symbol(pgdp));
>>>> -	WRITE_ONCE(*fixmap_pgdp, pgd);
>>>> +	ptdesc_set(*fixmap_pgdp, pgd);
>>>>  	/*
>>>>  	 * We need dsb(ishst) here to ensure the page-table-walker sees
>>>>  	 * our new entry before set_p?d() returns. The fixmap's
>>>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>>>> index 83cf07269f13..faf6a19a89a1 100644
>>>> --- a/mm/debug_vm_pgtable.c
>>>> +++ b/mm/debug_vm_pgtable.c
>>>> @@ -445,7 +445,7 @@ static void __init pmd_huge_tests(struct pgtable_debug_args *args)
>>>>  	 * X86 defined pmd_set_huge() verifies that the given
>>>>  	 * PMD is not a populated non-leaf entry.
>>>>  	 */
>>>> -	WRITE_ONCE(*args->pmdp, __pmd(0));
>>>> +	ptdesc_set(*args->pmdp, __pmd(0));
>>>
>>> The ptdesc_set() and ptdesc_get() macros are defined in
>>> arch/arm64/include/asm/pgtable.h and are arm64-specific. This change is
>>> in mm/debug_vm_pgtable.c which is generic code compiled for all
>>> architectures. Other architectures do not define ptdesc_set(), so this
>>> will would cause a build failure on other architectures..
>>
>> Agreed. Probably will add a local fallback for ptdesc_set() which
>> defaults to WRITE_ONCE() for platforms not overriding. OR does it
>> require making ptdesc_get/set() much more generic construct ?
>>
>> Probably missed this problem while building on some other platforms
>> as DEBUG_VM_PGTABLE might not have been enabled in their defconfig.
> 
> I don't think there is any need for WRITE_ONCE() in this file? (and I feel like
> this has come up before in some other context). Could you just change it to a
> plain C assignment? Or even better, pmd_clear()?

Agreed and just sent a patch in this regard.

https://lore.kernel.org/all/20260227061204.2215395-1-anshuman.khandual@arm.com/

> 
>>
>>>
>>>>  	WARN_ON(!pmd_set_huge(args->pmdp, __pfn_to_phys(args->fixed_pmd_pfn), args->page_prot));
>>>>  	WARN_ON(!pmd_clear_huge(args->pmdp));
>>>>  	pmd = pmdp_get(args->pmdp);
>>>> @@ -465,7 +465,7 @@ static void __init pud_huge_tests(struct pgtable_debug_args *args)
>>>>  	 * X86 defined pud_set_huge() verifies that the given
>>>>  	 * PUD is not a populated non-leaf entry.
>>>>  	 */
>>>> -	WRITE_ONCE(*args->pudp, __pud(0));
>>>> +	ptdesc_set(*args->pudp, __pud(0));
>>>>  	WARN_ON(!pud_set_huge(args->pudp, __pfn_to_phys(args->fixed_pud_pfn), args->page_prot));
>>>>  	WARN_ON(!pud_clear_huge(args->pudp));
>>>>  	pud = pudp_get(args->pudp);
>>>> -- 
>>>> 2.43.0
>>>>
>>>>
>>>
>>
> 
> 


