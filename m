Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2768FCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVo/FFXfWI6Siu3pboylHv8St2O3FHDrAkJHWhb+UAc=; b=3b84wMloraY+/xOmSNyGfto2tN
	qYyDkNV6si7QHshmvTbw99rsXofPqdmu5+ytXLiO6y8E6/Rvh/2OW33/igw/TN9yNoqTl2EQ65zOi
	FJ08PACKro4Fc/+hB9k4UsYUlP6eQf4CFi5CA236pNbmE8xMsxScGf+YcGWY3cEFUiBsXr+rDJ/SO
	cjw717WckZ4F9VE3L+ySB2bJBLZ4ZaDOnYJE6ngEHXOTPHXw0SXRzAEijUyW6pdNh4TiKQmkUkEX4
	dREpmWRWznyR5BjLU6e5qTu/wDSeQPwgs6K6Kymx4pAMn2VtII12fT3gPvIFl4qqMsvW8xFM+mv9e
	rJObzRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMJV-0000000ALjw-0m3p;
	Fri, 22 May 2026 09:37:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMJS-0000000ALie-2pmg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:37:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43fe608cb92so4395314f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779442620; x=1780047420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XVo/FFXfWI6Siu3pboylHv8St2O3FHDrAkJHWhb+UAc=;
        b=ObRcxTYoDKnucrIy2EVA15lnPBPPANuU6F43xwwP9zKKQ6TuFykPz64C0e6gOG+z3u
         6yf0tG0+HHVlqxxhbj/67JsT3s69x+Ckz72ixJy11515jW3AdY3OcDi1BGmv0aFCAHX0
         Co2V805jlbb/sj1o07uowZsn/+1wFLz5fOfpAZ7tcSmWYWQRZS5+msEAgsipdAjKdcw8
         wpGZlZOPmdg6adA2g4f77FIWOb335UA/mVI6chle5KMkry29C5ubPas2nmHl3IvrTMa4
         qGaIOIYEcVKXeJqYtpcql3ueZUnIM2KabZjKg1obHyRvi46XlaCpp0orBWz9RZlGPd/4
         64IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442620; x=1780047420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVo/FFXfWI6Siu3pboylHv8St2O3FHDrAkJHWhb+UAc=;
        b=E63Ggl5p5+Yzb5lWCffCBKe4cXHUzTE5/CMKNpMWs7esHXzBPVkhd9ToTMD/aqgpK8
         VuAt8w3MGKn30bEiZVmn0MdeNbjAil7Blo/bgYCXy5QPrzEhjRbK8uluqMVF8wLnjGaa
         hxI0/PUV/KaPRWBU14PFm6MmCpS/Hyj1rvhuMCYJyzlxcdIayDDdu3nNekhlpiKHl72n
         w/aw02vrokI0TtnAEDkqBk6ggjeLwQxtOO5Tfvzbr2bDoOLQ2IrsoNua6rL8DJvqfvQD
         yui/qABKvejCYx9aBcJdHfQr/dh3Msx7SN4T3o94Sb1Cj7eG5Cr/e+l3X55EQWMAQtLD
         anEA==
X-Forwarded-Encrypted: i=1; AFNElJ++Ebh8kpTEOX9QxROct4Qm9jXOJ+tuWEp+6dTRrUz9pDgZkkmD+0cdDi9tjbniiwdew5sntulBpO+WWGjWGOp9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1XVbppO9Dbm/WW1TOe0EkO7TK2odTVDxOIGw9/QmAXRAwKROv
	rLnEK+GnMj+I8O1v+O/U32T+4Pl9ugQzh5v7tIvH9oMoF6af53MwUQGc
X-Gm-Gg: Acq92OE3aXRqwYbrSTpMUfn3XR/cIRD8vibgixkBcaxX9qH2du9cioi2jdXtV7JnHQS
	uSBnxaiSwcdewIlJGjZynTJ5KpwSpE6hOpuIho92Z9r/k4zYwScjlbHw3/SLSI/eHN0g87ugmFl
	OCHpYJk2rCkTskdOaFECz8Idx07Gba94mOuXGbhaENPj+oAfIqj3LA7Q8F/zXI+XwXixV8g/6x1
	jlKsuz04AQs8Eeyljswg2bjPaBMm+ru6zZjf1hiP57EpuOjFYNmeVevOoKF5tDJnl4EC8ImsGwf
	Q7QcoEVJO/Ihyx+JxUetECucHCH6ZO4kmraIkuQn0ejVGVs2fubsmUM8//MmBEmba83UDGMcYuP
	ghNBdT+IY6S35RHjnEAgwI5f7yKsoPI7LjGVarL+It2N4qYPvRsYo0DQmJtIHFVo7vx0bFgWIpE
	Iw4s8Vy378b38mpoQVT1izZnZn8mDRkLXIR6ylaLB1Z8A+rErxIfpWqT2K2Rye59mSxUTCHuMeA
	Zzb2hFhwgyLNtu1fVbLjwcttSGNcm8Ye0mXrvfNW4mZ
X-Received: by 2002:a5d:64e4:0:b0:45d:3a84:709c with SMTP id ffacd0b85a97d-45eb38d45e6mr3805787f8f.31.1779442620182;
        Fri, 22 May 2026 02:37:00 -0700 (PDT)
Received: from fedora (cpc92878-cmbg18-2-0-cust539.5-4.cable.virginm.net. [86.16.54.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9ba2esm2815306f8f.8.2026.05.22.02.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:36:59 -0700 (PDT)
Date: Fri, 22 May 2026 10:36:57 +0100
From: Vishal Moola <vishal.moola@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, will@kernel.org, david@kernel.org
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-ID: <ahAjudlB32VbkKbG@fedora>
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahACfQ6kCfONqz5h@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_023702_737251_1CF09A3E 
X-CRM114-Status: GOOD (  34.28  )
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

On Fri, May 22, 2026 at 08:15:09AM +0100, Catalin Marinas wrote:
> On Thu, May 21, 2026 at 03:31:30PM -0700, Andrew Morton wrote:
> > On Thu, 21 May 2026 13:27:30 +1000 Alistair Popple <apopple@nvidia.com> wrote:
> > > Since 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in
> > > __create_pgd_mapping()") page-table allocation on ARM64 always
> > > calls pagetable_{pte,pmd,pud,p4d}_ctor(). This sets the page_type
> > > to PGTY_table, increments NR_PAGETABLE and possible allocates a PTL.
> > > However the matching pagetable_dtor() calls were never added.
> > > 
> > > With DEBUG_VM enabled on kernel versions prior to v6.17 without
> > > 2dfcd1608f3a9 ("mm/page_alloc: let page freeing clear any set page
> > > type") this leads to the following warning when freeing these pages due
> > > to page->page_type sharing page->_mapcount:
> > > 
> > >   BUG: Bad page state in process ... pfn:284fbb
> > >   page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x284fbb
> > >   flags: 0x17fffc000000000(node=0|zone=2|lastcpupid=0x1ffff)
> > >   page_type: f2(table)
> > >   page dumped because: nonzero mapcount
> > >   Call trace:
> > >    bad_page+0x13c/0x160
> > >    __free_frozen_pages+0x6cc/0x860
> > >    ___free_pages+0xf4/0x180
> > >    free_pages+0x54/0x80
> > >    free_hotplug_page_range.part.0+0x58/0x90
> > >    free_empty_tables+0x438/0x500
> > >    __remove_pgd_mapping.constprop.0+0x60/0xa8
> > >    arch_remove_memory+0x48/0x80
> > >    try_remove_memory+0x158/0x1d8
> > >    offline_and_remove_memory+0x138/0x180
> > > 
> > > It can also lead to leaking the ptl allocation if ALLOC_SPLIT_PTLOCKS
> > > is defined and incorrect NR_PAGETABLE stats. Fix this by calling
> > > pagetable_dtor() in free_hotplug_pgtable_page() prior to freeing the
> > > page to undo the effects of calling pagetable_*_ctor().
> > > 
> > > Fixes: 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in __create_pgd_mapping()")
> > 
> > 6.16+, so I assume we want cc:stable here.
> > 
> > >  arch/arm64/mm/mmu.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > > index 8e1d80a7033e..0c24fe650e95 100644
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

Free_empty_tables() looks like the only way we'd ever get to
free_hotplug_pgtable_page(). I'm a little curious why we can't
consolidate unmap_hotplug_range() and free_empty_tables().
I.e. just fold unmap_hotplug_range() into the latter.

> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 4c8959153ac4..9d42cbddce27 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
>  
>  static void free_hotplug_pgtable_page(struct page *page)
>  {
> +	if (folio_test_pgtable(page_folio(page)))

This should work.

> +		pagetable_dtor(page_ptdesc(page));
> +
>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);

In the case we presumably have a page table page (ptdesc) at this
point, we should really be freeing it with pagetable_free() as well.

Its not a big deal that we don't right now, but losing track of the
matching allocation/free sites will become a headache when separately
allocating from struct page.

>  }
>  
> 
> -- 
> Catalin

