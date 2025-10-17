Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1240BCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GeezqfLobkHMMeX6EwZEjl/3YmvgXMO5jnKVg/JuO6c=; b=yaogYHQiMMub6jPoaM5LZ2UHY9
	yLj6l8wuOVf+h9JEE0XFgcah7UlhZOvOXkAtQOXembGbsrJmf3O7rt7IdUku8FueSvMm8tZbKSOWl
	3IF4Dg0S9u1gS0QuhAJw2bw3aad5oOoxbZH4bVusouYwWS2ltny9T+gWJqCS8PZHUgQOtA7KWO1rv
	pwdIah0aIcn8mxD+jnMuclASRoUSFWpF7CTmudObIwjdbkrsf9ouGnMhp/6o04rUZMS2W2HCE/rj/
	9DcgFl4QzfX83Vk+3ajpm79FCm5XInuwye2ejF7Z77a8qN2XZ8BxRiFYSxmBluqQeG7yNfcJzxBhN
	4y3ZPywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mv2-00000008McS-0h2K;
	Fri, 17 Oct 2025 16:03:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mv0-00000008MbT-0bNc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:03:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DEE281595;
	Fri, 17 Oct 2025 09:02:52 -0700 (PDT)
Received: from localhost.localdomain (unknown [10.163.68.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F9F33F59E;
	Fri, 17 Oct 2025 09:02:56 -0700 (PDT)
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
Subject: [RESEND] [PATCH v2] arm64/mm: Elide TLB flush in certain pte protection transitions
Date: Fri, 17 Oct 2025 21:32:51 +0530
Message-Id: <20251017160251.96717-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_090302_246035_1F5EEC0F 
X-CRM114-Status: GOOD (  10.11  )
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
mm-selftests pass. Based on 6.18-rc1.

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


