Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAD0CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCAeTeEvIUB7QGUD1yNdtHVyxv+RYozjlDTLNDKvTQA=; b=BCF3EMblM8eS/Ki7Mfc3783IK3
	Rli5AMR9SLFtet8AWmLRWA/hNbN0dtKIc6frQPsPZfd3vYDBWh57+YHykb539E1iZJgCifjVIkdJ1
	UGlBeDT7Fwbz9CyWU+XUXQhESM+AMr1tw+PjEAXbW8OGNiFebAg5IDk5ONdyz0iIUknJqKF4IleDV
	S6sJ0L9yEhyW7TGC1LcUjoivSk8qe95OaqcGG9u9v1PVBOFksdLFGub3eq4Hz86UkVpJpndb3kV6R
	luvr/PVAvnEkaQB3MBsooVDerntiVcJRQBClCT8S9u9GvvfTAQoQfMB/uEcy4Kb/HzMMazHtgSYXf
	efDKA0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11ZC-0000000DFFE-2xNP;
	Tue, 23 Sep 2025 11:52:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11ZA-0000000DFEZ-2w4T;
	Tue, 23 Sep 2025 11:52:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D922043D39;
	Tue, 23 Sep 2025 11:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2910BC4CEF5;
	Tue, 23 Sep 2025 11:52:09 +0000 (UTC)
Date: Tue, 23 Sep 2025 12:52:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org,
	lorenzo.stoakes@oracle.com, usamaarif642@gmail.com,
	yuzhao@google.com, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
	baohua@kernel.org, voidice@gmail.com, Liam.Howlett@oracle.com,
	cerasuolodomenico@gmail.com, hannes@cmpxchg.org,
	kaleshsingh@google.com, npache@redhat.com, riel@surriel.com,
	roman.gushchin@linux.dev, rppt@kernel.org, ryan.roberts@arm.com,
	dev.jain@arm.com, ryncsn@gmail.com, shakeel.butt@linux.dev,
	surenb@google.com, hughd@google.com, willy@infradead.org,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, qun-wei.lin@mediatek.com,
	Andrew.Yang@mediatek.com, casper.li@mediatek.com,
	chinwen.chang@mediatek.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org, ioworker0@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Message-ID: <aNKJ5glToE4hMhWA@arm.com>
References: <20250922021458.68123-1-lance.yang@linux.dev>
 <aNGGUXLCn_bWlne5@arm.com>
 <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3412715-6d9d-4809-9588-ba08da450d16@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_045216_804660_2A0FD06A 
X-CRM114-Status: GOOD (  37.51  )
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

On Mon, Sep 22, 2025 at 07:59:00PM +0200, David Hildenbrand wrote:
> On 22.09.25 19:24, Catalin Marinas wrote:
> > On Mon, Sep 22, 2025 at 10:14:58AM +0800, Lance Yang wrote:
> > > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > > index 32e0ec2dde36..28d4b02a1aa5 100644
> > > --- a/mm/huge_memory.c
> > > +++ b/mm/huge_memory.c
> > > @@ -4104,29 +4104,20 @@ static unsigned long deferred_split_count(struct shrinker *shrink,
> > >   static bool thp_underused(struct folio *folio)
> > >   {
> > >   	int num_zero_pages = 0, num_filled_pages = 0;
> > > -	void *kaddr;
> > >   	int i;
> > >   	for (i = 0; i < folio_nr_pages(folio); i++) {
> > > -		kaddr = kmap_local_folio(folio, i * PAGE_SIZE);
> > > -		if (!memchr_inv(kaddr, 0, PAGE_SIZE)) {
> > > -			num_zero_pages++;
> > > -			if (num_zero_pages > khugepaged_max_ptes_none) {
> > > -				kunmap_local(kaddr);
> > > +		if (pages_identical(folio_page(folio, i), ZERO_PAGE(0))) {
> > > +			if (++num_zero_pages > khugepaged_max_ptes_none)
> > >   				return true;
> > 
> > I wonder what the overhead of doing a memcmp() vs memchr_inv() is. The
> > former will need to read from two places. If it's noticeable, it would
> > affect architectures that don't have an MTE equivalent.
> > 
> > Alternatively we could introduce something like folio_has_metadata()
> > which on arm64 simply checks PG_mte_tagged.
> 
> We discussed something similar in the other thread (I suggested
> page_is_mergable()). I'd prefer to use pages_identical() for now, so we have
> the same logic here and in ksm code.
> 
> (this patch here almost looks like a cleanup :) )
> 
> If this becomes a problem, what we could do is in pages_identical() would be
> simply doing the memchr_inv() in case is_zero_pfn(). KSM might benefit from
> that as well when merging with the shared zeropage through
> try_to_merge_with_zero_page().

Yes, we can always optimise it later.

I just realised that on arm64 with MTE we won't get any merging with the
zero page even if the user page isn't mapped with PROT_MTE. In
cpu_enable_mte() we zero the tags in the zero page and set
PG_mte_tagged. The reason is that we want to use the zero page with
PROT_MTE mappings (until tag setting causes CoW). Hmm, the arm64
memcmp_pages() messed up KSM merging with the zero page even before this
patch.

The MTE tag setting evolved a bit over time with some locking using PG_*
flags to avoid a set_pte_at() race trying to initialise the tags on the
same page. We also moved the swap restoring to arch_swap_restore()
rather than the set_pte_at() path. So it is safe now to merge with the
zero page if the other page isn't tagged. A subsequent set_pte_at()
attempting to clear the tags would notice that the zero page is already
tagged.

We could go a step further and add tag comparison (I had some code
around) but I think the quick fix is to just not treat the zero page as
tagged. Not fully tested yet:

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index e5e773844889..72a1dfc54659 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -73,6 +73,8 @@ int memcmp_pages(struct page *page1, struct page *page2)
 {
 	char *addr1, *addr2;
 	int ret;
+	bool page1_tagged = page_mte_tagged(page1) && !is_zero_page(page1);
+	bool page2_tagged = page_mte_tagged(page2) && !is_zero_page(page2);
 
 	addr1 = page_address(page1);
 	addr2 = page_address(page2);
@@ -83,11 +85,10 @@ int memcmp_pages(struct page *page1, struct page *page2)
 
 	/*
 	 * If the page content is identical but at least one of the pages is
-	 * tagged, return non-zero to avoid KSM merging. If only one of the
-	 * pages is tagged, __set_ptes() may zero or change the tags of the
-	 * other page via mte_sync_tags().
+	 * tagged, return non-zero to avoid KSM merging. Ignore the zero page
+	 * since it is always tagged with the tags cleared.
 	 */
-	if (page_mte_tagged(page1) || page_mte_tagged(page2))
+	if (page1_tagged || page2_tagged)
 		return addr1 != addr2;
 
 	return ret;

-- 
Catalin

