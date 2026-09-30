Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91546CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9dGLqKNBlMrHbdqAQfcvM1eXGcLD/Xmv99laXST3Cc=; b=lOf9zTX229v43qy1pzKD5x4Y2x
	npgIL6eSIbjQHZqSk85/6N0Q43tSooL1gRPcjIN8cNmm7m4Sny86FtKTQnJixoAexoqvi+j/qylai
	hC/9vbEzHihLHHcvfFR0TvT7JnQLwaOtdSpxSs+lj0yxCaEdcKwu+JcR7LOdD2nlY+SqNd0LoSN8E
	bTGptcNexJc/IoLmXW/dg7Nqz7E2N9FXlR+sNCO/hLLpnI5jEyIH6LmhI9R75f1Nru2i9UkVtldtP
	Gn5WIm5Aj5EtAfeUUXBa6q00+a37EVFBAywRzMtu6AC6sChe/YQ7EMMfgEOayZN2QJLRr7B4JsGi8
	6TvbaLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBw2c-00000006Soe-18Bd;
	Wed, 30 Sep 2026 15:16:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBw2a-00000006SoK-1Ge6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:16:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q9dGLqKNBlMrHbdqAQfcvM1eXGcLD/Xmv99laXST3Cc=; b=pYlpL2+Bh59gUc/hQ3hPCQbhVV
	J7kHk4CvzEpr9rIVwLzkSwJ0oHALhDDxOsXKkzN8SzCstND8NeiQoX0AdS9ifo2A3mSw6hQstUEOv
	jEGB35wJL3TgBigEXKRsKkGzdWZAyfc7vj/XI4MZk/sGkv/fYAI9O21zG8G82QZHqmZ5vP8qX2SC5
	tC9B3wIHYd/gZ8u+nDRo//dIlm41vxppqAM6vGO+y8XMjeCU4Ha3Ol2fBwuMdKU0jmriKK9PtXNFn
	YhYPqkMRxT8YFD1bibSKU5F4WgwCoOBDxiQzJ/jux7/R6UlYdz7/5ZI4FpPCeGSpEZ/Y7hTq0pHxU
	Mmk5ZPzQ==;
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBw2X-00000003ysX-2BLw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:16:15 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2e2050feb1so139755366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790781372; x=1791386172; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9dGLqKNBlMrHbdqAQfcvM1eXGcLD/Xmv99laXST3Cc=;
        b=KHLULsh1N78/Ax7iDPe+wJx99a1FHg1IZ4pOIHsYfmx9xjiI8KBJZpMJNene4h/2u3
         GYkq6V8QDPBZVOCSBitCSx3iBQK4n/F5QW4AWngfLrSI+XgC9/YRLWN3Y8bRQAUjcASO
         7BYGXfhi1ux+ZYcN4NMWNIuifDwrIjkHvb++SDif4tMx77N3jw/X20cMNTgRb4/KPJi5
         Y/fm0GghS8pR0VSwUnHGVdoiQG7HUtP28MqoYY9xYVzX9qs9xsAI+hxWVrKlbAFsMgKA
         5V5LT5BILd/Q7xcxtrKWALhks687Q9iWUAmFfjPcqQzUGKlRaNDU78oW3WArg3AM5XRf
         OHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790781372; x=1791386172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9dGLqKNBlMrHbdqAQfcvM1eXGcLD/Xmv99laXST3Cc=;
        b=y/zdw82NSuDQrI4fIzPI7cAcW7yrCyH5aFal4xf2OOSxQp+Rk6vhu6ImTlMQiKOHZx
         nGuw4zK9f21q4Qsg9Gm+3alU78OEKd3z++LUWAWxYaH4dngkxpJYOhGJdVfvNgc+0kIw
         wnlL3z/A66cxRVg6joVc/X8HS5iSWNQLBcqrODKhctfyWhDVik0cpaWT7W+6i5HezaGS
         slVoA2eYPj29iZx6hi3vmPUqppQ1xm09pinCKAcs5Fb3sc9jnSQ8cEQbj18iJ1wlXES+
         fW6bSvd4W5HcosBHYVUsbf++AkZLLQHv7Lgijd1HHF5AsltMfKvWhw+NzqR71VbYERuS
         bcBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxclyx2jozXzYYdp0Ld/P4hVK543BnwSeFTS+KbUi62J5mfOJ0CTgrPE68YD/BQ+MaN/oWKjaHxpQUbd6/2dS79@lists.infradead.org
X-Gm-Message-State: AFuF++nKKm0aLzuVHrmbtawfeXya4HUC7niomAEfhqJBkmT4kKTLdFnq
	oDkvNoRJd5XOrBV3ErRSZXTvrxMroEOdvCHitDoFMOUMpg05bAohpvGU
X-Gm-Gg: AYBFou1v6M6/nZjKwes2fO3ErTAr7hoa+b6qKkQwUpwcTjFNXJCfgfXMCXZEtv/kZps
	/mFM50TpP1Xx6DTzGPgCUgB1q/fzcvauPVi8zVrCLjNONTvOer9ODAntP8KKJCUcrDWWigeJDYW
	8A6iRlRrVCHB10ll+RUqPo9f1ciIVNhS4kxL6fLaVxZfLBIxKTX1YURcE/dYhujEuUOsTrbj1+M
	q5Roxvcm3Dr7XFxVKgoewWR6ceeWGriTK+TTPnvfNfMClcwe1jbFxhPSuw94FZPvbYHk+MuhR2P
	DDUjajLa7UPdfh9lQ6BAWLvaCUfIBo6cJQ1qRv6jY5ejk6j1csfTntTBb2Qxprwspp8KGJQFoRA
	6PBM1USSeqp04sD6GnG2WzN1QwoLK6jhTNSe8ciYD/oMwwjhrC8F49oAa6itb3KRe3chpz7KPce
	ljhfCcQauynCv3YjDgO97x7BxejBmrP3Hy5Do=
X-Received: by 2002:a17:907:d1e:b0:c29:cf4b:5cac with SMTP id a640c23a62f3a-c2e23749268mr150465666b.5.1790781371662;
        Wed, 30 Sep 2026 08:16:11 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce9e4fsm21985066b.31.2026.09.30.08.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:16:11 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 17:16:08 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v9 07/10] mm/vmalloc: extend page table walk to support
 larger page_shift sizes and eliminate page table rewalk
Message-ID: <ar0nuJ7ocTMgbiMu@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-8-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923062832.479455-8-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_161613_654548_5CB1583B 
X-CRM114-Status: GOOD (  29.86  )
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

On Wed, Sep 23, 2026 at 02:28:29PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
> provides a clean interface by taking struct page **pages and mapping them
> via direct PTE iteration. This avoids the page table rewalk seen when
> using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.
> 
> Extend it to support larger page_shift values, and add PMD- and
> contiguous-PTE mappings as well.
> 
> Rename it to vmap_pages_range_noflush_walk() since it now handles
> more than just small pages.
> 
> For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
> iterate over pages one by one via vmap_range_noflush(), which would
> otherwise lead to page table rewalk. The code is now unified with the
> PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/vmalloc.c | 84 +++++++++++++++++++++++++++++++---------------------
>  1 file changed, 50 insertions(+), 34 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index d475e52110e4a..6e0dec73107a7 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -558,8 +558,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
>  
>  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
> +	unsigned long pfn, size;
> +	unsigned int steps;
>  	int err = 0;
>  	pte_t *pte;
>  
> @@ -590,9 +592,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  			break;
>  		}
>  
> -		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> -		(*nr)++;
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +		pfn = page_to_pfn(page);
> +		size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
> +		steps = PFN_DOWN(size);
> +	} while (pte += steps, *nr += steps, addr += size, addr != end);
>
nr_mapped_pages?

>  
>  	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;
> @@ -602,60 +605,88 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  
>  static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	pmd_t *pmd;
>  	unsigned long next;
> +	int err;
>  
>  	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
>  	if (!pmd)
>  		return -ENOMEM;
>  	do {
>  		next = pmd_addr_end(addr, end);
> -		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
> -			return -ENOMEM;
> +
> +		if (shift >= PMD_SHIFT) {
> +			struct page *page = pages[*nr];
> +			phys_addr_t phys_addr;
> +
> +			if (WARN_ON(!page))
> +				return -ENOMEM;
> +			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> +				return -EINVAL;
> +
> +			phys_addr = page_to_phys(page);
> +
> +			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
> +				*mask |= PGTBL_PMD_MODIFIED;
> +				*nr += 1 << (PMD_SHIFT - PAGE_SHIFT);
>
*nr += 1 << (PMD_SHIFT - PAGE_SHIFT); --->  *nr += 1U << (PMD_SHIFT - PAGE_SHIFT);
as it used to be?

> +				continue;
> +			}
> +		}
> +		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift);
> +		if (err)
> +			return err;
>  	} while (pmd++, addr = next, addr != end);
>  	return 0;
>  }
>  
>  static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	pud_t *pud;
>  	unsigned long next;
> +	int err;
>  
>  	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
>  	if (!pud)
>  		return -ENOMEM;
>  	do {
>  		next = pud_addr_end(addr, end);
> -		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
> -			return -ENOMEM;
> +		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift);
> +		if (err)
> +			return err;
>  	} while (pud++, addr = next, addr != end);
>  	return 0;
>  }
>  
>  static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
>  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> -		pgtbl_mod_mask *mask)
> +		pgtbl_mod_mask *mask, unsigned int shift)
>  {
>  	p4d_t *p4d;
>  	unsigned long next;
> +	int err;
>  
>  	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
>  	if (!p4d)
>  		return -ENOMEM;
>  	do {
>  		next = p4d_addr_end(addr, end);
> -		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
> -			return -ENOMEM;
> +		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift);
> +		if (err)
> +			return err;
>  	} while (p4d++, addr = next, addr != end);
>  	return 0;
>  }
>  
> -static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
> -		pgprot_t prot, struct page **pages)
> +/*
> + * It can take an array of pages which are not all contiguous, but it
> + * may have contiguous chunks, as hinted by @shift.
> + */
> +static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages, unsigned int shift)
>  {
>  	unsigned long start = addr;
>  	pgd_t *pgd;
> @@ -670,7 +701,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  		next = pgd_addr_end(addr, end);
>  		if (pgd_bad(*pgd))
>  			mask |= PGTBL_PGD_MODIFIED;
> -		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
> +		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
>  		if (err)
>  			break;
>  	} while (pgd++, addr = next, addr != end);
> @@ -693,27 +724,12 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
> -	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> -
>  	WARN_ON(page_shift < PAGE_SHIFT);
>
This is not about this patch but probably on that WARN_ON we should bail out
early.

--
Uladzislau Rezki

