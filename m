Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CDFC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 04:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HToC9oe+/2hjgl7+41a7XPAlvo3qFPiRNBWN9oz+tPs=; b=MKVePpl+loW0tEJKhriwq0rV3H
	8lJTjXJl/Jg7VPDD6xgxpcr0F33Ewlr/C2uUcQbLMRMwiVghC94IG4BbGNrjZkyFs/tShOqDjDjGQ
	WgKp+hkf44U67ppQvpg5sGR0I3ygzBehm8faTuHGvj1isDRZoO/Y+Dgnizx/pDv9IHXDsaYV+FNvS
	2tpVjTNE8gVilopGQuUI61iimcmeA/uZ3A+8A+YVnS5odrPEK0mwLfACSv0DQ4bdCXf0XC+syFs4O
	oBKyXxcUXm+yjIhQOuF+nnnMIc6F8qEqmyRV6YEj1mnfC+AVPgxB1M4dhl62mhv7ltEJ8oMeLSOHR
	1gBJ3yEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKzK-000000049X0-3kcj;
	Fri, 21 Feb 2025 04:50:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKsP-000000048Id-3E7n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 04:43:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBB601C01;
	Thu, 20 Feb 2025 20:43:18 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.40.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 808E03F6A8;
	Thu, 20 Feb 2025 20:42:56 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 4/8] arm64/mm: Clear PXX_TYPE_MASK and set PXD_TYPE_SECT in [pmd|pud]_mkhuge()
Date: Fri, 21 Feb 2025 10:12:23 +0530
Message-Id: <20250221044227.1145393-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221044227.1145393-1-anshuman.khandual@arm.com>
References: <20250221044227.1145393-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_204301_850127_6CC26555 
X-CRM114-Status: GOOD (  10.22  )
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

Clear PXX_TYPE_MASK in [pmd|pud]_mkhuge() while creating section mappings
instead of just the PXX_TABLE_BIT and also set PXD_TYPE_SECT. Also ensure
PTE_VALID does not get modified in these helpers, because present-invalid
entries should preserve their state across.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c16e9e74e309..4485ecdffd8a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -585,7 +585,18 @@ static inline int pmd_trans_huge(pmd_t pmd)
 
 #define pmd_write(pmd)		pte_write(pmd_pte(pmd))
 
-#define pmd_mkhuge(pmd)		(__pmd(pmd_val(pmd) & ~PMD_TABLE_BIT))
+static inline pmd_t pmd_mkhuge(pmd_t pmd)
+{
+	/*
+	 * It's possible that the pmd is present-invalid on entry
+	 * and in that case it needs to remain present-invalid on
+	 * exit. So ensure the VALID bit does not get modified.
+	 */
+	pmdval_t mask = PMD_TYPE_MASK & ~PTE_VALID;
+	pmdval_t val = PMD_TYPE_SECT & ~PTE_VALID;
+
+	return __pmd((pmd_val(pmd) & ~mask) | val);
+}
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define pmd_devmap(pmd)		pte_devmap(pmd_pte(pmd))
@@ -613,7 +624,18 @@ static inline pmd_t pmd_mkspecial(pmd_t pmd)
 #define pud_mkyoung(pud)	pte_pud(pte_mkyoung(pud_pte(pud)))
 #define pud_write(pud)		pte_write(pud_pte(pud))
 
-#define pud_mkhuge(pud)		(__pud(pud_val(pud) & ~PUD_TABLE_BIT))
+static inline pud_t pud_mkhuge(pud_t pud)
+{
+	/*
+	 * It's possible that the pud is present-invalid on entry
+	 * and in that case it needs to remain present-invalid on
+	 * exit. So ensure the VALID bit does not get modified.
+	 */
+	pudval_t mask = PUD_TYPE_MASK & ~PTE_VALID;
+	pudval_t val = PUD_TYPE_SECT & ~PTE_VALID;
+
+	return __pud((pud_val(pud) & ~mask) | val);
+}
 
 #define __pud_to_phys(pud)	__pte_to_phys(pud_pte(pud))
 #define __phys_to_pud_val(phys)	__phys_to_pte_val(phys)
-- 
2.25.1


