Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4ACEC01A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y36mYnn//4FrI2ubOkjWYg4TmngNW6rB3lI2di8xzT8=; b=qoUe58p/5DWhTBb0zsys+fhVmM
	Z71sgJ8+p3LUm3ghV6PZns4QOQMh5udhgB1YKetpTLDsYg3tEOUxmuA2SnG/2GlplrIW4sqZW2c77
	K8bL3eGLTKcs1dDQrIdrf4WhHL3txiuXYkQJ/9Vw6ZW5ZbcIIOHfV+xMnWlr7mhqgDITOYSR0FKqv
	xfQGBcn6ZTIHOxeLks4Groc6dYHPXS8CK3THNnIjSFjCxTVKwSX7eKed9m3zb00F2KWFA1gcBYw6M
	L7YNmwAgTViL4QogX+4+1S0L+lv7qBglLZqpPEwQRw4ZPetOCrDIpVE0jDWNqLVo76C0TlPQeVrGH
	jO8uf5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a2m-0000000GE2t-0RTh;
	Mon, 23 Mar 2026 07:49:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a2l-0000000GE1n-0QoE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 07:49:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68329600C4;
	Mon, 23 Mar 2026 07:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A752C4CEF7;
	Mon, 23 Mar 2026 07:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252186;
	bh=oTjYKF2HzgnTzfVt/T4KR/aYoXu0jvREAeLPVzJjchU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ApW+Ttb+jFMzL2PVxO2byAuk+A4fmPJnMaO15oJq2IHN6Zecm4hgjhBgwx8npbKST
	 TGIhzz69K5K4pqQrfkuVb111Ir4KwV9TblQWUzh9dnGHx88hKymgGX1Jv2l7vvSHbM
	 eeOwB1tP4IvmYQA/ieHNVxEm4eqUCFiuavhCV8w4JZLIDlqV+RrBsQ6RutKPB1KiCx
	 CTJ9HkxBlgZ4IexKCBXnmCd9iYf4bnQmxV5OCKwv84oMEH+prH6i6fEMCUVPImpnIq
	 IFbjWI+qGUrIe7+ITN828go5miiQUt8iDKr+D1nvEix/c2fD9Fsz6E0RBqR/E2a1+7
	 j3bxw4hqbLsrw==
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
Subject: [PATCH v2 5/9] memblock: make free_reserved_area() more robust
Date: Mon, 23 Mar 2026 09:48:32 +0200
Message-ID: <20260323074836.3653702-6-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323074836.3653702-1-rppt@kernel.org>
References: <20260323074836.3653702-1-rppt@kernel.org>
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

There are two potential problems in free_reserved_area():
* it may free a page with not-existent buddy page
* it may be passed a virtual address from an alias mapping that won't
  be properly translated by virt_to_page(), for example a symbol on arm64

While first issue is quite theoretical and the second one does not manifest
itself because all the callers do the right thing, it is easy to make
free_reserved_area() robust enough to avoid these potential issues.

Replace the loop by virtual address with a loop by pfn that uses
for_each_valid_pfn() and use __pa() or __pa_symbol() depending on the
virtual mapping alias to correctly determine the loop boundaries.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/memblock.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index c0896efbee97..eb086724802a 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -895,21 +895,32 @@ int __init_memblock memblock_remove(phys_addr_t base, phys_addr_t size)
 
 unsigned long free_reserved_area(void *start, void *end, int poison, const char *s)
 {
-	void *pos;
-	unsigned long pages = 0;
+	phys_addr_t start_pa, end_pa;
+	unsigned long pages = 0, pfn;
 
-	start = (void *)PAGE_ALIGN((unsigned long)start);
-	end = (void *)((unsigned long)end & PAGE_MASK);
-	for (pos = start; pos < end; pos += PAGE_SIZE, pages++) {
-		struct page *page = virt_to_page(pos);
+	/*
+	 * end is the first address past the region and it may be beyond what
+	 * __pa() or __pa_symbol() can handle.
+	 * Use the address included in the range for the conversion and add
+	 * back 1 afterwards.
+	 */
+	if (__is_kernel((unsigned long)start)) {
+		start_pa = __pa_symbol(start);
+		end_pa = __pa_symbol(end - 1) + 1;
+	} else {
+		start_pa = __pa(start);
+		end_pa = __pa(end - 1) + 1;
+	}
+
+	for_each_valid_pfn(pfn, PFN_UP(start_pa), PFN_DOWN(end_pa)) {
+		struct page *page = pfn_to_page(pfn);
 		void *direct_map_addr;
 
 		/*
-		 * 'direct_map_addr' might be different from 'pos'
-		 * because some architectures' virt_to_page()
-		 * work with aliases.  Getting the direct map
-		 * address ensures that we get a _writeable_
-		 * alias for the memset().
+		 * 'direct_map_addr' might be different from the kernel virtual
+		 * address because some architectures use aliases.
+		 * Going via physical address, pfn_to_page() and page_address()
+		 * ensures that we get a _writeable_ alias for the memset().
 		 */
 		direct_map_addr = page_address(page);
 		/*
@@ -921,6 +932,7 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
 			memset(direct_map_addr, poison, PAGE_SIZE);
 
 		free_reserved_page(page);
+		pages++;
 	}
 
 	if (pages && s)
-- 
2.53.0


