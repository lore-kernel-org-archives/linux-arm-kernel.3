Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83394CD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 21:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iWJAgQi4oKuW2SmCMvd6aV8Dovou08mStee+1kdn5E=; b=qaGSSNnTNMlwITZ8tYYxn7Eu68
	hzU3eZOseyOgfcweTWnGls/dnNoVSwp8gLsIYV6qFZWx2S3y7ElPwBtAxqSBC5rrHOT7wAwauHz8L
	4lVo0pPF7K9+anwCFn44bpqynctgOc+pTGqAj6P++sMZMKe7sCh1qbGJLB4xKY/oMM+EM38yrMQ1v
	CUBqm1x7h28+P9KFmryrxx6ZbNaLfJWqVAzZu4FN809KR5Oq/RrdDcTBT7SswlNKTCo+nnKs6T0+Y
	cG7/keSc+eOr8pzsHOdpwM2MRiGuuSDOc1CWEzHG9l6w4+DS37qU2qwikqRnxUTfdOLxqJ6m4o4Lr
	VvnSXJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOimr-0000000DTVD-1g8r;
	Sun, 17 May 2026 21:12:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOimp-0000000DTU8-3AxT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 21:12:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC8DA60125;
	Sun, 17 May 2026 21:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486A8C2BCB0;
	Sun, 17 May 2026 21:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779052354;
	bh=lZMt7EeGweQBM8J04DT8IEIlqL67jEh2Cou/ilga+x8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=geQeZKjxEjS+TADDQiW3/Hk4Ib4ehBp1PEBUO0IfZ1T9bq8og/X2dB89Bm1k5WrpR
	 Czd0x03WoFAwbR/BB2nE6FNY6PZlzObFQI3cYSwRqipNQA6OJMCKHIsMq9v9Zl31Zb
	 Z4Jlpav0WehlNk3Fj3TIIFav3v4W0EF8O2ez0X5EYr4mSZuTCDB7YHwDtlqtKB+mwB
	 pqSQoPNyTZwQn6wf0w6i2KiStQ9K37NJkQMnV1+FR9G9thZbYQY+b1/sfLxk2Y9A3z
	 ZfJAqvLl8klQZvncSTNcOMZOfGj0cgLoB3bLzLNi5TY4/1huIi0sLWcEtkPGXt5Zj3
	 zXgu+kP27ilVg==
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	sched-ext@lists.linux.dev,
	bpf@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Tejun Heo <tj@kernel.org>
Subject: [PATCH 1/8] mm: Add ptep_try_install() for lockless empty-slot installs
Date: Sun, 17 May 2026 11:12:25 -1000
Message-ID: <20260517211232.1670594-2-tj@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260517211232.1670594-1-tj@kernel.org>
References: <20260517211232.1670594-1-tj@kernel.org>
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

Add ptep_try_install(ptep, new_pte): atomically set *ptep to new_pte
iff it is currently pte_none(). Returns true on success, false if the
slot was already populated or the arch has no implementation.

The intended caller is the upcoming bpf_arena kernel-side fault
recovery path. The install runs from a page fault and may have to
contend with locks already held by the faulting kernel caller, so
keeping it lock-free via cmpxchg is the safe choice.

The generic version in <linux/pgtable.h> returns false. x86 and arm64
override with try_cmpxchg-based implementations on the underlying
pteval. Other architectures get the false stub - the callers there
already fall through to oops.

Suggested-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  8 ++++++++
 arch/x86/include/asm/pgtable.h   |  8 ++++++++
 include/linux/pgtable.h          | 16 ++++++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 9029b81ccbe8..eb1dd59aaea3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1830,6 +1830,14 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 	return __ptep_get_and_clear(mm, addr, ptep);
 }
 
+#define __HAVE_ARCH_PTEP_TRY_INSTALL
+static inline bool ptep_try_install(pte_t *ptep, pte_t new_pte)
+{
+	pteval_t old = 0;
+
+	return try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte));
+}
+
 #define test_and_clear_young_ptes test_and_clear_young_ptes
 static inline bool test_and_clear_young_ptes(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *ptep, unsigned int nr)
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 13e3e9a054cb..afff54a77ffd 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1284,6 +1284,14 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm,
 	} while (!try_cmpxchg((long *)&ptep->pte, (long *)&old_pte, *(long *)&new_pte));
 }
 
+#define __HAVE_ARCH_PTEP_TRY_INSTALL
+static inline bool ptep_try_install(pte_t *ptep, pte_t new_pte)
+{
+	pte_t old_pte = __pte(0);
+
+	return try_cmpxchg((long *)&ptep->pte, (long *)&old_pte, *(long *)&new_pte);
+}
+
 #define flush_tlb_fix_spurious_fault(vma, address, ptep) do { } while (0)
 
 #define  __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cdd68ed3ae1a..60a4afdc9131 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1036,6 +1036,22 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
 }
 #endif
 
+#ifndef __HAVE_ARCH_PTEP_TRY_INSTALL
+/**
+ * ptep_try_install - atomically install an empty PTE
+ * @ptep: page table entry
+ * @new_pte: value to install
+ *
+ * Atomically set *@ptep to @new_pte iff *@ptep is pte_none(). Return
+ * true on success. Architectures opt in by providing a cmpxchg-based
+ * override. The generic stub returns false.
+ */
+static inline bool ptep_try_install(pte_t *ptep, pte_t new_pte)
+{
+	return false;
+}
+#endif
+
 #ifndef wrprotect_ptes
 /**
  * wrprotect_ptes - Write-protect PTEs that map consecutive pages of the same
-- 
2.54.0


