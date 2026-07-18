Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B1FC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN4SFoY/tZY29HdeZMDLAXwiTzxCSnJElqCY0zELtGs=; b=hpHaU1LA0Qp9RhnHKOWrvG9Pum
	RWwFkyhD1EtEOx+YszGozvZK6pWMZNObdYnSPhv5zYG0ip2/UM89rGbzGO+ls7NZhgmxdbDEd7hA3
	1pJJXjzwK31taN04lw/Qx4pEKqpYLgeWnm0NSIF00GZP4WDeNqdmI5LUTvxGIKMVquSjHF7k3QYXS
	Rt2Zba+xMEjceCv90l2q/eik8U2ufKOPnTt0LrbaMH8SbR7mt0MijJDQsin2VFm7vwMlGgar7ylrF
	965O2gq5uvmSxlkiSJgh/WcrUV/UjKcOW7sEN3lyxu4x3a9Pssf6v/+dk1MetNEmosbh7VSwukIgM
	FxW4ytKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl623-00000004ALr-3B8a;
	Sat, 18 Jul 2026 14:28:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl623-00000004ALj-1M4H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 14:28:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2864B60018;
	Sat, 18 Jul 2026 14:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7DD1F000E9;
	Sat, 18 Jul 2026 14:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784384925;
	bh=cN4SFoY/tZY29HdeZMDLAXwiTzxCSnJElqCY0zELtGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e2Uj07DOjH/TQ82jaKLRrQ0tj27mcvpntC4p3PJATIngsRHYlFU3X3lofLYviPBbs
	 u5SyLmqiWfPcoz5tpuccs2N0KK12Od0OysNEMnnoYf6Ykh6Sy5OFYiUIoom5d8w5U1
	 GUGdRFnntCxA4dVhZGQx7NjUHixCXMFqML9lUABHYf1QbdQYTkuwl6x0rdGQOsQoN+
	 MrdDSuVD6+gdakknmWXozFPIxdXvFolH0Ka3+st04WOm7vqEifB/e5avrrzrslKj/h
	 jZXYC+c+KKbCZ+E03rv7Y58wu4KoW0RstJn2j3yEL01YMhErUicAUA+uvQy8a78y/K
	 pl0KFFOHijohQ==
Date: Sat, 18 Jul 2026 15:28:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"Denis V. Lunev" <den@virtuozzo.com>, stable@vger.kernel.org
Subject: Re: [PATCH mm-hotfixes v5 3/5] x86/mm/pat: acquire init_mm read lock
 on attribute change to avoid UAF
Message-ID: <aluLf-2NcDKylRP_@lucifer>
References: <20260717-series-vmap-race-fix-v5-0-606a0ac6d3e5@kernel.org>
 <20260717-series-vmap-race-fix-v5-3-606a0ac6d3e5@kernel.org>
 <altbeuTZ0HCz_7HS@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <altbeuTZ0HCz_7HS@kernel.org>
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

On Sat, Jul 18, 2026 at 01:54:50PM +0300, Mike Rapoport wrote:
> On Fri, Jul 17, 2026 at 06:30:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> > A previous commit protected us against races between ptdump and CPA
> > collapse, however one still exists between attribute changes and collapse
> > as reported by Denis V. Lunev (linked).
> >
> > When an attribute change arises, a lockless page table walker obtains a PTE
> > entry, which is later written to via set_pte_atomic():
> >
> > ...
> > -> change_page_attr_set_clr()
> > -> __change_page_attr_set_clr()
> > -> __change_page_attr()
> > 	-> _lookup_address_cpa()
> > 	-> lookup_address_in_pgd_attr()
> > 	-> [ lockless page table walker ]
> > -> set_pte_atomic()
> >
> > There is nothing preventing a concurrent CPA collapse which can free the
> > PTE that was retrieved here, resulting in a use-after-free.
> >
> > With the mmap write lock taken on init_mm over CPA collapse, we can now
> > resolve this race by acquiring an mmap read lock on init_mm over
> > __change_page_attr_set_clr().
> >
> > This locks across the whole operation over which the walk and the PTE entry
> > write occurs, solving the race.
> >
> > It is safe to do this here, as no spinlocks are held upon entry to
> > __change_page_attr_set_clr().
> >
> > The CPA_COLLAPSE flag is only set by set_memory_rox(), which exclusively
> > operates upon vmalloc ranges, and on x86 only within the module mapping
> > space.
> >
> > This is important, because some callers directly invoke
> > __change_page_attr_set_clr(), bypassing this lock. However, none of these
> > operate within the module mapping space.
> >
> > * cpa_process_alias() - a recursive helper called by
> >   __change_page_attr_set_clr().
> > * __set_memory_enc_pgtable() - operates on the direct mapping and (via
> >   __vmbus_establish_gpadl()) the vmalloc mapping space.
> > * __set_pages_[n]p() - called by set_direct_map_[invalid, default,
> >   valid]_noflush(), __kernel_map_pages() - operates on the direct map.
> > * kernel_[un]map_pages_in_pgd() - operates on EFI ranges.
> >
> > This work is based upon Denis V. Lunev's excellent analysis of the bug with
> > gratitude.
> >
> > Link: https://lore.kernel.org/all/20260626163213.2284080-1-den@openvz.org/
> > Fixes: 41d88484c71c ("x86/mm/pat: restore large ROX pages after fragmentation")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  arch/x86/mm/pat/set_memory.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> > index d1e63f7d267f..301fb9e77d91 100644
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@ -2122,7 +2122,9 @@ static int change_page_attr_set_clr(unsigned long *addr, int numpages,
> >  	cpa.curpage = 0;
> >  	cpa.force_split = force_split;
> >
> > -	ret = __change_page_attr_set_clr(&cpa, 1);
> > +	/* Avoid race with concurrent CPA collapse. */
> > +	scoped_guard(mmap_read_lock, &init_mm)
> > +		ret = __change_page_attr_set_clr(&cpa, 1);
>
> There's a small issue with this. debug_pagealloc_unmap_pages() ends up here
> and since it's called from __free_pages() it can be in an atomic context.

Not the case - the callstack is:

debug_pagealloc_unmap_pages()
-> __kernel_map_pages()
-> __set_pages_[n]p()
-> __change_page_attr_set_clr()

So it calls __change_page_attr_set_clr() not change_page_addr_set_clr()
and doesn't hit this code.

As per the commit msg, it (and all the other bare
__change_page_attr_set_clr() callers) do not hit ranges that can be
collapsed so the race doesn't exist there.

Also the CPA_NO_CHECK_ALIAS flag is set, meaning there's no weird aliasing
recursion via cpa_process_alias() (which in any case, also calls
__change_page_attr_set_clr() directly anyway).

>
> >
> >  	/*
> >  	 * Check whether we really changed something:
> >
> > --
> > 2.55.0
> >
>
> --
> Sincerely yours,
> Mike.

Thanks, Lorenzo

