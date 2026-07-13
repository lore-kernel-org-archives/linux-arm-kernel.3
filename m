Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7993C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGaqXmco4Nvf28C1PHC6jBPldtjIjC782IMn5cORV60=; b=Dzr9JCBmKB28fFE0Ty7OuUG6RU
	ufwsc1pv38MFZK/367uzJ67V4CQBGhLxECMyDaY3CXRcEOVwexI14XUss0FR3htIUQj1J3y5Ojrch
	SRjFPETg5C0NsdMZCigbA5yj8PEzPPMUJpIw9t8vgbxxncXceMBJ5C6H72OKS733BSVD5nLQvOTz9
	a//IfEnT8H7ZH9cRzAEhqpEJFela2GNQeGwzinjtyD89Fd+/+QSQuGWHanUP/lbNbVnzKVEb6NiQL
	EfjBo+LIXteoFJWF3r+72OP1wtS6BaRcljVfUJ9fxc/Rm9v4q1cHGhC85b3Ccwb3jgcN4sJK/91Yv
	aIK0DFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJR7-00000009xGO-1HMv;
	Mon, 13 Jul 2026 16:23:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJR3-00000009xFr-3NiJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 16:23:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4246860120;
	Mon, 13 Jul 2026 16:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA3F1F000E9;
	Mon, 13 Jul 2026 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959793;
	bh=LGaqXmco4Nvf28C1PHC6jBPldtjIjC782IMn5cORV60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m5tpxXrOWnJFtjzJC6UWXb9uBYPk1xIJ3t3U4btW7ka0F0+IeC/Io06pDWQNc7C14
	 uUx+fKcEDYkAh7cGZRWDlaaBufum4Box+EFg7TOASF266NHoE3EVpfoENrLV/4u6Eu
	 MOGgLJKgETuvdBmUPcH/JYosLxwK9mmggugtjSdndOLHGAOfoFUgZa/U2sSV9gIk0n
	 VMNI/2hfKPqPSHyL1pbF3ymYn8VDl+Prz9VEX6rKZyqZCG5qcKcYnTYPxmTaHwiofQ
	 BsWV87bUWVo9apedriWlAx0I4H8kIGgg4DlkKV0tSenSU6QBL9HbWlnlk0Ra32eY3F
	 pdEKtZ7SWeV7w==
Date: Mon, 13 Jul 2026 17:22:58 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Toshi Kani <toshi.kani@hpe.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	David Carlier <devnexen@gmail.com>, Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	syzbot+fd95a72470f5a44e464c@syzkaller.appspotmail.com, Kiryl Shutsemau <kas@kernel.org>
Subject: Re: [PATCH 0/2] mm: fix UAF caused by race between ptdump and vmap
 pgtable freeing
Message-ID: <alUPbRx3_neT5ioO@lucifer>
References: <20260710-series-vmap-race-fix-v1-0-5b3794c113fe@kernel.org>
 <8e320b30-9658-4e9f-ac4c-f99dcf855944@arm.com>
 <alNQccqtx5-QApup@lucifer>
 <alTOCtzQh9RMfWbc@willie-the-truck>
 <alTxUwrkzEx-FEOP@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alTxUwrkzEx-FEOP@kernel.org>
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

+cc Kiryl as ref'd below.

On Mon, Jul 13, 2026 at 05:08:19PM +0300, Mike Rapoport wrote:
> On Mon, Jul 13, 2026 at 12:37:46PM +0100, Will Deacon wrote:
> > On Sun, Jul 12, 2026 at 09:46:46AM +0100, Lorenzo Stoakes wrote:
> > > On Sun, Jul 12, 2026 at 12:50:08PM +0530, Dev Jain wrote:
> > > > Will Deacon had pushed back on a similar approach:
> > > > https://lore.kernel.org/all/20250530123527.GA30463@willie-the-truck/
> > > >
> > > > Although now when I read back that thread, it feels more so like my
> > > > incompetency to convince :) because:
> > >
> > > No haha not so, I think more like this stuff is fiddly.
> >
> > Yup, not disputing that this is hard to get right.
> >
> > Conceptually, adding locking purely to deal with a vanishingly rare,
> > debug reader does turn my head but I'm _far_ less concerned about it if
> > it's done in the core code, as is the case here. x86 needs it and we're
> > recently running into related locking issues with the set_memory_*()
> > APIs if we want to collapse the page-table on arm64 [1]. If the overhead
> > is flagged as an issue, we can see if it's worth generalising the static
> > key trick that the second patch reverts but I definitely wouldn't start
> > from that position.

Yeah I think my solution is not exactly pretty but it's the best fix as a hotfix
thing _right now_.

As Kiryl points out the nicer long-term solution would be RCU freeing, but I
think that's the wrong solution for a _fix_ right now, rather something to look
at as a larger structural change in the future.

>
> I'd say it's worth generalizing the set_memory APIs ;-)
>
> Since it's de-facto machinery for manipulation of the kernel page tables it
> makes sense to have a common code for page table walks with hooks to
> architectures for checking/setting/clearing protection bits.
>
> Coincidentally, I'm working on a POC that lifts x86's CPA into mm/ with
> the intention to later use it on other architectures.

Lovely :)

There's another issue with CPA too (planned to raise this separately already but
been super busy/distracted lately :) - it doesn't actually mark its page tables
as kernel page tables so we actually have a gap if an IOMMU happens to map that.

I am planning to send a patch for that anyway but it's indicative of this
needing to be shared code, and lifting stuff up to be shared is good in general
:)

>
> > Will
> >
> > [1] https://lore.kernel.org/linux-arm-kernel/799181c3-a1a1-4de7-bc6a-576d3282efb0@arm.com/
>
> --
> Sincerely yours,
> Mike.

Cheers, Lorenzo

