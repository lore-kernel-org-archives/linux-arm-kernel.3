Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AA5C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4taA8ifIIfvxRNHMgaG5ZelTZRNIMgPDJEIMG15cYe8=; b=udaE2gOztZ3FKQLo7tX/1+mlTc
	hEnPjF5JIE1O2CmRkM2xLa7r25++HVAkRiaJbQVQpgpmxgepBXI7XImtUgK9qh5aiQvSVAVePk9J6
	NBSYXMoH0NYpPBAytOGx3fmnQ5Q0Kw/F1TVTuE9lOxGevLRw2lZUZkVfMIkUVVhsIDvFcaUw2umJZ
	ZImWPmOlfVgMT0Xfy/BB6b9s2CM4Fbd0xV0jmQQxLKrHpn8dv4TIZFIm9bgkEe9ZojXioLDWZDHsk
	z4tMa6lJTAohX4Ygl8A9M3XbZ0uCh+/dJarLeUFk4lATpjd9fN9u+bTBPTE0ON5a2FlpIt4ca5Eeo
	f0jR856w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvpp-000000005cg-1zMX;
	Fri, 30 May 2025 09:15:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvi6-000000004js-11yf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:07:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63F6F16F2;
	Fri, 30 May 2025 02:07:11 -0700 (PDT)
Received: from [10.164.18.46] (a077893.blr.arm.com [10.164.18.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AC7B3F5A1;
	Fri, 30 May 2025 02:07:24 -0700 (PDT)
Message-ID: <9b605943-cac0-447f-9cd0-286a45a937c4@arm.com>
Date: Fri, 30 May 2025 14:37:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Enable vmalloc-huge with ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250530082021.18182-1-dev.jain@arm.com>
 <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_020730_377414_D161F3CC 
X-CRM114-Status: GOOD (  26.82  )
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

On 5/30/25 14:10, Ryan Roberts wrote:
> On 30/05/2025 09:20, Dev Jain wrote:
>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>> because an intermediate table may be removed, potentially causing the
>> ptdump code to dereference an invalid address. We want to be able to
>> analyze block vs page mappings for kernel mappings with ptdump, so to
>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>> use mmap_read_lock and not write lock because we don't need to synchronize
>> between two different vm_structs; two vmalloc objects running this same
>> code path will point to different page tables, hence there is no race. 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>  arch/arm64/include/asm/vmalloc.h | 6 ++----
>>  arch/arm64/mm/mmu.c              | 7 +++++++
>>  2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
>> index 38fafffe699f..28b7173d8693 100644
>> --- a/arch/arm64/include/asm/vmalloc.h
>> +++ b/arch/arm64/include/asm/vmalloc.h
>> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>>  	/*
>>  	 * SW table walks can't handle removal of intermediate entries.
>>  	 */
>> -	return pud_sect_supported() &&
>> -	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>> +	return pud_sect_supported();
>>  }
>>  
>>  #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>>  static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>>  {
>> -	/* See arch_vmap_pud_supported() */
>> -	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
>> +	return true;
>>  }
>>  
>>  #endif
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index ea6695d53fb9..798cebd9e147 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>  	}
>>  
>>  	table = pte_offset_kernel(pmdp, addr);
>> +
>> +	/* Synchronize against ptdump_walk_pgd() */
>> +	mmap_read_lock(&init_mm);
>>  	pmd_clear(pmdp);
>> +	mmap_read_unlock(&init_mm);
> 
> So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
> exclusive with any read_lock holders) for the duration of the table walk, so it
> will either consistently see the pgtables before or after this removal. It will
> never disappear during the walk, correct?

Agreed.

> 
> I guess there is a risk of this showing up as contention with other init_mm
> write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
> are called sufficiently rarely that the risk is very small. Let's fix any perf
> problem if/when we see it.

Checking against CONFIG_PTDUMP_DEBUGFS being enabled is simple enough without much
cost. So why not make this conditional only for scenarios, where this read lock is
really required. Something like

--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1293,11 +1293,15 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
                pmd_free_pte_page(pmdp, next);
        } while (pmdp++, next += PMD_SIZE, next != end);
 
-       /* Synchronize against ptdump_walk_pgd() */
-       mmap_read_lock(&init_mm);
-       pud_clear(pudp);
-       mmap_read_unlock(&init_mm);
        __flush_tlb_kernel_pgtable(addr);
+       if (IS_ENABLED(CONFIG_PTDUMP_DEBUGFS)) {
+               /* Synchronize against ptdump_walk_pgd() */
+               mmap_read_lock(&init_mm);
+               pud_clear(pudp);
+               mmap_read_unlock(&init_mm);
+       } else {
+               pud_clear(pudp);
+       }
        pmd_free(NULL, table);
        return 1;
 }

> 
>>  	__flush_tlb_kernel_pgtable(addr);
> 
> And the tlbi doesn't need to be serialized because there is no security issue.
> The walker can be trusted to only dereference memory that it sees as it walks
> the pgtable (obviously).

Agreed.

> 
>>  	pte_free_kernel(NULL, table);
>>  	return 1;
>> @@ -1289,7 +1293,10 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>  		pmd_free_pte_page(pmdp, next);
>>  	} while (pmdp++, next += PMD_SIZE, next != end);
>>  
>> +	/* Synchronize against ptdump_walk_pgd() */
>> +	mmap_read_lock(&init_mm);
>>  	pud_clear(pudp);
>> +	mmap_read_unlock(&init_mm);
> 
> Hmm, so pud_free_pmd_page() is now going to cause us to acquire and release the
> (upto) lock 513 times (for a 4K kernel). I wonder if there is an argument for
> clearing the pud first (under the lock), then the pmds can all be cleared
> without a lock, since the walker won't be able to see the pmds once the pud is
> cleared.

Makes sense if pud_free_pmd_page() would have been the only caller but seems like
vmap_try_huge_pmd() calls pmd_free_pte_page() directly as well.

> 
> Thanks,
> Ryan
> 
>>  	__flush_tlb_kernel_pgtable(addr);
>>  	pmd_free(NULL, table);
>>  	return 1;
> 

