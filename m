Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E8DD3940B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/L8lkXUpPogeX4jhGnWZtuXaNGYlu/3wjmcEpj1tptc=; b=JLvZY4aNo/ni3aFJledQgFppxH
	wuyWGzqiUJnlllDn7riMQ4LJ8IZbeokKZhXVG1SFfQuE3Ls89Yl0EXx7SGMPfa8w12l3f8zaDcFYD
	YTdxUgsI/Kz/mg9Ts03PoXUl3McpB1fxdJd/NRUXCkwdgRhHrM29tyowIFhPdKYjrTPpEdijNJlfS
	x2dNsHVKdckPd31+knMdORx9e+eMSe0pDWI+2xFttP8zY/0Yb3cMHSU9bYwYlZ7fjIuO8pLqIgCMb
	P9t6VFZXCd3Wp/oyS9U1eCulJRoqsDpa5iKyBL0mdf2WZXEfSmhyeubTxX5ah+6OEsHWrMex38IF1
	uXIToxKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8F2m-0000000HNc0-0g8S;
	Thu, 02 Apr 2026 10:12:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8F2k-0000000HNa1-0JiI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:12:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC84632E4;
	Thu,  2 Apr 2026 03:12:46 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99E233F915;
	Thu,  2 Apr 2026 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775124772; bh=0hsScL5Jq+W2z3914Dx1/1N6cYL7m7yWJjXp55/auu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pfExGyOiu3aCrGcOFEKUtsb1odSjfV3tb/aNXcLd5drc4wA2PQ6Ab78tGzkSSpxwQ
	 Ryuaev5ok6FZpqLaDUyyEsk+pvrRcmFK35ovehJ6K334E31I0ez+GrH1T7YEjNtHKZ
	 5nq5qXRj0zneYsdXyWXzmyfVVyWykv+Y7XfjTWVI=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 2/4] arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
Date: Thu,  2 Apr 2026 11:12:42 +0100
Message-ID: <20260402101246.3870036-3-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402101246.3870036-1-catalin.marinas@arm.com>
References: <20260402101246.3870036-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_031254_155468_F1D4758F 
X-CRM114-Status: GOOD (  11.57  )
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

The mm structure will be used for workarounds that need limiting to
specific tasks.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 8 ++++----
 arch/arm64/kernel/sys_compat.c    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index f41eebf00990..262791191935 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -185,7 +185,7 @@ do {										\
  * Complete broadcast TLB maintenance issued by the host which invalidates
  * stage 1 information in the host's own translation regime.
  */
-static inline void __tlbi_sync_s1ish(void)
+static inline void __tlbi_sync_s1ish(struct mm_struct *mm)
 {
 	dsb(ish);
 	__repeat_tlbi_sync(vale1is, 0);
@@ -323,7 +323,7 @@ static inline void flush_tlb_mm(struct mm_struct *mm)
 	asid = __TLBI_VADDR(0, ASID(mm));
 	__tlbi(aside1is, asid);
 	__tlbi_user(aside1is, asid);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish(mm);
 	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
 }
 
@@ -377,7 +377,7 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
 				  unsigned long uaddr)
 {
 	flush_tlb_page_nosync(vma, uaddr);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish(vma->vm_mm);
 }
 
 static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
@@ -532,7 +532,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 {
 	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
 				 last_level, tlb_level);
-	__tlbi_sync_s1ish();
+	__tlbi_sync_s1ish(vma->vm_mm);
 }
 
 static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
diff --git a/arch/arm64/kernel/sys_compat.c b/arch/arm64/kernel/sys_compat.c
index b9d4998c97ef..03fde2677d5b 100644
--- a/arch/arm64/kernel/sys_compat.c
+++ b/arch/arm64/kernel/sys_compat.c
@@ -37,7 +37,7 @@ __do_compat_cache_op(unsigned long start, unsigned long end)
 			 * We pick the reserved-ASID to minimise the impact.
 			 */
 			__tlbi(aside1is, __TLBI_VADDR(0, 0));
-			__tlbi_sync_s1ish();
+			__tlbi_sync_s1ish(current->mm);
 		}
 
 		ret = caches_clean_inval_user_pou(start, start + chunk);

