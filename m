Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37817C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4wWJbRLuvvGn/FqOVYUmog5DVHLYO2FI+qV2G/lSJ0=; b=fQACwP/tLeGZJQLDNyJa88wpNx
	SaiwYB7HvMILNYyvEhSfsQfQdjrtmHL0MkxhVSFsMTfLcLWQOu/w/3aBQTFqUw3cmkJ74KMliKp+d
	SAxVQtwnpKbbPGGAms2LwNbGsbxKHWEi3htzwrt5cMfOUwSuIc38b01Lm1wlro6SMJvGqaLl0SHqZ
	npXY8imLnr1Wfh2S3HeL0MXnApsGmoxHMwiPHiefKZ2Fjct39ilrq+On4G1uYxWnk1rNX/8NxmD41
	OAA/bkQvFMx3S5Pv3uXUAiBc7Onz1Kti3NsPX0NSTfyWOw5BcFeqwW90HKeDEiOSdrAJGd1+hYScN
	Ql+9N76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNxV-0000000DEOb-2FRS;
	Tue, 06 May 2025 19:28:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKBD-0000000CUNg-3pTz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:26:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF7F71007;
	Tue,  6 May 2025 08:25:49 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 136D73F58B;
	Tue,  6 May 2025 08:25:56 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	daniel.kiss@arm.com,
	david.spickett@arm.com,
	luis.machado@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tabba@google.com,
	tamas.petz@arm.com,
	tkjos@google.com,
	will@kernel.org,
	yury.khrustalev@arm.com
Subject: [PATCH 08/20] arm64/fpsimd: Add task_smstop_sm()
Date: Tue,  6 May 2025 16:25:11 +0100
Message-Id: <20250506152523.1107431-9-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250506152523.1107431-1-mark.rutland@arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082600_076864_3A7EB239 
X-CRM114-Status: GOOD (  14.52  )
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

In a few places we want to transition a task from streaming mode to
non-streaming mode, e.g. signal delivery where we historically tried to
use an SMSTOP SM instruction.

Add a new helper to manipulate a task's state in the same way as an
SMSTOP SM instruction. I have not added a corresponding helper to
simulate the effects of SMSTART SM. Only ptrace transitions a task into
streaming mode, and ptrace has distinct semantics for such transitions.

Per ARM DDI 0487 L.a, section B1.4.6:

| RRSWFQ
| When the Effective value of PSTATE.SM is changed by any method from 0
| to 1, an entry to Streaming SVE mode is performed, and all implemented
| bits of Streaming SVE register state are set to zero.

| RKFRQZ
| When the Effective value of PSTATE.SM is changed by any method from 1
| to 0, an exit from Streaming SVE mode is performed, and in the
| newly-entered mode, all implemented bits of the SVE scalable vector
| registers, SVE predicate registers, and FFR, are set to zero.

Per ARM DDI 0487 L.a, section C5.2.9:

| On entry to or exit from Streaming SVE mode, FPMR is set to 0

Per ARM DDI 0487 L.a, section C5.2.10:

| On entry to or exit from Streaming SVE mode, FPSR.{IOC, DZC, OFC, UFC,
| IXC, IDC, QC} are set to 1 and the remaining bits are set to 0.

This means bits 0, 1, 2, 3, 4, 7, and 27 respectively, i.e. 0x0800009f

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  2 ++
 arch/arm64/kernel/fpsimd.c      | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index b751064bbaaa1..b8cf0ea43cc05 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -111,6 +111,8 @@ static inline bool thread_za_enabled(struct thread_struct *thread)
 	return system_supports_sme() && (thread->svcr & SVCR_ZA_MASK);
 }
 
+extern void task_smstop_sm(struct task_struct *task);
+
 /* Maximum VL that SVE/SME VL-agnostic software can transparently support */
 #define VL_ARCH_MAX 0x100
 
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index c2603fe8dd243..fe96e018e18c0 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -695,6 +695,28 @@ static inline void sve_to_fpsimd(struct task_struct *task)
 	}
 }
 
+static inline void __fpsimd_zero_vregs(struct user_fpsimd_state *fpsimd)
+{
+	memset(&fpsimd->vregs, 0, sizeof(fpsimd->vregs));
+}
+
+/*
+ * Simulate the effects of an SMSTOP SM instruction.
+ */
+void task_smstop_sm(struct task_struct *task)
+{
+	if (!thread_sm_enabled(&task->thread))
+		return;
+
+	__fpsimd_zero_vregs(&task->thread.uw.fpsimd_state);
+	task->thread.uw.fpsimd_state.fpsr = 0x0800009f;
+	if (system_supports_fpmr())
+		task->thread.uw.fpmr = 0;
+
+	task->thread.svcr &= ~SVCR_SM_MASK;
+	task->thread.fp_type = FP_STATE_FPSIMD;
+}
+
 void cpu_enable_fpmr(const struct arm64_cpu_capabilities *__always_unused p)
 {
 	write_sysreg_s(read_sysreg_s(SYS_SCTLR_EL1) | SCTLR_EL1_EnFPM_MASK,
-- 
2.30.2


