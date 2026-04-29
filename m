Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37934FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PM5RNIodsJcj1R2EllMRf+cNY3Uyp8kVdSMlAilGKtE=; b=tIKDln/3J/q9Mo
	abyc68jYASCmTzbYCQKE2WYR3dyniZLfCgD+GZy+n4w1sSPf79ainrgnqznV/4LJJLUqC8AzUyI0c
	s43rn1J138Vbo0v+9aaDeVKqi4gOuaHAJA5STxrI5WYF6z4MPVAjczZR1Tu7lc6v1bV5RND0R6Ot1
	gT6BQRg7/5mRQQlrPFv5E1I8+XUk59ePwaF+5Ngxb42m70YfiljLxbv5rxZs4K1yrIB+myc/iKcpq
	wqqx7gHYdAjaqDJlYlzbePb5qldVnjlIVc1aETjDCflb7N2EaH92xgT9iEHH4iCZAIhA1IE1UC0e0
	hniK4i1BC2Tn0lbr1/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHv9o-00000002ol7-477p;
	Wed, 29 Apr 2026 03:00:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHv9n-00000002okq-1h8T;
	Wed, 29 Apr 2026 03:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F3756015B;
	Wed, 29 Apr 2026 03:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3B9C2BCB7;
	Wed, 29 Apr 2026 03:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431609;
	bh=BPWip7f/+n2wb9mPvkHgJCd0lFqOC+ZsA1RInw6FYx8=;
	h=From:Subject:Date:To:Cc:From;
	b=Lm6oqDaZCWZPGshfZZK+k3YJKNsDnG8AlHI64y2CWDqFmLMmaqsMBR+/vE3bA/wP/
	 qBOoFQ/mqwzel7Gid5GmxZodV4mf1xpeBH0sY7SsY9LGRMSt74iysuHwe2M56ExfD8
	 goiP9iOwlp8C2br8Add6rW5f9H9OjquXWl9bYh+Fcv2GTS5kMfEwGHeClKFelU19sn
	 SIMG/hdVguN/Ocxka1uk3ZIdHBi5e04hd81Ss92pRLqtTlQ8s93zp/uOUkCGXm4kF9
	 f+rpPRHBzzJdlmq8Kt6ysbjX7bxF15iXX8oENUhNFMxcT58CLIzAyP8SBPtcmN42wO
	 4oXtJ02loyEIw==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 00/14] Bump minimum version of LLVM for building the kernel
 to 17.0.1
Date: Tue, 28 Apr 2026 22:59:06 -0400
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNyw6CMBCF4Vchs3aSUioSX8W4oDDgGHpJbzEhv
 LtFl9/inH+HSIEpwr3ZIVDhyM5WtJcGptdoV0Keq0EK2QslJepsPBq2bLLBmL13IdGM21YMFgr
 nHpPD9oZa9d0wXgctVAf1zwda+PNrPZ5/x6zfNKUzAMfxBS9G0zWNAAAA
X-Change-ID: 20260422-bump-minimum-supported-llvm-version-to-17-b4638a58b043
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org, 
 Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
 linux-arm-kernel@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6086; i=nathan@kernel.org;
 h=from:subject:message-id; bh=BPWip7f/+n2wb9mPvkHgJCd0lFqOC+ZsA1RInw6FYx8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfSwy7+t4r7Kv16klo6al7FnGl0OyWQ1SCjbIF4/MYH
 9eSzsiOUhYGMS4GWTFFlurHqscNDeecZbxxahLMHFYmkCEMXJwCMJGV0xn+B1/JuipsITflWW/l
 m6DA5oOhB7lmcdcvX5Hz8Y+Uefb79wz/7J86+2gJ/PR/d2GTU3jbj9SMJM3fnd0H9j5T980/ZXu
 PBwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

The current minimum version of LLVM for building the kernel is 15.0.0.
However, there are two deficiencies compared to GCC that were fixed in
LLVM 17 that are starting to become more noticeable.

The first was a bug in LLVM's scope checker [1], where all labels in a
function were validated as potential targets of an asm goto statement,
even if they were not listed in the asm goto statement as targets. This
becomes particularly problematic when the cleanup attribute is used, as

  asm goto(... : label_a);
  ...
label_a:
  ...
  int var __free(foo);
  asm goto(... : label_b);
  ...
label_b:
  ...

will trigger an error since the scope checker will complain that the
cleanup variable would be skipped when jumping from the first asm goto
to label_b (which obviously cannot happen). This issue was the catalyst
for commit e2ffa15b9baa ("kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on
clang < 17"). Unfortunately, this issue is reproducible with regular asm
goto in addition to asm goto with outputs, so that change was not
entirely sufficient to avoid the issue altogether. As asm goto has
effectively been required since commit a0a12c3ed057 ("asm goto:
eradicate CC_HAS_ASM_GOTO") and the usage of the cleanup attribute
continues to grow across the tree, raising the minimum to a version that
avoids this issue altogether is a better long term solution than
attempting to workaround it at every spot where it happens.

The second issue is an incompatibility with GCC 8.1+ around variables
marked with const being valid constant expressions for _Static_assert
and other macros [2]. With GCC 8.1 being the minimum supported version
since commit 118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30"),
this incompatibility becomes more of a maintenance burden since only
clang-15 and clang-16 are affected by it.

Looking at the clang version of various major distributions through
Docker images, no one should be left behind as a result of this bump, as
the old ones cannot clear the current minimum of 15.0.0.

  archlinux:latest              clang version 22.1.3
  debian:oldoldstable-slim      Debian clang version 11.0.1-2
  debian:oldstable-slim         Debian clang version 14.0.6
  debian:stable-slim            Debian clang version 19.1.7 (3+b1)
  debian:testing-slim           Debian clang version 21.1.8 (3+b1)
  debian:unstable-slim          Debian clang version 21.1.8 (7+b1)
  fedora:42                     clang version 20.1.8 (Fedora 20.1.8-4.fc42)
  fedora:latest                 clang version 21.1.8 (Fedora 21.1.8-4.fc43)
  fedora:44                     clang version 22.1.1 (Fedora 22.1.1-2.fc44)
  fedora:rawhide                clang version 22.1.3 (Fedora 22.1.3-1.fc45)
  opensuse/leap:latest          clang version 17.0.6
  opensuse/tumbleweed:latest    clang version 21.1.8
  ubuntu:jammy                  Ubuntu clang version 14.0.0-1ubuntu1.1
  ubuntu:noble                  Ubuntu clang version 18.1.3 (1ubuntu1)
  ubuntu:questing               Ubuntu clang version 20.1.8 (0ubuntu4)
  ubuntu:resolute               Ubuntu clang version 21.1.8 (6ubuntu1)

17.0.1 is chosen as the minimum instead of 17.0.0 to ensure that the
particular version of LLVM 17 has the two aforementioned bugs fixed, as
the second was fixed during the 17.0.0 release candidate phase and it
was not until LLVM 18 that LLVM adopted the scheme of x.0.0 being a
prerelease version and x.1.0 is a release version [3] to help with
scenarios such as this.

The first patch in the series does the actual bump. The remaining
patches are cleanups of workarounds for various issues that are no
longer needed with the bump.

I plan to take this via the Kbuild tree for 7.2, please provide Acks as
necessary.

[1]: https://github.com/llvm/llvm-project/commit/f023f5cdb2e6c19026f04a15b5a935c041835d14
[2]: https://github.com/llvm/llvm-project/commit/0b2d5b967d98375793897295d651f58f6fbd3034
[3]: https://github.com/llvm/llvm-project/commit/4532617ae420056bf32f6403dde07fb99d276a49

---
Nathan Chancellor (14):
      kbuild: Bump minimum version of LLVM for building the kernel to 17.0.1
      security/Kconfig.hardening: Remove tautological condition from CC_HAS_ZERO_CALL_USED_REGS
      security/Kconfig.hardening: Remove tautological condition from FORTIFY_SOURCE
      security/Kconfig.hardening: Remove tautological condition from CC_HAS_RANDSTRUCT
      arch/Kconfig: Remove tautological conditions from HAS_LTO_CLANG
      arch/Kconfig: Remove tautological condition from AUTOFDO_CLANG
      ARM: Drop tautological ld.lld conditions from ARCH_MULTI_V4{,T}
      riscv: Remove tautological condition from selection of ARCH_SUPPORTS_CFI
      riscv: Drop tautological condition from TOOLCHAIN_NEEDS_OLD_ISA_SPEC
      scripts/Makefile.warn: Drop -Wformat handling for clang < 16
      x86/build: Drop unused '-ffreestanding' addition to KBUILD_CFLAGS
      x86/module: Revert "Deal with GOT based stack cookie load on Clang < 17"
      x86/entry/vdso32: Remove conditional omission of '.cfi_offset eflags'
      kbuild: Remove check for broken scoping with clang < 17 in CC_HAS_ASM_GOTO_OUTPUT

 Documentation/process/changes.rst      |  2 +-
 arch/Kconfig                           |  5 +----
 arch/arm/Kconfig.platforms             |  4 ----
 arch/riscv/Kconfig                     | 16 +++++++---------
 arch/x86/Makefile                      |  5 -----
 arch/x86/entry/vdso/vdso32/sigreturn.S | 10 ----------
 arch/x86/include/asm/elf.h             |  5 ++---
 arch/x86/kernel/module.c               | 15 ---------------
 init/Kconfig                           |  3 ---
 scripts/Makefile.warn                  | 10 ----------
 scripts/min-tool-version.sh            |  2 +-
 security/Kconfig.hardening             |  8 --------
 12 files changed, 12 insertions(+), 73 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260422-bump-minimum-supported-llvm-version-to-17-b4638a58b043

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


