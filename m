Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7FEC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXM4YCHeVF6IO/h6K9bOJdaDGWehlVoKSmej3MF0UUw=; b=YLpL3CjY9rbEs93Uh4br8ty1dx
	dCaY6qnYV0mr670yO1zTDGkx68j5+VVu+oq0hBOn/x8hvRbS4hiyiYq9s0nV6FY6A5h+BjBWbV8D8
	XetR+WFBto9Gx+uEAgP+rgcd9R+Jv32/r8xvAg9vM+ODC02MBQPDMGrKtdyr25ayY1Bmm6WWIeTG+
	BFyX+TbA69xLn6gEt7knYHFwfjcyaKAizuyurXoS5IcWVU/9A8+8q8b1dpAhcAYJKokAf4/cUuFD8
	d/Q/XzHkDiv0UnZq3iklb7tHLs1sr00+YXk1rhCWBuu475IEiRcDUiMCnPTAeghLjQtCm93r/ZBxD
	9WdXxvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFiZ-000000086up-40OB;
	Wed, 12 Feb 2025 16:36:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFA6-00000007yXX-2SRw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:00:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A89BF12FC;
	Wed, 12 Feb 2025 08:00:50 -0800 (PST)
Received: from [10.57.81.93] (unknown [10.57.81.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12BD23F6A8;
	Wed, 12 Feb 2025 08:00:26 -0800 (PST)
Message-ID: <6b3ad437-04df-41c6-81f4-c0fec5a099ec@arm.com>
Date: Wed, 12 Feb 2025 16:00:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/16] arm64/mm: Hoist barriers out of ___set_ptes()
 loop
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
 <20250205151003.88959-9-ryan.roberts@arm.com>
 <858ecac5-9ba7-48da-8f34-ffda28d17609@arm.com>
 <e0400886-d4bc-40f5-8375-fc3d515fd386@arm.com>
In-Reply-To: <e0400886-d4bc-40f5-8375-fc3d515fd386@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_080030_743431_4CFE2F6F 
X-CRM114-Status: GOOD (  35.16  )
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

On 07/02/2025 10:38, Ryan Roberts wrote:
> On 07/02/2025 05:35, Anshuman Khandual wrote:
>>
>>
>> On 2/5/25 20:39, Ryan Roberts wrote:
>>> ___set_ptes() previously called __set_pte() for each PTE in the range,
>>> which would conditionally issue a DSB and ISB to make the new PTE value
>>> immediately visible to the table walker if the new PTE was valid and for
>>> kernel space.
>>>
>>> We can do better than this; let's hoist those barriers out of the loop
>>> so that they are only issued once at the end of the loop. We then reduce
>>> the cost by the number of PTEs in the range.
>>>
>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>> ---
>>>  arch/arm64/include/asm/pgtable.h | 14 ++++++++++----
>>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>> index 3b55d9a15f05..1d428e9c0e5a 100644
>>> --- a/arch/arm64/include/asm/pgtable.h
>>> +++ b/arch/arm64/include/asm/pgtable.h
>>> @@ -317,10 +317,8 @@ static inline void __set_pte_nosync(pte_t *ptep, pte_t pte)
>>>  	WRITE_ONCE(*ptep, pte);
>>>  }
>>>  
>>> -static inline void __set_pte(pte_t *ptep, pte_t pte)
>>> +static inline void __set_pte_complete(pte_t pte)
>>>  {
>>> -	__set_pte_nosync(ptep, pte);
>>> -
>>>  	/*
>>>  	 * Only if the new pte is valid and kernel, otherwise TLB maintenance
>>>  	 * or update_mmu_cache() have the necessary barriers.
>>> @@ -331,6 +329,12 @@ static inline void __set_pte(pte_t *ptep, pte_t pte)
>>>  	}
>>>  }
>>>  
>>> +static inline void __set_pte(pte_t *ptep, pte_t pte)
>>> +{
>>> +	__set_pte_nosync(ptep, pte);
>>> +	__set_pte_complete(pte);
>>> +}
>>> +
>>>  static inline pte_t __ptep_get(pte_t *ptep)
>>>  {
>>>  	return READ_ONCE(*ptep);
>>> @@ -647,12 +651,14 @@ static inline void ___set_ptes(struct mm_struct *mm, pte_t *ptep, pte_t pte,
>>>  
>>>  	for (;;) {
>>>  		__check_safe_pte_update(mm, ptep, pte);
>>> -		__set_pte(ptep, pte);
>>> +		__set_pte_nosync(ptep, pte);
>>>  		if (--nr == 0)
>>>  			break;
>>>  		ptep++;
>>>  		pte = pte_advance_pfn(pte, stride);
>>>  	}
>>> +
>>> +	__set_pte_complete(pte);
>>
>> Given that the loop now iterates over number of page table entries without corresponding
>> consecutive dsb/isb sync, could there be a situation where something else gets scheduled
>> on the cpu before __set_pte_complete() is called ? Hence leaving the entire page table
>> entries block without desired mapping effect. IOW how __set_pte_complete() is ensured to
>> execute once the loop above completes. Otherwise this change LGTM.
> 
> I don't think this changes the model. Previously, __set_pte() was called, which
> writes the pte to the pgtable, then issues the barriers. So there is still a
> window where the thread could be unscheduled after the write but before the
> barriers. Yes, my change makese that window bigger, but if it is a bug now, it
> was a bug before.
> 
> Additionally, the spec for set_ptes() is:
> 
> /**
>  * set_ptes - Map consecutive pages to a contiguous range of addresses.
>  * @mm: Address space to map the pages into.
>  * @addr: Address to map the first page at.
>  * @ptep: Page table pointer for the first entry.
>  * @pte: Page table entry for the first page.
>  * @nr: Number of pages to map.
>  *
>  * When nr==1, initial state of pte may be present or not present, and new state
>  * may be present or not present. When nr>1, initial state of all ptes must be
>  * not present, and new state must be present.
>  *
>  * May be overridden by the architecture, or the architecture can define
>  * set_pte() and PFN_PTE_SHIFT.
>  *
>  * Context: The caller holds the page table lock.  The pages all belong
>  * to the same folio.  The PTEs are all in the same PMD.
>  */
> 
> Note that the caller is required to hold the page table lock. That's a spin lock
> so should be non-preemptible at this point (perhaps not for RT?)
> 
> Although actually, vmalloc doesn't hold a lock when calling these helpers; it
> has a lock when allocating the VA space, then drops it.
> 
> So yes, I think there is a chance of preemption after writing the pgtable entry
> but before issuing the barriers.
> 
> But in that case, we get saved by the DSB in the context switch path. There is
> no guarrantee of an ISB in that path (AFAIU). But the need for an ISB is a bit
> whooly anyway. My rough understanding is that the ISB is there to prevent
> previous speculation from determining that a given translation was invalid and
> "caching" that determination in the pipeline. That could still (theoretically)
> happen on remote CPUs I think, and we have the spurious fault handler to detect
> that. Anyway, once you context switch, the local CPU becomes remote and we don't
> have the ISB there, so what's the difference... There's a high chance I've
> misunderstood a bunch of this.

I thought about this some more; The ISB is there to ensure that the "speculative
invalid translation marker" cached in the pipeline gets removed prior to any
code that runs after set_ptes() returns which accesses an address now mapped by
the pte that was set. Even if preemption occurs, the ISB will still execute when
the thread runs again, before the return from set_ptes(). So all is well.

> 
> 
> In conclusion, I don't think I've made things any worse.
> 
> Thanks,
> Ryan
> 
>>
>>>  }
>>>  
>>>  static inline void __set_ptes(struct mm_struct *mm,
> 


