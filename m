Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3143CDC19E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnaTrYgO4HShbHNfxp0Gz+GzpJfxlGJKnBUzxWHLg+w=; b=upc15dReIoeYaHVddhuNA25sPe
	E2cb35pdysElACYKXX1fZ4LxPki3Id5mdgTA1/LpOrhWnpvC1qfCWEf/7adEydUpR5WdYSPet0pEt
	HQN8FSU51DK08NpXKUU8eXFzjx5aMO+MgMUbc2Et6L2dVOlXVGtQajKAXvfY8E3pL/Td1Eq7mxUa6
	nmMXEMRwNDjo9a+oTH4uKN7UPROE3UqgOlXa7tGBhZP4C3G9RSS26y7s9Lkr5P/T22MlSSry5kpiC
	WngyBeMp5iUwWpXvQSe8Fto62OWZAVW4a4U4U4F5g1kbHGpAqZVbu0sKfQ1bilW2TQXJ1ru8EO0/E
	t6qTjzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd70j-0000000D5H9-2vzv;
	Tue, 06 Jan 2026 13:22:09 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd70h-0000000D5GV-1qUH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 13:22:08 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-64b560e425eso1283315a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767705725; x=1768310525; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnaTrYgO4HShbHNfxp0Gz+GzpJfxlGJKnBUzxWHLg+w=;
        b=jKMJyIzdPXm0SOJxsWGHX+nYwBjWxEIcoB4749rO/9Ruy+aIlfaLHAifnpe/dZLTvM
         4+kB2tbB9KumLTle3nNLxlg9tvg9H570a5Kk6cO72Jn66iJrtaRCR1QK3lAFhqv/zRFR
         c0f0IQCT1eifY1sUjp1FZou/G222l/oSICT4G9+JwBjJHDYDTQ0IJ+hGcW5cwDk4ORO1
         +ikEM34J0wt2a0FRGaVR5HjtraENncA1LuPW5w3O6ufEHn0Hciak971oTtfy8Q2AYhoy
         iUoZvJwZh+4u2+vfmPf8IXiGKK7zPnYo9UJu7mmW5IPHohpB4j2vqj/Pj1Er/nJz+S+H
         ufHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767705725; x=1768310525;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AnaTrYgO4HShbHNfxp0Gz+GzpJfxlGJKnBUzxWHLg+w=;
        b=KQxYF3BPz3ZzJ0o8spPGt256ZtaEWD/QnEULJ9AGSf6R/U5rLMwuLV2xZW+HUAEsIu
         YcbFkeurNLdUWY35fFubSYXFTiiUED0zXPHJSB+/MqXp+7gwJCL9vBLc6+J885ZFcFOS
         ijmds9XhOG79fxaAAKWxKlhfyjhFUz6maB31l762wZbC9IECRPUhiJtCpDpKQRxbpwW2
         ooyosdhq6NDKt2846t81bDiP7EvExFO7OUCbq+KTnJkXsYhrGo/7330ZJurEl22/G4lc
         LnT5LnyswR5KtLynWTE27NJ8DjHg30ZnxA39Ac59ICurA4mLgJVzx3Op8y+P2XeUwQz9
         epPA==
X-Forwarded-Encrypted: i=1; AJvYcCU6zOMNYOsnIlVtWsp8foTlbjgZpgHV6nxl9U8sZMpk8APpQpg+QO7uC0+pte02FKRbAkDx5y7iHXG59bSdfiHW@lists.infradead.org
X-Gm-Message-State: AOJu0YzyUlPMveDL7+GJUKXmKYi5QmlyjXLtGZPyUujEOFuBxzJZy2+P
	C4Po496lN6H5IeXmyfHPD4hRZHdGBwYxOSIN5f2ccrIm7M6kxLIm//Wb
X-Gm-Gg: AY/fxX7YtJMr5jHIYPO+jGjJ6NQccEJ1QOhn8X+i9pt+5hFV2B+0maQ1ZKl0Ajq9xa+
	BIQVIwDALVBEVVLx829wbzYrSwxI/dj/stwZhascCuEyTEevCSlFkvLqfwoZNuRMae4ErROixee
	1Mvbho8VJ1f3XDv3HCjmgvTqlfG+wSe6JWgvS+EtqPfBeleYABPdbLqjSICsQYQC/fp7Hi4OjJv
	9YNGjykJnwRGZXr0zWWoQd0BtXZ+qBca5Le3Wt8/6noYVbowEmxm84T/3o6ipyYEYgbAgm47lH0
	U6nODGoSLPvGcAdMmS3/Anx/FQCxf5exMsb1p1CgKBZNfh6QtdACAE+frXvrukhxnQUzie8Irqv
	flcZ/horpyP7cOPS+5it8XXFiLbSm7LcQaCsSUrHeORpLOmqQf2C4QFUrNDgnQ3RkJNWtaxe/Zq
	lwvs/otzkv2Q==
X-Google-Smtp-Source: AGHT+IGOQUwp29CuBStqL9lweYRQ0EBUwNwC7bXQ4+jGDqmOepHg0UTslUPPgNQcAc0Gl4FJ2lkzvg==
X-Received: by 2002:a17:907:7242:b0:b7a:1bdd:3311 with SMTP id a640c23a62f3a-b8426c4a81cmr316783366b.62.1767705724583;
        Tue, 06 Jan 2026 05:22:04 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2cffa4sm225646466b.30.2026.01.06.05.22.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jan 2026 05:22:04 -0800 (PST)
Date: Tue, 6 Jan 2026 13:22:03 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, riel@surriel.com,
	harry.yoo@oracle.com, jannh@google.com, willy@infradead.org,
	baohua@kernel.org, dev.jain@arm.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] mm: rmap: support batched unmapping for file
 large folios
Message-ID: <20260106132203.kdxfvootlkxzex2l@master>
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <142919ac14d3cf70cba370808d85debe089df7b4.1766631066.git.baolin.wang@linux.alibaba.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_052207_499169_410E14BB 
X-CRM114-Status: GOOD (  18.63  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 26, 2025 at 02:07:59PM +0800, Baolin Wang wrote:
>Similar to folio_referenced_one(), we can apply batched unmapping for file
>large folios to optimize the performance of file folios reclamation.
>
>Barry previously implemented batched unmapping for lazyfree anonymous large
>folios[1] and did not further optimize anonymous large folios or file-backed
>large folios at that stage. As for file-backed large folios, the batched
>unmapping support is relatively straightforward, as we only need to clear
>the consecutive (present) PTE entries for file-backed large folios.
>
>Performance testing:
>Allocate 10G clean file-backed folios by mmap() in a memory cgroup, and try to
>reclaim 8G file-backed folios via the memory.reclaim interface. I can observe
>75% performance improvement on my Arm64 32-core server (and 50%+ improvement
>on my X86 machine) with this patch.
>
>W/o patch:
>real    0m1.018s
>user    0m0.000s
>sys     0m1.018s
>
>W/ patch:
>real	0m0.249s
>user	0m0.000s
>sys	0m0.249s
>
>[1] https://lore.kernel.org/all/20250214093015.51024-4-21cnbao@gmail.com/T/#u
>Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>Acked-by: Barry Song <baohua@kernel.org>
>Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>---
> mm/rmap.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/mm/rmap.c b/mm/rmap.c
>index 985ab0b085ba..e1d16003c514 100644
>--- a/mm/rmap.c
>+++ b/mm/rmap.c
>@@ -1863,9 +1863,10 @@ static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> 	end_addr = pmd_addr_end(addr, vma->vm_end);
> 	max_nr = (end_addr - addr) >> PAGE_SHIFT;
> 
>-	/* We only support lazyfree batching for now ... */
>-	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
>+	/* We only support lazyfree or file folios batching for now ... */
>+	if (folio_test_anon(folio) && folio_test_swapbacked(folio))
> 		return 1;
>+
> 	if (pte_unused(pte))
> 		return 1;
> 
>@@ -2231,7 +2232,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> 			 *
> 			 * See Documentation/mm/mmu_notifier.rst
> 			 */
>-			dec_mm_counter(mm, mm_counter_file(folio));
>+			add_mm_counter(mm, mm_counter_file(folio), -nr_pages);
> 		}
> discard:
> 		if (unlikely(folio_test_hugetlb(folio))) {
>-- 
>2.47.3
>

Hi, Baolin

When reading your patch, I come up one small question.

Current try_to_unmap_one() has following structure:

    try_to_unmap_one()
        while (page_vma_mapped_walk(&pvmw)) {
            nr_pages = folio_unmap_pte_batch()

            if (nr_pages = folio_nr_pages(folio))
                goto walk_done;
        }

I am thinking what if nr_pages > 1 but nr_pages != folio_nr_pages().

If my understanding is correct, page_vma_mapped_walk() would start from
(pvmw->address + PAGE_SIZE) in next iteration, but we have already cleared to
(pvmw->address + nr_pages * PAGE_SIZE), right?

Not sure my understanding is correct, if so do we have some reason not to
skip the cleared range?

-- 
Wei Yang
Help you, Help me

