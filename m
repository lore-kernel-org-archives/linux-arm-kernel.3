Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E11C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2kDcdHJk5/m7Tnc5mfqUNhIec3+WIpM8khGzPGZk/Q=; b=ZsX4wkc+W4ot6nTwpI1A4IwJV5
	OLLbgz0LVXbe2zBl2TEG3NQGMZ03eL+UL1YRV3tHZh5IzTi/CHHDZpWivPuiQ8z1EJg0CXqeuMvkd
	xEQn35sASIJ3nc2grvxkeBhqlpcSmpjlkZApGGwayAyn8vxjQjf8WQVJgtb1tkA8l5HYaR99DTHw8
	23Rz9QJ5tQbSvn+UmD1gAfnn90hiblUsO6eZedbGcu/1cIyE/kC8kgaxi5mBJl/3iwll5spmr1iDY
	xP7C7wwHPtqukYt+cFCpPtNAsHEiDaJ6pxfB9ouSnamV5kZqZ1MKl7z8PkbwYIMjkobMNu8k03hty
	fVgcyE+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Wzr-00000006ZrI-0PcW;
	Mon, 07 Sep 2026 10:54:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Wzp-00000006ZqI-2ht3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:54:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 676FA40DF5;
	Mon,  7 Sep 2026 10:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AB01F00A3D;
	Mon,  7 Sep 2026 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788778481;
	bh=K2kDcdHJk5/m7Tnc5mfqUNhIec3+WIpM8khGzPGZk/Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=SuDnVB4pyaKW01eUV/KfJVUgIhnfB3WyusYNcy3W+8WtmRXzuoXab8fluZqnpmpRW
	 73G5CItlhRtFrjBNUQSyUvtqkaXBgXfm+ux/m/wAORo4XZNTbisvJHBuQVNbt4AUxS
	 oD18aVTA2acfzFejjWvF+Tf42dINdkDsmL6SlQ4sgs30ldcF3bfCrbTZ4mfD2gxOjB
	 /tg/8Az6VP3WiwfjKW6Z2Pf/GsnAAzDjcbP4VFSNTJNgAglnC0fs4Am2Z2c7NpDxsw
	 Ub0oq2wnrrTCVy8ssp/49vxsv2gSTyZWKEEiQY40d1YNoq5wHf2rqlacXAOSScyyFF
	 mydrx0HiHzFNw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC v9 12/25] mm: kpkeys: Protect regular page tables
From: Mike Rapoport <rppt@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
In-Reply-To: <20260818-kpkeys-v9-12-743ad31b2c8f@arm.com>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-12-743ad31b2c8f@arm.com>
Date: Mon, 07 Sep 2026 13:54:14 +0300
Message-Id: <178877845406.3691569.12554855722197968629.b4-review@b4>
X-Mailer: b4 0.17-dev
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

Hi Kevin,

> If the kpkeys_hardened_pgtables feature is enabled, page table pages
> (PTPs) should be protected by modifying the linear mapping to map
> them with a privileged pkey (KPKEYS_PKEY_PGTABLES). This patch
> introduces a new page allocator for that purpose:
> 
> * kpkeys_pgtable_alloc() allocates a new PTP and sets the linear
>   mapping to KPKEYS_PKEY_PGTABLES for that page
> 
> * kpkeys_pgtable_free() frees such a PTP and restores the linear
>   mapping to the default pkey
> 
> This interface is then hooked into pagetable_alloc() and
> pagetable_free(), protecting all page tables created once the buddy
> allocator is available. Early page tables are allocated in other
> ways and will be protected in subsequent patches.
> 
> This implementation of kpkeys_pgtable_{alloc,free}() is minimal and
> relies on the linear map being fully PTE-mapped - otherwise
> calling set_memory_pkey() on a single page may result in splitting a
> block mapping, which in turn requires allocating a new PTP. A more
> elaborate implementation could be added later to handle this
> situation.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>
> diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
> index 23ae4ed512f52..288c8853eed60 100644
> --- a/include/linux/kpkeys.h
> +++ b/include/linux/kpkeys.h
> @@ -116,6 +116,9 @@ static inline bool kpkeys_hardened_pgtables_early_enabled(void)
>  	return arch_supports_kpkeys_early();
>  }
>  
> +struct page *kpkeys_pgtable_alloc(gfp_t gfp, unsigned int order);
> +void kpkeys_pgtable_free(struct page *page, unsigned int order);
> +
>  /*
>   * Should be called from mem_init(): as soon as the buddy allocator becomes
>   * available and before any call to pagetable_alloc().
> @@ -134,6 +137,13 @@ static inline bool kpkeys_hardened_pgtables_early_enabled(void)
>  	return false;
>  }
>  
> +static inline struct page *kpkeys_pgtable_alloc(gfp_t gfp, unsigned int order)
> +{
> +	return NULL;
> +}
> +
> +static inline void kpkeys_pgtable_free(struct page *page, unsigned int order) {}
> +
>  static inline void kpkeys_hardened_pgtables_init(void) {}
>  
>  #endif /* CONFIG_KPKEYS_HARDENED_PGTABLES */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 485df9c2dbddb..eea3131786b35 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -37,6 +37,7 @@
>  #include <linux/bitmap.h>
>  #include <linux/bitops.h>
>  #include <linux/iommu-debug-pagealloc.h>
> +#include <linux/kpkeys.h>
>  
>  struct mempolicy;
>  struct anon_vma;
> @@ -3682,7 +3683,12 @@ static inline bool ptdesc_test_kernel(const struct ptdesc *ptdesc)
>   */
>  static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int order)
>  {
> -	struct page *page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> +	struct page *page;
> +
> +	if (kpkeys_hardened_pgtables_enabled())
> +		page = kpkeys_pgtable_alloc(gfp | __GFP_COMP, order);
> +	else
> +		page = alloc_pages_noprof(gfp | __GFP_COMP, order);

Can we make it a sequence rahter than a branch?

kpkeys_pgtable_alloc() does alloc_pages and then sets their pkeys, so I
think something like this should work:

	page = alloc_pages_noprof(gfp | __GFP_COMP, order);
	if (!page)
		return NULL;
	err = kpkeys_pgtable_alloc(page);
	if (err) {
		__free_pages(page, order);
		return NULL;

with if (kpkeys_hardened_pgtables_enabled()) folded into
kpkeys_pgtable_alloc().

>  
>  	return page_ptdesc(page);
>  }
> @@ -3691,8 +3697,12 @@ static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int orde
>  static inline void __pagetable_free(struct ptdesc *pt)
>  {
>  	struct page *page = ptdesc_page(pt);
> +	unsigned int order = compound_order(page);
>  
> -	__free_pages(page, compound_order(page));
> +	if (kpkeys_hardened_pgtables_enabled())
> +		kpkeys_pgtable_free(page, order);
> +	else
> +		__free_pages(page, order);

And the same logic seem to apply here.

-- 
Sincerely yours,
Mike.


