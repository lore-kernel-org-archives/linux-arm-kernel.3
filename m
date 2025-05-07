Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC73C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfmaKna1zw+Vl0ylf8mn/XLxLigYO8GUUluXG8i3Gi4=; b=4M732ttAUfTucX2a7N/HbRGkXG
	gVQRFRHKVbYtBArDsfW9bNfhJhbq6LPUnu/9zQJxgPSQKMAHPquictmQ4FwqMEXtrDjpMt8ZyXye1
	LEY5S2DOJJMLQiLfwe4AfEwfgI6aXE42/dehLDk39RqJLmKpm+poYrcpAKBxqYuGhLystovVqdMt0
	fimLXaKcz6RSVgqQwpTMwLrSt/wisNlXx0gEbkizEI38skFHChNNdwVcP+Ay30Pt5I3Q69m2ABJgY
	en/dDMNs3sCiTU4+SihQtzQBC/PY/0F0h18aZtpb85Us8zRD+dQX4Mdg8tUSn8bR+Xg39cHkYsd8H
	qGqgrK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCatW-0000000Etge-3Fb8;
	Wed, 07 May 2025 09:16:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZzD-0000000Ehgi-0UY7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 08:18:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F013339;
	Wed,  7 May 2025 01:18:28 -0700 (PDT)
Received: from [10.1.26.133] (unknown [10.1.26.133])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 999E43F5A1;
	Wed,  7 May 2025 01:18:36 -0700 (PDT)
Message-ID: <a7518be7-aa0d-4e2e-bc1b-6ac10328e8fc@arm.com>
Date: Wed, 7 May 2025 09:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 3/6] arm64: mm: make __create_pgd_mapping() and helpers
 non-void
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <20250304222018.615808-4-yang@os.amperecomputing.com>
 <172bf7a8-4533-4627-83d2-552e4681c360@arm.com>
 <2b715836-b566-4a9e-b344-9401fa4c0feb@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <2b715836-b566-4a9e-b344-9401fa4c0feb@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_011839_245547_38E75308 
X-CRM114-Status: GOOD (  24.71  )
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

On 17/03/2025 17:53, Yang Shi wrote:
> 
> 
> On 3/14/25 4:51 AM, Ryan Roberts wrote:
>> On 04/03/2025 22:19, Yang Shi wrote:
>>> The later patch will enhance __create_pgd_mapping() and related helpers
>>> to split kernel linear mapping, it requires have return value.  So make
>>> __create_pgd_mapping() and helpers non-void functions.
>>>
>>> And move the BUG_ON() out of page table alloc helper since failing
>>> splitting kernel linear mapping is not fatal and can be handled by the
>>> callers in the later patch.  Have BUG_ON() after
>>> __create_pgd_mapping_locked() returns to keep the current callers behavior
>>> intact.
>>>
>>> Suggested-by: Ryan Roberts<ryan.roberts@arm.com>
>>> Signed-off-by: Yang Shi<yang@os.amperecomputing.com>
>>> ---
>>>   arch/arm64/mm/mmu.c | 127 ++++++++++++++++++++++++++++++--------------
>>>   1 file changed, 86 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index b4df5bc5b1b8..dccf0877285b 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -189,11 +189,11 @@ static void init_pte(pte_t *ptep, unsigned long addr,
>>> unsigned long end,
>>>       } while (ptep++, addr += PAGE_SIZE, addr != end);
>>>   }
>>>   -static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>> -                unsigned long end, phys_addr_t phys,
>>> -                pgprot_t prot,
>>> -                phys_addr_t (*pgtable_alloc)(int),
>>> -                int flags)
>>> +static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>> +                   unsigned long end, phys_addr_t phys,
>>> +                   pgprot_t prot,
>>> +                   phys_addr_t (*pgtable_alloc)(int),
>>> +                   int flags)
>>>   {
>>>       unsigned long next;
>>>       pmd_t pmd = READ_ONCE(*pmdp);
>>> @@ -208,6 +208,8 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned
>>> long addr,
>>>               pmdval |= PMD_TABLE_PXN;
>>>           BUG_ON(!pgtable_alloc);
>>>           pte_phys = pgtable_alloc(PAGE_SHIFT);
>>> +        if (!pte_phys)
>>> +            return -ENOMEM;
>> nit: personally I'd prefer to see a "goto out" and funnel all to a single return
>> statement. You do that in some functions (via loop break), but would be cleaner
>> if consistent.
>>
>> If pgtable_alloc() is modified to return int (see my comment at the bottom),
>> this becomes:
>>
>> ret = pgtable_alloc(PAGE_SHIFT, &pte_phys);
>> if (ret)
>>     goto out;
> 
> OK
> 
>>>           ptep = pte_set_fixmap(pte_phys);
>>>           init_clear_pgtable(ptep);
>>>           ptep += pte_index(addr);
>>> @@ -239,13 +241,16 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned
>>> long addr,
>>>        * walker.
>>>        */
>>>       pte_clear_fixmap();
>>> +
>>> +    return 0;
>>>   }
>>>   -static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>> -             phys_addr_t phys, pgprot_t prot,
>>> -             phys_addr_t (*pgtable_alloc)(int), int flags)
>>> +static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>> +            phys_addr_t phys, pgprot_t prot,
>>> +            phys_addr_t (*pgtable_alloc)(int), int flags)
>>>   {
>>>       unsigned long next;
>>> +    int ret = 0;
>>>         do {
>>>           pmd_t old_pmd = READ_ONCE(*pmdp);
>>> @@ -264,22 +269,27 @@ static void init_pmd(pmd_t *pmdp, unsigned long addr,
>>> unsigned long end,
>>>               BUG_ON(!pgattr_change_is_safe(pmd_val(old_pmd),
>>>                                 READ_ONCE(pmd_val(*pmdp))));
>>>           } else {
>>> -            alloc_init_cont_pte(pmdp, addr, next, phys, prot,
>>> +            ret = alloc_init_cont_pte(pmdp, addr, next, phys, prot,
>>>                           pgtable_alloc, flags);
>>> +            if (ret)
>>> +                break;
>>>                 BUG_ON(pmd_val(old_pmd) != 0 &&
>>>                      pmd_val(old_pmd) != READ_ONCE(pmd_val(*pmdp)));
>>>           }
>>>           phys += next - addr;
>>>       } while (pmdp++, addr = next, addr != end);
>>> +
>>> +    return ret;
>>>   }
>>>   -static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>>> -                unsigned long end, phys_addr_t phys,
>>> -                pgprot_t prot,
>>> -                phys_addr_t (*pgtable_alloc)(int), int flags)
>>> +static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>>> +                   unsigned long end, phys_addr_t phys,
>>> +                   pgprot_t prot,
>>> +                   phys_addr_t (*pgtable_alloc)(int), int flags)
>>>   {
>>>       unsigned long next;
>>> +    int ret = 0;
>>>       pud_t pud = READ_ONCE(*pudp);
>>>       pmd_t *pmdp;
>>>   @@ -295,6 +305,8 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned
>>> long addr,
>>>               pudval |= PUD_TABLE_PXN;
>>>           BUG_ON(!pgtable_alloc);
>>>           pmd_phys = pgtable_alloc(PMD_SHIFT);
>>> +        if (!pmd_phys)
>>> +            return -ENOMEM;
>>>           pmdp = pmd_set_fixmap(pmd_phys);
>>>           init_clear_pgtable(pmdp);
>>>           pmdp += pmd_index(addr);
>>> @@ -314,21 +326,26 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned
>>> long addr,
>>>               (flags & NO_CONT_MAPPINGS) == 0)
>>>               __prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>>   -        init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
>>> +        ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
>>> +        if (ret)
>>> +            break;
>>>             pmdp += pmd_index(next) - pmd_index(addr);
>>>           phys += next - addr;
>>>       } while (addr = next, addr != end);
>>>         pmd_clear_fixmap();
>>> +
>>> +    return ret;
>>>   }
>>>   -static void alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long
>>> end,
>>> -               phys_addr_t phys, pgprot_t prot,
>>> -               phys_addr_t (*pgtable_alloc)(int),
>>> -               int flags)
>>> +static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>> +              phys_addr_t phys, pgprot_t prot,
>>> +              phys_addr_t (*pgtable_alloc)(int),
>>> +              int flags)
>>>   {
>>>       unsigned long next;
>>> +    int ret = 0;
>>>       p4d_t p4d = READ_ONCE(*p4dp);
>>>       pud_t *pudp;
>>>   @@ -340,6 +357,8 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long
>>> addr, unsigned long end,
>>>               p4dval |= P4D_TABLE_PXN;
>>>           BUG_ON(!pgtable_alloc);
>>>           pud_phys = pgtable_alloc(PUD_SHIFT);
>>> +        if (!pud_phys)
>>> +            return -ENOMEM;
>>>           pudp = pud_set_fixmap(pud_phys);
>>>           init_clear_pgtable(pudp);
>>>           pudp += pud_index(addr);
>>> @@ -369,8 +388,10 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long
>>> addr, unsigned long end,
>>>               BUG_ON(!pgattr_change_is_safe(pud_val(old_pud),
>>>                                 READ_ONCE(pud_val(*pudp))));
>>>           } else {
>>> -            alloc_init_cont_pmd(pudp, addr, next, phys, prot,
>>> +            ret = alloc_init_cont_pmd(pudp, addr, next, phys, prot,
>>>                           pgtable_alloc, flags);
>>> +            if (ret)
>>> +                break;
>>>                 BUG_ON(pud_val(old_pud) != 0 &&
>>>                      pud_val(old_pud) != READ_ONCE(pud_val(*pudp)));
>>> @@ -379,14 +400,17 @@ static void alloc_init_pud(p4d_t *p4dp, unsigned long
>>> addr, unsigned long end,
>>>       } while (pudp++, addr = next, addr != end);
>>>         pud_clear_fixmap();
>>> +
>>> +    return ret;
>>>   }
>>>   -static void alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long
>>> end,
>>> -               phys_addr_t phys, pgprot_t prot,
>>> -               phys_addr_t (*pgtable_alloc)(int),
>>> -               int flags)
>>> +static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>>> +              phys_addr_t phys, pgprot_t prot,
>>> +              phys_addr_t (*pgtable_alloc)(int),
>>> +              int flags)
>>>   {
>>>       unsigned long next;
>>> +    int ret = 0;
>>>       pgd_t pgd = READ_ONCE(*pgdp);
>>>       p4d_t *p4dp;
>>>   @@ -398,6 +422,8 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long
>>> addr, unsigned long end,
>>>               pgdval |= PGD_TABLE_PXN;
>>>           BUG_ON(!pgtable_alloc);
>>>           p4d_phys = pgtable_alloc(P4D_SHIFT);
>>> +        if (!p4d_phys)
>>> +            return -ENOMEM;
>>>           p4dp = p4d_set_fixmap(p4d_phys);
>>>           init_clear_pgtable(p4dp);
>>>           p4dp += p4d_index(addr);
>>> @@ -412,8 +438,10 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long
>>> addr, unsigned long end,
>>>             next = p4d_addr_end(addr, end);
>>>   -        alloc_init_pud(p4dp, addr, next, phys, prot,
>>> +        ret = alloc_init_pud(p4dp, addr, next, phys, prot,
>>>                      pgtable_alloc, flags);
>>> +        if (ret)
>>> +            break;
>>>             BUG_ON(p4d_val(old_p4d) != 0 &&
>>>                  p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
>>> @@ -422,23 +450,26 @@ static void alloc_init_p4d(pgd_t *pgdp, unsigned long
>>> addr, unsigned long end,
>>>       } while (p4dp++, addr = next, addr != end);
>>>         p4d_clear_fixmap();
>>> +
>>> +    return ret;
>>>   }
>>>   -static void __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>>> -                    unsigned long virt, phys_addr_t size,
>>> -                    pgprot_t prot,
>>> -                    phys_addr_t (*pgtable_alloc)(int),
>>> -                    int flags)
>>> +static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>>> +                       unsigned long virt, phys_addr_t size,
>>> +                       pgprot_t prot,
>>> +                       phys_addr_t (*pgtable_alloc)(int),
>>> +                       int flags)
>>>   {
>>>       unsigned long addr, end, next;
>>>       pgd_t *pgdp = pgd_offset_pgd(pgdir, virt);
>>> +    int ret = 0;
>>>         /*
>>>        * If the virtual and physical address don't have the same offset
>>>        * within a page, we cannot map the region as the caller expects.
>>>        */
>>>       if (WARN_ON((phys ^ virt) & ~PAGE_MASK))
>>> -        return;
>>> +        return -EINVAL;
>>>         phys &= PAGE_MASK;
>>>       addr = virt & PAGE_MASK;
>>> @@ -446,29 +477,38 @@ static void __create_pgd_mapping_locked(pgd_t *pgdir,
>>> phys_addr_t phys,
>>>         do {
>>>           next = pgd_addr_end(addr, end);
>>> -        alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
>>> +        ret = alloc_init_p4d(pgdp, addr, next, phys, prot, pgtable_alloc,
>>>                      flags);
>>> +        if (ret)
>>> +            break;
>>>           phys += next - addr;
>>>       } while (pgdp++, addr = next, addr != end);
>>> +
>>> +    return ret;
>>>   }
>>>   -static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>>> -                 unsigned long virt, phys_addr_t size,
>>> -                 pgprot_t prot,
>>> -                 phys_addr_t (*pgtable_alloc)(int),
>>> -                 int flags)
>>> +static int __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>>> +                unsigned long virt, phys_addr_t size,
>>> +                pgprot_t prot,
>>> +                phys_addr_t (*pgtable_alloc)(int),
>>> +                int flags)
>>>   {
>>> +    int ret;
>>> +
>>>       mutex_lock(&fixmap_lock);
>>> -    __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
>>> +    ret = __create_pgd_mapping_locked(pgdir, phys, virt, size, prot,
>>>                       pgtable_alloc, flags);
>>> +    BUG_ON(ret);
>> This function now returns an error, but also BUGs on ret!=0. For this patch, I'd
>> suggest keeping this function as void.
> 
> You mean __create_pgd_mapping(), right?

Yes.

> 
>> But I believe there is a pre-existing bug in arch_add_memory(). That's called at
>> runtime so if __create_pgd_mapping() fails and BUGs, it will take down a running
>> system.
> 
> Yes, it is the current behavior.
> 
>> With this foundational patch, we can fix that with an additional patch to pass
>> along the error code instead of BUGing in that case. arch_add_memory() would
>> need to unwind whatever __create_pgd_mapping() managed to do before the memory
>> allocation failure (presumably unmapping and freeing any allocated tables). I'm
>> happy to do this as a follow up patch.
> 
> Yes, the allocated page tables need to be freed. Thank you for taking it.

Given the conversation in the other thread about generalizing to also eventually
support vmalloc, I'm not sure you need to be able to return errors from this
walker for your usage now? I think you will only use this walker for the case
where you need to repaint to page mappings after determining that a secondary
CPU does not support BBML2? If that fails, the system is dead anyway, so
continuing to BUG() is probably acceptable?

So perhaps you could drop this patch from your series? If so, then I'll reuse
the patch to fix the theoretical hotplug bug (when I get to it) and will keep
your authorship.

> 
>>>       mutex_unlock(&fixmap_lock);
>>> +
>>> +    return ret;
>>>   }
>>>     #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>>>   extern __alias(__create_pgd_mapping_locked)
>>> -void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long
>>> virt,
>>> -                 phys_addr_t size, pgprot_t prot,
>>> -                 phys_addr_t (*pgtable_alloc)(int), int flags);
>>> +int create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
>>> +                phys_addr_t size, pgprot_t prot,
>>> +                phys_addr_t (*pgtable_alloc)(int), int flags);
>> create_kpti_ng_temp_pgd() now returns error instead of BUGing on allocation
>> failure, but I don't see a change to handle that error. You'll want to update
>> __kpti_install_ng_mappings() to BUG on error.
> 
> Yes, I missed that. It should BUG on error.
> 
>>>   #endif
>>>     static phys_addr_t __pgd_pgtable_alloc(int shift)
>>> @@ -476,13 +516,17 @@ static phys_addr_t __pgd_pgtable_alloc(int shift)
>>>       /* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
>>>       void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);
>>>   -    BUG_ON(!ptr);
>>> +    if (!ptr)
>>> +        return 0;
>> 0 is a valid (though unlikely) physical address. I guess you could technically
>> encode like ERR_PTR(), but since you are returning phys_addr_t and not a
>> pointer, then perhaps it will be clearer to make this return int and accept a
>> pointer to a phys_addr_t, which it will populate on success?
> 
> Actually I did something similar in the first place, but just returned the virt
> address. Then did something if it returns NULL. That made the code a little more
> messy since we need convert the virt address to phys address because
> __create_pgd_mapping() and the helpers require phys address, and changed the
> functions definition.
> 
> But I noticed 0 should be not a valid phys address if I remember correctly. 

0 is definitely a valid physical address. We even have examples of real Arm
boards that have RAM at physical address 0. See [1].

[1] https://lore.kernel.org/lkml/ad8ed3ba-12e8-3031-7c66-035b6d9ad6cd@arm.com/

> I
> also noticed early_pgtable_alloc() calls memblock_phys_alloc_range(), it returns
> 0 on failure. If 0 is valid phys address, then it should not do that, right? 

Well perhaps memblock will just refuse to give you RAM at address 0. That's a
bad design choice in my opinion. But the buddy will definitely give out page 0
if it is RAM. -1 would be a better choice for an error sentinel.

> And
> I also noticed the memblock range 0 - memstart_addr is actually removed from
> memblock (see arm64_memblock_init()), so IIUC 0 should be not valid phys
> address. So the patch ended up being as is.

But memstart_addr could be 0, so in that case you don't actually remove anything?

> 
> If this assumption doesn't stand, I think your suggestion makes sense.

Perhaps the simpler approach is to return -1 on error. That's never going to be
valid because the maximum number of address bits on the physical bus is 56.

> 
>>> +
>>>       return __pa(ptr);
>>>   }
>>>     static phys_addr_t pgd_pgtable_alloc(int shift)
>>>   {
>>>       phys_addr_t pa = __pgd_pgtable_alloc(shift);
>>> +    if (!pa)
>>> +        goto out;
>> This would obviously need to be fixed up as per above.
>>
>>>       struct ptdesc *ptdesc = page_ptdesc(phys_to_page(pa));
>>>         /*
>>> @@ -498,6 +542,7 @@ static phys_addr_t pgd_pgtable_alloc(int shift)
>>>       else if (shift == PMD_SHIFT)
>>>           BUG_ON(!pagetable_pmd_ctor(ptdesc));
>>>   +out:
>>>       return pa;
>>>   }
>>>   
>> You have left early_pgtable_alloc() to panic() on allocation failure. Given we
>> can now unwind the stack with error code, I think it would be more consistent to
>> also allow early_pgtable_alloc() to return error.
> 
> The early_pgtable_alloc() is just used for painting linear mapping at early boot
> stage, if it fails I don't think unwinding the stack is feasible and worth it.
> Did I miss something?

Personally I'd just prefer it all to be consistent. But I agree there is no big
benefit. Anyway, like I said above, I'm not sure you need to worry about
unwinding the stack at all given the approach we agreed in the other thread?

Thanks,
Ryan

> 
> Thanks,
> Yang
> 
>> Thanks,
>> Ryan
>>
> 


