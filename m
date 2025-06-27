Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C970DC7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mtGJ3hLLX6kLkhpS+Roj43p3ubAD6EYXh2l2qlYKI+A=; b=LuRqtrWm3xMIPcphk9u+zwVvt7
	HifM60KduS8DEXvj2LPQYtlYlp3mMUoOBa9NgskYtqD1Vf0yHsC5yy50p3IWyFxMguQH81EPwJY5S
	biaiyXYWKa1KcE4rPHnH3RLsWHH+pxrZ5OFM0CTUmZytMlr0U5hXWs3/ctaBE5PTFIF6NzV2AYBR+
	lJ9udXRK0baCp+9bsLiiOJgUxAVxu3+7DFbkU/8nfCvYr08OMwS4WBl9snfo17Zw+XiZ3vJdfGa90
	WSaGAnFvZ/PQQ/Yt+pQZupfJBwszyXZskHoxXDHOyDRQ09QbwuxWMvovYsVR7mcFEaiNy9mfjc5PX
	f5CMuHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2fh-0000000DiUH-3CrN;
	Fri, 27 Jun 2025 06:34:49 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2V0-0000000DhQC-0urL;
	Fri, 27 Jun 2025 06:23:47 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-453634d8609so12759715e9.3;
        Thu, 26 Jun 2025 23:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005425; x=1751610225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mtGJ3hLLX6kLkhpS+Roj43p3ubAD6EYXh2l2qlYKI+A=;
        b=l8C+9+wo4CFStPZtm+d/orhUtIcQ276QeTAJCLxMJ7RhMmgvDMJcunAQyHyHIS1TZq
         mWQf+15z9IUz8WheeU7H+OfEQ7pM76PUwH4Tb1zdLqjHZxjtcM0NpKMM0g6BzwrakilE
         qu4Z1ieYB1jxMciXOKLKoUqxYWGU6TO2Pa7OGiV0AJFH8DWEzus/uL5CGPEvwDlHsDW4
         yVtnJ4B+heQpEhU+KIls1gHTrjoP2lxcoINoHF7g9z9Lw7HBg+pVCosY5vZD1XkS3Fld
         UdzYuAGB15wVpsQwYCIHIMBnWJJnmy/I5Bzkwq54b+nRGHcQ9oj0FOrLK9CRo3VBC2di
         dGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005425; x=1751610225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtGJ3hLLX6kLkhpS+Roj43p3ubAD6EYXh2l2qlYKI+A=;
        b=xKr+j3xhplGknAep3Mj/dI71Mdt9HFdK5LslEEzVnfqGMeK+GIbfzq535O90Vp4r+e
         aXJ8dVjgE6zhQI368j2ifQozXOjmN/cTEhMt5FALociEqCGRp6jryj6k9hTl2RCcNRir
         9+yWH7MsraCX0yCEeKAH5yIgNGwgTSDyBy8lc1QBqZWsPjdjbV+KXT+U/nRqsfyxpQnH
         skB+BppHHvAKqoIWC3/9si+EILIlZIF+oqX2NvVK2JHr2xWvfaRvadC93QO80NPWugGO
         2SUkWsaVDNlsbGoDCjT5B1BxK/HCyrwmg75d2CbgWZtXcWWPhQCxuzvRlHiZnRJF+aPv
         3+GA==
X-Forwarded-Encrypted: i=1; AJvYcCV2adrYhjNHBVqA4a234PJ6weNN5nzvEYbJr6n95jPGpWC/fyOO+bALyMASUoXkC+3ua5rQ3qpJh+zCQec=@lists.infradead.org, AJvYcCV7Sy3c0pQDl0wmyJAKxrImCitYoE8YbXw/9YUWJkiHZp05sxNV1t2Qu/cHU1W92cXoGBzXXEvlJxUFT0JF21+B@lists.infradead.org
X-Gm-Message-State: AOJu0YxZRT18Llpcp/p6Z7UvqM6wdVl1lf67lne2gCcKvz4RDY6zhj9H
	N6UlV0dXZtTLqofg0tDUv4CW/dnMq84FpwoXdWwxtikOmm7v6OWw7GIy
X-Gm-Gg: ASbGncvYF/zRlw9eLDGMXAbL9rozzHps17H1gvcfMlnP3STwBES0TaHhNuNFJFMfFow
	gQgucgf0iqxYFs+5H0RZu158ITE4oze2yLBCMYJEQWgmklr9n/1daPGgLs/A/o1EdjKa52vcFzs
	1eqj3uA9jM4u65weKqqwGwaQNyzsIVDyRlrc9Q8uCEvwFoewbGv9CBEjZ6/f5zI/rmEcpIL86qu
	ihzPpDf7+dAix/4XVAl5HpNU5ATu/nMkighJX6HhHyqbGZWOCx96p0hXW5COS1mVQI1cjuKtTro
	GOyno3on4rxNQZw0G/opcbjr87N717eJmHUy+sWJVEqYG0yN
X-Google-Smtp-Source: AGHT+IEoFmH9LFHUYF3P7bOEbto60ZCDPCXGpSefiJHXbVDjvZl7uEcOX8LVwFH/mVmusY3MGMlK3g==
X-Received: by 2002:a05:600c:c4ac:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-4538ee85615mr17039465e9.22.1751005424277;
        Thu, 26 Jun 2025 23:23:44 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::302c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8b6sm1792296f8f.91.2025.06.26.23.23.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 23:23:43 -0700 (PDT)
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
Subject: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table access during batched unmap
Date: Fri, 27 Jun 2025 14:23:19 +0800
Message-ID: <20250627062319.84936-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_232346_260048_C2F1527C 
X-CRM114-Status: GOOD (  18.47  )
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
can read past the end of a PTE table if a large folio is mapped starting at
the last entry of that table. It would be quite rare in practice, as
MADV_FREE typically splits the large folio ;)

So let's fix the potential out-of-bounds read by refactoring the logic into
a new helper, folio_unmap_pte_batch().

The new helper now correctly calculates the safe number of pages to scan by
limiting the operation to the boundaries of the current VMA and the PTE
table.

In addition, the "all-or-nothing" batching restriction is removed to
support partial batches. The reference counting is also cleaned up to use
folio_put_refs().

[1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com

Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
Cc: <stable@vger.kernel.org>
Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Barry Song <baohua@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
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


