Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBAFCA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjlkSDWeLfgzt2hJTSF/yA75QuafGIPlx3UP9Kck4kU=; b=ehpfI9LoWXQegey+eR0OXROwnb
	oXNseYwKb3zgF1FWms7i9cUP2USzc8OSez/8Hx4FKGzSwIOP+kaYufEnF6UqoUgIbbvJa4pVhpGaW
	TSSiWSj85xjlGjqWqlcofIcn1tdLwEsGpOOQ707bzIUQ5x5x6xveSzk34ji6gwMG/e1ik78T+7CQ3
	uaBHSiv6Mv0NyfwNvVx3Yo9gp/nsx6V6ZBapvsqYOs/Y3w1DJ+lTOAZ9itDF1gozCyr4CFrPwku+6
	2d0rnOfNgSDHbbM7XzIjDhDrX3yFfv891qjjTpH/9Ui/vDNGtQdHer+V3A+TgKPBqV/GbZ4ibuuZH
	KRU3eiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kHO-0000000B6l6-1Lpu;
	Mon, 22 Sep 2025 17:24:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0kHM-0000000B6kr-0u0H;
	Mon, 22 Sep 2025 17:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52522601AA;
	Mon, 22 Sep 2025 17:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AACC4CEF0;
	Mon, 22 Sep 2025 17:24:36 +0000 (UTC)
Date: Mon, 22 Sep 2025 18:24:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com,
	usamaarif642@gmail.com, yuzhao@google.com, ziy@nvidia.com,
	baolin.wang@linux.alibaba.com, baohua@kernel.org, voidice@gmail.com,
	Liam.Howlett@oracle.com, cerasuolodomenico@gmail.com,
	hannes@cmpxchg.org, kaleshsingh@google.com, npache@redhat.com,
	riel@surriel.com, roman.gushchin@linux.dev, rppt@kernel.org,
	ryan.roberts@arm.com, dev.jain@arm.com, ryncsn@gmail.com,
	shakeel.butt@linux.dev, surenb@google.com, hughd@google.com,
	willy@infradead.org, matthew.brost@intel.com,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
	gourry@gourry.net, ying.huang@linux.alibaba.com, apopple@nvidia.com,
	qun-wei.lin@mediatek.com, Andrew.Yang@mediatek.com,
	casper.li@mediatek.com, chinwen.chang@mediatek.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org,
	ioworker0@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing
 zero-filled subpages
Message-ID: <aNGGUXLCn_bWlne5@arm.com>
References: <20250922021458.68123-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922021458.68123-1-lance.yang@linux.dev>
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

On Mon, Sep 22, 2025 at 10:14:58AM +0800, Lance Yang wrote:
> From: Lance Yang <lance.yang@linux.dev>
> 
> When both THP and MTE are enabled, splitting a THP and replacing its
> zero-filled subpages with the shared zeropage can cause MTE tag mismatch
> faults in userspace.
> 
> Remapping zero-filled subpages to the shared zeropage is unsafe, as the
> zeropage has a fixed tag of zero, which may not match the tag expected by
> the userspace pointer.
> 
> KSM already avoids this problem by using memcmp_pages(), which on arm64
> intentionally reports MTE-tagged pages as non-identical to prevent unsafe
> merging.
> 
> As suggested by David[1], this patch adopts the same pattern, replacing the
> memchr_inv() byte-level check with a call to pages_identical(). This
> leverages existing architecture-specific logic to determine if a page is
> truly identical to the shared zeropage.
> 
> Having both the THP shrinker and KSM rely on pages_identical() makes the
> design more future-proof, IMO. Instead of handling quirks in generic code,
> we just let the architecture decide what makes two pages identical.
> 
> [1] https://lore.kernel.org/all/ca2106a3-4bb2-4457-81af-301fd99fbef4@redhat.com
> 
> Cc: <stable@vger.kernel.org>
> Reported-by: Qun-wei Lin <Qun-wei.Lin@mediatek.com>
> Closes: https://lore.kernel.org/all/a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com
> Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

Functionally, the patch looks fine, both with and without MTE.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 32e0ec2dde36..28d4b02a1aa5 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -4104,29 +4104,20 @@ static unsigned long deferred_split_count(struct shrinker *shrink,
>  static bool thp_underused(struct folio *folio)
>  {
>  	int num_zero_pages = 0, num_filled_pages = 0;
> -	void *kaddr;
>  	int i;
>  
>  	for (i = 0; i < folio_nr_pages(folio); i++) {
> -		kaddr = kmap_local_folio(folio, i * PAGE_SIZE);
> -		if (!memchr_inv(kaddr, 0, PAGE_SIZE)) {
> -			num_zero_pages++;
> -			if (num_zero_pages > khugepaged_max_ptes_none) {
> -				kunmap_local(kaddr);
> +		if (pages_identical(folio_page(folio, i), ZERO_PAGE(0))) {
> +			if (++num_zero_pages > khugepaged_max_ptes_none)
>  				return true;

I wonder what the overhead of doing a memcmp() vs memchr_inv() is. The
former will need to read from two places. If it's noticeable, it would
affect architectures that don't have an MTE equivalent.

Alternatively we could introduce something like folio_has_metadata()
which on arm64 simply checks PG_mte_tagged.

-- 
Catalin

