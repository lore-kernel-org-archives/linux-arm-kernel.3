Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44828606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y/omLOFt;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UgCqkk47
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6Fm/jPwX8N/x42opaK4NB2WSpEb6W0SXK/qEq7+UeX8=; b=y/omLOFtXLc5ML
	ZuhBm7ugBuoJ/tpscS9DHTRZbs0kFNh4LJsZvr5sl0J/IDf5vMsTe75yoyNe6tP1gtoUGGu9GwrTQ
	1g95PfZTxoLXYoRg1c41pfN2y4yhEEftQogmYmghUoR0Dr3OTCIsOy1fdnZbpdOi+AWr+rltYYRt2
	ZnnYvKGorp0r8ZT8ZfwrhP+whX+exOsCgeRaSOwBh6kP5q4CbyhdxyJGm2eJII42gLXipZV04iFab
	tPWNhAueWk6qXdYDB3wqi81NGULDfuHRW9WzboGcdJ/JMIxhHPvj1v0Q4N/5U/Iay4NidKfae8uT/
	siRE5dF85Drfb2+xL0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiR-00000007vAQ-07Hg;
	Thu, 05 Nov 2026 06:12:51 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqiN-00000007v7t-0SpZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:12:48 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso700677a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 22:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793859166; x=1794463966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Fm/jPwX8N/x42opaK4NB2WSpEb6W0SXK/qEq7+UeX8=;
        b=UgCqkk479YlyS195BoswnWnqBQmd1apD3D3PJjrXgCxV7P8FG0A3RC6OWpQFuvjvIJ
         OawVU+CHzdDW+WCyLT6QI+FfiFYWeyo3MWwwvqqsSW/H/qO+yvzIVnEPps3r10N9/GiS
         p/KXgF1paMkOJZiwiWwq1nJEjBtcPz+t6iSiIwL2h/H2eUzH1k2N7UIIBSnDDXAw7gXX
         kh3LucyQB4gc0oKrP0dh7gVm7++mbT4pcaOQjrneBrA4FRFk638o4skPmtWe5Pybmypj
         9cJhQqVtXJf9IBqREU5UXFQw++H9o4zahiCOTEzRIPY5bjh6R6UwAZJ5PgMKYw+Ixp7t
         KN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793859166; x=1794463966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Fm/jPwX8N/x42opaK4NB2WSpEb6W0SXK/qEq7+UeX8=;
        b=gqqOVv8/gnHPODt1yyjkLqS1Ju3/fooEIgyNZRUT//aoKKLncaDVJmL0AmKnQZWfTq
         8sE5vCOL1pI3og3qiOCj8dEULqOqGd2SF+KMDuxz7vyQerkrtmA4n2E2MvTEh+Qrkfsq
         WghsCGz8AGbSkwh0JPCg+DGc7fbQvB/DA/FzY1ZZLnn9DK+7VD+eXcBvVFGGLf6FZr4J
         aonIhoyUbqoidr75hUQ3zg0uxcKvugzRUSRnMI0RHuaJzCppN85VmvX8wliGYCf4vZng
         OBfSjwQVQqMwsb/OQ7xE12oFN1f0+qJPjHP8kAx1PpoOeuzF2JAEYYGf9AkC2bSa9RyL
         GrHA==
X-Forwarded-Encrypted: i=1; AKwUvBxWKeckEzi71JrnqV1Sk94feBXnN5WAV5oSU1gASQtyShoSAt9Tp4o7tnUNc2plPgXBQqR6oW+ALGKCf8oTo1lQ@lists.infradead.org
X-Gm-Message-State: APuU4Z/Dv/JeWEvXlwOeetnHqTK3vRdxEOiF5B4KUbBTiQNESXyP1A74
	O7EpMLpI4031fHbkwu/IDpDSfPs/qpYYbYklb9pp9XisW13Tt0fYa1IN/fXjmW0Ybtw=
X-Gm-Gg: AYBFou31C+jeo6Ds/yui480lw2leHuAlOVWmHSRcGOkoZCWd0sxMp75+OtWJerFDXe3
	zLMSUf7inpgomvMEQLTSNPwpo7I1UZEdwrNd56s65VIkRqC/EvNF0KdMo186DnSAJ6/CUtz2dSa
	yDp41xqkYyS4lQMcZ/kENruvONPiLpMefg74mdpCE2pqWCfN4iELCb1BsQ9B5yomH1ewknnOF+D
	lwMVtc4kvA5XdEApaZmmIZZlP/94G+OoioxQyvCam/0+Hv5ghlKjY/NFdjWCOqNzo7h7Z/ERlpM
	TUztVF9NbBv3MQlBtENhxdbWh8EzbLDKqeP0kefVa5Hse8Ic/oU+wMSP90Si6fSj7NHh0xnzJ2R
	9ZR4gGGz2F/gyKxPT+M6ZOnzB/ugN/kpePX95roDnpd6xPG6vgEAHJQNLqB0dF1lNV5umxL+MaC
	P72oTcDUEPX0yE253Jx3znJki/Jbl0iHKVSiz38OnhC7DzPsqykdHHZkI3jYqTPBC1O7mRln/qs
	xkiYlCP+wZ3UK1SpFbrjjScBqbexmTF6SpSHNJS3hEV6xAT+uFHNYBTGzGk8MzeWg3IoL1EP/BK
	QmesWF7liMxl//eC+Eje6s04FjH4tR50Mvq00MiGdk8VuJB2evJFvtBTQ0xHUqKR2Q==
X-Received: by 2002:a17:90b:17cd:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3ae8987a7bfmr15528967a91.65.1793859166073;
        Wed, 04 Nov 2026 22:12:46 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323a1fdsm2107528a91.5.2026.11.04.22.12.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 22:12:45 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 2/5] powerpc/mm: drop powerpc vmemmap_can_optimize()
Date: Thu,  5 Nov 2026 14:12:14 +0800
Message-ID: <20261105061217.13302-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105061217.13302-1-songmuchun@bytedance.com>
References: <20261105061217.13302-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_221247_175632_53D854EA 
X-CRM114-Status: GOOD (  16.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Whether the optimized mapping can be used is now decided in the
architecture-specific vmemmap_populate() path. When PowerPC has to fall
back, such as on Hash MMU, it can disable optimization for the populated
vmemmap range there.

Add section_vmemmap_optimization_disable() to centralize this fallback,
use it in the Hash MMU path, and drop the radix-specific
vmemmap_can_optimize() override.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Add section_vmemmap_optimization_disable() for architecture fallbacks
- Use the helper for the PowerPC Hash MMU path
- Include vmemmap-optimization.h directly (reported by Sashiko)
---
 arch/powerpc/include/asm/book3s/64/radix.h |  5 ----
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 10 -------
 arch/powerpc/mm/init_64.c                  |  2 ++
 include/linux/vmemmap-optimization.h       | 31 ++++++++++++++++++++++
 mm/sparse.h                                |  5 ----
 5 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 8452a2714cb1..df67209b0c5b 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -351,10 +351,5 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMORY_HOTPLUG */
-
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-#define vmemmap_can_optimize vmemmap_can_optimize
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
-#endif
 #endif /* __ASSEMBLER__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2924604fbb38..63f369d296b4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -978,16 +978,6 @@ int __meminit radix__vmemmap_create_mapping(unsigned long start,
 	return 0;
 }
 
-#ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
-bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
-{
-	if (radix_enabled())
-		return __vmemmap_can_optimize(altmap, pgmap);
-
-	return false;
-}
-#endif
-
 int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 				unsigned long addr, unsigned long next)
 {
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 0e777d7dc332..4d6928f717cf 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 #include <linux/mman.h>
 #include <linux/mm.h>
+#include <linux/vmemmap-optimization.h>
 #include <linux/swap.h>
 #include <linux/stddef.h>
 #include <linux/vmalloc.h>
@@ -282,6 +283,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 		return radix__vmemmap_populate(start, end, node, altmap);
 #endif
 
+	section_vmemmap_optimization_disable(start, end);
 	return __vmemmap_populate(start, end, node, altmap);
 }
 
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index 858311a71b0c..5c09da4df4d8 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -57,6 +57,27 @@ static inline void section_set_compound_order_range(unsigned long pfn,
 		section_set_compound_order(__nr_to_section(section_nr + i), order);
 }
 
+static inline bool section_vmemmap_optimizable(const struct mem_section *section)
+{
+	return vmemmap_optimizable_order(section_compound_order(section));
+}
+
+static inline void section_vmemmap_optimization_disable(unsigned long start,
+		unsigned long end)
+{
+	unsigned long pfn = page_to_pfn((struct page *)start);
+	unsigned long nr_pages = (end - start) / sizeof(struct page);
+	struct mem_section *section = __pfn_to_section(pfn);
+
+	if (nr_pages < PAGES_PER_SECTION) {
+		VM_WARN_ON_ONCE(section_vmemmap_optimizable(section));
+		return;
+	}
+
+	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION));
+	section_set_compound_order(section, 0);
+}
+
 static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return section_compound_order(__pfn_to_section(pfn));
@@ -79,6 +100,16 @@ static inline void section_set_compound_order_range(unsigned long pfn,
 {
 }
 
+static inline bool section_vmemmap_optimizable(const struct mem_section *section)
+{
+	return false;
+}
+
+static inline void section_vmemmap_optimization_disable(unsigned long start,
+		unsigned long end)
+{
+}
+
 static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return 0;
diff --git a/mm/sparse.h b/mm/sparse.h
index fdbc4cacf91d..9b81a549d928 100644
--- a/mm/sparse.h
+++ b/mm/sparse.h
@@ -46,11 +46,6 @@ static inline size_t mem_section_usage_size(void)
 	return struct_size_t(struct mem_section_usage, pageblock_flags,
 			     BITS_TO_LONGS(SECTION_BLOCKFLAGS_BITS));
 }
-
-static inline bool section_vmemmap_optimizable(const struct mem_section *ms)
-{
-	return vmemmap_optimizable_order(section_compound_order(ms));
-}
 #else
 static inline void sparse_init(void) {}
 static inline void sparse_sections_init(void) {}
-- 
2.54.0


