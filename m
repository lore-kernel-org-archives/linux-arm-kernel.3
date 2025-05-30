Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A590C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tq7LVwqxa1FduznDb8QjxTKP/j5xIKuVkMfMvE87Bqw=; b=EstHuiN1gTnZgThuY/7lxE17K0
	hegd/xVOqYbMnx3CdcPjvHSxbYulZMzYp3AYloI9RA/SAAsjginraPSR/JbLwmqPyWLXnE9uSrpwO
	zhAy/Gn7bmMHxnX2IbkwhX3lZ5JkL9Z1bwRIAyKkaYsOdYUu2A5aTHGBXZNyvc7DtQubWx3jPrXno
	/MLuo2W86Vbmu09k8lfMYQmt4uQ86jkbi5mwg2MCNNplJQ7XPjB1FodjC2EtC9UAV8BAdD7vEkxFb
	S3HDvFyrD9lbriOM+IgPXAb9SpJQcTJniA/FC18GMqT4lO9V971zlQTOLMEfNvao3UeW5GppeK2HR
	j/BAA2iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwOJ-00000000DPk-1v1r;
	Fri, 30 May 2025 09:51:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKwKr-00000000Cu1-2zUO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:47:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86A5E16F2;
	Fri, 30 May 2025 02:47:16 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CD193F5A1;
	Fri, 30 May 2025 02:47:31 -0700 (PDT)
Message-ID: <6280e181-9f05-4aa0-9fe7-23d4e86000e5@arm.com>
Date: Fri, 30 May 2025 10:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
 <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <832e84a9-4303-4e21-a88b-94395898fa3e@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_024733_847647_6916EA3C 
X-CRM114-Status: GOOD (  29.41  )
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

On 30/05/2025 10:14, Dev Jain wrote:
> 
> On 30/05/25 2:10 pm, Ryan Roberts wrote:
>> On 30/05/2025 09:20, Dev Jain wrote:
>>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>>> because an intermediate table may be removed, potentially causing the
>>> ptdump code to dereference an invalid address. We want to be able to
>>> analyze block vs page mappings for kernel mappings with ptdump, so to
>>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>>> use mmap_read_lock and not write lock because we don't need to synchronize
>>> between two different vm_structs; two vmalloc objects running this same
>>> code path will point to different page tables, hence there is no race.
> 
> My "correction" from race->no problem was incorrect after all :) There will
> be no race too since the vm_struct object has exclusive access to whatever
> table it is clearing.
> 
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>   arch/arm64/include/asm/vmalloc.h | 6 ++----
>>>   arch/arm64/mm/mmu.c              | 7 +++++++
>>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>>> index 38fafffe699f..28b7173d8693 100644
>>> --- a/arch/arm64/include/asm/vmalloc.h
>>> +++ b/arch/arm64/include/asm/vmalloc.h
>>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>>>       /*
>>>        * SW table walks can't handle removal of intermediate entries.
>>>        */
>>> -    return pud_sect_supported() &&
>>> -           !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>> +    return pud_sect_supported();
>>>   }
>>>     #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>>>   static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>>   {
>>> -    /* See arch_vmap_pud_supported() */
>>> -    return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>>> +    return true;
>>>   }
>>>     #endif
>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>> index ea6695d53fb9..798cebd9e147 100644
>>> --- a/arch/arm64/mm/mmu.c
>>> +++ b/arch/arm64/mm/mmu.c
>>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>>       }
>>>         table = pte_offset_kernel(pmdp, addr);
>>> +
>>> +    /* Synchronize against ptdump_walk_pgd() */
>>> +    mmap_read_lock(&init_mm);
>>>       pmd_clear(pmdp);
>>> +    mmap_read_unlock(&init_mm);
>> So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
>> exclusive with any read_lock holders) for the duration of the table walk, so it
>> will either consistently see the pgtables before or after this removal. It will
>> never disappear during the walk, correct?
>>
>> I guess there is a risk of this showing up as contention with other init_mm
>> write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
>> are called sufficiently rarely that the risk is very small. Let's fix any perf
>> problem if/when we see it.
> 
> We can avoid all of that by my initial approach - to wrap the lock around
> CONFIG_PTDUMP_DEBUGFS.
> I don't have a strong opinion, just putting it out there.
> 
>>
>>>       __flush_tlb_kernel_pgtable(addr);
>> And the tlbi doesn't need to be serialized because there is no security issue.
>> The walker can be trusted to only dereference memory that it sees as it walks
>> the pgtable (obviously).
>>
>>>       pte_free_kernel(NULL, table);
>>>       return 1;
>>> @@ -1289,7 +1293,10 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>           pmd_free_pte_page(pmdp, next);
>>>       } while (pmdp++, next += PMD_SIZE, next != end);
>>>   +    /* Synchronize against ptdump_walk_pgd() */
>>> +    mmap_read_lock(&init_mm);
>>>       pud_clear(pudp);
>>> +    mmap_read_unlock(&init_mm);
>> Hmm, so pud_free_pmd_page() is now going to cause us to acquire and release the
>> (upto) lock 513 times (for a 4K kernel). I wonder if there is an argument for
>> clearing the pud first (under the lock), then the pmds can all be cleared
>> without a lock, since the walker won't be able to see the pmds once the pud is
>> cleared.
> 
> Yes, we can isolate the PMD table in case the caller of pmd_free_pte_page is
> pud_free_pmd_page. In this case, vm_struct_1 has exclusive access to the entire
> pmd page, hence no race will occur. But, in case of vmap_try_huge_pmd() being the
> caller, we cannot drop the locks around pmd_free_pte_page. So we can have something
> like
> 
> #ifdef CONFIG_PTDUMP_DEBUGFS
> static inline void ptdump_synchronize_lock(bool flag)
> {
>     if (flag)
>         mmap_read_lock(&init_mm);
> }
> 
> and pass false when the caller is pud_free_pmd_page.

of something like this? (completely untested):

---8<---
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8fcf59ba39db..1f3a922167e4 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1267,7 +1267,7 @@ int pmd_clear_huge(pmd_t *pmdp)
        return 1;
 }

-int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
+static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
 {
        pte_t *table;
        pmd_t pmd;
@@ -1280,12 +1280,23 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
        }

        table = pte_offset_kernel(pmdp, addr);
+
+       if (lock)
+               mmap_read_lock(&init_mm);
        pmd_clear(pmdp);
+       if (lock)
+               mmap_read_unlock(&init_mm);
+
        __flush_tlb_kernel_pgtable(addr);
        pte_free_kernel(NULL, table);
        return 1;
 }

+int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
+{
+       return __pmd_free_pte_page(pmdp, addr, true);
+}
+
 int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 {
        pmd_t *table;
@@ -1300,15 +1311,19 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
                return 1;
        }

+       /* Synchronize against ptdump_walk_pgd() */
+       mmap_read_lock(&init_mm);
+       pud_clear(pudp);
+       mmap_read_unlock(&init_mm);
+
        table = pmd_offset(pudp, addr);
        pmdp = table;
        next = addr;
        end = addr + PUD_SIZE;
        do {
-               pmd_free_pte_page(pmdp, next);
+               __pmd_free_pte_page(pmdp, next, false);
        } while (pmdp++, next += PMD_SIZE, next != end);

-       pud_clear(pudp);
        __flush_tlb_kernel_pgtable(addr);
        pmd_free(NULL, table);
        return 1;
---8<---



> 
>>
>> Thanks,
>> Ryan
>>
>>>       __flush_tlb_kernel_pgtable(addr);
>>>       pmd_free(NULL, table);
>>>       return 1;


