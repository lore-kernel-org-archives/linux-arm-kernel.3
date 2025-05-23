Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1370C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 04:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NFkMhwNuEQwB51aj6fmgJxI31pAOIBg0Fai80ZSggSI=; b=WNQAChl2pyEa7kL2u6xFN+S0Ck
	3C5kotSHPaa56gj32CCf8x2fpGlXJwqowL8zQAaqNTrUnvplpMxXcBr1qUMNHHZhUtasPh/QbASCa
	KrGtlYvmrKg5tbIU5qwnmJbm254LdbdiIVZShWKQUp1qQESYDfR2JGLQ4EsnwNcMXygIxIxvnN/Pt
	R0RW1FBLLrWkeKqYjM60jDrGJC/MXi5bCsVL623IcEkFY/UVbQ9KhVPJ0nydA9xVwd2uGMgvaRNkN
	az0EIFcv6FBEq4Ej3PAehWvaANpcYzrgtWEL1ed9sZDvT8I67TDZhtxDfww43WLEAq2M0eFe3popL
	dYNCLKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKIa-00000002vmT-3Alw;
	Fri, 23 May 2025 04:46:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIKC3-00000002twY-2rOu;
	Fri, 23 May 2025 04:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A879D5C6D20;
	Fri, 23 May 2025 04:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D66C4AF09;
	Fri, 23 May 2025 04:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747975178;
	bh=XVwkrc3glEUjTIVHxhgADYvS6InRhqZwcVUoNmb8gLs=;
	h=From:To:Cc:Subject:Date:From;
	b=KqTkaNurs9FhJf2xVT2AAgHgZfsZLI22JZrnjsUUd3dLV4GIqcY/egNqMcrSdZ7KY
	 Qoe1xFjyvbHFLLwX8ltHL+UpEgH2pwDrHXGVG+gI/ZXCJ/PiG9bEf2d8W+XPMqCPxS
	 t7/QNPmTyrPco7X6qhPfaX8HwI7V5XMmTaddqEdLhPnbgxtzwoZVUVrHAupH5HXUWC
	 uJs8xAoP8DhUEFmLxMG2167yDtwxbVR5eXKMzN/8qSh6Y2P0fAEW0W27jJaqa0EEmQ
	 aqWuakzIBlY2iT7g7eX7sCheOJj+u51pIrSHjL9O7SZk51OYxQaixUP2zLbVkjOfiA
	 pVI4tIZzEwhLA==
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 00/14] stackleak: Support Clang stack depth tracking
Date: Thu, 22 May 2025 21:39:10 -0700
Message-Id: <20250523043251.it.550-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5806; i=kees@kernel.org; h=from:subject:message-id; bh=XVwkrc3glEUjTIVHxhgADYvS6InRhqZwcVUoNmb8gLs=; b=owGbwMvMwCVmps19z/KJym7G02pJDBn6v7/zd349lB4js43v/P8PVhOrZ671qt7bkPjchC/4n VqhgOyjjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIm8qWdkeLn+6AuHlaaR0h8X HD0uxWndd9xPfAPD46tHXz3TfCnRVcDwTy94qstMZtfd7Myfr9qe83KzmFlVcIJ9CYvupkfljK9 kmQE=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_213939_804091_D5E5C45B 
X-CRM114-Status: GOOD (  12.50  )
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

 v2:
  - rename stackleak to kstack_erase (mingo)
  - address __init vs inline with KCOV changes
 v1:  https://lore.kernel.org/lkml/20250507180852.work.231-kees@kernel.org/
 RFC: https://lore.kernel.org/lkml/20250502185834.work.560-kees@kernel.org/

Hi,

As part of looking at what GCC plugins could be replaced with Clang
implementations, this series uses the recently landed stack depth tracking
callback in Clang[1] to implement the stackleak feature. Since the Clang
feature is now landed, I'm moving this out of RFC to a v1.

Since this touches a lot of arch-specific Makefiles, I tried to trim
the CC list down to just mailing lists in those cases, otherwise the CC
was giant.

Thanks!

-Kees

[1] https://clang.llvm.org/docs/SanitizerCoverage.html#tracing-stack-depth

Kees Cook (14):
  stackleak: Rename STACKLEAK to KSTACK_ERASE
  stackleak: Rename stackleak_track_stack to __sanitizer_cov_stack_depth
  stackleak: Split KSTACK_ERASE_CFLAGS from GCC_PLUGINS_CFLAGS
  x86: Handle KCOV __init vs inline mismatches
  arm: Handle KCOV __init vs inline mismatches
  arm64: Handle KCOV __init vs inline mismatches
  s390: Handle KCOV __init vs inline mismatches
  powerpc: Handle KCOV __init vs inline mismatches
  mips: Handle KCOV __init vs inline mismatches
  loongarch: Handle KCOV __init vs inline mismatches
  init.h: Disable sanitizer coverage for __init and __head
  kstack_erase: Support Clang stack depth tracking
  configs/hardening: Enable CONFIG_KSTACK_ERASE
  configs/hardening: Enable CONFIG_INIT_ON_FREE_DEFAULT_ON

 arch/Kconfig                                  |  4 +-
 arch/arm/Kconfig                              |  2 +-
 arch/arm64/Kconfig                            |  2 +-
 arch/riscv/Kconfig                            |  2 +-
 arch/s390/Kconfig                             |  2 +-
 arch/x86/Kconfig                              |  2 +-
 security/Kconfig.hardening                    | 45 +++++++++-------
 Makefile                                      |  1 +
 arch/arm/boot/compressed/Makefile             |  2 +-
 arch/arm/vdso/Makefile                        |  2 +-
 arch/arm64/kernel/pi/Makefile                 |  2 +-
 arch/arm64/kernel/vdso/Makefile               |  3 +-
 arch/arm64/kvm/hyp/nvhe/Makefile              |  2 +-
 arch/riscv/kernel/pi/Makefile                 |  2 +-
 arch/riscv/purgatory/Makefile                 |  2 +-
 arch/sparc/vdso/Makefile                      |  3 +-
 arch/x86/entry/vdso/Makefile                  |  3 +-
 arch/x86/purgatory/Makefile                   |  2 +-
 drivers/firmware/efi/libstub/Makefile         |  8 +--
 drivers/misc/lkdtm/Makefile                   |  2 +-
 kernel/Makefile                               | 10 ++--
 lib/Makefile                                  |  2 +-
 scripts/Makefile.gcc-plugins                  | 16 +-----
 scripts/Makefile.kstack_erase                 | 21 ++++++++
 scripts/gcc-plugins/stackleak_plugin.c        | 52 +++++++++----------
 Documentation/admin-guide/sysctl/kernel.rst   |  4 +-
 Documentation/arch/x86/x86_64/mm.rst          |  2 +-
 Documentation/security/self-protection.rst    |  2 +-
 .../zh_CN/security/self-protection.rst        |  2 +-
 arch/arm64/include/asm/acpi.h                 |  2 +-
 arch/loongarch/include/asm/smp.h              |  2 +-
 arch/mips/include/asm/time.h                  |  2 +-
 arch/s390/hypfs/hypfs.h                       |  2 +-
 arch/s390/hypfs/hypfs_diag.h                  |  2 +-
 arch/x86/entry/calling.h                      |  4 +-
 arch/x86/include/asm/acpi.h                   |  4 +-
 arch/x86/include/asm/init.h                   |  2 +-
 arch/x86/include/asm/realmode.h               |  2 +-
 include/linux/acpi.h                          |  4 +-
 include/linux/bootconfig.h                    |  2 +-
 include/linux/efi.h                           |  2 +-
 include/linux/init.h                          |  4 +-
 include/linux/{stackleak.h => kstack_erase.h} | 20 +++----
 include/linux/memblock.h                      |  2 +-
 include/linux/mfd/dbx500-prcmu.h              |  2 +-
 include/linux/sched.h                         |  4 +-
 arch/arm/kernel/entry-common.S                |  2 +-
 arch/arm64/kernel/entry.S                     |  2 +-
 arch/riscv/kernel/entry.S                     |  2 +-
 arch/s390/kernel/entry.S                      |  2 +-
 arch/arm/mm/cache-feroceon-l2.c               |  2 +-
 arch/arm/mm/cache-tauros2.c                   |  2 +-
 arch/loongarch/kernel/time.c                  |  2 +-
 arch/loongarch/mm/ioremap.c                   |  4 +-
 arch/powerpc/mm/book3s64/hash_utils.c         |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  2 +-
 arch/s390/mm/init.c                           |  2 +-
 arch/x86/kernel/kvm.c                         |  2 +-
 drivers/clocksource/timer-orion.c             |  2 +-
 .../lkdtm/{stackleak.c => kstack_erase.c}     | 26 +++++-----
 drivers/platform/x86/thinkpad_acpi.c          |  4 +-
 drivers/soc/ti/pm33xx.c                       |  2 +-
 fs/proc/base.c                                |  6 +--
 kernel/fork.c                                 |  2 +-
 kernel/{stackleak.c => kstack_erase.c}        | 22 ++++----
 tools/objtool/check.c                         |  4 +-
 tools/testing/selftests/lkdtm/config          |  2 +-
 MAINTAINERS                                   |  6 ++-
 kernel/configs/hardening.config               |  6 +++
 69 files changed, 203 insertions(+), 171 deletions(-)
 create mode 100644 scripts/Makefile.kstack_erase
 rename include/linux/{stackleak.h => kstack_erase.h} (81%)
 rename drivers/misc/lkdtm/{stackleak.c => kstack_erase.c} (89%)
 rename kernel/{stackleak.c => kstack_erase.c} (87%)

-- 
2.34.1


