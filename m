Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B67CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 01:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VjIDdEMsxckzeTQAC8VMO9zeN/fS3+8A2YCNQtbhGo=; b=zPyNRvufOpKz1Hi0Lyf6OWBQsd
	5fV11Tr4W+u+esI4JKLtf2Wtj3oz6lzMsKojKURUKL5lITihVuMnDXRjLw+ir5X8qUQk1OW+PGUsc
	BvI2sJo/wsU3/jrvQB9tUxXjVBm/HQcdBqr+npVu7Q1a7ET49dqePAZpVa0HnbmkNhiggVSB1xfNX
	dBlVcGuPS1pUyWc0cNDd3mPrP/JEMWL7k5lgnpMlpR88JdDV25O/AXKkIpGBA2bOqB6hiC3tjntkR
	+YW9vNvwL7JSzIVQWbQ9HRffdUcGAGeK5ZTO9ynZsuCz1SAq+C7ro+x3uvgftA0W7WaQv6NKUvjfb
	O3Xq2g8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVj-0000000CnN7-3k7Z;
	Sat, 03 Oct 2026 00:21:55 +0000
Received: from mail-pf1-x446.google.com ([2607:f8b0:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVa-0000000Cn8q-3ZL2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:48 +0000
Received: by mail-pf1-x446.google.com with SMTP id d2e1a72fcca58-88a1de72cf7so101b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986905; x=1791591705; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VjIDdEMsxckzeTQAC8VMO9zeN/fS3+8A2YCNQtbhGo=;
        b=g5vWAwBCHikyU8oCEesFRyYfUknwtQsZx7MTRfiyeHB0K0Lihqz+gV7rq9AJL30xKQ
         vVkmt8VH57LoQZ/LSAwgTxtVLldggWQwbQUeqcdT0cgHGBoRqIlMzzJHabj76i5P8xyH
         KW7mwB+szzPUIfgWhgD2PrmF5WpYlChVkOu2Uw39IJUTWi3aWNGJohpcXzy9FpF2SDCz
         Gk6ATbi0rR1u/BrLqAHi2dyKbASGuogPGyUweTLhmrQjcSuCNgjAEArSU5IjlEwVxpAf
         V4NmjlbBC5qsKGpFQ2DRabnRWfTYbRehcgjDQ1wVEkbyDIBKp1gkKY7OVh3FrPTbaPdN
         9zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986905; x=1791591705;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4VjIDdEMsxckzeTQAC8VMO9zeN/fS3+8A2YCNQtbhGo=;
        b=vJ/ORTKueOPZO+H/fy9z7HkiKUza3AQgvy1v478JBrY7qJzBmTpYKiUPHT1LVofJCJ
         9elkWNJfP1c8niAIsBQILt2TZLHWAK+gU6agSy4kZLkiBOFHKKxiZ8vvjUQ3XozfHuR9
         QfcHyOUcUB6G300f7tUf7FShjiAPIoBYpED2w8c3UU6JobyXDLGLIA9U1Bs9z36H2pqh
         +ji61EIiZkUGw0LCjo6a0Tn1IgqZZHbd+ilNFINELjwt+jmVH96NXB+hWLuYhIjiSwsC
         7KJ/YzyvGVa7gdaiRRKYAYhQvZDqt06jthFHV16gKH9i5veujgkR6ChB6bh+QfF4bVOG
         PGjA==
X-Forwarded-Encrypted: i=1; AKwUvByGEKEJLyedsCjkYgn4F95vdlE0/PCo7zk/WcUWh4KtYTvCXXfMy4/ky4/YJrAFHJoTjMTUpytoV1/JCYmPFdBP@lists.infradead.org
X-Gm-Message-State: AFuF++n0Yu7f0NGqZKa9s1FBzWFkUcRTQniwHpW7iq+Hc4ZiqBqoDwoS
	EvNTjoCiJAaEqnqnDfbj72ITYO52sgAaqU4ExFoEph1BgqIS0ZeN4b1RPAr/9aNH6mhDlzTkAHi
	3fY2/MBO9ZXGnCkTucBcscg==
X-Received: from pflr17.prod.google.com ([2002:aa7:9891:0:b0:87c:d84f:5ff5])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a245:b0:878:3704:e0ed with SMTP id d2e1a72fcca58-88af5f9362bmr3106493b3a.19.1790986905085;
 Fri, 02 Oct 2026 17:21:45 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:15 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-13-jthoughton@google.com>
Subject: [PATCH v2 12/20] arm64: Implement try_update_vmemmap_pte using the AF trick
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172146_903034_0945A108 
X-CRM114-Status: GOOD (  18.79  )
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

try_update_vmemmap_pte() must modify vmemmap PTEs without introducing a
time window where other CPUs on the system might fault.

Normally a break-before-make sequence is required to avoid conflicts
with cached translations. However, if we can guarantee that the existing
translation cannot be cached, a BBM sequence is not needed.

Translations with the AF unset may not be cached (see Arm ARM Rule
DWZCQ); the implementation of try_update_vmemmap_pte() on arm64 takes
advantage of this fact to replace a PTE without BBM and therefore
without leaving a window open where PE might fault on this translation.

Of course, if some CPUs on the system do not support HW AF management,
clearing the AF will introduce potential faults.
system_supports_bbm_through_af() will return false if any CPUs on the
system do not support HW AF.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgtable.h | 60 +++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e47c3d010715..f8e66bb22c0c 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1249,14 +1249,24 @@ static inline void __pte_clear(struct mm_struct *mm,
 	__set_pte(ptep, __pte(0));
 }
 
-static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep)
+/*
+ * Atomically clear the Accessed flag. Return the old value of the PTE.
+ */
+static inline pte_t __ptep_clear_young(pte_t *ptep)
 {
 	atomic64_t *pteval = (atomic64_t *)&pte_val(*ptep);
 	s64 af_mask = PTE_AF;
 
-	/* Atomically clear PTE_AF, checking that it was set before. */
-	return af_mask & atomic64_fetch_andnot_relaxed(af_mask, pteval);
+	/* Atomically clear PTE_AF. */
+	u64 oldval = atomic64_fetch_andnot_relaxed(af_mask, pteval);
+
+	return __pte(oldval);
+}
+
+static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pte_t *ptep)
+{
+	return pte_young(__ptep_clear_young(ptep));
 }
 
 static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
@@ -1734,6 +1744,48 @@ static inline void pte_clear(struct mm_struct *mm,
 	__pte_clear(mm, addr, ptep);
 }
 
+#define __HAVE_ARCH_TRY_UPDATE_VMEMMAP_PTE
+static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *ptep,
+					 const pte_t pte)
+{
+	const int max_attempts = 16;
+	int attempts = 0;
+	pte_t old_pte;
+
+	if (!system_supports_bbm_through_af())
+		return -EOPNOTSUPP;
+
+	/* This routine is only to be used for valid-to-valid transitions. */
+	if (WARN_ON_ONCE(!pte_valid(pte)))
+		return -EINVAL;
+
+	old_pte = __ptep_get(ptep);
+
+	do {
+		if (WARN_ON_ONCE(!pte_valid(old_pte)))
+			return -EINVAL;
+
+		/* We should never get a contiguous PTE here. */
+		if (WARN_ON_ONCE(pte_valid_cont(old_pte)))
+			return -EINVAL;
+
+		if (pte_young(old_pte)) {
+			/* __ptep_clear_young() returns the overwritten PTE */
+			old_pte = pte_mkold(__ptep_clear_young(ptep));
+
+			flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+		}
+	/*
+	 * Translations without AF cannot be cached, so we can replace
+	 * them without BBM.
+	 */
+	} while (!try_cmpxchg_relaxed(&pte_val(*ptep), &pte_val(old_pte),
+				      pte_val(pte)) &&
+		 ++attempts < max_attempts);
+
+	return attempts == max_attempts ? -EAGAIN : 0;
+}
+
 #define clear_full_ptes clear_full_ptes
 static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, unsigned int nr, int full)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


