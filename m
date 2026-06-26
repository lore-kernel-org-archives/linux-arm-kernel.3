Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF502C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 16:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBlnVq/S0dm/GPydxBpVJQrOU3YgiAXnWHM/7A5IJg4=; b=dDu9g+2Gs6++0BI8XisZpU8Sg2
	P/03CmQIq+jI0JjjCoTd6hEQwu3M9qxyzjzmyqamERSZ2DEDo6WvZkKqeIOCKSz0ww4Y/jGw+QUfe
	Q/+t6HsyOsG7fsUOE6+72T1Nifr6N/8+96papTAW4kCXTpi+lvcQQcGijYsx2m1P3TSxz8AOGNn/4
	CQO+XqCrmsJEerTjDp0yInNMHS+x8rVOrQkV4qT3fbSp0jDLbwfQORU3akfb3n82yvXX8Q7likIz/
	YqrHN/3zstavwm5FIyts+9SFUnImK95Rf+3mE4c95ZtJTahngyf91bEpEazkk8H+1NAUBXiJGSE1s
	jh1LWOBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9JW-0000000BcbW-2BZZ;
	Fri, 26 Jun 2026 16:21:58 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9JU-0000000BcVx-0aLS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 16:21:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5aea36c9558so1014366e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 09:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782490914; x=1783095714; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VBlnVq/S0dm/GPydxBpVJQrOU3YgiAXnWHM/7A5IJg4=;
        b=LQ+s4wtCRHUR8HWN8ogwBZv0z+4aZ5bmYUk7ZJeuqGK4D+1Gp7cqzp/K9QWYxK4n3p
         JQS7JqUCioU8W88WuWowfTzb9tn6kTj7EKkupE2UsDmmatrHJo5mirx1fn24qajhiHiw
         WTYw1MRg+3qtoPIVsEKmLtbSxI/IAqshMCZ4+UsoJnr4yoJxKn9GPIPl+m43k/KMwTb3
         B9/w8LM5a5pWiIK5D6cOFsEfNjexpq/qp4Tyq2fiPMMbnoUmTQQpA3NGu4qLz+DlF1ay
         4N9eU1Fay/CubU0X8U1G1IBRwLR0aeRqYHorRNSXjWw7LR4KBIN+K0nhoEyn3wZ9GC7W
         o6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782490914; x=1783095714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBlnVq/S0dm/GPydxBpVJQrOU3YgiAXnWHM/7A5IJg4=;
        b=puAp2VGktn9rHm6yb3vONvBS+9R/K/kGo11DFLfXOCWgllrVnHYEXmTJpgaK45hAg3
         BI293iZOIacGNdBOVUM4foaihoi1h8cyhyx1YlFkUPdtlhhY4aI6xKIislJq8pK/8fe2
         0ViBblQCc9a2/DONnTrSEJUAbk84G0DwfUOzS09/vQYOq2/SWT38m2bEeQW/zKRJHBQ1
         ld3FqcL0yrfis1Vlnbj/3Gf3V45ZuW/9nnhcsHIhEQRqb9Li2FEitnmBUfH641Z8o7L3
         iUaFblS+e2u6v14gEU7BWe+GK/ckI0DFLwAxKf9DT00xtftHLuQ2CrxUHTkTs6Qe15U/
         g8FQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0Uefz349hNM5H/ILDZU2y/7Ro+6Y6mIssowgL6rY+Opc9m/M+X2FPKQi4rA88dC5hvWLgdtqLWD3skSDF/QWz@lists.infradead.org
X-Gm-Message-State: AOJu0YwcFgywmxrQpDnUdJGHGWF7pEb+DmPh4pYBqqUG8Z56l/Sj4Kzd
	hj40pCJyIZV1JKK+HE0vMUmL8W02nQzGqzOxWnVEdjvNvbsboaaKhdvT
X-Gm-Gg: AfdE7cm3/nazIy7oEhNpRJ0l96lATtrxXNgsjiXeIRKqzW8NETMy07gwRPObIk+Ua8o
	zJ7kA351jfWW26Z6kT1oL/VPBjrK1S4isLN1slcsW9+GzoE8/p8e14KhHNfb4QqisrqUZRt5hBk
	dYKJTq4XQ6ql+af+yrT0tAHaq2U7jXVUHaixlogdDP3acg0s3+tb5Gg1CLNbg5M208ZZeovRmMc
	FbBY4UiSIuyy5PzHIEPXmW1WZLKBfIUZKbp0SGsW1T6hY412WFp9vBZAqqobFpRoyXHFspfkB2D
	DfhiR4cSgqdDmwY72kEsOMObVGDoi18uN/qQCvltBJSptkp+lD9ysABMq2u/bgquOJQd5B82U5S
	2ylMvSkfsowJRbMeKfRrVraQMyoD/FoyZOppMRWdd95Uw6hCe+bZOZLwenGQENwMT
X-Received: by 2002:a05:6512:608d:b0:5aa:6ede:5b with SMTP id 2adb3069b0e04-5aea1f3c096mr2475000e87.14.1782490913622;
        Fri, 26 Jun 2026 09:21:53 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ae9d8fb537sm2467551e87.21.2026.06.26.09.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:21:53 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Fri, 26 Jun 2026 18:21:51 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com,
	shanghaoqiang@xiaomi.com
Subject: Re: [PATCH v4 3/6] mm/vmalloc: Extract vmap_set_ptes() to
 consolidate PTE mapping logic
Message-ID: <aj6nH7bJBI4sOmxE@milan>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
 <20260618084726.1070022-4-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618084726.1070022-4-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_092156_199980_39899857 
X-CRM114-Status: GOOD (  22.87  )
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

On Thu, Jun 18, 2026 at 04:47:23PM +0800, Wen Jiang wrote:
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
> -- 
> 2.34.1
> 
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

