Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBC7CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SHdCJPwxJseGLQVvNpBndLozFHVWi7DqdUkRWyPzrM=; b=LF6ncoGlhUsbmIJU9FAi1LoD0O
	MFo6CQMKT39Sjq9iXhmx74tAttUScxlDgR8A8i0c1SkmDlYcWqipG3NugRRM1xhx9t00JyEXbhxeY
	8OAsWejma549+GPyTeScwtPZ3vKgL9i+B65cJocc/g/aNedifCSaUHDbC91jB/wOaOpdk/dQkNOjR
	ZKdBL50VZjAqwct8p0BUAG4fcLRtz1sbC3CODVPW/JrDKc1Z/gpeOO9cY/9vf0q2e7Wenp/ymFy1f
	FV1ryw6BLGZtqIe/eyrafhOig3Ld3yb8WjsWUOIJ9/ZLHKAVCnggexxljEhmkAyqHwL8C5VxJtT0h
	w4YVkeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVZ-0000000Cn8h-3AoT;
	Sat, 03 Oct 2026 00:21:45 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVT-0000000Cn1c-49kd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:41 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-887faaedb46so153032b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986898; x=1791591698; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SHdCJPwxJseGLQVvNpBndLozFHVWi7DqdUkRWyPzrM=;
        b=C5IGh0YaqsYJecUtJdL0MsdgivT6ZoVJBHNTS76Rd1V2gGaJgrdqXA7NAe2iN1ajR8
         ML3yvhkjN+RC74Vk93BtdJPNkxUIueGnO9Evls+Dg+SpJrCBezJzC3pFI3r8uQvDRtRs
         LyEgEtck0fe3In+rSMj69K4HlOE1C6qIMQjEg1mFQFUih4cmQI+c0TT5KKRqZhzAZCMn
         v8B5y6P/36DpscO3FW1OF6+G7R6PWEqoS9Y2fcSGvgKW9z5yChJjFMuzqYGmZdKPAN70
         CF6HMMh6sRdgLA+DY8Jav1dJoC964yRvkGVygEBqkqYKTTlGESKLQxReqopVgidnREgg
         UVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986898; x=1791591698;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SHdCJPwxJseGLQVvNpBndLozFHVWi7DqdUkRWyPzrM=;
        b=mMzmZbe19lkqHFZ5G1nbqk1fnAvC7aYHqrOCe3lmfof0nXyc4Rj4MwmfGvieUn2Ygk
         5gGUe7OrHo6DifKqR3F42e3yHZAXZ7nS8MRpb++Z9Z4aXK68X6lg9wvbjOjY0hckrvBI
         RrLjBs+LlAmuAXI2XBOIHsgemIDQNK+N+cu9FLJuK1tWxGfUwEsikKWLe3Z30Lae9D3A
         sq0cM2D7xT89BDoF9DXQgCXQF0cGbYTHzZcgbVZ2vI0P6VxNXn3vmSpZ67tTg0Md6Rdq
         +obE93l++rZF/Oy0FpQn5Ka2f3xsHDvBQxgCx9sIHvLscFTjwlOuUsh2GBGWPBreZ3zu
         chSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRhity0jWqzZlrZXuMo2oLzInGSBaXeTHJvVhoQ+XtaoB3oMzm7ngJNoEr9JOOCsIyage+ydZAAZNcGa/g2ozv@lists.infradead.org
X-Gm-Message-State: AFq9FYIOnc7AHItxfSjXmfyDEajj0bb+EiyDQXhquMx07s4wC7ZGsC+W
	+0C6dMK5je2tq9Blw/ycytiXGCcjjwNgdovnb5Uu8uVMHtskw0f48uxNXPf6Ej6iHberjDVkHq4
	qIcmNBJsnJUTc2p7sNnrMaw==
X-Received: from pfbf1.prod.google.com ([2002:a05:6a00:ad81:b0:88b:18fd:b97c])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3308:b0:886:cae0:fa28 with SMTP id d2e1a72fcca58-88c64645740mr768676b3a.40.1790986897754;
 Fri, 02 Oct 2026 17:21:37 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:07 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-5-jthoughton@google.com>
Subject: [PATCH v2 04/20] hugetlb_vmemmap: Leave pages partially HVOed upon
 restore failure
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
X-CRM114-CacheID: sfid-20261002_172140_047965_9E439025 
X-CRM114-Status: GOOD (  21.82  )
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
index 1a2645c382ba..90db4d069ff6 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -235,12 +235,15 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
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
@@ -276,6 +279,7 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
 	return vmemmap_remap_range(start, end, &walk);
 }
 
+#define VMEMMAP_REMAP_INCOMPLETE 1
 /**
  * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
  *			to use @vmemmap_head/tail, then free vmemmap which
@@ -290,7 +294,8 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end)
  *		responsibility to free pages.
  * @flags:	modifications to vmemmap_remap_walk flags
  *
- * Return: %0 on success, negative error code otherwise.
+ * Return: %0 on success, VMEMMAP_REMAP_INCOMPLETE if the page is incompletely
+ *         optimized, negative error code otherwise.
  */
 static int vmemmap_remap_free(unsigned long start, unsigned long end,
 			      struct page *vmemmap_head,
@@ -325,7 +330,8 @@ static int vmemmap_remap_free(unsigned long start, unsigned long end,
 		.flags		= 0,
 	};
 
-	vmemmap_remap_range(start, end, &walk);
+	if (vmemmap_remap_range(start, end, &walk))
+		return VMEMMAP_REMAP_INCOMPLETE;
 
 	return ret;
 }
@@ -358,6 +364,8 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
  * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
  *			 to the page which is from the @vmemmap_pages
  *			 respectively.
+ * @h:		the hstate for the folio whose vmemmap is getting remapped
+ * @folio:	the folio whose vmemmap is getting remapped
  * @start:	start address of the vmemmap virtual address range that we want
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
@@ -366,20 +374,35 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
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
+	vmemmap_tail = vmemmap_shared_tail_page(h->order, folio_zone(folio));
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
@@ -412,7 +435,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	 * When a HugeTLB page is freed to the buddy allocator, previously
 	 * discarded vmemmap pages must be allocated and remapping.
 	 */
-	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
+	ret = vmemmap_remap_alloc(h, folio, vmemmap_start, vmemmap_end, flags);
 	if (!ret)
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 
@@ -545,7 +568,11 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
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
2.56.0.rc1.315.gc6ed9934b7-goog


