Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7978F327BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 07:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tf1/Nczyer/GJCIPDHmGkMVMbW3+J8WCh6h++SMiyOA=; b=k9xd1aetsGyFeZNycrsgPKo/Mz
	qV1VCzG57WtFDkb+diQ1EjjOtOItU4u54Xegj69zQcpt/qYMCjZiAe+oT7n+AauungEvGjsHGnOTu
	aVQQPLGDfYrVGzsm6zshSz3CAGSVsCKU9RhZsQCykB9cwY+GVFaYPUNXGURS7HGcFQh/o5RX9GJhZ
	bPLzcsrfSpLiRS0dJ7ou9/Q5Czc6YvqwyYf98u4tn2lQ6Khe/Ej4vFrLUCMVeVXPCSpVxtV0e2vh0
	0K2jChfJUK29Wsr/dTZMbpjUAcJf9DJ1yZEO19GsHd4Ih3QHg5BF2gBLldzHiiqHogPSw9xK6ZYqZ
	DwoZPBgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5p6-00000008CvP-2AMA;
	Tue, 21 Apr 2026 07:47:08 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5p3-00000008Cuv-1QbH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 07:47:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776757619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tf1/Nczyer/GJCIPDHmGkMVMbW3+J8WCh6h++SMiyOA=;
	b=qBtAk1+nNzp4Kl8q08RFuv48IsTFWM+xt/tlv/kUr3tpqfe5xYPcqNG/NSCwj3GwEDrPKS
	Tjr5tT3APq2SB/EiN7Ju/Bzjfsc+cB8DPKdlY5NB+DfHxzv1EkzgASI+y8IFrTqVl8uJdT
	d269iHpA5/QvNdycBlZjGdhfBEdJHB0=
From: Lance Yang <lance.yang@linux.dev>
To: david@kernel.org
Cc: catalin.marinas@arm.com,
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: fix initialization of tags of the huge zero folio with init_on_free
Date: Tue, 21 Apr 2026 15:46:30 +0800
Message-Id: <20260421074630.72451-1-lance.yang@linux.dev>
In-Reply-To: <20260420-zerotags-v1-1-3edc93e95bb4@kernel.org>
References: <20260420-zerotags-v1-1-3edc93e95bb4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_004706_009959_DA2217BC 
X-CRM114-Status: GOOD (  13.91  )
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


On Mon, Apr 20, 2026 at 11:16:46PM +0200, David Hildenbrand (Arm) wrote:
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
>As we are touching the interface either way, just clean it up by
>only calling it when HW tags are enabled, dropping the return value, and
>dropping the common code stub.
>
>Reproduced with the huge zero folio by modifying the check_buffer_fill
>arm64/mte selftest to use a 2 MiB area, after making sure that pages have
>a non-0 tag set when freeing (note that, during boot, we will not
>actually initialize tags, but only set KASAN_TAG_KERNEL in the page
>flags).

Good catch!

I can reproduce it reliably with this small debug change:

---8<---
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 970e077019b7..d5b6e2474f47 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -225,8 +225,7 @@ static bool get_huge_zero_folio(void)
        if (likely(atomic_inc_not_zero(&huge_zero_refcount)))
                return true;

-       zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
-                                ~__GFP_MOVABLE,
+       zero_folio = folio_alloc(GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS,
                        HPAGE_PMD_ORDER);
        if (!zero_folio) {
                count_vm_event(THP_ZERO_PAGE_ALLOC_FAILED);
---

That makes it much easier to hit. Userspace can seed tagged 2 MB folios,
but only as __GFP_MOVABLE.

The original huge zero folio allocation uses "& ~__GFP_MOVABLE", so it
will only reach these folios through fallback, which is hard to force
reliably from userspace :(

Will get back once testing is done :P

Cheers,
Lance

