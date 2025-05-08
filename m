Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EC9C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOw5GC4YFh89wwgYDL9nl+Wzcb0DQGniIFsqjncK9IU=; b=GOmCHPVCxw+4Ipqx/Ks3zhFf3h
	R0JQ1Js9mTaraMLBrwL0Q51Hj2GRH2p8mCev6NRw2ddnIWzUCeNGc7glQYv1NrCVmBAMK6oNGKGVy
	sBmiazSyGVNaa2AnAQoi/wdGc59Btvb28GDz1Q/zIJXBYZOV2/MAXU1CUbEx9gEzeSGnvBTfm7lxF
	e1wVskOqfsvsD69fALjehPGnOYJCk7lr7PVr0uATD8dt2v5eFqXK5E16xO+F7n7AQL2EhpIX9+I2U
	Tmw+ajOf5xIvrgq9tOR4BwPnhJbvf7yrFfUQ8BJLjf5oMKrhzfpc+//CbT1HQMlzjSpu7oYTVbFL4
	BUYpbWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1uC-00000000rIZ-3LIH;
	Thu, 08 May 2025 14:07:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1ID-00000000kYP-1AAy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 13:28:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8642D106F;
	Thu,  8 May 2025 06:27:54 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 854B93F58B;
	Thu,  8 May 2025 06:28:02 -0700 (PDT)
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
Subject: [PATCH v2 18/24] arm64/fpsimd: ptrace: Mandate SVE payload for streaming-mode state
Date: Thu,  8 May 2025 14:26:38 +0100
Message-Id: <20250508132644.1395904-19-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250508132644.1395904-1-mark.rutland@arm.com>
References: <20250508132644.1395904-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_062805_356421_5D34018B 
X-CRM114-Status: GOOD (  13.27  )
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

When a task has PSTATE.SM==1, reads of NT_ARM_SSVE are required to
always present a header with SVE_PT_REGS_SVE, and register data in SVE
format. Reads of NT_ARM_SSVE must never present register data in FPSIMD
format. Within the kernel, we always expect streaming SVE data to be
stored in SVE format.

Currently a user can write to NT_ARM_SSVE with a header presenting
SVE_PT_REGS_FPSIMD rather than SVE_PT_REGS_SVE, placing the task's
FPSIMD/SVE data into an invalid state.

To fix this we can either:

(a) Forbid such writes.
(b) Accept such writes, and immediately convert data into SVE format.

Take the simple option and forbid such writes.

Fixes: e12310a0d30f ("arm64/sme: Implement ptrace support for streaming mode SVE registers")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Spickett <david.spickett@arm.com>
Cc: Luis Machado <luis.machado@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index a2075e1df27c6..cff72b420eab8 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -890,6 +890,7 @@ static int sve_set_common(struct task_struct *target,
 	struct user_sve_header header;
 	unsigned int vq;
 	unsigned long start, end;
+	bool fpsimd;
 
 	/* Header */
 	if (count < sizeof(header))
@@ -899,6 +900,15 @@ static int sve_set_common(struct task_struct *target,
 	if (ret)
 		goto out;
 
+	/*
+	 * Streaming SVE data is always stored and presented in SVE format.
+	 * Require the user to provide SVE formatted data for consistency, and
+	 * to avoid the risk that we configure the task into an invalid state.
+	 */
+	fpsimd = (header.flags & SVE_PT_REGS_MASK) == SVE_PT_REGS_FPSIMD;
+	if (fpsimd && type == ARM64_VEC_SME)
+		return -EINVAL;
+
 	/*
 	 * Apart from SVE_PT_REGS_MASK, all SVE_PT_* flags are consumed by
 	 * vec_set_vector_length(), which will also validate them for us:
@@ -945,7 +955,7 @@ static int sve_set_common(struct task_struct *target,
 	/* Registers: FPSIMD-only case */
 
 	BUILD_BUG_ON(SVE_PT_FPSIMD_OFFSET != sizeof(header));
-	if ((header.flags & SVE_PT_REGS_MASK) == SVE_PT_REGS_FPSIMD) {
+	if (fpsimd) {
 		clear_tsk_thread_flag(target, TIF_SVE);
 		target->thread.fp_type = FP_STATE_FPSIMD;
 		ret = __fpr_set(target, regset, pos, count, kbuf, ubuf,
-- 
2.30.2


