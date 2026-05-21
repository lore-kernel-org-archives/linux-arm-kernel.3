Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB21CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTFgAI5+g/ZgVcx5rn1Gd2C4qroBObowYD4jATuhKq4=; b=I+8BYqnSJ72EZduffiMAbrnGNT
	qH1j4/q6QHgZDXFQ6j0hKRyK8Po+7fRFWT2R4NNvqNMt1nz3XKWUe8o1XcU0s5tA4UZ0vJJWjkJ7d
	8OEU1pwjmYlqeCritXkM38cPtENfrSchjp49WkzRccuabYy+2Eki+EJrv0f6k09pc7UDYqFpdo3Dr
	yeKiuVXQuRf2jIC2RMrYElwDTKFgUUWcLnrdOu93DaQR739bzi718gYSjVG/qaLBC91mCZzcjZSA/
	phO7rdjp7o2SJ3jh+U6C71Y3pLgvyMFvd2yIPEc95axRq5Y8Z1QcLFWCZ8rkQbwJwEHkE2qf0oBvk
	Sjp51nug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7L7-00000008ex0-449i;
	Thu, 21 May 2026 17:37:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ7L6-00000008ewW-42uj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:37:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6DC360098;
	Thu, 21 May 2026 17:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9DA1F000E9;
	Thu, 21 May 2026 17:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779385063;
	bh=OTFgAI5+g/ZgVcx5rn1Gd2C4qroBObowYD4jATuhKq4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xosnl8w4xqyXhUPK/Cb+MISPIwicQwhADito8BUh9dDkvfvpODxD9MTB8u70z+7wl
	 L3kr0hvYwL+Hf+1Sa+M1Q92nT9ciMgpQN2nCC9R956kEB23wmKIjav+lBJZvFMsRB+
	 ts91inVLZgtz7PZbCy4ip5gTktaIlB+m8FpohdSwZyO/S4HUJAEpXfxokKC5aOULBz
	 T+Yzo1MVYw4CPBTfY1CFYnLxpWvmsNxyZdhXmYJNqjG3y6lQFgQYjOLldBZkyhrN9k
	 Ywa8Ht93fLlJ7IYT3N9+mnNAzsYUn7nsBvBonKjBxjjv/T8sMG/95Lev5jvy20+pWB
	 DjjZr5uOA/igg==
Date: Thu, 21 May 2026 07:37:42 -1000
Message-ID: <8dc7b56d0f9ef4ef5b8c41f86ab97f3f@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] mm: Add ptep_try_set() for lockless empty-slot installs
In-Reply-To: <20260520235052.4180316-2-tj@kernel.org>
References: <20260520235052.4180316-1-tj@kernel.org>
 <20260520235052.4180316-2-tj@kernel.org>
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

Add ptep_try_set(ptep, new_pte): atomically set *ptep to new_pte iff it is
currently pte_none(). Returns true on success, false if the slot was already
populated or the arch has no implementation.

The intended caller is the upcoming bpf_arena kernel-side fault recovery
path. The install runs from a page fault that can be nested under locks
held by the faulting kernel caller (e.g. a BPF program holding
raw_res_spin_lock_irqsave on its arena's spinlock), so trylock-and-retry
would A-A deadlock. Lock-free cmpxchg is the only viable option, which
constrains this helper to special kernel page tables where concurrent
writers cooperate via atomic accessors.

The generic version in <linux/pgtable.h> returns false. x86 and arm64
override with try_cmpxchg-based implementations on the underlying pteval.
Other architectures get the false stub - the callers there already fall
through to oops.

v2: Rename to ptep_try_set(). Tighten kerneldoc. (David, Alexei)
v3: Note that strict-zero cmpxchg is narrower than pte_none(). (Andrea)

Suggested-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Tejun Heo <tj@kernel.org>
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Cc: David Hildenbrand <david@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |    8 ++++++++
 arch/x86/include/asm/pgtable.h   |   12 ++++++++++++
 include/linux/pgtable.h          |   25 +++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1830,6 +1830,14 @@ static inline pte_t ptep_get_and_clear(s
 	return __ptep_get_and_clear(mm, addr, ptep);
 }
 
+static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
+{
+	pteval_t old = 0;
+
+	return try_cmpxchg(&pte_val(*ptep), &old, pte_val(new_pte));
+}
+#define ptep_try_set ptep_try_set
+
 #define test_and_clear_young_ptes test_and_clear_young_ptes
 static inline bool test_and_clear_young_ptes(struct vm_area_struct *vma,
 		unsigned long addr, pte_t *ptep, unsigned int nr)
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1284,6 +1284,18 @@ static inline void ptep_set_wrprotect(st
 	} while (!try_cmpxchg((long *)&ptep->pte, (long *)&old_pte, *(long *)&new_pte));
 }
 
+/*
+ * Note: strictly-zero compare is narrower than pte_none(), but the gap is
+ * harmless: _PAGE_DIRTY and _PAGE_ACCESSED aren't set on untouched kernel PTEs.
+ */
+static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
+{
+	pte_t old_pte = __pte(0);
+
+	return try_cmpxchg((long *)&ptep->pte, (long *)&old_pte, *(long *)&new_pte);
+}
+#define ptep_try_set ptep_try_set
+
 #define flush_tlb_fix_spurious_fault(vma, address, ptep) do { } while (0)
 
 #define  __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1036,6 +1036,31 @@ static inline void ptep_set_wrprotect(st
 }
 #endif
 
+#ifndef ptep_try_set
+/**
+ * ptep_try_set - atomically set an empty kernel PTE
+ * @ptep: page table entry
+ * @new_pte: value to install
+ *
+ * Atomically set *@ptep to @new_pte iff *@ptep is pte_none(). Return true on
+ * success, false if the slot was already populated or the arch has no
+ * implementation.
+ *
+ * For special kernel page tables only - never user page tables. The caller must
+ * prevent concurrent teardown of @ptep and must accept that other writers may
+ * race. Concurrent clearers must use ptep_get_and_clear() so racing accesses
+ * agree on the outcome.
+ *
+ * Architectures opt in by providing a cmpxchg-based override and defining
+ * ptep_try_set as an identity macro. The generic stub returns false, which is
+ * correct for callers that fall through to oops on failure.
+ */
+static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
+{
+	return false;
+}
+#endif
+
 #ifndef wrprotect_ptes
 /**
  * wrprotect_ptes - Write-protect PTEs that map consecutive pages of the same

