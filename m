Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E0EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziyOxc8kPU1zkWqQd/xo7T152fH4QK1CRdbLsKeEh/w=; b=al/4Qf52Kekx+yPn1x7YXlxWL+
	tfQ+v+KYNtrsuP3Zel1KIOUGAAAgOsFcBacQfUHa0KCjSlNs9pty1erNEGEYfo/2FfNnZQHmovskP
	K8xSnco+3cPnvvPOqsNUgWqS2wqq3AMTpiOLjBbIcFYX8symOAFE9G6X6L9+zKISzo0nCLqAa92u+
	NtgIbl5PX8lkBmEWv7U550pf5q0dBetQnyrJCCKR+Ij1RYayagy29sVsFMUtsUjC8NAdFGeRlbb7t
	qYPKjcspQusInOQHN7Pj/5kvePmkosJ7M/IjUXN0EUr7FjPHwJtrI8urLlms1mhipKRrlNPpNsLxK
	q4hmNcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhO-0000000GCCo-0GKT;
	Wed, 08 Jul 2026 03:11:46 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhF-0000000GC6b-2xxx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:40 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2ca0481106cso3703575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480297; x=1784085097; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziyOxc8kPU1zkWqQd/xo7T152fH4QK1CRdbLsKeEh/w=;
        b=VgGZZzCCPtbTGMyKo4OBI/sleFQfnrH8nUnaC8ggYCRrtkscer5yQMCqwD7KZ0nrjI
         cLCMoRAwgsnpwoOY3J1brZvr/fBQ7efgxUySmXpB1dqezlV7wG7TsE9sys4+qMP+ylju
         rKmRhncVQI+z+Ybk6EcJr4iXr9ui8K0CFOKe8tIiP5GqVS8WedwLeH61xFk86HL2x8o2
         GJC/jUpeQlozyXl4OtFdkFDa2kNlN0Y9YJ8CJnfObpy7IfyC008oGKFC0k5qewe9qVrG
         q8c5oAELV+SgtiKVvFs1FcRWm+rOOUGf2QlFC/bBM3TTCJMO4Ee/vQyh+JidIagksUUY
         rEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480297; x=1784085097;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziyOxc8kPU1zkWqQd/xo7T152fH4QK1CRdbLsKeEh/w=;
        b=nDaYbERLhF5slO6TSf578XalZQHfzbPUuqsCkmph3u1h8FhuWvf0tQdW5m9tLiyy5b
         SMDSH44VqV42Tks2dKYnKGUlOvsF3Yfd/AUZ7/axxPHb2FZlRLu9shh02oo8vWLGMDl9
         4cG0Ygn6XKDAy86tPghDs5dwd+erTJm5/2Xffgt1j01B2qAkVlHIwwbhdluYP9C0n0IW
         648C9yUyxCuPSmTKGgKvpw7xdjcZPvuCioVi3uqtAR4l+KLMGIO0D0tGhSUrY9D3xq6q
         4WlbHl9KXF5+ryR+X6PA5VT69i18CasFzIK852vpQTfFikq9QuPn68hRnt3X5ZP2nhHT
         jIOQ==
X-Forwarded-Encrypted: i=1; AHgh+Roa36UZyplIHglKbBvWuxhKAsZsSHElLfVyo1ouspSGzoB+6jDAz5YqK25JzypctIZ8Zo+nMNCoMJzYRt+MElow@lists.infradead.org
X-Gm-Message-State: AOJu0YxRBil7P31XLei8RuXni5XhpY8Fp+0OuukMUShLKp6RYbCSZtgm
	wa3vGk4k57f155foxHALSSWpZ/qYEFUAuDfRNJVxzuari7MyAdmk5QTEhwDGepiyjXDb7SNYnnf
	3x1CpoQ13QJo4DTH4iiNCvA==
X-Received: from plbkv5.prod.google.com ([2002:a17:903:28c5:b0:2ca:d66c:97b2])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1c9:b0:2cc:86a9:ebfb with SMTP id d9443c01a7336-2ccea47c361mr7188645ad.33.1783480296362;
 Tue, 07 Jul 2026 20:11:36 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:13 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-4-jthoughton@google.com>
Subject: [PATCH 03/18] hugetlb_vmemmap: Leave pages partially HVOed upon
 restore failure
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201137_833173_18E64D10 
X-CRM114-Status: GOOD (  22.91  )
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

Right now it is assumed that the restore routine in vmemmap_remap_free()
will not fail; that is, if we fail to fully optimize a folio, it is
assumed that restoring the folio to its pre-HVO state is guaranteed to
succeed.

Although vmemmap restoration may never fail in practice, properly handle
such failure cases now. This will leave folios in a partially HVOed
state. In a follow-up patch, failure certainly becomes possible.

In the event we end up with partially-HVOed folios, make sure to:
  1. Leave the HVO page flag in place.
  2. Free any unused vmemmap pages.

Always pass the vmemmap_tail page to the restore routine to avoid
leaking the non-optimized vmemmap pages for a partially HVOed page.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 49 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 8d4e8ee51fdd..5fee01bf5b34 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -236,12 +236,15 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 {
 	struct page *src = pte_page(ptep_get(pte)), *dst;
 
+	if (WARN_ON_ONCE(!walk->vmemmap_tail))
+		return;
+
 	/*
-	 * When rolling back vmemmap_remap_free(), keep the copied head page
+	 * When restoring a partially-HVOed page, keep the copied head page
 	 * mapping and restore only PTEs currently pointing at the shared tail
 	 * page.
 	 */
-	if (walk->vmemmap_tail && walk->vmemmap_tail != src)
+	if (walk->vmemmap_tail != src)
 		return;
 
 	VM_WARN_ON_ONCE(PageHead((const struct page *)addr));
@@ -277,6 +280,7 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 	return vmemmap_remap_range(start, end, &walk);
 }
 
+static const int VMEMMAP_REMAP_INCOMPLETE = 1;
 /**
  * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
  *			to use @vmemmap_head/tail, then free vmemmap which
@@ -291,7 +295,8 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
  *		responsibility to free pages.
  * @flags:	modifications to vmemmap_remap_walk flags
  *
- * Return: %0 on success, negative error code otherwise.
+ * Return: %0 on success, VMEMMAP_REMAP_INCOMPLETE if the page is incompletely
+ *         optimized, negative error code otherwise.
  */
 static int vmemmap_remap_free(unsigned long start, unsigned long end,
 			      struct page *vmemmap_head,
@@ -326,7 +331,8 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 		.flags		= 0,
 	};
 
-	vmemmap_remap_range(start, end, &walk);
+	if (vmemmap_remap_range(start, end, &walk))
+		return VMEMMAP_REMAP_INCOMPLETE;
 
 	return ret;
 }
@@ -385,6 +391,8 @@ static struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
  * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
  *			 to the page which is from the @vmemmap_pages
  *			 respectively.
+ * @h:		the hstate for the folio whose vmemmap is getting remapped
+ * @folio:	the folio whose vmemmap is getting remapped
  * @start:	start address of the vmemmap virtual address range that we want
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
@@ -393,20 +401,35 @@ static struct page *vmemmap_get_tail(unsigned int order, struct zone *zone)
  *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
+static int vmemmap_remap_alloc(const struct hstate *h, struct folio *folio,
+			       unsigned long start, unsigned long end,
 			       unsigned long flags)
 {
 	LIST_HEAD(vmemmap_pages);
-	struct vmemmap_remap_walk walk = {
+	struct vmemmap_remap_walk walk;
+	struct page *vmemmap_tail;
+	int ret;
+
+	vmemmap_tail = vmemmap_get_tail(h->order, folio_zone(folio));
+	if (WARN_ON_ONCE(!vmemmap_tail))
+		return -ENOMEM;
+
+	if (alloc_vmemmap_page_list(start, end, &vmemmap_pages))
+		return -ENOMEM;
+
+	walk = (struct vmemmap_remap_walk) {
 		.remap_pte	= vmemmap_restore_pte,
+		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= &vmemmap_pages,
 		.flags		= flags,
 	};
 
-	if (alloc_vmemmap_page_list(start, end, &vmemmap_pages))
-		return -ENOMEM;
+	ret = vmemmap_remap_range(start, end, &walk);
 
-	return vmemmap_remap_range(start, end, &walk);
+	/* Not all pages may have been consumed */
+	free_vmemmap_page_list(&vmemmap_pages);
+
+	return ret;
 }
 
 static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
@@ -439,7 +462,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	 * When a HugeTLB page is freed to the buddy allocator, previously
 	 * discarded vmemmap pages must be allocated and remapping.
 	 */
-	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
+	ret = vmemmap_remap_alloc(h, folio, vmemmap_start, vmemmap_end, flags);
 	if (!ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
@@ -572,7 +595,11 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 				 vmemmap_head, vmemmap_tail,
 				 vmemmap_pages, flags);
 out:
-	if (ret)
+	/*
+	 * If ret == VMEMMAP_REMAP_INCOMPLETE, the folio might be partially
+	 * HVOed. Leave the HVO page folio flag in place.
+	 */
+	if (ret < 0)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
 	return ret;
-- 
2.55.0.795.g602f6c329a-goog


