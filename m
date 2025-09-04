Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C54DCA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PTAV17+IuYGzhs0wgKtky3guInxpwjAojrDT1PtQBc=; b=Gm0FSZmDf7vuVd3n5CMMJ8GVWn
	YLTijBw69sm1kCJC1wkCHVzkdLlOyrw/rC24SvCg+yQNy3TjtzC1pYL6MWpG9vFtalJGoJdMsBR6p
	itfZQe1uJ2WvbDul+6jycQQFPp7oRJsudFCwr3xO+4f4UHSTZcIMS/rBsPEm3aEEqRovvRSDfYKRE
	z9+l9Icp0i79i8Xur12L0JfvFo1bneIBcqGJ5e/R8XB07c8pOasaxb9TcpVYAfCVyJLnD94iMoNGF
	GL2XuIy6LsqSSLj8s8woQFEks65mgv9wAVTgnAL9+YkrhRPwpvVVdIlYlKVFNFSb4EUg0W/6cYbla
	FwEkTzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9Ky-0000000BegC-2gXf;
	Thu, 04 Sep 2025 12:45:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7ro-0000000B7x0-1ZcI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 11:11:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2CAC1756;
	Thu,  4 Sep 2025 04:10:51 -0700 (PDT)
Received: from [10.1.37.179] (XHFQ2J9959.cambridge.arm.com [10.1.37.179])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 378AB3F6A8;
	Thu,  4 Sep 2025 04:10:58 -0700 (PDT)
Message-ID: <2cf02021-10d2-46f6-b3e6-f5c55546ca9e@arm.com>
Date: Thu, 4 Sep 2025 12:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] arm64: mm: Optimize linear_map_split_to_ptes()
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dev Jain <dev.jain@arm.com>,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-7-ryan.roberts@arm.com>
 <9d666caf-a799-4229-86b5-3a22a60fa79f@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <9d666caf-a799-4229-86b5-3a22a60fa79f@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_041100_510115_656B0799 
X-CRM114-Status: GOOD (  21.46  )
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

On 29/08/2025 23:27, Yang Shi wrote:
> 
> 
> On 8/29/25 4:52 AM, Ryan Roberts wrote:
>> When splitting kernel leaf mappings, either via
>> split_kernel_leaf_mapping_locked() or linear_map_split_to_ptes(),
>> previously a leaf mapping was always split to the next size down. e.g.
>> pud -> contpmd -> pmd -> contpte -> pte. But for
>> linear_map_split_to_ptes() we can avoid the contpmd and contpte states
>> because we know we want to split all the way down to ptes.
>>
>> This avoids visiting all the ptes in a table if it was created by
>> splitting a pmd, which is noticible on systems with a lot of memory.
> 
> Similar to patch #4, this patch should be squashed into patch #5 IMHO.

That's fine by me. I was just trying to make the review easier by splitting
non-essential stuff out. Let's squash for next version.

> 
> Thanks,
> Yang
> 
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>   arch/arm64/mm/mmu.c | 26 ++++++++++++++++++--------
>>   1 file changed, 18 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 6bd0b065bd97..8e45cd08bf3a 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -550,7 +550,7 @@ static void split_contpte(pte_t *ptep)
>>           __set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
>>   }
>>   -static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp)
>> +static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>>   {
>>       pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>>       unsigned long pfn = pmd_pfn(pmd);
>> @@ -568,7 +568,9 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp)
>>           tableprot |= PMD_TABLE_PXN;
>>         prot = __pgprot((pgprot_val(prot) & ~PTE_TYPE_MASK) | PTE_TYPE_PAGE);
>> -    prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>> +    prot = __pgprot(pgprot_val(prot) & ~PTE_CONT);
>> +    if (to_cont)
>> +        prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>         for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>>           __set_pte(ptep, pfn_pte(pfn, prot));
>> @@ -592,7 +594,7 @@ static void split_contpmd(pmd_t *pmdp)
>>           set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
>>   }
>>   -static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp)
>> +static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>>   {
>>       pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
>>       unsigned int step = PMD_SIZE >> PAGE_SHIFT;
>> @@ -611,7 +613,9 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp)
>>           tableprot |= PUD_TABLE_PXN;
>>         prot = __pgprot((pgprot_val(prot) & ~PMD_TYPE_MASK) | PMD_TYPE_SECT);
>> -    prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>> +    prot = __pgprot(pgprot_val(prot) & ~PTE_CONT);
>> +    if (to_cont)
>> +        prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>         for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
>>           set_pmd(pmdp, pfn_pmd(pfn, prot));
>> @@ -669,7 +673,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long
>> addr)
>>       if (!pud_present(pud))
>>           goto out;
>>       if (pud_leaf(pud)) {
>> -        ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL);
>> +        ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
>>           if (ret)
>>               goto out;
>>       }
>> @@ -694,7 +698,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long
>> addr)
>>            */
>>           if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>>               goto out;
>> -        ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL);
>> +        ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>>           if (ret)
>>               goto out;
>>       }
>> @@ -771,7 +775,7 @@ static int __init split_to_ptes_pud_entry(pud_t *pudp,
>> unsigned long addr,
>>       int ret = 0;
>>         if (pud_leaf(pud))
>> -        ret = split_pud(pudp, pud, GFP_ATOMIC);
>> +        ret = split_pud(pudp, pud, GFP_ATOMIC, false);
>>         return ret;
>>   }
>> @@ -786,7 +790,13 @@ static int __init split_to_ptes_pmd_entry(pmd_t *pmdp,
>> unsigned long addr,
>>       if (pmd_leaf(pmd)) {
>>           if (pmd_cont(pmd))
>>               split_contpmd(pmdp);
>> -        ret = split_pmd(pmdp, pmd, GFP_ATOMIC);
>> +        ret = split_pmd(pmdp, pmd, GFP_ATOMIC, false);
>> +
>> +        /*
>> +         * We have split the pmd directly to ptes so there is no need to
>> +         * visit each pte to check if they are contpte.
>> +         */
>> +        walk->action = ACTION_CONTINUE;
>>       }
>>         return ret;
> 


