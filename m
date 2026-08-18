Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA4EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geXWrV0/2z0kpozDGOhKEC+5F4VQGLvn66X7G1ETdLM=; b=uE2KyVbu7ZSvyMmOVwcU1HZ9RS
	CP1T1Wo3vicpyuuLjrtH/WZfypCv2gcriFzdmdgplHKzk48eA+eVw1Y9Gx7tOFWjDYrWZk6Gytesq
	e4sh8NTJCzPW7htSkt1WzIXcvu/Q1fWyYerrHgXEMZZ7lbMWKljsm6Dm88I4JQgTy0TYeg33Q3omm
	fBsBAdrmEJV5iA0VAaLYg8aelwcZ5FH4bJljebTAahISx0O86GoAW/TKixmW0JUD9/6c0OEJeT4AW
	vIj2JUKdF3WpgzRR+ohLWYnM3Ty+v2pEGxZ8alq6x44IAq4w3FI60BdbuUlYVKMAOogEEr96Jb7Dw
	zLmYX74w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwM7s-00000008J32-1IY3;
	Tue, 18 Aug 2026 15:53:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwM7o-00000008J2Q-1rvT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:53:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3316B1A00;
	Tue, 18 Aug 2026 08:53:10 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AEF53F763;
	Tue, 18 Aug 2026 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787068394; bh=n5Pn/EgrqrIEFc5DK4mgxFWT/9EScWqa5GcuyDfAyeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KiMNDdqo79AFXbKqbuzUTJzNZjfCcxsyG80l6DMNVWk3SK8nXkyidq4VEkkObM4lg
	 2k296O5lKEZVD5XqetWIn+E/GvtX7ic8xbAsx7MBDnbniwPndVR5pUbaKDi8vAr2ak
	 /6nbyhSweQ+975pWMIkNhvlMelJpufEsIPDC/zOk=
Date: Tue, 18 Aug 2026 16:53:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Houghton <jthoughton@google.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Nikos Nikoleris <nikos.nikoleris@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>,
	Frank van der Linden <fvdl@google.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 11/18] hugetlb_vmemmap: Use try_populate_vmemmap_pmd for
 replacing in-use PMDs
Message-ID: <aoR_5LHPsVXUnxt6@arm.com>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-12-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708031129.3503195-12-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_085316_664286_B7277FC1 
X-CRM114-Status: GOOD (  28.19  )
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

On Wed, Jul 08, 2026 at 03:11:21AM +0000, James Houghton wrote:
> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
> index 1b4509d3382c..c8946250d431 100644
> --- a/arch/arm64/include/asm/pgalloc.h
> +++ b/arch/arm64/include/asm/pgalloc.h
> @@ -121,4 +121,13 @@ pmd_populate(struct mm_struct *mm, pmd_t *pmdp, pgtable_t ptep)
>  		       PMD_TYPE_TABLE | PMD_TABLE_AF | PMD_TABLE_PXN);
>  }
>  
> +#define __HAVE_ARCH_TRY_POPULATE_VMEMMAP_PMD
> +static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable,
> +					   unsigned long addr)
> +{
> +	/* BBML2_NOABORT is required. Its presence has been checked. */
> +	pmd_populate_kernel(&init_mm, pmdp, pgtable);
> +	return 0;
> +}

This patch adds the same function in 4 different arch files. Can we not
have a single generic implementation in linux/pgalloc.h, bracketed by
some ARCH_WANTS_* (macro or config)?

I think the same goes for patch 4 with try_update_vmemmap_pte(), we can
reduce the code duplication.

> diff --git a/include/linux/pgalloc.h b/include/linux/pgalloc.h
> index 9174fa59bbc5..ed446d95ca37 100644
> --- a/include/linux/pgalloc.h
> +++ b/include/linux/pgalloc.h
> @@ -26,4 +26,24 @@
>  			arch_sync_kernel_mappings(addr, addr);		\
>  	} while (0)
>  
> +#ifndef __HAVE_ARCH_TRY_POPULATE_VMEMMAP_PMD
> +/*
> + * try_populate_vmemmap_pmd - Populate a PMD that is in use by the vmemmap.
> + * @addr: Base address of the remapped PMD.
> + * @pmdp: Page table pointer to be overwritten.
> + * @pgtable: Pointer to the page table that the new PMD will point to.
> + *
> + * This function is only to be used to update PMDs that map the vmemmap to
> + * point to a page of already-populated PTEs that map the same pages.
> + *
> + * Implementations of this function must ensure that, while the update is taking
> + * place, CPUs will not fault on the remapped virtual address range.
> + */
> +static inline int try_populate_vmemmap_pmd(pmd_t *pmdp, pte_t *pgtable,
> +					   unsigned long addr)

Nit: if we follow try_update_vmemmap_pte(), we could place 'addr' first.
It matches pgd_populate_kernel() as well in this file.

> +{
> +	return -EOPNOTSUPP;
> +}
> +#endif
> +
>  #endif /* _LINUX_PGALLOC_H */
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index 977249e22ed0..b445febac0d2 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -55,6 +55,7 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
>  			     struct vmemmap_remap_walk *walk)
>  {
>  	pmd_t __pmd;
> +	int ret;
>  	int i;
>  	unsigned long addr = start;
>  	pte_t *pgtable;
> @@ -74,8 +75,15 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
>  		set_pte_at(&init_mm, addr, pte, entry);
>  	}
>  
> +	ret = 0;
>  	spin_lock(&init_mm.page_table_lock);
>  	if (likely(pmd_leaf(*pmd))) {
> +		/* Make pte visible before pmd. See comment in pmd_install(). */
> +		smp_wmb();
> +		ret = try_populate_vmemmap_pmd(pmd, pgtable, start);
> +		if (ret)
> +			goto free;
> +
>  		/*
>  		 * Higher order allocations from buddy allocator must be able to
>  		 * be treated as independent small pages (as they can be freed
> @@ -84,21 +92,17 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct page *head, unsigned long start,
>  		if (!PageReserved(head))
>  			split_page(head, get_order(PMD_SIZE));
>  
> -		/* Make pte visible before pmd. See comment in pmd_install(). */
> -		smp_wmb();
> -		/*
> -		 * On arm64, this requires BBML2_NOABORT. Its support has
> -		 * already been checked.
> -		 */
> -		pmd_populate_kernel(&init_mm, pmd, pgtable);
>  		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
>  			flush_tlb_kernel_range(start, start + PMD_SIZE);
> -	} else {
> -		pte_free_kernel(&init_mm, pgtable);
> -	}
> -	spin_unlock(&init_mm.page_table_lock);
> +	} else
> +		goto free;
>  
> -	return 0;
> +out:
> +	spin_unlock(&init_mm.page_table_lock);
> +	return ret;
> +free:
> +	pte_free_kernel(&init_mm, pgtable);
> +	goto out;
>  }

Would 'free' first with fall through 'out' read better?

-- 
Catalin

