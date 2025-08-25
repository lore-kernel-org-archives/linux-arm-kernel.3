Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140A7CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkD+sthOFrkZQBgyD/Brdao7sTCKGDTnrvrWEf6+780=; b=qg8wsXvW1yJzBoNxvDqZjTn9bU
	dNkMeqdCbfmo04zvI0RZMtfqYsMItV/H/ErcJFa2NZAmvlva1YF0BXtebAq+HImq2S13STHzaq/Gn
	qWaGrdk4C0c1pXqDGbsOyU9WbjClJoFMx8ydOg3IeA2XwnVEzv7WXYhVy+Iz5tOlGfNFXI16vNiYr
	AD49VnuiFNx1Yal3BqmRzcGYznDLY2A/vvmX3lMOa3GJbUlVM/QFSBAkAiBuR7jD53lo3A+OqhYXH
	QuOq7+TDt+AR+uoagZP2V9488iBANZ6XYWYMheepvsm2rB/pWXw9wJF3/bg70YXNDkW/mkntfAT7S
	T3vGM7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZXa-00000008ZlE-0d60;
	Mon, 25 Aug 2025 15:55:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYfc-00000008MEJ-3FuF;
	Mon, 25 Aug 2025 14:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDFB95C5988;
	Mon, 25 Aug 2025 14:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3D6C4CEED;
	Mon, 25 Aug 2025 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756133979;
	bh=YtWwiemXxXk/HndwfafEfgJsQeylyFu02jnoMvbgzgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jn0AZo3pPFK0BugUL3OMCDpCV1HmeNy40TLdNKtLX5SypUoRptbAF9EKk4ejmZPkz
	 4+fhto2i95Q8o+P1Az66DJeNk8sJ/NyNwPVZIk6s6vBe389Ho9bI4oPnQEWOp80T7O
	 GtLnp1xpVgMb/AC15WB27oS0HJcJwkR6UUktQVbU3ti8iXBP/sjXLozRWAuvgf0GjM
	 wZgTeBgQn1M3OOuOkCDIwQMCPIaP4blPKHTb9cXNDnLZlHu07Wyh1OfkyGZAnS83zw
	 dhcVTO4etdblD/32knv8disDXUulJuw7B97TzcOXKyT3A66aD23GWc4jfTztl6wlSw
	 r5yMDLTA1mfKw==
Date: Mon, 25 Aug 2025 17:59:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Mika =?iso-8859-1?Q?Penttil=E4?= <mpenttil@redhat.com>,
	linux-kernel@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH RFC 10/35] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
Message-ID: <aKx6SlYrj_hiPXBB@kernel.org>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-11-david@redhat.com>
 <9156d191-9ec4-4422-bae9-2e8ce66f9d5e@redhat.com>
 <7077e09f-6ce9-43ba-8f87-47a290680141@redhat.com>
 <aKmDBobyvEX7ZUWL@kernel.org>
 <a90cf9a3-d662-4239-ad54-7ea917c802a5@redhat.com>
 <aKxz9HLQTflFNYEu@kernel.org>
 <a72080b4-5156-4add-ac7c-1160b44e0dfe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a72080b4-5156-4add-ac7c-1160b44e0dfe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_075940_960377_7252E8F9 
X-CRM114-Status: GOOD (  29.61  )
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

On Mon, Aug 25, 2025 at 04:38:03PM +0200, David Hildenbrand wrote:
> On 25.08.25 16:32, Mike Rapoport wrote:
> > On Mon, Aug 25, 2025 at 02:48:58PM +0200, David Hildenbrand wrote:
> > > On 23.08.25 10:59, Mike Rapoport wrote:
> > > > On Fri, Aug 22, 2025 at 08:24:31AM +0200, David Hildenbrand wrote:
> > > > > On 22.08.25 06:09, Mika Penttilä wrote:
> > > > > > 
> > > > > > On 8/21/25 23:06, David Hildenbrand wrote:
> > > > > > 
> > > > > > > All pages were already initialized and set to PageReserved() with a
> > > > > > > refcount of 1 by MM init code.
> > > > > > 
> > > > > > Just to be sure, how is this working with MEMBLOCK_RSRV_NOINIT, where MM is supposed not to
> > > > > > initialize struct pages?
> > > > > 
> > > > > Excellent point, I did not know about that one.
> > > > > 
> > > > > Spotting that we don't do the same for the head page made me assume that
> > > > > it's just a misuse of __init_single_page().
> > > > > 
> > > > > But the nasty thing is that we use memblock_reserved_mark_noinit() to only
> > > > > mark the tail pages ...
> > > > 
> > > > And even nastier thing is that when CONFIG_DEFERRED_STRUCT_PAGE_INIT is
> > > > disabled struct pages are initialized regardless of
> > > > memblock_reserved_mark_noinit().
> > > > 
> > > > I think this patch should go in before your updates:
> > > 
> > > Shouldn't we fix this in memblock code?
> > > 
> > > Hacking around that in the memblock_reserved_mark_noinit() user sound wrong
> > > -- and nothing in the doc of memblock_reserved_mark_noinit() spells that
> > > behavior out.
> > 
> > We can surely update the docs, but unfortunately I don't see how to avoid
> > hacking around it in hugetlb.
> > Since it's used to optimise HVO even further to the point hugetlb open
> > codes memmap initialization, I think it's fair that it should deal with all
> > possible configurations.
> 
> Remind me, why can't we support memblock_reserved_mark_noinit() when
> CONFIG_DEFERRED_STRUCT_PAGE_INIT is disabled?

When CONFIG_DEFERRED_STRUCT_PAGE_INIT is disabled we initialize the entire
memmap early (setup_arch()->free_area_init()), and we may have a bunch of
memblock_reserved_mark_noinit() afterwards
 
> -- 
> Cheers
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

