Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF2C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIZhGnigxQeniz/pqQO7mXj7CCL2nhO/uVgxmBbLKD8=; b=JOp2cXMZd+aeHoHaFWWWHCpDrB
	RPALipHVV3dGUSjc8iujGF2meKT7WtM7/ljcZq4oaxyWdXP+/E58KaIZEM8v5iW1m8EDu1oPaIrDg
	ZzLAgo33rziq0dZKzTROTwVtdZbpZ9+steAr4LnV6G4iwKfihVlSRfrnVpSZUZ3Ly/L1XC5a7pMUt
	cnBt13Is1HYMQiVBS/06DRfvR5OYQIB+DsVvsvb0n1GeJm1Br+6NEKw1UkAVGSQyET/jMppLGJNOx
	COE6ROzP8e9fowrOuYtyQBIYJyWBBP1gdu2DNqVg20MWVlcAlF9FUasf4wzZ3NtzipLHj1KDurOEZ
	OyurnJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhS-0000000GCJg-3SRo;
	Wed, 08 Jul 2026 03:11:50 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhK-0000000GC97-2GXZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:44 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-380c178acfbso216141a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480301; x=1784085101; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIZhGnigxQeniz/pqQO7mXj7CCL2nhO/uVgxmBbLKD8=;
        b=RmUx0VcLt94eww85fD0MAl7u0+vsVMLW3RzchXx0DwHSfHvGN1mzozg0+tI4CPqmvy
         0Decgl3LE8hz9Whiaw3VS7MIcHfz/i4VmYJBlFKV0a9LhD6vjkP9KBSAy8NLTDRg7Ewt
         e2QW+9eUwIZoAb2ejwndW70sL6TM0XKEFTyY0iyYNI3nmmAp6VfY/dimT+ruhjVsTuvl
         l+wqizJLYM0EdtR7s6df+pwrL6YEFlLITt8zFvQQ7nsg4PetzydaP1KzKIZr31eLGunQ
         DrKTRy2JB3mTs8W/R4Z/8mLuTOiJG0cEe+SK2c8HDNTR+7Wg8Y+2qTgdLwpKOsnPxgw+
         HENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480301; x=1784085101;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIZhGnigxQeniz/pqQO7mXj7CCL2nhO/uVgxmBbLKD8=;
        b=n6qEB1gXiagh04Ei2Ar2cnFs0BOVjEvJsqKYSPt+vfaZwbBJvPRnLPXAkSHzYs7mQd
         DR1IZfDGQTrro+8TWvIMPSQE/AOmOvjlPKbMroHTg+yj+wJoPNMwbm8IFKCkG16YX33f
         jjOOJD0UdpTN0CiXV+xwA9OspdOQcrK6j5N5NNlrGmOczNWd21g+iL/aI+qoAWbxht9v
         fiwZwBDvEAazvz+goHG4vpJa0RH0O5t6WAHthzkW7V625yHrYHc564mTfeSHljbDWYWG
         IfvS8u8P9nVEsW7dXxkhtS5nX8o7f7Bch/uonKI+YI3TlOWUleErbLu4dn4v61tJuwF8
         h+0A==
X-Forwarded-Encrypted: i=1; AHgh+RqXFFiNb08YqTca0R/FgCZz2iSqfhFfpQE8cheAFsOOgTi6Q/3L5X/sUEkv6G1/YcoWG/NgZFN9MiVsSrCi41qW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjdj1IVrh2sTs11ay+yEkqF2Cxy7BzR9VLpQMxLp/OHmmfVoo1
	rCi1Jg1yROdm/wvSEDh+XHN1lVGNUp7BeEFxk0SHTnnuZJ0r7lqtQ8eRj39Vh+5otLIEiYbRdYP
	5BxnnDVKSSjtV4KdNFZe7Ng==
X-Received: from pjzt12.prod.google.com ([2002:a17:90b:58c:b0:381:1463:3959])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1d04:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-3893fe5d4a2mr640925a91.12.1783480300469;
 Tue, 07 Jul 2026 20:11:40 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:18 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-9-jthoughton@google.com>
Subject: [PATCH 08/18] arm64: Implement try_update_vmemmap_pte using the AF trick
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201142_727539_F4E840CD 
X-CRM114-Status: GOOD (  18.21  )
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
clearing the AF will introduce potential faults. system_supports_hvo()
will return false if any CPUs on the system do not support HW AF.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgtable.h | 53 ++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 5f21d3a738ee..7b11aa41d0a0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1302,8 +1302,7 @@ static inline void __pte_clear(struct mm_struct *mm,
 	__set_pte(ptep, __pte(0));
 }
 
-static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep)
+static inline pte_t __ptep_clear_young(pte_t *ptep)
 {
 	pte_t old_pte, pte;
 
@@ -1315,7 +1314,13 @@ static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
 					       pte_val(old_pte), pte_val(pte));
 	} while (pte_val(pte) != pte_val(old_pte));
 
-	return pte_young(pte);
+	return pte;
+}
+
+static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pte_t *ptep)
+{
+	return pte_young(__ptep_clear_young(ptep));
 }
 
 static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
@@ -1793,6 +1798,48 @@ static inline void pte_clear(struct mm_struct *mm,
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
+	if (!system_supports_hvo())
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
2.55.0.795.g602f6c329a-goog


