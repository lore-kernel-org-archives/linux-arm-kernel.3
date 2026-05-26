Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94815CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SqJFKinbEr7svW1dQW6jTP27boWm+szW3qKbXBVvW4=; b=dIPBc19TtBbSmLPrhuAxrxNhsU
	TnreKuHgm7B7tMP9hxbpMcS0d75EoFEB9OdoZ9V01DSb6ln+tzGjkifbZ3c2umEIEY4mN3+ypFr13
	qO+x8/B7YCcrwK8LXC+VsOkvaeNhkePDoHP/YHCkVAsXbRc1x5fiJWD2QqlpOf94Z6N0k6/sIY1OB
	TPCtAWmh52dnQs+pzBhjavFtej8000Mm4kBViqbGXAhK0cEPFYNPkfNx8e8/ftEmwy7RLKVML89ih
	9AE/WgZ+aTh8OBkhqiJqbzYceyFjp2TPh4v/IvX1JojFRSs+xNdl2HJZiBTs7/BKj2UQVlVswOqVG
	vpYN3rrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtNp-00000002K2W-0SYc;
	Tue, 26 May 2026 15:07:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtNn-00000002K2Q-2LLD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:07:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F0E4760123;
	Tue, 26 May 2026 15:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65CC1F00A3A;
	Tue, 26 May 2026 15:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779808070;
	bh=6SqJFKinbEr7svW1dQW6jTP27boWm+szW3qKbXBVvW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GTAatHrP3iJIl9JT988fS1WFiaKoTnRfabeWG/y+gaP4r6qd54u9cbUuWHelFzedy
	 Erzg6WtrjXYY0epwNZBtAJ9DfB4HJ1857jYJe2pdJE73MObjjqCDlw1AGC78+4p4bk
	 XRvtB27ml/610OAsdiNt/yOKJlEVeX9orF20AumHj84pSol8hcRo1jxS4gaFxBByf2
	 yV39DOZuSt/wKLMVAt+/Pq/2WVZ6M6YmcaNzzi5dtYChYFm7c1olo1ngYtLLKZ3oyG
	 b6g5N9PQuzO90foJu6ndG+tykKwHk2L/y8Zk5U+1MyR9ORt9wePLJWXV+XXzcpgOQK
	 wWd2PFP91pshg==
Date: Tue, 26 May 2026 16:07:45 +0100
From: Will Deacon <will@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Vishal Moola <vishal.moola@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, david@kernel.org
Subject: Re: [PATCH] arm64: mm: call pagetable dtor when freeing hot-removed
 page tables
Message-ID: <ahW3QYiYjjVB4Knv@willie-the-truck>
References: <20260521032730.2104017-1-apopple@nvidia.com>
 <20260521153130.d7d5cd060f7522f894252333@linux-foundation.org>
 <ahACfQ6kCfONqz5h@arm.com>
 <ahAjudlB32VbkKbG@fedora>
 <92450154-e1ab-46e4-b23d-eaa59c9cdd3b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92450154-e1ab-46e4-b23d-eaa59c9cdd3b@arm.com>
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

On Tue, May 26, 2026 at 01:54:00PM +0200, Kevin Brodsky wrote:
> On 22/05/2026 11:36, Vishal Moola wrote:
> >> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> >> index 4c8959153ac4..9d42cbddce27 100644
> >> --- a/arch/arm64/mm/mmu.c
> >> +++ b/arch/arm64/mm/mmu.c
> >> @@ -1441,6 +1441,9 @@ static void free_hotplug_page_range(struct page *page, size_t size,
> >>  
> >>  static void free_hotplug_pgtable_page(struct page *page)
> >>  {
> >> +	if (folio_test_pgtable(page_folio(page)))
> > This should work.
> >
> >> +		pagetable_dtor(page_ptdesc(page));
> >> +
> >>  	free_hotplug_page_range(page, PAGE_SIZE, NULL);
> > In the case we presumably have a page table page (ptdesc) at this
> > point, we should really be freeing it with pagetable_free() as well.
> 
> Agreed, I think this is the right thing to do, something like:
> 
> if (folio_test_pgtable(page_folio(page)))
> pagetable_dtor_free(page_ptdesc(page)); else
> free_hotplug_page_range(page, PAGE_SIZE, NULL);
> 
> 
> Strangely enough x86 calls pagetable_free() in both cases.
> 
> My series protecting page tables with pkeys has a patch [1] to get
> vmemmap to allocate page tables with pagetable_alloc(). The diff above
> will require pagetable_*_ctor() to be called as well, but I think that's
> the right thing to do anyway. That could be posted as a separate series,
> but I'm hesitant due to the lack of NUMA awareness in pagetable_alloc().

I agree that calling the ctor()/dtor() functions consistently is the
cleanest approach and that will need something like your patch to call
the constructor from vmemmap_alloc_block_zero(). Trying to elide these
calls for the page-table pages used to map the altmap just feels odd to
me, as there isn't anything particularly special about them afaik.

Will

