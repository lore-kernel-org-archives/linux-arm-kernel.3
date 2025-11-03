Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0527DCCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luTt7olzOjGu/Uxdl/vwJIo/oU+7psuC57PJNGjdwTU=; b=DrtA1Gw6yaXG6HrzI0KS2LZ11/
	j+WoKeyf5kJFLOHO/BsDWmpi8vN1L4hdT7qwMe3WZjxB/y96rNnR6mUUUd5RDMj+tA8Hd6F0O387y
	r3iOAnreaaPLuH9lKHhCpM/eaaiU2UjJB6yuye4gh4NEsvV+6X422BEQX3bSldxeqGRUAKhSQoO8e
	hoZsBHVLZQZi9lmDEiKSK8d0zd2ukvYUplhK3UZP1G+qGxn8BGoQukzNZqzGQDUnILlNmPyKWfO5S
	QR7vN6HhLKMUzIZglna66duWDQErAcArQONM6/ty9mMAnSynKVi3i+nloi2flaB1QBw0V8q70MQgQ
	16jewNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5R-00000009DxG-3FmR;
	Mon, 03 Nov 2025 05:26:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5P-00000009Due-22lf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 05:26:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF7E5292B;
	Sun,  2 Nov 2025 21:26:26 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 479CF3F63F;
	Sun,  2 Nov 2025 21:26:33 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64/mm: Describe 52 PA folding into TTBRx_EL1
Date: Mon,  3 Nov 2025 05:26:17 +0000
Message-Id: <20251103052618.586763-6-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20251103052618.586763-1-anshuman.khandual@arm.com>
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_212635_649222_36E3AA45 
X-CRM114-Status: GOOD (  10.29  )
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

A 52 bit physical address gets stored in TTBR_BADDR_MASK_52 in a folded
manner. Shifting PA[51:0] right ward by '46' bits aligns PA[51:48] into
TTBRx_EL1[5:2] which gets ORed for the final TTBRx_EL1 encoding.

Define TTBR_BADDR_HIGH_52_PA_PIVOT which describes this inflection point
where this right shift is done thus bringing some clarity to this 52 PA
address folding process in TTBRx_EL1.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/assembler.h     |  2 +-
 arch/arm64/include/asm/pgtable-hwdef.h | 14 ++++++++++++++
 arch/arm64/include/asm/pgtable.h       |  3 ++-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index d5eb09fc5f8a..731b29d0506c 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -605,7 +605,7 @@ alternative_endif
  */
 	.macro	phys_to_ttbr, ttbr, phys
 #ifdef CONFIG_ARM64_PA_BITS_52
-	orr	\ttbr, \phys, \phys, lsr #46
+	orr	\ttbr, \phys, \phys, lsr #TTBR_BADDR_52_PA_PIVOT
 	and	\ttbr, \ttbr, #TTBR_BADDR_MASK_52
 #else
 	mov	\ttbr, \phys
diff --git a/arch/arm64/include/asm/pgtable-hwdef.h b/arch/arm64/include/asm/pgtable-hwdef.h
index e192c4dc624b..fb9f651375a9 100644
--- a/arch/arm64/include/asm/pgtable-hwdef.h
+++ b/arch/arm64/include/asm/pgtable-hwdef.h
@@ -333,6 +333,20 @@
  * TTBR_ELx[1] is RES0 in this configuration.
  */
 #define TTBR_BADDR_MASK_52	(TTBRx_EL1_BADDR_MASK & ~GENMASK(1, 1))
+
+/*
+ * A 52 bit physical address gets stored in TTBR_BADDR_MASK_52 i.e
+ * GENMASK(47, 2) in a folded manner. Shifting PA[51:0] right ward
+ * by 46 bits aligns PA[51:48] into TTBRx_EL1[5:2] which gets ORed
+ * subsequently for the final TTBRx_EL1 encoding.
+ *
+ * 47                                              5          2  0
+ * +----------------------------------------------+-----------+--+
+ * |                      PA[47:X]                | PA[51:48] |  |
+ * +----------------------------------------------+-----------+--+
+ *
+ */
+#define TTBR_BADDR_52_PA_PIVOT 46
 #endif
 
 #ifdef CONFIG_ARM64_VA_BITS_52
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c3110040c137..3457045c1045 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1602,7 +1602,8 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #define update_mmu_cache_pmd(vma, address, pmd) do { } while (0)
 
 #ifdef CONFIG_ARM64_PA_BITS_52
-#define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
+#define phys_to_ttbr(addr)	(((addr) | ((addr) >> TTBR_BADDR_52_PA_PIVOT)) & \
+				 TTBR_BADDR_MASK_52)
 #else
 #define phys_to_ttbr(addr)	(addr & TTBRx_EL1_BADDR_MASK)
 #endif
-- 
2.30.2


