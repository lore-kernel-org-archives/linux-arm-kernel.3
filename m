Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99484CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cbj4zp7uSZx/T4/nBfgioKWu9VmcYJpiOH4O825NldU=; b=qImQv1Xhi+AE0ocmL6qBDx3XAN
	mukfPzvIpPDVrJuxnT5XNXDleGN/xI0VYwWDj9VxCGpZkAzJCt8HTyQv380B7tWPuv+Pv9OuorU0P
	AbC7UTufyKb8ADlWf3ZOk0QYRd0lahDozwh04j9q9cJzAhHPqq1QjJTj0KAVHY/O9SCdZlJJQLTkM
	Ur+MXqy2pkPig5RceK0tBlRrrUQX90Hf29FZrfUtJZN86TSBtHpthkPtuEmXvOfSw1R6wlqXTxMmc
	hUUiyqg3QAhahcPePuJntViYGRdteFtIxs0IyF2zw3uV0bZuIOaaNSmb4tj0sM4b9RKRXo+QS/R+O
	qSEpQgLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FLs-00000008uo3-1VLt;
	Fri, 10 Oct 2025 15:48:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FLq-00000008umS-3Hsv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Cbj4zp7uSZx/T4/nBfgioKWu9VmcYJpiOH4O825NldU=; b=HiCQ78sS2G00ThfMKSmrlvE3tO
	0O21qbX8pfCVSP8703/Ztg5KLsHCVxYwHKFMA0wOLfdmf9Gm1hB9hJRmoVLOF0whFuSj24Kg1tIg1
	93U16ZJYr20i2IobYHVAcihQ8OsxqIxP2O2AnnB3jmnqDmw+6v0kzwcFC5AHIO7GW2JVT3HKnOVTr
	bDBvMhq6XjwnHLj0sQcjd82sfNf5ksJtGXMRLNIVpsAezWN3SNCMfpiVEAvd/aQ3Nkc5iMlj78LhI
	VPpHMmKtwZ9hjA2FVDs0BWpGj9d1JNGLraK/MjGZCqahd0MPEl3wv0603u0WCYiRXKjzt2AllQxul
	XaWyhVLg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FLn-00000002Fy0-35JC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cbj4zp7uSZx/T4/nBfgioKWu9VmcYJpiOH4O825NldU=;
	b=I/bA7d9uZkNYv8unyNfRIO4ZY+YefdJ8yium2MfBHZFaE9+iLoeAAsgciV7jevjBipD07v
	yALPNFtIZFFs6+wjIuvoViACroME2aztKRvDkM2b293ztDq7ZTdn1eAyQeRfSdG4M00H2F
	1eQ+nqW54EaIva6ySEkeoTRAzYuLnxs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cbj4zp7uSZx/T4/nBfgioKWu9VmcYJpiOH4O825NldU=;
	b=I/bA7d9uZkNYv8unyNfRIO4ZY+YefdJ8yium2MfBHZFaE9+iLoeAAsgciV7jevjBipD07v
	yALPNFtIZFFs6+wjIuvoViACroME2aztKRvDkM2b293ztDq7ZTdn1eAyQeRfSdG4M00H2F
	1eQ+nqW54EaIva6ySEkeoTRAzYuLnxs=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-vBNA1yILN1WPT3ArJUl3tA-1; Fri,
 10 Oct 2025 11:48:07 -0400
X-MC-Unique: vBNA1yILN1WPT3ArJUl3tA-1
X-Mimecast-MFC-AGG-ID: vBNA1yILN1WPT3ArJUl3tA_1760111281
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 509861800452;
	Fri, 10 Oct 2025 15:48:01 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 98E831800576;
	Fri, 10 Oct 2025 15:47:46 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>
Subject: [RFC PATCH v6 28/29] x86/mm, mm/vmalloc: Defer kernel TLB flush IPIs under CONFIG_COALESCE_TLBI=y
Date: Fri, 10 Oct 2025 17:38:38 +0200
Message-ID: <20251010153839.151763-29-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164812_074588_6CE721D3 
X-CRM114-Status: GOOD (  25.07  )
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

Previous commits have added an unconditional TLB flush right after
switching to the kernel CR3 on NOHZ_FULL CPUs, and a software signal to
determine whether a CPU has its kernel CR3 loaded.

Using these two components, we can now safely defer kernel TLB flush IPIs
targeting NOHZ_FULL CPUs executing in userspace (i.e. with the user CR3
loaded).

Note that the COALESCE_TLBI config option is introduced in a later commit,
when the whole feature is implemented.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/include/asm/tlbflush.h |  3 +++
 arch/x86/mm/tlb.c               | 34 ++++++++++++++++++++++++++-------
 mm/vmalloc.c                    | 34 ++++++++++++++++++++++++++++-----
 3 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index e39ae95b85072..6d533afd70952 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -321,6 +321,9 @@ extern void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
				unsigned long end, unsigned int stride_shift,
				bool freed_tables);
 extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
+#ifdef CONFIG_COALESCE_TLBI
+extern void flush_tlb_kernel_range_deferrable(unsigned long start, unsigned long end);
+#endif

 static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
 {
diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 39f80111e6f17..aa3a83d5eccc2 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -12,6 +12,7 @@
 #include <linux/task_work.h>
 #include <linux/mmu_notifier.h>
 #include <linux/mmu_context.h>
+#include <linux/sched/isolation.h>

 #include <asm/tlbflush.h>
 #include <asm/mmu_context.h>
@@ -1509,23 +1510,24 @@ static void do_kernel_range_flush(void *info)
		flush_tlb_one_kernel(addr);
 }

-static void kernel_tlb_flush_all(struct flush_tlb_info *info)
+static void kernel_tlb_flush_all(smp_cond_func_t cond, struct flush_tlb_info *info)
 {
	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
		invlpgb_flush_all();
	else
-		on_each_cpu(do_flush_tlb_all, NULL, 1);
+		on_each_cpu_cond(cond, do_flush_tlb_all, NULL, 1);
 }

-static void kernel_tlb_flush_range(struct flush_tlb_info *info)
+static void kernel_tlb_flush_range(smp_cond_func_t cond, struct flush_tlb_info *info)
 {
	if (cpu_feature_enabled(X86_FEATURE_INVLPGB))
		invlpgb_kernel_range_flush(info);
	else
-		on_each_cpu(do_kernel_range_flush, info, 1);
+		on_each_cpu_cond(cond, do_kernel_range_flush, info, 1);
 }

-void flush_tlb_kernel_range(unsigned long start, unsigned long end)
+static inline void
+__flush_tlb_kernel_range(smp_cond_func_t cond, unsigned long start, unsigned long end)
 {
	struct flush_tlb_info *info;

@@ -1535,13 +1537,31 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
				  TLB_GENERATION_INVALID);

	if (info->end == TLB_FLUSH_ALL)
-		kernel_tlb_flush_all(info);
+		kernel_tlb_flush_all(cond, info);
	else
-		kernel_tlb_flush_range(info);
+		kernel_tlb_flush_range(cond, info);

	put_flush_tlb_info();
 }

+void flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	__flush_tlb_kernel_range(NULL, start, end);
+}
+
+#ifdef CONFIG_COALESCE_TLBI
+static bool flush_tlb_kernel_cond(int cpu, void *info)
+{
+	return housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE) ||
+	       per_cpu(kernel_cr3_loaded, cpu);
+}
+
+void flush_tlb_kernel_range_deferrable(unsigned long start, unsigned long end)
+{
+	__flush_tlb_kernel_range(flush_tlb_kernel_cond, start, end);
+}
+#endif
+
 /*
  * This can be used from process context to figure out what the value of
  * CR3 is without needing to do a (slow) __read_cr3().
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5edd536ba9d2a..c42f413a7a693 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -494,6 +494,30 @@ void vunmap_range_noflush(unsigned long start, unsigned long end)
	__vunmap_range_noflush(start, end);
 }

+#ifdef CONFIG_COALESCE_TLBI
+/*
+ * !!! BIG FAT WARNING !!!
+ *
+ * The CPU is free to cache any part of the paging hierarchy it wants at any
+ * time. It's also free to set accessed and dirty bits at any time, even for
+ * instructions that may never execute architecturally.
+ *
+ * This means that deferring a TLB flush affecting freed page-table-pages (IOW,
+ * keeping them in a CPU's paging hierarchy cache) is a recipe for disaster.
+ *
+ * This isn't a problem for deferral of TLB flushes in vmalloc, because
+ * page-table-pages used for vmap() mappings are never freed - see how
+ * __vunmap_range_noflush() walks the whole mapping but only clears the leaf PTEs.
+ * If this ever changes, TLB flush deferral will cause misery.
+ */
+void __weak flush_tlb_kernel_range_deferrable(unsigned long start, unsigned long end)
+{
+	flush_tlb_kernel_range(start, end);
+}
+#else
+#define flush_tlb_kernel_range_deferrable(start, end) flush_tlb_kernel_range(start, end)
+#endif
+
 /**
  * vunmap_range - unmap kernel virtual addresses
  * @addr: start of the VM area to unmap
@@ -507,7 +531,7 @@ void vunmap_range(unsigned long addr, unsigned long end)
 {
	flush_cache_vunmap(addr, end);
	vunmap_range_noflush(addr, end);
-	flush_tlb_kernel_range(addr, end);
+	flush_tlb_kernel_range_deferrable(addr, end);
 }

 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
@@ -2333,7 +2357,7 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,

	nr_purge_nodes = cpumask_weight(&purge_nodes);
	if (nr_purge_nodes > 0) {
-		flush_tlb_kernel_range(start, end);
+		flush_tlb_kernel_range_deferrable(start, end);

		/* One extra worker is per a lazy_max_pages() full set minus one. */
		nr_purge_helpers = atomic_long_read(&vmap_lazy_nr) / lazy_max_pages();
@@ -2436,7 +2460,7 @@ static void free_unmap_vmap_area(struct vmap_area *va)
	flush_cache_vunmap(va->va_start, va->va_end);
	vunmap_range_noflush(va->va_start, va->va_end);
	if (debug_pagealloc_enabled_static())
-		flush_tlb_kernel_range(va->va_start, va->va_end);
+		flush_tlb_kernel_range_deferrable(va->va_start, va->va_end);

	free_vmap_area_noflush(va);
 }
@@ -2884,7 +2908,7 @@ static void vb_free(unsigned long addr, unsigned long size)
	vunmap_range_noflush(addr, addr + size);

	if (debug_pagealloc_enabled_static())
-		flush_tlb_kernel_range(addr, addr + size);
+		flush_tlb_kernel_range_deferrable(addr, addr + size);

	spin_lock(&vb->lock);

@@ -2949,7 +2973,7 @@ static void _vm_unmap_aliases(unsigned long start, unsigned long end, int flush)
	free_purged_blocks(&purge_list);

	if (!__purge_vmap_area_lazy(start, end, false) && flush)
-		flush_tlb_kernel_range(start, end);
+		flush_tlb_kernel_range_deferrable(start, end);
	mutex_unlock(&vmap_purge_lock);
 }

--
2.51.0


