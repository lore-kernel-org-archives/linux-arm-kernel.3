Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A068CD6E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdZl1JqvXa8x+O2FgoLF+eh6j2BB3hLfw/Br1aD0zu8=; b=qw2RWowTUKh79evAnooOexwNkR
	nYrUfbZCP1ea8ka3lgFwPuCwLz3moj5P/L1zoiQQm3TYQmc/YcAIeRtpJig+SQoYyYIRHSk0afa9R
	3M4JkhjjVjv0mcWcpIq/SmlzxIAsez3VOtp5160t0gm0se9BY/06NNrdsnUUJR6kvgkgaT5iIUZWP
	pdjWM9HUjY9p1UKh2yzikpLCgDXJlyuLQWMaBl5crF+GjhwwnLsU6qQ2HakVVD1Cejb7D5eoAp2/i
	/xS9e5W6tCFETiFThH3KtcOwCv2BG+i2yxuYf2rWSiFBGbkLl2HVeZFABGCwbSnbP9I/njsX4A7Sm
	JLV20tWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6X0-0000000BaSq-2jIo;
	Mon, 01 Jun 2026 17:34:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6Wy-0000000BaR3-1iF8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 17:34:29 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so1090598e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780335266; x=1780940066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdZl1JqvXa8x+O2FgoLF+eh6j2BB3hLfw/Br1aD0zu8=;
        b=FQ75ve+x3nbSYpcyMW6NryZd/+0jJ7uIEnj/H1vrJ+TcmXfjEole1Yi/9K0Gu6pTc4
         rEjcefij8L5XNmaEkMqa93JG9fbUBXao3gEL83If/OKfrA9URtyesPQFnmzO2wZ3wy1d
         vu9lYFEbF5Gte9qEcbWfnh5kVr/SB4O/Gp+rzCk4GOQE1jiHVKUkNPTUcsifIWpZqIrI
         DaYTHRHUzkCxgJrCc5NonN+tnpUb7H5A5sHU6eayvANr1LxXnAhWQ410zI/qc1yuQ5mu
         /1d7lcXIXHIFbuKI39W/QTmE/L9wEOrtK8KF+Mdkuvo5v181o80oguLoLgp+/Oubi37z
         JP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780335266; x=1780940066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdZl1JqvXa8x+O2FgoLF+eh6j2BB3hLfw/Br1aD0zu8=;
        b=FdUItfetMBA5zSM6Fy+8SmXFTJfBqY1eHJH0a0i6AxdHLyG20fdedj40LulXtqc8xP
         jY/vqMmkIeUm1wAdBIX6O8w202rRbz+QrWbXDFK1AxCuTYKBKja6dldUTByr/AXQu9ub
         3JYOwhvSK7XNwEATW/p8MhlNVxCnVvPK7Z7rwdJ/9Q8AcLf1ucsekrxrBJFfMFi89QeV
         9ZcMQ1LO1wBKYm+E+lj9lAMmLzY7U6S1mC3mmpeAE1rBiPzJQ8+qtIgZrWhQ0tdSec59
         3+/i3IOoy3UncdDl3hBAyuDWmDVGq6cWFgT+0jB5XWjrWmhlhNj6yjhJFRuQR9Vgf24K
         STUg==
X-Forwarded-Encrypted: i=1; AFNElJ+a/WJG6GvTysBcn4YMa805FVep1wrAoEvCXd4j2Z7gt9eHRNJPcRE4Ex4kAu8YJVVba3Xb9rR2HYeFsE5E+10k@lists.infradead.org
X-Gm-Message-State: AOJu0YztMK4cgdo7dT7f3pj4rU3PaAACL//uhUP6vORi0Hoinh/FVb8E
	CEoRuKCSv7Bjgxl31dnK4sLg9WzSYKvVIP/JZoa0z4Oqi2zShaFlNQz4
X-Gm-Gg: Acq92OGBfgcCO1RQn79U2ai3gZbGLGoG25q6k8M543Ua99XUsJeZKeStvYmSvMd8V6h
	tRQQJMXML9lyhuMv45Ljej+oNHiI2AtzzadzSRlJ1e3kQQ5nMkC14BewKk9bRdYPksCQLRpMnEM
	U5Y96DNqtPoAPkoFHKBYWihv1ZbNlEdwxyZaEWeVcP5TeLNaiFjm2QakBpZIfqBrGE1pHthMCp6
	YSjPmMSoSgDVlNCaR7HQhPt1ACKWs1gbuGGmkIZ3fdwjn2k8RZXbdMt+y4w+dwBt5XX+dl82fTX
	W0J79253GlbR2o8lcMMI4mVr1gqo/p5cgzwItrkLpEJbzrEzxL1TsC+SXZDOgHANL6Mc3cqgV/n
	ULQ/fe4aFTzEzNncCTxg9HFbt+TaP5YQb078Ac9QGLOakFOwklbNKWi53vJf3fpp+gR7bsZmcAn
	tYw0982WSIEQ==
X-Received: by 2002:a05:6512:6319:b0:5aa:70f9:b0b8 with SMTP id 2adb3069b0e04-5aa7430a39amr259985e87.10.1780335265467;
        Mon, 01 Jun 2026 10:34:25 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa62f7f539sm1696560e87.4.2026.06.01.10.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:34:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 1 Jun 2026 19:34:23 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com
Subject: Re: [PATCH v3 3/6] mm/vmalloc: Extract vmap_set_ptes() to
 consolidate PTE mapping logic
Message-ID: <ah3Cn3YnefIVJDo2@milan>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-4-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522053146.83209-4-jiangwenxiaomi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_103428_509287_A0AF7144 
X-CRM114-Status: GOOD (  25.04  )
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

On Fri, May 22, 2026 at 01:31:43PM +0800, Wen Jiang wrote:
> Extract the common PTE mapping logic from vmap_pte_range() into a
> shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> PTE mappings in a single function, preparing for the next patch which
> will extend vmap_pages_pte_range() to also use this helper.
> 
> The #ifdef CONFIG_HUGETLB_PAGE guard is moved inside vmap_set_ptes(),
> so callers no longer need to handle the conditional compilation.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmalloc.c | 49 ++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 34 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 2c2f74a07f396..53fd4ee460ea4 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -91,6 +91,35 @@ struct vfree_deferred {
>  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
>  
>  /*** Page table manipulation functions ***/
> +
> +/*
> + * Set PTE mappings for the given PFN. Try CONT_PTE mappings first when
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
> @@ -98,7 +127,8 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	pte_t *pte;
>  	u64 pfn;
>  	struct page *page;
> -	unsigned long size = PAGE_SIZE;
> +	unsigned long size;
> +	unsigned int steps;
>  
>  	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>  		return -EINVAL;
> @@ -119,20 +149,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
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
> -	} while (pte += PFN_DOWN(size), addr += size, addr != end);
> +		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> +		steps = PFN_DOWN(size);
> +	} while (pte += steps, pfn += steps, addr += size, addr != end);
>  
>  	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;
> -- 
> 2.34.1
> 
IMO, we should add just a helper with "no functional change" and second
patch will extend it.

Otherwise you added a helper which has already been slightly modified.

--
Uladzislau Rezki

