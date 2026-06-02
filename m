Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD24CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0KWJlg0Sqr5Z7raeF0KU8zyzsqRO8RTi4QDjPMOW+A=; b=HNJRVBSu6BIt0niK9xvlOpiHBB
	N9gqmCWjPOkvjJNH0RFIC3f4VKjMd/VqB7B7zEPzaEF9IuMKorNCoBrYnqxxtHYpBfHD4x/MlnRLJ
	kOz4sNMTcnRJrKBrb6VMidJKmheI+9y9yQE19bKtQarbVUx/mAcxm/O+tLBurqA+bOVxmiN8R9OVo
	m98h2fwlQEsvHpP/Ef+cilYdc7orCji9T6cn51ctDe2WL6m2DU0My5iwAj4FdqY8zE8J+FlSd9JEr
	Rxo7WHHcbt4dhKhgzzXIwluKCKMSV6+OScbrMOcvuuox5INLPXDMky7fvq9TXpJFkZz0ezt1/pz+3
	702Qg6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOuv-0000000D3Lg-2wNv;
	Tue, 02 Jun 2026 13:12:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOut-0000000D3Kw-2iEl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:12:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6EB543B3C;
	Tue,  2 Jun 2026 13:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39BB21F00899;
	Tue,  2 Jun 2026 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780405942;
	bh=V0KWJlg0Sqr5Z7raeF0KU8zyzsqRO8RTi4QDjPMOW+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mR5547fpKxCJf0XlTdI9xDkvs66R5fMpuoyFGy3sz+isEcGZKY/mYsjmZY6KBlkKm
	 S12vTHBxWqDDRaeNVwQikJkA9snuJhlZ2zE5KPbrnDnnWOa6XgIzEP/iDb6eSk13qT
	 WBnHDbMvAtHGtyoMHkjDwtmN3ffUNad1alOJNuakUnY0oklWGAfP3lZ3gU89Gqoil2
	 wk9hpuBDLrtpHOKqX6Y/hI2pvcBDK/YO2F8tIICTaYojkQwOLVNGOOtSdldwj/ThuG
	 XeHRaU8sm5kKPCrlZnPatsIEaaraxxDzznOaCIQ0cyBpyjnhzEfQk3NtiF71zvYj7f
	 HaogrdbefYn0A==
Date: Tue, 2 Jun 2026 14:12:17 +0100
From: Will Deacon <will@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, david@kernel.org, kevin.brodsky@arm.com
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-ID: <ah7WsY02cNAN1LCS@willie-the-truck>
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com>
 <20260601212225.11f277a85d5ed15083b08cc2@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601212225.11f277a85d5ed15083b08cc2@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_061223_708946_13E63A1E 
X-CRM114-Status: GOOD (  24.30  )
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

On Mon, Jun 01, 2026 at 09:22:25PM -0700, Andrew Morton wrote:
> On Fri, 22 May 2026 08:15:09 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:
> 
> > > > --- a/arch/arm64/mm/mmu.c
> > > > +++ b/arch/arm64/mm/mmu.c
> > > > @@ -1422,6 +1422,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
> > > >  
> > > >  static void free_hotplug_pgtable_page(struct page *page)
> > > >  {
> > > > +	pagetable_dtor(page_ptdesc(page));
> > > >  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> > > >  }
> > > 
> > > I'd of course prefer that arm maintainers handle this.  But
> > > 5e8eb9aeeda3 came via myself so convention kinda-dictates that I get to
> > > fix it.
> > 
> > That's fine but Sashiko has some points:
> > 
> > https://sashiko.dev/#/patchset/20260521032730.2104017-1-apopple@nvidia.com
> > 
> > The __remove_pgd_mapping() path is fine but we also have the
> > vmemmap_free() path where the constructor was never called.
> > 
> > We could pass around a bool dtor argument but I wonder whether we could
> > just check it's a pgtable page:
> > 
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 4c8959153ac4..9d42cbddce27 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
> >  
> >  static void free_hotplug_pgtable_page(struct page *page)
> >  {
> > +	if (folio_test_pgtable(page_folio(page)))
> > +		pagetable_dtor(page_ptdesc(page));
> > +
> >  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> >  }
> 
> This patch is still floating around in mm.git awaiting some
> finalization.  What to do?

From what I can tell (assuming I've been following along correctly!):

1. This patch improves the situation, so makes sense in its own right
2. There is additional work to be more consistent with the constructors
   for page-table pages, which Kevin is going to look at but is probably
   a little more long-term.
3. I'm happy to take this via arm64 but also have no issues with you taking
   it via mm (so please shout if you want me to pick it up).

Will

