Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADC6D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 19:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQe+g5ZvR6KeivPEwk1LBLbeVJ2/39tSJLB6nZ8TM10=; b=IUmYCHWRIjc5Bo0CfHiIbII2Cv
	SYFVRpdk5CFIByHFWo002konXiKSy09jcQUdyjR2BMoK2uPy62y2EntqumjG9pzCOdDLiLIf15ImC
	Erka7PpkRvtLiD/EdcP7qxh245ecUvqK/iSAFgcuq348sDkEUXLs21sZo3LMU66sV8Kzt9IscqLkC
	YbVbpBklVR6dCLXhDwc6cDaNB140jI4zUOvoNhGSxhGtvo7BWaqlLU6xEG03WZPtZyKEI5ZNTL7bR
	31eZHvvHHegDs2+hHS10Lpxl2Yb6FCFEB16Zl1YVFzptWuAaTIRgp4RgE5VFk5GS1jTVQ9hJMh9Aa
	cHYWwakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhtl-0000000H9pf-49ag;
	Thu, 27 Nov 2025 19:43:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhtk-0000000H9pO-2Tfn;
	Thu, 27 Nov 2025 19:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JQe+g5ZvR6KeivPEwk1LBLbeVJ2/39tSJLB6nZ8TM10=; b=bLoT/FglVGFQTp6ZQ56Yle6fs8
	ptqzHTWL95KXuhjuxl7XPt2gLgIOgk1wweluHsPyQ38cpDssH97HG3X9erEgS+i3X/bNy+BrSNtZX
	0Nx+1/7AoEl05gpR3MVH+L9M0aocNk7ibz8QPD2KslaJzakC7Ok8gfVaNO2YEVazZb2xxnmCHFpPF
	IGRfMUCoFpNAy2XF/qaFP5T/vm4M4wGNn6/Yp6Tnduny8zxbeHx1WOFYhR2vZjAP7vXkPR/loRBbS
	yrzAGHclbg4deP4UOsDu2voNxG+3XLZD1UdKAL75EZWsX6Dwl59DS2irr+1duhO8HSc3s96oSDErT
	Uno8xeEw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhti-0000000CBWb-3MlU;
	Thu, 27 Nov 2025 19:43:22 +0000
Date: Thu, 27 Nov 2025 19:43:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
Message-ID: <aSip2mWX13sqPW_l@casper.infradead.org>
References: <20251127011438.6918-1-21cnbao@gmail.com>
 <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
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

[dropping individuals, leaving only mailing lists.  please don't send
this kind of thing to so many people in future]

On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> On Thu, Nov 27, 2025 at 12:09 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > There is no need to always fall back to mmap_lock if the per-VMA
> > > lock was released only to wait for pagecache or swapcache to
> > > become ready.
> >
> > Something I've been wondering about is removing all the "drop the MM
> > locks while we wait for I/O" gunk.  It's a nice amount of code removed:
> 
> I think the point is that page fault handlers should avoid holding the VMA
> lock or mmap_lock for too long while waiting for I/O. Otherwise, those
> writers and readers will be stuck for a while.

There's a usecase some of us have been discussing off-list for a few
weeks that our current strategy pessimises.  It's a process with
thousands (maybe tens of thousands) of threads.  It has much more mapped
files than it has memory that cgroups will allow it to use.  So on a
page fault, we drop the vma lock, allocate a page of ram, kick off the
read, sleep waiting for the folio to come uptodate, once it is return,
expecting the page to still be there when we reenter filemap_fault.
But it's under so much memory pressure that it's already been reclaimed
by the time we get back to it.  So all the threads just batter the
storage re-reading data.

If we don't drop the vma lock, we can insert the pages in the page table
and return, maybe getting some work done before this thread is
descheduled.

This use case also manages to get utterly hung-up trying to do reclaim
today with the mmap_lock held.  SO it manifests somewhat similarly to
your problem (everybody ends up blocked on mmap_lock) but it has a
rather different root cause.

> I agree there’s room for improvement, but merely removing the "drop the MM
> locks while waiting for I/O" code is unlikely to improve performance.

I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" code
was written before the VMA locking code was written.  I don't know that
it's actually helping these days.

> The change would be much more complex, so I’d prefer to land the current
> patchset first. At least this way, we avoid falling back to mmap_lock and
> causing contention or priority inversion, with minimal changes.

Uh, this is an RFC patchset.  I'm giving you my comment, which is that I
don't think this is the right direction to go in.  Any talk of "landing"
these patches is extremely premature.

