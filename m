Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBEFCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FDpWehmyXZTuwNLpOmNryZ2PSD85lfcY7+uhsZatBYE=; b=P2ejDjwNP+aXLSSb4rzMjU/ywT
	25xjhkaqjRfkSlal6mU7GSm2lehmHfX9O1sYOfW3wFMEiswNSwOynqYiXLP1J4C/eiM0gH4Fihlhu
	NNfTSDjsGlNt1h3uSysk1mpF9bvlDVc18qf/Y/caRbcnInTSYolQ2bIuwl5C04j09Z8owcQ8bGi/3
	GSL+vrClWZyUsanJA+4tbORDZbf5L37Qd956QBm7WMhsTYlf+cxZFUh/l1iAuETQq3/N8fW8//YXl
	xRcAnGAYlDRUrqcucN0XBKbFzqWw9bWvPAILO9B29M+ziSUGKf/iX2M4TyoHHwrBySICFDn80pzPV
	JcnRhuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVa-0000000CnAO-1hEd;
	Sat, 03 Oct 2026 00:21:46 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVX-0000000Cn4t-0Uso
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:44 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso361986a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986902; x=1791591702; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FDpWehmyXZTuwNLpOmNryZ2PSD85lfcY7+uhsZatBYE=;
        b=jd7RHnCNazHdDZf9El7V+p8Ib7erCCVtToD0noeHW+1DJ0rxhs9rFBkhTqycExFruC
         J3vUM3Naglj0eBljn6zDNwh82ezqJmejA9UB0+PAayFm/Oc0CjJ3UgUGbtsRxntS2Fs/
         4vHNGDwFgFFeL9+3Sm9FoTwidySdGWI0bt/btf5W+IcyCRZ3Z5luRgshVEXuMYpW95fp
         Pl0WX+7uVz6ORG2oAigM21MtNousm6+YT6V7is4Y+jQHmoUCYKiILV5bZhJx07+8rWuu
         rbK2FTVjt9gyG9WtxE1eX3s3dOnIXrjRkWd8KEyBjP2KDxBPDWbb6uXV9tFVkqOujZhz
         qzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986902; x=1791591702;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FDpWehmyXZTuwNLpOmNryZ2PSD85lfcY7+uhsZatBYE=;
        b=GQml1c1Md8WNdujZB7uehW9aeEmpgWpljFm+TvbE9/tA7HyMjAYIvvakSCU3pkeZmH
         jYWR0McGWErXjoq+MSnhO28VCXkFb+4LpyGjGfwRK6FFZ6AfLzdL+4NRgIzNuZUtm/1c
         pDrPEE5/E/9Tcq5B4hNg3uJWK2Hu57eod8KL8WHzH8e+7Zgg7u5LdiHoxR53PvRkAvVr
         nqT1GZ4YybDev47Z5a/reTjHt+kYR2g+SI/RV7o3otBhNrHgxEd6kS8tQPm9tbFAl1qc
         Tiv6J9y6VCKFwIAyCpLrbnp1x2ladvn52dLCkqLbZF68A0hFIB2TyzqcwGoluwlO6+im
         fqNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjSyFmuAAcPIBGaZWi5+a7+/2kGt7WxciRZ95z4y30+ttu5rNB337r+1Gaoxldoh4cdAl8vE77e5Yo96glXkbG@lists.infradead.org
X-Gm-Message-State: AFq9FYKlaFUWTVtexyUDv/4vOFA0FsXWWmi/jr+EGfsPSJyiHDktQ8mU
	JyHw20EHYnQLbCMdPVkIYS1P3LfJ67q7izAQh12tLkd/h+pMWY9rfHlUmFkDvydcTYdjbW8rZZ9
	GJJtAW9sYQzDtXkTjfXIERg==
X-Received: from pgbdn12.prod.google.com ([2002:a05:6a02:e0c:b0:cca:68cf:6f65])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4ac5:b0:3a0:ddef:3da3 with SMTP id 98e67ed59e1d1-3a4f32d94a2mr5433773a91.15.1790986901434;
 Fri, 02 Oct 2026 17:21:41 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:11 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-9-jthoughton@google.com>
Subject: [PATCH v2 08/20] hugetlb: Fully initialize tail struct pages of
 non-pre-HVOed bootmem folios
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172143_185648_B70EAC53 
X-CRM114-Status: GOOD (  20.78  )
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

alloc_bootmem() marks all but the head struct page of a bootmem gigantic
folio as noinit, and gather_bootmem_prealloc_node() then only
initializes the first HUGETLB_VMEMMAP_RESERVE_PAGES struct pages. The
remaining tail struct pages are initialized only if the folio ends up
not being HVOed.

This assumes that a bootmem folio is either pre-HVOed, or will not be
HVOed at all. However, hugetlb_vmemmap_optimize_bootmem_page() may skip
pre-HVO because arch_hugetlb_vmemmap_optimization_supported() does not
yet return true that early in boot (e.g. on arm64, where support depends
on a system-wide CPU capability), while it does return true by the time
hugetlb_vmemmap_optimize_bootmem_folios() runs. Such folios are then
HVOed through the regular remap path with uninitialized tail struct
pages, which trips the PageTail() WARN in vmemmap_remap_pte().

Avoid this by initializing all tail struct pages up front in
gather_bootmem_prealloc_node() for folios that were not pre-HVOed. This
makes the HVO-failure fallback in prep_and_add_bootmem_folios()
unnecessary, as pre-HVOed folios are never passed through the regular
remap path, and all other folios now already have initialized tail
struct pages. A failed optimization either leaves the original vmemmap
in place or restores the tail struct pages from the shared tail page.
Remove the fallback.

For folios that are not HVOed at all, this does not change the amount
of initialization work, only where it is done.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4dac7ed1df57..e971e2362412 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3303,17 +3303,6 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	hugetlb_vmemmap_optimize_bootmem_folios(h, folio_list);
 
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
-		if (!folio_test_hugetlb_vmemmap_optimized(folio)) {
-			/*
-			 * If HVO fails, initialize all tail struct pages
-			 * We do not worry about potential long lock hold
-			 * time as this is early in boot and there should
-			 * be no contention.
-			 */
-			hugetlb_folio_init_tail_vmemmap(folio, h,
-					HUGETLB_VMEMMAP_RESERVE_PAGES,
-					pages_per_huge_page(h));
-		}
 		hugetlb_bootmem_init_migratetype(folio, h);
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
@@ -3337,6 +3326,7 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		struct page *page = virt_to_page(m);
 		struct folio *folio = (void *)page;
 		const unsigned long pfn = folio_pfn(folio);
+		bool pre_hvo;
 
 		h = m->hstate;
 		/*
@@ -3350,11 +3340,23 @@ static void __init gather_bootmem_prealloc_node(unsigned long nid)
 		VM_BUG_ON(!hstate_is_gigantic(h));
 		WARN_ON(folio_ref_count(folio) != 1);
 
+		pre_hvo = vmemmap_optimizable_order(pfn_to_section_compound_order(pfn));
+
+		/*
+		 * Pre-HVOed folios have their tail struct pages mirrored from
+		 * the shared tail page, so only the first vmemmap page needs
+		 * initializing. Otherwise, the tail struct pages (marked noinit
+		 * in alloc_bootmem()) must all be initialized now: the folio
+		 * may still be HVOed via the regular remap path (e.g. if the
+		 * architecture could not determine HVO support at bootmem
+		 * allocation time), which expects valid tail pages.
+		 */
 		hugetlb_folio_init_vmemmap(folio, h,
-					   HUGETLB_VMEMMAP_RESERVE_PAGES);
+					   pre_hvo ? HUGETLB_VMEMMAP_RESERVE_PAGES :
+						     pages_per_huge_page(h));
 		init_new_hugetlb_folio(folio);
 
-		if (vmemmap_optimizable_order(pfn_to_section_compound_order(pfn)))
+		if (pre_hvo)
 			folio_set_hugetlb_vmemmap_optimized(folio);
 		section_set_compound_order_range(pfn, folio_nr_pages(folio), 0);
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


