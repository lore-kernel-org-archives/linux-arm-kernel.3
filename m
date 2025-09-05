Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F2ACA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZoercRzV+9gES767UN4t02R1PKB+nn+QIHkF8YGS5E=; b=VtOYcwaN/kMGuSIkCmd7XhXMXy
	1nLsHMTe0Ll0l+4dijNYxAntI3mvFSTQOS+DlxHzqKxLjTwOOBsAN+32Jubvnj4ZjPFLKJyaN3U/m
	YVS+pn2GxUAR/9CPbHISiUEiyTkcYPu8YpH7GkmvtxOjvaWaan083f/FZ3gqDWDMhf+/mkhNqmgZU
	gPQuEyl68f3BRSG3ezZ1NL32MSsRTvLDEZgt7C7VpZhRbQG6VhZxfzJF5FwUR8CnICkTpgUUEzT19
	OzGKkUlWTFOoL/Q9RcBvCUVJFqEmgMcOmbASNyAprAOvW85Msi6CVACHyf9cI1HtfG0ay8evsLQPw
	QPVEkZWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugZO-00000005YQ1-0lMn;
	Sat, 06 Sep 2025 00:14:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uufQo-000000059wT-2m00;
	Fri, 05 Sep 2025 23:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBCC2601AA;
	Fri,  5 Sep 2025 23:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CEDC4CEF1;
	Fri,  5 Sep 2025 23:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757113280;
	bh=+lhopyxIHPkimkHLqjBagKsowbxPduHdhl1alB5XIHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FKhh4N0YC7rktiPdXEfXclWanEDKYne9TN6cdcuCjqPCtcq4Rn0r96yLuECJbiw+4
	 LjwCnjQtLBAm0edveUnCZZYiNonj/7aqKLJr2wGtnUHH+scBK/7r7JUigttXLAScDm
	 pXeFnpIPvL1/rZKX9LdznwwDYBYkDL4/X0Q74Dlpx/NmySnEYO46ImCPWzvWXVlUfn
	 7nKQ1fERSefzbF0N9pUOtT2Ew99OpHStRZ+01KHKpecJw2kFIukduhp+K3hQulq8o0
	 47VhyxuU+d72ralUlgkhIgcgxiZyD9aQX9YFUuu3Ep7hq8BTDKfbNp6DFssdME8qWg
	 uTEId8/MJZDQg==
Date: Fri, 5 Sep 2025 16:00:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
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
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 19/37] mm/gup: remove record_subpages()
Message-ID: <20250905230006.GA1776@sol>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-20-david@redhat.com>
 <5090355d-546a-4d06-99e1-064354d156b5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5090355d-546a-4d06-99e1-064354d156b5@redhat.com>
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

On Fri, Sep 05, 2025 at 08:41:23AM +0200, David Hildenbrand wrote:
> On 01.09.25 17:03, David Hildenbrand wrote:
> > We can just cleanup the code by calculating the #refs earlier,
> > so we can just inline what remains of record_subpages().
> > 
> > Calculate the number of references/pages ahead of times, and record them
> > only once all our tests passed.
> > 
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
> >   mm/gup.c | 25 ++++++++-----------------
> >   1 file changed, 8 insertions(+), 17 deletions(-)
> > 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index c10cd969c1a3b..f0f4d1a68e094 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -484,19 +484,6 @@ static inline void mm_set_has_pinned_flag(struct mm_struct *mm)
> >   #ifdef CONFIG_MMU
> >   #ifdef CONFIG_HAVE_GUP_FAST
> > -static int record_subpages(struct page *page, unsigned long sz,
> > -			   unsigned long addr, unsigned long end,
> > -			   struct page **pages)
> > -{
> > -	int nr;
> > -
> > -	page += (addr & (sz - 1)) >> PAGE_SHIFT;
> > -	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
> > -		pages[nr] = page++;
> > -
> > -	return nr;
> > -}
> > -
> >   /**
> >    * try_grab_folio_fast() - Attempt to get or pin a folio in fast path.
> >    * @page:  pointer to page to be grabbed
> > @@ -2967,8 +2954,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
> >   	if (pmd_special(orig))
> >   		return 0;
> > -	page = pmd_page(orig);
> > -	refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
> > +	refs = (end - addr) >> PAGE_SHIFT;
> > +	page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> >   	folio = try_grab_folio_fast(page, refs, flags);
> >   	if (!folio)
> > @@ -2989,6 +2976,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
> >   	}
> >   	*nr += refs;
> > +	for (; refs; refs--)
> > +		*(pages++) = page++;
> >   	folio_set_referenced(folio);
> >   	return 1;
> >   }
> > @@ -3007,8 +2996,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
> >   	if (pud_special(orig))
> >   		return 0;
> > -	page = pud_page(orig);
> > -	refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
> > +	refs = (end - addr) >> PAGE_SHIFT;
> > +	page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> >   	folio = try_grab_folio_fast(page, refs, flags);
> >   	if (!folio)
> > @@ -3030,6 +3019,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
> >   	}
> >   	*nr += refs;
> > +	for (; refs; refs--)
> > +		*(pages++) = page++;
> >   	folio_set_referenced(folio);
> >   	return 1;
> >   }
> 
> Okay, this code is nasty. We should rework this code to just return the nr and receive a the proper
> pages pointer, getting rid of the "*nr" parameter.
> 
> For the time being, the following should do the trick:
> 
> commit bfd07c995814354f6b66c5b6a72e96a7aa9fb73b (HEAD -> nth_page)
> Author: David Hildenbrand <david@redhat.com>
> Date:   Fri Sep 5 08:38:43 2025 +0200
> 
>     fixup: mm/gup: remove record_subpages()
>     pages is not adjusted by the caller, but idnexed by existing *nr.
>     Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 010fe56f6e132..22420f2069ee1 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2981,6 +2981,7 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>                 return 0;
>         }
> +       pages += *nr;
>         *nr += refs;
>         for (; refs; refs--)
>                 *(pages++) = page++;
> @@ -3024,6 +3025,7 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>                 return 0;
>         }
> +       pages += *nr;
>         *nr += refs;
>         for (; refs; refs--)
>                 *(pages++) = page++;

Can this get folded in soon?  This bug is causing crashes in AF_ALG too.

Thanks,

- Eric

