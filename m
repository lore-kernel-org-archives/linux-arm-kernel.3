Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773E1C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFvF+mtUiE+9ps3e/vI5zg3N3dw3jOUXPhsKcH7x38A=; b=rLs5XVcV42Y0EblO2dhFtwKEEF
	8aw7UOU0tHDqVqgUIADY0eoEjfdkBLgmZWTQl52XgsJpEq1e4tBTf7DAHCs0/z3q0qr3gLry/MVPe
	9dUyF1MooqG2hJcyTjVcNIXMB6BHwkCBU+0XKWJVmquvgAAbC+gAgu5rkmVteN4/HZPvf3J1uzCWz
	jwEtHtjfp5cd+UHzDaaAaoVyb1JHqNZHgozONE48E5hz8Qt2EWKyj9qZCAZvuC+Vjk5geow2zYbeN
	08eyRN+6x1T6AdG/NYWZDk2iVmzYi7cccRwlDsqhWWEMgkN2CVb361UssXJ9sJnI3h5Iq2lf3IOOe
	CON1aXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvKN-000000001yx-1mLN;
	Fri, 30 May 2025 08:42:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvIF-000000001pH-0ZpC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 08:40:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEFB21691;
	Fri, 30 May 2025 01:40:29 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABF6D3F694;
	Fri, 30 May 2025 01:40:44 -0700 (PDT)
Message-ID: <d2b63b97-232e-4d2e-816b-71fd5b0ffcfa@arm.com>
Date: Fri, 30 May 2025 09:40:42 +0100
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250530082021.18182-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_014047_273163_40211CA6 
X-CRM114-Status: GOOD (  24.06  )
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

On 30/05/2025 09:20, Dev Jain wrote:
> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> because an intermediate table may be removed, potentially causing the
> ptdump code to dereference an invalid address. We want to be able to
> analyze block vs page mappings for kernel mappings with ptdump, so to
> enable vmalloc-huge with ptdump, synchronize between page table removal in
> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> use mmap_read_lock and not write lock because we don't need to synchronize
> between two different vm_structs; two vmalloc objects running this same
> code path will point to different page tables, hence there is no race. 
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/include/asm/vmalloc.h | 6 ++----
>  arch/arm64/mm/mmu.c              | 7 +++++++
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
> index 38fafffe699f..28b7173d8693 100644
> --- a/arch/arm64/include/asm/vmalloc.h
> +++ b/arch/arm64/include/asm/vmalloc.h
> @@ -12,15 +12,13 @@ static inline bool arch_vmap_pud_supported(pgprot_t prot)
>  	/*
>  	 * SW table walks can't handle removal of intermediate entries.
>  	 */
> -	return pud_sect_supported() &&
> -	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> +	return pud_sect_supported();
>  }
>  
>  #define arch_vmap_pmd_supported arch_vmap_pmd_supported
>  static inline bool arch_vmap_pmd_supported(pgprot_t prot)
>  {
> -	/* See arch_vmap_pud_supported() */
> -	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
> +	return true;
>  }
>  
>  #endif
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index ea6695d53fb9..798cebd9e147 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1261,7 +1261,11 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>  	}
>  
>  	table = pte_offset_kernel(pmdp, addr);
> +
> +	/* Synchronize against ptdump_walk_pgd() */
> +	mmap_read_lock(&init_mm);
>  	pmd_clear(pmdp);
> +	mmap_read_unlock(&init_mm);

So this works because ptdump_walk_pgd() takes the write_lock (which is mutually
exclusive with any read_lock holders) for the duration of the table walk, so it
will either consistently see the pgtables before or after this removal. It will
never disappear during the walk, correct?

I guess there is a risk of this showing up as contention with other init_mm
write_lock holders. But I expect that pmd_free_pte_page()/pud_free_pmd_page()
are called sufficiently rarely that the risk is very small. Let's fix any perf
problem if/when we see it.

>  	__flush_tlb_kernel_pgtable(addr);

And the tlbi doesn't need to be serialized because there is no security issue.
The walker can be trusted to only dereference memory that it sees as it walks
the pgtable (obviously).

>  	pte_free_kernel(NULL, table);
>  	return 1;
> @@ -1289,7 +1293,10 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>  		pmd_free_pte_page(pmdp, next);
>  	} while (pmdp++, next += PMD_SIZE, next != end);
>  
> +	/* Synchronize against ptdump_walk_pgd() */
> +	mmap_read_lock(&init_mm);
>  	pud_clear(pudp);
> +	mmap_read_unlock(&init_mm);

Hmm, so pud_free_pmd_page() is now going to cause us to acquire and release the
(upto) lock 513 times (for a 4K kernel). I wonder if there is an argument for
clearing the pud first (under the lock), then the pmds can all be cleared
without a lock, since the walker won't be able to see the pmds once the pud is
cleared.

Thanks,
Ryan

>  	__flush_tlb_kernel_pgtable(addr);
>  	pmd_free(NULL, table);
>  	return 1;


