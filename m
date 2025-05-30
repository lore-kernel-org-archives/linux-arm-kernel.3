Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68C7C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=briVDyCtVmJlcp9qKYDQUQ+ZnAwtSVxjrm6EZqrt8AA=; b=sLtj8ZmewDqayWHbSCoyJ39RQQ
	7OonM989Qx9IUFVacK8r7kgXiTnKP/cnbcgRJiwi8LANI6Ea84Rxyyi+U+Zr1aTBYgvcaeqrojcKZ
	ig+6eC0POzA68G8c+twAVdBdjZwJlUBqLUrFaR+c4sRSrd9vjCkgYcfvnpx3m7aPjg9R2VnODU5DA
	Qk1r1+ZYQUt0gfUN49rzmP5khuD3B3vXv/BbSRJOAbYGCzXn74sl9n+wjP/h1O1DXsEqNYmpTNAxl
	MdUFd+LBJ6VcCeUUK5JncmivYCOxD25/BZZphPx7ySphwuQn5mRN6bXb0ESThS7i4yaYX17xPtlHR
	A5BkUBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0Wh-00000000sZJ-2nmw;
	Fri, 30 May 2025 14:16:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0MQ-00000000qhY-3rCR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 14:05:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC0EB2682;
	Fri, 30 May 2025 07:05:09 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 42F963F673;
	Fri, 30 May 2025 07:05:21 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [RFC PATCH v1 4/6] mm: Introduce arch_in_lazy_mmu_mode()
Date: Fri, 30 May 2025 15:04:42 +0100
Message-ID: <20250530140446.2387131-5-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530140446.2387131-1-ryan.roberts@arm.com>
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_070527_046926_58D14C08 
X-CRM114-Status: GOOD (  15.96  )
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

Introduce new arch_in_lazy_mmu_mode() API, which returns true if the
calling context is currently in lazy mmu mode or false otherwise. Each
arch that supports lazy mmu mode must provide an implementation of this
API.

The API will shortly be used to prevent accidental lazy mmu mode nesting
when performing an allocation, and will additionally be used to ensure
pte modification vs tlb flushing order does not get inadvertantly
swapped.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/include/asm/pgtable.h                  |  8 ++++++++
 .../powerpc/include/asm/book3s/64/tlbflush-hash.h | 15 +++++++++++++++
 arch/sparc/include/asm/tlbflush_64.h              |  1 +
 arch/sparc/mm/tlb.c                               | 12 ++++++++++++
 arch/x86/include/asm/paravirt.h                   |  5 +++++
 arch/x86/include/asm/paravirt_types.h             |  1 +
 arch/x86/kernel/paravirt.c                        |  6 ++++++
 arch/x86/xen/mmu_pv.c                             |  6 ++++++
 include/linux/pgtable.h                           |  1 +
 9 files changed, 55 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 5285757ee0c1..add75dee49f5 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -119,6 +119,14 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	clear_thread_flag(TIF_LAZY_MMU);
 }
 
+static inline bool arch_in_lazy_mmu_mode(void)
+{
+	if (in_interrupt())
+		return false;
+
+	return test_thread_flag(TIF_LAZY_MMU);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 146287d9580f..4123a9da32cc 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -57,6 +57,21 @@ static inline void arch_leave_lazy_mmu_mode(void)
 
 #define arch_flush_lazy_mmu_mode()      do {} while (0)
 
+static inline bool arch_in_lazy_mmu_mode(void)
+{
+	struct ppc64_tlb_batch *batch;
+	bool active;
+
+	if (radix_enabled())
+		return false;
+
+	batch = get_cpu_ptr(&ppc64_tlb_batch);
+	active = batch->active;
+	put_cpu_ptr(&ppc64_tlb_batch);
+
+	return active;
+}
+
 extern void hash__tlbiel_all(unsigned int action);
 
 extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
index 8b8cdaa69272..204bc957df9e 100644
--- a/arch/sparc/include/asm/tlbflush_64.h
+++ b/arch/sparc/include/asm/tlbflush_64.h
@@ -45,6 +45,7 @@ void flush_tlb_pending(void);
 void arch_enter_lazy_mmu_mode(void);
 void arch_leave_lazy_mmu_mode(void);
 #define arch_flush_lazy_mmu_mode()      do {} while (0)
+bool arch_in_lazy_mmu_mode(void);
 
 /* Local cpu only.  */
 void __flush_tlb_all(void);
diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
index a35ddcca5e76..83ab4ba4f4fb 100644
--- a/arch/sparc/mm/tlb.c
+++ b/arch/sparc/mm/tlb.c
@@ -69,6 +69,18 @@ void arch_leave_lazy_mmu_mode(void)
 	preempt_enable();
 }
 
+bool arch_in_lazy_mmu_mode(void)
+{
+	struct tlb_batch *tb;
+	bool active;
+
+	tb = get_cpu_ptr(&tlb_batch);
+	active = tb->active;
+	put_cpu_ptr(&tlb_batch);
+
+	return active;
+}
+
 static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,
 			      bool exec, unsigned int hugepage_shift)
 {
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b5e59a7ba0d0..c7ea3ccb8a41 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -542,6 +542,11 @@ static inline void arch_flush_lazy_mmu_mode(void)
 	PVOP_VCALL0(mmu.lazy_mode.flush);
 }
 
+static inline bool arch_in_lazy_mmu_mode(void)
+{
+	return PVOP_CALL0(bool, mmu.lazy_mode.in);
+}
+
 static inline void __set_fixmap(unsigned /* enum fixed_addresses */ idx,
 				phys_addr_t phys, pgprot_t flags)
 {
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 37a8627d8277..41001ca9d010 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -46,6 +46,7 @@ struct pv_lazy_ops {
 	void (*enter)(void);
 	void (*leave)(void);
 	void (*flush)(void);
+	bool (*in)(void);
 } __no_randomize_layout;
 #endif
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ab3e172dcc69..9af1a04a47fd 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -106,6 +106,11 @@ static noinstr void pv_native_set_debugreg(int regno, unsigned long val)
 {
 	native_set_debugreg(regno, val);
 }
+
+static noinstr bool paravirt_retfalse(void)
+{
+	return false;
+}
 #endif
 
 struct pv_info pv_info = {
@@ -228,6 +233,7 @@ struct paravirt_patch_template pv_ops = {
 		.enter		= paravirt_nop,
 		.leave		= paravirt_nop,
 		.flush		= paravirt_nop,
+		.in		= paravirt_retfalse,
 	},
 
 	.mmu.set_fixmap		= native_set_fixmap,
diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
index 2a4a8deaf612..74f7a8537911 100644
--- a/arch/x86/xen/mmu_pv.c
+++ b/arch/x86/xen/mmu_pv.c
@@ -2147,6 +2147,11 @@ static void xen_flush_lazy_mmu(void)
 	preempt_enable();
 }
 
+static bool xen_in_lazy_mmu(void)
+{
+	return xen_get_lazy_mode() == XEN_LAZY_MMU;
+}
+
 static void __init xen_post_allocator_init(void)
 {
 	pv_ops.mmu.set_pte = xen_set_pte;
@@ -2230,6 +2235,7 @@ static const typeof(pv_ops) xen_mmu_ops __initconst = {
 			.enter = xen_enter_lazy_mmu,
 			.leave = xen_leave_lazy_mmu,
 			.flush = xen_flush_lazy_mmu,
+			.in = xen_in_lazy_mmu,
 		},
 
 		.set_fixmap = xen_set_fixmap,
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b50447ef1c92..580d9971f435 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -235,6 +235,7 @@ static inline int pmd_dirty(pmd_t pmd)
 #define arch_enter_lazy_mmu_mode()	do {} while (0)
 #define arch_leave_lazy_mmu_mode()	do {} while (0)
 #define arch_flush_lazy_mmu_mode()	do {} while (0)
+#define arch_in_lazy_mmu_mode()		false
 #endif
 
 #ifndef pte_batch_hint
-- 
2.43.0


