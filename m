Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27D6CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL7lz3u7A7nCbF8cVqVov/D4tUJYTYOjlx+J/uhQPIc=; b=IXHyXwfEYmCpVNoH/HpLz3LZJL
	SGbhOYzaMxYIuyW1dE8+j5SxSljYbsctmOzGeE6HetBrfoHMkAyLmDHVtGBqcNb1McNQ435khkAPm
	+zfNmYSpUY6K4Yj/YezvJ5VWf5Pho7FTHcXbb9V65SBQJ9BzSEVSHdoevuTVL8N9Ky00pWRKKCRVw
	/i0X3A+aZJjpkauJLjBa7e7iF350XQ1B/+SKv5KbuBnV0WVOMjhwdD6KVH/9wZx86pdwZoR84FYzv
	1XEhMMIlNrLtLTLw7Uszkqid3weeqIItDKlfkauUSkcoZp/6Kka+oNQYdzDS+XhEj2mUk6r//rlj7
	PU3y1qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsFz-0000000Eait-2ExS;
	Wed, 14 Oct 2026 06:14:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGsFy-0000000Eain-0u6k
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 06:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xL7lz3u7A7nCbF8cVqVov/D4tUJYTYOjlx+J/uhQPIc=; b=ECuQn8pnzjb/1t4TDeMGDY7Cmg
	+dHWAKSB14Hp6zwaFYW90NaPtH7WaMuKFOiksxzn8WHRqHwKLtbyKTRaSc+6Q3hI+uvxZWqtkVcTj
	T08bdWqAEM2ucruuRWGZ8xuv0kXSCVprD/L1D1OH8YVq0qxkKPW6InZ0ySqVgSQbO317DxIcr34ap
	c3DZBF8FhT+4qD472j7mtSoO0GtVnAsiEdjbZ6PLmDfJzKY7TIyoVq3b6l84pu9PQoLNk4A6f3+Px
	uDY6zK1MLJ2W7K8Z4R8Sh3qZ5tBSdQnTlozc4HRGw9CMr+TlL33NOQgIw6dPE2m+xUCZPTbVypl8i
	alyOid9g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGsFt-0000000GO5h-3UQG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:14:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59978152B;
	Tue, 13 Oct 2026 23:14:20 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0671C3F7B4;
	Tue, 13 Oct 2026 23:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791958463; bh=a7qhbNgmdcPYQ6buXTv8OGPWO0Grnhy1fDX5AmFWNhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iVZjLtZtTnUpq+MWM8i1fufHT2ECWkrV3HWNj3WcG/hN9gP+H6H1v93xpCesC3iXX
	 CQi/6xszKB9Zt761+SEqTqssh9cXgTWtdj2H2ozmWZiK6LvgOQCLvIdI0bH8dhgof8
	 tc467R1T/ulRHWldWSPWBQMRzgRPRXiY+auEPDBE=
Message-ID: <c1849f90-58a4-404a-aa01-97b53bd92650@arm.com>
Date: Wed, 14 Oct 2026 11:44:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Uladzislau Rezki <urezki@gmail.com>, Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 will@kernel.org, Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
 anshuman.khandual@arm.com, baohua@kernel.org, chleroy@kernel.org,
 david@kernel.org, jiangwen6@xiaomi.com, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-4-jiangwen6@xiaomi.com> <asudY_EhrT5fZGmZ@milan>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <asudY_EhrT5fZGmZ@milan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_071426_847082_6B1C1756 
X-CRM114-Status: GOOD (  22.44  )
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



On 11/10/26 7:59 pm, Uladzislau Rezki wrote:
> On Fri, Oct 02, 2026 at 05:09:40PM +0800, Wen Jiang wrote:
>> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
>> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
>> the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
>> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
>>
>> Now that arm64 and powerpc/8xx provide pte_set_huge() and
>> pte_clear_huge(), add the generic fallbacks next to the existing
>> pmd/pud_set_huge() family and convert vmap_pte_range() and
>> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
>> around the block-mapping paths are dropped, so PTE-level block mappings
>> now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
>> longer includes <linux/hugetlb.h>.
>>
>> The fallbacks exist only to keep the build working on architectures
>> without PTE-level block mapping support. They are unreachable there:
>> the callers only run when arch_vmap_pte_range_map_size() or
>> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
>> which requires an arch implementation. BUILD_BUG() makes that
>> explicit rather than silently doing nothing.
>>
>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>> Reviewed-by: Barry Song <baohua@kernel.org>
>> ---
>>  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>>  mm/vmalloc.c            | 19 ++++++-------------
>>  2 files changed, 35 insertions(+), 13 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 8c093c119e5a8..a7fd51fec8a17 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>>  }
>>  #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
>>  
>> +/*
>> + * PTE-level block mappings for vmap.
>> + *
>> + * pte_set_huge() only has to be implemented by architectures whose
>> + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
>> + */
>> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
>> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
>> +				phys_addr_t phys, pgprot_t prot,
>> +				unsigned long size)
>> +{
>> +	BUILD_BUG();
>> +}
>> +#endif
>> +
>> +/*
>> + * Likewise, pte_clear_huge() only has to be implemented by architectures
>> + * whose arch_vmap_pte_range_unmap_size() can return a size other than
>> + * PAGE_SIZE.
>> + */
>> +#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
>> +static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
>> +				   unsigned long size)
>> +{
>> +	BUILD_BUG();
>> +	return __pte(0);
>> +}
>> +#endif
>> +
>>  #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  /*
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index bea9f76ed7e74..fb757d95bde25 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -38,7 +38,6 @@
>>  #include <linux/rbtree_augmented.h>
>>  #include <linux/overflow.h>
>>  #include <linux/pgtable.h>
>> -#include <linux/hugetlb.h>
>>  #include <linux/sched/mm.h>
>>  #include <asm/tlbflush.h>
>>  #include <asm/shmparam.h>
>> @@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>  	pte_t *pte;
>>  	u64 pfn;
>>  	struct page *page;
>> -	unsigned long size = PAGE_SIZE;
>> +	unsigned long size;
>>  
>>  	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>>  		return -EINVAL;
>> @@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>  			BUG();
>>  		}
>>  
>> -#ifdef CONFIG_HUGETLB_PAGE
>>  		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
>>  		if (size != PAGE_SIZE) {
>> -			pte_t entry = pfn_pte(pfn, prot);
>> -
>> -			entry = arch_make_huge_pte(entry, ilog2(size), 0);
>> -			set_huge_pte_at(&init_mm, addr, pte, entry, size);
>> +			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
>>
> As far as i understand, X86_64 arches do not use this path. This
> specifically is only for ARM64 or powerpc. pte_set_huge() makes me
> thinking about huge-page mappings(PMD/PUD/hugetlb). This helper is

I disagree. All the helpers in hugetlb.c are all "huge" helpers but
the arch overrides.

It has been a long time since huge mappings have been supported at the PTE
level, setting it by setting multiple ptes is just an implementation detail.

Similarly, there are CONT-PMD mappings on arm64, we still call them huge mappings,
it is a matter of implementation that the huge mapping is expressed by setting
multiple PMDs.

 > about mutli page mapping on the PTE level.
> 
> Better naming? pte_set_large()?
> 
> Any thoughts?
> 
> Other then that:
> 
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> 
> --
> Uladzislau Rezki


