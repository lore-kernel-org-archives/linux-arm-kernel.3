Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D28C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 05:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ovwOI+hzFwt2cW+UwFEe1mkwXl5Iadp2UTL8OL/Kuk=; b=ATwhZjPNHf2QcwQRMJtMqQgNFT
	e1JaLan/rwSfYeO7sg8KvZ3dKe7XU5jzwjWew3Bp9v48ujs2hU87mhA6WccPkBCvXu+Zp3wRAK2fp
	4IN+2K8kxw58Ok5udXl+gYk5fedR8pjeguynRCEkkMqFtSldM92gXzbhoJPX3eyeVyDWA7FQFvAsW
	i7mC4YKtelvK0jwZdtiEFpXcJczC6GxyEW8AwWJ3SQ2yQpU5290/s5Am4PFFC1y1WHWNd2n74Nqqn
	A99LZJro9LTjr3/V1XJZLWD2p+w4SDubOsr5SjELD7YdMmhFNxl2asFyW7w5bGn+DTbcNDoYDeH8P
	ztgc+9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4xR-0000000DjEP-1Z9i;
	Mon, 29 Jun 2026 05:55:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we4xO-0000000DjDm-42wh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 05:55:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A868F1A2D;
	Sun, 28 Jun 2026 22:54:52 -0700 (PDT)
Received: from [10.164.19.15] (unknown [10.164.19.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B62133F836;
	Sun, 28 Jun 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782712497; bh=B+yi1Bdg44hMjMR1L4zCtY4m3s0YUR4/m7per8eojKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XpwbJMbXv8k8Om8XvR64ryOt/uZaEQI1W+MyncoF4wcQ+Z3VuDnxtrfA9wrXgYs2A
	 bv4FDrG3lX+yvzTUBJMcBReSjYr8Ry99yfX3mlgtMpMJeYaSC7HfTgjrIWk+h7qCPe
	 jSf7yHxQekQxZfzuX0utNRRg7kVhEV2o/lDL/K74=
Message-ID: <a8ff2b34-5e5c-43c8-9de2-cf7929265853@arm.com>
Date: Mon, 29 Jun 2026 11:24:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] mm/vmalloc: Extract vmap_set_ptes() to consolidate
 PTE mapping logic
To: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: baohua@kernel.org, Xueyuan.chen21@gmail.com, rppt@kernel.org,
 david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com,
 shanghaoqiang@xiaomi.com
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-4-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260618084726.1070022-4-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_225459_125739_7D407DA9 
X-CRM114-Status: GOOD (  22.12  )
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



On 18/06/26 2:17 pm, Wen Jiang wrote:
> Extract the common PTE mapping logic from vmap_pte_range() into a
> shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> PTE mappings in a single function, preparing for the next patch which
> will extend vmap_pages_pte_range() to also use this helper.
> 
> The #ifdef CONFIG_HUGETLB_PAGE guard is moved inside vmap_set_ptes(),
> so callers no longer need to handle the conditional compilation.
> 
> No functional change.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmalloc.c | 44 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 2c2f74a07f396..6660f240d27c9 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -91,6 +91,35 @@ struct vfree_deferred {
>  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
>  
>  /*** Page table manipulation functions ***/
> +
> +/*
> + * Set PTE mappings for the given PFN. Try CONT_PTE mappings first when

CONT_PTE is arm64-specific, doesn't feel right to mention this in generic code.

If you really want to put a comment, just say:

"Try contiguous mappings at the PTE level for arches which support them, and if
requested by the caller. Fall back to PAGE_SIZE mappings otherwise.

Return: mapping size."
> + * supported, otherwise fall back to PAGE_SIZE mappings.
> + *
> + * Return: mapping size.
> + */
> +static __always_inline unsigned long vmap_set_ptes(pte_t *pte,
> +		unsigned long addr, unsigned long end, u64 pfn,
> +		pgprot_t prot, unsigned int max_page_shift)
> +{
> +#ifdef CONFIG_HUGETLB_PAGE
> +	if (max_page_shift > PAGE_SHIFT) {

This if block is not needed, max_page_shift > PAGE_SHIFT is handled by
arch_vmap_pte_range_map_size.

With that:

Reviewed-by: Dev Jain <dev.jain@arm.com>


> +		unsigned long size;
> +
> +		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> +		if (size != PAGE_SIZE) {
> +			pte_t entry = pfn_pte(pfn, prot);
> +
> +			entry = arch_make_huge_pte(entry, ilog2(size), 0);
> +			set_huge_pte_at(&init_mm, addr, pte, entry, size);
> +			return size;
> +		}
> +	}
> +#endif
> +	set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> +	return PAGE_SIZE;
> +}
> +
>  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			phys_addr_t phys_addr, pgprot_t prot,
>  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
> @@ -119,19 +148,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			BUG();
>  		}
>  
> -#ifdef CONFIG_HUGETLB_PAGE
> -		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> -		if (size != PAGE_SIZE) {
> -			pte_t entry = pfn_pte(pfn, prot);
> -
> -			entry = arch_make_huge_pte(entry, ilog2(size), 0);
> -			set_huge_pte_at(&init_mm, addr, pte, entry, size);
> -			pfn += PFN_DOWN(size);
> -			continue;
> -		}
> -#endif
> -		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> -		pfn++;
> +		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> +		pfn += PFN_DOWN(size);
>  	} while (pte += PFN_DOWN(size), addr += size, addr != end);
>  
>  	lazy_mmu_mode_disable();


