Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F57C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptqpPfUGDg1EiuURg84FX6mkSOnefIkRazcht+VYCyI=; b=CuOmVum4mLRsEhNRjQ+kx5er3z
	2d/YD4p+75gmtgWTqTqXHeWWZ7caz9Yaj1rb1vacw2cvNZQ0vCzYftIwpvMXE81P2ilpzSFc7beSe
	x+SEDr60KODU0bFr7sQVt3S1k1air5NkceJVrHMnIfGV0xddoEiJe6ObpyITLaXjH4Pi1LKpQ+H7y
	Y0So/Y00fxx2Hgu3omY2E0EOUBUXrDm9J7/SYhwcnihhTGcB+BCTA7qR5cGOswm34OaJCrrkXviRH
	xPaBmc8SkMuc7GshvhgGEWLJhd7zjEreZWKqgjo5IhUnmlts709WI6W4FTw9ol2VkpadVOEdrrKEa
	0hAKVTaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tis7a-0000000EM4y-2odK;
	Fri, 14 Feb 2025 09:36:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tis2C-0000000EKWJ-0iHz;
	Fri, 14 Feb 2025 09:30:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220c2a87378so25885225ad.1;
        Fri, 14 Feb 2025 01:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739525455; x=1740130255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptqpPfUGDg1EiuURg84FX6mkSOnefIkRazcht+VYCyI=;
        b=gkushbkJJvafJ8LNJ+BwKBOZybz5E8iadevBjC4U7ftg5U4+3O91ttzhJakms3W5F0
         idZUrnnI22EBW64v21rJzLrn9ItqY+tly1pvpngasx17dHeCrFBgwCdDcsWlY6JF2Rfv
         DtUGDRNjLvDX7q/EhIX5+Zra7JNUGTT6XdHjjcUoUEYKpPK1l64eSwK18qu46ZmZOu0i
         FcbeRC8BoL6z6d2kloF2XNqT4w83E2bEd1D50mljSjB5j56hKCMsPjknuVFwq/uPUjOe
         nIr9TkVWBPi0bmJF62J9mYiyHRFmQZgCmLWirYHnvKRcH75z+/S6w43UkwEpWD1s200E
         hpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525455; x=1740130255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptqpPfUGDg1EiuURg84FX6mkSOnefIkRazcht+VYCyI=;
        b=H9Yn+M7NAmg+UllaOMiR1VSZVgnXYVafwMUm8FXW7nWjOp8T52JwV4oBlUPpqn/sUk
         02Erx7ooqYHmoV9jvC1i9WJdd/gX4RZUQRXZehKbINFVs3/kildfDt8uSit2yuYh6QOV
         N63zA02qUGHhO80rFCGdpOfMInLliGKbZkG8Zvn3zwLyO+MNVGcJN5itwkTs8AskFz7b
         KQhMMElteMoFh3pjuCtNeX5buTGyig4vb9Eiwy3SQ4edc1F9Yr8s+RyMZVU5KmFC0kG5
         MCFbk+lduX1lV2WCA6dROP3LHw4FWyT51j2w3ZhLGxIYjiC3wVVcOqVku31GJBoTBok5
         STfA==
X-Forwarded-Encrypted: i=1; AJvYcCUUYHIfG0OK4cEqSl2S4xIIOWZpMoTnc67wDLRIXH3K+jnPQ1+SKXwTzsZMdffN2ValQL3Atqqc+vYU8cs=@lists.infradead.org, AJvYcCV8vikpdGa8C3SQGFzeuKP25M+f35kWK6jnt++Jc3K9ajlq0q79fQ/fVJcikqoPnr0/L3o3KOg79rsoNvNqdNDR@lists.infradead.org
X-Gm-Message-State: AOJu0YynPEpbs3g5O1GGG00z3OKnA/TZjXoB1QYBBIXP8hU3cwM23WhT
	Pj2BHafAngC60zFyGFfqTDcL/KoP862RdciYqFJudm3VX1AGKLep
X-Gm-Gg: ASbGncsWIv2W8QFV7qW0ggQX1PPDUziHewdLuH/bTIbD9+uN9XKvucultmYlq9YP0Ps
	7Gx46nRi/B+TvN1w5SAmWNH3ugAkR+aooYK9knf4Q1PE87W+LsHpbT+oeo/qMKu81YrTs+H6SZX
	CcoZzLuw7Zp/G2y9+yvKxr2RmzbYMwx0v7u7MR1qJIhp/duI3gvQjdDRwA+5T5KPGin/tFR63nG
	uSTkVM6qEn8gE6UX6gOuo39JkMfgDF/t53Nj4Sd7a4DZ930d2mas42zpNBj1VIr7jIdDCLzkDrz
	IXkZWnHVi7vOxK2NLvUE70WsuDFLnS4=
X-Google-Smtp-Source: AGHT+IH6XcRb3dY+ed+qthaJ3tDEtbZeAuAInUKd60UoN8JUd4P8SIptONXNJZy3ckuGqMfBoSS1OA==
X-Received: by 2002:a17:902:f545:b0:216:393b:23d4 with SMTP id d9443c01a7336-220bbab0e0cmr183420735ad.11.1739525455176;
        Fri, 14 Feb 2025 01:30:55 -0800 (PST)
Received: from Barrys-MBP.hub ([118.92.30.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c814sm25440515ad.148.2025.02.14.01.30.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Feb 2025 01:30:54 -0800 (PST)
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
Subject: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Fri, 14 Feb 2025 22:30:14 +1300
Message-Id: <20250214093015.51024-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250214093015.51024-1-21cnbao@gmail.com>
References: <20250214093015.51024-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_013056_211867_8FAA9AC7 
X-CRM114-Status: GOOD (  20.64  )
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
 mm/rmap.c | 72 ++++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 22 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 89e51a7a9509..8786704bd466 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
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
+	if (pte_unused(pte))
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
@@ -1794,6 +1813,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	struct page *subpage;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
+	unsigned long nr_pages = 1, end_addr;
 	unsigned long pfn;
 	unsigned long hsz = 0;
 
@@ -1933,23 +1953,26 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			if (pte_dirty(pteval))
 				folio_mark_dirty(folio);
 		} else if (likely(pte_present(pteval))) {
-			flush_cache_page(vma, address, pfn);
-			/* Nuke the page table entry. */
-			if (should_defer_flush(mm, flags)) {
-				/*
-				 * We clear the PTE but do not flush so potentially
-				 * a remote CPU could still be writing to the folio.
-				 * If the entry was previously clean then the
-				 * architecture must guarantee that a clear->dirty
-				 * transition on a cached TLB entry is written through
-				 * and traps if the PTE is unmapped.
-				 */
-				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
+			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
+			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
+				nr_pages = folio_nr_pages(folio);
+			end_addr = address + nr_pages * PAGE_SIZE;
+			flush_cache_range(vma, address, end_addr);
 
-				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
-			} else {
-				pteval = ptep_clear_flush(vma, address, pvmw.pte);
-			}
+			/* Nuke the page table entry. */
+			pteval = get_and_clear_full_ptes(mm, address, pvmw.pte, nr_pages, 0);
+			/*
+			 * We clear the PTE but do not flush so potentially
+			 * a remote CPU could still be writing to the folio.
+			 * If the entry was previously clean then the
+			 * architecture must guarantee that a clear->dirty
+			 * transition on a cached TLB entry is written through
+			 * and traps if the PTE is unmapped.
+			 */
+			if (should_defer_flush(mm, flags))
+				set_tlb_ubc_flush_pending(mm, pteval, address, end_addr);
+			else
+				flush_tlb_range(vma, address, end_addr);
 			if (pte_dirty(pteval))
 				folio_mark_dirty(folio);
 		} else {
@@ -2027,7 +2050,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 					 * redirtied either using the page table or a previously
 					 * obtained GUP reference.
 					 */
-					set_pte_at(mm, address, pvmw.pte, pteval);
+					set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
 					folio_set_swapbacked(folio);
 					goto walk_abort;
 				} else if (ref_count != 1 + map_count) {
@@ -2040,10 +2063,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
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
 
@@ -2108,13 +2131,18 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
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


