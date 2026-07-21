Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDCAC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLtKmgePsVMTaeM3LRrhXggCl62wc5rCPPnL48yidIo=; b=LlcD8KvQ7We0WjLoy55JY8sHhE
	JYnLp+rky0P34SYlc6FM5vKaJLzQyOiJ3TotR0och9YGWzKZgx41w/k/Fi6UdUWnzOXoCFtmdMBve
	rOUAE5TjHmlk/sXi4FKH8SybBhELq6EGl4VZTsOTawKNEc665Q288d2GlZhoTfbcb1OulbdySbqcw
	IZV5G0nWrZJK8CJ39cf7v5PDy1Xw8u6PjrS8ULVWT+qOrKJ/gtoghBfSJRYsI3ZFsB/Gu9VFs4Pb9
	qS0LN++qwRcpjkTv8OAwV5w87/+YCqpT7l8Mz1KYsOV72sk7smnvnXME+K2GoKl/2uHKXaqQCQhL3
	EQtrI/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGb-00000009tQf-05Ga;
	Tue, 21 Jul 2026 16:24:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDGZ-00000009tOl-333C;
	Tue, 21 Jul 2026 16:24:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AF9960A59;
	Tue, 21 Jul 2026 16:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832A61F000E9;
	Tue, 21 Jul 2026 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651062;
	bh=MLtKmgePsVMTaeM3LRrhXggCl62wc5rCPPnL48yidIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jpW44nJzttT3pWAEhrIKz5B4sMBsyhohfB0x3ncv13vYzuBX+eor5vRrEJsAn1GEC
	 8buYNNPOKdsYbmQq4LUYFKbNl9hjm9cLuyrrmuj2vS7L92z3roHNEuY3rwGa7SLFla
	 mVWiAz9B/42AJBbg/tlAC/rzlktFkH1KdlYTHVvbh+z6r7JDzdaFEoJe4k3cYL4Vn0
	 CEM3jZKRS8JnGvVzs60HuN1d6KQxlrY56SsI3GVHxg1BN5fUoLnKf3K0RBbDod0UQk
	 MUO1T9opH9P+jmqCFdx3mbZ949Kz8DemL18bQ0aug9DwEw51oCZgNWGYZpjANkk1fk
	 cdcD3utSbh+tg==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Tue, 21 Jul 2026 19:23:29 +0300
Subject: [PATCH RFC 06/18] x86/mm/pat: introduce an inline helper to check
 if alias needs update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-generic-set-memory-v0-1-v1-6-2c1fc62306b3@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: linux-mm@kvack.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, 
 Brendan Jackman <jackmanb@google.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 David Hildenbrand <david@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Kevin Brodsky <kevin.brodsky@arm.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, 
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
X-Mailer: b4 0.16-dev
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

Once core parts of change_page_attr() would be moved to common code,
the processing of alias mappings would be out of line and would require
a function call for each modified PTE even if the primary target of
change_page_attr() does not have alias mappings.

Calling a function per PTE just to find out it has nothing to do is
expensive and resulted in ~30% regression in instrumented cpa-test.

Although cpa-test is a microbenchmark, ~30% regression is still a lot
and can be easily avoided by inlining the checks that gates processing
of the alias mapping.

Introduce cpa_should_update_alias() inline helper that checks if the
alias update is required.

Since on 64-bit an alias could be in the high kernel mapping, pull
__cpa_pfn_in_highmap() along and rename it to pfn_is_kernel().

No functional change intended.

Assisted-by: Copilot:claude-opus-4.8
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/set_memory.h | 50 +++++++++++++++++++++++++++++++
 arch/x86/mm/pat/set_memory.c      | 62 +++------------------------------------
 2 files changed, 54 insertions(+), 58 deletions(-)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 4362c26aa992..332ec300c2ed 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -3,12 +3,62 @@
 #define _ASM_X86_SET_MEMORY_H
 
 #include <asm/page.h>
+#include <asm/sections.h>
 #include <asm-generic/set_memory.h>
 #include <asm/pgtable.h>
 
 #define set_memory_rox set_memory_rox
 int set_memory_rox(unsigned long addr, int numpages);
 
+#ifdef CONFIG_X86_64
+/*
+ * The kernel image is mapped into two places in the virtual address space
+ * (addresses without KASLR, of course):
+ *
+ * 1. The kernel direct map (0xffff880000000000)
+ * 2. The "high kernel map" (0xffffffff81000000)
+ *
+ * We actually execute out of #2. If we get the address of a kernel symbol, it
+ * points to #2, but almost all physical-to-virtual translations point to #1.
+ *
+ * This is so that we can have both a directmap of all physical memory *and*
+ * take full advantage of the limited (s32) immediate addressing range (2G)
+ * of x86_64.
+ *
+ * See Documentation/arch/x86/x86_64/mm.rst for more detail.
+ */
+static inline bool pfn_is_kernel(unsigned long pfn)
+{
+	unsigned long spfn = __pa_symbol(_text) >> PAGE_SHIFT;
+	/* Do not reference a physical address outside the kernel. */
+	unsigned long epfn = __pa_symbol(roundup(_brk_end, PMD_SIZE) - 1) >> PAGE_SHIFT;
+
+	return pfn >= spfn && pfn <= epfn;
+}
+#else
+static inline bool pfn_is_kernel(unsigned long pfn)
+{
+	/* There is no highmap on 32-bit */
+	return false;
+}
+#endif
+
+static inline bool cpa_should_update_alias(unsigned long vaddr,
+					   unsigned long pfn)
+{
+	/* Primary is not in the direct map, its direct map alias needs update */
+	if (vaddr < PAGE_OFFSET ||
+	    vaddr >= PAGE_OFFSET + (max_pfn_mapped << PAGE_SHIFT))
+		return true;
+
+	/* direct map page that is also part of the kernel highmap */
+	if ((vaddr < (unsigned long)_text || vaddr >= _brk_end) &&
+	    pfn_is_kernel(pfn))
+		return true;
+
+	return false;
+}
+
 /*
  * The set_memory_* API can be used to change various attributes of a virtual
  * address range. The attributes include:
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index ee40962d4ee9..2a087dcedf84 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -224,61 +224,6 @@ within(unsigned long addr, unsigned long start, unsigned long end)
 	return addr >= start && addr < end;
 }
 
-#ifdef CONFIG_X86_64
-
-static inline int
-within_inclusive(unsigned long addr, unsigned long start, unsigned long end)
-{
-	return addr >= start && addr <= end;
-}
-
-/*
- * The kernel image is mapped into two places in the virtual address space
- * (addresses without KASLR, of course):
- *
- * 1. The kernel direct map (0xffff880000000000)
- * 2. The "high kernel map" (0xffffffff81000000)
- *
- * We actually execute out of #2. If we get the address of a kernel symbol, it
- * points to #2, but almost all physical-to-virtual translations point to #1.
- *
- * This is so that we can have both a directmap of all physical memory *and*
- * take full advantage of the limited (s32) immediate addressing range (2G)
- * of x86_64.
- *
- * See Documentation/arch/x86/x86_64/mm.rst for more detail.
- */
-
-static inline unsigned long highmap_start_pfn(void)
-{
-	return __pa_symbol(_text) >> PAGE_SHIFT;
-}
-
-static inline unsigned long highmap_end_pfn(void)
-{
-	/* Do not reference physical address outside the kernel. */
-	return __pa_symbol(roundup(_brk_end, PMD_SIZE) - 1) >> PAGE_SHIFT;
-}
-
-static bool __cpa_pfn_in_highmap(unsigned long pfn)
-{
-	/*
-	 * Kernel text has an alias mapping at a high address, known
-	 * here as "highmap".
-	 */
-	return within_inclusive(pfn, highmap_start_pfn(), highmap_end_pfn());
-}
-
-#else
-
-static bool __cpa_pfn_in_highmap(unsigned long pfn)
-{
-	/* There is no highmap on 32-bit */
-	return false;
-}
-
-#endif
-
 /*
  * See set_mce_nospec().
  *
@@ -1830,7 +1775,7 @@ static int __cpa_process_fault(struct cpa_data *cpa, unsigned long vaddr,
 		cpa->pfn = __pa(vaddr) >> PAGE_SHIFT;
 		return 0;
 
-	} else if (__cpa_pfn_in_highmap(cpa->pfn)) {
+	} else if (pfn_is_kernel(cpa->pfn)) {
 		/* Faults in the highmap are OK, so do not warn: */
 		return -EFAULT;
 	} else {
@@ -1968,7 +1913,7 @@ static int cpa_process_alias(struct cpa_data *cpa)
 	 * to touch the high mapped kernel as well:
 	 */
 	if (!within(vaddr, (unsigned long)_text, _brk_end) &&
-	    __cpa_pfn_in_highmap(cpa->pfn)) {
+	    pfn_is_kernel(cpa->pfn)) {
 		unsigned long temp_cpa_vaddr = (cpa->pfn << PAGE_SHIFT) +
 					       __START_KERNEL_map - phys_base;
 		alias_cpa = *cpa;
@@ -2026,7 +1971,8 @@ static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary)
 		if (ret)
 			goto out;
 
-		if (primary && !(cpa->flags & CPA_NO_CHECK_ALIAS)) {
+		if (primary && !(cpa->flags & CPA_NO_CHECK_ALIAS) &&
+		    cpa_should_update_alias(__cpa_addr(cpa, cpa->curpage), cpa->pfn)) {
 			ret = cpa_process_alias(cpa);
 			if (ret)
 				goto out;

-- 
2.53.0


