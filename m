Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE9FCC6B27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqVi8QCU6hknC7H9M7ml2uXrA0673INlwwrSFLl3/oA=; b=cGTIQEM68p1OI6eaLaeSFYKezz
	46ZXGXTmiiLv9VKSEa8/0oIM/5Tlu0oyXbPOvbGf2G1dd/9hddDPIxQhSqAXHoZFB0GDQZKQNlzlH
	hxc+Z/McQOofXWKYT81ieblaVCgCGmduy0woBajJWUMpTUySnvhiE4cTJ+26U1Y9hWTYgobJOOlm2
	vCI0wPBPxL7aDF4kBW3PWFGt09x2VbMX+1KkSHozyNVaef+0s628kplBfzKBEOR2a1tvO/pfBWHiS
	uQZsiTwd2KMv7FqJieiPZxtyS66n6mNhgy1fxpTh9Rwtk/I6VQE9YDSK52HMzQX1ZZlkPpR3lgMDt
	Kx5NcxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuQi-0000000EuJF-2IXX;
	Wed, 14 Oct 2026 08:33:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuQf-0000000EuIe-1rJD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 08:33:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E0321596;
	Wed, 14 Oct 2026 01:33:34 -0700 (PDT)
Received: from [10.164.19.62] (unknown [10.164.19.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BAA13F7B4;
	Wed, 14 Oct 2026 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791966817; bh=ASu3IcGFyeYmVPuaDkdWQXD8Os9G+pzrChDjE/h2Abc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dsBcaX0mp6gvZs61sBhw4L/q40NPdO3Kc7UzRP8R8o9kzYplOo0TELA4mansDr9QY
	 gVDypdY8MeK7tLUiqaEO54LuxZB5+ugc2XA9+TqKgbXQiqQcv5LDAhz05f/vbjMflO
	 fXnHzM1uCU0ZQKE0+r4ukFIL9JxHuaSXVrZ0qePg=
Message-ID: <47c5b406-1298-4e64-84dc-e27910dc5f7c@arm.com>
Date: Wed, 14 Oct 2026 14:03:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 06/10] mm/vmalloc: extract vmap_set_ptes() to
 consolidate PTE mapping logic
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
 <20261002090947.869220-7-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261002090947.869220-7-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_013341_568083_C012444C 
X-CRM114-Status: GOOD (  18.71  )
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
> Extract the common PTE mapping logic from vmap_pte_range() into a
> shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> PTE mappings in a single function, preparing for the next patch which
> will extend vmap_pages_pte_range() to also use this helper.
> 
> No functional change.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index fb757d95bde25..72ec1b48a76de 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -92,6 +92,29 @@ struct vfree_deferred {
>  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
>  
>  /*** Page table manipulation functions ***/
> +
> +/*
> + * Try contiguous mappings at the PTE level for arches which support them, and if
> + * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
> + *
> + * Return: mapping size.
> + */
> +static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
> +		unsigned long addr, unsigned long end, u64 pfn,
> +		pgprot_t prot, unsigned int max_page_shift)
> +{
> +	unsigned long size;
> +
> +	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> +	if (size != PAGE_SIZE) {
> +		pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
> +		return size;
> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
> +	return PAGE_SIZE;
> +}
> +
>  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			phys_addr_t phys_addr, pgprot_t prot,
>  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
> @@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	u64 pfn;
>  	struct page *page;
>  	unsigned long size;
> +	unsigned int nr_pages;
>  
>  	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>  		return -EINVAL;
> @@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			BUG();
>  		}
>  
> -		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> -		if (size != PAGE_SIZE) {
> -			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
> -			pfn += PFN_DOWN(size);
> -			continue;
> -		}
> -		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> -		pfn++;
> -	} while (pte += PFN_DOWN(size), addr += size, addr != end);
> +		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> +		nr_pages = PFN_DOWN(size);
> +	} while (pte += nr_pages, pfn += nr_pages, addr += size, addr != end);
>  
>  	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;


