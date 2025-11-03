Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268A7CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 05:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giwQLIjL49tUV6DVuID8zVmfSkIuBETxoJHoAFeqn5A=; b=rSW5RkQo27p9Vt3ys3euuwCWN7
	aeSMXlQNn01yeiMMNPcwPRvnAn4ZuX4PdmiTpKpt7jFeSBTlvt/u6YdClGJLzSvEiQtGtMhXQqIpZ
	HB1JvZIXJkhJtHMaze/IUt8EDAO93CvZYV4+i1cWddxlU+/QdYHHKXQrixeps/HmMhpp1TOxthyji
	porb1O3vXtghaBwXKwWaI5mNMPCjsvdMp59xldzxrsb9ZBNGTq2UNiR9zE1vHunk30tvnrpfybBpb
	MSUF/hfraaD6O2WknYn4ZzdxTOYSnfR9TrJQPoGogCdkllfN2IMtvCnxb2sfUPP9MAEh1qfcA/YJA
	l0KYS4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5O-00000009Duh-0Myy;
	Mon, 03 Nov 2025 05:26:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFn5K-00000009DtW-3akc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 05:26:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12912936;
	Sun,  2 Nov 2025 21:26:21 -0800 (PST)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.1.196.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 228FD3F63F;
	Sun,  2 Nov 2025 21:26:27 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] arm64/mm: Directly use TTBRx_EL1_CnP
Date: Mon,  3 Nov 2025 05:26:14 +0000
Message-Id: <20251103052618.586763-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20251103052618.586763-1-anshuman.khandual@arm.com>
References: <20251103052618.586763-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_212630_935678_7BE88023 
X-CRM114-Status: GOOD (  11.53  )
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

Replace all TTBR_CNP_BIT macro instances with TTBRx_EL1_CNP_BIT which
is a standard field from tools sysreg format. No functional change.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/kernel/mte.c | 4 ++--
 arch/arm64/mm/context.c | 2 +-
 arch/arm64/mm/mmu.c     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
index 43f7a2f39403..ba2e3e9d1f73 100644
--- a/arch/arm64/kernel/mte.c
+++ b/arch/arm64/kernel/mte.c
@@ -315,8 +315,8 @@ void mte_cpu_setup(void)
 	 * CnP is not a boot feature so MTE gets enabled before CnP, but let's
 	 * make sure that is the case.
 	 */
-	BUG_ON(read_sysreg(ttbr0_el1) & TTBR_CNP_BIT);
-	BUG_ON(read_sysreg(ttbr1_el1) & TTBR_CNP_BIT);
+	BUG_ON(read_sysreg(ttbr0_el1) & TTBRx_EL1_CnP);
+	BUG_ON(read_sysreg(ttbr1_el1) & TTBRx_EL1_CnP);
 
 	/* Normal Tagged memory type at the corresponding MAIR index */
 	sysreg_clear_set(mair_el1,
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 718c495832d0..0f4a28b87469 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -354,7 +354,7 @@ void cpu_do_switch_mm(phys_addr_t pgd_phys, struct mm_struct *mm)
 
 	/* Skip CNP for the reserved ASID */
 	if (system_supports_cnp() && asid)
-		ttbr0 |= TTBR_CNP_BIT;
+		ttbr0 |= TTBRx_EL1_CnP;
 
 	/* SW PAN needs a copy of the ASID in TTBR0 for entry */
 	if (IS_ENABLED(CONFIG_ARM64_SW_TTBR0_PAN))
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b8d37eb037fc..e80bb623ef53 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -2084,7 +2084,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 	phys_addr_t ttbr1 = phys_to_ttbr(virt_to_phys(pgdp));
 
 	if (cnp)
-		ttbr1 |= TTBR_CNP_BIT;
+		ttbr1 |= TTBRx_EL1_CnP;
 
 	replace_phys = (void *)__pa_symbol(idmap_cpu_replace_ttbr1);
 
-- 
2.30.2


