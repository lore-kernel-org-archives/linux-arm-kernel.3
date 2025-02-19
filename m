Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288ECC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 03:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sBQVhg7w4XL7qp/thUmN+IIR0d6uTx9zG04xquOGLqU=; b=yUkBE2P9wvb4Dnxpa3QjIrhaQf
	rdqY7LZqz/GANYAUYG2mFNXsT/U1/m6QB3Ct+p70P5KSzzArucxPVzPqXnXfaTgmVxExg9XytCKOk
	WN9wIv4JW38fFS+bLCbvjxW7jolTnDkzGslcLgYCjTG/q6UmALsuqb/w0j7g7NtLypvAuvf8jQ3aV
	RVFt2eXQF8BiO7JLv8pVsUE8oiWHjMWhvbvCLS88daite/80qbRtyGIfy3UvGZwvlU87vTr+t6ESa
	iZ7dBsD698MEUf5VBFw58ktpShpT7Ikr3+MFBfkQg0U4atVANKjEDEu5j6QrRt92Q9J5+Z7bTHnsS
	AZN8RRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkbEC-0000000AnKc-2Sx8;
	Wed, 19 Feb 2025 03:58:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkbCh-0000000AnCc-3v0d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 03:56:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D42E1682;
	Tue, 18 Feb 2025 19:57:13 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2FDE3F5A1;
	Tue, 18 Feb 2025 19:56:52 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: [PATCH] arm64/mm: Explicit cast conversions to correct data type
Date: Wed, 19 Feb 2025 09:26:46 +0530
Message-Id: <20250219035646.536707-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_195656_014389_77BE66A7 
X-CRM114-Status: UNSURE (   9.23  )
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

From: Ryan Roberts <ryan.roberts@arm.com>

When CONFIG_ARM64_PA_BITS_52 is enabled, page table helpers __pte_to_phys()
and __phys_to_pte_val() are functions which return phys_addr_t and pteval_t
respectively as expected. But otherwise without this config being enabled,
they are defined as macros and their return types are implicit.

Until now this has worked out correctly as both pte_t and phys_addr_t data
types have been 64 bits. But with the introduction of 128 bit page tables,
pte_t becomes 128 bits. Hence this ends up with incorrect widths after the
conversions, which leads to compiler warnings.

Fix the warnings by explicitly casting to the correct type after doing the
conversion.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.14-rc3

 arch/arm64/include/asm/pgtable.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0b2a2ad1b9e8..1da2421c9a15 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -84,8 +84,8 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PHYS_TO_PTE_ADDR_MASK;
 }
 #else
-#define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_LOW)
-#define __phys_to_pte_val(phys)	(phys)
+#define __pte_to_phys(pte)	((phys_addr_t)(pte_val(pte) & PTE_ADDR_LOW))
+#define __phys_to_pte_val(phys)	((pteval_t)(phys))
 #endif
 
 #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
-- 
2.25.1


