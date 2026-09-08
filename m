Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECB5C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XksScMTj542HVHkyB1nI14urzyZQ1NnPrwE6pFWv+JM=; b=GyCCoV4DILCae84R9mFZOJt64K
	vMZI3l9Fjzn2M/QzqV/95AKbAzmbDrRhvpOo4OD1e9BsJzKMQ+wtqqjTrRzvw0L0xzrIeFtb4AztM
	5FC5NCl1BVsdClYqCQHcvA45jGTLHCNKZpA499MVPYmxwtqupo9/i6BWOXFnjB4/Gp6UeAuW68pOv
	7anzuPUwMBrwoMV6+YJGpyD9pGt6NSdTQMOsNQx5qpvghkhZGb0QUAa0DYBtOlXkLFP831nXydA61
	97Ku46gDN9lyF//XtpaEl8iPA1v91rXuUfV4PlpZtK0Ry3+tHkNKJOEBLqpFcRNAVU439yij/1fEL
	qkPsUigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qKi-00000008HSq-2v1W;
	Tue, 08 Sep 2026 07:33:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qKi-00000008HSb-1BpI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:33:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D270D42B6A;
	Tue,  8 Sep 2026 07:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6E41F00A3A;
	Tue,  8 Sep 2026 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788852811;
	bh=XksScMTj542HVHkyB1nI14urzyZQ1NnPrwE6pFWv+JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NDf5yNABuLUHiqeaxlPBpJIkI3TK9/rc8cWI+3xEERZ7V7seyLQhxFkrAmyfltW9A
	 YMYkHArboRJpL/my33wJQzLLWU30oaoeEJ6Ttyg6w1/hv2TEYtTysufc1I4riY7Dqe
	 1JpKsL4Pz+cuPhrKS57RxOWMoKUh9ZXCcPFodVwYvHAdhk5Vs5zfob/oRkS22YVwvE
	 9ctwQ1+AqKOVimiiWzAVqs/TQgZg2HOTktggOfpLZh3Suk6syCfNKi0yyOR3e83vSz
	 TLAmts2y/e750y5m0ukDcwHblMQiyyUtAMyxQ5Byvy5FEVfYT0tz5dLmFYwRCykPWh
	 XLK7zvj4B1Wsw==
Date: Tue, 8 Sep 2026 10:33:17 +0300
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
Message-ID: <ap-6PZqGZHhPD6u1@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-12-743ad31b2c8f@arm.com>
 <178877845406.3691569.12554855722197968629.b4-review@b4>
 <bdba5b54-8733-4d47-952d-e1bd958a1ead@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdba5b54-8733-4d47-952d-e1bd958a1ead@arm.com>
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

On Mon, Sep 07, 2026 at 05:52:32PM +0200, Kevin Brodsky wrote:
> On 07/09/2026 12:54, Mike Rapoport wrote:
> >> [...]
> >>
> >>  static inline struct ptdesc *pagetable_alloc_noprof(gfp_t gfp, unsigned int order)
> >>  {
> >> -	struct page *page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> >> +	struct page *page;
> >> +
> >> +	if (kpkeys_hardened_pgtables_enabled())
> >> +		page = kpkeys_pgtable_alloc(gfp | __GFP_COMP, order);
> >> +	else
> >> +		page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> > Can we make it a sequence rahter than a branch?
> >
> > kpkeys_pgtable_alloc() does alloc_pages and then sets their pkeys, so I
> > think something like this should work:
> >
> > 	page = alloc_pages_noprof(gfp | __GFP_COMP, order);
> > 	if (!page)
> > 		return NULL;
> > 	err = kpkeys_pgtable_alloc(page);
> > 	if (err) {
> > 		__free_pages(page, order);
> > 		return NULL;
> >
> > with if (kpkeys_hardened_pgtables_enabled()) folded into
> > kpkeys_pgtable_alloc().
> 
> I agree this would be less ugly. In fact this is pretty much what this
> series did up to RFC v5 (albeit in the ctor/dtor instead of alloc/free).
> We could go back to this API, *but* the big issue is that it makes it
> impossible to use a smarter allocation strategy for protected pages.
> Patch 14 in RFC v6 [1] will give you an idea of what such an allocator
> (with support for large blocks and splitting) would look like.
> 
> As discussed with David H we're first trying to land this feature
> without large block support (fully PTE-mapped direct map), but we do
> want to support large blocks eventually [2] and I would prefer the core
> API to be already compatible with that objective. Very happy to hear
> about suggestions as to how to avoid the explicit condition in
> pagetable_alloc() though!

We could unconditionally replace alloc_pages_noprof() with
kpkeys_pgtable_alloc() and make the latter choose the right allocator, but
that's not very nice either :/
 
> - Kevin
> 
> [1]
> https://lore.kernel.org/linux-hardening/20260227175518.3728055-15-kevin.brodsky@arm.com/
> [2] https://lore.kernel.org/all/aMwd7IJVECEy8mzf@willie-the-truck/

-- 
Sincerely yours,
Mike.

