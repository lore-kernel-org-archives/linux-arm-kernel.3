Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C36DCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bGsz4vTeLUzDPiIJ1r5aVHwlQk+I6bAngI+fRSrBEbg=; b=p9s5TF6/WQdWu7Br9jEKyqn3iy
	TP3lAehoX1G7k/9M5ekxldwLR6kYOKleaR6xFwHDQRG6rfbnEMib6/VBHbmgGH3qZ09b3gJxWlS+V
	dNWqO0G+6c+MgK2JR19GhBhVUixVxnoHfz1p9QoChWen0zVaN73/Xkql4D7IAmPACtEwlYV/tuxbm
	0/NQYdLXbfPuSniKCl61o/L3WqrM5bxy34bgPIRAQ6zdZL/t3chdFKmd465b7iSEU0i09N9qt8dbB
	OUyj9vREsFt3TkO6aX2UKYx+Z73RBdLFHMnNQEki0MiW1MSlHnxHbCBOrdJ1aIEfZf4IXhT+czRCN
	ENT1aJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Pg-00000007rqS-0hJ9;
	Thu, 21 May 2026 13:26:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3Pc-00000007roy-2BUW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:26:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01F781C00;
	Thu, 21 May 2026 06:26:00 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D4F003F7B4;
	Thu, 21 May 2026 06:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779369965; bh=TF76h7Val/7odp5FU8e5bcuzLOzjRrr18jZPq/qtZ2A=;
	h=From:To:Cc:Subject:Date:From;
	b=vL+9zZQBogOgIMN5Vz7JFlVLlRuNNw5gKod6PSQG6Ymmpwq3iumqSt97wr7HnwGql
	 j6+WDdkPj33g0HGabW3+k+59qr9SWTEnGRK4Ow3qqzie/1Rs02EN5fqs5cewBa+2s5
	 GuxLWvA3LEAsJqUr81oL3cN2JQ2hDXh0Yd1PyLzI=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 00/18] arm64+KVM: FPSIMD/SVE/SME cleanups
Date: Thu, 21 May 2026 14:25:38 +0100
Message-Id: <20260521132556.584676-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_062608_844305_FE4BDB06 
X-CRM114-Status: GOOD (  14.40  )
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

Hi.

This series cleans up low-level FPSIMD/SVE/SME state management code,
making it easier to maintain and extend (e.g. adding SME support to
KVM), and enabling better debugging (e.g. by making SVE/SME save/restore
visible to KASAN and KCSAN).

This is purely cleanup, there are NO bugs addressed by this series.

The series aims to do a few key things:

* Make it harder to mis-manage in-memory SVE state and SME state. These
  are given opaque types (struct sve_state and struct sme_state), and
  the (awkward) calling convention for saving/restoring SVE state is
  simplified to take a pointer to the base of the state rather than a
  pointer to the FFR within the state.

* Minimize duplications between KVM and the rest of the kernel. The
  FPSIMD/SVE/SME routines are moved to inline assembly such that the
  same helper functions can be used everywhere, without the need to wrap
  assembly macros.

* Make the code easier to follow. Assembly sequences are minimized to
  avoid address generation and control-flow that can be written more
  clearly in C. Awkward assembly macros are removed where possible.

* Make it easier to debug state management. Explicit instrumentation is
  added to the save/restore functions so that KASAN and KCSAN can detect
  memory safety issues and concurrency issues.

  This instrumentation is inhibited for nVHE hyp objects, and does not
  adversely affect KVM. I've confirmed by looking at compiler flags
  during the build, and disassembling the relevant object files.

* Remove unnecessary code. By relying on assembler support for SVE and
  SME we can remove awkward assembly macros, making the code
  significantly simpler and easier to read.

I've compile-tested this with a variety of toolchains:

* GCC  8.1.0 + binutils 2.30
* GCC 11.1.0 + binutils 2.36.1
* GCC 12.1.0 + binutils 2.38
* GCC 15.2.0 + binutils 2.45
* LLVM 15.0.7
* LLVM 21.1.8

I've boot-tested on an SVE+SME capable model, both with KASAN enabled
and without KASAN enabled. All the FPSIMD/SVE/SME kselftests passed in
both configurations, without any KASAN splats. Unfortunately, with KCSAN
enabled, some tests hit timeouts (without any KCSAN splat), which I
believe is simply due to the overhead of KCSAN rather than some adverse
functional effect.

I've boot-tested on an SVE+SME capable model, booting with KVM in each
of:

* VHE mode
* hVHE mode
* Protected mode

In each case I've boot-tested a v7.0 defconfig guest, both with SVE and
without SVE.

Mark.

Mark Rutland (18):
  KVM: arm64: Don't include <asm/fpsimdmacros.h>
  KVM: arm64: Don't override FFR save/restore argument
  KVM: arm64: pkvm: Save host FPMR in host cpu context
  KVM: arm64: pkvm: Remove struct cpu_sve_state
  arm64: fpsimd: Fold sve_init_regs() into do_sve_acc()
  arm64: fpsimd: Remove sve_set_vq() and sme_set_vq()
  arm64: fpsimd: Use assembler for SVE instructions
  arm64: fpsimd: Use assembler for baseline SME instructions
  arm64: fpsimd: Move sve_get_vl() and sme_get_vl() inline
  arm64: sysreg: Add FPCR and FPSR
  arm64: fpsimd: Split FPSR/FPCR from SVE save/restore
  arm64: fpsimd: Move fpsimd save/restore inline
  arm64: fpsimd: Use opaque type for SVE state
  arm64: fpsimd: Use opaque type for SME state
  arm64: fpsimd: Move SVE save/restore inline
  arm64: fpsimd: Move sve_flush_live() inline
  arm64: fpsimd: Move SME save/restore inline
  arm64: fpsimd: Remove <asm/fpsimdmacros.h>

 arch/arm64/Kconfig                      |   5 +
 arch/arm64/include/asm/fpsimd.h         | 369 ++++++++++++++++++++++--
 arch/arm64/include/asm/fpsimdmacros.h   | 357 -----------------------
 arch/arm64/include/asm/kvm_host.h       |  27 +-
 arch/arm64/include/asm/kvm_hyp.h        |   5 -
 arch/arm64/include/asm/kvm_pkvm.h       |   3 +-
 arch/arm64/include/asm/processor.h      |   7 +-
 arch/arm64/kernel/Makefile              |   2 +-
 arch/arm64/kernel/entry-common.c        |   8 +-
 arch/arm64/kernel/entry-fpsimd.S        | 134 ---------
 arch/arm64/kernel/fpsimd.c              |  90 +++---
 arch/arm64/kvm/arm.c                    |  16 +-
 arch/arm64/kvm/guest.c                  |   4 +-
 arch/arm64/kvm/hyp/entry.S              |   1 -
 arch/arm64/kvm/hyp/fpsimd.S             |  33 ---
 arch/arm64/kvm/hyp/include/hyp/switch.h |  23 +-
 arch/arm64/kvm/hyp/nvhe/Makefile        |   2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  20 +-
 arch/arm64/kvm/hyp/nvhe/setup.c         |   4 +-
 arch/arm64/kvm/hyp/vhe/Makefile         |   2 +-
 arch/arm64/tools/sysreg                 |  45 +++
 21 files changed, 480 insertions(+), 677 deletions(-)
 delete mode 100644 arch/arm64/include/asm/fpsimdmacros.h
 delete mode 100644 arch/arm64/kernel/entry-fpsimd.S
 delete mode 100644 arch/arm64/kvm/hyp/fpsimd.S

-- 
2.30.2


