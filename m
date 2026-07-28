Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA527C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 21:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqib6vtzdDc0bkShWroBmi83B9sA++5bLMZGOXyfCyE=; b=HWWvIni7/qJVcxK7ByS6D4+Ipd
	s1qhIKdFnNqIQSFpI7/rAj/BFP8abk+q8kyYIEW8OCq5R3nwNSytjAL2Cg2ButKgP9/fv6t+6fBFD
	NCDR8mTCmJXWr/s0oVMdDEQCz2SoT5mOSR8hU2eimMUqf1aoAksnMoYEHTCpNTHbpIXblHszQm4L0
	0aIVm2Hgy5rdc/B9NgbsH3DJ29h6oMOq8X6WWfog2e+i615y6FEKM+DegAig8h3VqByx4RhKCsjWA
	B5nPyycRpe3AIXwp+83rrmRbNZXpTJinv336GJ6MNeFEsVzfWTI+vWOi50GdPffLooFtmFA7Xc7io
	vb1r4y/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopeP-00000006MWo-3e1Z;
	Tue, 28 Jul 2026 21:47:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wopeO-00000006MWf-35fV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 21:47:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EEAE60AA7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 21:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558F91F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 21:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785275267;
	bh=bqib6vtzdDc0bkShWroBmi83B9sA++5bLMZGOXyfCyE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dC+obVVms5DhP6HIz3sEF+YLSHk7l9K6iiS8chnkr+kp+magf/aGaG8FrBxY8aSzu
	 /PX/5Pdz/IPvZwqp3WasNrfIjVlIpnn0vVDakobfng614YkUgRf0ApEnTLNSjej3F7
	 i0fAsoALQHsgVwJ/sqy0B/J4cvxYrWbsvg5S2ZJ/4I9tyfPL5GKyfbkJSQyzcPEuzX
	 dNeS2hoV27BfGSq8Ot1gZaw7hjw3/G4/rbf8o7uTDbfeh9+nbpmfylqIXzyxB2XeSB
	 6V6uj0wecWs1hNsZtU28y6n82lf+AblhhkF5glC0c5HjQDyyDoeM1ycrPE05ovJ0ya
	 JQVlVGC/8gJ6Q==
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e512a9a6bso21427085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:47:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrEGQ/fBCRKolBgowZSwbqck0iwTKRfjsyS4ZEG5eY98U0x9EtleP5bxLJeA+spj5kDczfScJ9HRH6zPWsYjTY6@lists.infradead.org
X-Gm-Message-State: AOJu0YwYawjW265+T8gZnvy47+YoH6QpnqHTw6UDg/LREXFTKqlmJFj3
	HMqNK9X9QgwZzq/5qAsD8xmi34xIpCgfmFwhZh+3LeViEkFgeQalULX6H52tGA7o2Y6m5SY1hf2
	9DGf+d7OOnqz1cxFHwVjRfhYGmukot4w=
X-Received: by 2002:a05:620a:46ab:b0:92e:cac7:96fc with SMTP id
 af79cd13be357-933026cbd7bmr433098585a.24.1785275266629; Tue, 28 Jul 2026
 14:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-2-jiangwen6@xiaomi.com> <amiabgyHSz3ZYY5k@willie-the-truck>
In-Reply-To: <amiabgyHSz3ZYY5k@willie-the-truck>
From: Barry Song <baohua@kernel.org>
Date: Wed, 29 Jul 2026 05:47:34 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zgFk1iaQWisYMOR4iFxonwDskRt3Gte0cEts1q9hxibA@mail.gmail.com>
X-Gm-Features: AUfX_mwbnXA4EUHoDC_1ddg6W-_if7iZPphw3fCzQ7jhe0SfShXOygA86MH76jg
Message-ID: <CAGsJ_4zgFk1iaQWisYMOR4iFxonwDskRt3Gte0cEts1q9hxibA@mail.gmail.com>
Subject: Re: [PATCH v7 1/7] arm64/hugetlb: Extend batching of multiple
 CONT_PTE in a single PTE setup
To: Will Deacon <will@kernel.org>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com, 
	Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com, 
	david@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com, 
	dev.jain@arm.com, Wen Jiang <jiangwen6@xiaomi.com>, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jul 28, 2026 at 8:03=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Wed, Jul 15, 2026 at 08:08:07PM +0800, Wen Jiang wrote:
> > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> >
> > For sizes aligned to CONT_PTE_SIZE and smaller than PMD_SIZE,
> > we can handle CONT_PTE_SIZE groups together.
> >
> > These additional sizes are mapping spans used by non-hugetlbfs(vmalloc)
> > mm code, not new HugeTLB hstate sizes.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > Tested-by: Leo Yan <leo.yan@arm.com>
> > Reviewed-by: Dev Jain <dev.jain@arm.com>
> > ---
> >  arch/arm64/mm/hugetlbpage.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> > index a42c05cf56408..7ce159483a354 100644
> > --- a/arch/arm64/mm/hugetlbpage.c
> > +++ b/arch/arm64/mm/hugetlbpage.c
> > @@ -94,6 +94,11 @@ static int find_num_contig(struct mm_struct *mm, uns=
igned long addr,
> >       return CONT_PTES;
> >  }
> >
> > +/*
> > + * num_contig_ptes(), set_huge_pte_at() and arch_make_huge_pte() can b=
e
> > + * used by non-hugetlbfs(vmalloc) mm code to set multiple huge mapping=
s
> > + * at the PTE level.
> > + */
> >  static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
> >  {
> >       int contig_ptes =3D 1;
> > @@ -110,6 +115,12 @@ static inline int num_contig_ptes(unsigned long si=
ze, size_t *pgsize)
> >               contig_ptes =3D CONT_PTES;
> >               break;
> >       default:
> > +             if (size > 0 && size < PMD_SIZE &&
> > +                             IS_ALIGNED(size, CONT_PTE_SIZE)) {
> > +                     *pgsize =3D PAGE_SIZE;
> > +                     contig_ptes =3D size >> PAGE_SHIFT;
> > +                     break;
> > +             }
>
> Under which circumstances would you get a size of 0 here?
>
> Given that you're relying on arch_vmap_pte_range_map_size() to give you
> a well-formed size, why isn't if sufficient to check only the alignment?

Hi Will,

Thanks very much for your review.

Are you suggesting the change below? If so, I'm fine with it.
I guess the current code is just being overly cautious for
defensive programming.

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8429d220660b..c1af52ba572d 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -115,8 +115,7 @@ static inline int num_contig_ptes(unsigned long
size, size_t *pgsize)
                contig_ptes =3D CONT_PTES;
                break;
        default:
-               if (size > 0 && size < PMD_SIZE &&
-                               IS_ALIGNED(size, CONT_PTE_SIZE)) {
+               if (IS_ALIGNED(size, CONT_PTE_SIZE)) {
                        *pgsize =3D PAGE_SIZE;
                        contig_ptes =3D size >> PAGE_SHIFT;
                        break;


>
> >               WARN_ON(!__hugetlb_valid_size(size));
>
> I agree with David that it's messy having hugetlb tangled up in here.
> It means this validity check is now going to miss some genuinely bogus
> cases for the hugetlb path (as opposed to the vmalloc path).

I agree that coupling hugetlb with vmalloc is not ideal. As I
explained to David, this has been an issue for a couple of
years and affects multiple architectures since 2021:

https://lore.kernel.org/all/fb3ccc73377832ac6708181ec419128a2f98ce36.162079=
5204.git.christophe.leroy@csgroup.eu/

where `#ifdef CONFIG_HUGETLB_PAGE` is required by `vmalloc`.

So I'd prefer to address it in a separate follow-up patch
series.

For the `WARN_ON(!__hugetlb_valid_size(size))` check, I don't
see anything broken here. Hugetlb only uses sizes registered
by `hugetlbpage_init()`, which are validated by
`arch_hugetlb_valid_size()` implemented in
`arch/arm64/mm/hugetlbpage.c`:

static int __init hugetlbpage_init(void)
{
        BUILD_BUG_ON(HUGE_MAX_HSTATE < 4);
        if (pud_sect_supported())
                hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);

        hugetlb_add_hstate(CONT_PMD_SHIFT - PAGE_SHIFT);
        hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
        hugetlb_add_hstate(CONT_PTE_SHIFT - PAGE_SHIFT);

        return 0;
}
arch_initcall(hugetlbpage_init);

bool __init arch_hugetlb_valid_size(unsigned long size)
{
        return __hugetlb_valid_size(size);
}

Thanks
Barry

