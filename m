Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6867C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9d8u+VrD2ONy4imzNddIFq+dSgSLZFsyXGu9GrVZVD8=; b=Mt669dqMjYf9fpJiHDcxOWihP/
	1/P633UAk/5ywPnkD/juUwEsT8hKvHPZ+bUi7O/Lkmee/9sv/sjMSTAFbyw0GtmtoVT/wCO6l//aS
	Tlo32fsiG95YuxPDgeMLt3CQIlohxn9Fq1q8EhMs29/bMpYmOjb+S2ClzQMA2brvet3QlU6oLsnBJ
	2Qxt5UcPoDQNbfDji/7ajHgIWpu1vJtMinam+iU3IcE0BUE0PmE1rlxIk0zKe6dfRne3Q2QfC3B0j
	sc00bsuNrwD98uhAWbXNDJCPotHjVKe6jhxU1tagVn2/SK9ofF9TILU6OkAy6kstxPm271y3eCMtv
	8XSKecfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuMN-0000000AY5G-3iRt;
	Wed, 15 Jan 2025 03:46:27 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuF8-0000000AWmB-2abJ;
	Wed, 15 Jan 2025 03:38:59 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso7823860a91.2;
        Tue, 14 Jan 2025 19:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736912338; x=1737517138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d8u+VrD2ONy4imzNddIFq+dSgSLZFsyXGu9GrVZVD8=;
        b=lfMiFfyw3pqm4eeuZ7/Bl9BsdY09hePh89KR160uYEX+dK1ipMDJQVZBJVjWy5UBKK
         ALIKGVAeZpvYqmBxNL1DpP9Eqj9yBLo4j7p7czMlL29DGzCxoedWk4sezp6zAYGAptYa
         tK0vcdGEOApBH/WgdaKX2SJ3fPAjDbqGaye6dptA6SJNZyVk6v7F5GMw3xiep3ygqyJE
         cTej8h0yrm1/Z1P7CFbNtjuM1vRhNaxi8O135b/iqTaXJJGNaHZn091ljeUUCkztSvJM
         u1rzcu+xk1HxCX3sxhYpRiHf9SMh7aJ9/91IWIG1WsXpDq3CFHJyRJw9gI1W1dL1w0Yy
         ymGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736912338; x=1737517138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9d8u+VrD2ONy4imzNddIFq+dSgSLZFsyXGu9GrVZVD8=;
        b=EeYFRtNBt2zxkch2pPuguIvaOk6H96ooEnQHxTzzaihUjvwCuLg55o8s4YtbTdpTN0
         SzEukXYLbYePlkBFvYVO42GjzwkaOEIvQDbEjBXfaWSB1ISLMGLDwHmTn2TQQt6V2lCK
         8upd5BpIbxsaBSW/kDDEUss6s9/lbnSP/u4FpHaZVHgvLa0Ws8ZrOHCrEhLnaRn6mX7C
         oNkxozbZyFBd2lI3+JEEMm1J4pb1OQpD6UgYw/U8d1hXsna0JqV2a6TWLpYXNurytXvp
         OIVVnddZbSzw7YxH9IqlRYV+US7vZgd8Z7d/beoZSCYGl0ZrCIL9biOiD6spFEvCUOCJ
         zOpA==
X-Forwarded-Encrypted: i=1; AJvYcCUJkz71NeuYXPx4v3ZAws7v7afybjwJ26n+7kQnI/57cFdHXgw6w5PZ5XjOlqmJbRt4aq04mjMLrmenKDRAJcrB@lists.infradead.org, AJvYcCXLUGHO7N86cLSrXLyx7jM61fEZA1o2fahcEAxdRFr+U+TdcCdqI3iAe7dIHCnODUoCObnVEBYSpll6Q3g=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz/mV3CDQhekQ/sV9GjGoN7AdlyEEH9iEbkI2dkOQGaqmCOtlL
	W40aefphmVBwkFvknju6pohUCh/vpv6w1xTFNxfVcwXw+nLFBDa3
X-Gm-Gg: ASbGnctmz0uo0HGPbPHp8igSmQ0FLJHpfpRYsbzKjyAiwptH0mPyWJxcOM5cIvic9Xx
	iYJd8s0N++VYiOyCL2AkWh8czZnjbM4iosfQncTVMKBauaClE8FYzzAdJ780siSgHXj4Dy/l6WM
	TCeSUp0yOjAj95SgpcbXTq3x0Ip6UJSxFac3YpVOsuDF/mJt3g8ye/p3o7EeHUAv2CTlzRZA9J8
	MN7o+6JteETZp68pfeKYr9AGfQe38PfgdRx3cEYxOY4jIaJqNHU8c8bqhezGYqmJWTVZn460mBD
	NgCxHqDF
X-Google-Smtp-Source: AGHT+IEgu9NCoDqW1LR96/MyezmmdQXkL7jxU3Tb2bYXbRgZkZZNqA2mJFSkzEeWX1OvoHRYK4gZ3A==
X-Received: by 2002:a17:90b:2f4e:b0:2ee:f550:3848 with SMTP id 98e67ed59e1d1-2f548e98ea9mr36383031a91.5.1736912337886;
        Tue, 14 Jan 2025 19:38:57 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:e5d5:b870:ca9b:78f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10dffbsm73368195ad.49.2025.01.14.19.38.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 19:38:57 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: 21cnbao@gmail.com,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: [PATCH v3 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped THP in try_to_unmap
Date: Wed, 15 Jan 2025 16:38:08 +1300
Message-Id: <20250115033808.40641-5-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250115033808.40641-1-21cnbao@gmail.com>
References: <20250115033808.40641-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_193858_667304_6555BF74 
X-CRM114-Status: GOOD (  14.92  )
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

From: Barry Song <v-songbaohua@oppo.com>

The try_to_unmap_one() function currently handles PMD-mapped THPs
inefficiently. It first splits the PMD into PTEs, copies the dirty
state from the PMD to the PTEs, iterates over the PTEs to locate
the dirty state, and then marks the THP as swap-backed. This process
involves unnecessary PMD splitting and redundant iteration. Instead,
this functionality can be efficiently managed in
__discard_anon_folio_pmd_locked(), avoiding the extra steps and
improving performance.

The following microbenchmark redirties folios after invoking MADV_FREE,
then measures the time taken to perform memory reclamation (actually
set those folios swapbacked again) on the redirtied folios.

 #include <stdio.h>
 #include <sys/mman.h>
 #include <string.h>
 #include <time.h>

 #define SIZE 128*1024*1024  // 128 MB

 int main(int argc, char *argv[])
 {
 	while(1) {
 		volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
 				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

 		memset((void *)p, 1, SIZE);
 		madvise((void *)p, SIZE, MADV_FREE);
 		/* redirty after MADV_FREE */
 		memset((void *)p, 1, SIZE);

		clock_t start_time = clock();
 		madvise((void *)p, SIZE, MADV_PAGEOUT);
 		clock_t end_time = clock();

 		double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
 		printf("Time taken by reclamation: %f seconds\n", elapsed_time);

 		munmap((void *)p, SIZE);
 	}
 	return 0;
 }

Testing results are as below,
w/o patch:
~ # ./a.out
Time taken by reclamation: 0.007300 seconds
Time taken by reclamation: 0.007226 seconds
Time taken by reclamation: 0.007295 seconds
Time taken by reclamation: 0.007731 seconds
Time taken by reclamation: 0.007134 seconds
Time taken by reclamation: 0.007285 seconds
Time taken by reclamation: 0.007720 seconds
Time taken by reclamation: 0.007128 seconds
Time taken by reclamation: 0.007710 seconds
Time taken by reclamation: 0.007712 seconds
Time taken by reclamation: 0.007236 seconds
Time taken by reclamation: 0.007690 seconds
Time taken by reclamation: 0.007174 seconds
Time taken by reclamation: 0.007670 seconds
Time taken by reclamation: 0.007169 seconds
Time taken by reclamation: 0.007305 seconds
Time taken by reclamation: 0.007432 seconds
Time taken by reclamation: 0.007158 seconds
Time taken by reclamation: 0.007133 seconds
…

w/ patch

~ # ./a.out
Time taken by reclamation: 0.002124 seconds
Time taken by reclamation: 0.002116 seconds
Time taken by reclamation: 0.002150 seconds
Time taken by reclamation: 0.002261 seconds
Time taken by reclamation: 0.002137 seconds
Time taken by reclamation: 0.002173 seconds
Time taken by reclamation: 0.002063 seconds
Time taken by reclamation: 0.002088 seconds
Time taken by reclamation: 0.002169 seconds
Time taken by reclamation: 0.002124 seconds
Time taken by reclamation: 0.002111 seconds
Time taken by reclamation: 0.002224 seconds
Time taken by reclamation: 0.002297 seconds
Time taken by reclamation: 0.002260 seconds
Time taken by reclamation: 0.002246 seconds
Time taken by reclamation: 0.002272 seconds
Time taken by reclamation: 0.002277 seconds
Time taken by reclamation: 0.002462 seconds
…

This patch significantly speeds up try_to_unmap_one() by allowing it
to skip redirtied THPs without splitting the PMD.

Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Suggested-by: Lance Yang <ioworker0@gmail.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/huge_memory.c | 24 +++++++++++++++++-------
 mm/rmap.c        | 13 ++++++++++---
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 3d3ebdc002d5..47cc8c3f8f80 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 	int ref_count, map_count;
 	pmd_t orig_pmd = *pmdp;
 
-	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
+	if (pmd_dirty(orig_pmd))
+		folio_set_dirty(folio);
+	if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
+		folio_set_swapbacked(folio);
 		return false;
+	}
 
 	orig_pmd = pmdp_huge_clear_flush(vma, addr, pmdp);
 
@@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 	 *
 	 * The only folio refs must be one from isolation plus the rmap(s).
 	 */
-	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
-	    ref_count != map_count + 1) {
+	if (pmd_dirty(orig_pmd))
+		folio_set_dirty(folio);
+	if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
+		folio_set_swapbacked(folio);
+		set_pmd_at(mm, addr, pmdp, orig_pmd);
+		return false;
+	}
+
+	if (ref_count != map_count + 1) {
 		set_pmd_at(mm, addr, pmdp, orig_pmd);
 		return false;
 	}
@@ -3119,12 +3130,11 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 {
 	VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
 	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
+	VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
 	VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
 
-	if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
-		return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
-
-	return false;
+	return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
 }
 
 static void remap_page(struct folio *folio, unsigned long nr, int flags)
diff --git a/mm/rmap.c b/mm/rmap.c
index be1978d2712d..a859c399ec7c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1724,9 +1724,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 
 		if (!pvmw.pte) {
-			if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
-						  folio))
-				goto walk_done;
+			if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
+				if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
+					goto walk_done;
+				/*
+				 * unmap_huge_pmd_locked has either already marked
+				 * the folio as swap-backed or decided to retain it
+				 * due to GUP or speculative references.
+				 */
+				goto walk_abort;
+			}
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				/*
-- 
2.39.3 (Apple Git-146)


