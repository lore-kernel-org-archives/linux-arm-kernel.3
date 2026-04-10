Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E709AF36BA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 05:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPCO8NIsXzNfPnxUN/lQvKa1Z8/vojZgcQtgG6QiMp8=; b=0/ZL+I0j4FveEKVyUgi13w5LQU
	CYorkhBWw8J7R+wkvMZESbRLIJ3qQTTU/lkZ10eataf54CW1kvqtQ1MwkZKD99fKuHwqtPCAIoA2l
	WjMW2w6KMtXkiLUufiNNhiS2LW+xdiUZ4dO+Pkd6TE+P9+TL643yjcWKCMppy4mxLygi98BjVPRC7
	tLseucYL9Pbr53W0JLQQpVygiuAxieBE0+4YLQYR5UiI34WtrpCIV6qzVDCtTxSRvSLiq9oYQslXT
	Dn+fbCaeGea2X9yBbE7rcXoFhO+OMl82yOMaCUyQJLOvIpUbn5R616x58ZOW5Vs2u7W+t+vkHONez
	AlZjA/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB43u-0000000Bc5s-2uVt;
	Fri, 10 Apr 2026 05:05:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB43s-0000000Bc5X-1s3u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 05:05:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 564602008;
	Thu,  9 Apr 2026 22:05:36 -0700 (PDT)
Received: from [10.163.181.174] (unknown [10.163.181.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3737E3FAF5;
	Thu,  9 Apr 2026 22:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775797542; bh=l0ZVxfWJ7gUGDjmiQGof6X1EzK424doNulI+ywEOOlY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r0C8PVa9cbhsNuM+1PpHIQKCsYCQoxy2vSc5vm2DvE4BqKnMfgnHzBaPqLwsqkeXN
	 Pvu88Nyvsr+YBOTsMX/n/8n2l/4EAJOYo/gko4uK8gTzaz3ghCa7L2kqVNjZUppTRd
	 CdWX0tZv0gDQzLDfPWwgAxs6WyGl9PvrYDCalxpA=
Message-ID: <c490455f-084a-4f53-86b0-89c15669efb3@arm.com>
Date: Fri, 10 Apr 2026 10:35:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 07/16] arm64/mm: Convert READ_ONCE() as p4dp_get() while
 accessing P4D
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-8-anshuman.khandual@arm.com>
 <238ab437-06b1-43ef-86bb-9341c02040b1@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <238ab437-06b1-43ef-86bb-9341c02040b1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_220544_578575_18989501 
X-CRM114-Status: GOOD (  17.62  )
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

On 08/04/26 5:47 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 06:11, Anshuman Khandual wrote:
>> Convert all READ_ONCE() based P4D accesses as p4dp_get() instead which will
>> support both D64 and D128 translation regime going forward.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: kasan-dev@googlegroups.com
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
> 
> 
> [...]
> 
>>  static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index a80d06db4de6..16ae11b29f66 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -354,7 +354,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>  {
>>  	int ret = 0;
>>  	unsigned long next;
>> -	p4d_t p4d = READ_ONCE(*p4dp);
>> +	p4d_t p4d = p4dp_get(p4dp);
>>  	pud_t *pudp;
>>  
>>  	if (p4d_none(p4d)) {
>> @@ -443,7 +443,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>>  	}
>>  
>>  	do {
>> -		p4d_t old_p4d = READ_ONCE(*p4dp);
>> +		p4d_t old_p4d = p4dp_get(p4dp);
>>  
>>  		next = p4d_addr_end(addr, end);
>>  
>> @@ -453,7 +453,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>>  			goto out;
>>  
>>  		BUG_ON(p4d_val(old_p4d) != 0 &&
>> -		       p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
>> +		       p4d_val(old_p4d) != (p4d_val(p4dp_get(p4dp))));
> 
> Same here, while at it remove the BUG_ON. (see below)
> 
>>  
>>  		phys += next - addr;
>>  	} while (p4dp++, addr = next, addr != end);
>> @@ -1541,7 +1541,7 @@ static void unmap_hotplug_p4d_range(pgd_t *pgdp, unsigned long addr,
>>  	do {
>>  		next = p4d_addr_end(addr, end);
>>  		p4dp = p4d_offset(pgdp, addr);
>> -		p4d = READ_ONCE(*p4dp);
>> +		p4d = p4dp_get(p4dp);
>>  		if (p4d_none(p4d))
>>  			continue;
>>  
>> @@ -1703,7 +1703,7 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
>>  	do {
>>  		next = p4d_addr_end(addr, end);
>>  		p4dp = p4d_offset(pgdp, addr);
>> -		p4d = READ_ONCE(*p4dp);
>> +		p4d = p4dp_get(p4dp);
>>  		if (p4d_none(p4d))
>>  			continue;
>>  
>> @@ -1724,7 +1724,7 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
>>  	 */
>>  	p4dp = p4d_offset(pgdp, 0UL);
>>  	for (i = 0; i < PTRS_PER_P4D; i++) {
>> -		if (!p4d_none(READ_ONCE(p4dp[i])))
>> +		if (!p4d_none(p4dp_get(p4dp + i)))
>>  			return;
>>  	}
>>  
>> @@ -2258,4 +2258,21 @@ int pmdp_test_and_clear_young(struct vm_area_struct *vma,
>>  }
>>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
>>  
>> +#if CONFIG_PGTABLE_LEVELS > 3
>> +phys_addr_t pud_offset_phys(p4d_t *p4dp, unsigned long addr)
>> +{
>> +	p4d_t p4d = p4dp_get(p4dp);
>> +
>> +	BUG_ON(!pgtable_l4_enabled());
> 
> Heh, while at it, convert that to a VM_WARN_ON_ONCE() or anything else
> that is not a BUG.
> 
> I strongly assume CONFIG_DEBUG_VM checks are sufficient.

There are multiple similar BUG_ON() instances

arch/arm64/include/asm/pgtable.h:       BUG_ON(!pgtable_l4_enabled());
arch/arm64/include/asm/pgtable.h:       BUG_ON(!pgtable_l5_enabled());

arch/arm64/mm/mmu.c:                    BUG_ON(pmd_val(old_pmd) != 0 &&
arch/arm64/mm/mmu.c:                    BUG_ON(pud_val(old_pud) != 0 &&
arch/arm64/mm/mmu.c:            BUG_ON(p4d_val(old_p4d) != 0 &&

Shall we convert all of them as VM_WARN_ON_ONCE() in a separate patch
as a pre-requisite ?

> 
>> +
>> +	return p4d_page_paddr(p4d) + pud_index(addr) * sizeof(pud_t);
>> +}
>> +
> 


