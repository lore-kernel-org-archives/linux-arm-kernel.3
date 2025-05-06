Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40397C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qx6YTfovuApz1UR23c3JzyaRkpAizfiaAE5NL3mEL9g=; b=iYhzggedhcrPzH3KOjNllhhg59
	fd7qREQ6qdTk136ngnDbU6XPOKcuoUnWFMyNrv8UwOVCTtyUN4KiaStcNQSZwBrX4A3r6Uue7VMm5
	PH570DCkMcw9yxRyBcD9Kwyhj//pWS1f75LuWYusU/W54IXAWKtkqr8zJVMzFJfBnVcAMsFG/fxnN
	UlLpos1BDpABUgf7U2vspjTR6IVHfMKigJcy5VP0e2Aax/8bOb3mT6WdBkgfXZRJDevVBOnvwY6YK
	FugnT7/7jBJYA/FX/EMD12HTxt5RbrGemb2BUQbbgSEuEb4P+8wN4kjkv5TpXxe0JLrs+c9T6zsR8
	5nXY8Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNlr-0000000DCqE-0yfl;
	Tue, 06 May 2025 19:16:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKAx-0000000CUHs-0cZA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:25:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 022E91007;
	Tue,  6 May 2025 08:25:33 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A7613F58B;
	Tue,  6 May 2025 08:25:40 -0700 (PDT)
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
Subject: [PATCH 03/20] arm64/fpsimd: signal: Clear PSTATE.SM when restoring FPSIMD frame only
Date: Tue,  6 May 2025 16:25:06 +0100
Message-Id: <20250506152523.1107431-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250506152523.1107431-1-mark.rutland@arm.com>
References: <20250506152523.1107431-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_082543_267652_31BDFCEB 
X-CRM114-Status: GOOD (  13.28  )
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

On systems with SVE and/or SME, the kernel will always create SVE and
FPSIMD signal frames when delivering a signal, but a user can manipulate
signal frames such that a signal return only observes an FPSIMD signal
frame. When this happens, restore_fpsimd_context() will restore state
such that fp_type==FP_STATE_FPSIMD, but will leave PSTATE.SM as-is.

It is possible for a user to set PSTATE.SM between syscall entry and
execution of the sigreturn logic (e.g. via ptrace), and consequently the
sigreturn may result in the task having PSTATE.SM==1 and
fp_type==FP_STATE_FPSIMD.

For various reasons it is not legitimate for a task to be in a state
where PSTATE.SM==1 and fp_type==FP_STATE_FPSIMD. Portions of the user
ABI are written with the requirement that streaming SVE state is always
presented in SVE format rather than FPSIMD format, and as there is no
mechanism to permit access to only the FPSIMD subset of streaming SVE
state, streaming SVE state must always be saved and restored in SVE
format.

Fix restore_fpsimd_context() to clear PSTATE.SM when restoring an FPSIMD
signal frame without an SVE signal frame. This matches the current
behaviour when an SVE signal frame is present, but the SVE signal frame
has no register payload (e.g. as is the case on SME-only systems which
lack SVE).

This change should have no effect for applications which do not alter
signal frames (i.e. almost all applications). I do not expect
non-{malicious,buggy} applications to hide the SVE signal frame, but
I've chosen to clear PSTATE.SM rather than mandating the presence of an
SVE signal frame in case there is some legacy (non-SME) usage that I am
not currently aware of.

For context, the SME handling was originally introduced in commit:

  85ed24dad290 ("arm64/sme: Implement streaming SVE signal handling")

... and subsequently updated/fixed to handle SME-only systems in commits:

  7dde62f0687c ("arm64/signal: Always accept SVE signal frames on SME only systems")
  f26cd7372160 ("arm64/signal: Always allocate SVE signal frames on SME only systems")

Fixes: 85ed24dad290 ("arm64/sme: Implement streaming SVE signal handling")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 48d3c0129dade..fdce1b856f498 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -280,6 +280,7 @@ static int restore_fpsimd_context(struct user_ctxs *user)
 	__get_user_error(fpsimd.fpcr, &(user->fpsimd->fpcr), err);
 
 	clear_thread_flag(TIF_SVE);
+	current->thread.svcr &= ~SVCR_SM_MASK;
 	current->thread.fp_type = FP_STATE_FPSIMD;
 
 	/* load the hardware registers from the fpsimd_state structure */
-- 
2.30.2


