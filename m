Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D5ACA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tCbPolS6ar1c697qy2cUBoBdguHF3OuN6GwQQbjdKPI=; b=ABMJ3YnzsOhihCUAl/c/O/suMK
	kuc7nR35YtQaXSrORZUEXXQsPNtECFNDZNeuk7C1KFGNhrJwFr9IRLV9wEqrjVBDD0RalAcZOW4ga
	Z8wpIPi9/yZLfOhaP0J5B7O+FmA0tLqkSXU+68k6FTPKhCaiGDUXjnco8Y5wdEw6D1JbAKENUuBvJ
	svPV4DEgeGYEVYRgyxtFrpoi5N4lEI38leG18NlPfNen99zVfPDvOISchNhqEhu/rWrMUeJFOBevF
	uUKlLCuOKC5a9hbIHuK4iQ478AMh59W8Kup7ujdzbAx6E9VLsSKZyjCJCv4CWXPapV+OikNLdUIws
	vNiosdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYvz-00000008Tm5-0pXE;
	Mon, 25 Aug 2025 15:16:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqY96-00000008FOa-33BR;
	Mon, 25 Aug 2025 14:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCA8E6023B;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AA6C4CEED;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=wgWu+8XypexFEPIMyZ5cUv+a841NNieT1SYM+X0Qx/k=;
	h=From:To:Cc:Subject:Date:From;
	b=qhtif550k7UP88ylX7mXFhF3o1Ewy/94q+uBREqP5wwVj4p5tKWo4YIYxqabfCm7o
	 RXbpoE5lUS9A4eX6olO0JQHJX7II7zucifIUT4t5oGSDjVm5tEUvNG7nDTaTagf8MC
	 jr7RemyFaL1wlR9Kr70Sg2zVepCA8TRpRF4n178+y1/WeWFAYnDer2xVGz5oBJ0Lzm
	 0uYOJ+IQmCdVYQdGABtrzKO32BebHlOxGDRRKOqu8JezSkNdHqIcMoMGgLe2oVQ2xq
	 QdjlzNO81fwO8SDSNET5/Yoj4vn7Gds6gMmBMfvGySNCf4krhzhfmv4KmE2sfHEjQA
	 zncS7Q1vVyi0w==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 0/5] kcfi: Prepare for GCC support
Date: Mon, 25 Aug 2025 07:25:47 -0700
Message-Id: <20250825141316.work.967-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

With KCFI support in GCC coming[1], we need to make some (relatively
small) changes in the kernel to deal with it:

- move __nocfi out of compilers-clang.h (so GCC can see it too)
- add cfi=debug so future Kees can find breakage easier
- remove problematic __noinitretpoline usage
- rename CONFIG_CFI_CLANG to CONFIG_CFI (otherwise is it quite confusing)

Thanks!

-Kees

[1] https://lore.kernel.org/linux-hardening/20250821064202.work.893-kees@kernel.org/

Kees Cook (5):
  compiler_types.h: Move __nocfi out of compiler-specific header
  x86/traps: Clarify KCFI instruction layout
  x86/cfi: Add option for cfi=debug bootparam
  x86/cfi: Remove __noinitretpoline and __noretpoline
  kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI

 arch/Kconfig                                  | 22 +++++-----
 arch/arm/Kconfig                              |  2 +-
 arch/arm64/Kconfig                            |  4 +-
 arch/riscv/Kconfig                            |  6 +--
 arch/x86/Kconfig                              | 12 +++---
 init/Kconfig                                  |  4 +-
 kernel/module/Kconfig                         |  2 +-
 lib/Kconfig.debug                             |  2 +-
 Makefile                                      |  2 +-
 arch/arm/mm/Makefile                          |  2 +-
 arch/riscv/kernel/Makefile                    |  2 +-
 arch/riscv/purgatory/Makefile                 |  2 +-
 arch/x86/kernel/Makefile                      |  2 +-
 arch/x86/purgatory/Makefile                   |  2 +-
 kernel/Makefile                               |  2 +-
 .../admin-guide/kernel-parameters.txt         | 18 ++++++++
 arch/riscv/include/asm/cfi.h                  |  4 +-
 arch/x86/include/asm/cfi.h                    |  4 +-
 include/asm-generic/vmlinux.lds.h             |  2 +-
 include/linux/cfi.h                           |  6 +--
 include/linux/cfi_types.h                     |  8 ++--
 include/linux/compiler-clang.h                |  5 ---
 include/linux/compiler-gcc.h                  |  4 --
 include/linux/compiler.h                      |  2 +-
 include/linux/compiler_types.h                |  4 +-
 include/linux/init.h                          |  8 ----
 tools/include/linux/cfi_types.h               |  6 +--
 tools/perf/util/include/linux/linkage.h       |  2 +-
 arch/arm/mm/cache-fa.S                        |  2 +-
 arch/arm/mm/cache-v4.S                        |  2 +-
 arch/arm/mm/cache-v4wb.S                      |  4 +-
 arch/arm/mm/cache-v4wt.S                      |  2 +-
 arch/arm/mm/cache-v6.S                        |  2 +-
 arch/arm/mm/cache-v7.S                        |  2 +-
 arch/arm/mm/cache-v7m.S                       |  2 +-
 arch/arm/mm/proc-arm1020.S                    |  2 +-
 arch/arm/mm/proc-arm1020e.S                   |  2 +-
 arch/arm/mm/proc-arm1022.S                    |  2 +-
 arch/arm/mm/proc-arm1026.S                    |  2 +-
 arch/arm/mm/proc-arm920.S                     |  2 +-
 arch/arm/mm/proc-arm922.S                     |  2 +-
 arch/arm/mm/proc-arm925.S                     |  2 +-
 arch/arm/mm/proc-arm926.S                     |  2 +-
 arch/arm/mm/proc-arm940.S                     |  2 +-
 arch/arm/mm/proc-arm946.S                     |  2 +-
 arch/arm/mm/proc-feroceon.S                   |  2 +-
 arch/arm/mm/proc-mohawk.S                     |  2 +-
 arch/arm/mm/proc-xsc3.S                       |  2 +-
 arch/arm/mm/tlb-v4.S                          |  2 +-
 arch/arm/kernel/hw_breakpoint.c               |  2 +-
 arch/arm64/kernel/debug-monitors.c            |  2 +-
 arch/arm64/kernel/traps.c                     |  4 +-
 arch/arm64/kvm/handle_exit.c                  |  2 +-
 arch/arm64/net/bpf_jit_comp.c                 |  2 +-
 arch/riscv/net/bpf_jit_comp64.c               |  4 +-
 arch/x86/kernel/alternative.c                 | 43 +++++++++++++++----
 arch/x86/kernel/cfi.c                         |  2 +-
 arch/x86/kernel/kprobes/core.c                |  2 +-
 drivers/misc/lkdtm/cfi.c                      |  2 +-
 kernel/module/tree_lookup.c                   |  2 +-
 kernel/configs/hardening.config               |  2 +-
 61 files changed, 141 insertions(+), 113 deletions(-)

-- 
2.34.1


