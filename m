Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FFFC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVH46s0TiBnSL1nhlyLYQT7Nebe0o5BJiT5/S7ZnuZY=; b=e1CE941Xosq8Ab7FgLbBTCwMNk
	WNerL0oYhDrh36+d/Be404x1jRgCsln/qDJ1MZdkJu5jufuDF50Lga1joxiKbN77GGCCwQWpC3sQz
	ppxQFZDnl7yBOzMoQgLHjVtGbOixe7wIYHeL8dKbhLQbdz678tnFAUFMuhijczsn/lekJSwi5Rwz4
	n0UP4r2HJujTC036jNAm1oKOOCakx7HeAijMxxLOY5wzIjhyTvK+gfapu+UnzTC0l/RGpMUOf6ppH
	jTcF02etvggfMkL4Ter2Le+G4ey8bxhFkfACdY5chkb3Nx2c0ratrf0EIApzAqQ4bDG3uurde/EDZ
	S0fFKujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23es-0000000Gvcd-1aZs;
	Thu, 03 Sep 2026 09:22:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23er-0000000GvcJ-1QMG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:22:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BE3EB42B20;
	Thu,  3 Sep 2026 09:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969871F000E9;
	Thu,  3 Sep 2026 09:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427376;
	bh=CVH46s0TiBnSL1nhlyLYQT7Nebe0o5BJiT5/S7ZnuZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CsLTmwDYUQuPdEGJ2URh4YYrVQjku/PYtQd8szB9HFBHKuxNiHG8jlkrL7gi1baJv
	 baOlP721yc+Gapvn+co/bsCE+vzOe7wj38uGpYqZPkxomRAwIz0bQTUhRLhTAuqqra
	 dcAYfgKFIupV+om73sgPaweqXIGMwkg5fWtKJMpvY7FG1n04OkQOJYThS8OWkrXRF/
	 6d+zCI/PEFFnvI3TBktpF/UQ7XAfs6aQrSu5o0XLNpvLlz/KIh0d4q4F8mng6kmC35
	 gHgYzeK4HV1Zw3Tpumbe8aupeoEBK6jboDtDlQeHq19XetZJxR/N2esfUJW+ShNiZf
	 qTij8AvQ7COkA==
Date: Thu, 3 Sep 2026 12:22:45 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
	kas@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Message-ID: <apk8ZRr6do_YAlzf@kernel.org>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
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

On Tue, Sep 01, 2026 at 11:18:16PM +0800, Xueyuan Chen wrote:
> The persistent huge zero folio is shared globally and should stay zero
> after initialization. As Jann Horn pointed out [1], kernel bugs have
> ended up writing to pages that were meant to be read-only, including in
> security-sensitive cases. Making the folio read-only in the direct map
> turns such writes into faults instead of silent zero-page corruption.
> 
> Add a page-based helper consistent with the existing direct-map interfaces.
> Handle TLB invalidation in the architecture implementation; unsupported
> architectures retain their current behavior.
> 
> Protect the folio after initialization. Skip highmem folios, which have no
> permanent direct-map mapping.
> 
> Inspired by Jann Horn's read-only zero page work [1] and follow-up
> discussion [3] with Yang Shi.
> 
> Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@google.com [1]
> Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org [2]
> Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com [3]
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Suggested-by: Usama Arif <usama.arif@linux.dev>
> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  include/linux/set_memory.h | 17 +++++++++++++++++
>  mm/huge_memory.c           | 13 ++++++++++---
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> index 3fe293cfed8c..ed9ce04b18a1 100644
> --- a/include/linux/set_memory.h
> +++ b/include/linux/set_memory.h
> @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
>  #endif
>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
>  
> +#ifndef set_direct_map_ro
> +/**
> + * set_direct_map_ro - make a direct-map range read-only
> + * @page: first page in the direct-map range
> + * @nr: number of pages in the range
> + *
> + * Make the direct-map range starting at @page read-only and invalidate stale
> + * writable translations before returning.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +static inline int set_direct_map_ro(struct page *page, unsigned int nr)
> +{
> +	return 0;
> +}
> +#endif
> +
>  #ifdef CONFIG_X86_64
>  int set_mce_nospec(unsigned long pfn);
>  int clear_mce_nospec(unsigned long pfn);
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 54494c3fa983..742283b36d74 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -42,6 +42,7 @@
>  #include <linux/pgalloc_tag.h>
>  #include <linux/pagewalk.h>
>  #include <linux/cleanup.h>
> +#include <linux/set_memory.h>
>  
>  #include <asm/tlb.h>
>  #include "internal.h"
> @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
>  	huge_zero_folio = alloc_huge_zero_folio();
>  	if (!huge_zero_folio) {
>  		pr_warn("Allocating persistent huge zero folio failed\n");
> -	} else {
> -		huge_zero_pfn = folio_pfn(huge_zero_folio);
> -		count_vm_event(THP_ZERO_PAGE_ALLOC);
> +		return 0;
>  	}
> +
> +	huge_zero_pfn = folio_pfn(huge_zero_folio);
> +	count_vm_event(THP_ZERO_PAGE_ALLOC);
> +
> +	/* Highmem folios have no permanent direct-map mapping to protect. */
> +	if (!folio_test_highmem(huge_zero_folio))
> +		set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_PMD_NR);

Sorry, I don't remember if it was discussed previously, but why can't we
use the existing set_memory_ro() here?

> +
>  	return 0;
>  }
>  
> -- 
> 2.47.3
> 

-- 
Sincerely yours,
Mike.

