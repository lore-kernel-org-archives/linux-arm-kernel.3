Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4AEED1038E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijJKkFWyjCKwFwEsIZQyLMMatLUb7KQsYGHescYbZMw=; b=FZ90RBLf9i4ZJPfb+DJ6oL+xxE
	eCQcDx4S9B+de1YLMqY40Ju6XLqIJPCHHzfPVXOHwLeyQHoycTvgCgK6iXmVlSP3RvTjV/2koCP+p
	bpFtpQZqWbtRPpEqDf7G14xVTOR4mAiSArf8tnyRyEKtEaabSktgLTScOllkjr1XQHqhn+gIv4jbG
	ebEsqJkyqbOD5GBq6XrAk8Iwbb0e+jEnVQ2WMohTnyvApENAA1PoXMm+FOcNsHCU4PTDddn7oagjI
	pQyrFLP6BB/bQCkhJH6e0aibB9w9pItJvA7ww+NhknCMGIN0HDp7TD/83TbHw8/7og99L8+sre5iz
	lEu2nRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t496G-00000002BtE-3xvp;
	Fri, 25 Oct 2024 01:26:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48yl-000000029og-49Yu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 01:19:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51759A42AFB;
	Fri, 25 Oct 2024 01:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C460BC4CEC7;
	Fri, 25 Oct 2024 01:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729819142;
	bh=2WUpQv5xSA9L8ZAC0Pr5lb+6yWaR3j3uJ/oUJRsB1Ag=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h9Y3BuEI4nVw2E1L41bOtoCSSTfgH4eThsND/kUt5A53DGtmVSQx90e6fn6GWwt5s
	 k16QNWI9fV/+Q/0n5QZl9cXCAOsFVIkelUmwWS8JmZWRNWgmhnSpBNvry5jGYjqCL+
	 kJp11khPimcEpfZUxjly/gy/UnS87UAeFC6b4N6MpR4dXAKpCPNbzvrKcftZvdRijf
	 cD4wMEkVslnWLWxj4CXx9BDuG7dBTdkvWtEjtqraeC7HpliUrwoCkqdsWAdxUbgdrp
	 gJ/lqIKoeSXV0mnoIsma+YwNrNu6cG8g5HKKaf9e4bOBvB6F6j2KR1WnUHfEpQZtQ1
	 Z0D3+QUL7elTA==
Date: Thu, 24 Oct 2024 18:18:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ryan Roberts <ryan.roberts@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Anshuman Khandual <anshuman.khandual@arm.com>, 
    Ard Biesheuvel <ardb@kernel.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    David Hildenbrand <david@redhat.com>, 
    Greg Marsden <greg.marsden@oracle.com>, Ivan Ivanov <ivan.ivanov@suse.com>, 
    Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>, 
    Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>, 
    Juergen Gross <jgross@suse.com>, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
    xen-devel@lists.xenproject.org, julien@xen.org
Subject: Re: [RFC PATCH v1 36/57] xen: Remove PAGE_SIZE compile-time constant
 assumption
In-Reply-To: <3027c366-2cb0-4984-8ee7-aae92fb51512@arm.com>
Message-ID: <alpine.DEB.2.22.394.2410241810320.2264989@ubuntu-linux-20-04-desktop>
References: <20241014105514.3206191-1-ryan.roberts@arm.com> <20241014105912.3207374-1-ryan.roberts@arm.com> <20241014105912.3207374-36-ryan.roberts@arm.com> <829b5662-13c0-4728-894c-b2d578681b11@arm.com> <alpine.DEB.2.22.394.2410221808160.3833@ubuntu-linux-20-04-desktop>
 <3027c366-2cb0-4984-8ee7-aae92fb51512@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_181904_190429_6145F216 
X-CRM114-Status: GOOD (  43.08  )
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

On Thu, 24 Oct 2024, Ryan Roberts wrote:
> On 23/10/2024 02:23, Stefano Stabellini wrote:
> > +Julien
> > 
> > On Wed, 16 Oct 2024, Ryan Roberts wrote:
> >> + Juergen Gross, Stefano Stabellini
> >>
> >> This was a rather tricky series to get the recipients correct for and my script
> >> did not realize that "supporter" was a pseudonym for "maintainer" so you were
> >> missed off the original post. Appologies!
> >>
> >> More context in cover letter:
> >> https://lore.kernel.org/all/20241014105514.3206191-1-ryan.roberts@arm.com/
> >>
> >>
> >> On 14/10/2024 11:58, Ryan Roberts wrote:
> >>> To prepare for supporting boot-time page size selection, refactor code
> >>> to remove assumptions about PAGE_SIZE being compile-time constant. Code
> >>> intended to be equivalent when compile-time page size is active.
> >>>
> >>> Allocate enough "frame_list" static storage in the balloon driver for
> >>> the maximum supported page size. Although continue to use only the first
> >>> PAGE_SIZE of the buffer at run-time to maintain existing behaviour.
> >>>
> >>> Refactor xen_biovec_phys_mergeable() to convert ifdeffery to c if/else.
> >>> For compile-time page size, the compiler will choose one branch and
> >>> strip the dead one. For boot-time, it can be evaluated at run time.
> >>>
> >>> Refactor a BUILD_BUG_ON to evaluate the limit (when the minimum
> >>> supported page size is selected at boot-time).
> >>>
> >>> Reserve enough storage for max page size in "struct remap_data" and
> >>> "struct xenbus_map_node".
> >>>
> >>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >>> ---
> >>>
> >>> ***NOTE***
> >>> Any confused maintainers may want to read the cover note here for context:
> >>> https://lore.kernel.org/all/20241014105514.3206191-1-ryan.roberts@arm.com/
> >>>
> >>>  drivers/xen/balloon.c              | 11 ++++++-----
> >>>  drivers/xen/biomerge.c             | 12 ++++++------
> >>>  drivers/xen/privcmd.c              |  2 +-
> >>>  drivers/xen/xenbus/xenbus_client.c |  5 +++--
> >>>  drivers/xen/xlate_mmu.c            |  6 +++---
> >>>  include/xen/page.h                 |  2 ++
> >>>  6 files changed, 21 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> >>> index 528395133b4f8..0ed5f6453af0e 100644
> >>> --- a/drivers/xen/balloon.c
> >>> +++ b/drivers/xen/balloon.c
> >>> @@ -131,7 +131,8 @@ struct balloon_stats balloon_stats;
> >>>  EXPORT_SYMBOL_GPL(balloon_stats);
> >>>  
> >>>  /* We increase/decrease in batches which fit in a page */
> >>> -static xen_pfn_t frame_list[PAGE_SIZE / sizeof(xen_pfn_t)];
> >>> +static xen_pfn_t frame_list[PAGE_SIZE_MAX / sizeof(xen_pfn_t)];
> >>> +#define FRAME_LIST_NR_ENTRIES (PAGE_SIZE / sizeof(xen_pfn_t))
> >>>  
> >>>  
> >>>  /* List of ballooned pages, threaded through the mem_map array. */
> >>> @@ -389,8 +390,8 @@ static enum bp_state increase_reservation(unsigned long nr_pages)
> >>>  	unsigned long i;
> >>>  	struct page   *page;
> >>>  
> >>> -	if (nr_pages > ARRAY_SIZE(frame_list))
> >>> -		nr_pages = ARRAY_SIZE(frame_list);
> >>> +	if (nr_pages > FRAME_LIST_NR_ENTRIES)
> >>> +		nr_pages = FRAME_LIST_NR_ENTRIES;
> >>>  
> >>>  	page = list_first_entry_or_null(&ballooned_pages, struct page, lru);
> >>>  	for (i = 0; i < nr_pages; i++) {
> >>> @@ -434,8 +435,8 @@ static enum bp_state decrease_reservation(unsigned long nr_pages, gfp_t gfp)
> >>>  	int ret;
> >>>  	LIST_HEAD(pages);
> >>>  
> >>> -	if (nr_pages > ARRAY_SIZE(frame_list))
> >>> -		nr_pages = ARRAY_SIZE(frame_list);
> >>> +	if (nr_pages > FRAME_LIST_NR_ENTRIES)
> >>> +		nr_pages = FRAME_LIST_NR_ENTRIES;
> >>>  
> >>>  	for (i = 0; i < nr_pages; i++) {
> >>>  		page = alloc_page(gfp);
> >>> diff --git a/drivers/xen/biomerge.c b/drivers/xen/biomerge.c
> >>> index 05a286d24f148..28f0887e40026 100644
> >>> --- a/drivers/xen/biomerge.c
> >>> +++ b/drivers/xen/biomerge.c
> >>> @@ -8,16 +8,16 @@
> >>>  bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
> >>>  			       const struct page *page)
> >>>  {
> >>> -#if XEN_PAGE_SIZE == PAGE_SIZE
> >>> -	unsigned long bfn1 = pfn_to_bfn(page_to_pfn(vec1->bv_page));
> >>> -	unsigned long bfn2 = pfn_to_bfn(page_to_pfn(page));
> >>> +	if (XEN_PAGE_SIZE == PAGE_SIZE) {
> >>> +		unsigned long bfn1 = pfn_to_bfn(page_to_pfn(vec1->bv_page));
> >>> +		unsigned long bfn2 = pfn_to_bfn(page_to_pfn(page));
> >>> +
> >>> +		return bfn1 + PFN_DOWN(vec1->bv_offset + vec1->bv_len) == bfn2;
> >>> +	}
> >>>  
> >>> -	return bfn1 + PFN_DOWN(vec1->bv_offset + vec1->bv_len) == bfn2;
> >>> -#else
> >>>  	/*
> >>>  	 * XXX: Add support for merging bio_vec when using different page
> >>>  	 * size in Xen and Linux.
> >>>  	 */
> >>>  	return false;
> >>> -#endif
> >>>  }
> >>> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> >>> index 9563650dfbafc..847f7b806caf7 100644
> >>> --- a/drivers/xen/privcmd.c
> >>> +++ b/drivers/xen/privcmd.c
> >>> @@ -557,7 +557,7 @@ static long privcmd_ioctl_mmap_batch(
> >>>  	state.global_error  = 0;
> >>>  	state.version       = version;
> >>>  
> >>> -	BUILD_BUG_ON(((PAGE_SIZE / sizeof(xen_pfn_t)) % XEN_PFN_PER_PAGE) != 0);
> >>> +	BUILD_BUG_ON(((PAGE_SIZE_MIN / sizeof(xen_pfn_t)) % XEN_PFN_PER_PAGE_MAX) != 0);
> > 
> > Is there any value in keep this test? And if so, what should it look
> > like? I think we should turn it into a WARN_ON:
> > 
> > WARN_ON(((PAGE_SIZE / sizeof(xen_pfn_t)) % XEN_PFN_PER_PAGE) != 0);
> > 
> > It doesn't make much sense having a BUILD_BUG_ON on a variable that can
> > change?
> 
> I believe that as long as we assume sizeof(xen_pfn_t), PAGE_SIZE and
> XEN_PAGE_SIZE are all power-of-two sizes, then this single build-time test
> should cover all possible boot-time PAGE_SIZEs.
> 
> Logic:
> 
> If PAGE_SIZE and XEN_PAGE_SIZE are power-of-two, then XEN_PFN_PER_PAGE must also
> be power-of-two. XEN_PFN_PER_PAGE_MAX is just the worst case limit.
> 
> (PAGE_SIZE_MIN / sizeof(xen_pfn_t)) is the number of xen_pfn_t that fit on
> smallest page.
> 
> If you can get an integer multiple number of XEN_PFN_PER_PAGE_MAX on the
> smallest page, then it remains an integer multiple as PAGE_SIZE gets bigger,
> assuming it is restricted to power-of-two sizes.
> 
> Perhaps there is a floor in my logic?
> 
> I'd prefer to keep BUILD_BUG_ON where possible to avoid the additional image
> size bloat and runtime costs.

You are right. It would be nice to add a in-code comment to explain
this.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> >>>  	/* mmap_batch_fn guarantees ret == 0 */
> >>>  	BUG_ON(traverse_pages_block(m.num, sizeof(xen_pfn_t),
> >>>  				    &pagelist, mmap_batch_fn, &state));
> >>> diff --git a/drivers/xen/xenbus/xenbus_client.c b/drivers/xen/xenbus/xenbus_client.c
> >>> index 51b3124b0d56c..99bde836c10c4 100644
> >>> --- a/drivers/xen/xenbus/xenbus_client.c
> >>> +++ b/drivers/xen/xenbus/xenbus_client.c
> >>> @@ -49,9 +49,10 @@
> >>>  
> >>>  #include "xenbus.h"
> >>>  
> >>> -#define XENBUS_PAGES(_grants)	(DIV_ROUND_UP(_grants, XEN_PFN_PER_PAGE))
> >>> +#define XENBUS_PAGES(_grants)		(DIV_ROUND_UP(_grants, XEN_PFN_PER_PAGE))
> >>> +#define XENBUS_PAGES_MAX(_grants)	(DIV_ROUND_UP(_grants, XEN_PFN_PER_PAGE_MIN))
> >>>  
> >>> -#define XENBUS_MAX_RING_PAGES	(XENBUS_PAGES(XENBUS_MAX_RING_GRANTS))
> >>> +#define XENBUS_MAX_RING_PAGES		(XENBUS_PAGES_MAX(XENBUS_MAX_RING_GRANTS))
> >>>  
> >>>  struct xenbus_map_node {
> >>>  	struct list_head next;
> >>> diff --git a/drivers/xen/xlate_mmu.c b/drivers/xen/xlate_mmu.c
> >>> index f17c4c03db30c..a757c801a7542 100644
> >>> --- a/drivers/xen/xlate_mmu.c
> >>> +++ b/drivers/xen/xlate_mmu.c
> >>> @@ -74,9 +74,9 @@ struct remap_data {
> >>>  	int mapped;
> >>>  
> >>>  	/* Hypercall parameters */
> >>> -	int h_errs[XEN_PFN_PER_PAGE];
> >>> -	xen_ulong_t h_idxs[XEN_PFN_PER_PAGE];
> >>> -	xen_pfn_t h_gpfns[XEN_PFN_PER_PAGE];
> >>> +	int h_errs[XEN_PFN_PER_PAGE_MAX];
> >>> +	xen_ulong_t h_idxs[XEN_PFN_PER_PAGE_MAX];
> >>> +	xen_pfn_t h_gpfns[XEN_PFN_PER_PAGE_MAX];
> >>>  
> >>>  	int h_iter;	/* Iterator */
> >>>  };
> >>> diff --git a/include/xen/page.h b/include/xen/page.h
> >>> index 285677b42943a..86683a30038a3 100644
> >>> --- a/include/xen/page.h
> >>> +++ b/include/xen/page.h
> >>> @@ -21,6 +21,8 @@
> >>>  	((page_to_pfn(page)) << (PAGE_SHIFT - XEN_PAGE_SHIFT))
> >>>  
> >>>  #define XEN_PFN_PER_PAGE	(PAGE_SIZE / XEN_PAGE_SIZE)
> >>> +#define XEN_PFN_PER_PAGE_MIN	(PAGE_SIZE_MIN / XEN_PAGE_SIZE)
> >>> +#define XEN_PFN_PER_PAGE_MAX	(PAGE_SIZE_MAX / XEN_PAGE_SIZE)
> >>>  
> >>>  #define XEN_PFN_DOWN(x)	((x) >> XEN_PAGE_SHIFT)
> >>>  #define XEN_PFN_UP(x)	(((x) + XEN_PAGE_SIZE-1) >> XEN_PAGE_SHIFT)
> >>
> 

