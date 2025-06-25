Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3871C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=po0a08otrP2LEr4MV2MGd/dogw0KshJM/3HFHhb2nko=; b=sLurySpSGSJ2lR7yi7HXognibY
	nMruPbaojZfIej2jaSWqCbQFuRS7hpDRqHg6vsK5B/iQwhdr2CaJFHWEmsxPvpM+tt04Tsn05zpEK
	yu4Ekpf13VOtT+DqB5Xdy9cL37GF1muzgLOmTs+02PBNZZy9MfUqQVmMW8HgcFazy6Z+/9FSr6ssy
	ZBXZfbTZKK4p4gZkbLzz8ss3lICLiu9H/m7HlFTP//JSb2ShKAEGScdThX7YIFcW3g/BlpWJJwg0+
	q8pJw9OLCYj/2Fgi81QZEmv/SUi/B37Truc+vti9hoIpd7SARrRL3iO9u+uaPZds2WVOIxJRE1yfE
	LVgu2MAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURNK-000000090iJ-02yx;
	Wed, 25 Jun 2025 14:45:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO78-00000008Rdf-024w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:16:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13A48106F;
	Wed, 25 Jun 2025 04:16:07 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A61D3F58B;
	Wed, 25 Jun 2025 04:16:23 -0700 (PDT)
Message-ID: <79677ade-3743-4663-8699-08a069ecdf09@arm.com>
Date: Wed, 25 Jun 2025 12:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <01b48f6c-81cf-499c-97f7-0b537364c5e7@arm.com>
 <805f60c7-9c76-4adc-a679-658d60e08a3e@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <805f60c7-9c76-4adc-a679-658d60e08a3e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_041626_124694_9EBC391A 
X-CRM114-Status: GOOD (  27.74  )
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

On 25/06/2025 12:12, Dev Jain wrote:
> 
> On 25/06/25 4:05 pm, Ryan Roberts wrote:
>> On 16/06/2025 11:33, Dev Jain wrote:
>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>> because an intermediate table may be removed, potentially causing the
>>> ptdump code to dereference an invalid address. We want to be able to
>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>> between two different vm_structs; two vmalloc objects running this same
>>> code path will point to different page tables, hence there is no race.
>>>
>>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>>> 512 times again via pmd_free_pte_page().
>>>
>>> We implement the locking mechanism using static keys, since the chance
>>> of a race is very small. Observe that the synchronization is needed
>>> to avoid the following race:
>>>
>>> CPU1                            CPU2
>>>                         take reference of PMD table
>>> pud_clear()
>>> pte_free_kernel()
>>>                         walk freed PMD table
>>>
>>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>>
>>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>>> we are safe. If not, then the patched-in read and write locks help us
>>> avoid the race.
>>>
>>> To implement the mechanism, we need the static key access from mmu.c and
>>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>>> target in the Makefile, therefore we cannot initialize the key there, as
>>> is being done, for example, in the static key implementation of
>>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>>> the jump_label mechanism. Declare the key there and define the key to false
>>> in mmu.c.
>>>
>>> No issues were observed with mm-selftests. No issues were observed while
>>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>>> sysfs in a loop.
>>>
>>> v2->v3:
>>>   - Use static key mechanism
>>>
>>> v1->v2:
>>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>>     the lock 512 times again via pmd_free_pte_page()
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   arch/arm64/include/asm/cpufeature.h |  1 +
>>>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>>   arch/arm64/mm/ptdump.c              |  5 +++
>>>   3 files changed, 53 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/
>>> cpufeature.h
>>> index c4326f1cb917..3e386563b587 100644
>>> --- a/arch/arm64/include/asm/cpufeature.h
>>> +++ b/arch/arm64/include/asm/cpufeature.h
>>> @@ -26,6 +26,7 @@
>>>   #include <linux/kernel.h>
>>>   #include <linux/cpumask.h>
>>>   +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
>> Is this really the correct header file for this declaration? Perhaps it would be
>> better in arch/arm64/include/asm/ptdump.h ?
> 
> I tried a lot of things; this didn't work. I get the following:
> 
> ld: arch/arm64/mm/mmu.o:(__jump_table+0x8): undefined reference to
> `ptdump_lock_key'
> ld: arch/arm64/mm/mmu.o:(__jump_table+0x48): undefined reference to
> `ptdump_lock_key'
> 
> in case of !CONFIG_PTDUMP_DEBUGFS.

I think you're talking about *defining*. I'm talking about *declaring*. By all
means define it in mmu.c. Then you always have it. But the declaration doesn't
need to live in cpufeature.h does it? Why can't it live in ptdump.h? The
declaration is just a compiler directive really; it doesn't control the output
of any symbols.

> 
>>
>>>   /*
>>>    * CPU feature register tracking
>>>    *
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index 8fcf59ba39db..e242ba428820 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -41,11 +41,14 @@
>>>   #include <asm/tlbflush.h>
>>>   #include <asm/pgalloc.h>
>>>   #include <asm/kfence.h>
>>> +#include <asm/cpufeature.h>
>>>     #define NO_BLOCK_MAPPINGS    BIT(0)
>>>   #define NO_CONT_MAPPINGS    BIT(1)
>>>   #define NO_EXEC_MAPPINGS    BIT(2)    /* assumes FEAT_HPDS is not used */
>>>   +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>>> +
>>>   enum pgtable_type {
>>>       TABLE_PTE,
>>>       TABLE_PMD,
>>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>>>       return 1;
>>>   }
>>>   -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>>>   {
>>> +    bool lock_taken = false;
>> As David commented, no need for this.
>>
>>>       pte_t *table;
>>>       pmd_t pmd;
>>>   @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>           return 1;
>>>       }
>>>   +    /* See comment in pud_free_pmd_page for static key logic */
>>>       table = pte_offset_kernel(pmdp, addr);
>>>       pmd_clear(pmdp);
>>>       __flush_tlb_kernel_pgtable(addr);
>>> +    if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>>> +        mmap_read_lock(&init_mm);
>>> +        lock_taken = true;
>>> +    }
>>> +    if (unlikely(lock_taken))
>>> +        mmap_read_unlock(&init_mm);
>>> +
>> As per David's comment this can just be:
>>
>> if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>>     mmap_read_lock(&init_mm);
>>     mmap_read_unlock(&init_mm);
>> }
>>
>>>       pte_free_kernel(NULL, table);
>>>       return 1;
>>>   }
>>>   +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>> +{
>>> +    return __pmd_free_pte_page(pmdp, addr, true);
>>> +}
>>> +
>>>   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>   {
>>> +    bool lock_taken = false;
>> Same comment.
>>
>>>       pmd_t *table;
>>>       pmd_t *pmdp;
>>>       pud_t pud;
>>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>       }
>>>         table = pmd_offset(pudp, addr);
>>> +    /*
>>> +     * Isolate the PMD table; in case of race with ptdump, this helps
>>> +     * us to avoid taking the lock in __pmd_free_pte_page().
>>> +     *
>>> +     * Static key logic:
>>> +     *
>>> +     * Case 1: If ptdump does static_branch_enable(), and after that we
>>> +     * execute the if block, then this patches in the read lock, ptdump has
>>> +     * the write lock patched in, therefore ptdump will never read from
>>> +     * a potentially freed PMD table.
>>> +     *
>>> +     * Case 2: If the if block starts executing before ptdump's
>>> +     * static_branch_enable(), then no locking synchronization
>>> +     * will be done. However, pud_clear() + the dsb() in
>>> +     * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
>>> +     * empty PUD. Thus, it will never walk over a potentially freed
>>> +     * PMD table.
>>> +     */
>>> +    pud_clear(pudp);
>>> +    __flush_tlb_kernel_pgtable(addr);
>>> +    if (static_branch_unlikely(&ptdump_lock_key)) {
>>> +        mmap_read_lock(&init_mm);
>>> +        lock_taken = true;
>>> +    }
>>> +    if (unlikely(lock_taken))
>>> +        mmap_read_unlock(&init_mm);
>> Same comment.
>>
>>> +
>>>       pmdp = table;
>>>       next = addr;
>>>       end = addr + PUD_SIZE;
>>>       do {
>>> -        pmd_free_pte_page(pmdp, next);
>>> +        __pmd_free_pte_page(pmdp, next, false);
>>>       } while (pmdp++, next += PMD_SIZE, next != end);
>>>   -    pud_clear(pudp);
>>> -    __flush_tlb_kernel_pgtable(addr);
>>>       pmd_free(NULL, table);
>>>       return 1;
>>>   }
>>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>>> index 421a5de806c6..f75e12a1d068 100644
>>> --- a/arch/arm64/mm/ptdump.c
>>> +++ b/arch/arm64/mm/ptdump.c
>>> @@ -25,6 +25,7 @@
>>>   #include <asm/pgtable-hwdef.h>
>>>   #include <asm/ptdump.h>
>>>   +#include <asm/cpufeature.h>
>>>     #define pt_dump_seq_printf(m, fmt, args...)    \
>>>   ({                        \
>>> @@ -311,7 +312,9 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info
>>> *info)
>>>           }
>>>       };
>>>   +    static_branch_enable(&ptdump_lock_key);
>>>       ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
>>> +    static_branch_disable(&ptdump_lock_key);
>>>   }
>>>     static void __init ptdump_initialize(void)
>>> @@ -353,7 +356,9 @@ bool ptdump_check_wx(void)
>>>           }
>>>       };
>>>   +    static_branch_enable(&ptdump_lock_key);
>>>       ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
>>> +    static_branch_disable(&ptdump_lock_key);
>>>         if (st.wx_pages || st.uxn_pages) {
>>>           pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu
>>> non-UXN pages found\n",
>>
>> With the improvements as suggested, LGTM:
>>
>> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>>
>>


