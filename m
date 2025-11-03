Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AD9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8+i7xth5y9Fhal1XtZY4aF00hz1zrbFRsT2/r8BRfw=; b=gLBkVVE6O+i5fsw3zV6RpyEv1D
	+2XCoeAhejusfsqqZgpdupdl9SBi0ZuOLXsdF+EyiCEZ5QhqpHibHcZwRNysm3/P9YOpe4qZRYE19
	JLtO4t6gtGtT+9Wq2qXxbDtd1iVyI6m4Y9408XeiCk10ZzZwVO5dsHzXO+UyUTKCWyWljAR64VNsW
	IuxHoc5Btl4nBJkBa9BTO9t47aqIgoFON3XMOJARCaAWmjZ2n3pvhyIi3X5ZQsokwxGReXWZnAiVF
	puTR0IeC+GwrQZjF8F73F1Q2Y20u/dsePhXy2z/3jJSnAjxxzxlgkKhZs9rz+MB57hDxMnTo8wJAL
	h5V8/o2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5P-00000009DvR-3xca;
	Mon, 03 Nov 2025 05:26:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5O-00000009Due-07DO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 05:26:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E2C328FA;
	Sun,  2 Nov 2025 21:26:25 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 891F23F63F;
	Sun,  2 Nov 2025 21:26:31 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64/mm: Ensure correct 48 bit PA gets into TTBRx_EL1
Date: Mon,  3 Nov 2025 05:26:16 +0000
Message-Id: <20251103052618.586763-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20251103052618.586763-1-anshuman.khandual@arm.com>
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_212634_104436_5FD0B630 
X-CRM114-Status: UNSURE (   9.63  )
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

Even though 48 bit PA representation in TTBRx_EL1 does not involve shifting
partial bits like 52 bit variant does, they sill need to be masked properly
for correctness. Hence mask 48 bit PA with TTBRx_EL1_BADDR_MASK.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/assembler.h | 1 +
 arch/arm64/include/asm/pgtable.h   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 23be85d93348..d5eb09fc5f8a 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -609,6 +609,7 @@ alternative_endif
 	and	\ttbr, \ttbr, #TTBR_BADDR_MASK_52
 #else
 	mov	\ttbr, \phys
+	and	\ttbr, \ttbr, #TTBRx_EL1_BADDR_MASK
 #endif
 	.endm
 
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0944e296dd4a..c3110040c137 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1604,7 +1604,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 #ifdef CONFIG_ARM64_PA_BITS_52
 #define phys_to_ttbr(addr)	(((addr) | ((addr) >> 46)) & TTBR_BADDR_MASK_52)
 #else
-#define phys_to_ttbr(addr)	(addr)
+#define phys_to_ttbr(addr)	(addr & TTBRx_EL1_BADDR_MASK)
 #endif
 
 /*
-- 
2.30.2


