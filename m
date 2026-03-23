Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B95BEC01A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSrRbHdXi/ESSIllWcfDoe6S0Vd63YGulx1PIV/SCp0=; b=U5sy8JlwDBKj07UDkPoCEM60t5
	OMMiVHKkMJg33HWmEMMH7uyHZjYAOH4XG6aGnh1TkEMvhVHi4dVy1CdFKVx7QL3mV6Ux6xhgpEwW6
	MuwRYtrOnzgMB4FSvakvNjpqHlej7OFc5XcmoJ+RTkTS2E4T2LqQLX5Q4jq6LFp+x72hn17fh6iqj
	bgz7u939DA6Oj+AxrndHOmdglvIDHTE7sjBBU24TD819iw1k8do4rfhQCnw6s5tA37vlGAz3Zj7vo
	iVJJh9ELHFNaCPMe9IQO5nPfByy+4njtgYcTQ1OwWgaOMA1AS53NeQa7wvt4iYJKe1WYnfGWOgs94
	sGlkRkdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a39-0000000GEGG-2nTG;
	Mon, 23 Mar 2026 07:50:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a36-0000000GEFA-3WUg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 07:50:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 857DB4061E;
	Mon, 23 Mar 2026 07:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBAEC4CEF7;
	Mon, 23 Mar 2026 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252208;
	bh=JX9RHWZi5vuFIJLodu0lHA5nrZZIkASHjFmUizN2RBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWVLvFut4f6MYN3wwvVgBsvFdFfwPxFVLIxEnZF2GAp0JQd7HON8/QxygCU2ypG3q
	 85RF6aLIrLIQls+Z9PC1N5+z9V63pBv8iSd7N325b75nqcJrfzheijh13oNYSPPUHF
	 7H4UTJH2FCWdxQJdQJ0moQ/robJ3B0VZTNpPoyjWFkZEoeQUN2laq6KQhmOmXfYL+r
	 ATjY+R2jtWYZYg2H6wmqiRgYcaDRVxYkBHUXg6eZ2dnlzyU+afaaq90pMJbntP0NXj
	 8kFILSXJOVGHQNzneF/T6HYv7O2tYy9lrUVFuGHfpzFLaD+zWwYbsaZr6rNdr5t1Nb
	 oKdXVBglapLiQ==
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
Subject: [PATCH v2 7/9] memblock: make free_reserved_area() update memblock if ARCH_KEEP_MEMBLOCK=y
Date: Mon, 23 Mar 2026 09:48:34 +0200
Message-ID: <20260323074836.3653702-8-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323074836.3653702-1-rppt@kernel.org>
References: <20260323074836.3653702-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_005008_921026_F9F801FA 
X-CRM114-Status: GOOD (  13.07  )
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

On architectures that keep memblock after boot, freeing of reserved memory
with free_reserved_area() is paired with an update of memblock arrays,
usually by a call to memblock_free().

Make free_reserved_area() directly update memblock.reserved when
ARCH_KEEP_MEMBLOCK is enabled.

Remove the now-redundant explicit memblock_free() call from
arm64::free_initmem() and the #ifdef CONFIG_ARCH_KEEP_MEMBLOCK block
from the generic free_initrd_mem().

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/arm64/mm/init.c | 3 ---
 init/initramfs.c     | 7 -------
 mm/memblock.c        | 6 ++++++
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 96711b8578fd..07b17c708702 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -385,9 +385,6 @@ void free_initmem(void)
 	WARN_ON(!IS_ALIGNED((unsigned long)lm_init_begin, PAGE_SIZE));
 	WARN_ON(!IS_ALIGNED((unsigned long)lm_init_end, PAGE_SIZE));
 
-	/* Delete __init region from memblock.reserved. */
-	memblock_free(lm_init_begin, lm_init_end - lm_init_begin);
-
 	free_reserved_area(lm_init_begin, lm_init_end,
 			   POISON_FREE_INITMEM, "unused kernel");
 	/*
diff --git a/init/initramfs.c b/init/initramfs.c
index 139baed06589..bca0922b2850 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -652,13 +652,6 @@ void __init reserve_initrd_mem(void)
 
 void __weak __init free_initrd_mem(unsigned long start, unsigned long end)
 {
-#ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-	unsigned long aligned_start = ALIGN_DOWN(start, PAGE_SIZE);
-	unsigned long aligned_end = ALIGN(end, PAGE_SIZE);
-
-	memblock_free((void *)aligned_start, aligned_end - aligned_start);
-#endif
-
 	free_reserved_area((void *)start, (void *)end, POISON_FREE_INITMEM,
 			"initrd");
 }
diff --git a/mm/memblock.c b/mm/memblock.c
index ccdf3d225626..0ad968c2f2e8 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -942,6 +942,12 @@ unsigned long free_reserved_area(void *start, void *end, int poison, const char
 		end_pa = __pa(end - 1) + 1;
 	}
 
+	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
+		if (start_pa < end_pa)
+			memblock_remove_range(&memblock.reserved,
+					      start_pa, end_pa - start_pa);
+	}
+
 	pages = __free_reserved_area(start_pa, end_pa, poison);
 	if (pages && s)
 		pr_info("Freeing %s memory: %ldK\n", s, K(pages));
-- 
2.53.0


