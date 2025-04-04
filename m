Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B880C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ql2l30y2OC85RFchxeoyV4s/PHlr8dWsDkl0I0yZ7W4=; b=xrCbxNOmbTyxmsxgAnv2BbcP51
	fmy1NQbXxNPczsWE1GSeKJzvuCsRlqDSaMGjZufycxnKKf0FOHlCJs4L7xBvKgXToAJBFNLwjOUib
	0JZpcYgV4194h6ziR1s8YdkdugtXVDd2ETFM/jZGozMFWCUs4RpjoUV8p172pQi2XJCO+u7XlR6UW
	zVeX4Mj3FJo8N6Bww3ZcWBoBkM3LXtMwZlS5IIx/nQ5QL3Z5DxBr2jjLy97G6LGaMMqa84+QSB87Q
	Mv0C1y2U+dcR3we8e/MZhddbdM7UMEO98z62UH2+P7/eni9LuYPVu7aTG7eNFzzUp8TeEbtvtRtHB
	tbClIuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l7m-0000000CRbE-2OyE;
	Fri, 04 Apr 2025 17:46:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0l5u-0000000CRMB-2eRo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 17:44:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7804E1515;
	Fri,  4 Apr 2025 10:44:43 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 011773F63F;
	Fri,  4 Apr 2025 10:44:39 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH 00/14] arm64: Preparatory FPSIMD/SVE/SME fixes
Date: Fri,  4 Apr 2025 18:44:21 +0100
Message-Id: <20250404174435.3288106-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_104442_762814_A232F6E2 
X-CRM114-Status: GOOD (  13.48  )
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

Hi,

These patches fix a number of problems in the FPSIMD/SVE/SME code, as a
step toeards re-enabling SME support. Additional fixes/changes will be
necessary before we can re-enable SME support. I intend to follow up
with more patches in the near future.

I'm hoping these patches as-is are largely uncontroversial, though I'm
afraid they've only seen light testing so far, so any testing would be
much appreciated.

The series is based on v6.14, and I've pushed the series to the
'arm64-fpsimd-fixes-20250404' branch of my kernel.org git repo:

  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/
  
As an advance warning regarding future patches, there are a few issues
in particular that'll require some more work, and several ABI concerns
that I'll need some opinions on. In particular:

* The user/kernel ABI for signal entry has never been compatible with
  the AAPCS64 lazy ZA saving scheme [1] as deployed by GCC, LLVM, and
  GLIBC. Currently signal handlers can be entered with PSTATE.ZA==0 and
  TPIDR2_EL0 being non-null, which is not a valid state per AAPCS64, and
  TPIDR2_EL0 being non-null implies that a lazy ZA save needs to occur.
  This ends up resulting in unexpected SIGILLs or data corruption during
  an attempts to lazily save ZA, which happen in some standard C library
  functions.

  It is very likely that we'll need to make *some* changes to the signal
  entry ABI here. The obvious/simple fix would be to clear TPIDR2_EL0 at
  signal entry, but this poses other problems for userspace (e.g. where
  longjmp() jumps out of a signal handler), and toolchain folk have
  asked whether it'd be possible to leave PSTATE.ZA enabled when
  entering signal handlers.

* The ptrace ABI for SME is written around the assumption that
  SVE_PT_REGS_FPSIMD and SVE_PT_REGS_SVE are separate bit flags, whereas
  in reality these are different values (0 and 1 respectively) for
  bit 0 of the user_sve_header flags.

  I haven't yet worked through all of the implications of this, but
  AFAICT we can't reliably indicate the value of PSTATE.SM, and
  userspace cannot reliably save/restore a task's state in all cases.

[1] https://github.com/ARM-software/abi-aa/blob/a82eef0433556b30539c0d4463768d9feb8cfd0b/aapcs64/aapcs64.rst#the-za-lazy-saving-scheme

Mark.

Mark Brown (2):
  arm64/fpsimd: Discard stale CPU state when handling SME traps
  arm64/fpsimd: Don't corrupt FPMR when streaming mode changes

Mark Rutland (12):
  arm64/fpsimd: Avoid RES0 bits in the SME trap handler
  arm64/fpsimd: Remove unused fpsimd_force_sync_to_sve()
  arm64/fpsimd: Remove redundant clearing of TIF_SVE
  arm64/fpsimd: Remove redundant SVE trap manipulation
  arm64/fpsimd: Remove opportunistic freeing of SME state
  arm64/fpsimd: Avoid clobbering kernel FPSIMD state with SMSTOP
  arm64/fpsimd: Reset FPMR upon exec()
  arm64/fpsimd: Fix merging of FPSIMD state during signal return
  arm64/fpsimd: Add fpsimd_save_and_flush_current_state()
  arm64/fpsimd: signal32: Always save+flush state early
  arm64/fpsimd: signal: Always save+flush state early
  arm64/fpsimd: signal: Simplify preserve_tpidr2_context()

 arch/arm64/include/asm/esr.h    | 14 ++---
 arch/arm64/include/asm/fpsimd.h |  2 +-
 arch/arm64/kernel/fpsimd.c      | 95 ++++++++++-----------------------
 arch/arm64/kernel/ptrace.c      |  2 -
 arch/arm64/kernel/signal.c      | 75 ++++++--------------------
 arch/arm64/kernel/signal32.c    | 11 ++--
 6 files changed, 60 insertions(+), 139 deletions(-)

-- 
2.30.2


