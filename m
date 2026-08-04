Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB1BC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DMaTv2Q6Oy51TcvD7WIgdBHhGsFMUSAF28itA1CFi0=; b=QIFQsy4VzNyLHPsbLuTuSx9BN8
	yuoGZ7RnTGN2xhyZHfXZ6N0m7jKIhsg4rGi8p5wKgTdZxDJvbL2OunS5g8PJlC+FtIqOdwRTzXEYI
	5KphxgMXm8GxEYWzwJR20anHU2twBIkapHdWGatzT40CbKUKG5Vo65f3CiWn5+l4Rwjyq4vqwGDUo
	cb0HKAwmBHfMuaI2voI1fslEp1yV/P77yFr/9XaOr3u7IJzPGfj4QOHw5Nbt57v+dioieLX6aUmbJ
	fxrGcj2SwS68G9lDqEG0h9Ycls2ysK1F2ymdZwa+2qi2frogAP0/SydS/DQaKh8Vqg3dFT9WdYxEW
	2Qt6xztg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGJP-000000026Tj-1qz4;
	Tue, 04 Aug 2026 14:40:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGJN-000000026TK-3BQD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:40:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D76AA60A8D;
	Tue,  4 Aug 2026 14:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6604E1F000E9;
	Tue,  4 Aug 2026 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785854408;
	bh=5DMaTv2Q6Oy51TcvD7WIgdBHhGsFMUSAF28itA1CFi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GGBdZNk/Xa9xVXhgFIZGWqkFOviRcHe9jUue2aUFXYg4P5oLfFH60mIGKg8BUFZQV
	 uUS69OJSjCuvI8HCZpSOG89Aeu/BwxtDm4yWlKnnmu0rPzTuKBPtmsaWp25cAlH700
	 6EAM0o+qjY51K4I6NDRhi5eqAqahIYxrrxO9ancACkWghQEc6cG6Ar6qPTITinnkwE
	 UTvYLh373bOEgA0OfRAup1bVsYDcJWi5PNH/XUbTaJkrm8wEGX/sEeiCkZK0F3Isce
	 LVCtluPifQSPI81NK7Wge1jz8fClMdxJVfCyBEd6tJOy2V7GNK1AJBNGH0W5XEVHV9
	 3LUcPmyfRC8HQ==
Date: Tue, 4 Aug 2026 15:40:02 +0100
From: Will Deacon <will@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
	catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com,
	anshuman.khandual@arm.com, david@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com,
	Wen Jiang <jiangwen6@xiaomi.com>, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v7 1/7] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
Message-ID: <anH5wnXvAhoLWmH1@willie-the-truck>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-2-jiangwen6@xiaomi.com>
 <amiabgyHSz3ZYY5k@willie-the-truck>
 <CAGsJ_4zgFk1iaQWisYMOR4iFxonwDskRt3Gte0cEts1q9hxibA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zgFk1iaQWisYMOR4iFxonwDskRt3Gte0cEts1q9hxibA@mail.gmail.com>
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

On Wed, Jul 29, 2026 at 05:47:34AM +0800, Barry Song wrote:
> On Tue, Jul 28, 2026 at 8:03 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Wed, Jul 15, 2026 at 08:08:07PM +0800, Wen Jiang wrote:
> > > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> > >
> > > For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
> > > we can handle CONT_PTE_SIZE groups together.
> > >
> > > These additional sizes are mapping spans used by non-hugetlbfs(vmalloc)
> > > mm code, not new HugeTLB hstate sizes.
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > Tested-by: Leo Yan <leo.yan@arm.com>
> > > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > > ---
> > >  arch/arm64/mm/hugetlbpage.c | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> > > index a42c05cf56408..7ce159483a354 100644
> > > --- a/arch/arm64/mm/hugetlbpage.c
> > > +++ b/arch/arm64/mm/hugetlbpage.c
> > > @@ -94,6 +94,11 @@ static int find_num_contig(struct mm_struct *mm, unsigned long addr,
> > >       return CONT_PTES;
> > >  }
> > >
> > > +/*
> > > + * num_contig_ptes(), set_huge_pte_at() and arch_make_huge_pte() can be
> > > + * used by non-hugetlbfs(vmalloc) mm code to set multiple huge mappings
> > > + * at the PTE level.
> > > + */
> > >  static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
> > >  {
> > >       int contig_ptes = 1;
> > > @@ -110,6 +115,12 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
> > >               contig_ptes = CONT_PTES;
> > >               break;
> > >       default:
> > > +             if (size > 0 && size < PMD_SIZE &&
> > > +                             IS_ALIGNED(size, CONT_PTE_SIZE)) {
> > > +                     *pgsize = PAGE_SIZE;
> > > +                     contig_ptes = size >> PAGE_SHIFT;
> > > +                     break;
> > > +             }
> >
> > Under which circumstances would you get a size of 0 here?
> >
> > Given that you're relying on arch_vmap_pte_range_map_size() to give you
> > a well-formed size, why isn't if sufficient to check only the alignment?
> 
> Thanks very much for your review.
> 
> Are you suggesting the change below? If so, I'm fine with it.
> I guess the current code is just being overly cautious for
> defensive programming.
> 
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 8429d220660b..c1af52ba572d 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -115,8 +115,7 @@ static inline int num_contig_ptes(unsigned long
> size, size_t *pgsize)
>                 contig_ptes = CONT_PTES;
>                 break;
>         default:
> -               if (size > 0 && size < PMD_SIZE &&
> -                               IS_ALIGNED(size, CONT_PTE_SIZE)) {
> +               if (IS_ALIGNED(size, CONT_PTE_SIZE)) {
>                         *pgsize = PAGE_SIZE;
>                         contig_ptes = size >> PAGE_SHIFT;
>                         break;
> 

Yeah, that's what I had in mind.

> > >               WARN_ON(!__hugetlb_valid_size(size));
> >
> > I agree with David that it's messy having hugetlb tangled up in here.
> > It means this validity check is now going to miss some genuinely bogus
> > cases for the hugetlb path (as opposed to the vmalloc path).
> 
> I agree that coupling hugetlb with vmalloc is not ideal. As I
> explained to David, this has been an issue for a couple of
> years and affects multiple architectures since 2021:
> 
> https://lore.kernel.org/all/fb3ccc73377832ac6708181ec419128a2f98ce36.1620795204.git.christophe.leroy@csgroup.eu/
> 
> where `#ifdef CONFIG_HUGETLB_PAGE` is required by `vmalloc`.
> 
> So I'd prefer to address it in a separate follow-up patch
> series.
> 
> For the `WARN_ON(!__hugetlb_valid_size(size))` check, I don't
> see anything broken here. Hugetlb only uses sizes registered
> by `hugetlbpage_init()`, which are validated by
> `arch_hugetlb_valid_size()` implemented in
> `arch/arm64/mm/hugetlbpage.c`:
> 
> static int __init hugetlbpage_init(void)
> {
>         BUILD_BUG_ON(HUGE_MAX_HSTATE < 4);
>         if (pud_sect_supported())
>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
> 
>         hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_SHIFT);
>         hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
>         hugetlb_add_hstate(CONT_PTE_SHIFT - PAGE_SHIFT);
> 
>         return 0;
> }
> arch_initcall(hugetlbpage_init);
> 
> bool __init arch_hugetlb_valid_size(unsigned long size)
> {
>         return __hugetlb_valid_size(size);
> }

I'm just pointing out that the defensive checking in __hugetlb_valid_size(),
which should really only warn if something has gone horribly wrong, will
now not detect bogus sizes if the address is aligned to CONT_PTE_SIZE.

Keeping hugetlb and vmalloc separate would avoid this problem.

Will

