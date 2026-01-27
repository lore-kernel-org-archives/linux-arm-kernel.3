Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42BAD2D8E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0uKuz8DhJcRlYZ7R2g5qvdtCu9tCFTf1JQPUKPU4ww=; b=0BVPi127TqjkhVx0CRmKe0ggsg
	sUFfE/7fAZAIgbQoiyeoV4IncAhtWi/uYLhqqY7GBAhd2kR/wS2R8ah5vfhadO8BsBmFZZIt6FWsL
	S8n8nYs54hMVWsSkKfW1gQr70xh5VmJ/xxaOTNiZc8YIrLKQsfibRNUT3bwQVtEO40/zChhmin+xV
	HRktmzUsqoO3KrUiLyu+yGwU8DwrdQ2/HXuND7rSJ4cHaIfZEfW6+EiYn0HrTzP8eLTGoGxLvllTG
	4wBNNFVNjjS3XOf4N7OLEdkBnctGSGlMEbVnDNKLOjcs8t5dixHwOWHWTN+EJXsfchpzNWlMDnHP+
	iwIDxrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfqT-0000000E0UQ-0gai;
	Tue, 27 Jan 2026 09:58:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfqQ-0000000E0TT-3DBr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:58:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08D921595;
	Tue, 27 Jan 2026 01:58:39 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8DA33F73F;
	Tue, 27 Jan 2026 01:58:43 -0800 (PST)
Message-ID: <1f4fcb81-7b29-4e7d-b2af-5fb06f4faaa2@arm.com>
Date: Tue, 27 Jan 2026 09:58:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/10] arm64: mm: Preserve non-contiguous descriptors
 when mapping DRAM
Content-Language: en-GB
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Ard Biesheuvel <ardb@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-17-ardb+git@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260126092630.1800589-17-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_015846_941867_3224CE4A 
X-CRM114-Status: GOOD (  19.98  )
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

On 26/01/2026 09:26, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Instead of blindly overwriting existing live entries with the contiguous
> bit cleared when mapping DRAM regions, check whether the contiguous
> region in question starts with a descriptor that has the valid bit set
> and the contiguous bit cleared, and in that case, leave the contiguous
> bit unset on the entire region. This permits the logic of mapping the
> kernel's linear alias to be simplified in a subsequent patch.
> 
> Note that not setting the contiguous bit on any of the descriptors in
> the contiguous region can only result in an invalid configuration if it
> was already invalid to begin with.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/include/asm/pgtable.h | 4 ++++
>  arch/arm64/mm/mmu.c              | 6 ++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 64d5f1d9cce9..cb2c4525e49a 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -224,6 +224,10 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>   * Returns true if the pte is valid and has the contiguous bit set.
>   */
>  #define pte_valid_cont(pte)	(pte_valid(pte) && pte_cont(pte))
> +/*
> + * Returns true if the pte is valid and has the contiguous bit cleared.
> + */
> +#define pte_valid_noncont(pte)	(pte_valid(pte) && !pte_cont(pte))
>  /*
>   * Could the pte be present in the TLB? We must check mm_tlb_flush_pending
>   * so that we don't erroneously return false for pages that have been
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 28cc3cda042c..d7faa98f427c 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -230,7 +230,8 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  
>  		/* use a contiguous mapping if the range is suitably aligned */
>  		if ((((addr | next | phys) & ~CONT_PTE_MASK) == 0) &&
> -		    (flags & NO_CONT_MAPPINGS) == 0)
> +		    (flags & NO_CONT_MAPPINGS) == 0 &&
> +		    !pte_valid_noncont(__ptep_get(ptep)))
>  			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>  
>  		init_pte(ptep, addr, next, phys, __prot);
> @@ -330,7 +331,8 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  
>  		/* use a contiguous mapping if the range is suitably aligned */
>  		if ((((addr | next | phys) & ~CONT_PMD_MASK) == 0) &&
> -		    (flags & NO_CONT_MAPPINGS) == 0)
> +		    (flags & NO_CONT_MAPPINGS) == 0 &&
> +		    !pte_valid_noncont(pmd_pte(READ_ONCE(*pmdp))))
>  			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>  
>  		ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);


