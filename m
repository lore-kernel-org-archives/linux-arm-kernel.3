Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6219CC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 06:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:
	Message-Id:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oAXjI0apa7kqIIJEbs93dN3t43HIG2L7yLBf0wEIXg0=; b=eNzyNHPELBdA6ooPZpfx50ggrp
	ruSSqqzw5haijO4BvTGrovFCmHINQ8/+voDBZ2YJQJCReGKOrvaO7svmvENQe5r8dfZVqSUqj5H8c
	7i/8Y4fErq+VbEYBnJ0ngOnzT75V+o3L3kzEJdCt8+yOzt4D+U+RXYk5X7KVgP+F3rV3nzBjBVbpk
	D26zNqmyAri44GrRMFkcd0AbDmpicBRm1MWzD+1O65j2qJ52QNiMDHYYZ7PVfYAWSXyQ+jB7/v+Dj
	rycISMFmcND4B1IsOsmqilBJtLLckCESgHR7z1xydboZ9yTgGIvmyIGxv7pKfmWbZz7Cxr0+rxoPl
	B6e6OoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vZJ-000000030B4-35kH;
	Sun, 27 Apr 2025 06:32:49 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vXM-00000002zVU-0L25;
	Sun, 27 Apr 2025 06:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:Message-Id:Date:Sender:Reply-To:MIME-Version
	:Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oAXjI0apa7kqIIJEbs93dN3t43HIG2L7yLBf0wEIXg0=; b=fKrAb1QY6AYmSKC1+SbgwPZUB9
	ND6uPjsk0kfdAruuwq3/wh1Rjs0ArDAhMxkfFj/YS8iPHgbV+WU3ZNU1TpzS2lZudY3arRUqlFEci
	cTBYneIKtmDaXSHmf8SiUzDUr38H2kHgyB2twrVfSJjI8j7gHHEYPnP/kMnSC6DKRbJVivK8p4Gwg
	DAHYRw4IH9o8iSK6l01mCSmN78jjq3othguu9t5gazmg9DloT8PSYrcPiVJlXhbtVri8zLPFnarWN
	JC4zlJACV8FcZUWdwmtuPZnzOx5cHSZRXG9rOAnHMjIgXrXs+LP4m3XOp4BH0STFTfzldvCnTle1H
	XRSE9/Lw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8vXF-001LUW-2x;
	Sun, 27 Apr 2025 14:30:42 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 14:30:41 +0800
Date: Sun, 27 Apr 2025 14:30:41 +0800
Message-Id: <cover.1745734678.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_233048_408130_9A03F3B1 
X-CRM114-Status: GOOD (  18.72  )
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

Changes in v2:
- Rebase on top of lib partial block helper series.
- Restore the block-only shash implementation of sha256.
- Move the SIMD hardirq test out of the block functions so that
  it is only done for the lib/crypto interface.
- Split the lib/crypto sha256 module to break cycle in allmod build.

This is based on

	https://patchwork.kernel.org/project/linux-crypto/list/?series=957415

Original description:

Following the example of several other algorithms (e.g. CRC32, ChaCha,
Poly1305, BLAKE2s), this series refactors the kernel's existing
architecture-optimized SHA-256 code to be available via the library API,
instead of just via the crypto_shash API as it was before.  It also
reimplements the SHA-256 crypto_shash API on top of the library API.

This makes it possible to use the SHA-256 library in
performance-critical cases.  The new design is also much simpler, with a
negative diffstat of over 1200 lines.  Finally, this also fixes the
longstanding issue where the arch-optimized SHA-256 was disabled by
default, so people often forgot to enable it.

For now the SHA-256 library is well-covered by the crypto_shash
self-tests, but I plan to add a test for the library directly later.
I've fully tested this series on arm, arm64, riscv, and x86.  On mips,
powerpc, s390, and sparc I've only been able to partially test it, since
QEMU does not support the SHA-256 instructions on those platforms.  If
anyone with access to a mips, powerpc, s390, or sparc system that has
SHA-256 instructions can verify that the crypto self-tests still pass,
that would be appreciated.  But I don't expect any issues, especially
since the new code is more straightforward than the old code.

Eric Biggers (13):
  crypto: sha256 - support arch-optimized lib and expose through shash
  crypto: arm/sha256 - implement library instead of shash
  crypto: arm64/sha256 - remove obsolete chunking logic
  crypto: arm64/sha256 - implement library instead of shash
  crypto: mips/sha256 - implement library instead of shash
  crypto: powerpc/sha256 - implement library instead of shash
  crypto: riscv/sha256 - implement library instead of shash
  crypto: s390/sha256 - implement library instead of shash
  crypto: sparc - move opcodes.h into asm directory
  crypto: sparc/sha256 - implement library instead of shash
  crypto: x86/sha256 - implement library instead of shash
  crypto: sha256 - remove sha256_base.h
  crypto: lib/sha256 - improve function prototypes

 arch/arm/configs/exynos_defconfig             |   1 -
 arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
 arch/arm/configs/multi_v7_defconfig           |   1 -
 arch/arm/configs/omap2plus_defconfig          |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/crypto/Kconfig                       |  21 -
 arch/arm/crypto/Makefile                      |   8 +-
 arch/arm/crypto/sha2-ce-glue.c                |  87 ----
 arch/arm/crypto/sha256_glue.c                 | 107 -----
 arch/arm/crypto/sha256_glue.h                 |   9 -
 arch/arm/crypto/sha256_neon_glue.c            |  75 ---
 arch/arm/lib/crypto/.gitignore                |   1 +
 arch/arm/lib/crypto/Kconfig                   |   7 +
 arch/arm/lib/crypto/Makefile                  |   8 +-
 arch/arm/{ => lib}/crypto/sha256-armv4.pl     |  20 +-
 .../sha2-ce-core.S => lib/crypto/sha256-ce.S} |  10 +-
 arch/arm/lib/crypto/sha256.c                  |  64 +++
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  19 -
 arch/arm64/crypto/Makefile                    |  13 +-
 arch/arm64/crypto/sha2-ce-glue.c              | 138 ------
 arch/arm64/crypto/sha256-glue.c               | 171 -------
 arch/arm64/crypto/sha512-glue.c               |   6 +-
 arch/arm64/lib/crypto/.gitignore              |   1 +
 arch/arm64/lib/crypto/Kconfig                 |   6 +
 arch/arm64/lib/crypto/Makefile                |   9 +-
 .../crypto/sha2-armv8.pl}                     |   2 +-
 .../sha2-ce-core.S => lib/crypto/sha256-ce.S} |  36 +-
 arch/arm64/lib/crypto/sha256.c                |  75 +++
 arch/mips/cavium-octeon/Kconfig               |   6 +
 .../mips/cavium-octeon/crypto/octeon-sha256.c | 139 ++----
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 arch/powerpc/crypto/Kconfig                   |  11 -
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/sha256-spe-glue.c         | 128 ------
 arch/powerpc/lib/crypto/Kconfig               |   6 +
 arch/powerpc/lib/crypto/Makefile              |   3 +
 .../powerpc/{ => lib}/crypto/sha256-spe-asm.S |   0
 arch/powerpc/lib/crypto/sha256.c              |  70 +++
 arch/riscv/crypto/Kconfig                     |  11 -
 arch/riscv/crypto/Makefile                    |   3 -
 arch/riscv/crypto/sha256-riscv64-glue.c       | 125 -----
 arch/riscv/lib/crypto/Kconfig                 |   8 +
 arch/riscv/lib/crypto/Makefile                |   3 +
 .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S    |   4 +-
 arch/riscv/lib/crypto/sha256.c                |  67 +++
 arch/s390/configs/debug_defconfig             |   1 -
 arch/s390/configs/defconfig                   |   1 -
 arch/s390/crypto/Kconfig                      |  10 -
 arch/s390/crypto/Makefile                     |   1 -
 arch/s390/crypto/sha256_s390.c                | 144 ------
 arch/s390/lib/crypto/Kconfig                  |   6 +
 arch/s390/lib/crypto/Makefile                 |   2 +
 arch/s390/lib/crypto/sha256.c                 |  47 ++
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   2 -
 arch/sparc/crypto/aes_asm.S                   |   3 +-
 arch/sparc/crypto/aes_glue.c                  |   3 +-
 arch/sparc/crypto/camellia_asm.S              |   3 +-
 arch/sparc/crypto/camellia_glue.c             |   3 +-
 arch/sparc/crypto/des_asm.S                   |   3 +-
 arch/sparc/crypto/des_glue.c                  |   3 +-
 arch/sparc/crypto/md5_asm.S                   |   3 +-
 arch/sparc/crypto/md5_glue.c                  |   3 +-
 arch/sparc/crypto/sha1_asm.S                  |   3 +-
 arch/sparc/crypto/sha1_glue.c                 |   3 +-
 arch/sparc/crypto/sha256_glue.c               | 129 ------
 arch/sparc/crypto/sha512_asm.S                |   3 +-
 arch/sparc/crypto/sha512_glue.c               |   3 +-
 arch/sparc/{crypto => include/asm}/opcodes.h  |   6 +-
 arch/sparc/lib/Makefile                       |   1 +
 arch/sparc/lib/crc32c_asm.S                   |   3 +-
 arch/sparc/lib/crypto/Kconfig                 |   8 +
 arch/sparc/lib/crypto/Makefile                |   4 +
 arch/sparc/lib/crypto/sha256.c                |  64 +++
 arch/sparc/{ => lib}/crypto/sha256_asm.S      |   5 +-
 arch/x86/crypto/Kconfig                       |  14 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/sha256_ssse3_glue.c           | 432 ------------------
 arch/x86/lib/crypto/Kconfig                   |   8 +
 arch/x86/lib/crypto/Makefile                  |   3 +
 arch/x86/{ => lib}/crypto/sha256-avx-asm.S    |  12 +-
 arch/x86/{ => lib}/crypto/sha256-avx2-asm.S   |  12 +-
 .../crypto/sha256-ni-asm.S}                   |  36 +-
 arch/x86/{ => lib}/crypto/sha256-ssse3-asm.S  |  14 +-
 arch/x86/lib/crypto/sha256.c                  |  80 ++++
 arch/x86/purgatory/Makefile                   |   3 -
 arch/x86/purgatory/sha256.c                   |  15 +
 crypto/Kconfig                                |   1 +
 crypto/Makefile                               |   3 +-
 crypto/sha256.c                               | 198 ++++++++
 crypto/sha256_generic.c                       | 102 -----
 include/crypto/internal/sha2.h                |  75 +++
 include/crypto/sha2.h                         |  23 +-
 include/crypto/sha256_base.h                  | 148 ------
 lib/crypto/Kconfig                            |  30 ++
 lib/crypto/Makefile                           |   1 +
 lib/crypto/sha256-generic.c                   | 139 ++++++
 lib/crypto/sha256.c                           | 150 ++----
 100 files changed, 1165 insertions(+), 2313 deletions(-)
 delete mode 100644 arch/arm/crypto/sha2-ce-glue.c
 delete mode 100644 arch/arm/crypto/sha256_glue.c
 delete mode 100644 arch/arm/crypto/sha256_glue.h
 delete mode 100644 arch/arm/crypto/sha256_neon_glue.c
 rename arch/arm/{ => lib}/crypto/sha256-armv4.pl (97%)
 rename arch/arm/{crypto/sha2-ce-core.S => lib/crypto/sha256-ce.S} (91%)
 create mode 100644 arch/arm/lib/crypto/sha256.c
 delete mode 100644 arch/arm64/crypto/sha2-ce-glue.c
 delete mode 100644 arch/arm64/crypto/sha256-glue.c
 rename arch/arm64/{crypto/sha512-armv8.pl => lib/crypto/sha2-armv8.pl} (99%)
 rename arch/arm64/{crypto/sha2-ce-core.S => lib/crypto/sha256-ce.S} (80%)
 create mode 100644 arch/arm64/lib/crypto/sha256.c
 delete mode 100644 arch/powerpc/crypto/sha256-spe-glue.c
 rename arch/powerpc/{ => lib}/crypto/sha256-spe-asm.S (100%)
 create mode 100644 arch/powerpc/lib/crypto/sha256.c
 delete mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
 rename arch/riscv/{ => lib}/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (98%)
 create mode 100644 arch/riscv/lib/crypto/sha256.c
 delete mode 100644 arch/s390/crypto/sha256_s390.c
 create mode 100644 arch/s390/lib/crypto/sha256.c
 delete mode 100644 arch/sparc/crypto/sha256_glue.c
 rename arch/sparc/{crypto => include/asm}/opcodes.h (96%)
 create mode 100644 arch/sparc/lib/crypto/Kconfig
 create mode 100644 arch/sparc/lib/crypto/Makefile
 create mode 100644 arch/sparc/lib/crypto/sha256.c
 rename arch/sparc/{ => lib}/crypto/sha256_asm.S (95%)
 delete mode 100644 arch/x86/crypto/sha256_ssse3_glue.c
 rename arch/x86/{ => lib}/crypto/sha256-avx-asm.S (98%)
 rename arch/x86/{ => lib}/crypto/sha256-avx2-asm.S (98%)
 rename arch/x86/{crypto/sha256_ni_asm.S => lib/crypto/sha256-ni-asm.S} (85%)
 rename arch/x86/{ => lib}/crypto/sha256-ssse3-asm.S (98%)
 create mode 100644 arch/x86/lib/crypto/sha256.c
 create mode 100644 arch/x86/purgatory/sha256.c
 create mode 100644 crypto/sha256.c
 delete mode 100644 crypto/sha256_generic.c
 create mode 100644 include/crypto/internal/sha2.h
 delete mode 100644 include/crypto/sha256_base.h
 create mode 100644 lib/crypto/sha256-generic.c

-- 
2.39.5


