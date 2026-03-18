Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD18103E163
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qc4shM6MtZIhoCZ+zF8ycWGVEtarVviYhPLaz5jTIyo=; b=xbWoT8+0iwhVjeBnS2iYlYtHkt
	kz5itrFOOZHvjBehemIsRhxX9glrrrTrJgAgh2rO7B0tGIzV3Slocz/KSYND1G5CnJsFz9GP3uBOJ
	vIme2phZs4fq42Dv48Kxd8LJjDK8JPAvXeXloS5kFaGyO0IOP0+6VWARNwnXUgC92WQisxirnN4KV
	b3qm+cR2xnOnQl2pvuF4QzC2+sKgZKGEkG2mhCFPSbrY0dFlE0gKbRO95bdJUuFfgjvvz4TC+dZFV
	2jiS2g9D0kVCip8+jRyBILISMfxgqnv1pmBMoK1YlzyrinQeqbX4gCogQBRn9R9QBSrxq6itTUj4z
	Crm5uo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2odM-00000008G3u-3TB5;
	Wed, 18 Mar 2026 11:00:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2odJ-00000008G00-121D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2F1643E5B;
	Wed, 18 Mar 2026 11:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E442EC2BCB3;
	Wed, 18 Mar 2026 10:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831609;
	bh=uXF/4wNn5jtAs8jN3yAYT5aUpVgj2iPt6T43Ush51L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qrp1DZftNL2mANGaUskZ2ndurPvv1Q5xEZdHwqNMTXTU49FdJOksisWCNrwlXC6Ur
	 af1XIUzkZN16ANirbz+13SpX4Ycz2NHapzQwFaoBxPeYsZxWBk7kNquGT+gKC0UPal
	 1odcL5f7nAH1h90rlpECzOJP2yoKQZ8CZiZWUIZGJZhr5om6GULjPnRiyF5QjirbGG
	 nNG6QPMx1+15rdYzlM0CO+nI6MMsPVBSOXQB4ZINbwOikGfe9GWbWqT3NJ+AtTnIMu
	 Wq+pDjER0gzCMZLFc44nIa/fO0bSvNdhsToGSVGPjBOVfA+qN49Eqsy8N1SkE37UMo
	 GOPaLPgqmqj5Q==
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
Subject: [PATCH 8/8] memblock: warn when freeing reserved memory before memory map is initialized
Date: Wed, 18 Mar 2026 12:58:27 +0200
Message-ID: <20260318105827.1358927-9-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260318105827.1358927-1-rppt@kernel.org>
References: <20260318105827.1358927-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_040013_561345_28A11570 
X-CRM114-Status: GOOD (  18.08  )
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

When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, freeing of reserved
memory before the memory map is fully initialized in deferred_init_memmap()
would cause access to uninitialized struct pages and may crash when
accessing spurious list pointers, like was recently discovered during
discussion about memory leaks in x86 EFI code [1].

The trace below is from an attempt to call free_reserved_page() before
page_alloc_init_late():

[    0.076840] BUG: unable to handle page fault for address: ffffce1a005a0788
[    0.078226] #PF: supervisor read access in kernel mode
[    0.078226] #PF: error_code(0x0000) - not-present page
[    0.078226] PGD 0 P4D 0
[    0.078226] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
[    0.078226] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.12.68-92.123.amzn2023.x86_64 #1
[    0.078226] Hardware name: Amazon EC2 t3a.nano/, BIOS 1.0 10/16/2017
[    0.078226] RIP: 0010:__list_del_entry_valid_or_report+0x32/0xb0
...
[    0.078226]  __free_one_page+0x170/0x520
[    0.078226]  free_pcppages_bulk+0x151/0x1e0
[    0.078226]  free_unref_page_commit+0x263/0x320
[    0.078226]  free_unref_page+0x2c8/0x5b0
[    0.078226]  ? srso_return_thunk+0x5/0x5f
[    0.078226]  free_reserved_page+0x1c/0x30
[    0.078226]  memblock_free_late+0x6c/0xc0

Currently there are not many callers of free_reserved_area() and they all
appear to be at the right timings.

Still, in order to protect against problematic code moves or additions of
new callers add a warning that will inform that reserved pages cannot be
freed until the memory map is fully initialized.

[1] https://lore.kernel.org/all/e5d5a1105d90ee1e7fe7eafaed2ed03bbad0c46b.camel@kernel.crashing.org/

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/internal.h   | 10 ++++++++++
 mm/memblock.c   |  5 +++++
 mm/page_alloc.c | 10 ----------
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index cb0af847d7d9..f60c1edb2e02 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1233,7 +1233,17 @@ static inline void vunmap_range_noflush(unsigned long start, unsigned long end)
 #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
 DECLARE_STATIC_KEY_TRUE(deferred_pages);
 
+static inline bool deferred_pages_enabled(void)
+{
+	return static_branch_unlikely(&deferred_pages);
+}
+
 bool __init deferred_grow_zone(struct zone *zone, unsigned int order);
+#else
+static inline bool deferred_pages_enabled(void)
+{
+	return false;
+}
 #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
 
 void init_deferred_page(unsigned long pfn, int nid);
diff --git a/mm/memblock.c b/mm/memblock.c
index bd5758ff07f2..780e70d4971a 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -896,6 +896,11 @@ static unsigned long __free_reserved_area(phys_addr_t start, phys_addr_t end,
 {
 	unsigned long pages = 0, pfn;
 
+	if (deferred_pages_enabled()) {
+		WARN(1, "Cannot free reserved memory because of deferred initialization of the memory map");
+		return 0;
+	}
+
 	for_each_valid_pfn(pfn, PFN_UP(start), PFN_DOWN(end)) {
 		struct page *page = pfn_to_page(pfn);
 		void *direct_map_addr;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index df3d61253001..9ac47bab2ea7 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -331,11 +331,6 @@ int page_group_by_mobility_disabled __read_mostly;
  */
 DEFINE_STATIC_KEY_TRUE(deferred_pages);
 
-static inline bool deferred_pages_enabled(void)
-{
-	return static_branch_unlikely(&deferred_pages);
-}
-
 /*
  * deferred_grow_zone() is __init, but it is called from
  * get_page_from_freelist() during early boot until deferred_pages permanently
@@ -348,11 +343,6 @@ _deferred_grow_zone(struct zone *zone, unsigned int order)
 	return deferred_grow_zone(zone, order);
 }
 #else
-static inline bool deferred_pages_enabled(void)
-{
-	return false;
-}
-
 static inline bool _deferred_grow_zone(struct zone *zone, unsigned int order)
 {
 	return false;
-- 
2.51.0


