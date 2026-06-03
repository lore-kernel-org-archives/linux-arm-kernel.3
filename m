Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9174CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+WAki7WszYsQ6+XgcZxP441Si1Glec1HLEYn1yn6Pc=; b=JHubd0zEBjb43r/rH039I/MeFF
	AJwcXbkm7J7L/VbPYHI52l1SHjhIywL0kXsVzzPkHZKIPJYyD2vwmi2xFElIw5WXFk4cXwPs6WoVa
	Fl/Dv6G7OnAEiLJUAdMSGwzlXueIEoIEiEMKewW34KxC/w/JSx/GbTCOpoNN9Mj2W9xzCzLfRz1Cv
	lYyhL0mnYYbmB4wOhk4DR1SIJaP+tYHXG9BH6hLd2eMpvWivVULqRun2vC93+yY4n9m7iiOqq6NPT
	86BZC1rW5HlHXfA2qpeVWz1Ibi5dL+qRGORenyOjCtIW7+lWOlIso9zB0N2CSBPBh/MJYcIJNbor3
	yc/SNsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjR7-0000000Et4t-23Y1;
	Wed, 03 Jun 2026 11:07:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjR5-0000000Et2B-1r6K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:07:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 195FE49E3;
	Wed,  3 Jun 2026 04:06:54 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4463B3F86F;
	Wed,  3 Jun 2026 04:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484819; bh=Nk2Ku3cYnBWpCBexA+B+lEgYbc1GCJe+1hk+mM+uv2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VkuNxCUFsGRw4z+OkOox+/ymMME287IOkc0IZGsoMyZomUPFgr6dond4uDbvKjbJ0
	 pgUAdi1f4GbAoFCC+GUOvRSqsPflUCD096J1vXSnSfgDEumx6W2xNhUVqb84Zvae+e
	 Nsh2udUIeLbU9VwZzm+umjJqOvWJRHzwrxlYh3RA=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 08/20] arm64: fpsimd: Remove sve_set_vq() and sme_set_vq()
Date: Wed,  3 Jun 2026 12:06:18 +0100
Message-Id: <20260603110630.1027435-9-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_040659_566578_DD086CDE 
X-CRM114-Status: GOOD (  14.39  )
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

The sve_set_vq() and sme_set_vq() assembly functions (and the
sve_load_vq and sme_load_vq macros they use) are open-coded forms of
sysreg_clear_set*(). There's no need for these to be implemented
out-of-line in assembly, and the 'vq_minus_1' argument is unusual and
confusing.

Use sysreg_clear_set_s() directly, where the necessary 'vq - 1' encoding
is more obviously part of encoding the register value.

For now, sve_flush_live() is left with the unusual vq_minus_1 argument.
This will be addressed in subsequent patches.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h       |  2 --
 arch/arm64/include/asm/fpsimdmacros.h | 22 ----------------------
 arch/arm64/kernel/entry-fpsimd.S      | 10 ----------
 arch/arm64/kernel/fpsimd.c            | 24 +++++++++++++-----------
 4 files changed, 13 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index d9d00b45ab115..8efa3c0402a7a 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -146,8 +146,6 @@ extern void sve_load_state(void const *state, u32 const *pfpsr,
 			   int restore_ffr);
 extern void sve_flush_live(bool flush_ffr, unsigned long vq_minus_1);
 extern unsigned int sve_get_vl(void);
-extern void sve_set_vq(unsigned long vq_minus_1);
-extern void sme_set_vq(unsigned long vq_minus_1);
 extern void sme_save_state(void *state, int zt);
 extern void sme_load_state(void const *state, int zt);
 
diff --git a/arch/arm64/include/asm/fpsimdmacros.h b/arch/arm64/include/asm/fpsimdmacros.h
index cda81d009c9bd..adf33d2da40c3 100644
--- a/arch/arm64/include/asm/fpsimdmacros.h
+++ b/arch/arm64/include/asm/fpsimdmacros.h
@@ -265,28 +265,6 @@
 	.purgem _for__body
 .endm
 
-/* Update ZCR_EL1.LEN with the new VQ */
-.macro sve_load_vq xvqminus1, xtmp, xtmp2
-		mrs_s		\xtmp, SYS_ZCR_EL1
-		bic		\xtmp2, \xtmp, ZCR_ELx_LEN_MASK
-		orr		\xtmp2, \xtmp2, \xvqminus1
-		cmp		\xtmp2, \xtmp
-		b.eq		921f
-		msr_s		SYS_ZCR_EL1, \xtmp2	//self-synchronising
-921:
-.endm
-
-/* Update SMCR_EL1.LEN with the new VQ */
-.macro sme_load_vq xvqminus1, xtmp, xtmp2
-		mrs_s		\xtmp, SYS_SMCR_EL1
-		bic		\xtmp2, \xtmp, SMCR_ELx_LEN_MASK
-		orr		\xtmp2, \xtmp2, \xvqminus1
-		cmp		\xtmp2, \xtmp
-		b.eq		921f
-		msr_s		SYS_SMCR_EL1, \xtmp2	//self-synchronising
-921:
-.endm
-
 /* Preserve the first 128-bits of Znz and zero the rest. */
 .macro _sve_flush_z nz
 	_sve_check_zreg \nz
diff --git a/arch/arm64/kernel/entry-fpsimd.S b/arch/arm64/kernel/entry-fpsimd.S
index 28af4bcd97a50..bfa73f26653f2 100644
--- a/arch/arm64/kernel/entry-fpsimd.S
+++ b/arch/arm64/kernel/entry-fpsimd.S
@@ -62,11 +62,6 @@ SYM_FUNC_START(sve_get_vl)
 	ret
 SYM_FUNC_END(sve_get_vl)
 
-SYM_FUNC_START(sve_set_vq)
-	sve_load_vq x0, x1, x2
-	ret
-SYM_FUNC_END(sve_set_vq)
-
 /*
  * Zero all SVE registers but the first 128-bits of each vector
  *
@@ -94,11 +89,6 @@ SYM_FUNC_START(sme_get_vl)
 	ret
 SYM_FUNC_END(sme_get_vl)
 
-SYM_FUNC_START(sme_set_vq)
-	sme_load_vq x0, x1, x2
-	ret
-SYM_FUNC_END(sme_set_vq)
-
 /*
  * Save the ZA and ZT state
  *
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index a8395cb303344..2578c2372c89e 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -377,8 +377,10 @@ static void task_fpsimd_load(void)
 			if (!thread_sm_enabled(&current->thread))
 				WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
 
-			if (test_thread_flag(TIF_SVE))
-				sve_set_vq(sve_vq_from_vl(task_get_sve_vl(current)) - 1);
+			if (test_thread_flag(TIF_SVE)) {
+				unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
+				sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
+			}
 
 			restore_sve_regs = true;
 			restore_ffr = true;
@@ -403,8 +405,10 @@ static void task_fpsimd_load(void)
 		unsigned long sme_vl = task_get_sme_vl(current);
 
 		/* Ensure VL is set up for restoring data */
-		if (test_thread_flag(TIF_SME))
-			sme_set_vq(sve_vq_from_vl(sme_vl) - 1);
+		if (test_thread_flag(TIF_SME)) {
+			unsigned long vq = sve_vq_from_vl(sme_vl);
+			sysreg_clear_set_s(SYS_SMCR_EL1, SMCR_ELx_LEN, vq - 1);
+		}
 
 		write_sysreg_s(current->thread.svcr, SYS_SVCR);
 
@@ -1332,10 +1336,9 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 	 * any effective streaming mode SVE state.
 	 */
 	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
-		unsigned long vq_minus_one =
-			sve_vq_from_vl(task_get_sve_vl(current)) - 1;
-		sve_set_vq(vq_minus_one);
-		sve_flush_live(true, vq_minus_one);
+		unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
+		sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
+		sve_flush_live(true, vq - 1);
 		fpsimd_bind_task_to_cpu();
 	} else {
 		fpsimd_to_sve(current);
@@ -1465,9 +1468,8 @@ void do_sme_acc(unsigned long esr, struct pt_regs *regs)
 		WARN_ON(1);
 
 	if (!test_thread_flag(TIF_FOREIGN_FPSTATE)) {
-		unsigned long vq_minus_one =
-			sve_vq_from_vl(task_get_sme_vl(current)) - 1;
-		sme_set_vq(vq_minus_one);
+		unsigned long vq = sve_vq_from_vl(task_get_sme_vl(current));
+		sysreg_clear_set_s(SYS_SMCR_EL1, SMCR_ELx_LEN, vq - 1);
 
 		fpsimd_bind_task_to_cpu();
 	} else {
-- 
2.30.2


