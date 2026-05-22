Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E91CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulBbriUb5Qa+s82ZfAnphDICDBrOSk/EMlWPn3QSP7Y=; b=43k4gJuVXFnc6DIFCMyjFPyNKc
	2scqbxIzb1Hjb3lZCDNs8hXHoOuhkP2tR4/Z2ZshwYP1udOgeQ7lrrENuXVFB1wyMgMSG5SF5rUHq
	xKVJ7w7OdvkXEiVceXOvEQrj9+BP3+QoikfWJxTkxMgXSH1J+OAyRm7yi9fqh01tPD7VpE4b2pH+/
	/ZLr6Jrk6B8FVXpNSgwFnmc3SfPH5zcVdEaAZtm7WcU+Jgwn1jF6Zjo+mRU6q7BXOTW5vUHRPGZmZ
	EbUDJw8yakoLZcxo9Ic4feWM5kSENviFg+gkklpL6Q2re2RD3/oCm2LyFOolHiOq0+D42XWdkglTh
	z8mTkajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQK6G-0000000A3IK-3etK;
	Fri, 22 May 2026 07:15:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQK6E-0000000A3Hp-0IKl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 07:15:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 527B94A92;
	Fri, 22 May 2026 00:15:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48AC93F7B4;
	Fri, 22 May 2026 00:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779434112; bh=sxkqiabCo2k72yVa+eyY8IbkpWPy8a6prfz7sHqkQ6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhjWQb5hw/wbqsSAir1eL+5L46+NeXRW3tS40bUfAX7q6JagmMsOkMLU3ep7w6UJF
	 XdrXdzUZ626I7QZdHMplHAwyHaboMYra+7Eh2CIdV5iXzRlIZDvplr4IrfM+Ee7XBl
	 0y8z0sFmeoU/gP6cJGzj2R/6UlEmIAr+7vQ8K5M8=
Date: Fri, 22 May 2026 08:15:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, will@kernel.org, david@kernel.org
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-ID: <ahACfQ6kCfONqz5h@arm.com>
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_001514_268315_F7FA0CFD 
X-CRM114-Status: GOOD (  26.59  )
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

On Thu, May 21, 2026 at 03:31:30PM -0700, Andrew Morton wrote:
> On Thu, 21 May 2026 13:27:30 +1000 Alistair Popple <apopple@nvidia.com> wrote:
> > Since 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in
> > __create_pgd_mapping()") page-table allocation on ARM64 always
> > calls pagetable_{pte,pmd,pud,p4d}_ctor(). This sets the page_type
> > to PGTY_table, increments NR_PAGETABLE and possible allocates a PTL.
> > However the matching pagetable_dtor() calls were never added.
> > 
> > With DEBUG_VM enabled on kernel versions prior to v6.17 without
> > 2dfcd1608f3a9 ("mm/page_alloc: let page freeing clear any set page
> > type") this leads to the following warning when freeing these pages due
> > to page->page_type sharing page->_mapcount:
> > 
> >   BUG: Bad page state in process ... pfn:284fbb
> >   page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x284fbb
> >   flags: 0x17fffc000000000(node=0|zone=2|lastcpupid=0x1ffff)
> >   page_type: f2(table)
> >   page dumped because: nonzero mapcount
> >   Call trace:
> >    bad_page+0x13c/0x160
> >    __free_frozen_pages+0x6cc/0x860
> >    ___free_pages+0xf4/0x180
> >    free_pages+0x54/0x80
> >    free_hotplug_page_range.part.0+0x58/0x90
> >    free_empty_tables+0x438/0x500
> >    __remove_pgd_mapping.constprop.0+0x60/0xa8
> >    arch_remove_memory+0x48/0x80
> >    try_remove_memory+0x158/0x1d8
> >    offline_and_remove_memory+0x138/0x180
> > 
> > It can also lead to leaking the ptl allocation if ALLOC_SPLIT_PTLOCKS
> > is defined and incorrect NR_PAGETABLE stats. Fix this by calling
> > pagetable_dtor() in free_hotplug_pgtable_page() prior to freeing the
> > page to undo the effects of calling pagetable_*_ctor().
> > 
> > Fixes: 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in __create_pgd_mapping()")
> 
> 6.16+, so I assume we want cc:stable here.
> 
> >  arch/arm64/mm/mmu.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 8e1d80a7033e..0c24fe650e95 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -1422,6 +1422,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
> >  
> >  static void free_hotplug_pgtable_page(struct page *page)
> >  {
> > +	pagetable_dtor(page_ptdesc(page));
> >  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> >  }
> 
> I'd of course prefer that arm maintainers handle this.  But
> 5e8eb9aeeda3 came via myself so convention kinda-dictates that I get to
> fix it.

That's fine but Sashiko has some points:

https://sashiko.dev/#/patchset/20260521032730.2104017-1-apopple@nvidia.com

The __remove_pgd_mapping() path is fine but we also have the
vmemmap_free() path where the constructor was never called.

We could pass around a bool dtor argument but I wonder whether we could
just check it's a pgtable page:

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 4c8959153ac4..9d42cbddce27 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 
 static void free_hotplug_pgtable_page(struct page *page)
 {
+	if (folio_test_pgtable(page_folio(page)))
+		pagetable_dtor(page_ptdesc(page));
+
 	free_hotplug_page_range(page, PAGE_SIZE, NULL);
 }
 

-- 
Catalin

