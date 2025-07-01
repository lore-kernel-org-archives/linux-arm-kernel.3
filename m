Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7999FC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Yt3x3zsr5fbqG+1bODhLJma2AVCo1fUrMLDWbtz//4=; b=dMQVcPYYLGgYqk+c7Ehjt7RZo8
	RFESsxhce8KZk1lga7sgm1G0HARIq1Zg76NUz+KWpWXBGUkGzAc+tVZtRM8BLbWC0B4rWNhs5A/93
	W2/j3y2ELPHEuTovdB7JbLRcTyTnnlWQbMPuKI27W2pg3sgOw2O19VZIsDYl7/wFdpVfvrYPnsveb
	ThUePjq5nEMINIninFxjglSDDPz4KTCxsRB0LqDM64YPDuZF5cmS1lkrWF4aw3BfUc3eI1tWV6Ezd
	aHl9JLy4bOwdHk4rSzucHZXg7eJunxfJoft0/1hnrkezmIT6mbxWaZMJ2Blg+DFok0VdiSFn8Ho0z
	4aNYbIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdhs-000000060mc-1m4j;
	Tue, 01 Jul 2025 16:19:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWc39-00000005imt-1HdL;
	Tue, 01 Jul 2025 14:33:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-453634d8609so41024215e9.3;
        Tue, 01 Jul 2025 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751380409; x=1751985209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Yt3x3zsr5fbqG+1bODhLJma2AVCo1fUrMLDWbtz//4=;
        b=SYCdfMwpn+IjQaeEZwp7FaaOfX8+A9UcpmDTtA5F0xQkgZ0D2Et3oZxGsIv6xKbk6S
         3idP+EloVMH+Dyrn3fFoKGf/pR1CJquCG0kM4lgViEuIIp5xGB8i/+E3ABrZfbciMgXI
         PkA7K+vuPpEZyXMz/4ao6IOBArLmy+dAF9BXDNG3MnA3QZNhXmC/7e2CqKISMiOEgR3I
         EN6UG3VDXYUjQ6k4e/sj6sewhBWd2/ercitidtRr0nqK7KP5I5sXxvO9hmDPDYnT2MM6
         pfCZPoYmXnhzeY8UXvdsrbkSpCO9QoK1N0bw1h9YZjAWJDT8woB2rmJuKTlkm132afwl
         q3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751380409; x=1751985209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Yt3x3zsr5fbqG+1bODhLJma2AVCo1fUrMLDWbtz//4=;
        b=gj2Nm3f0+Ct/nXTLOe8ULyewT+G+RsKdnyLsgHyYWodYSVGs1tLvfQOCZBtdCNr8jU
         /0p+ZB6sfvNKM8w86+sbctNOayeG5fudLoN4Doh8FsFEcTj0FIi5CmqJarRiyfO2oax3
         CR6vL/AwziMmVspUy8oxEeq6/yErSaTVKKdjtlUhk5jG23xb7Dwj4SPXjgqcaw3ID0I1
         44pCns0CSP7xMAMTBKVdrxYBL4X6Inc216vJa39vEGfR2vtLkxIwJh5qbxh5lfZL35P/
         3/jX6hAF/D1Gn/TC6KcXcj9fmTiZ21CIm/aO6IA4EWze1lGzc74oSRGEZNYNmJqUNtBz
         nYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Q0pss8T8/PopOVohoRpGn1QqFeYWmUb5mrSIaWqpyNehJ1J3uhxOU1mJbwKWWQHn8Dwy/q33f8CNwos=@lists.infradead.org, AJvYcCXMt+BIHL9lmskqp2smuI/3GROeuphGf8sSXZevOvDFo+3b6M6K2SHltfDWO1DkbxLHjNVaWyZsyxjTCvIWVIXx@lists.infradead.org
X-Gm-Message-State: AOJu0YwNUTMJHf4d1ZZY3ovEY07cmrPI0wuYosCjVpNNHMNEe135nLhf
	xxQTaK4E8N5FvUJbXGaaUAn0pH2wR2KhySwri7Z8KvA+VdTh5xLjp31S
X-Gm-Gg: ASbGncs6fBLxdjJzxjURhtOxZkI22bVyzJ3ZHyrqh0mnoE/7swU1zjb1tOnkZ5fVayK
	B+qiT/s+QWn/3jwWEZRZZPMMOakexbsC80iftXzWTZSAVVGbCjsbl0gKLdQgPN5yqceiovqOwjC
	r7ls1RXrZsoanUiJOuoOKlYVlBrhwZsKaUamcnybiQqwHlR8Zuqr6GUhmBkaNZpG1z+7RiilWao
	tME+c052Vevl20onZC5Qa/UvGT/t3fI1vQXcPitMsVjY4XWoTZG+JcwKMaHYrW+NqUhTkwfgMtL
	xmCZYk3hPz9jSIXv4b/bsJ8DjUVisDbpkIezx4GA2Mq2GRb91H4=
X-Google-Smtp-Source: AGHT+IHdbiNvZTIGRfHjK3LlOcp8azh08Vy9sNOtWFRXMMltik4m+thxSCZBh8cytvB5myfYwyr7/g==
X-Received: by 2002:a05:600c:1e8a:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-4539551fea8mr127351845e9.27.1751380408083;
        Tue, 01 Jul 2025 07:33:28 -0700 (PDT)
Received: from localhost.localdomain ([2a09:0:1:2::305e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe592sm163990875e9.21.2025.07.01.07.33.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Jul 2025 07:33:27 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org,
	david@redhat.com,
	21cnbao@gmail.com
Cc: baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	huang.ying.caritas@gmail.com,
	zhengtangquan@oppo.com,
	riel@surriel.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	harry.yoo@oracle.com,
	mingzhe.yang@ly.com,
	stable@vger.kernel.org,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table access during batched unmap
Date: Tue,  1 Jul 2025 22:31:00 +0800
Message-ID: <20250701143100.6970-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_073331_346286_E01583D0 
X-CRM114-Status: GOOD (  19.91  )
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

From: Lance Yang <lance.yang@linux.dev>

As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
may read past the end of a PTE table when a large folio's PTE mappings
are not fully contained within a single page table.

While this scenario might be rare, an issue triggerable from userspace must
be fixed regardless of its likelihood. This patch fixes the out-of-bounds
access by refactoring the logic into a new helper, folio_unmap_pte_batch().

The new helper correctly calculates the safe batch size by capping the scan
at both the VMA and PMD boundaries. To simplify the code, it also supports
partial batching (i.e., any number of pages from 1 up to the calculated
safe maximum), as there is no strong reason to special-case for fully
mapped folios.

[1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com

Cc: <stable@vger.kernel.org>
Reported-by: David Hildenbrand <david@redhat.com>
Closes: https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com
Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
Suggested-by: Barry Song <baohua@kernel.org>
Acked-by: Barry Song <baohua@kernel.org>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
v3 -> v4:
 - Add Reported-by + Closes tags (per David)
 - Pick RB from Lorenzo - thanks!
 - Pick AB from David - thanks!
 - https://lore.kernel.org/linux-mm/20250630011305.23754-1-lance.yang@linux.dev

v2 -> v3:
 - Tweak changelog (per Barry and David)
 - Pick AB from Barry - thanks!
 - https://lore.kernel.org/linux-mm/20250627062319.84936-1-lance.yang@linux.dev

v1 -> v2:
 - Update subject and changelog (per Barry)
 - https://lore.kernel.org/linux-mm/20250627025214.30887-1-lance.yang@linux.dev

 mm/rmap.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..1320b88fab74 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1845,23 +1845,32 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
 #endif
 }
 
-/* We support batch unmapping of PTEs for lazyfree large folios */
-static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-			struct folio *folio, pte_t *ptep)
+static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
+			struct page_vma_mapped_walk *pvmw,
+			enum ttu_flags flags, pte_t pte)
 {
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
-	int max_nr = folio_nr_pages(folio);
-	pte_t pte = ptep_get(ptep);
+	unsigned long end_addr, addr = pvmw->address;
+	struct vm_area_struct *vma = pvmw->vma;
+	unsigned int max_nr;
+
+	if (flags & TTU_HWPOISON)
+		return 1;
+	if (!folio_test_large(folio))
+		return 1;
 
+	/* We may only batch within a single VMA and a single page table. */
+	end_addr = pmd_addr_end(addr, vma->vm_end);
+	max_nr = (end_addr - addr) >> PAGE_SHIFT;
+
+	/* We only support lazyfree batching for now ... */
 	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
-		return false;
+		return 1;
 	if (pte_unused(pte))
-		return false;
-	if (pte_pfn(pte) != folio_pfn(folio))
-		return false;
+		return 1;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
-			       NULL, NULL) == max_nr;
+	return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+			       NULL, NULL, NULL);
 }
 
 /*
@@ -2024,9 +2033,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			if (pte_dirty(pteval))
 				folio_mark_dirty(folio);
 		} else if (likely(pte_present(pteval))) {
-			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
-				nr_pages = folio_nr_pages(folio);
+			nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
 			end_addr = address + nr_pages * PAGE_SIZE;
 			flush_cache_range(vma, address, end_addr);
 
@@ -2206,13 +2213,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			hugetlb_remove_rmap(folio);
 		} else {
 			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
-			folio_ref_sub(folio, nr_pages - 1);
 		}
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
-		folio_put(folio);
-		/* We have already batched the entire folio */
-		if (nr_pages > 1)
+		folio_put_refs(folio, nr_pages);
+
+		/*
+		 * If we are sure that we batched the entire folio and cleared
+		 * all PTEs, we can just optimize and stop right here.
+		 */
+		if (nr_pages == folio_nr_pages(folio))
 			goto walk_done;
 		continue;
 walk_abort:
-- 
2.49.0


