Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C08C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLA++7QbgSutvFaC1htYkrD41KHYBranyoZiDvoDoCE=; b=anOHvkDoEexPlVwFDg9f/rSjLI
	uxZvyAP8jsowU+0FLxRQ28TI3dIbZ0hGrw76MX/w1MXF6qCghvN974OIDiXkRMAmEXB6aNWiVDtRG
	lnVEUlDtIWzI3Xh4zWcer0osUvTpoMSObloNHZlzujIhwJLbF1/D4C0T3mq9eQ0JGdr5XhcVKEpLS
	Quh/4vs+coENXuDsMmLXOyRVUKz8x19euwruoEXwcCqbhNetwcZ6wfWIoQwGg5EMGUfZkShRHJdkc
	4PAPURAbsObbjIxFlBmo1cjmP4m9lhCe1Rj1UhxHlE9wcBuOQ7+RkINFcUWTAKYzUzfMKYboL0Mqa
	CsX0hwgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbYx-00000003QMl-1k4x;
	Tue, 01 Apr 2025 13:21:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbX9-00000003Q2M-1iWv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 13:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E3045C4A91;
	Tue,  1 Apr 2025 13:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE0CC4CEE4;
	Tue,  1 Apr 2025 13:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743513602;
	bh=9wSJvejkq5NxPrQKr0Jhsiek8qkHChwl57pzJsxs7qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YIaDl7MvazjElWMG6+MRQRAKFy4pTiPH2Y5kKB+bwOeQGRBx28iNTxNhm+kBGiDtp
	 4YKO8ZQVxGwwSlju1t7NgbfrcAPwjIo8gvofNVbWgUvO0GBU0+rwWFjhkT3apkAmJ4
	 uY6pQqwyoDvqNlDYRZ6RCPga2q3TC6ojEw3OP+LuTxjk5AxZLRDTvJDoDvb6gOWS6h
	 jWngKU0OhKMznLLv+XUMAgOMR4RZ/zSX670RxahSYlQ+eSNB6tA5K2+nNlGWzX4fN9
	 HG0WNS17ib8DRY6FK3ZVY7oTA0kM7Eb5cnhK7WDEDKBVJRdkqT7xn73igeNcfTzWSk
	 KgnRbPM3oyH6A==
Date: Tue, 1 Apr 2025 16:19:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 2/4] memblock: update initialization of reserved pages
Message-ID: <Z-vn-sMtNfwyJ9VW@kernel.org>
References: <20210511100550.28178-1-rppt@kernel.org>
 <20210511100550.28178-3-rppt@kernel.org>
 <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>
 <Z-qrtJ6cs-kXpepR@kernel.org>
 <b47d5f5602573bd082be3729ceddb3d1dc374ef1.camel@infradead.org>
 <Z-vPBu5vAvFhYDzP@kernel.org>
 <1787b97c267b53127c60a61419d99751f8a66b1a.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1787b97c267b53127c60a61419d99751f8a66b1a.camel@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_062003_557852_F53DDFFD 
X-CRM114-Status: GOOD (  48.93  )
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

On Tue, Apr 01, 2025 at 12:50:33PM +0100, David Woodhouse wrote:
> On Tue, 2025-04-01 at 14:33 +0300, Mike Rapoport wrote:
> > On Mon, Mar 31, 2025 at 04:13:56PM +0100, David Woodhouse wrote:
> > > On Mon, 2025-03-31 at 17:50 +0300, Mike Rapoport wrote:
> > > > On Mon, Mar 31, 2025 at 01:50:33PM +0100, David Woodhouse wrote:
> > > > > On Tue, 2021-05-11 at 13:05 +0300, Mike Rapoport wrote:
> > > > > 
> > > > > On platforms with large NOMAP regions (e.g. which are actually reserved
> > > > > for guest memory to keep it out of the Linux address map and allow for
> > > > > kexec-based live update of the hypervisor), this pointless loop ends up
> > > > > taking a significant amount of time which is visible as guest steal
> > > > > time during the live update.
> > > > > 
> > > > > Can reserve_bootmem_region() skip the loop *completely* if no PFN in
> > > > > the range from start to end is valid? Or tweak the loop itself to have
> > > > > an 'else' case which skips to the next valid PFN? Something like
> > > > > 
> > > > >  for(...) {
> > > > >     if (pfn_valid(start_pfn)) {
> > > > >        ...
> > > > >     } else {
> > > > >        start_pfn = next_valid_pfn(start_pfn);
> > > > >     }
> > > > >  }
> > > > 
> > > > My understanding is that you have large reserved NOMAP ranges that don't
> > > > appear as memory at all, so no memory map for them is created and so
> > > > pfn_valid() is false for pfns in those ranges.
> > > > 
> > > > If this is the case one way indeed would be to make
> > > > reserve_bootmem_region() skip ranges with no valid pfns.
> > > > 
> > > > Another way could be to memblock_reserved_mark_noinit() such ranges and
> > > > then reserve_bootmem_region() won't even get called, but that would require
> > > > firmware to pass that information somehow.
> > > 
> > > I was thinking along these lines (not even build tested)...
> > > 
> > > I don't much like the (unsigned long)-1 part. I might make the helper
> > > 'static inline bool first_valid_pfn (unsigned long *pfn)' and return
> > > success or failure. But that's an implementation detail.
> > > 
> > > index 6d1fb6162ac1..edd27ba3e908 100644
> > > --- a/include/asm-generic/memory_model.h
> > > +++ b/include/asm-generic/memory_model.h
> > > @@ -29,8 +29,43 @@ static inline int pfn_valid(unsigned long pfn)
> > >         return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
> > >  }
> > >  #define pfn_valid pfn_valid
> > > +
> > > +static inline unsigned long first_valid_pfn(unsigned long pfn)
> > > +{
> > > +       /* avoid <linux/mm.h> include hell */
> > > +       extern unsigned long max_mapnr;
> > > +       unsigned long pfn_offset = ARCH_PFN_OFFSET;
> > > +
> > > +       if (pfn < pfn_offset)
> > > +               return pfn_offset;
> > > +
> > > +       if ((pfn - pfn_offset) < max_mapnr)
> > > +               return pfn;
> > > +
> > > +       return (unsigned long)(-1);
> > > +}
> > 
> > This seems about right for FLATMEM. For SPARSEMEM it would be something
> > along these lines (I kept dubious -1):
> 
> Thanks. Is that right even with CONFIG_SPARSEMEM_VMEMMAP? It seems that
> it's possible for pfn_valid() to be false for a given *page*, but there
> may still be valid pages in the remainder of the same section in that
> case? 

Right, it might after memory hot-remove. At boot the entire section either
valid or not.
 
> I think it should only skip to the next section if the current section
> doesn't exist at all, not just when pfn_section_valid() return false?

Yeah, when pfn_section_valid() returns false it should itereate pfns until
the end of the section and check if they are valid. 
 
> I also wasn't sure how to cope with the rcu_read_lock_sched() that
> happens in pfn_valid(). What's that protecting against? Does it mean
> that by the time pfn_valid() returns true, that might not be the
> correct answer any more?
 
That's protecting against kfree_rcu() in section_deactivate() so even if
the answer is still correct, later access to apparently valid struct page
may blow up :/ 

> > static inline unsigned long first_valid_pfn(unsigned long pfn)
> > {
> > 	unsigned long nr = pfn_to_section_nr(pfn);
> > 
> > 	do {
> > 		if (pfn_valid(pfn))
> > 			return pfn;
> > 		pfn = section_nr_to_pfn(nr++);
> > 	} while (nr < NR_MEM_SECTIONS);
> > 
> > 	return (unsigned long)-1;
> > }

-- 
Sincerely yours,
Mike.

