Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06227CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 05:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dtHpSjYzrfzklxwCsYrObvn6BfyAdNDIPTbgxd2+vUo=; b=PGV0ogke/DABztutCPloJ6D5kU
	pnmAn84SQSLyBmyoGAIPkYmY7Tbe84dvwceUIq932X4/+gxuwqc0BB7W/Y7Kepo+2f79xujRZrxMO
	ijZjagHFdOR0COOoYo3nOU+Rd8y/3hI+trApa+eW31MPV0m4y/9d9ioct3XT+QKoycb7lhrt7pTdb
	JOdzsIKzOkLQh/imv4uun84ZrqBeKF9uho0oJS9Gk2IULyekkjdiOXbPACx3S53aYAoXmmxQNEZ95
	ugEnHlbAfSqQpihpzPxY3htdWzLQ/+muWkAVKPJV0l7X3ualqiDNVnUHcIVBTu0rb5SvWLYgd0J2O
	kwin9VaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzpsF-00000004lw5-3gnF;
	Sat, 20 Sep 2025 05:11:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzpsD-00000004luZ-3ZF4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 05:11:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 767B41688;
	Fri, 19 Sep 2025 22:10:52 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.75.121])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AB8F93F673;
	Fri, 19 Sep 2025 22:10:56 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: anshuman.khandual@arm.com,
	wangkefeng.wang@huawei.com,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	pjaroszynski@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH v2] arm64/mm: Elide TLB flush in certain pte protection transitions
Date: Sat, 20 Sep 2025 10:40:43 +0530
Message-Id: <20250920051043.16421-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_221101_926213_5084EFE0 
X-CRM114-Status: GOOD (  10.57  )
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

Currently arm64 does an unconditional TLB flush in mprotect(). This is not
required for some cases, for example, when changing from PROT_NONE to
PROT_READ | PROT_WRITE (a real usecase - glibc malloc does this to emulate
growing into the non-main heaps), and unsetting uffd-wp in a range.

Therefore, implement pte_needs_flush() for arm64, which is already
implemented by some other arches as well.

Running a userspace program changing permissions back and forth between
PROT_NONE and PROT_READ | PROT_WRITE, and measuring the average time taken
for the none->rw transition, I get a reduction from 3.2 microseconds to
2.85 microseconds, giving a 12.3% improvement.

Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
---
mm-selftests pass.

v1->v2:
 - Drop PTE_PRESENT_INVALID and PTE_AF checks, use ptdesc_t instead of
   pteval_t, return !!diff (Ryan)

 arch/arm64/include/asm/tlbflush.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 18a5dc0c9a54..40df783ba09a 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -524,6 +524,33 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 {
 	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
 }
+
+static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
+{
+	ptdesc_t diff = oldval ^ newval;
+
+	/* invalid to valid transition requires no flush */
+	if (!(oldval & PTE_VALID))
+		return false;
+
+	/* Transition in the SW bits requires no flush */
+	diff &= ~PTE_SWBITS_MASK;
+
+	return !!diff;
+}
+
+static inline bool pte_needs_flush(pte_t oldpte, pte_t newpte)
+{
+	return __pte_flags_need_flush(pte_val(oldpte), pte_val(newpte));
+}
+#define pte_needs_flush pte_needs_flush
+
+static inline bool huge_pmd_needs_flush(pmd_t oldpmd, pmd_t newpmd)
+{
+	return __pte_flags_need_flush(pmd_val(oldpmd), pmd_val(newpmd));
+}
+#define huge_pmd_needs_flush huge_pmd_needs_flush
+
 #endif
 
 #endif
-- 
2.30.2


