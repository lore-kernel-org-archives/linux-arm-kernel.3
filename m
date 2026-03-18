Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A97F103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJu5x2uLTjIhsDpuoLPzs71v39SAQiFydPYWvdNiy2Y=; b=KMfgoB10/XF1U5c9OvsRJafm+l
	kd4C4kNWuugmIcLPNWMjXa9K7zNsWH8eJP+FliMisxUWOoD5B3WEYx03EtLgyjFUeEZQjYJP8NkJR
	xmWwVkSB8MluTiIzemK8LOsXUxikp9upJb5H+43lZ2KE++5HMmm4jARRfhsm+wxtQ7P15Ch7t6xoQ
	buYoLZJMmEcB9FxfHJD55ynD7uWWoK/dpo9752shUqoEhkyZt1QdIDHtg8hNL4k6sZR9ciQPKDkX1
	knd8TygAOVhxU7coTXNKXmY4HjaBXtGDcBM/9zfjrPIcAWFoD9lC1GANauTqwWEWpIswFmlbtU+5U
	mOiLBVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ocm-00000008FlK-0BJI;
	Wed, 18 Mar 2026 10:59:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ocj-00000008Fjb-40BH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:59:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B6E96013A;
	Wed, 18 Mar 2026 10:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2464EC2BCB3;
	Wed, 18 Mar 2026 10:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831576;
	bh=3jRGnlRsbxlziNoo+921sbArWCqbGJ6zS/W7kucFKbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AYu8UWE0uFP7kB52RIh6t5RHb8Lm82CthAw5o2Oz3/zBoVceCs4mevcwy6gXgoXy3
	 zXfPELcxFDWWiacgMliiuggXx4CV15PRxM42zTRXwcC3AeoBO09S3lAQHEwKxmkc7u
	 S7zXJ3CpTFE4MwPOLMtCKjhcoKMWuzWjdNv96Yp+/yqtszyHDPqhX4x4WIqEjLXCRy
	 S3fvXz5m7LXo+SKILBEx1LpyBkMBSiLRc03d6ukL/MmLsvH4qH3q9/64XLA1d9HPwg
	 5R9bM+nCssf+m8rw1md06HV3Yf1v3AkdohGI5IDu5nkObk79u9DBk47nkf1xIJ97j2
	 QS9n6tdkUUzmA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andreas Larsson <andreas@gaisler.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jan Kara <jack@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 5/8] memblock: extract page freeing from free_reserved_area() into a helper
Date: Wed, 18 Mar 2026 12:58:24 +0200
Message-ID: <20260318105827.1358927-6-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318105827.1358927-1-rppt@kernel.org>
References: <20260318105827.1358927-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

There are two functions that release pages to the buddy allocator late in
the boot: free_reserved_area() and memblock_free_late().

Currently they are using different underlying functionality,
free_reserved_area() runs each page being freed via free_reserved_page()
and memblock_free_late() uses memblock_free_pages() -> __free_pages_core(),
but in the end they both boil down to a loop that frees a range page by
page.

Extract the loop frees pages from free_reserved_area() into a helper and
use that helper in memblock_free_late().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/memblock.c | 55 +++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 27d4c9889b59..87bd200a8cc9 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -893,26 +893,12 @@ int __init_memblock memblock_remove(phys_addr_t base, phys_addr_t size)
 	return memblock_remove_range(&memblock.memory, base, size);
 }
 
-unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
+static unsigned long __free_reserved_area(phys_addr_t start, phys_addr_t end,
+					  int poison)
 {
-	phys_addr_t start_pa, end_pa;
 	unsigned long pages = 0, pfn;
 
-	/*
-	 * end is the first address past the region and it may be beyond what
-	 * __pa() or __pa_symbol() can handle.
-	 * Use the address included in the range for the cnversion and add back
-	 * 1 afterwards.
-	 */
-	if (__is_kernel((unsigned long)start)) {
-		start_pa = __pa_symbol(start);
-		end_pa = __pa_symbol(end - 1) + 1;
-	} else {
-		start_pa = __pa(start);
-		end_pa = __pa(end - 1) + 1;
-	}
-
-	for_each_valid_pfn(pfn, PFN_UP(start_pa), PFN_DOWN(end_pa)) {
+	for_each_valid_pfn(pfn, PFN_UP(start), PFN_DOWN(end)) {
 		struct page *page = pfn_to_page(pfn);
 		void *direct_map_addr;
 
@@ -934,7 +920,29 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
 		free_reserved_page(page);
 		pages++;
 	}
+	return pages;
+}
+
+unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
+{
+	phys_addr_t start_pa, end_pa;
+	unsigned long pages;
+
+	/*
+	 * end is the first address past the region and it may be beyond what
+	 * __pa() or __pa_symbol() can handle.
+	 * Use the address included in the range for the cnversion and add back
+	 * 1 afterwards.
+	 */
+	if (__is_kernel((unsigned long)start)) {
+		start_pa = __pa_symbol(start);
+		end_pa = __pa_symbol(end - 1) + 1;
+	} else {
+		start_pa = __pa(start);
+		end_pa = __pa(end - 1) + 1;
+	}
 
+	pages = __free_reserved_area(start_pa, end_pa, poison);
 	if (pages && s)
 		pr_info("Freeing %s memory: %ldK\n", s, K(pages));
 
@@ -1810,20 +1818,15 @@ void *__init __memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
  */
 void __init memblock_free_late(phys_addr_t base, phys_addr_t size)
 {
-	phys_addr_t cursor, end;
+	phys_addr_t end = base + size - 1;
 
-	end = base + size - 1;
 	memblock_dbg("%s: [%pa-%pa] %pS\n",
 		     __func__, &base, &end, (void *)_RET_IP_);
-	kmemleak_free_part_phys(base, size);
-	cursor = PFN_UP(base);
-	end = PFN_DOWN(base + size);
 
-	for (; cursor < end; cursor++) {
-		memblock_free_pages(cursor, 0);
-		totalram_pages_inc();
-	}
+	kmemleak_free_part_phys(base, size);
+	__free_reserved_area(base, base + size, -1);
 }
+
 /*
  * Remaining API functions
  */
-- 
2.51.0


