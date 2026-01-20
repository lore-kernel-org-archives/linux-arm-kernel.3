Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99438D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edOUrfEetymNSbVScMmZI6R0Ag1JaIZNs0MCpB/G6Wk=; b=i6yeuFjKtUUl+CxaDxMAz+sswa
	Oei32nc7Mv9qNvyrN03/U5f524PnkDSlYyKNfl2suyLHnjvRM+YuvfQKfNbrkQXF9ekI8OjKNTwF6
	U0yNTO384Auo8XfpPpuw7CMhQxAe6CXiQG9DMXv1NL1avc2A17j1I+Gnx6GfvG1IBHtdmstiB09Cg
	aTPsvJ93+Sd4vjWZGSiknqUikdw3xNRIXXgTkqj8M+dIOh1xdM+nAtXr09pFKwzTj92dFvd6CGHXh
	0ZnYHgfPw2RShOs3CHrfEG3U+i9RkUYXEeVDHZ+IpyIoWi48zEMYgtojrFT4uF9MIRacu2xdsrdgN
	glb5LtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD56-000000041UA-1j2t;
	Tue, 20 Jan 2026 14:51:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viD50-000000041Rk-3cRm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 14:51:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57156168F;
	Tue, 20 Jan 2026 06:51:31 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F066D3F694;
	Tue, 20 Jan 2026 06:51:36 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	syzbot+d4ab35af21e99d07ce67@syzkaller.appspotmail.com,
	will@kernel.org
Subject: [PATCH 3/3] arm64/fpsimd: signal: Fix restoration of SVE context
Date: Tue, 20 Jan 2026 14:51:07 +0000
Message-Id: <20260120145107.1278972-4-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260120145107.1278972-1-mark.rutland@arm.com>
References: <20260120145107.1278972-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_065138_979517_4F39D6C7 
X-CRM114-Status: GOOD (  21.78  )
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

When SME is supported, Restoring SVE signal context can go wrong in a
few ways, including placing the task into an invalid state where the
kernel may read from out-of-bounds memory (and may potentially take a
fatal fault) and/or may kill the task with a SIGKILL.

(1) Restoring a context with SVE_SIG_FLAG_SM set can place the task into
    an invalid state where SVCR.SM is set (and sve_state is non-NULL)
    but TIF_SME is clear, consequently resuting in out-of-bounds memory
    reads and/or killing the task with SIGKILL.

    This can only occur in unusual (but legitimate) cases where the SVE
    signal context has either been modified by userspace or was saved in
    the context of another task (e.g. as with CRIU), as otherwise the
    presence of an SVE signal context with SVE_SIG_FLAG_SM implies that
    TIF_SME is already set.

    While in this state, task_fpsimd_load() will NOT configure SMCR_ELx
    (leaving some arbitrary value configured in hardware) before
    restoring SVCR and attempting to restore the streaming mode SVE
    registers from memory via sve_load_state(). As the value of
    SMCR_ELx.LEN may be larger than the task's streaming SVE vector
    length, this may read memory outside of the task's allocated
    sve_state, reading unrelated data and/or triggering a fault.

    While this can result in secrets being loaded into streaming SVE
    registers, these values are never exposed. As TIF_SME is clear,
    fpsimd_bind_task_to_cpu() will configure CPACR_ELx.SMEN to trap EL0
    accesses to streaming mode SVE registers, so these cannot be
    accessed directly at EL0. As fpsimd_save_user_state() verifies the
    live vector length before saving (S)SVE state to memory, no secret
    values can be saved back to memory (and hence cannot be observed via
    ptrace, signals, etc).

    When the live vector length doesn't match the expected vector length
    for the task, fpsimd_save_user_state() will send a fatal SIGKILL
    signal to the task. Hence the task may be killed after executing
    userspace for some period of time.

(2) Restoring a context with SVE_SIG_FLAG_SM clear does not clear the
    task's SVCR.SM. If SVCR.SM was set prior to restoring the context,
    then the task will be left in streaming mode unexpectedly, and some
    register state will be combined inconsistently, though the task will
    be left in legitimate state from the kernel's PoV.

    This can only occur in unusual (but legitimate) cases where ptrace
    has been used to set SVCR.SM after entry to the sigreturn syscall,
    as syscall entry clears SVCR.SM.

    In these cases, the the provided SVE register data will be loaded
    into the task's sve_state using the non-streaming SVE vector length
    and the FPSIMD registers will be merged into this using the
    streaming SVE vector length.

Fix (1) by setting TIF_SME when setting SVCR.SM. This also requires
ensuring that the task's sme_state has been allocated, but as this could
contain live ZA state, it should not be zeroed. Fix (2) by clearing
SVCR.SM when restoring a SVE signal context with SVE_SIG_FLAG_SM clear.

For consistency, I've pulled the manipulation of SVCR, TIF_SVE, TIF_SME,
and fp_type earlier, immediately after the allocation of
sve_state/sme_state, before the restore of the actual register state.
This makes it easier to ensure that these are always modified
consistently, even if a fault is taken while reading the register data
from the signal context. I do not expect any software to depend on the
exact state restored when a fault is taken while reading the context.

Fixes: 85ed24dad290 ("arm64/sme: Implement streaming SVE signal handling")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/signal.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 9c2e26e01d729..08ffc5a5aea4c 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -449,12 +449,28 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	if (user->sve_size < SVE_SIG_CONTEXT_SIZE(vq))
 		return -EINVAL;
 
+	if (sm) {
+		sme_alloc(current, false);
+		if (!current->thread.sme_state)
+			return -ENOMEM;
+	}
+
 	sve_alloc(current, true);
 	if (!current->thread.sve_state) {
 		clear_thread_flag(TIF_SVE);
 		return -ENOMEM;
 	}
 
+	if (sm) {
+		current->thread.svcr |= SVCR_SM_MASK;
+		set_thread_flag(TIF_SME);
+	} else {
+		current->thread.svcr &= ~SVCR_SM_MASK;
+		set_thread_flag(TIF_SVE);
+	}
+
+	current->thread.fp_type = FP_STATE_SVE;
+
 	err = __copy_from_user(current->thread.sve_state,
 			       (char __user const *)user->sve +
 					SVE_SIG_REGS_OFFSET,
@@ -462,12 +478,6 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
 	if (err)
 		return -EFAULT;
 
-	if (flags & SVE_SIG_FLAG_SM)
-		current->thread.svcr |= SVCR_SM_MASK;
-	else
-		set_thread_flag(TIF_SVE);
-	current->thread.fp_type = FP_STATE_SVE;
-
 	err = read_fpsimd_context(&fpsimd, user);
 	if (err)
 		return err;
-- 
2.30.2


