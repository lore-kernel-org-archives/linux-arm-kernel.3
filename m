Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DFCC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijWZ94PEdJ/Gl8UXsp1oF+QtTyP5rdSwXjSmQfL4z54=; b=aQj6rM1hAMyadsRBD9v2JSOSrI
	VbH1E+LIiHcgIBL7K8olcnGZiHhLZpar1jObJp/MSKO6meOTJHREkVvesU4q36RDIffDeVOdUOkMq
	GFz/uhdjxLnJMRLokmz9nr2bKk9veKa4QAklzVhMgSX72qnJu7z354Co3JMYaL82VNJTt/ddDGwF9
	prQvPvwPMzaLDAfxm4L6vX47FLq1FKv0Bxh8QutbkuSdHZ/HqgdaCH80KwJPdbviMSJy0EJbxskhz
	lbOz+T5q02DAdsnrSTLg+PFONe8WZfuLoFYGAm9Ymdmc4ZOgfP28Q7n+HEAlCA2OqW83HP1dL63ZE
	3RIm7bNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0bh-0000000BpL8-1NG1;
	Wed, 30 Apr 2025 06:07:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA0Kb-0000000BnTd-2x6h
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 05:50:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ijWZ94PEdJ/Gl8UXsp1oF+QtTyP5rdSwXjSmQfL4z54=; b=bctz2IQKTpkJMRIe/STUav+1sL
	XTy0vzI11KUk+xbjeQ4yOkwW7fWuPQn/ALB7Bc3e++wHB1uXFcHh7g93oHXv0fC49Axmnnusy43XT
	N2VKYTPVVaiseiuMAH69Wyfuh7F6ZV1+COID6FxFNRq6d+1Dmsf8DnMqMTWe0LyKlnduJd0QMYcH2
	ZwpGIdfD+yHjh076Y2SolReDtDKeDLqC9zBtYtqKf9knWeBEqMniB5I3lroZt5cBnYnYjacnps9C2
	uQFm1MjaVk0JU4g3go/z6Bu9f4w357wLZCCXx+CGoO4cSzK7BgcyIuaIj+6mWK/U6THtVp9PbC9vE
	UcoPcGxQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA0KY-0000000DhkC-0Uwu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:50:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3902106F;
	Tue, 29 Apr 2025 22:49:53 -0700 (PDT)
Received: from [10.163.79.251] (unknown [10.163.79.251])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 327DD3F5A1;
	Tue, 29 Apr 2025 22:49:50 -0700 (PDT)
Message-ID: <5eebef24-6c98-4407-a4f1-5a97f08b76a4@arm.com>
Date: Wed, 30 Apr 2025 11:19:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] arm64: Add batched version of
 ptep_modify_prot_start
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
 <20250429052336.18912-5-dev.jain@arm.com>
 <e2c10562-2504-434f-9239-32d67955a9af@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e2c10562-2504-434f-9239-32d67955a9af@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_065002_729684_979311CA 
X-CRM114-Status: GOOD (  16.65  )
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



On 30/04/25 11:13 am, Anshuman Khandual wrote:
> On 4/29/25 10:53, Dev Jain wrote:
>> Override the generic definition to use get_and_clear_full_ptes(), so that
>> we do a TLBI possibly only on the "contpte-edges" of the large PTE block,
>> instead of doing it for every contpte block, which happens for ptep_get_and_clear().
> 
> Could you please explain what does "contpte-edges" really signify in the
> context of large PTE blocks ? Also how TLBI operation only on these edges
> will never run into the risk of missing TLB invalidation of some other
> mapped areas ?

We are doing a TLBI over the whole range already, in the mprotect code:
see tlb_flush_pte_range. What the arm64 internal API does, irrespective 
of the caller, is to do a TLBI for every contpte block in case of 
unfolding. We don't need that for the intermediate blocks because the 
caller does that. We do need a TLBI for the start and end contpte block,
because in case the range we are invalidating partially covers them, 
then the caller will not do a TLBI for the non-overlapped PTEs of the block.
I'll explain some more in the changelog next version.

> 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/include/asm/pgtable.h |  5 +++++
>>   arch/arm64/mm/mmu.c              | 12 +++++++++---
>>   include/linux/pgtable.h          |  4 ++++
>>   mm/pgtable-generic.c             | 16 +++++++++++-----
>>   4 files changed, 29 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 2a77f11b78d5..8872ea5f0642 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1553,6 +1553,11 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
>>   				    unsigned long addr, pte_t *ptep,
>>   				    pte_t old_pte, pte_t new_pte);
>>   
>> +#define modify_prot_start_ptes modify_prot_start_ptes
>> +extern pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
>> +				    unsigned long addr, pte_t *ptep,
>> +				    unsigned int nr);
>> +
>>   #ifdef CONFIG_ARM64_CONTPTE
>>   
>>   /*
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8fcf59ba39db..fe60be8774f4 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1523,7 +1523,8 @@ static int __init prevent_bootmem_remove_init(void)
>>   early_initcall(prevent_bootmem_remove_init);
>>   #endif
>>   
>> -pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>> +pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
>> +			     pte_t *ptep, unsigned int nr)
>>   {
>>   	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_2645198)) {
>>   		/*
>> @@ -1532,9 +1533,14 @@ pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte
>>   		 * in cases where cpu is affected with errata #2645198.
>>   		 */
>>   		if (pte_user_exec(ptep_get(ptep)))
>> -			return ptep_clear_flush(vma, addr, ptep);
>> +			return clear_flush_ptes(vma, addr, ptep, nr);
>>   	}
>> -	return ptep_get_and_clear(vma->vm_mm, addr, ptep);
>> +	return get_and_clear_full_ptes(vma->vm_mm, addr, ptep, nr, 0);
>> +}
>> +
>> +pte_t ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
>> +{
>> +	return modify_prot_start_ptes(vma, addr, ptep, 1);
>>   }
>>   
>>   void ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index ed287289335f..10cdb87ccecf 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -828,6 +828,10 @@ extern pte_t ptep_clear_flush(struct vm_area_struct *vma,
>>   			      pte_t *ptep);
>>   #endif
>>   
>> +extern pte_t clear_flush_ptes(struct vm_area_struct *vma,
>> +			      unsigned long address,
>> +			      pte_t *ptep, unsigned int nr);
>> +
>>   #ifndef __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
>>   extern pmd_t pmdp_huge_clear_flush(struct vm_area_struct *vma,
>>   			      unsigned long address,
>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>> index 5a882f2b10f9..e238f88c3cac 100644
>> --- a/mm/pgtable-generic.c
>> +++ b/mm/pgtable-generic.c
>> @@ -90,17 +90,23 @@ int ptep_clear_flush_young(struct vm_area_struct *vma,
>>   }
>>   #endif
>>   
>> -#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
>> -pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
>> -		       pte_t *ptep)
>> +pte_t clear_flush_ptes(struct vm_area_struct *vma, unsigned long address,
>> +		       pte_t *ptep, unsigned int nr)
>>   {
>>   	struct mm_struct *mm = (vma)->vm_mm;
>>   	pte_t pte;
>> -	pte = ptep_get_and_clear(mm, address, ptep);
>> +	pte = get_and_clear_full_ptes(mm, address, ptep, nr, 0);
>>   	if (pte_accessible(mm, pte))
>> -		flush_tlb_page(vma, address);
>> +		flush_tlb_range(vma, address, address + nr * PAGE_SIZE);
>>   	return pte;
>>   }
>> +
>> +#ifndef __HAVE_ARCH_PTEP_CLEAR_FLUSH
>> +pte_t ptep_clear_flush(struct vm_area_struct *vma, unsigned long address,
>> +		       pte_t *ptep)
>> +{
>> +	return clear_flush_ptes(vma, address, ptep, 1);
>> +}
>>   #endif
>>   
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE


