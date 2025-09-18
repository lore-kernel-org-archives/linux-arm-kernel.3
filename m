Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327C4CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nip0yo5PTO//am3EC32D1CYwmKvaSNonQ+hXppsSyBA=; b=QgybhuRRC9e99BXd1FkLqi0BL+
	QgyrivjV7OOllUYmGS3xnTA1mv5O/9f6BD1wB/KO/mMv9o+DtHoSI6yGlcAqbSmW+Ko1UY/t1NEHY
	4CLT8yO5Mw6Edo8TzCzolrJH+szb6H3L7I55NhUtBqoWEJXFpOLNpg0Vhw38uJdxOPBCvRODWXodW
	GFCEJ+UmDUGsh2Xnwk+mrn4FB4dSXUB9KqFrj6XosENnLuPBdj0mM2NQXbLnJjyxGkSPktIS8S2ay
	FXYvoXGh6bCXdQ9BOypt9gv6fWqWFWMrnkg6o2SQUkK3Fz9GyCmdW+Y4gHDMOxWZpW+kDjQKXi8y0
	wkb7Pr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC0U-0000000H6N0-08ZK;
	Thu, 18 Sep 2025 10:36:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC0Q-0000000H6Ma-3eaY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:36:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 073451A25;
	Thu, 18 Sep 2025 03:36:40 -0700 (PDT)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1A4A3F673;
	Thu, 18 Sep 2025 03:36:44 -0700 (PDT)
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
Subject: [PATCH] arm64/mm: Elide TLB flush in certain pte protection transitions
Date: Thu, 18 Sep 2025 16:06:38 +0530
Message-Id: <20250918103638.77282-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033650_945770_69CF2547 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
2.95 microseconds, giving an 8.5% improvement.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
mm-selftests pass. Based on 6.17-rc6.

 arch/arm64/include/asm/tlbflush.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index 18a5dc0c9a54..4a566d589100 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -524,6 +524,35 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
 {
 	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
 }
+
+static inline bool __pte_flags_need_flush(pteval_t oldval, pteval_t newval)
+{
+	pteval_t diff = oldval ^ newval;
+
+	/* invalid to valid transition requires no flush */
+	if (!(oldval & PTE_VALID) || (oldval & PTE_PRESENT_INVALID))
+		return false;
+
+	/* Transition in the SW bits and access flag requires no flush */
+	diff &= ~(PTE_SWBITS_MASK | PTE_AF);
+
+	if (!diff)
+		return false;
+	return true;
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


