Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7C3C44520
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0iH+iLx4WpWMlR/UNqi4frhPXGJpdzII4B/mC2Dvak=; b=gXJcQ0SnUH+HjphdgTJJQxnXn5
	vUQ/QexNgA0j8ZZBOecYfHm3iVaA6UVm7kBFYZa9D2qz8uw7+hn6L/n4FI+wTde4b3cATQgzexUUI
	MuYj5m1VcgAT8HILAS7vnX7n8inhrGxeN+AMMBfiwCqU8A9ImbvymMZx28gpvlvPyZUJsEfolNbOD
	rhXGWwuv2cyeMJI5ZwTatQ0SFC3cq7Npe/BJpel5uPxRRqt4j0S750TrEiIleV1DyvuL8/6htpeO9
	dbJxuqYgLPke9Y+ykB2nzTXrSE1oJy7OZ2FxBNMwMXb2J1Xwxz4J1UU6yEOlEcRU7oAypxM0/wmBa
	l0E57Jnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkh0L-00000002BGQ-1x2A;
	Fri, 17 Jul 2026 11:45:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkh0J-00000002BGI-3M7h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 11:45:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79EFB40EFA;
	Fri, 17 Jul 2026 11:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93521F000E9;
	Fri, 17 Jul 2026 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784288719;
	bh=H0iH+iLx4WpWMlR/UNqi4frhPXGJpdzII4B/mC2Dvak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WRNVSRptWK6XYa4Qx4ycFwy+YSZ0sh256CyMtcxwLqRGQnZnv20dPjhLgDnYR5hO+
	 wYBKKKgRCGTBm7davcd2HvN/ei6UTurGSSe0PiUsyoeJCpKX0q/1NdQNS2bbbtU0Pi
	 7zs92fuSaLV/9lgBGyXrGWWymB42knidq/161vuAenO+Rv1iS4lh+BKmGuBxar03BR
	 pVz9eNecpKtEVX03Hz/BRdsr0oog3dfvAPuKjXXSEZPD/miCvmhOK4u9mylALq73W7
	 GSg4C7H7YIv6cJbF5hkYfJ4g9DFLFUhHZov1hso1Q3pyOLXxBpTj+7z0UenW1/pORw
	 yd0PhSue8nB0A==
Date: Fri, 17 Jul 2026 12:45:00 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Toshi Kani <toshi.kani@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dev Jain <dev.jain@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	David Carlier <devnexen@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"Denis V. Lunev" <den@virtuozzo.com>, stable@vger.kernel.org
Subject: Re: [PATCH mm-hotfixes v4 2/4] x86/mm/pat: acquire init_mm write
 lock to avoid UAF
Message-ID: <aloU00ZYF-Iy_7tY@lucifer>
References: <20260716-series-vmap-race-fix-v4-0-8c108c4317df@kernel.org>
 <20260716-series-vmap-race-fix-v4-2-8c108c4317df@kernel.org>
 <aloSXsTLOSepa5fA@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aloSXsTLOSepa5fA@willie-the-truck>
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

On Fri, Jul 17, 2026 at 12:30:38PM +0100, Will Deacon wrote:
> On Thu, Jul 16, 2026 at 10:31:13PM +0100, Lorenzo Stoakes (ARM) wrote:
> > x86 implements page attribute modification using its Change Page
> > Attributes (CPA) mechanism.
> >
> > This tracks properties of ranges such as cache mode through x86 page
> > attributes, and as part of that logic manipulates kernel page tables.
> >
> > Since commit 41d88484c71c ("x86/mm/pat: restore large ROX pages after
> > fragmentation") ranges of kernel page table entries can be collapsed into
> > huge page table entries as part of this logic.
> >
> > As part of this collapse, it frees the page tables which the collapsed
> > entries previously pointed to, and it does so without any relevant locks
> > being held to preclude concurrent kernel page table walkers.
> >
> > The only way this code can be reached is if CPA_COLLAPSE is specified, and
> > this is only set in set_memory_rox() via:
> >
> > set_memory_rox()
> > -> change_page_attr_set_clr()
> > -> cpa_flush()
> > -> cpa_collapse_large_pages()
> >
> > Notable users of this are execmem and bpf when manipulating executable
> > mappings.
> >
> > However, this is problematic for ptdump as it walks ranges it does not own
> > and thus runs the risk of a use-after-free on page tables freed underneath
> > it.
> >
> > In addition, concurrent CPA collapse operations are possible which can also
> > cause races.
> >
> > Resolve the issue by acquiring the mmap write lock on init_mm across the
> > whole operation.
>
> Thanks, Lorenzo.
>
> This ain't worth much here, but all the same:
>
> Reviewed-by: Will Deacon <will@kernel.org>

Always appreciated :>) thanks!

>
> with one nit below:
>
> > diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> > index d023a40a1e03..d1e63f7d267f 100644
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/cc_platform.h>
> >  #include <linux/set_memory.h>
> >  #include <linux/memregion.h>
> > +#include <linux/cleanup.h>
> >
> >  #include <asm/e820/api.h>
> >  #include <asm/processor.h>
> > @@ -410,7 +411,7 @@ static void __cpa_flush_tlb(void *data)
> >
> >  static int collapse_large_pages(unsigned long addr, struct list_head *pgtables);
> >
> > -static void cpa_collapse_large_pages(struct cpa_data *cpa)
> > +static void __cpa_collapse_large_pages(struct cpa_data *cpa)
> >  {
> >  	unsigned long start, addr, end;
> >  	struct ptdesc *ptdesc, *tmp;
> > @@ -442,6 +443,18 @@ static void cpa_collapse_large_pages(struct cpa_data *cpa)
> >  	}
> >  }
> >
> > +static void cpa_collapse_large_pages(struct cpa_data *cpa)
> > +{
> > +	/*
> > +	 * Take the mmap write lock on init_mm to:
> > +	 * - Avoid a use-after-free if raced by ptdump (which takes its own
> > +	 *   write lock on init_mm).
> > +	 * - Serialise concurrent CPA walkers.
>
> The CPA lock should handle those, so I think it's the non-CPA walkers

Ah well no actually, see Denis's patch at [2] - we actually have a race here
that this doesn't quite solve.

But. See my reply at [3] - if people are agreeable to that I'll respin with an
extra patch to fix that which this change now permits :))

> that are problematic. Looks like Sashiko reckons it's found some that
> don't take the mmap_lock at all [1], but this is still a big step in the
> right direction, fixes the ptdump case and we're not trying to boil the
> ocean.
>
> Will
>
> [1] https://lore.kernel.org/all/20260716215307.14A6E1F000E9@smtp.kernel.org/#t

In the long run I'm looking into RCU-safe page table freeing more generally, but
obviously here we're trying to get things to a state of vague sanity (and
probably we're not getting _all_ the races anyway) first.

Cheers, Lorenzo

[2]:https://lore.kernel.org/all/20260626163213.2284080-1-den@openvz.org/
[3]:https://lore.kernel.org/all/20260716-series-vmap-race-fix-v4-0-8c108c4317df@kernel.org/

