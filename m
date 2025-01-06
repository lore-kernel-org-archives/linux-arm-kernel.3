Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9442DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 03:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0uoTlJkT3xJASppF2RyQQeqHMmR9kwA4pIBCxskX/8=; b=fylshq7Pu68yHR71sfQz6TeTd9
	Ode7U+DNWe87zppuBlglDHX81XHKaWdzROORaaj3AovNmuAKMBFvbCj1cTkCz1AKQXjbYCdfPpcf+
	tU3y4wYiOmtg5t/TbbUHS9qj2AOTpkerBiGsMhp0QATKPz6U/oaeBmCMnut7DinjDrwe7/c2pdFap
	HCMeiDh4BvvzxDybh46S9c0ELOkH6W2eu1byX7AnRy+e94nrVzvGumaL5nsJoF9JzSGyIDGCWywqW
	jpGCDf1sKDcEMX3XvGnhw5/IRkmc6ehiJrhkjvr+lE1XHuvS2Mediszxa2t0I1dsyP0LltGzQ4avn
	p2wxFsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdh0-0000000087z-3xG6;
	Mon, 06 Jan 2025 03:22:14 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUdci-000000007gT-0cHB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 03:17:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so19834762a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 19:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736133467; x=1736738267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0uoTlJkT3xJASppF2RyQQeqHMmR9kwA4pIBCxskX/8=;
        b=N1k22VJEPMZH1H7UOecHBNtgpVam9Uo4HaThxY0NaPWTnbeIzM8sQUBSPAJ/XEilVn
         txH/BEApI5J9nODQmbI2jJEbYGqiZiSkShvpMgB3bJxvFXksEGTtUYbYagT6ncYKiN0p
         zW7RGb/Lf4+zn1uG642mUYcXkKaY5BAZ3Uim80B8530zpozb325ddchRTYr7YLBt4NU8
         sM1rGhzTGKI7b4NfH3S1gofPLJdDx65j5CAYi63DoLHlrF9RGUMgRadSjM5GBv55gux/
         dVngyztK/vXtPOp8ytsSkjnLcEgT9yybTLDhiLsOR0abv9lxQ016cBVcVvPV5s7ZRXwB
         m2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736133467; x=1736738267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0uoTlJkT3xJASppF2RyQQeqHMmR9kwA4pIBCxskX/8=;
        b=LiLH2jblgqJWRrVl15ql95lWfdooP4Q5rNVt4d+K4K/SNGKnpzwFW4NKlMyU3J3NCi
         OCiIQuZzHjp0yyTfHbdlfEsfOz6U5PLOYFayTCrQVipvE0JLBUyRqox0YVxv2Qi0tupc
         H/l9ooCoiYk6+xFOhX2NBwDJTleEk2N66oIBDqizNSJ6MPLUNOzhc/S5lvFsc5g56jZn
         SinYz7np+LEQjYTzS+de+Lo+nlPtutzeB+rH9hrmp2gx43nYww4cgQM+skKTIrYqd2J2
         moClxIYM1vogCo8jB7K0PHXs19MZLNKbno/2gAdF9tWHaIXawWxvnBB44Q2dJcamy4Yn
         tPdA==
X-Gm-Message-State: AOJu0YyWa7JE6U2z8mVv0W/Ov9RiXFAI3zdYkz/eypCkl0pQtD5E7Uag
	b9s3SxuCq1iObYe3Wkvn1GuYJbDDTh7Rce1qv/L9O0lVa9czxc+w
X-Gm-Gg: ASbGncsB23/gdsgu63t6Qk4I7IBtWlnvaI16QIPW19K0o/8v8hRQ6zI97EhZg9Kd3UJ
	dNmyrwN94fdqBraySejOeHYE/PswJW6rw4udio+oCwokdUZeeAP/+suAad12V9GQKXFuCShLp8I
	ycq0DOr8yR8CSeOqhAqnrM1vWbG5TwH61/bSgYvPca+iY8th8tVD7dAF0wcm7axDd465EcWn3/Z
	E9tGNgg3eGBrg8SrHQp2jfGP4YeOVxVEkdrGa1AE6+kiVRiUbQHgSpzfX0kfa3XAjgnQl5NdG5v
	MhF7oW2W
X-Google-Smtp-Source: AGHT+IHWP7zdolqMJNXBm1PXeI0GcejV+nCAy9WuJHL0SUoSVOj1myQWg2/Wp3YfIF+X1TNQvseTgA==
X-Received: by 2002:a17:90b:540f:b0:2ee:6db1:21d3 with SMTP id 98e67ed59e1d1-2f452ec922bmr79065291a91.25.1736133467432;
        Sun, 05 Jan 2025 19:17:47 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:a54c:5ad3:ad27:edb7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cde6sm38471399a91.13.2025.01.05.19.17.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 05 Jan 2025 19:17:47 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	ioworker0@gmail.com,
	david@redhat.com,
	ryan.roberts@arm.com,
	zhengtangquan@oppo.com,
	ying.huang@intel.com,
	kasong@tencent.com,
	chrisl@kernel.org,
	baolin.wang@linux.alibaba.com,
	Barry Song <v-songbaohua@oppo.com>
Subject: [PATCH 3/3] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Mon,  6 Jan 2025 16:17:11 +1300
Message-Id: <20250106031711.82855-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250106031711.82855-1-21cnbao@gmail.com>
References: <20250106031711.82855-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_191748_187239_58FBDACD 
X-CRM114-Status: GOOD (  19.85  )
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

Currently, the PTEs and rmap of a large folio are removed one at a time.
This is not only slow but also causes the large folio to be unnecessarily
added to deferred_split, which can lead to races between the
deferred_split shrinker callback and memory reclamation. This patch
releases all PTEs and rmap entries in a batch.
Currently, it only handles lazyfree large folios.

The below microbench tries to reclaim 128MB lazyfree large folios
whose sizes are 64KiB:

 #include <stdio.h>
 #include <sys/mman.h>
 #include <string.h>
 #include <time.h>

 #define SIZE 128*1024*1024  // 128 MB

 unsigned long read_split_deferred()
 {
 	FILE *file = fopen("/sys/kernel/mm/transparent_hugepage"
			"/hugepages-64kB/stats/split_deferred", "r");
 	if (!file) {
 		perror("Error opening file");
 		return 0;
 	}

 	unsigned long value;
 	if (fscanf(file, "%lu", &value) != 1) {
 		perror("Error reading value");
 		fclose(file);
 		return 0;
 	}

 	fclose(file);
 	return value;
 }

 int main(int argc, char *argv[])
 {
 	while(1) {
 		volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
 				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

 		memset((void *)p, 1, SIZE);

 		madvise((void *)p, SIZE, MADV_FREE);

 		clock_t start_time = clock();
 		unsigned long start_split = read_split_deferred();
 		madvise((void *)p, SIZE, MADV_PAGEOUT);
 		clock_t end_time = clock();
 		unsigned long end_split = read_split_deferred();

 		double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
 		printf("Time taken by reclamation: %f seconds, split_deferred: %ld\n",
 			elapsed_time, end_split - start_split);

 		munmap((void *)p, SIZE);
 	}
 	return 0;
 }

w/o patch:
~ # ./a.out
Time taken by reclamation: 0.177418 seconds, split_deferred: 2048
Time taken by reclamation: 0.178348 seconds, split_deferred: 2048
Time taken by reclamation: 0.174525 seconds, split_deferred: 2048
Time taken by reclamation: 0.171620 seconds, split_deferred: 2048
Time taken by reclamation: 0.172241 seconds, split_deferred: 2048
Time taken by reclamation: 0.174003 seconds, split_deferred: 2048
Time taken by reclamation: 0.171058 seconds, split_deferred: 2048
Time taken by reclamation: 0.171993 seconds, split_deferred: 2048
Time taken by reclamation: 0.169829 seconds, split_deferred: 2048
Time taken by reclamation: 0.172895 seconds, split_deferred: 2048
Time taken by reclamation: 0.176063 seconds, split_deferred: 2048
Time taken by reclamation: 0.172568 seconds, split_deferred: 2048
Time taken by reclamation: 0.171185 seconds, split_deferred: 2048
Time taken by reclamation: 0.170632 seconds, split_deferred: 2048
Time taken by reclamation: 0.170208 seconds, split_deferred: 2048
Time taken by reclamation: 0.174192 seconds, split_deferred: 2048
...

w/ patch:
~ # ./a.out
Time taken by reclamation: 0.074231 seconds, split_deferred: 0
Time taken by reclamation: 0.071026 seconds, split_deferred: 0
Time taken by reclamation: 0.072029 seconds, split_deferred: 0
Time taken by reclamation: 0.071873 seconds, split_deferred: 0
Time taken by reclamation: 0.073573 seconds, split_deferred: 0
Time taken by reclamation: 0.071906 seconds, split_deferred: 0
Time taken by reclamation: 0.073604 seconds, split_deferred: 0
Time taken by reclamation: 0.075903 seconds, split_deferred: 0
Time taken by reclamation: 0.073191 seconds, split_deferred: 0
Time taken by reclamation: 0.071228 seconds, split_deferred: 0
Time taken by reclamation: 0.071391 seconds, split_deferred: 0
Time taken by reclamation: 0.071468 seconds, split_deferred: 0
Time taken by reclamation: 0.071896 seconds, split_deferred: 0
Time taken by reclamation: 0.072508 seconds, split_deferred: 0
Time taken by reclamation: 0.071884 seconds, split_deferred: 0
Time taken by reclamation: 0.072433 seconds, split_deferred: 0
Time taken by reclamation: 0.071939 seconds, split_deferred: 0
...

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 mm/rmap.c | 48 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 365112af5291..9424b96f8482 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1642,6 +1642,27 @@ void folio_remove_rmap_pmd(struct folio *folio, struct page *page,
 #endif
 }
 
+/* We support batch unmapping of PTEs for lazyfree large folios */
+static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
+			struct folio *folio, pte_t *ptep)
+{
+	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
+	int max_nr = folio_nr_pages(folio);
+	pte_t pte = ptep_get(ptep);
+
+	if (pte_none(pte))
+		return false;
+	if (!pte_present(pte))
+		return false;
+	if (!folio_test_anon(folio))
+		return false;
+	if (folio_test_swapbacked(folio))
+		return false;
+
+	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
+			       NULL, NULL) == max_nr;
+}
+
 /*
  * @arg: enum ttu_flags will be passed to this argument
  */
@@ -1655,6 +1676,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	bool anon_exclusive, ret = true;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
+	int nr_pages = 1;
 	unsigned long pfn;
 	unsigned long hsz = 0;
 
@@ -1780,6 +1802,15 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				hugetlb_vma_unlock_write(vma);
 			}
 			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
+		} else if (folio_test_large(folio) &&
+				can_batch_unmap_folio_ptes(address, folio, pvmw.pte)) {
+			nr_pages = folio_nr_pages(folio);
+			flush_cache_range(vma, range.start, range.end);
+			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
+			if (should_defer_flush(mm, flags))
+				set_tlb_ubc_flush_pending(mm, pteval, address, folio_size(folio));
+			else
+				flush_tlb_range(vma, range.start, range.end);
 		} else {
 			flush_cache_page(vma, address, pfn);
 			/* Nuke the page table entry. */
@@ -1875,7 +1906,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					 * redirtied either using the page table or a previously
 					 * obtained GUP reference.
 					 */
-					set_pte_at(mm, address, pvmw.pte, pteval);
+					set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
 					folio_set_swapbacked(folio);
 					goto walk_abort;
 				} else if (ref_count != 1 + map_count) {
@@ -1888,10 +1919,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					 * We'll come back here later and detect if the folio was
 					 * dirtied when the additional reference is gone.
 					 */
-					set_pte_at(mm, address, pvmw.pte, pteval);
+					set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
 					goto walk_abort;
 				}
-				dec_mm_counter(mm, MM_ANONPAGES);
+				add_mm_counter(mm, MM_ANONPAGES, -nr_pages);
 				goto discard;
 			}
 
@@ -1943,13 +1974,18 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			dec_mm_counter(mm, mm_counter_file(folio));
 		}
 discard:
-		if (unlikely(folio_test_hugetlb(folio)))
+		if (unlikely(folio_test_hugetlb(folio))) {
 			hugetlb_remove_rmap(folio);
-		else
-			folio_remove_rmap_pte(folio, subpage, vma);
+		} else {
+			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
+			folio_ref_sub(folio, nr_pages - 1);
+		}
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
 		folio_put(folio);
+		/* We have already batched the entire folio */
+		if (nr_pages > 1)
+			goto walk_done;
 		continue;
 walk_abort:
 		ret = false;
-- 
2.39.3 (Apple Git-146)


