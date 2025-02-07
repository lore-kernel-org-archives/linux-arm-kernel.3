Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59141C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZfmOYEjsOOigbYsvY6i0SBzuIazvcfmaA15U8nykOU=; b=uZ+s6Ra/HyT+FI1Ler/8QnJpWq
	GDIigx8Zw+AjPJH85T3W2IVs7ju9US7r9Z5EJZHEMXdyvtBy5mFc7cSOKILnGRDc6CTph3yoYEU5U
	AAJBgKfkSa3qPZYsKTN+IJ+FhkbrdkronB4QI2VENB2fLA2CzT4NSjFzRHcxF6HkApUg3Wxvg46Dg
	kbcH0xfJboA2i8QLbSzf7rftPQ6UnfXDsOOa84P9POQ943HEAkiMXY9Pt8QuVmMT3o2v2QwQ5Wq43
	5RPBndfyQnT3sujOa4zVelseicpDE26sDkVDTk+XTNnqRqBKUnO9xLcnHNDgQFU3yNPvaO4vJN+iC
	V7XBGQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKY9-0000000902O-2Cln;
	Fri, 07 Feb 2025 09:21:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKWl-00000008zl9-254n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 09:20:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACBCB106F;
	Fri,  7 Feb 2025 01:20:21 -0800 (PST)
Received: from [10.162.16.89] (a077893.blr.arm.com [10.162.16.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AF5C3F5A1;
	Fri,  7 Feb 2025 01:19:53 -0800 (PST)
Message-ID: <e1fe2a0c-d567-4a26-af06-89e3a37ba638@arm.com>
Date: Fri, 7 Feb 2025 14:49:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/16] mm/vmalloc: Gracefully unmap huge ptes
To: Ryan Roberts <ryan.roberts@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Steve Capper <steve.capper@linaro.org>, Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250205151003.88959-1-ryan.roberts@arm.com>
 <20250205151003.88959-12-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-12-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_011959_630513_F1FC7AF5 
X-CRM114-Status: GOOD (  23.36  )
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



On 2/5/25 20:39, Ryan Roberts wrote:
> Commit f7ee1f13d606 ("mm/vmalloc: enable mapping of huge pages at pte
> level in vmap") added its support by reusing the set_huge_pte_at() API,
> which is otherwise only used for user mappings. But when unmapping those
> huge ptes, it continued to call ptep_get_and_clear(), which is a
> layering violation. To date, the only arch to implement this support is
> powerpc and it all happens to work ok for it.
> 
> But arm64's implementation of ptep_get_and_clear() can not be safely
> used to clear a previous set_huge_pte_at(). So let's introduce a new
> arch opt-in function, arch_vmap_pte_range_unmap_size(), which can
> provide the size of a (present) pte. Then we can call
> huge_ptep_get_and_clear() to tear it down properly.
> 
> Note that if vunmap_range() is called with a range that starts in the
> middle of a huge pte-mapped page, we must unmap the entire huge page so
> the behaviour is consistent with pmd and pud block mappings. In this
> case emit a warning just like we do for pmd/pud mappings.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  include/linux/vmalloc.h |  8 ++++++++
>  mm/vmalloc.c            | 18 ++++++++++++++++--
>  2 files changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index 31e9ffd936e3..16dd4cba64f2 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -113,6 +113,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr, uns
>  }
>  #endif
>  
> +#ifndef arch_vmap_pte_range_unmap_size
> +static inline unsigned long arch_vmap_pte_range_unmap_size(unsigned long addr,
> +							   pte_t *ptep)
> +{
> +	return PAGE_SIZE;
> +}
> +#endif
> +
>  #ifndef arch_vmap_pte_supported_shift
>  static inline int arch_vmap_pte_supported_shift(unsigned long size)
>  {
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index fcdf67d5177a..6111ce900ec4 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -350,12 +350,26 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			     pgtbl_mod_mask *mask)
>  {
>  	pte_t *pte;
> +	pte_t ptent;
> +	unsigned long size = PAGE_SIZE;

Default fallback size being PAGE_SIZE like before.

>  
>  	pte = pte_offset_kernel(pmd, addr);
>  	do {
> -		pte_t ptent = ptep_get_and_clear(&init_mm, addr, pte);
> +#ifdef CONFIG_HUGETLB_PAGE
> +		size = arch_vmap_pte_range_unmap_size(addr, pte);
> +		if (size != PAGE_SIZE) {
> +			if (WARN_ON(!IS_ALIGNED(addr, size))) {
> +				addr = ALIGN_DOWN(addr, size);
> +				pte = PTR_ALIGN_DOWN(pte, sizeof(*pte) * (size >> PAGE_SHIFT));
> +			}
> +			ptent = huge_ptep_get_and_clear(&init_mm, addr, pte, size);
> +			if (WARN_ON(end - addr < size))
> +				size = end - addr;
> +		} else
> +#endif
> +			ptent = ptep_get_and_clear(&init_mm, addr, pte);

ptep_get_and_clear() gets used both, when !HUGETLB_PAGE or HUGETLB_PAGE with
arch_vmap_pte_range_unmap_size() returned value being PAGE_SIZE, which makes
sense.

>  		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>  

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

