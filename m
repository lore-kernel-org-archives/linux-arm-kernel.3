Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F374C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKim8kq2UcQv3AdJOy1pzLDJwBHCUlr5VmBNQA75egI=; b=K7pEQsGK119cMFyoiLJOVpP3az
	eDrAE3fzgsFGjurNp7taHw7ki8fx2rcyeC7d3wBDGKttcMK7lHodIC5YJXNDjwL8GfHvIm1vriKPX
	3YedPP9f9pmArVal06OvEDZzBpivxxAbBT5mTFKItnGAWRUIcHTVss2aGAOEEvWPvYCU2ErxwE/YF
	1l4N7YqCL4DxoEP//Uy156MpJjKo2UxX+2IYCq0R/Wx7qIgubf59isL9BViiVcqjgmWmZiGiiT7E1
	qh10rIX+9E1Z3MN/FI7YP/aa2V2WJRRNnuVcEZ4Apzv9zc+b7ulmkQwNgK8jdCeOkCb+OKZn3u55r
	JFp6xDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4r0t-0000000FiUT-1TzB;
	Fri, 11 Sep 2026 02:29:15 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4r0q-0000000FiSv-0j2S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:29:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iKim8kq2UcQv3AdJOy1pzLDJwBHCUlr5VmBNQA75egI=;
	b=2Hvm0k0+Seq9+L+MbnBhx642OnRFM63sm2eTVymTB7e/pZzRepOVZG26wJySjv/IjxeLvj40j
	/espzGvsEWLeTqr0HEsiaYsuJmhg0Ygl1G5YVgZXF2Y8KhLV5AUApbHVpXWg8MGL974Y17AdBQo
	BJ6Qa4A9ZXPkGO6bLqotPog=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hgyr16gfqz1prlJ;
	Fri, 11 Sep 2026 10:17:53 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id CFE684057A;
	Fri, 11 Sep 2026 10:28:50 +0800 (CST)
Received: from [10.174.178.9] (10.174.178.9) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 10:28:49 +0800
Message-ID: <5cb48654-8d77-4525-9854-5823934ae0e8@huawei.com>
Date: Fri, 11 Sep 2026 10:28:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: define generic pudp_invalidate() implementation
To: "David Hildenbrand (Arm)" <david@kernel.org>, <akpm@linux-foundation.org>,
	<ljs@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mark.rutland@arm.com>, <ryan.roberts@arm.com>, <peterx@redhat.com>,
	<dave.jiang@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
References: <20260909090018.1991485-1-tujinjiang@huawei.com>
 <20260909090018.1991485-2-tujinjiang@huawei.com>
 <6fb6b2b8-daae-4707-aa98-c2c447782a44@kernel.org>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <6fb6b2b8-daae-4707-aa98-c2c447782a44@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.9]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_192912_847419_85BAE6D8 
X-CRM114-Status: GOOD (  18.33  )
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


在 2026/9/9 18:24, David Hildenbrand (Arm) 写道:
> On 9/9/26 11:00, Jinjiang Tu wrote:
>> x86 and riscv have identical pudp_invalidate() implementations. Move it to
>> mm/pgtable-generic.c with the __HAVE_ARCH_PUDP_INVALIDATE override guard.
>> PowerPC keeps its own implementation. In the later patch, arm64 will use
>> the generic implementation too.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/pgtable.h |  1 +
>>   arch/riscv/include/asm/pgtable.h             |  3 ---
>>   arch/riscv/mm/pgtable.c                      |  9 ---------
>>   arch/x86/include/asm/pgtable.h               |  3 ---
>>   arch/x86/mm/pgtable.c                        | 12 ------------
>>   include/linux/pgtable.h                      |  7 +++++++
>>   mm/pgtable-generic.c                         | 14 ++++++++++++++
>>   7 files changed, 22 insertions(+), 27 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index f4db7d7fbd5c..55d33c5537f1 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -1419,6 +1419,7 @@ static inline pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm,
>>   #define __HAVE_ARCH_PMDP_INVALIDATE
>>   extern pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
>>   			     pmd_t *pmdp);
>> +#define __HAVE_ARCH_PUDP_INVALIDATE
>>   extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
>>   			     pud_t *pudp);
>>   
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 40b1ed4f3ea8..327fa378032b 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -1159,9 +1159,6 @@ static inline pud_t pud_mkinvalid(pud_t pud)
>>   	return __pud(pud_val(pud) & ~(_PAGE_PRESENT | _PAGE_PROT_NONE));
>>   }
>>   
>> -extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
>> -			     pud_t *pudp);
>> -
>>   static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
>>   {
>>   	return pte_pud(pte_modify(pud_pte(pud), newprot));
>> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
>> index 9c4427d0b187..156e385e7db4 100644
>> --- a/arch/riscv/mm/pgtable.c
>> +++ b/arch/riscv/mm/pgtable.c
>> @@ -154,15 +154,6 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>>   	return pmd;
>>   }
>>   
>> -pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
>> -		      pud_t *pudp)
>> -{
>> -	VM_WARN_ON_ONCE(!pud_present(*pudp));
>> -	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
>> -
>> -	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
>> -	return old;
>> -}
>>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>>   
>>   pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
>> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
>> index d5f4917c1edc..97051c02385e 100644
>> --- a/arch/x86/include/asm/pgtable.h
>> +++ b/arch/x86/include/asm/pgtable.h
>> @@ -1387,9 +1387,6 @@ static inline pud_t pudp_establish(struct vm_area_struct *vma,
>>   extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
>>   				unsigned long address, pmd_t *pmdp);
>>   
>> -pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
>> -		      pud_t *pudp);
>> -
>>   /*
>>    * Page table pages are page-aligned.  The lower half of the top
>>    * level is used for userspace and the top half for the kernel.
>> diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
>> index cb03f5a2b243..0945908631dc 100644
>> --- a/arch/x86/mm/pgtable.c
>> +++ b/arch/x86/mm/pgtable.c
>> @@ -519,18 +519,6 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
>>   }
>>   #endif
>>   
>> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
>> -	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
>> -pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
>> -		     pud_t *pudp)
>> -{
>> -	VM_WARN_ON_ONCE(!pud_present(*pudp));
>> -	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
>> -	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
>> -	return old;
>> -}
>> -#endif
>> -
>>   /**
>>    * reserve_top_address - Reserve a hole in the top of the kernel address space
>>    * @reserve: Size of hole to reserve
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 8c093c119e5a..32173005b087 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1318,6 +1318,13 @@ extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
>>   				unsigned long address, pmd_t *pmdp);
>>   #endif
>>   
>> +#ifndef __HAVE_ARCH_PUDP_INVALIDATE
>> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>> +extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
>> +			     pud_t *pudp);
> No "extern" please.

Will update it.

>
> Staring at this file, I do wonder why we are not smarter about combining blocks. E.g., here simply:'

Do you mean merging all #ifdef CONFIG_TRANSPARENT_HUGEPAGE blocks? There are many of them scattered
across include/linux/pgtable.h and arch/arm64/include/asm/pgtable.h. They are intentionally kept
separate to group the PTE, PMD, and PUD level variants of the same operation together. For example,
ptep_set_access_flags, pmdp_set_access_flags, and pudp_set_access_flags are placed adjacently.

>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e3c8ab96941c5..8c9fe3bf580d4 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1229,9 +1229,9 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>   }
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>   #endif
> -#ifndef __HAVE_ARCH_PUDP_SET_WRPROTECT
> -#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> +#ifndef __HAVE_ARCH_PUDP_SET_WRPROTECT
>   static inline void pudp_set_wrprotect(struct mm_struct *mm,
>                                        unsigned long address, pud_t *pudp)
>   {
> @@ -1245,9 +1245,13 @@ static inline void pudp_set_wrprotect(struct mm_struct *mm,
>   {
>          BUILD_BUG();
>   }
> -#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> -#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
>   #endif
> +#ifndef __HAVE_ARCH_PUDP_INVALIDATE
> +pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> +               pud_t *pudp);
> +#endif
> +#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
> +#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>
>> +#endif
>> +#endif
>> +
>>   #ifndef __HAVE_ARCH_PTE_SAME
>>   static inline int pte_same(pte_t pte_a, pte_t pte_b)
>>   {
>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>> index b91b1a98029c..ac1175d9a59a 100644
>> --- a/mm/pgtable-generic.c
>> +++ b/mm/pgtable-generic.c
>> @@ -217,6 +217,20 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
>>   }
>>   #endif
>>   
>> +#ifndef __HAVE_ARCH_PUDP_INVALIDATE
>> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> I'd revert these and similarly see if they can be combined somehow (likely combining with
> pudp_huge_clear_flush is harder as we are quite inconsistent with it, gluing it to
> __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH).
>
> Which raises the question whether we could also piggy-back on __HAVE_ARCH_PMDP_SET_WRPROTECT
> (I suspect no without a closer look.)
>

