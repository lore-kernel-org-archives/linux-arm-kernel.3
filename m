Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41667F9B60D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 10:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBLRoguYPTJkYc4j73JHc0CKxdjDeJCctv0xDRPaXgU=; b=a+nyaDes+Naocxafeahje7mUwZ
	tQ/Kxf7z0gWDMtOB+sDdQXJR0ugLEratgCGqttZMsqt3V+T7os+seEB1AYYhlu1KiKzuXjbi4/B8+
	hOGq32UGV7F2y+cXYya+eQpsRb8+E3NL0jCeq+mz7UJfgDvC3+dB4WvkEWC1d7en+P1IJCJh3k1qk
	M7uhqD+kD4yfijPZLIZuRrCUr9RyqDgzyGewmxZbV6qG3iYFar5XdovdINQ8Qn5QEKERFvT3OuW0I
	p6+/bOUvVJ05ri/ZEohEsust0toXQqHmLIBxVacpL1w6u2YdgwBR+1YxS1Xhd6PHnMefw9zlOx+uE
	ZxmH14iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUse-00000009x63-17pq;
	Wed, 22 Apr 2026 10:32:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUsb-00000009x5Z-33Fw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 10:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7921540DA4;
	Wed, 22 Apr 2026 10:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19ABEC19425;
	Wed, 22 Apr 2026 10:32:20 +0000 (UTC)
Date: Wed, 22 Apr 2026 11:32:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Lance Yang <lance.yang@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Brown <broonie@kernel.org>, Dev Jain <dev.jain@arm.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/page_alloc: fix initialization of tags of the huge
 zero folio with init_on_free
Message-ID: <aeiivYFfC_EfGuFC@arm.com>
References: <20260421-zerotags-v2-1-05cb1035482e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-zerotags-v2-1-05cb1035482e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_033225_793329_4E93BA47 
X-CRM114-Status: GOOD (  23.09  )
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

On Tue, Apr 21, 2026 at 05:39:07PM +0200, David Hildenbrand wrote:
> __GFP_ZEROTAGS semantics are currently a bit weird, but effectively this
> flag is only ever set alongside __GFP_ZERO and __GFP_SKIP_KASAN.
> 
> If we run with init_on_free, we will zero out pages during
> __free_pages_prepare(), to skip zeroing on the allocation path.
> 
> However, when allocating with __GFP_ZEROTAG set, post_alloc_hook() will
> consequently not only skip clearing page content, but also skip
> clearing tag memory.
> 
> Not clearing tags through __GFP_ZEROTAGS is irrelevant for most pages that
> will get mapped to user space through set_pte_at() later: set_pte_at() and
> friends will detect that the tags have not been initialized yet
> (PG_mte_tagged not set), and initialize them.
> 
> However, for the huge zero folio, which will be mapped through a PMD
> marked as special, this initialization will not be performed, ending up
> exposing whatever tags were still set for the pages.
> 
> The docs (Documentation/arch/arm64/memory-tagging-extension.rst) state
> that allocation tags are set to 0 when a page is first mapped to user
> space. That no longer holds with the huge zero folio when init_on_free
> is enabled.
> 
> Fix it by decoupling __GFP_ZEROTAGS from __GFP_ZERO, passing to
> tag_clear_highpages() whether we want to also clear page content.
> 
> Invert the meaning of the tag_clear_highpages() return value to have
> clearer semantics.
> 
> Reproduced with the huge zero folio by modifying the check_buffer_fill
> arm64/mte selftest to use a 2 MiB area, after making sure that pages have
> a non-0 tag set when freeing (note that, during boot, we will not
> actually initialize tags, but only set KASAN_TAG_KERNEL in the page
> flags).
> 
> 	$ ./check_buffer_fill
> 	1..20
> 	...
> 	not ok 17 Check initial tags with private mapping, sync error mode and mmap memory
> 	not ok 18 Check initial tags with private mapping, sync error mode and mmap/mprotect memory
> 	...
> 
> This code needs more cleanups; we'll tackle that next, like
> decoupling __GFP_ZEROTAGS from __GFP_SKIP_KASAN.
> 
> Fixes: adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero folio")
> Cc: stable@vger.kernel.org
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

The logic looks fine to me. Thanks!

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

