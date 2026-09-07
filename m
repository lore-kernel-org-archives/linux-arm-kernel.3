Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C01C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw1P9vOFsqivhB5iGao14JrGpmYpz1xeNiJ0ljEBsf4=; b=ujcy+cDYlnHvvTNkFoIVMni6Yt
	omvCCIxghH0iHwZi5ew/gJ5Mby6GxyZptWoE51YWKkLJavbpSLo83+uU9/oxhBOKDBECc3BDCvVM6
	2O7QWSTo29VsBrrP1iLdkEhxCwY6iKFenMp7xf6lkrIgFb3wBEkeRiDE70suDwcUW/KHGKRdi3a+k
	FCnWLns6/HYamvLfjfczyovQ7yucKV+VbZ2bjVFJncx2EsGPjpwFffUjMip6zgRytlTBxgoVxcRiX
	1TUDctEEIAwF2XTWyOSX3ljuX5s/Ks/O6o+xoIzbLK610KcqT2dogSKi/T39gRshNGxk38jfOuYBl
	sa6RqCMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cMS-00000007KRu-3Ikk;
	Mon, 07 Sep 2026 16:38:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cMN-00000007KLe-2tS2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:38:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 730FD401B7;
	Mon,  7 Sep 2026 16:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014771F00A3D;
	Mon,  7 Sep 2026 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799099;
	bh=yw1P9vOFsqivhB5iGao14JrGpmYpz1xeNiJ0ljEBsf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jk70/5d/128aQs/mpfdWWCrMyTDcEfzYH1dlokTueYgxQr5AcY1f+UutB8Ve0ZqFa
	 tDyJ+GSvwau4BUGgo7sbYDe7449H4UCMS7pti7NAPVYErHyYQd/4vCKSy6DA9tiJSS
	 kitRXcwORdksX/81HE+me9avbmnUUGEMi6IsQIc+CUKpoUJRo6rjldlWlWCS5ChO5G
	 +8Z3PnQLFZBxTkJR+/VnCzLdxYieq1RfZsVw9ezazQgx+/czXvEGcHeEei314etfqF
	 S4JRy6YjZi2A1bNaHo+cCXWlBMkJWo/x6WS+RM8ecss+hvPP7Hz6KT8H8UZTHLlZqZ
	 d2zVTSNZ2KjRw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 13/14] arm64: Kbuild: Remove vestigial big-endian support
Date: Mon,  7 Sep 2026 17:37:24 +0100
Message-ID: <20260907163726.17104-14-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
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

Since 1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend on
BROKEN"), CONFIG_CPU_BIG_ENDIAN has depended on BROKEN for arm64.

Remove the last traces of its existence and unconditionally force a
little-endian kernel build.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig  | 35 ++++-------------------------------
 arch/arm64/Makefile | 12 ++----------
 2 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..766410827f3c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -73,7 +73,7 @@ config ARM64
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
-	select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
+	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_ATOMIC_RMW
@@ -224,7 +224,7 @@ config ARM64
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
+	select HAVE_RUST
 	select HAVE_STACKPROTECTOR
 	select HAVE_STATIC_CALL if CFI
 	select HAVE_SYSCALL_TRACEPOINTS
@@ -263,10 +263,6 @@ config ARM64
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
-config RUSTC_SUPPORTS_ARM64
-	def_bool y
-	depends on CPU_LITTLE_ENDIAN
-
 config CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
 	def_bool CC_IS_CLANG
 	# https://github.com/ClangBuiltLinux/linux/issues/1507
@@ -1596,28 +1592,6 @@ config ARM64_LPA2
 	def_bool y
 	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES
 
-choice
-	prompt "Endianness"
-	default CPU_LITTLE_ENDIAN
-	help
-	  Select the endianness of data accesses performed by the CPU. Userspace
-	  applications will need to be compiled and linked for the endianness
-	  that is selected here.
-
-config CPU_BIG_ENDIAN
-	bool "Build big-endian kernel"
-	depends on BROKEN
-	help
-	  Say Y if you plan on running a kernel with a big-endian userspace.
-
-config CPU_LITTLE_ENDIAN
-	bool "Build little-endian kernel"
-	help
-	  Say Y if you plan on running a kernel with a little-endian userspace.
-	  This is usually the case for distributions targeting arm64.
-
-endchoice
-
 config NR_CPUS
 	int "Maximum number of CPUs (2-4096)"
 	range 2 4096
@@ -1855,7 +1829,6 @@ config KUSER_HELPERS
 
 config COMPAT_VDSO
 	bool "Enable vDSO for 32-bit applications"
-	depends on !CPU_BIG_ENDIAN
 	depends on (CC_IS_CLANG && LD_IS_LLD) || "$(CROSS_COMPILE_COMPAT)" != ""
 	default y
 	help
@@ -2319,7 +2292,7 @@ menu "ARMv9.6 architectural features"
 config ARM64_LSUI
 	bool "Support Unprivileged Load Store Instructions (LSUI)"
 	default y
-	depends on AS_HAS_LSUI && !CPU_BIG_ENDIAN
+	depends on AS_HAS_LSUI
 	help
 	  The Unprivileged Load Store Instructions (LSUI) provides
 	  variants load/store instructions that access user-space memory
@@ -2524,7 +2497,7 @@ config EFI_STUB
 
 config EFI
 	bool "UEFI runtime support"
-	depends on OF && !CPU_BIG_ENDIAN
+	depends on OF
 	depends on KERNEL_MODE_NEON
 	select ARCH_SUPPORTS_ACPI
 	select LIBFDT
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef70..04e1a0d12f8f 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -119,20 +119,12 @@ KBUILD_CFLAGS	+= -ffixed-x18
 KBUILD_RUSTFLAGS += -Zfixed-x18
 endif
 
-ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
-KBUILD_CPPFLAGS	+= -mbig-endian
-CHECKFLAGS	+= -D__AARCH64EB__
-# Prefer the baremetal ELF build target, but not all toolchains include
-# it so fall back to the standard linux version if needed.
-KBUILD_LDFLAGS	+= -EB $(call ld-option, -maarch64elfb, -maarch64linuxb -z norelro)
-UTS_MACHINE	:= aarch64_be
-else
 KBUILD_CPPFLAGS	+= -mlittle-endian
 CHECKFLAGS	+= -D__AARCH64EL__
-# Same as above, prefer ELF but fall back to linux target if needed.
+# Prefer the baremetal ELF build target, but not all toolchains include
+# it so fall back to the standard linux version if needed.
 KBUILD_LDFLAGS	+= -EL $(call ld-option, -maarch64elf, -maarch64linux -z norelro)
 UTS_MACHINE	:= aarch64
-endif
 
 ifeq ($(CONFIG_LD_IS_LLD), y)
 KBUILD_LDFLAGS	+= -z norelro
-- 
2.55.0.979.g7e5102b832-goog


