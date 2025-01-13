Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08607E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 03:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ePF7LRaXT6WJxMxcE/kQzKdknlZvi8u0Wr7nYwGrGY=; b=fxaRi9mQRTNfEQdDGV2TGVpxY9
	lrSw0PKJDwhJJ4T6NfFcFyaWq6RWD+V/av1v0s1lZ0fmN0RMO6uYkMhmFCuROIItX80lXJLUANckc
	IvCvg/EUUcfjX8kkhZb6kxSFBr/Bv1VS9K18czJddzKKrbWDDhxZJQ+7Ees4UeVNnopF+KOvmjZBV
	ppwMoqNHedCfVEQLejJloxFqTDFh+aZINlGLb4f5UHM8JacTG4BaGBTHSx3yCSVWXo4DK9eckluEY
	c/ZSIYGrbxt/z/8xyFHh7W2mUlswS5I8KD3ed6OxuTzYfhHltarZr10XMzqj9zTwfJp/uMc5Q2D5P
	J/VPNyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBNZ-00000003w0p-13wP;
	Mon, 13 Jan 2025 03:44:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBIo-00000003vDi-13AS;
	Mon, 13 Jan 2025 03:39:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2166022c5caso57669165ad.2;
        Sun, 12 Jan 2025 19:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736739585; x=1737344385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ePF7LRaXT6WJxMxcE/kQzKdknlZvi8u0Wr7nYwGrGY=;
        b=UyM5xxsTJK0r7Lxtl0mQNjxLAje4sgp4Uko93B0sTl+olrdpaZRC/u/Zj0anPZzprF
         W6m6K7RDMlbbujgYRcpP/uVt117PXLlwCxeMG6ILoCUZUh6tZEwsqQhVqJkBxpJ57UzT
         pNVFJ2u+/PTSgjSRGgimIuVBcG2/mLEoCBHPjI46ONsN9i6/qW4gjK5lCD+KprfRF21O
         mT3hV+N6AYD1IQTtlHWglWaS34Xu6IGusxlgGsM2Ag9nZo+Ou3ebRlt9lIK/QgWxo/+O
         VL5YI8xulWD3Lf+PiDPVAhv9xbdT7mPxN1fmkxN1ezNI1IevJQtJiVIkRLQI0zIV/pi0
         rfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736739585; x=1737344385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ePF7LRaXT6WJxMxcE/kQzKdknlZvi8u0Wr7nYwGrGY=;
        b=we411H3eT86uod7o6C8yzg+3f7YZEJhFhaqboHvaOpGsdMsnwibYQQO1UpNLYm8Kr2
         MGiWS/3sv/fwCBURNbqY9iYpus3W9+w1FVSZpl9nfQwqUfA56KXoDof5RVnsACG1G+Bn
         m8GwUZhkPv9mgwYa4PsYQjRMheWl+p9Uv89aEV7E2tWuuPrthUPFtn5oZ/nxMfVesV/K
         xdCTQozWwLqC70NeimXBGheYpPxDreNn80heuq7VFqnmTdXnsVPCYpAzlzIwDasbN4IH
         hVR9VPk0ClG+kVxrHXCTZ2EvqJeP+qEC/Lgx54Ftux8dRKgf7H0QUs5OLT/5bR+YR+QW
         7YNg==
X-Forwarded-Encrypted: i=1; AJvYcCX/XYbsCBBU8ji7czV72uin6WIEESar6m6cxsVOT+kTuXNT+LAJXq6v5i7+lO6dxmE/xSqFlGlxMS0nyK7sNvtl@lists.infradead.org, AJvYcCXrCMmYUpIW0M5jdIIvc6wAsgLIsA1WkJcE5HIcM3dvVqXocAN/qYdONAeQY9a7+Q2fKDuKp1j+vFZaP8g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIYcrpjYHf/HPQB470qo/vQgND0Jqbs8XGmicKcmbSvwZF2UGA
	07JY3f5Qn8unfN7eI1MPXUV4A7bBLOzO6DMwnwtuiHAkkfxeiu9h
X-Gm-Gg: ASbGncvpH1AKYrQ1j7E2RbKJwaJ6fbiFYC5PN1/OC/BkX1rLBdm06SxICINLYh4DO+Q
	tgNrCG3AB1XN9Va8FF1EPpUGbn/ajpcPAzq5Z2gWCOp7Pi3KQZLtHFD4cdhrXEk70AtxLb4nZaS
	jYdJn1c2DA+AWS29Q29kTauoecwocXLaseDn6hOlcrkCvlLkMaTfpJvzkoEO3fJ3h5Ux/bpxDeu
	6l7WDFRWa90dLmXFJYNcJUKHrued2/obQOb4Eucl3Q6K8dneNQe9s0ESfyqnvdBb3hgrjY6XINS
	pOOYxyvW
X-Google-Smtp-Source: AGHT+IEJyXTMuDf5NuY3j1SIPBbXyZqFASFj5tk1fMcghhN0EpO5xryOPxQNqGVnzZ7Hib6ZrPMFDA==
X-Received: by 2002:a17:903:3385:b0:216:1cf8:8b8 with SMTP id d9443c01a7336-21a83f69643mr199408035ad.27.1736739585271;
        Sun, 12 Jan 2025 19:39:45 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:39b5:3f0b:acf3:9158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25aabfsm44368405ad.246.2025.01.12.19.39.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jan 2025 19:39:44 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com,
	lorenzo.stoakes@oracle.com
Subject: [PATCH v2 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Mon, 13 Jan 2025 16:39:00 +1300
Message-Id: <20250113033901.68951-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250113033901.68951-1-21cnbao@gmail.com>
References: <20250113033901.68951-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_193946_313541_97C58AC9 
X-CRM114-Status: GOOD (  17.74  )
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
 mm/rmap.c | 46 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 365112af5291..3ef659310797 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1642,6 +1642,25 @@ void folio_remove_rmap_pmd(struct folio *folio, struct page *page,
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
+	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
+		return false;
+	if (pte_none(pte) || pte_unused(pte) || !pte_present(pte))
+		return false;
+	if (pte_pfn(pte) != folio_pfn(folio))
+		return false;
+
+	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
+			       NULL, NULL) == max_nr;
+}
+
 /*
  * @arg: enum ttu_flags will be passed to this argument
  */
@@ -1655,6 +1674,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	bool anon_exclusive, ret = true;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
+	int nr_pages = 1;
 	unsigned long pfn;
 	unsigned long hsz = 0;
 
@@ -1780,6 +1800,15 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				hugetlb_vma_unlock_write(vma);
 			}
 			pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
+		} else if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
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
@@ -1875,7 +1904,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					 * redirtied either using the page table or a previously
 					 * obtained GUP reference.
 					 */
-					set_pte_at(mm, address, pvmw.pte, pteval);
+					set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
 					folio_set_swapbacked(folio);
 					goto walk_abort;
 				} else if (ref_count != 1 + map_count) {
@@ -1888,10 +1917,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
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
 
@@ -1943,13 +1972,18 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
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


