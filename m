Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF5ABC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 19:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/0cn2myxp8rJaw5jPSF5uNsjx1nGKIGOGdghPj3x2G8=; b=0pux48dO/o8+Uoxenl+QDtaSwT
	/dgvDXkEQTq9bSO+U0mzUE16Hmx/VLaoX/aWmOwQTy0q1ZpIf2sUkVzm+Qeqd9EKwVPaSLHIQ53Fm
	F0UNknX+cywrTxv391BcPfXlhKeK13YKL2bEYIIKF0H4Qrv+U3iUMVe/W74OzJJfQF21/9SdkUgNJ
	sXl9XLkj2XNiUCHgPHrUnxR/rMY6OC+NC3CtvwRPxvTPZKKiIaMPkSlB/shSuSYpw+w4BOOUEiwsN
	ty03OTQIMBEM3reybolTxc1C41KSCsW2HAfkwPAp8lo738aJJqxHNCaP6d6xM5ovKbOZ9C0vfTu7g
	2mz67/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5UaF-0000000E8bk-1vc3;
	Thu, 17 Apr 2025 19:07:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5UUX-0000000E7r1-1BJc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 19:01:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44E871515;
	Thu, 17 Apr 2025 12:01:34 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EB8BA3F59E;
	Thu, 17 Apr 2025 12:01:34 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: broonie@kernel.org,
	daniel.kiss@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	richard.sandiford@arm.com,
	sander.desmalen@arm.com,
	tamas.petz@arm.com,
	yury.khrustalev@arm.com
Subject: [PATCH] arm64/fpsimd: signal: Clear TPIDR2 when delivering signals
Date: Thu, 17 Apr 2025 20:01:13 +0100
Message-Id: <20250417190113.3778111-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_120141_405469_DB7BCBC2 
X-CRM114-Status: GOOD (  19.52  )
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

Hi Catalin, Will,

This patch fixes a pretty nasty ABI issue with SME. As noted below, Arm
folk are working on updates to the relevant ABI specifications and
libraries.

I'm sending this separately from other SME fixes as those largely aren't
relevant to toolchain folks on CC.

To drop this note, apply with `git am --scissors`.

Mark.

---->8----
Linux is intended to be compatible with userspace written to Arm's
AAPCS64 procedure call standard [1,2]. For the Scalable Matrix Extension
(SME), AAPCS64 was extended with a "ZA lazy saving scheme", where SME's
ZA tile is lazily callee-saved and caller-restored. In this scheme,
TPIDR2_EL0 indicates whether the ZA tile is live or has been saved by
pointing to a "TPIDR2 block" in memory, which has a "za_save_buffer"
pointer. This scheme has been implemented in GCC and LLVM, with
necessary runtime support implemented in glibc.

AAPCS64 does not specify how the ZA lazy saving scheme is expected to
interact with signal handling, and the behaviour that AAPCS64 currently
recommends for (sig)setjmp() and (sig)longjmp() does not always compose
safely with signal handling, as explained below.

When Linux delivers a signal, it creates signal frames which contain the
original values of PSTATE.ZA, the ZA tile, and TPIDR_EL2. Between saving
the original state and entering the signal handler, Linux clears
PSTATE.ZA, but leaves TPIDR2_EL0 unchanged. Consequently a signal
handler can be entered with PSTATE.ZA=0 (meaning accesses to ZA will
trap), while TPIDR_EL0 is non-null (which may indicate that ZA needs to
be lazily saved, depending on the contents of the TPIDR2 block). While
in this state, libc and/or compiler runtime code, such as longjmp(), may
attempt to save ZA. As PSTATE.ZA=0, these accesses will trap, causing
the kernel to inject a SIGILL. Note that by virtue of lazy saving
occurring in libc and/or C runtime code, this can be triggered by
application/library code which is unaware of SME.

To avoid the problem above, the kernel must ensure that signal handlers
are entered with PSTATE.ZA and TPIDR2_EL0 configured in a manner which
complies with the ZA lazy saving scheme. Practically speaking, the only
choice is to enter signal handlers with PSTATE.ZA=0 and TPIDR2_EL0=NULL.
This change should not impact SME code which does not follow the ZA lazy
saving scheme (and hence does not use TPIDR2_EL0).

An alternative approach that was considered is to have the signal
handler inherit the original values of both PSTATE.ZA and TPIDR2_EL0,
relying on lazy save/restore sequences being idempotent and capable of
racing safely. This is not safe as signal handlers must be assumed to
have a "private ZA" interface, and therefore cannot be entered with
PSTATE.ZA=1 and TPIDR2_EL0=NULL, but it is legitimate for signals to be
taken from this state.

With the kernel fixed to clear TPIDR2_EL0, there are a couple of
remaining issues (largely masked by the first issue) that must be fixed
in userspace:

(1) When a (sig)setjmp() + (sig)longjmp() pair cross a signal boundary,
    ZA state may be discarded when it needs to be preserved.

    Currently, the ZA lazy saving scheme recommends that setjmp() does
    not save ZA, and recommends that longjmp() is responsible for saving
    ZA. A call to longjmp() in a signal handler will not have visibility
    of ZA state that existed prior to entry to the signal, and when a
    longjmp() is used to bypass a usual signal return, unsaved ZA state
    will be discarded erroneously.

    To fix this, it is necessary for setjmp() to eagerly save ZA state,
    and for longjmp() to configure PSTATE.ZA=0 and TPIDR2_EL0=NULL. This
    works regardless of whether a signal boundary is crossed.

(2) When a C++ exception is thrown and crosses a signal boundary before
    it is caught, ZA state may be discarded when it needs to be
    preserved.

    AAPCS64 requires that exception handlers are entered with
    PSTATE.{SM,ZA}={0,0} and TPIDR2_EL0=NULL, with exception unwind code
    expected to perform any necessary save of ZA state.

    Where it is necessary to perform an exception unwind across an
    exception boundary, the unwind code must recover any necessary ZA
    state (along with TPIDR2) from signal frames.

Fix the kernel as described above, with setup_return() clearing
TPIDR2_EL0 when delivering a signal. Folk on CC are working on fixes for
the remaining userspace issues, including updates/fixes to the AAPCS64
specification and glibc.

[1] https://github.com/ARM-software/abi-aa/releases/download/2025Q1/aapcs64.pdf
[2] https://github.com/ARM-software/abi-aa/blob/c51addc3dc03e73a016a1e4edf25440bcac76431/aapcs64/aapcs64.rst

Fixes: 39782210eb7e8763 ("arm64/sme: Implement ZA signal handling")
Fixes: 39e54499280f373d ("arm64/signal: Include TPIDR2 in the signal context")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Daniel Kiss <daniel.kiss@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Richard Sandiford <richard.sandiford@arm.com>
Cc: Sander De Smalen <sander.desmalen@arm.com>
Cc: Tamas Petz <tamas.petz@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yury Khrustalev <yury.khrustalev@arm.com>
---
 Documentation/arch/arm64/sme.rst | 2 +-
 arch/arm64/kernel/signal.c       | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/sme.rst b/Documentation/arch/arm64/sme.rst
index b2fa01f85cb5e..3a98aed92732e 100644
--- a/Documentation/arch/arm64/sme.rst
+++ b/Documentation/arch/arm64/sme.rst
@@ -115,7 +115,7 @@ be zeroed.
 5.  Signal handling
 -------------------
 
-* Signal handlers are invoked with streaming mode and ZA disabled.
+* Signal handlers are invoked with PSTATE.SM=0, PSTATE.ZA=0, and TPIDR2_EL0=0.
 
 * A new signal frame record TPIDR2_MAGIC is added formatted as a struct
   tpidr2_context to allow access to TPIDR2_EL0 from signal handlers.
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 73f1ab56d81b2..48d3c0129dade 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -1479,6 +1479,7 @@ static int setup_return(struct pt_regs *regs, struct ksignal *ksig,
 		}
 
 		current->thread.svcr &= ~(SVCR_ZA_MASK | SVCR_SM_MASK);
+		write_sysreg_s(0, SYS_TPIDR2_EL0);
 	}
 
 	return 0;
-- 
2.30.2


