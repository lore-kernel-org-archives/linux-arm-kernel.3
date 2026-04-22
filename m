Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7F2F94CA2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 02:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZQT0s2wUO2WZ6VaxUd4q0Cex0JTnd7JiwzgE6NWCYE=; b=fxrbE7Gud/kSJck8AiWcxezaCS
	ZDbaR5uYxbHIDjmc1Ini03A78Uy076i6bGP8ycjtIsKxvSpgTBCewKX7py1DzRQ8bFB0cdNC57di7
	+4GvpkSLatWdioxhRaOklCOP2GSVSFpFmlRlyTINqAYIZJW48jqBItM0dl+BetoKn/g0KjLixz9d4
	qYnCiKM2lY2xOsVAPkMkD+vShJQLuwJdr+HaTLAH2HGKTclhkqxmGfZH1kZiq3fn9Ww4nXgkHmhEU
	h0UePcTYG8Q/JYfw1CSrmlrx7RlYoVu8miXgOTqcMgPcT18aV6Ha0Gllx6ugZUx35uEY4tIkqUPTP
	lZgCwXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFNd6-00000009WIG-0GIA;
	Wed, 22 Apr 2026 02:47:57 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFNd1-00000009WGs-40fK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 02:47:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776826068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZQT0s2wUO2WZ6VaxUd4q0Cex0JTnd7JiwzgE6NWCYE=;
	b=cGZM44r49NJUlLAuQ8Aw4WQthcwoCIfYOTdFUY/tOEqlyLmYeIQaniKeQUZ40a4/uPKL23
	ZKmWPRhyBQ0+zHs2xqUsv61Pg9+2NPLCnnWS80pkxlYxtLKg1D7OSRkW9qy6+8zhbw9Pg9
	vOmcRT9UVY5pER/ELSwk++RheXdwOfk=
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	lance.yang@linux.dev,
	ryan.roberts@arm.com,
	broonie@kernel.org,
	dev.jain@arm.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/page_alloc: fix initialization of tags of the huge zero folio with init_on_free
Date: Wed, 22 Apr 2026 10:47:33 +0800
Message-Id: <20260422024733.70662-1-lance.yang@linux.dev>
In-Reply-To: <20260421-zerotags-v2-1-05cb1035482e@kernel.org>
References: <20260421-zerotags-v2-1-05cb1035482e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_194753_641143_371CD5CF 
X-CRM114-Status: GOOD (  12.86  )
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


On Tue, Apr 21, 2026 at 05:39:07PM +0200, David Hildenbrand (Arm) wrote:
>__GFP_ZEROTAGS semantics are currently a bit weird, but effectively this
>flag is only ever set alongside __GFP_ZERO and __GFP_SKIP_KASAN.
>
>If we run with init_on_free, we will zero out pages during
>__free_pages_prepare(), to skip zeroing on the allocation path.
>
>However, when allocating with __GFP_ZEROTAG set, post_alloc_hook() will
>consequently not only skip clearing page content, but also skip
>clearing tag memory.
>
>Not clearing tags through __GFP_ZEROTAGS is irrelevant for most pages that
>will get mapped to user space through set_pte_at() later: set_pte_at() and
>friends will detect that the tags have not been initialized yet
>(PG_mte_tagged not set), and initialize them.
>
>However, for the huge zero folio, which will be mapped through a PMD
>marked as special, this initialization will not be performed, ending up
>exposing whatever tags were still set for the pages.
>
>The docs (Documentation/arch/arm64/memory-tagging-extension.rst) state
>that allocation tags are set to 0 when a page is first mapped to user
>space. That no longer holds with the huge zero folio when init_on_free
>is enabled.
>
>Fix it by decoupling __GFP_ZEROTAGS from __GFP_ZERO, passing to
>tag_clear_highpages() whether we want to also clear page content.
>
>Invert the meaning of the tag_clear_highpages() return value to have
>clearer semantics.
>
>Reproduced with the huge zero folio by modifying the check_buffer_fill
>arm64/mte selftest to use a 2 MiB area, after making sure that pages have
>a non-0 tag set when freeing (note that, during boot, we will not
>actually initialize tags, but only set KASAN_TAG_KERNEL in the page
>flags).
>
>	$ ./check_buffer_fill
>	1..20
>	...
>	not ok 17 Check initial tags with private mapping, sync error mode and mmap memory
>	not ok 18 Check initial tags with private mapping, sync error mode and mmap/mprotect memory
>	...
>
>This code needs more cleanups; we'll tackle that next, like
>decoupling __GFP_ZEROTAGS from __GFP_SKIP_KASAN.
>
>Fixes: adfb6609c680 ("mm/huge_memory: initialise the tags of the huge zero folio")
>Cc: stable@vger.kernel.org
>Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>---

Tested this fix on MTE with both kasan=on and kasan=off. Works as
expected in both cases.

Nothing jumped out at me, LGTM!

Tested-by: Lance Yang <lance.yang@linux.dev>

