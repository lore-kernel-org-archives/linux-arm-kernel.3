Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D66C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VB5k3Wml/fFNZyCpymkNQJ+FvcHgU5DxlT/k8e3AOT0=; b=t1YaTJzcZHoR9o
	MJLlg+jkEiRnBZxhSes0zQnxB76+Rh11mAxaIJlbuPsiekPphQJog20o9aR2z+mTLl5NXYPXyXLTl
	eFpAxA3kL704260ywGnVFTyFMWaSSofHKu+CF+bCvQ16NvWwQMTW6fmOjkt8RWuv9u1iTSQVmNUm4
	m+GS5kAvmAJxYL/MYSjLDErogy1Jz867Kk3b7xboc5c4bqOCSDrWn+hSpQb+SsROWBXtPlADD6sLX
	rKKDZ9XWrneMg/q/pFwL2/SzYGrL4h5jvG5CTVwiXxgHNJ2ibKugouzXL8xG8HsRYQXZuFzQ2GAll
	U7nhCGGwdEpcdzYJrYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bE9-0000000EyoI-1grP;
	Fri, 18 Sep 2026 16:14:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bE8-0000000Eyo3-1oYv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:14:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D2A1A43B4A;
	Fri, 18 Sep 2026 16:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6B21F000FF;
	Fri, 18 Sep 2026 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748055;
	bh=VB5k3Wml/fFNZyCpymkNQJ+FvcHgU5DxlT/k8e3AOT0=;
	h=From:To:Cc:Subject:Date;
	b=JfNDDED3TFrWpiX+nNirvrgEs/m6uPBbLSElfwyQm9AUKS6xZYMBmM/fdYK0m/TLh
	 1grbiZWVzUeNDpFxlHzxAdPpl77Yt86F/wVWEptggr1NhIbYLooOjTDP1B7p74cHiK
	 lcDRarH0F2Jb0AudIg/216NPdLRgKnNPZLVLghsCJSYv35mfkuD5yYuUO2+li8zwGW
	 6mbMDhlzLnCXbaq+TaXu0ULaQKb7Dv+J8bR3Fe35PDDlGHLDVyMZbLPHISM/PSCGBa
	 uY/KSwxNcbLZbCPw2/U5VH2RisPJmGoW97jWu1FCcj7LAyfT19jvpvdf3+WfS2pMWt
	 Xo7R+xspjSuWQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 00/21] arm64: Move overflow sp into SP_EL1 and kernel sp into SP_EL0
Date: Fri, 18 Sep 2026 17:13:44 +0100
Message-ID: <20260918161407.2300-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi folks,

This is version two of the kernel stack juggling patches I previously
posted here:

  https://lore.kernel.org/r/20260907164247.17223-1-will@kernel.org

Changes since v1 include:
  * Fixed suspend/resume paths to handle the stack pointers properly
  * Fixed restoration of ptrauth keys on resume
  * Added tags

Cheers,

Will

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: David Hildenbrand <david@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mostafa Saleh <smostafa@google.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

--->8

Mostafa Saleh (1):
  KVM: arm64: Protect TPIDRRO_EL0 across guest entry/exit

Will Deacon (20):
  arm64: entry: Defer setting of TPIDRRO_EL0 until exit to userspace
  arm64: entry: Only check for stack overflow on exceptions from EL1
  arm64: stackprotector: Temporarily disable per-task stackprotector
  arm64: bpf: Add support for generating reads of TPIDRRO_EL0
  arm64: Store 'current' in TPIDRRO_EL0 instead of SP_EL0
  selftests/bpf: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
  scripts/gdb: arm64: Use TPIDRRO_EL0 instead of SP_EL0 for 'current'
  arm64: stackprotector: Re-enable per-task stackprotector
  arm64: percpu: Specialise set_my_cpu_offset() for the primary CPU
  arm64: percpu: Annotate __kern_my_cpu_offset() as '__always_inline'
  KVM: arm64: Preserve handler/thread bit of EL1 mode in
    __finalise_el2()
  arm64: sdei: Guard most of asm/sdei.h with CONFIG_ARM_SDE_INTERFACE
  arm64: sdei: Support SDEI events from kernel handler and thread modes
  arm64: entry: Point SP_EL0 at the overflow stack
  arm64: entry: Implement EL1t exception handlers for overflow stack
  arm64: entry: Use SPSel to switch to overflow stack
  arm64: entry: Split up kernel_ventry macro into separate helper macros
  arm64: entry: The great stack switcheroo
  arm64: tracing: Advertise a mode of EL1t in synthetic kernel regs
  arm64: Rename 'overflow_stack' and OVERFLOW_STACK_SIZE

 arch/arm64/Kconfig                            |   2 +-
 arch/arm64/Makefile                           |   2 +-
 arch/arm64/include/asm/assembler.h            |   2 +-
 arch/arm64/include/asm/current.h              |   6 +-
 arch/arm64/include/asm/ftrace.h               |   4 +-
 arch/arm64/include/asm/insn.h                 |   1 +
 arch/arm64/include/asm/kvm_asm.h              |  26 +++++
 arch/arm64/include/asm/memory.h               |  10 +-
 arch/arm64/include/asm/percpu.h               |  10 +-
 arch/arm64/include/asm/perf_event.h           |   2 +-
 arch/arm64/include/asm/sdei.h                 |   2 +
 arch/arm64/include/asm/stacktrace.h           |   9 +-
 arch/arm64/include/asm/stacktrace/nvhe.h      |   3 +-
 arch/arm64/include/uapi/asm/ptrace.h          |   1 +
 arch/arm64/kernel/asm-offsets.c               |   2 +
 arch/arm64/kernel/entry-common.c              |  51 +++++++--
 arch/arm64/kernel/entry.S                     | 108 +++++++++---------
 arch/arm64/kernel/head.S                      |   8 +-
 arch/arm64/kernel/hyp-stub.S                  |   7 +-
 arch/arm64/kernel/process.c                   |  21 +---
 arch/arm64/kernel/sdei.c                      |   6 +-
 arch/arm64/kernel/sleep.S                     |   3 +-
 arch/arm64/kernel/smp.c                       |  19 ++-
 arch/arm64/kernel/stacktrace.c                |   2 +-
 arch/arm64/kernel/sys_compat.c                |   7 --
 arch/arm64/kernel/traps.c                     |  14 +--
 arch/arm64/kvm/hyp/entry.S                    |  15 ++-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h    |   2 -
 arch/arm64/kvm/hyp/nvhe/host.S                |   2 +-
 arch/arm64/kvm/hyp/nvhe/stacktrace.c          |   4 +-
 arch/arm64/kvm/stacktrace.c                   |   4 +-
 arch/arm64/mm/proc.S                          |  16 ++-
 arch/arm64/net/bpf_jit.h                      |   2 +
 arch/arm64/net/bpf_jit_comp.c                 |   4 +-
 scripts/gdb/linux/cpus.py                     |   2 +-
 .../selftests/bpf/progs/verifier_jit_inline.c |   2 +-
 36 files changed, 230 insertions(+), 151 deletions(-)

-- 
2.55.0.1082.g2b9226bbc0-goog


