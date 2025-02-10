Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378F4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9do5zv6WIomCOMNIvZNZA7b88Z82prAKLGB7Owb+yw=; b=Ez5mDT9esVlecAen5ZK2iGS/k7
	aS3MZiHCTLBfjBk7JPf7ull0a+i1Fty782seJ9Rqa35inmRz69O6w0JnIroZR//QbD3v3bKQcvo2F
	GEfSVrhO5Fa8VpmMXLtt27JChQVgs09Z24k8choBIKcYA/wSM/10aTo46jmOnblrakvKGHes4xUHe
	lLAvHqaXFlprLOaKqfmcVOLL96+AiMkKDoyJDaWapL8r+mQHrgZo1C2eiYVc96Uu+DJwM3ewvCgtF
	HgJgMEzhu/Y8bGpJCXWGY+4AUUIaVR3w3I/+CwCVLQPFj0nW4ZIqtMRoxU/UBOmas3wsZYmag1ZxY
	1MPT994w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thO43-0000000GUwV-0Pc8;
	Mon, 10 Feb 2025 07:18:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thNwy-0000000GU42-2KBY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 07:11:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4217A1BA8;
	Sun,  9 Feb 2025 23:11:43 -0800 (PST)
Received: from [10.163.35.99] (unknown [10.163.35.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3504B3F58B;
	Sun,  9 Feb 2025 23:11:12 -0800 (PST)
Message-ID: <7e184caf-2447-48d4-8d7c-1b63deb0f418@arm.com>
Date: Mon, 10 Feb 2025 12:41:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/16] mm/vmalloc: Batch arch_sync_kernel_mappings()
 more efficiently
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
 <20250205151003.88959-15-ryan.roberts@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250205151003.88959-15-ryan.roberts@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_231124_686169_CB0FB72E 
X-CRM114-Status: GOOD (  24.38  )
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
> When page_shift is greater than PAGE_SIZE, __vmap_pages_range_noflush()
> will call vmap_range_noflush() for each individual huge page. But
> vmap_range_noflush() would previously call arch_sync_kernel_mappings()
> directly so this would end up being called for every huge page.
> 
> We can do better than this; refactor the call into the outer
> __vmap_pages_range_noflush() so that it is only called once for the
> entire batch operation.

This makes sense.

> 
> This will benefit performance for arm64 which is about to opt-in to
> using the hook.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  mm/vmalloc.c | 60 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 68950b1824d0..50fd44439875 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -285,40 +285,38 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
>  
>  static int vmap_range_noflush(unsigned long addr, unsigned long end,
>  			phys_addr_t phys_addr, pgprot_t prot,
> -			unsigned int max_page_shift)
> +			unsigned int max_page_shift, pgtbl_mod_mask *mask)
>  {
>  	pgd_t *pgd;
> -	unsigned long start;
>  	unsigned long next;
>  	int err;
> -	pgtbl_mod_mask mask = 0;
>  
>  	might_sleep();
>  	BUG_ON(addr >= end);
>  
> -	start = addr;
>  	pgd = pgd_offset_k(addr);
>  	do {
>  		next = pgd_addr_end(addr, end);
>  		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
> -					max_page_shift, &mask);
> +					max_page_shift, mask);
>  		if (err)
>  			break;
>  	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
>  
> -	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> -		arch_sync_kernel_mappings(start, end);
> -
>  	return err;
>  }

arch_sync_kernel_mappings() gets dropped here and moved to existing
vmap_range_noflush() callers instead.

>  
>  int vmap_page_range(unsigned long addr, unsigned long end,
>  		    phys_addr_t phys_addr, pgprot_t prot)
>  {
> +	pgtbl_mod_mask mask = 0;
>  	int err;
>  
>  	err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
> -				 ioremap_max_page_shift);
> +				 ioremap_max_page_shift, &mask);
> +	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> +		arch_sync_kernel_mappings(addr, end);
> +

arch_sync_kernel_mappings() gets moved here.

>  	flush_cache_vmap(addr, end);
>  	if (!err)
>  		err = kmsan_ioremap_page_range(addr, end, phys_addr, prot,
> @@ -587,29 +585,24 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>  }
>  
>  static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> -		pgprot_t prot, struct page **pages)
> +		pgprot_t prot, struct page **pages, pgtbl_mod_mask *mask)
>  {
> -	unsigned long start = addr;
>  	pgd_t *pgd;
>  	unsigned long next;
>  	int err = 0;
>  	int nr = 0;
> -	pgtbl_mod_mask mask = 0;
>  
>  	BUG_ON(addr >= end);
>  	pgd = pgd_offset_k(addr);
>  	do {
>  		next = pgd_addr_end(addr, end);
>  		if (pgd_bad(*pgd))
> -			mask |= PGTBL_PGD_MODIFIED;
> -		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> +			*mask |= PGTBL_PGD_MODIFIED;
> +		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, mask);
>  		if (err)
>  			break;
>  	} while (pgd++, addr = next, addr != end);
>  
> -	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> -		arch_sync_kernel_mappings(start, end);
> -
>  	return err;
>  }
>  
> @@ -626,26 +619,33 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
>  	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> +	unsigned long start = addr;
> +	pgtbl_mod_mask mask = 0;
> +	int err = 0;
>  
>  	WARN_ON(page_shift < PAGE_SHIFT);
>  
>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -			page_shift == PAGE_SHIFT)
> -		return vmap_small_pages_range_noflush(addr, end, prot, pages);
> -
> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> -		int err;
> -
> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> -					page_to_phys(pages[i]), prot,
> -					page_shift);
> -		if (err)
> -			return err;
> +			page_shift == PAGE_SHIFT) {
> +		err = vmap_small_pages_range_noflush(addr, end, prot, pages,
> +						&mask);

Unlike earlier don't return here until arch_sync_kernel_mappings()
gets covered later.

> +	} else {
> +		for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> +			err = vmap_range_noflush(addr,
> +						addr + (1UL << page_shift),
> +						page_to_phys(pages[i]), prot,
> +						page_shift, &mask);
> +			if (err)
> +				break;
>  
> -		addr += 1UL << page_shift;
> +			addr += 1UL << page_shift;
> +		}
>  	}
>  
> -	return 0;
> +	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
> +		arch_sync_kernel_mappings(start, end);

arch_sync_kernel_mappings() gets moved here after getting dropped
from both vmap_range_noflush() and vmap_small_pages_range_noflush().

> +
> +	return err;
>  }
>  
>  int vmap_pages_range_noflush(unsigned long addr, unsigned long end,

LGTM, and this can stand on its own as well.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

