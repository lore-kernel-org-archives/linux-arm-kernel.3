Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D931EC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 22:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDlbQ/k/gKhextbIPqwqCwZ5BabZN9oEFBEjCjmG3eE=; b=WiX3f0p1J55of8pkhIgKPKHC47
	+l2uXA/vtSGrNfE5jAlY7SyYxCkoO3ua85phD8gzAxSxuY0BECFqjFgkE/UarkV+8KJ9XzRCvMszm
	981Hds2DgOWwqQ8j0QWCBV6J7IouW5xt/xdLtKiqFJ3e5FYDmLcwvVQUK9ygxJ/CkwRZv1Zp1+Phb
	JuBuUq6pju7k1TE0HHA98toj7fQWqXwNLghXgwbaDHkMh7PK9k8GLiEWVuqEc4JMlmHtvMHX8NP8x
	xUMs/wilyB+sDR++YbEh5VBaWjer7yCK91kUihBL1PETwI86pGWBUUIHQ/4ZUT7UHZaEsJFUMi2L4
	XIc2dTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOQu-0000000HJby-0JnA;
	Fri, 24 Jul 2026 22:31:56 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnOQr-0000000HJbA-3n9w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 22:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=qDlbQ/k/gKhextbIPqwqCwZ5BabZN9oEFBEjCjmG3eE=; b=RVCkNQ0hfcZsXJGNqnk2s4AJat
	5GNYVKosxlBdUigBnazluK5OVF0UCUomWI4E0gm1sKSyQ2DpZ+Ve3tIRlSFSnuh2kflmXApNDjUUy
	gxxxgxZDK+Zu5kiplzcnWTHxBVCkgfs3azyY4shlHCrtJXqFOOpJwEQwoT59m8dBOlzuDGVHaelLx
	9vu7z4jFwPmPhdj9bAGq53MEVutyT93H6mHz4OREXM9GZBMKTOl1XR7MZjlGNdhiKzL/CVQTn0RWx
	GCawa8mEsly9K9s3yOHmXaRVfdOenUeerOK0giEoty7aWhdLSK/ThtyzZ3pM42YvYQPfRKES+Rp9i
	Oa/5MXxQ==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wnOOs-0000000027h-1CWq;
	Fri, 24 Jul 2026 18:29:50 -0400
From: Rik van Riel <riel@surriel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Rik van Riel <riel@surriel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	Usama Arif <usama.arif@linux.dev>
Subject: [PATCH RFC v4 03/12] mm: rename get_user_page_vma_remote() to get_user_page_lookup_vma()
Date: Fri, 24 Jul 2026 18:29:25 -0400
Message-ID: <20260724222934.1463812-4-riel@surriel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724222934.1463812-1-riel@surriel.com>
References: <20260724222934.1463812-1-riel@surriel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_153153_952839_7493DACA 
X-CRM114-Status: GOOD (  15.59  )
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

get_user_page_vma_remote() faults in the page at @addr in a remote mm and
also looks up the VMA that covers it, handing both back to the caller.

This cleans up the namespace for adding a get_user_page_vma() variant where
the caller already has the vma.

No functional change intended.

Assisted-by: Claude:claude-opus-4.8
Acked-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/arm64/kernel/mte.c   | 2 +-
 arch/x86/kernel/uprobes.c | 2 +-
 include/linux/mm.h        | 2 +-
 mm/memory.c               | 4 ++--
 mm/rmap.c                 | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 1a9aad6ef22a..7a6ecc3d9294 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -459,7 +459,7 @@ static int __access_remote_tags(struct mm_struct *mm, unsigned long addr,
 		struct vm_area_struct *vma;
 		unsigned long tags, offset;
 		void *maddr;
-		struct page *page = get_user_page_vma_remote(mm, addr,
+		struct page *page = get_user_page_lookup_vma(mm, addr,
 							     gup_flags, &vma);
 		struct folio *folio;
 
diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 3af979fb41d3..329efac0cfb3 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -1036,7 +1036,7 @@ static int copy_from_vaddr(struct mm_struct *mm, unsigned long vaddr, void *dst,
 	struct vm_area_struct *vma;
 	struct page *page;
 
-	page = get_user_page_vma_remote(mm, vaddr, gup_flags, &vma);
+	page = get_user_page_lookup_vma(mm, vaddr, gup_flags, &vma);
 	if (IS_ERR(page))
 		return PTR_ERR(page);
 	uprobe_copy_from_page(page, vaddr, dst, len);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 485df9c2dbdd..24ead14b4790 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3238,7 +3238,7 @@ long pin_user_pages_remote(struct mm_struct *mm,
 /*
  * Retrieves a single page alongside its VMA. Does not support FOLL_NOWAIT.
  */
-static inline struct page *get_user_page_vma_remote(struct mm_struct *mm,
+static inline struct page *get_user_page_lookup_vma(struct mm_struct *mm,
 						    unsigned long addr,
 						    int gup_flags,
 						    struct vm_area_struct **vmap)
diff --git a/mm/memory.c b/mm/memory.c
index ff338c2abe92..3b86eeaf084f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7039,7 +7039,7 @@ static int __access_remote_vm(struct mm_struct *mm, unsigned long addr,
 		void *maddr;
 		struct folio *folio;
 		struct vm_area_struct *vma = NULL;
-		struct page *page = get_user_page_vma_remote(mm, addr,
+		struct page *page = get_user_page_lookup_vma(mm, addr,
 							     gup_flags, &vma);
 
 		if (IS_ERR(page)) {
@@ -7167,7 +7167,7 @@ static int __copy_remote_vm_str(struct mm_struct *mm, unsigned long addr,
 		struct page *page;
 		struct vm_area_struct *vma = NULL;
 
-		page = get_user_page_vma_remote(mm, addr, gup_flags, &vma);
+		page = get_user_page_lookup_vma(mm, addr, gup_flags, &vma);
 		if (IS_ERR(page)) {
 			/*
 			 * Treat as a total failure for now until we decide how
diff --git a/mm/rmap.c b/mm/rmap.c
index 1c77d5dc06e9..b36f2e219b8f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2838,7 +2838,7 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	 * (non-device-exclusive) PTE and issue a MMU_NOTIFY_EXCLUSIVE.
 	 */
 retry:
-	page = get_user_page_vma_remote(mm, addr,
+	page = get_user_page_lookup_vma(mm, addr,
 					FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
 					&vma);
 	if (IS_ERR(page))
-- 
2.53.0-Meta


