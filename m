Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7560CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wq27tbhVI6NgmddT4N9wE5wtvBrM62sR7dt/z4vLyUU=; b=sFrJjlKrGVtKxZEjSGsLc3/zbY
	zewsB9g+iCor6QFKbrRfPMQ1gnAfSmscltJh/TuXOt+qKabsgwTsY077rgvP5EtkgshzNaRs6NnEC
	h8Q6viOutqrNH83TsqtSgLcTMuiUXoHP79oqe5EN02fQ4Nzi/Wv43oVrir0FCWP69zz4RdcUiKr4G
	/V7L8sc2xk3z2RMRIGwFaF+9xJjiM4N9DFFHQxyS/rRfBfCyQgxS5WglJ71apNE4a9c4XpCheefVM
	IPiWVquppnDNzchHQ/JhaRAFKDIFUDuORoLFfCBcYvHBuDAJSu65D8g1dbaSsb+/sTfD0CuN3VyRI
	4E/iHplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upE8v-00000000s2m-3ye3;
	Thu, 21 Aug 2025 22:52:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up91W-000000003eS-0v4q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:24:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FBFA168F;
	Thu, 21 Aug 2025 10:24:17 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 369573F59E;
	Thu, 21 Aug 2025 10:24:22 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	Dave.Martin@arm.com,
	ahmed.genidi@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	mbenes@suse.cz,
	james.clark@linaro.org,
	frederic@kernel.org,
	rafael@kernel.org,
	pavel@kernel.org,
	ryan.roberts@arm.com,
	suzuki.poulose@arm.com,
	maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v4 3/5] arm64: save/restore SCTLR2_EL1 when cpu_suspend()/resume()
Date: Thu, 21 Aug 2025 18:24:06 +0100
Message-Id: <20250821172408.2101870-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821172408.2101870-1-yeoreum.yun@arm.com>
References: <20250821172408.2101870-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_102426_301185_BD270E6E 
X-CRM114-Status: UNSURE (   8.23  )
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

Save and restore the SCTLR2_EL1 value during cpu_suspend()/resume(),
ensuring that the configured value remains
consistent across suspend and resume.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/include/asm/suspend.h |  2 +-
 arch/arm64/mm/proc.S             | 24 ++++++++++++++++--------
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/suspend.h b/arch/arm64/include/asm/suspend.h
index 0cde2f473971..eb60c9735553 100644
--- a/arch/arm64/include/asm/suspend.h
+++ b/arch/arm64/include/asm/suspend.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_SUSPEND_H
 #define __ASM_SUSPEND_H
 
-#define NR_CTX_REGS 13
+#define NR_CTX_REGS 14
 #define NR_CALLEE_SAVED_REGS 12
 
 /*
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 8c75965afc9e..a330d828270f 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -87,8 +87,12 @@ SYM_FUNC_START(cpu_do_suspend)
 	mrs	x9, mdscr_el1
 	mrs	x10, oslsr_el1
 	mrs	x11, sctlr_el1
-	get_this_cpu_offset x12
-	mrs	x13, sp_el0
+alternative_if ARM64_HAS_SCTLR2
+	mrs_s	x12, SYS_SCTLR2_EL1
+alternative_else_nop_endif
+	get_this_cpu_offset x13
+	mrs	x14, sp_el0
+
 	stp	x2, x3, [x0]
 	stp	x4, x5, [x0, #16]
 	stp	x6, x7, [x0, #32]
@@ -99,7 +103,7 @@ SYM_FUNC_START(cpu_do_suspend)
 	 * Save x18 as it may be used as a platform register, e.g. by shadow
 	 * call stack.
 	 */
-	str	x18, [x0, #96]
+	stp	x14, x18, [x0, #96]
 	ret
 SYM_FUNC_END(cpu_do_suspend)
 
@@ -120,8 +124,8 @@ SYM_FUNC_START(cpu_do_resume)
 	 * the buffer to minimize the risk of exposure when used for shadow
 	 * call stack.
 	 */
-	ldr	x18, [x0, #96]
-	str	xzr, [x0, #96]
+	ldp	x15, x18, [x0, #96]
+	str	xzr, [x0, #104]
 	msr	tpidr_el0, x2
 	msr	tpidrro_el0, x3
 	msr	contextidr_el1, x4
@@ -136,8 +140,12 @@ SYM_FUNC_START(cpu_do_resume)
 	msr	mdscr_el1, x10
 
 	msr	sctlr_el1, x12
-	set_this_cpu_offset x13
-	msr	sp_el0, x14
+alternative_if ARM64_HAS_SCTLR2
+	msr_s	SYS_SCTLR2_EL1, x13
+alternative_else_nop_endif
+
+	set_this_cpu_offset x14
+	msr	sp_el0, x15
 	/*
 	 * Restore oslsr_el1 by writing oslar_el1
 	 */
@@ -151,7 +159,7 @@ alternative_if ARM64_HAS_RAS_EXTN
 	msr_s	SYS_DISR_EL1, xzr
 alternative_else_nop_endif
 
-	ptrauth_keys_install_kernel_nosync x14, x1, x2, x3
+	ptrauth_keys_install_kernel_nosync x15, x1, x2, x3
 	isb
 	ret
 SYM_FUNC_END(cpu_do_resume)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


