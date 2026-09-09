Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B31CC79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pubbd2dNu1LQzdMpKfGD1I+IW+yVdlfvOm5SQzKSwOA=; b=y0GtGguP6ICi6IF4gE9GWIcT7z
	7iKWDXP+RWhAZJFdAD2fGQ1uf8tJTigByBFzbTCenJr9UmHZQFl9pDklEryHA12rnWHO66qfikX/w
	QZAZavRgZo73rRVzyvWOkaxlLbpt18aN+cCoRy3XzrhH4d6ls0hf4JT0JifUbiOITlPGPOYLD87oN
	p1bTKAuKIDZdw2HRUpY747F0sbsrfI+/Y4GBK3D0jeEI7iI8xx/CrwUAQ+BRO6kK8xD/1eCZ0uAmF
	5TQ/Fc+fH0+0PzcLgjAd1wkLQaWcmO8jr/IotitEgdjk9BZyrdQJPra3P+Ys2XAxxJ0IH7GclGNlq
	ZeMGXFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M3M-0000000CTka-0YNy;
	Wed, 09 Sep 2026 17:25:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M3G-0000000CThK-0OmS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:25:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D2AE043F2E;
	Wed,  9 Sep 2026 17:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1130C1F00893;
	Wed,  9 Sep 2026 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974737;
	bh=Pubbd2dNu1LQzdMpKfGD1I+IW+yVdlfvOm5SQzKSwOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Np2zHsZYyQkXFsoQXHrepxlLGabd+RY/LBmPCa+qEqed8bCT4ZETBek7x/fepo2cf
	 chc0NHhTyWBOo6MGAe1MrYbgn7rNMGHB+e1UrAiQxAUHgqiXvdoqS10NF4irGfKGVI
	 OZJQwaSiCY2nNlmpzquIIfCMsl9L+cAJww6j7RQg4rEeYoATXyukmi6ZDsLquBc5uv
	 jbodWLtGPjBeZ5BJD1s91Ykdq+MH+S8UREAaZvPNBRWDpRr0ED+x0Ok8sayWFcQ6pQ
	 54ujIFeehVia5phkoxeM18mkzVx3GTUC3a4BKwkk6m7ri25RP/Lk54BM9PfdUa/6sZ
	 QZyhRCK3nIy1g==
Date: Wed, 9 Sep 2026 20:25:24 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	=?iso-8859-1?Q?Pierre-Cl=E9ment?= Tosi <ptosi@google.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH RFC v9 12/25] mm: kpkeys: Protect regular page tables
Message-ID: <aqGWhJjE1VUZf8_3@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-12-743ad31b2c8f@arm.com>
 <178877845406.3691569.12554855722197968629.b4-review@b4>
 <bdba5b54-8733-4d47-952d-e1bd958a1ead@arm.com>
 <ap-6PZqGZHhPD6u1@kernel.org>
 <00e97c75-eef1-4587-b299-ab07591a07bc@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00e97c75-eef1-4587-b299-ab07591a07bc@arm.com>
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

On Tue, Sep 08, 2026 at 12:11:57PM +0200, Kevin Brodsky wrote:
> On 08/09/2026 09:33, Mike Rapoport wrote:
> > On Mon, Sep 07, 2026 at 05:52:32PM +0200, Kevin Brodsky wrote:
> >> On 07/09/2026 12:54, Mike Rapoport wrote:
> >>>> [...]
> >>>>
> >>>>  static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int order)
> >>>>  {
> >>>> -	struct page *page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> >>>> +	struct page *page;
> >>>> +
> >>>> +	if (kpkeys_hardened_pgtables_enabled())
> >>>> +		page = kpkeys_pgtable_alloc(gfp | __GFP_COMP, order);
> >>>> +	else
> >>>> +		page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> >>> Can we make it a sequence rahter than a branch?
> >>>
> >>> kpkeys_pgtable_alloc() does alloc_pages and then sets their pkeys, so I
> >>> think something like this should work:
> >>>
> >>> 	page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> >>> 	if (!page)
> >>> 		return NULL;
> >>> 	err = kpkeys_pgtable_alloc(page);
> >>> 	if (err) {
> >>> 		__free_pages(page, order);
> >>> 		return NULL;
> >>>
> >>> with if (kpkeys_hardened_pgtables_enabled()) folded into
> >>> kpkeys_pgtable_alloc().
> >> I agree this would be less ugly. In fact this is pretty much what this
> >> series did up to RFC v5 (albeit in the ctor/dtor instead of alloc/free).
> >> We could go back to this API, *but* the big issue is that it makes it
> >> impossible to use a smarter allocation strategy for protected pages.
> >> Patch 14 in RFC v6 [1] will give you an idea of what such an allocator
> >> (with support for large blocks and splitting) would look like.
> >>
> >> As discussed with David H we're first trying to land this feature
> >> without large block support (fully PTE-mapped direct map), but we do
> >> want to support large blocks eventually [2] and I would prefer the core
> >> API to be already compatible with that objective. Very happy to hear
> >> about suggestions as to how to avoid the explicit condition in
> >> pagetable_alloc() though!
> > We could unconditionally replace alloc_pages_noprof() with
> > kpkeys_pgtable_alloc() and make the latter choose the right allocator, but
> > that's not very nice either :/
> 
> Yep I also thought of that but the naming would be really misleading...
> 
> Maybe, maybe, introduce __pagetable_alloc() that is a simple static
> inline calling alloc_pages_noprof() if !CONFIG_KPKEYS_HARDENED_PGTABLES,
> and otherwise checks kpkeys_hardened_pgtables_enabled()? Less ugliness
> in pagetable_alloc() but even more further down, not sure this helps.

You are right and I can't say I have any bright ideas.
 
> - Kevin

-- 
Sincerely yours,
Mike.

