Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBAECD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 22:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnv8z/U53fPYRQVRdESTD0xQjxqDX0NyGk7FJvl1zug=; b=Pij8vE6dTz/F0+LbRJ1q80khVS
	csG9dYDBF+HK0Umz7e98s5M0BtdbOgh+V/TCuCLYvRhdP55qgXIdHcyshu+9Vuqd+eofLZKidHPZ5
	vfHK/Ry2N89s9gnVLz7F7USW0NA4Ka6HRwgTvmqVAxk20iI2qz0dKDDp/vYAeuyF2ySBt1LX4xFKz
	XN4cFV1PirdW09SgoMTONmV77tt9M6aH7neD8FVBjvnWsrJPLGLUK819dQMKPoOS7PRqQhjpfTxgG
	anXk54NR3UAnXFm2pOkj8vstlrnrsRdZBF6qHE/b01Dgj7ypDG/wsmG/RS1RaInGKGe7cENQ1kYXy
	k6WXE9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBvS-00000009EKg-176k;
	Thu, 21 May 2026 22:31:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQBvP-00000009EKD-46TF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 22:31:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 553ED41A5C;
	Thu, 21 May 2026 22:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02621F000E9;
	Thu, 21 May 2026 22:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779402691;
	bh=bnv8z/U53fPYRQVRdESTD0xQjxqDX0NyGk7FJvl1zug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dgyXsqH67FvyK+9N+RrmIuzBnPicK5E+nVD175qTBrUi/dZfe//hrorWytuL6wRpo
	 g/WQLOOXYW9aoOx0MAwfabDfx6fXjkFvdm7PbfxgdHHnL9fSY4y2XNQ7fJZips1O8Q
	 NBQBE0pdjLnBhjrbbOTs7Jlfa8pXiZwDxcbAiEq0=
Date: Thu, 21 May 2026 15:31:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org,
 david@kernel.org
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-Id: <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
In-Reply-To: <20260521032730.2104017-1-apopple@nvidia.com>
References: <20260521032730.2104017-1-apopple@nvidia.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_153132_047330_77E3AC6B 
X-CRM114-Status: GOOD (  20.21  )
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

On Thu, 21 May 2026 13:27:30 +1000 Alistair Popple <apopple@nvidia.com> wrote:

> Since 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in
> __create_pgd_mapping()") page-table allocation on ARM64 always
> calls pagetable_{pte,pmd,pud,p4d}_ctor(). This sets the page_type
> to PGTY_table, increments NR_PAGETABLE and possible allocates a PTL.
> However the matching pagetable_dtor() calls were never added.
> 
> With DEBUG_VM enabled on kernel versions prior to v6.17 without
> 2dfcd1608f3a9 ("mm/page_alloc: let page freeing clear any set page
> type") this leads to the following warning when freeing these pages due
> to page->page_type sharing page->_mapcount:
> 
>   BUG: Bad page state in process ... pfn:284fbb
>   page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x284fbb
>   flags: 0x17fffc000000000(node=0|zone=2|lastcpupid=0x1ffff)
>   page_type: f2(table)
>   page dumped because: nonzero mapcount
>   Call trace:
>    bad_page+0x13c/0x160
>    __free_frozen_pages+0x6cc/0x860
>    ___free_pages+0xf4/0x180
>    free_pages+0x54/0x80
>    free_hotplug_page_range.part.0+0x58/0x90
>    free_empty_tables+0x438/0x500
>    __remove_pgd_mapping.constprop.0+0x60/0xa8
>    arch_remove_memory+0x48/0x80
>    try_remove_memory+0x158/0x1d8
>    offline_and_remove_memory+0x138/0x180
> 
> It can also lead to leaking the ptl allocation if ALLOC_SPLIT_PTLOCKS
> is defined and incorrect NR_PAGETABLE stats. Fix this by calling
> pagetable_dtor() in free_hotplug_pgtable_page() prior to freeing the
> page to undo the effects of calling pagetable_*_ctor().
> 
> Fixes: 5e8eb9aeeda3 ("arm64: mm: always call PTE/PMD ctor in __create_pgd_mapping()")

6.16+, so I assume we want cc:stable here.

>  arch/arm64/mm/mmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8e1d80a7033e..0c24fe650e95 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1422,6 +1422,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
>  
>  static void free_hotplug_pgtable_page(struct page *page)
>  {
> +	pagetable_dtor(page_ptdesc(page));
>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
>  }

I'd of course prefer that arm maintainers handle this.  But
5e8eb9aeeda3 came via myself so convention kinda-dictates that I get to
fix it.


