Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EE0D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRZwSnwwpMXlZd1qrwrcmadEPNcJzTwVR45bra3G+q8=; b=MPKOXdbre4qauSfsuFZvczRDkH
	SEOzrcz0MEUhibcxF9EjFBLWgcwv02gZ4PmgUhnNbSJ/ukMzx+6sIBa/mAY42VzDfDggMjNQmXfta
	d+JdiEsSlxcJcm8B2aGE+usgOwiHmzB6nWKEY4GYcp8np2J5XscB79jPFzfXAMTWoUjCDaoWhHFeO
	JvO1b2N+QlFsdCuUiWFPvUuFT5by6XFpzT6jt8v9sG8cSKM7MmpqU21Hcrb+Ks4dha4cq3KgY8u7A
	FGzpQqMQ2QhkDsaj5Q/xpd6mdK9DLHjX5v03FuV46uvXSmXoBUM7TuP0pwnVtieZrFhNeH1cfBD9e
	Nij/hSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD51-000000041S5-2Ufe;
	Tue, 20 Jan 2026 14:51:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD4y-000000041Qs-3Hoz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:51:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36F091517;
	Tue, 20 Jan 2026 06:51:27 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC61F3F694;
	Tue, 20 Jan 2026 06:51:32 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com,
	will@kernel.org
Subject: [PATCH 1/3] arm64/fpsimd: ptrace: Fix SVE writes on !SME systems
Date: Tue, 20 Jan 2026 14:51:05 +0000
Message-Id: <20260120145107.1278972-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260120145107.1278972-1-mark.rutland@arm.com>
References: <20260120145107.1278972-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_065136_952277_9C530CED 
X-CRM114-Status: GOOD (  16.12  )
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

When SVE is supported but SME is not supported, a ptrace write to the
NT_ARM_SVE regset can place the tracee into an invalid state where
(non-streaming) SVE register data is stored in FP_STATE_SVE format but
TIF_SVE is clear. This can result in a later warning from
fpsimd_restore_current_state(), e.g.

  WARNING: CPU: 0 PID: 7214 at arch/arm64/kernel/fpsimd.c:383 fpsimd_restore_current_state+0x50c/0x748

When this happens, fpsimd_restore_current_state() will set TIF_SVE,
placing the task into the correct state. This occurs before any other
check of TIF_SVE can possibly occur, as other checks of TIF_SVE only
happen while the FPSIMD/SVE/SME state is live. Thus, aside from the
warning, there is no functional issue.

This bug was introduced during rework to error handling in commit:

  9f8bf718f2923 ("arm64/fpsimd: ptrace: Gracefully handle errors")

... where the setting of TIF_SVE was moved into a block which is only
executed when system_supports_sme() is true.

Fix this by removing the system_supports_sme() check. This ensures that
TIF_SVE is set for (SVE-formatted) writes to NT_ARM_SVE, at the cost of
unconditionally manipulating the tracee's saved svcr value. The
manipulation of svcr is benign and inexpensive, and we already do
similar elsewhere (e.g. during signal handling), so I don't think it's
worth guarding this with system_supports_sme() checks.

Aside from the above, there is no functional change. The 'type' argument
to sve_set_common() is only set to ARM64_VEC_SME (in ssve_set())) when
system_supports_sme(), so the ARM64_VEC_SME case in the switch statement
is still unreachable when !system_supports_sme(). When
CONFIG_ARM64_SME=n, the only caller of sve_set_common() is sve_set(),
and the compiler can constant-fold for the case where type is
ARM64_VEC_SVE, removing the logic for other cases.

Reported-by: syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com
Fixes: 9f8bf718f2923 ("arm64/fpsimd: ptrace: Gracefully handle errors")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index b9bdd83fbbca0..6c5ff6807d4cc 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -968,20 +968,18 @@ static int sve_set_common(struct task_struct *target,
 	vq = sve_vq_from_vl(task_get_vl(target, type));
 
 	/* Enter/exit streaming mode */
-	if (system_supports_sme()) {
-		switch (type) {
-		case ARM64_VEC_SVE:
-			target->thread.svcr &= ~SVCR_SM_MASK;
-			set_tsk_thread_flag(target, TIF_SVE);
-			break;
-		case ARM64_VEC_SME:
-			target->thread.svcr |= SVCR_SM_MASK;
-			set_tsk_thread_flag(target, TIF_SME);
-			break;
-		default:
-			WARN_ON_ONCE(1);
-			return -EINVAL;
-		}
+	switch (type) {
+	case ARM64_VEC_SVE:
+		target->thread.svcr &= ~SVCR_SM_MASK;
+		set_tsk_thread_flag(target, TIF_SVE);
+		break;
+	case ARM64_VEC_SME:
+		target->thread.svcr |= SVCR_SM_MASK;
+		set_tsk_thread_flag(target, TIF_SME);
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -EINVAL;
 	}
 
 	/* Always zero V regs, FPSR, and FPCR */
-- 
2.30.2


