Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E2EC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 10:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snH3EbBb/iu4/hpnhb7Q5dASnycbjTC3AQM0O003+3M=; b=f4ByNp6/KLDuHFQs5Au7kQpdcq
	Paw/MvQWQ7Mzmi1XGX5gFioYP3/pQEUvHrGw5VzT16er0auC4xSSC7RpotnvjiAqCKY1CdRg/iAYn
	WMfF9QAkO/Xu6j/CSKq6mpXmgo59Zo/JBLLyVjzHdrcQzpYKA7fUJNQdKtDzE7xVmT7tMoqESpino
	OmeVz/11kjsTbZbLJXMPTQVFJshfwXOQ++4WZ2senBGUqFtdyoPb1IJOyFw01uIZ9zMqhXhRL15qL
	BO5vGChkn9TjXbZLCGuc85ZNHsiKj0HLP8Sr1obSiVX1svt41Rb4yvzDirYC7Yqn4ii6z6eJTlise
	jCrX3iZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x39g2-00000004t9M-0DIA;
	Sun, 06 Sep 2026 10:00:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x39fz-00000004t9C-431T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 10:00:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F82D43D7C;
	Sun,  6 Sep 2026 10:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7151F00A3A;
	Sun,  6 Sep 2026 10:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788688838;
	bh=snH3EbBb/iu4/hpnhb7Q5dASnycbjTC3AQM0O003+3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Akn72PWIRJjwB6g+ptMXNhnydqgYB8YJdpJbWNP83TRqfLEPm6hacZqV9dTqOwkiN
	 HOC863VLgNfr8uXx/bu+2eqqCfm8crNSNg8eS2E4dk8oFFSQX/z2ECjQ+FHOvIs5Cr
	 Dn0Ws1XP98TBSlQJHHebBauNHrwOLGAoGYr/5E8RRZg7itrF4eSjIEnQ0jC0av8TvL
	 8ZeOHsokWT65OKsh8d7cTYP+aoeLFFE8FbNYwjZsIoD3/dUC3f8XKU/PlvEG4RLQSp
	 wVfhX0EnU1daZTI3X6ha/cPMtcae2UoCguWVUAJTPE9bVs1js6l0PjejQP82bmHtlS
	 OfRV0zoMv61iA==
Date: Sun, 6 Sep 2026 13:00:25 +0300
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
Message-ID: <ap05ue1pq3TgHOS6@kernel.org>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
 <apk8ZRr6do_YAlzf@kernel.org>
 <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
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

On Thu, Sep 03, 2026 at 08:49:52PM +0800, Xueyuan Chen wrote:
> On Thu, Sep 3, 2026 at 5:22 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Tue, Sep 01, 2026 at 11:18:16PM +0800, Xueyuan Chen wrote:
> > > The persistent huge zero folio is shared globally and should stay zero
> > > after initialization. As Jann Horn pointed out [1], kernel bugs have
> > > ended up writing to pages that were meant to be read-only, including in
> > > security-sensitive cases. Making the folio read-only in the direct map
> > > turns such writes into faults instead of silent zero-page corruption.
> > >
> > > Add a page-based helper consistent with the existing direct-map interfaces.
> > > Handle TLB invalidation in the architecture implementation; unsupported
> > > architectures retain their current behavior.
> > >
> > > Protect the folio after initialization. Skip highmem folios, which have no
> > > permanent direct-map mapping.
> > >
> > > Inspired by Jann Horn's read-only zero page work [1] and follow-up
> > > discussion [3] with Yang Shi.
> > >
> > > Link: https://lore.kernel.org/r/20260508-ro-zeropage-v1-1-9808abc20b49@google.com [1]
> > > Link: https://lore.kernel.org/r/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org [2]
> > > Link: https://lore.kernel.org/r/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com [3]
> > >
> > > Suggested-by: David Hildenbrand <david@kernel.org>
> > > Suggested-by: Usama Arif <usama.arif@linux.dev>
> > > Co-developed-by: Lance Yang <lance.yang@linux.dev>
> > > Signed-off-by: Lance Yang <lance.yang@linux.dev>
> > > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > ---
> > >  include/linux/set_memory.h | 17 +++++++++++++++++
> > >  mm/huge_memory.c           | 13 ++++++++++---
> > >  2 files changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> > > index 3fe293cfed8c..ed9ce04b18a1 100644
> > > --- a/include/linux/set_memory.h
> > > +++ b/include/linux/set_memory.h
> > > @@ -54,6 +54,23 @@ static inline bool can_set_direct_map(void)
> > >  #endif
> > >  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> > >
> > > +#ifndef set_direct_map_ro
> > > +/**
> > > + * set_direct_map_ro - make a direct-map range read-only
> > > + * @page: first page in the direct-map range
> > > + * @nr: number of pages in the range
> > > + *
> > > + * Make the direct-map range starting at @page read-only and invalidate stale
> > > + * writable translations before returning.
> > > + *
> > > + * Return: 0 on success, or a negative error code on failure.
> > > + */
> > > +static inline int set_direct_map_ro(struct page *page, unsigned int nr)
> > > +{
> > > +     return 0;
> > > +}
> > > +#endif
> > > +
> > >  #ifdef CONFIG_X86_64
> > >  int set_mce_nospec(unsigned long pfn);
> > >  int clear_mce_nospec(unsigned long pfn);
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 54494c3fa983..742283b36d74 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -42,6 +42,7 @@
> > >  #include <linux/pgalloc_tag.h>
> > >  #include <linux/pagewalk.h>
> > >  #include <linux/cleanup.h>
> > > +#include <linux/set_memory.h>
> > >
> > >  #include <asm/tlb.h>
> > >  #include "internal.h"
> > > @@ -291,10 +292,16 @@ static int __init huge_zero_init(void)
> > >       huge_zero_folio = alloc_huge_zero_folio();
> > >       if (!huge_zero_folio) {
> > >               pr_warn("Allocating persistent huge zero folio failed\n");
> > > -     } else {
> > > -             huge_zero_pfn = folio_pfn(huge_zero_folio);
> > > -             count_vm_event(THP_ZERO_PAGE_ALLOC);
> > > +             return 0;
> > >       }
> > > +
> > > +     huge_zero_pfn = folio_pfn(huge_zero_folio);
> > > +     count_vm_event(THP_ZERO_PAGE_ALLOC);
> > > +
> > > +     /* Highmem folios have no permanent direct-map mapping to protect. */
> > > +     if (!folio_test_highmem(huge_zero_folio))
> > > +             set_direct_map_ro(folio_page(huge_zero_folio, 0), HPAGE_PMD_NR);
> >
> > Sorry, I don't remember if it was discussed previously, but why can't we
> > use the existing set_memory_ro() here?
> 
> Hi Mike,
> 
> We want to change the linear map here, but arm64 set_memory_ro() only
> works on vmalloc addresses.

I believe this is an historical artifact. change_memory_common() already
updates the linear map when a vmalloc mapping switches to RO and the system
supports it.

I believe arm64::set_memory_ro() can change the linear map in the general
case as well as long as can_set_direct_map() is true.

> So a new helper is needed on arm64, and x86 implements the same
> helper to keep the two architectures consistent. On x86 it is
> basically set_memory_ro() minus the alias check.
> 
> Thanks,
> Xueyuan
> 
> >
> > > +
> > >       return 0;
> > >  }
> > >
> > > --
> > > 2.47.3
> > >
> >
> > --
> > Sincerely yours,
> > Mike.

-- 
Sincerely yours,
Mike.

