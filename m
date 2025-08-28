Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDF3CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 08:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDvtHRzQtU3kCixyIjuOCQ09hTrFj2+oewMln+u6hX4=; b=KXbcjmxTGBG8P7lG/enkWExlYY
	xuwgcWHzMsHV9AsYlL2PeaORGGmQpz1Rltcu8Mx0j0X00/iP2KlplOx/6NitZL41MzBzOhJUPueF3
	/mY5hHv+bt7uoAbcFnueqPOWetCD4g03aUNM99/xHH5xdO4nbdL5YByJXBeZJGk4JaSeX1fXukByQ
	Ppeas51NA/Pj62/CatTE3454DYkMsQiInIfisR+pOE37sEgvDNyx3JU/0HTwelfvjxFrXeVc1uWVN
	lYa0n+zNV/c9Cl1Gq286Dp1e3DvN5fmzHHcOmhH4aAApt8Ia45sT0tHaSk/RiO7GvJc2ClRUfGOBi
	f5/qKeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXwi-00000000moC-1UNN;
	Thu, 28 Aug 2025 08:25:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXeI-00000000iwO-2tvI;
	Thu, 28 Aug 2025 08:06:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62110417C0;
	Thu, 28 Aug 2025 08:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04174C4CEEB;
	Thu, 28 Aug 2025 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756368382;
	bh=8h3kXegWoTZB71c0/EOwOGHCDp9sWcsK0sA1Fhv8ieM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBGjtF+Gn0Ojo1KVedpXcUo5UNPKTP/e/wulKW1x/vz4AZ2m1wZ6thc/Lps+xlQF6
	 DwTPlbi9e+FvV8tPla4md0hJavNfKkFh5xzuaITPDW7oEVPRJuMnRQWVL0KaIZNEg4
	 4T8RWZ0Rh3tP7DQ1cUFf+tX54SzZArEKNTK8B97r3LwqCLB/OYDUdoSALNtM9+F5Dv
	 KS7BJVC9pXBz7unzWbhSWZxMJ+vW4HayoOqIpbx1GOFj1iYowGmGtL7JMjJ/av8GLW
	 NBVH9qH0fuKVNbHUV4tP2RMgGBJTXgbSoYrIDxxmnUwirlVFE2Z9r3rXRQTzilPCUm
	 zB6/THzmytDdA==
Date: Thu, 28 Aug 2025 11:06:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Alexander Potapenko <glider@google.com>,
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
Subject: Re: [PATCH v1 13/36] mm/hugetlb: cleanup
 hugetlb_folio_init_tail_vmemmap()
Message-ID: <aLAN7xS4WQsN6Hpm@kernel.org>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-14-david@redhat.com>
 <aLADXP89cp6hAq0q@kernel.org>
 <377449bd-3c06-4a09-8647-e41354e64b30@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <377449bd-3c06-4a09-8647-e41354e64b30@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010622_775032_C588C00E 
X-CRM114-Status: GOOD (  30.24  )
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

On Thu, Aug 28, 2025 at 09:44:27AM +0200, David Hildenbrand wrote:
> On 28.08.25 09:21, Mike Rapoport wrote:
> > On Thu, Aug 28, 2025 at 12:01:17AM +0200, David Hildenbrand wrote:
> > > We can now safely iterate over all pages in a folio, so no need for the
> > > pfn_to_page().
> > > 
> > > Also, as we already force the refcount in __init_single_page() to 1,
> > > we can just set the refcount to 0 and avoid page_ref_freeze() +
> > > VM_BUG_ON. Likely, in the future, we would just want to tell
> > > __init_single_page() to which value to initialize the refcount.
> > > 
> > > Further, adjust the comments to highlight that we are dealing with an
> > > open-coded prep_compound_page() variant, and add another comment explaining
> > > why we really need the __init_single_page() only on the tail pages.
> > > 
> > > Note that the current code was likely problematic, but we never ran into
> > > it: prep_compound_tail() would have been called with an offset that might
> > > exceed a memory section, and prep_compound_tail() would have simply
> > > added that offset to the page pointer -- which would not have done the
> > > right thing on sparsemem without vmemmap.
> > > 
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >   mm/hugetlb.c | 20 ++++++++++++--------
> > >   1 file changed, 12 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > index 4a97e4f14c0dc..1f42186a85ea4 100644
> > > --- a/mm/hugetlb.c
> > > +++ b/mm/hugetlb.c
> > > @@ -3237,17 +3237,18 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
> > >   {
> > >   	enum zone_type zone = zone_idx(folio_zone(folio));
> > >   	int nid = folio_nid(folio);
> > > +	struct page *page = folio_page(folio, start_page_number);
> > >   	unsigned long head_pfn = folio_pfn(folio);
> > >   	unsigned long pfn, end_pfn = head_pfn + end_page_number;
> > > -	int ret;
> > > -
> > > -	for (pfn = head_pfn + start_page_number; pfn < end_pfn; pfn++) {
> > > -		struct page *page = pfn_to_page(pfn);
> > > +	/*
> > > +	 * We mark all tail pages with memblock_reserved_mark_noinit(),
> > > +	 * so these pages are completely uninitialized.
> > 
> >                               ^ not? ;-)
> 
> Can you elaborate?

Oh, sorry, I misread "uninitialized".
Still, I'd phrase it as 

	/*
	 * We marked all tail pages with memblock_reserved_mark_noinit(),
	 * so we must initialize them here.
	 */

> -- 
> Cheers
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

