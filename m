Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB250CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 04:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXGOCPORwRtBIOtgSlL5BmqNdJWalyZfji2BLv/IMKg=; b=IlLVa329Pf5Ugu8M1looivbOPL
	pQKsOnQSX2pkCrBfxHgvyQs0GwnRwOQ1B2SUDEqwLmWQCbVzKgoG4BD6vhETGCX6mCMcVbSnTZKWV
	9UEPUG8dk7XrB6yqKl7+YYN02+Lc+RG/sUTc0oavHZV1sHD+YQagWVPXw+Ui806i0S6eSry6fUHrr
	95zVqYJrHPHmro93GtJkd2FqqDWm2GRAuDMb4shkJ1DdjSxmolCtbDtASmx+d+GdugmLyy85fL0Kf
	A7G013XeuYgFs3xpmDcl3IILYKJa3KjmIkQeI7UKfabWa0bKsBbp9/ppWb6ILC7ozT7yK/TROdKR8
	NtUHYYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGe5-0000000CGyc-39MS;
	Tue, 02 Jun 2026 04:22:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUGe3-0000000CGyW-3cf1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 04:22:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A14516001A;
	Tue,  2 Jun 2026 04:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285571F00893;
	Tue,  2 Jun 2026 04:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1780374146;
	bh=nXGOCPORwRtBIOtgSlL5BmqNdJWalyZfji2BLv/IMKg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SeRc4CB3tfoKRBhIV6CGSKRkthW7QoclBiBsZUpKUThMOsXOQD8ty6QdCV0U8iGvs
	 qb9WbjKCfWAijL1XQoR2zdLBhNf8zE90wk4B7r+Vg1SkFv/MvZPhepzVtpqXtRVNPB
	 IjhNm2dPXy3wlmsU+kVOfZzq6mhQwdo4CryaCDdo=
Date: Mon, 1 Jun 2026 21:22:25 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alistair Popple <apopple@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, will@kernel.org, david@kernel.org
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-Id: <20260601212225.11f277a85d5ed15083b08cc2@linux-foundation.org>
In-Reply-To: <ahACfQ6kCfONqz5h@arm.com>
References: <20260521032730.2104017-1-apopple@nvidia.com>
	<20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
	<ahACfQ6kCfONqz5h@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 22 May 2026 08:15:09 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:

> > > --- a/arch/arm64/mm/mmu.c
> > > +++ b/arch/arm64/mm/mmu.c
> > > @@ -1422,6 +1422,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
> > >  
> > >  static void free_hotplug_pgtable_page(struct page *page)
> > >  {
> > > +	pagetable_dtor(page_ptdesc(page));
> > >  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> > >  }
> > 
> > I'd of course prefer that arm maintainers handle this.  But
> > 5e8eb9aeeda3 came via myself so convention kinda-dictates that I get to
> > fix it.
> 
> That's fine but Sashiko has some points:
> 
> https://sashiko.dev/#/patchset/20260521032730.2104017-1-apopple@nvidia.com
> 
> The __remove_pgd_mapping() path is fine but we also have the
> vmemmap_free() path where the constructor was never called.
> 
> We could pass around a bool dtor argument but I wonder whether we could
> just check it's a pgtable page:
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 4c8959153ac4..9d42cbddce27 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
>  
>  static void free_hotplug_pgtable_page(struct page *page)
>  {
> +	if (folio_test_pgtable(page_folio(page)))
> +		pagetable_dtor(page_ptdesc(page));
> +
>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
>  }

This patch is still floating around in mm.git awaiting some
finalization.  What to do?

From: Alistair Popple <apopple@nvidia.com>
Subject: arm64: mm: call pagetable dtor when freeing hot-removed page tables
Date: Thu, 21 May 2026 13:27:30 +1000

Since 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in
__create_pgd_mapping()") page-table allocation on ARM64 always calls
pagetable_{pte,pmd,pud,p4d}_ctor().  This sets the page_type to
PGTY_table, increments NR_PAGETABLE and possible allocates a PTL.  However
the matching pagetable_dtor() calls were never added.

With DEBUG_VM enabled on kernel versions prior to v6.17 without
2dfcd1608f3a9 ("mm/page_alloc: let page freeing clear any set page type")
this leads to the following warning when freeing these pages due to
page->page_type sharing page->_mapcount:

  BUG: Bad page state in process ... pfn:284fbb
  page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x284fbb
  flags: 0x17fffc000000000(node=0|zone=2|lastcpupid=0x1ffff)
  page_type: f2(table)
  page dumped because: nonzero mapcount
  Call trace:
   bad_page+0x13c/0x160
   __free_frozen_pages+0x6cc/0x860
   ___free_pages+0xf4/0x180
   free_pages+0x54/0x80
   free_hotplug_page_range.part.0+0x58/0x90
   free_empty_tables+0x438/0x500
   __remove_pgd_mapping.constprop.0+0x60/0xa8
   arch_remove_memory+0x48/0x80
   try_remove_memory+0x158/0x1d8
   offline_and_remove_memory+0x138/0x180

It can also lead to leaking the ptl allocation if ALLOC_SPLIT_PTLOCKS is
defined and incorrect NR_PAGETABLE stats.  Fix this by calling
pagetable_dtor() in free_hotplug_pgtable_page() prior to freeing the page
to undo the effects of calling pagetable_*_ctor().

Link: https://lore.kernel.org/20260521032730.2104017-1-apopple@nvidia.com
Fixes: 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in __create_pgd_mapping()")
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/arm64/mm/mmu.c |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/arm64/mm/mmu.c~arm64-mm-call-pagetable-dtor-when-freeing-hot-removed-page-tables
+++ a/arch/arm64/mm/mmu.c
@@ -1441,6 +1441,7 @@ static void free_hotplug_page_range(stru
 
 static void free_hotplug_pgtable_page(struct page *page)
 {
+	pagetable_dtor(page_ptdesc(page));
 	free_hotplug_page_range(page, PAGE_SIZE, NULL);
 }
 
_


