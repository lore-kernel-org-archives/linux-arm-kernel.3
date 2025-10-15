Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66396CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 02:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XsK65i3LwGs3tae90tjFNrWeGw+iqQHiFA31OY0PHFg=; b=MEP6c30a+F7zbmmoP9F9cvD+Ep
	Jw3UvLDrfVv0MkzWoNLqYrOfQQuLflfIe+tdll8aWDAKZB8WGkXrAqvdqNl1zJ3FbNFdgBRoqyLYx
	SOHqd9qftU9AQU5l8BRHWJeBFYhItvYnihclw7CQhGZLE833bCOlaq9Aq2P1ZHeYi8BGDjIIBd5Vr
	GS+/stQZcc6/gZX8koU0E6WFcarITJC2DesFU5wRZER9BHGNM+J2XU7w26M0ariI3u4gazsnQSxyE
	Bu4XRHKEjY8/gCZSgGR74mZXBWjmjZuBJGaag2k/44sfnxCDLctsWjTpUsHGYYAMH44L0/aCrNou1
	bksPzXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8qyK-00000000Dzf-38vL;
	Wed, 15 Oct 2025 02:10:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8qyH-00000000Dyr-11nl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 02:10:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B25F1A32;
	Tue, 14 Oct 2025 19:10:24 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD4833F738;
	Tue, 14 Oct 2025 19:10:30 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/mm: Drop cpu_set_[default|idmap]_tcr_t0sz()
Date: Wed, 15 Oct 2025 03:10:24 +0100
Message-Id: <20251015021024.366722-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_191033_317791_DEEAD33A 
X-CRM114-Status: GOOD (  10.00  )
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

These TCR_El1 helpers don't have any other callers. Drop these redundant
indirections completely thus making this code more compact and readable.
No functional change.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/mmu_context.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 1b4ac7b23e18..0375ca3162ff 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -61,11 +61,6 @@ static inline void cpu_switch_mm(pgd_t *pgd, struct mm_struct *mm)
 	cpu_do_switch_mm(virt_to_phys(pgd),mm);
 }
 
-/*
- * TCR.T0SZ value to use when the ID map is active.
- */
-#define idmap_t0sz	TCR_T0SZ(IDMAP_VA_BITS)
-
 /*
  * Ensure TCR.T0SZ is set to the provided value.
  */
@@ -82,9 +77,6 @@ static inline void __cpu_set_tcr_t0sz(unsigned long t0sz)
 	isb();
 }
 
-#define cpu_set_default_tcr_t0sz()	__cpu_set_tcr_t0sz(TCR_T0SZ(vabits_actual))
-#define cpu_set_idmap_tcr_t0sz()	__cpu_set_tcr_t0sz(idmap_t0sz)
-
 /*
  * Remove the idmap from TTBR0_EL1 and install the pgd of the active mm.
  *
@@ -103,7 +95,7 @@ static inline void cpu_uninstall_idmap(void)
 
 	cpu_set_reserved_ttbr0();
 	local_flush_tlb_all();
-	cpu_set_default_tcr_t0sz();
+	__cpu_set_tcr_t0sz(TCR_T0SZ(vabits_actual));
 
 	if (mm != &init_mm && !system_uses_ttbr0_pan())
 		cpu_switch_mm(mm->pgd, mm);
@@ -113,7 +105,7 @@ static inline void cpu_install_idmap(void)
 {
 	cpu_set_reserved_ttbr0();
 	local_flush_tlb_all();
-	cpu_set_idmap_tcr_t0sz();
+	__cpu_set_tcr_t0sz(TCR_T0SZ(IDMAP_VA_BITS));
 
 	cpu_switch_mm(lm_alias(idmap_pg_dir), &init_mm);
 }
-- 
2.30.2


