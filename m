Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CA5CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 06:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESeptom+XdILDBZ1SV9z+qsZLUlrAdxL/MtsJa3zQY8=; b=V9RexfoQREvC4NL5snasqHK1rN
	HYnh5QUcXL2mxJToaZASZM0hcQscznHPfli/Qqgus7oBFgMvebKDiaC+GBQlXJTCtTLD4hO3Fxp3V
	WePuKB3v69NqWTzBgReJoL2lWHcLWj7wOzQJ3sMrQvS6EF4pS/yHmMfGBzi7XB2RvPrEmfCiQAjBU
	0Y/8HFIf9Ac41VPZFaSvxc+hz2V/vSx+t60OI4ZDsF8eJ3US1DQ8OxNOyT7EOCGZx8LDCh8l19gnR
	3F15XRATCO3xkSBqnqNCsa/RKiQJDiQNFqrEJUsmhFXqCLb70eSodOy+Fk/faESRSdJY1TXLGk/WX
	vl96seVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGs5t-0000000EaBK-1UVf;
	Wed, 14 Oct 2026 06:04:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGs5n-0000000EaAc-024o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 06:04:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98CEA15A1;
	Tue, 13 Oct 2026 23:03:52 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D3F03F7B4;
	Tue, 13 Oct 2026 23:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791957835; bh=a+ePuoScWznFCdZL7kuuIwctTxuRzsdaAnI868FjqvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NGFOsBqQlkYzYRc6c9oeI62OwONXctPXAWs1X+w9O0ZGSX08mzBFLCRloqvuXoEcs
	 l+RKSocjuhfxG9ajTVLYRvJo74qsxS3Fa4vk2551oznUYNciNmnhrtaKCzGd4OvWLE
	 xxJq6dznjLsg4ngtYlAUgjw44+L1Kvxk1pfNNxrY=
Message-ID: <7b3c3a39-4cf3-430d-9fd3-ba83e5175e72@arm.com>
Date: Wed, 14 Oct 2026 11:33:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 01/10] arm64/mm: add pte_set_huge() and
 pte_clear_huge()
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, chleroy@kernel.org, david@kernel.org,
 jiangwen6@xiaomi.com, leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-2-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261002090947.869220-2-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_230359_231634_EE2EC8B2 
X-CRM114-Status: GOOD (  21.82  )
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



On 02/10/26 2:39 pm, Wen Jiang wrote:
> vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
> set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
> helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
> unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
> HugeTLB internals it does not otherwise need.
> 
> Add pte_set_huge()/pte_clear_huge() to arm64, joining the existing
> pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
> __set_ptes() and __get_and_clear_full_ptes() directly, so they do not
> depend on CONFIG_HUGETLB_PAGE.
> 
> There is no caller yet: mm/vmalloc.c is converted later in this series,
> once the generic fallbacks are in place.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---
>  arch/arm64/include/asm/pgtable.h |  6 ++++++
>  arch/arm64/mm/mmu.c              | 23 +++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 6000905a2e865..9b762eb68cff0 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1978,6 +1978,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
>  
>  #endif /* CONFIG_ARM64_CONTPTE */
>  
> +#define __HAVE_ARCH_PTE_SET_HUGE
> +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> +		  pgprot_t prot, unsigned long size);
> +#define __HAVE_ARCH_PTE_CLEAR_HUGE
> +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
> +
>  #endif /* !__ASSEMBLER__ */
>  
>  #endif /* __ASM_PGTABLE_H */
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 79d90226fd5dc..ae2f15618c97d 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1912,6 +1912,29 @@ int pmd_clear_huge(pmd_t *pmdp)
>  	return 1;
>  }
>  
> +void pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
> +		  pgprot_t prot, unsigned long size)
> +{
> +	unsigned long pfn = __phys_to_pfn(phys);
> +	pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
> +	unsigned int nr = size >> PAGE_SHIFT;
> +
> +	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
> +	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
> +	VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
> +
> +	/* For vmap, there is no valid -> valid transition */
> +	VM_WARN_ON(pte_valid(__ptep_get(ptep)));
> +
> +	__set_ptes(&init_mm, addr, ptep, pte, nr);
> +}
> +
> +pte_t pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
> +{
> +	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
> +					 size >> PAGE_SHIFT, 0);
> +}

I think we should have the same VM_WARN_ON() checks here, as for
pte_clear_huge(), in addition to also warning for
current->mm != &init_mm.

We should make it clear that pte_clear_huge() gets called only for
kernel mappings, and the range we operate on is definitely an aligned
CONT range - which is why we do not go through get_and_clear_full_ptes ->
contpte_get_and_clear_full_ptes, and possibly contpte_try_unfold(), but
directly use __get_and_clear_full_ptes.


> +
>  int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>  {
>  	pte_t *table;


