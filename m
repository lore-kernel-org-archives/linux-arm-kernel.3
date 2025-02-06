Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6271BC02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 06:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVc3LoodQDturh31HqQczNh8hyHjq7IlJKZcM/wcOpI=; b=elcVS/wjB33WXZ7WVtoQzxIUML
	qo1RZv+QJIW73qw3/28n+Pb6lJ+NcphjJAzDjOuHUOve4CEak6wlPKTPxLSdh68id81OTqrugtZm9
	Z2ZSany8RBS8RBtsaErcjAOyOslX6belAeTlQQPGi8wo287HQRc0zVP+GYb9J4b5+6I6i5v5DNo5G
	oPoFDLQUYXAgj4VWSTqkpKmxJq+H1lwMG02lGQ+kn1UYQQfs6Zf4t5qKrwA4BAAhmAVcv6KctrFQn
	C1KCy8hGFhVj8M4SSLIOh/jHD7zq8TCHvssOkJqlxTT3hmjlU2j4CtkyaTm/9RVElPedZKnYoCBTS
	tmJWGleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfvCh-00000005NBs-0wPw;
	Thu, 06 Feb 2025 06:17:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfvBG-00000005Mv3-04tU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 06:16:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8888612FC;
	Wed,  5 Feb 2025 22:16:28 -0800 (PST)
Received: from [10.163.34.115] (unknown [10.163.34.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF7AE3F63F;
	Wed,  5 Feb 2025 22:15:59 -0800 (PST)
Message-ID: <83103cbb-e2b8-4177-aeaf-c3b6e6b08008@arm.com>
Date: Thu, 6 Feb 2025 11:45:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/16] arm64: hugetlb: Fix huge_ptep_get_and_clear()
 for non-present ptes
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-3-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-3-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_221606_152728_8EC37077 
X-CRM114-Status: GOOD (  44.93  )
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

On 2/5/25 20:39, Ryan Roberts wrote:
> arm64 supports multiple huge_pte sizes. Some of the sizes are covered by
> a single pte entry at a particular level (PMD_SIZE, PUD_SIZE), and some
> are covered by multiple ptes at a particular level (CONT_PTE_SIZE,
> CONT_PMD_SIZE). So the function has to figure out the size from the
> huge_pte pointer. This was previously done by walking the pgtable to
> determine the level, then using the PTE_CONT bit to determine the number
> of ptes.

Actually PTE_CONT gets used to determine if the entry is normal i.e
PMD/PUD based huge page or cont PTE/PMD based huge page just to call
into standard __ptep_get_and_clear() or specific get_clear_contig(),
after determining find_num_contig() by walking the page table.

PTE_CONT presence is only used to determine the switch above but not
to determine the number of ptes for the mapping as mentioned earlier.

There are two similar functions which determines the 

static int find_num_contig(struct mm_struct *mm, unsigned long addr,
                           pte_t *ptep, size_t *pgsize)
{
        pgd_t *pgdp = pgd_offset(mm, addr);
        p4d_t *p4dp;
        pud_t *pudp;
        pmd_t *pmdp;

        *pgsize = PAGE_SIZE;
        p4dp = p4d_offset(pgdp, addr);
        pudp = pud_offset(p4dp, addr);
        pmdp = pmd_offset(pudp, addr);
        if ((pte_t *)pmdp == ptep) {
                *pgsize = PMD_SIZE;
                return CONT_PMDS;
        }
        return CONT_PTES;
}

find_num_contig() already assumes that the entry is contig huge page and
it just finds whether it is PMD or PTE based one. This always requires a
prior PTE_CONT bit being set determination via pte_cont() before calling
find_num_contig() in each instance.

But num_contig_ptes() can get the same information without walking the
page table and thus without predetermining if PTE_CONT is set or not.
size can be derived from VMA argument when present.

static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
{
        int contig_ptes = 0;

        *pgsize = size;

        switch (size) {
#ifndef __PAGETABLE_PMD_FOLDED
        case PUD_SIZE:
                if (pud_sect_supported())
                        contig_ptes = 1;
                break;
#endif
        case PMD_SIZE:
                contig_ptes = 1;
                break;
        case CONT_PMD_SIZE:
                *pgsize = PMD_SIZE;
                contig_ptes = CONT_PMDS;
                break;
        case CONT_PTE_SIZE:
                *pgsize = PAGE_SIZE;
                contig_ptes = CONT_PTES;
                break;
        }

        return contig_ptes;
}

On a side note, why cannot num_contig_ptes() be used all the time and
find_num_contig() be dropped ? OR am I missing something here.

> 
> But the PTE_CONT bit is only valid when the pte is present. For
> non-present pte values (e.g. markers, migration entries), the previous
> implementation was therefore erroniously determining the size. There is
> at least one known caller in core-mm, move_huge_pte(), which may call
> huge_ptep_get_and_clear() for a non-present pte. So we must be robust to
> this case. Additionally the "regular" ptep_get_and_clear() is robust to
> being called for non-present ptes so it makes sense to follow the
> behaviour.

With VMA argument and num_contig_ptes() dependency on PTE_CONT being set
and the entry being mapped might not be required.

> 
> Fix this by using the new sz parameter which is now provided to the
> function. Additionally when clearing each pte in a contig range, don't
> gather the access and dirty bits if the pte is not present.

Makes sense.

> 
> An alternative approach that would not require API changes would be to
> store the PTE_CONT bit in a spare bit in the swap entry pte. But it felt
> cleaner to follow other APIs' lead and just pass in the size.

Right, changing the arguments in the API will help solve this problem.

> 
> While we are at it, add some debug warnings in functions that require
> the pte is present.
> 
> As an aside, PTE_CONT is bit 52, which corresponds to bit 40 in the swap
> entry offset field (layout of non-present pte). Since hugetlb is never
> swapped to disk, this field will only be populated for markers, which
> always set this bit to 0 and hwpoison swap entries, which set the offset
> field to a PFN; So it would only ever be 1 for a 52-bit PVA system where
> memory in that high half was poisoned (I think!). So in practice, this
> bit would almost always be zero for non-present ptes and we would only
> clear the first entry if it was actually a contiguous block. That's
> probably a less severe symptom than if it was always interpretted as 1
> and cleared out potentially-present neighboring PTEs.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/mm/hugetlbpage.c | 54 ++++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 06db4649af91..328eec4bfe55 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -163,24 +163,23 @@ static pte_t get_clear_contig(struct mm_struct *mm,
>  			     unsigned long pgsize,
>  			     unsigned long ncontig)
>  {
> -	pte_t orig_pte = __ptep_get(ptep);
> -	unsigned long i;
> -
> -	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
> -		pte_t pte = __ptep_get_and_clear(mm, addr, ptep);
> -
> -		/*
> -		 * If HW_AFDBM is enabled, then the HW could turn on
> -		 * the dirty or accessed bit for any page in the set,
> -		 * so check them all.
> -		 */
> -		if (pte_dirty(pte))
> -			orig_pte = pte_mkdirty(orig_pte);
> -
> -		if (pte_young(pte))
> -			orig_pte = pte_mkyoung(orig_pte);
> +	pte_t pte, tmp_pte;
> +	bool present;
> +
> +	pte = __ptep_get_and_clear(mm, addr, ptep);
> +	present = pte_present(pte);
> +	while (--ncontig) {

Although this does the right thing by calling __ptep_get_and_clear() once
for non-contig huge pages but wondering if cont/non-cont separation should
be maintained in the caller huge_ptep_get_and_clear(), keeping the current
logical bifurcation intact.

> +		ptep++;
> +		addr += pgsize;
> +		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
> +		if (present) {

Checking for present entries makes sense here.

> +			if (pte_dirty(tmp_pte))
> +				pte = pte_mkdirty(pte);
> +			if (pte_young(tmp_pte))
> +				pte = pte_mkyoung(pte);
> +		}
>  	}
> -	return orig_pte;
> +	return pte;
>  }
>  
>  static pte_t get_clear_contig_flush(struct mm_struct *mm,
> @@ -401,13 +400,8 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>  {
>  	int ncontig;
>  	size_t pgsize;
> -	pte_t orig_pte = __ptep_get(ptep);
> -
> -	if (!pte_cont(orig_pte))
> -		return __ptep_get_and_clear(mm, addr, ptep);
> -
> -	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
>  
> +	ncontig = num_contig_ptes(sz, &pgsize);

__ptep_get_and_clear() can still be called here if 'ncontig' is
returned as 0 indicating a normal non-contig huge page thus
keeping get_clear_contig() unchanged just to handle contig huge
pages.

>  	return get_clear_contig(mm, addr, ptep, pgsize, ncontig);
>  }
>  
> @@ -451,6 +445,8 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	pgprot_t hugeprot;
>  	pte_t orig_pte;
>  
> +	VM_WARN_ON(!pte_present(pte));
> +
>  	if (!pte_cont(pte))
>  		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>  
> @@ -461,6 +457,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  		return 0;
>  
>  	orig_pte = get_clear_contig_flush(mm, addr, ptep, pgsize, ncontig);
> +	VM_WARN_ON(!pte_present(orig_pte));
>  
>  	/* Make sure we don't lose the dirty or young state */
>  	if (pte_dirty(orig_pte))
> @@ -485,7 +482,10 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	size_t pgsize;
>  	pte_t pte;
>  
> -	if (!pte_cont(__ptep_get(ptep))) {
> +	pte = __ptep_get(ptep);
> +	VM_WARN_ON(!pte_present(pte));
> +
> +	if (!pte_cont(pte)) {
>  		__ptep_set_wrprotect(mm, addr, ptep);
>  		return;
>  	}
> @@ -509,8 +509,12 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  	struct mm_struct *mm = vma->vm_mm;
>  	size_t pgsize;
>  	int ncontig;
> +	pte_t pte;
>  
> -	if (!pte_cont(__ptep_get(ptep)))
> +	pte = __ptep_get(ptep);
> +	VM_WARN_ON(!pte_present(pte));
> +
> +	if (!pte_cont(pte))
>  		return ptep_clear_flush(vma, addr, ptep);
>  
>  	ncontig = find_num_contig(mm, addr, ptep, &pgsize);

In all the above instances should not num_contig_ptes() be called to determine
if a given entry is non-contig or contig huge page, thus dropping the need for
pte_cont() and pte_present() tests as proposed here.

