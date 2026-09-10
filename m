Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B22C79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H0fpNs1u2zA59LHwwiy7WHc6/WIJfww4jvMkei3i1w=; b=nq+6Hsmy3UGNIsI2K3BKziWsn7
	yKGHYiMA1nN6HaD/8g+BrimbXtQz8aew4nUemQeaBDUJRP+KsAvkreqaaB2bifYL9UGFVsC0p/jA8
	tRURJ77DgrIBFhCVPnn25kPu38nKVCoMnJQxZz9PVXLv8OS3CHhIcYGIcU9ZLkA3Dn/L4NIa2qH1y
	GwZZb4hFm7lcT5iMIDGs6Z7NdDHEzxoM1cEqbRXdQJk6UqLPDmRrxQ5OQXhev2E6fU3l/aItWF0Cs
	XscmPsl8AEIFb3A52MA5Vq6E8eGjp7SECj/5S6Q8uS+gz5aYF/SXZzwwOxspnhbkjvyV2NdJCZx2Z
	3INfqomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z8s-0000000DcXv-2TDf;
	Thu, 10 Sep 2026 07:24:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z8r-0000000DcXf-0Bod
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:24:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8E5441FB1;
	Thu, 10 Sep 2026 07:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D771F00893;
	Thu, 10 Sep 2026 07:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025056;
	bh=5H0fpNs1u2zA59LHwwiy7WHc6/WIJfww4jvMkei3i1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nGNmtk/uUfrvTANOP4Z71YxO05bFTpamO/8A3iABLVEZ0H5p58w4eKN4eDoxZMawr
	 u2Qo+FzRBiKnOi4Ut0BI5PjVKJ8UCnbphj/n7kwx+HsMYerTZNtZSf9TZy4mCuBKEx
	 GTqOpjgvxWXOpM/LV5M5WO3dgUGgkaA69lsELeiMaOV07HAwo2+yOi3d/12/XGPqAe
	 DbQUSH7ZDKsYJP1GRszmNRlCszWRZCUP5nsQ3XtmpPxUrN4MMvGRGMebRcM+I4T1OF
	 YpWFa/BbpRw1lnLTJau/r1dkERdMVkVYkNL4dYaSkg0bwyDi8/CkxjyB3XZ9Vm7jBL
	 J1MEL62jLCcuw==
Date: Thu, 10 Sep 2026 10:24:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org,
	ljs@kernel.org, usama.arif@linux.dev, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, liam@infradead.org,
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com,
	baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, luto@kernel.org,
	peterz@infradead.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
Message-ID: <aqJbFXjU53_D7SoP@kernel.org>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
 <1d5ac9d7-48ce-4fee-b893-f646bade4a86@kernel.org>
 <CA+qSx6yjiXJkQm=hi=F8=_=DU0x_usSuXnL_1yuy0fUU9UU-Zg@mail.gmail.com>
 <d3723be0-46f4-4025-b526-e1bb3cc2cad6@kernel.org>
 <CA+qSx6x2-Md9uVZo+HV0z5CfmGPDzhL482eJNnM2VYVtn_e72w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+qSx6x2-Md9uVZo+HV0z5CfmGPDzhL482eJNnM2VYVtn_e72w@mail.gmail.com>
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

On Thu, Sep 10, 2026 at 02:22:25PM +0800, Xueyuan Chen wrote:
> On Wed, Sep 9, 2026 at 11:18 PM David Hildenbrand (Arm)
> <david@kernel.org> wrote:
> >
> > On 9/8/26 16:48, Xueyuan Chen wrote:
> > > On Tue, Sep 8, 2026 at 4:30 PM David Hildenbrand (Arm) <david@kernel.org> wrote:
> > >>
> > >> On 9/1/26 17:18, Xueyuan Chen wrote:
> > >>> The persistent huge zero folio is shared globally and should stay zero
> > >>> after initialization. As Jann Horn pointed out [1], kernel bugs have
> > >>> ended up writing to pages that were meant to be read-only, including in
> > >>> security-sensitive cases. Making the folio read-only in the direct map
> > >>> turns such writes into faults instead of silent zero-page corruption.
> > >>>
> > >>> Add a page-based helper consistent with the existing direct-map interfaces.
> > >>> Handle TLB invalidation in the architecture implementation; unsupported
> > >>> architectures retain their current behavior.
> > >>>
> > >>> Protect the folio after initialization. Skip highmem folios, which have no
> > >>> permanent direct-map mapping.
> > >>>
> > >>> Inspired by Jann Horn's read-only zero page work [1] and follow-up
> > >>> discussion [3] with Yang Shi.
> > >>>
> > >>> Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@google.com [1]
> > >>> Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org [2]
> > >>> Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com [3]
> > >>>
> > >>> Suggested-by: David Hildenbrand <david@kernel.org>
> > >>> Suggested-by: Usama Arif <usama.arif@linux.dev>
> > >>> Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > >>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > >>> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > >>> ---
> > >>>  include/linux/set_memory.h | 17 +++++++++++++++++
> > >>>  mm/huge_memory.c           | 13 ++++++++++---
> > >>>  2 files changed, 27 insertions(+), 3 deletions(-)
> > >>>
> > >>> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> > >>> index 3fe293cfed8c..ed9ce04b18a1 100644
> > >>> --- a/include/linux/set_memory.h
> > >>> +++ b/include/linux/set_memory.h
> > >>> @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
> > >>>  #endif
> > >>>  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> > >>>
> > >>> +#ifndef set_direct_map_ro
> > >>> +/**
> > >>> + * set_direct_map_ro - make a direct-map range read-only
> > >>> + * @page: first page in the direct-map range
> > >>> + * @nr: number of pages in the range
> > >>> + *
> > >>> + * Make the direct-map range starting at @page read-only and invalidate stale
> > >>> + * writable translations before returning.
> > >>> + *
> > >>> + * Return: 0 on success, or a negative error code on failure.
> > >>> + */
> > >>> +static inline int set_direct_map_ro(struct page *page, unsigned int nr)
> > >>> +{
> > >>> +     return 0;
> > >>> +}
> > >>> +#endif
> > >>> +
> > >>>  #ifdef CONFIG_X86_64
> > >>>  int set_mce_nospec(unsigned long pfn);
> > >>>  int clear_mce_nospec(unsigned long pfn);
> > >>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > >>> index 54494c3fa983..742283b36d74 100644
> > >>> --- a/mm/huge_memory.c
> > >>> +++ b/mm/huge_memory.c
> > >>> @@ -42,6 +42,7 @@
> > >>>  #include <linux/pgalloc_tag.h>
> > >>>  #include <linux/pagewalk.h>
> > >>>  #include <linux/cleanup.h>
> > >>> +#include <linux/set_memory.h>
> > >>>
> > >>>  #include <asm/tlb.h>
> > >>>  #include "internal.h"
> > >>> @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
> > >>>       huge_zero_folio = alloc_huge_zero_folio();
> > >>>       if (!huge_zero_folio) {
> > >>>               pr_warn("Allocating persistent huge zero folio failed\n");
> > >>> -     } else {
> > >>> -             huge_zero_pfn = folio_pfn(huge_zero_folio);
> > >>> -             count_vm_event(THP_ZERO_PAGE_ALLOC);
> > >>> +             return 0;
> > >>>       }
> > >>> +
> > >>> +     huge_zero_pfn = folio_pfn(huge_zero_folio);
> > >>> +     count_vm_event(THP_ZERO_PAGE_ALLOC);
> > >>> +
> > >>> +     /* Highmem folios have no permanent direct-map mapping to protect. */
> > >>> +     if (!folio_test_highmem(huge_zero_folio))
> > >>> +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_PMD_NR);
> > >>
> > >> Assuming we keep the page-based approach, can't we just move the highmem test in
> > >> there?
> > >
> > > Hi David,
> > >
> > > We can move the check into set_direct_map_ro(). However, on x86,
> > > set_direct_map_invalid_noflush() and set_direct_map_default_noflush()
> > > also expect callers to exclude highmem pages.
> > >
> > > Would it make sense to make highmem a documented no-op for those
> > > helpers as well, so the direct-map APIs handle it consistently?
> >
> > I think getting something consistent for now is the most important thing. :)
> >
> Hi David,
> 
> OK, I'll move the highmem check into set_direct_map_ro().

Consistent means leaving highmem check in the caller ...
 
> Should I also update the x86 set_direct_map_invalid_noflush() and
> set_direct_map_default_noflush() helpers in this series to skip
> highmem pages?

... or checking it in all set_direct_map functions.

I'd keep the check in huge_zero_init() in this patchset.

> Thanks,
> Xueyuan
> > --
> > Cheers,
> >
> > David

-- 
Sincerely yours,
Mike.

