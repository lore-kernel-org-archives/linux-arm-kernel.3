Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC40CCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6d1ZGliYPhieSuvjGZO3kxTg3x67TSdLveb34MEzAE=; b=Pq+QBrb56qJiGLLccl2FnKMPBy
	WGMbcwH2QakNVkUTttr0mYmQHzixy1xGIUSdq1iD5ZsoR3kxuOnI9nbdbii1n74au4PXgnLT0dLnx
	2BzGtr7hppw8UNyCfFduznKiOZ3XMnD2WbPf/Po66aopjpYA0LYUwvo4OHemW92ovIjXjdZjQLh7E
	QwJLr7sCUQxNHnZEV7T2WGFMnJjOJwpurSHnjOhknesOKMSnv4z5p7BRQlpR2BXlyRyqfPO83FN/I
	a4gRVJsvMA43PIo8bWZBNCMlIbI4+vJ34/YxrUY3PiyGgvJKsDtnNXNCXy/C5aqnH6MEO6jSbv/up
	GuJ6r5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGurO-0000000ExmN-1axl;
	Wed, 14 Oct 2026 09:01:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGurN-0000000Exm9-02Mq
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w6d1ZGliYPhieSuvjGZO3kxTg3x67TSdLveb34MEzAE=; b=LArHMBSI0H7/aOpZCD/u0ecNpx
	SwjUM0GkQ+gYY/JAHEq7CZ2ZAHs9xOO3onWLdoH1uupI/cifoEF7T9fA5pn+YWsUvV4WbDrwyWR3t
	JsLb8w5YxRNmD7dGnVv8Of5jYHeoUlN0+vqPIoHCBDQ0cyabNjbyz6I4ZlC02LzTVMZCtUMONn5Ka
	XkOuREEFXj1uFgEin6h4zKTt528O44k3jcCMs/wuf9De2SaSMY29hNAmPaq7yDDlk+bYIAh/CXPQW
	WdsxxEvJgI7debi8EN+I5IQ2UpBCCHZq6K+mimlhLHh/2ltefApo0LYyal9Zy3EyxjKmWb98UY5yx
	zXuuTjTg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGurJ-0000000GXD3-2xz0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:01:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 865661596;
	Wed, 14 Oct 2026 02:01:07 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9B7A3F7B4;
	Wed, 14 Oct 2026 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791968470; bh=rara4mkQth8pYyWlFJvWmDaJu5z0cXsBOp7HoWDPrJE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pQFtufiMGehtJM9AcAsnwXLGqTJECDqjyuBHqaMUB/gJ0L3WUOI5EUTEsk2dHjdsf
	 R99tb64LVgVWafMjWaPf3mdnd4dVDS58qabNcRdPk/FvmuqeNwUiGSRcWLC3RtnKhS
	 UFcMMAZVO7L2zOSVKereOgmlQX/zL1pbdiQBv3Ng=
Message-ID: <e0354457-8ca4-474d-b8cc-0ba843be8897@arm.com>
Date: Wed, 14 Oct 2026 14:31:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] arm64/mm: add pte_set_huge() and
 pte_clear_huge()
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
 ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
 chleroy@kernel.org, david@kernel.org, jiangwen6@xiaomi.com, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-2-jiangwen6@xiaomi.com>
 <7b3c3a39-4cf3-430d-9fd3-ba83e5175e72@arm.com>
 <CAHKocdFOoDhjcuWXJatQ-AbSXyXuV+Q=sA1-iGiGrp7vhHZMBQ@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAHKocdFOoDhjcuWXJatQ-AbSXyXuV+Q=sA1-iGiGrp7vhHZMBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_100114_326840_AEF42EE2 
X-CRM114-Status: GOOD (  27.33  )
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



On 14/10/26 2:16 pm, Wen Jiang wrote:
> On Wed, 14 Oct 2026 at 14:03, Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 02/10/26 2:39 pm, Wen Jiang wrote:
>>> vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
>>> set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
>>> helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
>>> unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
>>> HugeTLB internals it does not otherwise need.
>>>
>>> Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
>>> pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
>>> __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
>>> depend on CONFIG_HUGETLB_PAGE.
>>>
>>> There is no caller yet: mm/vmalloc.c is converted later in this series,
>>> once the generic fallbacks are in place.
>>>
>>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
>>> Reviewed-by: Barry Song <baohua@kernel.org>
>>> ---
>>>  arch/arm64/include/asm/pgtable.h |  6 ++++++
>>>  arch/arm64/mm/mmu.c              | 23 +++++++++++++++++++++++
>>>  2 files changed, 29 insertions(+)
>>>
>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>> index 6000905a2e865..9b762eb68cff0 100644
>>> --- a/arch/arm64/include/asm/pgtable.h
>>> +++ b/arch/arm64/include/asm/pgtable.h
>>> @@ -1978,6 +1978,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
>>>
>>>  #endif /* CONFIG_ARM64_CONTPTE */
>>>
>>> +#define __HAVE_ARCH_PTE_SET_HUGE
>>> +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
>>> +               pgprot_t prot, unsigned long size);
>>> +#define __HAVE_ARCH_PTE_CLEAR_HUGE
>>> +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
>>> +
>>>  #endif /* !__ASSEMBLER__ */
>>>
>>>  #endif /* __ASM_PGTABLE_H */
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 79d90226fd5dc..ae2f15618c97d 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -1912,6 +1912,29 @@ int pmd_clear_huge(pmd_t *pmdp)
>>>       return 1;
>>>  }
>>>
>>> +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
>>> +               pgprot_t prot, unsigned long size)
>>> +{
>>> +     unsigned long pfn = __phys_to_pfn(phys);
>>> +     pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
>>> +     unsigned int nr = size >> PAGE_SHIFT;
>>> +
>>> +     VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
>>> +     VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
>>> +     VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
>>> +
>>> +     /* For vmap, there is no valid -> valid transition */
>>> +     VM_WARN_ON(pte_valid(__ptep_get(ptep)));
>>> +
>>> +     __set_ptes(&init_mm, addr, ptep, pte, nr);
>>> +}
>>> +
>>> +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
>>> +{
>>> +     return __get_and_clear_full_ptes(&init_mm, addr, ptep,
>>> +                                      size >> PAGE_SHIFT, 0);
>>> +}
>>
>> I think we should have the same VM_WARN_ON() checks here, as for
>> pte_clear_huge(), in addition to also warning for
>> current->mm != &init_mm.
>>
>> We should make it clear that pte_clear_huge() gets called only for
>> kernel mappings, and the range we operate on is definitely an aligned
>> CONT range - which is why we do not go through get_and_clear_full_ptes ->
>> contpte_get_and_clear_full_ptes, and possibly contpte_try_unfold(), but
>> directly use __get_and_clear_full_ptes.
>>
> 
> Hi Dev,
> 
> I'll add the alignment VM_WARN_ON() checks to pte_clear_huge() to
> match pte_set_huge().
> 
> Regarding the current->mm != &init_mm check: these functions don't take
> an mm parameter -- &init_mm is hardcoded in the function body.
> current->mm would never equal &init_mm in practice: for user processes it
> points to the process's own mm, and for kernel threads it is NULL.
> So VM_WARN_ON(current->mm != &init_mm) would always fire.

Right.


> 
> The existing hugetlb helpers that vmalloc used before this decoupling
> (huge_ptep_get_and_clear -> get_clear_contig) also take mm as a
> parameter
> and don't check current->mm either -- the caller simply passes &init_mm.
> 
> How about adding a comment to make the "kernel mapping only" intent
> more explicit?
> Something like:

I think then we should just call the functions vmap_pte_set_huge and
vmap_pte_clear_huge. In arm64 we have init_pte() which sets the cont bit
at init time for kernel mappings. So to differentiate I think we should
prefix the function name by vmap.


> 
>  pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
>  {
> +       /* Kernel mappings only */
> +
> +       VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
> +       VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
> +
>         return __get_and_clear_full_ptes(&init_mm, addr, ptep,
>                                          size >> PAGE_SHIFT, 0);
>  }
> 
> Thanks,
> Wen


