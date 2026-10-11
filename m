Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B18CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDlRoiYs+oXn7JVOx13TUze+GLTM7H/QsH7PUCzNbOI=; b=t/5IuGvyo5LZBBWdd2EKgZd9bl
	rt6awOokhNKVKhZTMKga8yylAuDMc0QyrYih7LBwYM3t5vnBwejIZtGtUH3ofFoLtV9+hgzSBmD3/
	+8m/m/maBtpyDpwbFF8XUrEbq8nQbBbw4c5I75JqierS4PeGUP7MHDMU7E8Hz0vUiDBWEKEwjR7bR
	h1ZUF/0iV2NwIyvs1Y3mnF5WgRCOFcDQSncSHEzQhOg/xRr7hbKCfi88CKqzQdSqYCzwG+ZRkI6gM
	jDdpgwZeSb30gHpqcXyacOLM3BeyyHJkJ/iGg3dQHPvXYxLfGV7GXf6FTYYsAyRc8n70Dd098/spb
	KbwJDaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuYs-000000097vs-1vOd;
	Sun, 11 Oct 2026 14:30:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuYp-000000097uh-41fh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 14:30:01 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c2a4e013a44so165224866b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791728998; x=1792333798; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tDlRoiYs+oXn7JVOx13TUze+GLTM7H/QsH7PUCzNbOI=;
        b=fPZIZFTxa8eY8zE4jcjwaejFrIFTLzWJ7p0yTuvgL4hE3Dx0ccfEtSc2E3ZWmpObEs
         b8a6SdcxqHwKxtv2WdsARFLY2Qh79gUsFNaG0BBBDSdUkQdKCTp2OXGYqNEn4waEyLla
         mst0oaCbJ7QOxjtTnFJKwhMQUybblylcOw9GQShHl3WExamzAGqfEyGY9eQT0C3SbuGI
         SZvnRiUzIW2pFVcv6YjQJQ9g3WAK4RrAEdkTX0ZZnz1yJoMWw1qeBM4qOmxZTcrvqYPC
         Sfw9wZ6B5ooJEyqp8RbVDlbaZnoOeN0xvIhPv5oZLYD470mKDRBV2rsvF0fmrGN7Qcy+
         53ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728998; x=1792333798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDlRoiYs+oXn7JVOx13TUze+GLTM7H/QsH7PUCzNbOI=;
        b=wZ5qSU0WkxkVp/fQT9ITwlyrti5mh7lLAAf9b1jmPsKktbN+yAYHSOmZIlP7VwMKkf
         4I+d+9lB/q2Vm2QTvdn/hSNeCbX1MwYTacPeM7yH+PbdOnoU1gkcZfi38W3KcDEEHI2B
         PFN0JpxgjGqgwqK0MGIR/6NHjlZFujWn6YKH8zaYD0t0D0NeqWuButNsNa6vraPXcKV7
         STe3a9mDM7aF608SCpd3oGo+XPFS3Os+DKkm55csJ9XSdHA7is2nywn4TN7DH5vac9yE
         Lup9uEH05I3i7AIYgqt2KduCINT6ImH29wp4ZB3zYnNks7ichxqWaEH27EoaUna7OMG3
         3dLw==
X-Forwarded-Encrypted: i=1; AKwUvBxZ3R01zEAClWl0BexEWqNiz/EcrBOmxW45UIg2wJL3C51mQxr1w/ZGsRQkdhU/Xjxu30G+JvNyuXt7UvZTjvEf@lists.infradead.org
X-Gm-Message-State: AFq9FYIXrFfYdnF1UTh9JVXI7vQkSHGhHQcOTnVZqtqCup/aspUAo8Vy
	poQzNEruLOgKjzXNI4X6UEPtcIlQHC4TD/zwJG2rLuvSSOgP8Nkcu0cH
X-Gm-Gg: AYBFou2iwHp3Bh7gMED1KnCyMbOOzDUdHifLVVdYJjKWhLhIjhuUxEIW48eKXRogjsZ
	hWSbu4w3IGiZtYvNsks/tAUvBYkaJCjHkPcxnsSrnFhgAd9KdkpFDCuB1RkstzKUZGDpp969c1m
	5scKteTmWs9PDzKEYcCFI8Nd0/t4LXrFb8HBKGpYmk+1uuEHvSSIeb6rS9k+8DrKh3V1POz9jLX
	1fAWqk+0A/4iiPuaG6H7hb4c40AejvEjI2pk7dLtOa84VpJiCvhm7JNvjG1x/YXcQXVmNXdWK6v
	zz/msHkqEPtWf+JR6Y3DgNPJ2lmwUShLOFjyNAeqL4EVfTpbGPzQGS+dYWoZhiA1NpIc8KxBkeh
	YP1XvHSgzx/a/WFYGcifvJSkRYsLsmB8DB8DPizSdxGUdYklHfPaNEv0chr0tgZDArpbDLZn5tz
	Ehfr7f2iIkvy/UzRt5Kc0dhKwGaft1XfvwyMBa
X-Received: by 2002:a17:907:3f25:b0:c31:82aa:dd4c with SMTP id a640c23a62f3a-c31a9d15f06mr712746366b.24.1791728997857;
        Sun, 11 Oct 2026 07:29:57 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34f8bd471dsm13420566b.9.2026.10.11.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 07:29:57 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sun, 11 Oct 2026 16:29:55 +0200
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
Subject: Re: [PATCH v10 03/10] mm/vmalloc: use
 pte_set_huge()/pte_clear_huge() for PTE-level block mappings
Message-ID: <asudY_EhrT5fZGmZ@milan>
References: <20261002090947.869220-1-jiangwen6@xiaomi.com>
 <20261002090947.869220-4-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002090947.869220-4-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_073000_031284_E294F5B1 
X-CRM114-Status: GOOD (  25.65  )
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

On Fri, Oct 02, 2026 at 05:09:40PM +0800, Wen Jiang wrote:
> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
> the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
> 
> Now that arm64 and powerpc/8xx provide pte_set_huge() and
> pte_clear_huge(), add the generic fallbacks next to the existing
> pmd/pud_set_huge() family and convert vmap_pte_range() and
> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
> around the block-mapping paths are dropped, so PTE-level block mappings
> now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
> longer includes <linux/hugetlb.h>.
> 
> The fallbacks exist only to keep the build working on architectures
> without PTE-level block mapping support. They are unreachable there:
> the callers only run when arch_vmap_pte_range_map_size() or
> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
> which requires an arch implementation. BUILD_BUG() makes that
> explicit rather than silently doing nothing.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> ---
>  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>  mm/vmalloc.c            | 19 ++++++-------------
>  2 files changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8c093c119e5a8..a7fd51fec8a17 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
>  }
>  #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
>  
> +/*
> + * PTE-level block mappings for vmap.
> + *
> + * pte_set_huge() only has to be implemented by architectures whose
> + * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
> + */
> +#ifndef __HAVE_ARCH_PTE_SET_HUGE
> +static inline void pte_set_huge(pte_t *ptep, unsigned long addr,
> +				phys_addr_t phys, pgprot_t prot,
> +				unsigned long size)
> +{
> +	BUILD_BUG();
> +}
> +#endif
> +
> +/*
> + * Likewise, pte_clear_huge() only has to be implemented by architectures
> + * whose arch_vmap_pte_range_unmap_size() can return a size other than
> + * PAGE_SIZE.
> + */
> +#ifndef __HAVE_ARCH_PTE_CLEAR_HUGE
> +static inline pte_t pte_clear_huge(pte_t *ptep, unsigned long addr,
> +				   unsigned long size)
> +{
> +	BUILD_BUG();
> +	return __pte(0);
> +}
> +#endif
> +
>  #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  /*
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index bea9f76ed7e74..fb757d95bde25 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -38,7 +38,6 @@
>  #include <linux/rbtree_augmented.h>
>  #include <linux/overflow.h>
>  #include <linux/pgtable.h>
> -#include <linux/hugetlb.h>
>  #include <linux/sched/mm.h>
>  #include <asm/tlbflush.h>
>  #include <asm/shmparam.h>
> @@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	pte_t *pte;
>  	u64 pfn;
>  	struct page *page;
> -	unsigned long size = PAGE_SIZE;
> +	unsigned long size;
>  
>  	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>  		return -EINVAL;
> @@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			BUG();
>  		}
>  
> -#ifdef CONFIG_HUGETLB_PAGE
>  		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
>  		if (size != PAGE_SIZE) {
> -			pte_t entry = pfn_pte(pfn, prot);
> -
> -			entry = arch_make_huge_pte(entry, ilog2(size), 0);
> -			set_huge_pte_at(&init_mm, addr, pte, entry, size);
> +			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
>
As far as i understand, X86_64 arches do not use this path. This
specifically is only for ARM64 or powerpc. pte_set_huge() makes me
thinking about huge-page mappings(PMD/PUD/hugetlb). This helper is
about mutli page mapping on the PTE level.

Better naming? pte_set_large()?

Any thoughts?

Other then that:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

