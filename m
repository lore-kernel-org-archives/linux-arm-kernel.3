Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B17C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idhr/5aIOoxzWKAydyluIFUs5UlXIHLQFjiaGb9SyTM=; b=GeGa6J3xxOq+j4FsDC5D3Lcs88
	4AE6vCepoWpxui8Zf/xq6gOclZ+qfjwnqv0NTT92gFpS9HL6h5/CsMW8LRUhORWAcQVSeWyJ/zaHu
	gES0awdKleozBbrsmmKOTB8l8HdYarIhOGxY92Kbjgo+M+JNYP8bNQeO4fEykkaBhCcFtE+rZJtyc
	77IiBI5W6tzfbFjCJSUqt7pH2276wyY3HNqTWOYuqPbJ7HPwC3SAqQK02fmM4+G+4wHt7SQSYOgmk
	9snddDLKrKmJnyWB14Xs3T205xkrIGETIenOcU6B+0jNHMmgQIUVP1M7AEI7a+i6CLjNy+WrGxcKY
	rGHi1l2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEhs-00000007rqX-2MhX;
	Wed, 12 Feb 2025 15:31:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEgQ-00000007rMf-1Th3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:29:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89E2112FC;
	Wed, 12 Feb 2025 07:30:10 -0800 (PST)
Received: from [10.57.81.93] (unknown [10.57.81.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED99A3F58B;
	Wed, 12 Feb 2025 07:29:46 -0800 (PST)
Message-ID: <46ca554b-f768-4981-9794-1dbc581a7bdc@arm.com>
Date: Wed, 12 Feb 2025 15:29:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/16] arm64/mm: Refactor __set_ptes() and
 __ptep_get_and_clear()
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
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
 <20250205151003.88959-7-ryan.roberts@arm.com>
 <bdd08da7-d978-437a-849f-8a6115933e19@arm.com>
 <0538d186-470e-4c4d-974c-0d7f2c96e549@arm.com>
 <0492ed88-673a-435b-bc89-5f35637b4be6@arm.com>
In-Reply-To: <0492ed88-673a-435b-bc89-5f35637b4be6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_072950_484782_0C606FF4 
X-CRM114-Status: GOOD (  26.05  )
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

On 07/02/2025 09:38, Ryan Roberts wrote:
> On 06/02/2025 13:26, Ryan Roberts wrote:
>> On 06/02/2025 11:48, Anshuman Khandual wrote:
>>> On 2/5/25 20:39, Ryan Roberts wrote:

[...]

>>>>
>>>> While we are at it, refactor __ptep_get_and_clear() and
>>>> pmdp_huge_get_and_clear() to use a common ___ptep_get_and_clear() which
>>>> also takes a pgsize parameter. This will provide the huge_pte API the
>>>> means to clear ptes corresponding with the way they were set.
>>>
>>> __ptep_get_and_clear() refactoring does not seem to be related to the
>>> previous __set_ptes(). Should they be separated out into two different
>>> patches instead - for better clarity and review ? Both these clean ups
>>> have enough change and can stand own their own.
>>
>> Yeah I think you're probably right... I was being lazy... I'll separate them.

When looking at this again, I've decided not to split the patch. The same
approach is being applied to both helper APIs to produce "anysz" versions that
will be used by the huge_pte helpers. So I think it is reasonable to do all the
conversion in a single patch. It just looks too small and bitty if I split it out.

I'll rework the commit log to give both API equal promiance since it currently
sounds like __ptep_get_and_clear is an after thought.

[...]

>>> s/___set_ptes/___set_pxds ? to be more generic for all levels.
>>
>> So now we are into naming... I agree that in some senses pte feels specific to
>> the last level. But it's long form "page table entry" seems more generic than
>> "pxd" which implies only pmd, pud, p4d and pgd. At least to me...
>>
>> I think we got stuck trying to figure out a clear and short term for "page table
>> entry at any level" in the past. I think ttd was the best we got; Translation
>> Table Descriptor, which is the term the Arm ARM uses. But that opens a can of
>> worms as now we need tdd_t and all the converters pte_tdd(), tdd_pte(),
>> pmd_tdd(), ... and probably a bunch more stuff on top.
>>
>> So personally I prefer to take the coward's way out and just reuse pte.
> 
> How about set_ptes_anylvl() and ptep_get_and_clear_anylvl()? I think this makes
> it explicit and has the benefit of removing the leading underscores. It also
> means we can reuse pte_t and friends, and we can exetend this nomenclature to
> other places in future at the expense of a 7 char suffix ("_anylvl").
> 
> What do you think?

I'm going to call them set_ptes_anysz() and ptep_get_and_clear_anysz(). That's
one char shorter and better reflects that we are passing a size parameter in,
not a level parameter.

Thanks,
Ryan

> 
>>
>>>
>>>>  {
>>>> -	__sync_cache_and_tags(pte, nr);
>>>> -	__check_safe_pte_update(mm, ptep, pte);
>>>> -	__set_pte(ptep, pte);
>>>> +	unsigned long stride = pgsize >> PAGE_SHIFT;
>>>> +
>>>> +	switch (pgsize) {
>>>> +	case PAGE_SIZE:
>>>> +		page_table_check_ptes_set(mm, ptep, pte, nr);
>>>> +		break;
>>>> +	case PMD_SIZE:
>>>> +		page_table_check_pmds_set(mm, (pmd_t *)ptep, pte_pmd(pte), nr);
>>>> +		break;
>>>> +	case PUD_SIZE:
>>>> +		page_table_check_puds_set(mm, (pud_t *)ptep, pte_pud(pte), nr);
>>>> +		break;
>>>
>>> This is where the new page table check APIs get used for batch testing.
>>
>> Yes and I anticipate that the whole switch block should be optimized out when
>> page_table_check is disabled.
>>
>>>
>>>> +	default:
>>>> +		VM_WARN_ON(1);
>>>> +	}
>>>> +
>>>> +	__sync_cache_and_tags(pte, nr * stride);
>>>> +
>>>> +	for (;;) {
>>>> +		__check_safe_pte_update(mm, ptep, pte);
>>>> +		__set_pte(ptep, pte);
>>>> +		if (--nr == 0)
>>>> +			break;
>>>> +		ptep++;
>>>> +		pte = pte_advance_pfn(pte, stride);
>>>> +	}
>>>>  }
>>>
>>> LGTM
>>>
>>>>  
>>>> -static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>>>> -			      pmd_t *pmdp, pmd_t pmd)
>>>> +static inline void __set_ptes(struct mm_struct *mm,
>>>> +			      unsigned long __always_unused addr,
>>>> +			      pte_t *ptep, pte_t pte, unsigned int nr)
>>>>  {
>>>> -	page_table_check_pmd_set(mm, pmdp, pmd);
>>>> -	return __set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd),
>>>> -						PMD_SIZE >> PAGE_SHIFT);
>>>> +	___set_ptes(mm, ptep, pte, nr, PAGE_SIZE);
>>>>  }
>>>>  
>>>> -static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
>>>> -			      pud_t *pudp, pud_t pud)
>>>> +static inline void __set_pmds(struct mm_struct *mm,
>>>> +			      unsigned long __always_unused addr,
>>>> +			      pmd_t *pmdp, pmd_t pmd, unsigned int nr)
>>>> +{
>>>> +	___set_ptes(mm, (pte_t *)pmdp, pmd_pte(pmd), nr, PMD_SIZE);
>>>> +}
>>>> +#define set_pmd_at(mm, addr, pmdp, pmd) __set_pmds(mm, addr, pmdp, pmd, 1)
>>>> +
>>>> +static inline void __set_puds(struct mm_struct *mm,
>>>> +			      unsigned long __always_unused addr,
>>>> +			      pud_t *pudp, pud_t pud, unsigned int nr)
>>>>  {
>>>> -	page_table_check_pud_set(mm, pudp, pud);
>>>> -	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud),
>>>> -						PUD_SIZE >> PAGE_SHIFT);
>>>> +	___set_ptes(mm, (pte_t *)pudp, pud_pte(pud), nr, PUD_SIZE);
>>>>  }
>>>> +#define set_pud_at(mm, addr, pudp, pud) __set_puds(mm, addr, pudp, pud, 1)
>>>
>>> LGTM
>>>
>>>>  
>>>>  #define __p4d_to_phys(p4d)	__pte_to_phys(p4d_pte(p4d))
>>>>  #define __phys_to_p4d_val(phys)	__phys_to_pte_val(phys)
>>>> @@ -1276,16 +1288,34 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
>>>>  }
>>>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
>>>>  
>>>> -static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
>>>> -				       unsigned long address, pte_t *ptep)
>>>> +static inline pte_t ___ptep_get_and_clear(struct mm_struct *mm, pte_t *ptep,
>>>> +				       unsigned long pgsize)
>>>
>>> So address got dropped and page size got added as an argument.
>>>
>>>>  {
>>>>  	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
>>>>  
>>>> -	page_table_check_pte_clear(mm, pte);
>>>> +	switch (pgsize) {
>>>> +	case PAGE_SIZE:
>>>> +		page_table_check_pte_clear(mm, pte);
>>>> +		break;
>>>> +	case PMD_SIZE:
>>>> +		page_table_check_pmd_clear(mm, pte_pmd(pte));
>>>> +		break;
>>>> +	case PUD_SIZE:
>>>> +		page_table_check_pud_clear(mm, pte_pud(pte));
>>>> +		break;
>>>> +	default:
>>>> +		VM_WARN_ON(1);
>>>> +	}
>>>>  
>>>>  	return pte;
>>>>  }
>>>>  
>>>> +static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
>>>> +				       unsigned long address, pte_t *ptep)
>>>> +{
>>>> +	return ___ptep_get_and_clear(mm, ptep, PAGE_SIZE);
>>>> +}
>>>> +
>>>>  static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>>>>  				pte_t *ptep, unsigned int nr, int full)
>>>>  {
>>>> @@ -1322,11 +1352,7 @@ static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
>>>>  static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>>>>  					    unsigned long address, pmd_t *pmdp)
>>>>  {
>>>> -	pmd_t pmd = __pmd(xchg_relaxed(&pmd_val(*pmdp), 0));
>>>> -
>>>> -	page_table_check_pmd_clear(mm, pmd);
>>>> -
>>>> -	return pmd;
>>>> +	return pte_pmd(___ptep_get_and_clear(mm, (pte_t *)pmdp, PMD_SIZE));
>>>>  }
>>>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>>>  
>>>
>>> Although currently there is no pudp_huge_get_and_clear() helper on arm64
>>> reworked ___ptep_get_and_clear() will be able to support that as well if
>>> and when required as it now supports PUD_SIZE page size.
>>
>> yep.
>>
>> Thanks for all your review so far!
>>
> 


