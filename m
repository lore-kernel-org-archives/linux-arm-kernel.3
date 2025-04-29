Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4D1C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5SlIgstzdRCbxuA22hxLl1exRHTX9P1h9O3d47Mdrc=; b=f/3rX6F+WHK8lfFh5TgKkuGSGf
	NDAWxCHU98XpMsTarMUSvB4+jLT6LXZyK9AOHf87ciBDkGvUl5NPbNLt9bVMczaUtbMKi8RBnZ8iR
	Xfo6n/TGYjnEHounykvxxAB/LrMxUfaQLlUxmFJ5ZwHXVTXJfTU3vWxvlqIsHnnkbe/o9k3CIsA+k
	zfJ7Ps430Q09pxSJgr1oIm7xGJTi3s2X/1lIxu4PpThfqMD76Gmbc/cbB1H92u/Unept5iPPvPCtr
	V7WfU16SjGvzHW93R7rwYC0+RAGpfWNPGUrY5wYp/f/l2sTftct5Viq9Ep0QuTk14v8AzEAsa9jUY
	HbMJJ6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9i0Z-00000009Gkq-0Gio;
	Tue, 29 Apr 2025 10:16:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9goQ-000000092eM-0VLg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 08:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=r5SlIgstzdRCbxuA22hxLl1exRHTX9P1h9O3d47Mdrc=; b=GUEw8GUG1Bo2o88R7K4EiZCn7x
	TG+PZ6e23xTs9crIXhvW/Xnle+5s+TFdOHl7Wc7HdU7qz7A+oU+PtbuHHFh0Rg2G+Eso6+PBvOcI7
	sr/979uVLDXzgfw6s+9vfyc5pH/eGYpZmZlCRMhwqnTEawlK6hnDdT8jF76CtXVijsVP6tWXGdM7p
	/mFe6x0ooqZU1Td6HyLu8Zczs/QeFV+LLSOwmm8u0x3bD0LJXcrnt3Et+Blk1X8Ln3bCcpqm7IL2n
	zXIDRXbNA7XablMg/OVc1vwzOxzsLlDlPn08t3WFHGYYgq9MFF2dHKGe7PYwz1kNCXU9xwwwt6hUt
	xCZD5PuQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9goM-0000000DERq-0XaX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:59:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAC0A1515;
	Tue, 29 Apr 2025 01:59:19 -0700 (PDT)
Received: from [10.163.78.253] (unknown [10.163.78.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78FBB3F673;
	Tue, 29 Apr 2025 01:59:16 -0700 (PDT)
Message-ID: <33e8d9fe-d30a-4cbb-b141-133b8989019e@arm.com>
Date: Tue, 29 Apr 2025 14:29:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: Optimize mprotect() by batch-skipping PTEs
To: Anshuman Khandual <anshuman.khandual@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, david@redhat.com, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, jannh@google.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 namit@vmware.com, hughd@google.com, yang@os.amperecomputing.com,
 ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-3-dev.jain@arm.com>
 <ebf73f29-dab4-4551-b1a0-951cae76b5ce@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <ebf73f29-dab4-4551-b1a0-951cae76b5ce@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_095930_479957_C97916E5 
X-CRM114-Status: GOOD (  18.25  )
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



On 29/04/25 12:44 pm, Anshuman Khandual wrote:
> On 4/29/25 10:53, Dev Jain wrote:
>> In case of prot_numa, there are various cases in which we can skip to the
>> next iteration. Since the skip condition is based on the folio and not
>> the PTEs, we can skip a PTE batch.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 27 ++++++++++++++++++++-------
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 70f59aa8c2a8..ec5d17af7650 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -91,6 +91,9 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
>>   	bool toptier;
>>   	int nid;
>>   
>> +	if (folio_is_zone_device(folio) || folio_test_ksm(folio))
>> +		return true;
>> +
> 
> Moving these here from prot_numa_avoid_fault() could have been done
> earlier, while adding prot_numa_skip() itself in the previous patch
> (in case this helper is determined to be really required).

True. I'll do that.

> 
>>   	/* Also skip shared copy-on-write pages */
>>   	if (is_cow_mapping(vma->vm_flags) &&
>>   	    (folio_maybe_dma_pinned(folio) ||
>> @@ -126,8 +129,10 @@ static bool prot_numa_skip(struct vm_area_struct *vma, struct folio *folio,
>>   }
>>   
>>   static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
>> -		unsigned long addr, pte_t oldpte, int target_node)
>> +		unsigned long addr, pte_t *pte, pte_t oldpte, int target_node,
>> +		int max_nr, int *nr)
>>   {
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> 
> Flags are all correct.
> 
>>   	struct folio *folio;
>>   	int ret;
>>   
>> @@ -136,12 +141,16 @@ static bool prot_numa_avoid_fault(struct vm_area_struct *vma,
>>   		return true;
>>   
>>   	folio = vm_normal_folio(vma, addr, oldpte);
>> -	if (!folio || folio_is_zone_device(folio) ||
>> -	    folio_test_ksm(folio))
>> +	if (!folio)
>>   		return true;
>> +
>>   	ret = prot_numa_skip(vma, folio, target_node);
>> -	if (ret)
>> +	if (ret) {
>> +		if (folio_test_large(folio) && max_nr != 1)
> 
> Conditional checks are all correct.
> 
>> +			*nr = folio_pte_batch(folio, addr, pte, oldpte,
>> +					      max_nr, flags, NULL, NULL, NULL);
>>   		return ret;
>> +	}
>>   	if (folio_use_access_time(folio))
>>   		folio_xchg_access_time(folio,
>>   			jiffies_to_msecs(jiffies));
>> @@ -159,6 +168,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
>>   	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
>>   	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
>> +	int nr;
>>   
>>   	tlb_change_page_size(tlb, PAGE_SIZE);
>>   	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>> @@ -173,8 +183,10 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   	flush_tlb_batched_pending(vma->vm_mm);
>>   	arch_enter_lazy_mmu_mode();
>>   	do {
>> +		nr = 1;
> 
> 'nr' resets each iteration.
> 
>>   		oldpte = ptep_get(pte);
>>   		if (pte_present(oldpte)) {
>> +			int max_nr = (end - addr) >> PAGE_SHIFT;
> 
> Small nit - 'max_nr' declaration could be moved earlier along with 'nr'.

Sure.

> 
>>   			pte_t ptent;
>>   
>>   			/*
>> @@ -182,8 +194,9 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   			 * pages. See similar comment in change_huge_pmd.
>>   			 */
>>   			if (prot_numa &&
>> -			    prot_numa_avoid_fault(vma, addr,
>> -						  oldpte, target_node))
>> +			    prot_numa_avoid_fault(vma, addr, pte,
>> +						  oldpte, target_node,
>> +							  max_nr, &nr))
>>   					continue;
>>   
>>   			oldpte = ptep_modify_prot_start(vma, addr, pte);
>> @@ -300,7 +313,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>>   				pages++;
>>   			}
>>   		}
>> -	} while (pte++, addr += PAGE_SIZE, addr != end);
>> +	} while (pte += nr, addr += nr * PAGE_SIZE, addr != end);
>>   	arch_leave_lazy_mmu_mode();
>>   	pte_unmap_unlock(pte - 1, ptl);
>>   
> 
> Otherwise LGTM


