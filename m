Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A38CC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z3G8DZUhh/ihdkO7EHYMwCoMzRxS9EZESPgno/LP40M=; b=VS6BVjBKLwe357NuRF1MM0eTzL
	F8h0vt0HdmXLOfpRX2GhX2uRPL+ahXtc90QHPiTjVOIm0qaYfNKeCl3P3vJdUBWq1f2ZY5cbAmUmc
	Zup3mMuGDylagU+ehpu8uv9+6mUKcWXBR6WKa08lI/aZipGmouXCBrntwWbVVxu2gadoYkN5dQAsO
	a7YHIWNBog3LP3EegPGh2vq2j3cF8WTGNLL+6Yl0NalEpeKi0rb5poPQquyFrkFihY9W7eXzJ8KnL
	ZvvHcRsPYc5w0hs8DPl5+Nv1sFmYS249nIzVR8Ggizkn6r9liBjaJPHtEIy31/8qpsRzTjKJPcWqQ
	MUcUtegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cLm-00000007JsA-42vc;
	Mon, 07 Sep 2026 16:37:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cLl-00000007Js1-3AiM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:37:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E62E7601DB;
	Mon,  7 Sep 2026 16:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7241F00A3A;
	Mon,  7 Sep 2026 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799060;
	bh=z3G8DZUhh/ihdkO7EHYMwCoMzRxS9EZESPgno/LP40M=;
	h=From:To:Cc:Subject:Date;
	b=Si9nMXGgasJcw0XRAngC8KBTUAiAvJ7wvoKyckWWdSf58dUxQUjjIGFQ2b6E99/Lx
	 zbEn+2I3RGRTFTej48yRoqajP1Xmx4FNUmgiwsqvA7vdk5BoLvtRtllesnTzfN8zii
	 Iot0tehLLCHU4i6EW8CgOc9WRTVv9BdxyBUnnn84pCkUhcc5yruyTuNCEz4AOW8qAz
	 qL9NFCg5nG7V8nhtdrLAH5CeRPXeo0wLo9l2FoKfhMotBa8Z6Oulre/4OjQ3WjA61h
	 G3cM9qyCoEVhmgm790FTIsK8AUDtQmYpFfmdjjFK0IkP0CLCD8xdFLn++y/ADPu0sE
	 fDlUHqkS6pHUA==
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
Subject: [PATCH v2 00/14] arm64: Remove unused big-endian support
Date: Mon,  7 Sep 2026 17:37:11 +0100
Message-ID: <20260907163726.17104-1-will@kernel.org>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi folks,

This is version two of the arm64 big-endian removal series previously
posted here:

  https://lore.kernel.org/linux-arm-kernel/20260811140132.22778-1-will@kernel.org/

Changes since v1 include:
  * Rebased onto v7.3-rc1
  * Removed some now-redundant driver Kconfig entries
  * Force little-endian during boot
  * Minor stylistic cleanups

Arnd, I wasn't quite as aggressive with the drivers Kconfigs as your
suggestion at [1], since I didn't want to prevent COMPILE_TEST from a
big-endian architecture in cases where it is currently supported.

Cheers,

Will

[1] https://lore.kernel.org/linux-arm-kernel/6632712f-7782-4580-84c0-62124a016f46@app.fastmail.com/

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au> 
Cc: Marc Zyngier <maz@kernel.org>

--->8

Will Deacon (14):
  selftests/arm64: Remove big-endian support
  arm64: bpf: Remove big-endian support from the JIT compiler
  arm64: crypto: Assume a little-endian kernel
  arm64: lib: Assume a little-endian kernel in custom library routines
  arm64: lib: Assume a little-endian kernel in optimised string routines
  arm64: assembler: Remove endianness helper macros
  arm64: head: Force little-endian early during boot
  arm64: vdso32: Always build compat vDSO object as little-endian
  KVM: arm64: Remove support for a big-endian hypervisor object
  arm64: Remove all usage of CONFIG_CPU_BIG_ENDIAN
  arm64: Remove all usage of __AARCH64EB__
  arm64: image: Remove endianness handling for generating image header
  arm64: Kbuild: Remove vestigial big-endian support
  drivers: Kconfig: Simplify dependencies on ARM64 && !CPU_BIG_ENDIAN

 arch/arm64/Kconfig                           | 35 +-------
 arch/arm64/Makefile                          | 12 +--
 arch/arm64/crypto/aes-ce-ccm-core.S          |  4 +-
 arch/arm64/crypto/aes-neonbs-core.S          |  4 +-
 arch/arm64/crypto/ghash-ce-core.S            |  6 +-
 arch/arm64/crypto/sm4-ce-cipher-core.S       |  4 +-
 arch/arm64/include/asm/assembler.h           | 42 ---------
 arch/arm64/include/asm/compat.h              | 14 ---
 arch/arm64/include/asm/elf.h                 | 12 ---
 arch/arm64/include/asm/processor.h           |  2 -
 arch/arm64/include/asm/ptrace.h              |  6 --
 arch/arm64/include/asm/sysreg.h              | 50 +++--------
 arch/arm64/include/asm/thread_info.h         |  5 --
 arch/arm64/include/asm/word-at-a-time.h      |  6 --
 arch/arm64/include/uapi/asm/byteorder.h      |  4 -
 arch/arm64/kernel/fpsimd.c                   | 21 +----
 arch/arm64/kernel/head.S                     | 25 +-----
 arch/arm64/kernel/image.h                    | 38 +-------
 arch/arm64/kernel/kexec_image.c              |  5 +-
 arch/arm64/kernel/kgdb.c                     |  6 +-
 arch/arm64/kernel/ptrace.c                   |  8 +-
 arch/arm64/kernel/signal32.c                 | 13 ---
 arch/arm64/kernel/sys32.c                    |  5 --
 arch/arm64/kernel/vdso32/Makefile            |  4 -
 arch/arm64/kvm/hyp/include/nvhe/spinlock.h   |  4 -
 arch/arm64/kvm/hyp/nvhe/gen-hyprel.c         | 16 ----
 arch/arm64/lib/csum.c                        | 17 ----
 arch/arm64/lib/memchr.S                      |  2 +-
 arch/arm64/lib/memcmp.S                      |  2 -
 arch/arm64/lib/strcmp.S                      | 34 +------
 arch/arm64/lib/strlen.S                      | 26 ------
 arch/arm64/lib/strncmp.S                     | 93 ++------------------
 arch/arm64/lib/strnlen.S                     | 16 +---
 arch/arm64/mm/extable.c                      |  5 --
 arch/arm64/net/bpf_jit_comp.c                | 11 ---
 drivers/hv/Kconfig                           |  3 +-
 drivers/misc/vmw_vmci/Kconfig                |  2 +-
 drivers/net/ethernet/microsoft/Kconfig       |  2 +-
 drivers/soc/tegra/Kconfig                    |  5 --
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 19 +---
 tools/testing/selftests/rseq/rseq-arm64.h    |  5 --
 41 files changed, 54 insertions(+), 539 deletions(-)

-- 
2.55.0.979.g7e5102b832-goog


