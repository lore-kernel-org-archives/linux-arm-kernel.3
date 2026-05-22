Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B23CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pATE+Ad7Nds5gmErVpuSATD83acq6VMYYKTG/ZdFY5Q=; b=WZAuW7uD6lGv5JDeYz8Q3T4ZmM
	Jq8mcTz2Qc5HNG5alcv75IrKq1f1d+rrVKFmicPCw1GNYO3i2fzsvb4H6eOSA92LkcNyBB0aoHAPv
	53AG9E8+M8FVN4Mdu750BFKjKiiZYKTgZzCtibDjHI7LqerVRHenNB6gDbDrWNu4StLjRfhStzI4Q
	u5E4/J9VLW+hLKD2joQrKk9FwXp0kVsmYBg9p6CLtPSQBYDYQBzacRBJRir/qBpSoczyOufIjDB1N
	dKfqpbi5lGqGs0j9lyfoARjc7Nwwo17RAychr58UP40fmsv9lSqdB4ZYEFv0+AEUwGcdoisLzxNk3
	b5gmVwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKN7-0000000A65K-2mRu;
	Fri, 22 May 2026 07:32:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKN4-0000000A64S-44tE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 07:32:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A3442574;
	Fri, 22 May 2026 00:32:31 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F2463F7B4;
	Fri, 22 May 2026 00:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779435156; bh=3d3lTmEURd/s07njkMR0R2cb+D6d2JS94gvx6IsOI/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpHEifDJbgVhH/FbE5O0tpIXxsvMB47wdM593PGMnmQanoMSTBbiEPX2maCRxsBUs
	 fZkGyr5T099jvPZAfGd9nmhPSc9f7fvb1hz6r7hBJ5IGSaax4dG/m+T2eAH3FPViAU
	 p/2UhypX/wOyuGz0tnzS/YUocstlUGo0fIbzc9Es=
Date: Fri, 22 May 2026 08:32:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alistair Popple <apopple@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, will@kernel.org, david@kernel.org
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-ID: <ahAGkM_I30ruK3tN@arm.com>
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahACfQ6kCfONqz5h@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_003239_124882_62F74750 
X-CRM114-Status: GOOD (  15.82  )
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

The other Sashiko find looks like a false positive. vmemmap_*_populate()
do not allocate the page table from altmap, only the page pointed at by
the vmemmap pte.

-- 
Catalin

