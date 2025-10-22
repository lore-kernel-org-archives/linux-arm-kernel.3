Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90AD8CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caZZFGjSl0HauoREUr8sdpmyd8rmYIzTl3VncLuUe00=; b=FcSye6ExOukWjBZyI7zp4CnCph
	F/rO/r+26Ts7bt1m/MK1MdWKDNwPoMCxOERfpnJLJPp3uJuOarUYMbVIhQHjSAsEtyH/O2Stxd/p0
	ei9LP6/t538xnuVFQyRpOqQRS1OVbV/o/IPwxChnsj+l2VUuiJlEb3Onlq3ZHOvrzcMxACnGSaDaY
	1zaUMREKrQa6skeIsyDIrGNLNKzUv+emS1kRNkW1pKc4lcHw+hs2syBD+FZk6Lf4jB4ziz1v5AGv2
	JTOH4fP3gvnbP0JmuC1uagD2DVeDspXIT9Ad9iNHMPqwGJ0qTRHSSPkIqls2coOyrvdPdPfCFegNi
	XuTOAv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVbb-00000002M4d-0yhs;
	Wed, 22 Oct 2025 09:58:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVbR-00000002Lx5-1nr4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6863602D7;
	Wed, 22 Oct 2025 09:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031A3C4CEFF;
	Wed, 22 Oct 2025 09:57:54 +0000 (UTC)
Date: Wed, 22 Oct 2025 10:57:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yang Shi <shy828301@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH] arm64: mte: Do not warn if the page is already tagged in
 copy_highpage()
Message-ID: <aPiqoGyCmj7bA37C@arm.com>
References: <20251021181353.3842660-1-catalin.marinas@arm.com>
 <CAHbLzkpd8awNe=bZVv9fTux+Fx-HT8qL4ENZ-uC4YcPjf9e=KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHbLzkpd8awNe=bZVv9fTux+Fx-HT8qL4ENZ-uC4YcPjf9e=KQ@mail.gmail.com>
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

On Tue, Oct 21, 2025 at 12:00:04PM -0700, Yang Shi wrote:
> On Tue, Oct 21, 2025 at 11:14 AM Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> > The arm64 copy_highpage() assumes that the destination page is newly
> > allocated and not MTE-tagged (PG_mte_tagged unset) and warns
> > accordingly. However, following commit 060913999d7a ("mm: migrate:
> > support poisoned recover from migrate folio"), __folio_mc_copy() is
> > called before __folio_migrate_mapping(). If the latter fails (-EAGAIN),
> > the copy will be done again to the same destination page. Since
> > copy_highpage() already set the PG_mte_tagged flag, this second copy
> > will warn.
> >
> > Replace the WARN_ON(page already tagged) in the arm64 copy_highpage()
> > with a comment.
> >
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Reported-by: syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com
> > Link: https://lore.kernel.org/r/68dda1ae.a00a0220.102ee.0065.GAE@google.com
> > Cc: <stable@vger.kernel.org> # 6.12.x
> > Cc: Will Deacon <will@kernel.org>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> > ---
> >  arch/arm64/mm/copypage.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> > index a86c897017df..40749d0a385c 100644
> > --- a/arch/arm64/mm/copypage.c
> > +++ b/arch/arm64/mm/copypage.c
> > @@ -51,8 +51,13 @@ void copy_highpage(struct page *to, struct page *from)
> >                 }
> >                 folio_set_hugetlb_mte_tagged(dst);
> >         } else if (page_mte_tagged(from)) {
> > -               /* It's a new page, shouldn't have been tagged yet */
> > -               WARN_ON_ONCE(!try_page_mte_tagging(to));
> 
> I think you should remove the WARN_ON_ONCE in the above hugetlb chunk
> too IIUC. migrate_huge_page_move_mapping() does the similar thing.

Good point. Thanks!

-- 
Catalin

