Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CFFC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 17:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpNZRbQ47/WqGdrrUHhpvYqGIuM8bItP00+DgG6LDXo=; b=GBq2T/Lx2CcFLaDe3a1W5oZFyL
	uhG+zikyYGd+zrD/SuXjXhaORova4zDfobLRGsWjIC888beRHw/7KuulRS7rdu0roHVAbh/ZHiWIq
	cUYsCTR7R9iZ+5GeEe9I04sJEuVxm0Yj+b0KJ9vvVAGMHn+xmbMwc3ISy81KgIqlSrsHOaI/E7Hh2
	xxoznJ3Wa4gpQdZImVe2FmQpNvINOd4PvdN+gNF3/4PusnSZDmMTb70p+c4TR7Wu5lrNC19HGDoR4
	Kdb9tpoGT8jOVjIkyyBPodTSM81vBjjn7459KBUYLnLRKx7M8UhUIJZtHcafMOSZu4qgQGZEtdriE
	AQMpqy+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklwR-00000002niy-0Xtb;
	Fri, 17 Jul 2026 17:01:39 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wklwN-00000002nhz-2xvm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 17:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=PpNZRbQ47/WqGdrrUHhpvYqGIuM8bItP00+DgG6LDXo=; b=eg8ad3RiFa8lAL5pChcMMgF1Si
	LEbP5CZ1dBogtdyeKd+q0TUhTbit02LiVOpp6m6hBnGvr3J9MKzB6Gabf/w1RkeB/xjPyNSXCmw5n
	9x33pv/WFy+Cz5on5MbJSN3T/Z45sBaO10W/t8w9GivVYQG03zc6Xa/DNv1fDl/uDl2quDe+ASJIr
	08PV+2sy2+JnkIATDRgGx/E0LfZjXBGhUyOBCM4nxowH0d9AumHwwizfilLbnOyXaZdXf/Rwm9Mkf
	puhrOFc1ywQuSWaJpvYYHdbml9Y+yFXm6E4fQBHczEfQ91zkLtR2xjQlUqzJwkLH0P84hz83lyxP/
	etyWm5xg==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wklvS-000000001w4-0RAd;
	Fri, 17 Jul 2026 13:00:38 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-team@meta.com,
	Rik van Riel <riel@surriel.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Harry Yoo <harry@kernel.org>,
	Jann Horn <jannh@google.com>,
	Lance Yang <lance.yang@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH RFC v3 3/6] mm: rename get_user_page_vma_remote() to get_user_page_lookup_vma()
Date: Fri, 17 Jul 2026 13:00:33 -0400
Message-ID: <20260717170036.743149-4-riel@surriel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260717170036.743149-1-riel@surriel.com>
References: <20260717170036.743149-1-riel@surriel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_100135_750322_604C9E56 
X-CRM114-Status: GOOD (  14.83  )
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

This cleans up the name space for adding a get_user_page_vma() variant
where the caller already has the vma.

Assisted-by: Claude:claude-opus-4.8
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


