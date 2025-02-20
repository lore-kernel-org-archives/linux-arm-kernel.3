Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C4BC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqNo4SrFn9ynC9BSNBrIXJUI8BYB8iCtLJNIO8yBn9M=; b=oWRL9dkXKaOOSDaW+0Eyrxn6CY
	DqeqXydPij+A4pR5DL1iouZgAg3m3qc4xU5M5il/CkJb8cC5wa278wVWlTlsFj8m+0/YEYcJ5eIY2
	k0aBfiYXnW2+6lpMKfTWqCoONiehaXxPnKf5yMFIxwTig3PsQd9pH+3WODnUmjkd3qqbGhaPCvHC/
	l2YIm4Pu0X9jYnqwe/3HuQIWCvFSyrD7VGLxSHRgEZ9DarDwkcT0I1OV3Nv77oLLeqyksEoVFfISS
	ZbmRm0ZFxeKdXiMLkqW19wA0gg8eNeaIhyYM84RLXb7OFsX0MD5jI9sl+Km4c0mW93vgdMNwYdeJu
	a1OOv9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0Db-0000000GyVd-18UW;
	Thu, 20 Feb 2025 06:39:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0C7-0000000GyCV-0M8c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 06:38:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 020DE2A2A;
	Wed, 19 Feb 2025 22:38:16 -0800 (PST)
Received: from [10.163.38.27] (unknown [10.163.38.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BF183F5A1;
	Wed, 19 Feb 2025 22:37:39 -0800 (PST)
Message-ID: <50f48574-241d-42d8-b811-3e422c41e21a@arm.com>
Date: Thu, 20 Feb 2025 12:07:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: hugetlb: Fix huge_ptep_get_and_clear() for
 non-present ptes
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
 Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Dev Jain <dev.jain@arm.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-3-ryan.roberts@arm.com>
 <e26a59a1-ff9a-49c7-b10a-c3f5c096a2c4@arm.com>
 <5477d161-12e7-4475-a6e9-ff3921989673@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <5477d161-12e7-4475-a6e9-ff3921989673@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_223759_219142_3D7B8308 
X-CRM114-Status: GOOD (  38.71  )
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

On 2/19/25 14:28, Ryan Roberts wrote:
> On 19/02/2025 08:45, Anshuman Khandual wrote:
>>
>>
>> On 2/17/25 19:34, Ryan Roberts wrote:
>>> arm64 supports multiple huge_pte sizes. Some of the sizes are covered by
>>> a single pte entry at a particular level (PMD_SIZE, PUD_SIZE), and some
>>> are covered by multiple ptes at a particular level (CONT_PTE_SIZE,
>>> CONT_PMD_SIZE). So the function has to figure out the size from the
>>> huge_pte pointer. This was previously done by walking the pgtable to
>>> determine the level and by using the PTE_CONT bit to determine the
>>> number of ptes at the level.
>>>
>>> But the PTE_CONT bit is only valid when the pte is present. For
>>> non-present pte values (e.g. markers, migration entries), the previous
>>> implementation was therefore erroniously determining the size. There is

typo - s/erroniously/erroneously   ^^^^^^

>>> at least one known caller in core-mm, move_huge_pte(), which may call
>>> huge_ptep_get_and_clear() for a non-present pte. So we must be robust to
>>> this case. Additionally the "regular" ptep_get_and_clear() is robust to
>>> being called for non-present ptes so it makes sense to follow the
>>> behaviour.
>>>
>>> Fix this by using the new sz parameter which is now provided to the
>>> function. Additionally when clearing each pte in a contig range, don't
>>> gather the access and dirty bits if the pte is not present.
>>>
>>> An alternative approach that would not require API changes would be to
>>> store the PTE_CONT bit in a spare bit in the swap entry pte for the
>>> non-present case. But it felt cleaner to follow other APIs' lead and
>>> just pass in the size.
>>>
>>> As an aside, PTE_CONT is bit 52, which corresponds to bit 40 in the swap
>>> entry offset field (layout of non-present pte). Since hugetlb is never
>>> swapped to disk, this field will only be populated for markers, which
>>> always set this bit to 0 and hwpoison swap entries, which set the offset
>>> field to a PFN; So it would only ever be 1 for a 52-bit PVA system where
>>> memory in that high half was poisoned (I think!). So in practice, this
>>> bit would almost always be zero for non-present ptes and we would only
>>> clear the first entry if it was actually a contiguous block. That's
>>> probably a less severe symptom than if it was always interpretted as 1

typo - s/interpretted/interpreted			    ^^^^^^


>>> and cleared out potentially-present neighboring PTEs.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
>>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>>> ---
>>>  arch/arm64/mm/hugetlbpage.c | 40 ++++++++++++++++---------------------
>>>  1 file changed, 17 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>>> index 06db4649af91..614b2feddba2 100644
>>> --- a/arch/arm64/mm/hugetlbpage.c
>>> +++ b/arch/arm64/mm/hugetlbpage.c
>>> @@ -163,24 +163,23 @@ static pte_t get_clear_contig(struct mm_struct *mm,
>>>  			     unsigned long pgsize,
>>>  			     unsigned long ncontig)
>>>  {
>>> -	pte_t orig_pte = __ptep_get(ptep);
>>> -	unsigned long i;
>>> -
>>> -	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
>>> -		pte_t pte = __ptep_get_and_clear(mm, addr, ptep);
>>> -
>>> -		/*
>>> -		 * If HW_AFDBM is enabled, then the HW could turn on
>>> -		 * the dirty or accessed bit for any page in the set,
>>> -		 * so check them all.
>>> -		 */
>>> -		if (pte_dirty(pte))
>>> -			orig_pte = pte_mkdirty(orig_pte);
>>> -
>>> -		if (pte_young(pte))
>>> -			orig_pte = pte_mkyoung(orig_pte);
>>> +	pte_t pte, tmp_pte;
>>> +	bool present;
>>> +
>>> +	pte = __ptep_get_and_clear(mm, addr, ptep);
>>> +	present = pte_present(pte);
>>
>> pte_present() may not be evaluated for standard huge pages at [PMD|PUD]_SIZE
>> e.g when ncontig = 1 in the argument.
> 
> Sorry I'm not quite sure what you're suggesting here? Are you proposing that
> pte_present() should be moved into the loop so that we only actually call it
> when we are going to consume it? I'm happy to do that if it's the preference,

Right, pte_present() is only required for the cont huge pages but not for the
normal huge pages. 

> but I thought it was neater to hoist it out of the loop.

Agreed, but when possible pte_present() cost should be avoided for the normal
huge pages where it is not required.

> 
>>
>>> +	while (--ncontig) {
>>
>> Should this be converted into a for loop instead just to be in sync with other
>> similar iterators in this file.
>>
>> for (i = 1; i < ncontig; i++, addr += pgsize, ptep++)
>> {
>> 	tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
>> 	if (present) {
>> 		if (pte_dirty(tmp_pte))
>> 			pte = pte_mkdirty(pte);
>> 		if (pte_young(tmp_pte))
>> 			pte = pte_mkyoung(pte);
>> 	}
>> }
> 
> I think the way you have written this it's incorrect. Let's say we have 16 ptes
> in the block. We want to iterate over the last 15 of them (we have already read
> pte 0). But you're iterating over the first 15 because you don't increment addr
> and ptep until after you've been around the loop the first time. So we would
> need to explicitly increment those 2 before entering the loop. But that is only
> neccessary if ncontig > 1. Personally I think my approach is neater...

Thinking about this again. Just wondering should not a pte_present()
check on each entries being cleared along with (ncontig > 1) in this
existing loop before transferring over the dirty and accessed bits -
also work as intended with less code churn ?

static pte_t get_clear_contig(struct mm_struct *mm,
                             unsigned long addr,
                             pte_t *ptep,
                             unsigned long pgsize,
                             unsigned long ncontig)
{
       pte_t orig_pte = __ptep_get(ptep);
       unsigned long i;

        for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
                pte_t pte = __ptep_get_and_clear(mm, addr, ptep);
		
		if (ncontig > 1 && !pte_present(pte))
                        continue;

                /*
                 * If HW_AFDBM is enabled, then the HW could turn on
                 * the dirty or accessed bit for any page in the set,
                 * so check them all.
                 */
                if (pte_dirty(pte))
                        orig_pte = pte_mkdirty(orig_pte);

                if (pte_young(pte))
                        orig_pte = pte_mkyoung(orig_pte);
        }
        return orig_pte;
}

* Normal huge pages

	- enters the for loop just once
	- clears the single entry
	- always transfers dirty and access bits
		- pte_present() does not matter as ncontig = 1

* Contig huge pages

	- enters the for loop ncontig times - for each sub page
	- clears all sub page entries
	- transfers dirty and access bits only when pte_present()
		- pte_present() is relevant as ncontig > 1

> 
>>
>>> +		ptep++;
>>> +		addr += pgsize;
>>> +		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
>>> +		if (present) {
>>> +			if (pte_dirty(tmp_pte))
>>> +				pte = pte_mkdirty(pte);
>>> +			if (pte_young(tmp_pte))
>>> +				pte = pte_mkyoung(pte);
>>> +		}
>>>  	}
>>> -	return orig_pte;
>>> +	return pte;
>>>  }
>>>  
>>>  static pte_t get_clear_contig_flush(struct mm_struct *mm,
>>> @@ -401,13 +400,8 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>>>  {
>>>  	int ncontig;
>>>  	size_t pgsize;
>>> -	pte_t orig_pte = __ptep_get(ptep);
>>> -
>>> -	if (!pte_cont(orig_pte))
>>> -		return __ptep_get_and_clear(mm, addr, ptep);
>>> -
>>> -	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
>>>  
>>> +	ncontig = num_contig_ptes(sz, &pgsize);
>>>  	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
>>>  }
>>>  
> 

