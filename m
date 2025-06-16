Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA53C71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 02:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5hJdqrXQt7lyei3+VCLWuILyr31sJyCyCRNwtuXXtas=; b=cvIc61/0CQ90QmY0M+jmt72yyw
	uycWG92QCePYqyMpb5/0ZfosEgqOnN4shoItfQk77CIgY+j/JTftf5vPKr4uyh8Un8vPBaeHZrwXL
	Bq6Gu+g1YddE33rhIRJ/AGdUL1ZVTM7HvpaaMZnaGgBjwWujX2z5b2LlFOqjMMVeDMAj1L788mjkl
	naq2SIi9eVCrabf4xpc/H41wZRqKS0Ak4JNrC8LygesyNCjThv4at/J0yV8+jjiV9p2DYPz8q8tOZ
	lPElLIplucDiT7M9HeFacmfRvQkQPO+LqXwpDVXnoIsx8+cbXHJtabSxbaxKDmmjTCxPsCQRhVM2K
	75RM2Jww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQzYF-000000039V9-3Jw6;
	Mon, 16 Jun 2025 02:26:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyrC-000000035ZS-0UVp;
	Mon, 16 Jun 2025 01:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A49D4A683;
	Mon, 16 Jun 2025 01:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA266C4CEE3;
	Mon, 16 Jun 2025 01:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750038113;
	bh=y2sfSOcIVIm5TLfKyQ/mKLJQuEYlH2/C3vDsfThYsOQ=;
	h=From:To:Cc:Subject:Date:From;
	b=F6u+Y88r8vCozKhMCTzW2dZdkrJcwXbJDB1FSnsp95/7isEVv89ggIP9yDlbCC0S3
	 /BXK7SzXm8ldeLwexN2XjhlqUqygRif3DxjcrH8y4Di8rAXRRV5z81+3LYgBRTuKvT
	 NjnPqSO4515WsN5VWoDAJ9AYGAOPLq7Qy1jUgm6Ufbv80qnwyebgwUWWowSM6ZvVJN
	 91lm0uwCzLAd443g1dDNPBlTWTiCBDU62YmnNLTmJ+lpnT8C19rkRy9KgC+s4SZOHg
	 6WDEe1J8iRxTjFQ1l4lI5Pxg9ndmU43AiL3tEc1R3zJoeMt7+2dguorpPn1FX4Gqor
	 wbd89LkQaOjHw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 00/17] SHA-512 library functions
Date: Sun, 15 Jun 2025 18:40:02 -0700
Message-ID: <20250616014019.415791-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_184154_204628_48063113 
X-CRM114-Status: GOOD (  21.01  )
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

This series applies to v6.16-rc1 and is targeting the libcrypto-next
tree.  It is also available at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha512-lib-v2

This series adds support for SHA-384, SHA-512, HMAC-SHA384, and
HMAC-SHA512 to lib/crypto/.  The new functions take advantage of the
kernel's existing architecture-optimized implementations of the SHA-512
compression function.  The new functions are fully tested using KUnit.

To avoid duplicating all arch-optimized implementations of the SHA-512
compression function (~3000 lines of code total), they are moved into
lib/crypto/ rather than copied.  To make the "sha384", "sha512",
"hmac(sha384)", and "hmac(sha512)" crypto_shash algorithms in the
old-school crypto API continue to be properly optimized after that, they
are reimplemented on top of lib/crypto/, which is straightforward.

The following lists some of the design choices and conventions that I've
followed in more detail.  Where these differ from the code or APIs for
other algorithms (e.g., SHA-256 in some cases), I'd like to do it this
way going forward and plan to fix up the other algorithms accordingly:

- APIs are fully documented with kerneldoc comments.

- APIs cannot fail, and return void.

- APIs work in all contexts.  This doesn't mean that they *should* be
  called in all contexts, but rather they always just work as expected.

- Tests are KUnit tests, and they are fairly thorough (more thorough
  than crypto/testmgr.c) and also optionally include benchmarks.

- Architecture-optimized code is integrated the same way I'm doing it
  for lib/crc/: it's in subdirectories lib/crypto/$(SRCARCH), it's
  enabled by default, and it's inlined into the same module as the
  generic code.  This solves a number of problems; for more details, see
  https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org

- HMAC support is a first-class citizen.

- APIs handle zeroization, when applicable.

- Message contexts are *_ctx instead of *_state.  It's shorter, avoids
  ambiguity with the compression function state, and matches OpenSSL.

- Length arguments are size_t, are in bytes, are named len or *_len, and
  immediately follow the corresponding buffer.  "Object" being operated
  on is first argument; outputs otherwise follow inputs.

- The structures for different algorithms use different types, which
  prevents usage errors where functions are mixed up between algorithms.

- The compression function state is strongly typed, not a plain array.

Changed in v2:
- Added "crypto: sha512 - use same state format as legacy drivers"
- Fixed build on user-mode Linux
- Fixed W=1 build warning by adding <linux/export.h>
- Optimized __sha512_final() and __hmac_sha512_final() slightly

Eric Biggers (17):
  crypto: sha512 - rename conflicting symbols
  lib/crypto/sha512: add support for SHA-384 and SHA-512
  lib/crypto/sha512: add HMAC-SHA384 and HMAC-SHA512 support
  lib/crypto/sha512: add KUnit tests for SHA-384 and SHA-512
  lib/crypto/sha256: add KUnit tests for SHA-224 and SHA-256
  crypto: riscv/sha512 - stop depending on sha512_generic_block_fn
  crypto: sha512 - replace sha512_generic with wrapper around SHA-512
    library
  crypto: sha512 - use same state format as legacy drivers
  lib/crypto/sha512: migrate arm-optimized SHA-512 code to library
  lib/crypto/sha512: migrate arm64-optimized SHA-512 code to library
  mips: cavium-octeon: move octeon-crypto.h into asm directory
  lib/crypto/sha512: migrate mips-optimized SHA-512 code to library
  lib/crypto/sha512: migrate riscv-optimized SHA-512 code to library
  lib/crypto/sha512: migrate s390-optimized SHA-512 code to library
  lib/crypto/sha512: migrate sparc-optimized SHA-512 code to library
  lib/crypto/sha512: migrate x86-optimized SHA-512 code to library
  crypto: sha512 - remove sha512_base.h

 arch/arm/configs/exynos_defconfig             |   1 -
 arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
 arch/arm/configs/multi_v7_defconfig           |   1 -
 arch/arm/configs/omap2plus_defconfig          |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/crypto/Kconfig                       |  10 -
 arch/arm/crypto/Makefile                      |  15 -
 arch/arm/crypto/sha512-glue.c                 | 110 ---
 arch/arm/crypto/sha512-neon-glue.c            |  75 --
 arch/arm/crypto/sha512.h                      |   3 -
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  19 -
 arch/arm64/crypto/Makefile                    |  14 -
 arch/arm64/crypto/sha512-ce-glue.c            |  96 ---
 arch/arm64/crypto/sha512-glue.c               |  83 ---
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 .../mips/cavium-octeon/crypto/octeon-crypto.c |   3 +-
 arch/mips/cavium-octeon/crypto/octeon-md5.c   |   3 +-
 arch/mips/cavium-octeon/crypto/octeon-sha1.c  |   3 +-
 .../mips/cavium-octeon/crypto/octeon-sha256.c |   3 +-
 .../mips/cavium-octeon/crypto/octeon-sha512.c | 167 -----
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 .../asm/octeon/crypto.h}                      |   0
 arch/riscv/crypto/Kconfig                     |  11 -
 arch/riscv/crypto/Makefile                    |   3 -
 arch/riscv/crypto/sha512-riscv64-glue.c       | 124 ----
 arch/s390/configs/debug_defconfig             |   1 -
 arch/s390/configs/defconfig                   |   1 -
 arch/s390/crypto/Kconfig                      |  10 -
 arch/s390/crypto/Makefile                     |   1 -
 arch/s390/crypto/sha512_s390.c                | 151 ----
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   2 -
 arch/sparc/crypto/sha512_glue.c               | 122 ----
 arch/x86/crypto/Kconfig                       |  13 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/sha512_ssse3_glue.c           | 322 ---------
 crypto/Kconfig                                |   4 +-
 crypto/Makefile                               |   2 +-
 crypto/sha512.c                               | 338 +++++++++
 crypto/sha512_generic.c                       | 217 ------
 crypto/testmgr.c                              |  16 +
 drivers/crypto/starfive/jh7110-hash.c         |   8 +-
 include/crypto/sha2.h                         | 350 +++++++++
 include/crypto/sha512_base.h                  | 120 ----
 lib/crypto/Kconfig                            |  20 +
 lib/crypto/Makefile                           |  38 +
 lib/crypto/arm/.gitignore                     |   2 +
 .../crypto => lib/crypto/arm}/sha512-armv4.pl |   0
 lib/crypto/arm/sha512.h                       |  38 +
 lib/crypto/arm64/.gitignore                   |   2 +
 .../crypto/arm64}/sha512-ce-core.S            |  10 +-
 lib/crypto/arm64/sha512.h                     |  46 ++
 lib/crypto/mips/sha512.h                      |  74 ++
 .../riscv}/sha512-riscv64-zvknhb-zvkb.S       |   4 +-
 lib/crypto/riscv/sha512.h                     |  41 ++
 lib/crypto/s390/sha512.h                      |  28 +
 lib/crypto/sha512.c                           | 400 +++++++++++
 lib/crypto/sparc/sha512.h                     |  42 ++
 .../crypto => lib/crypto/sparc}/sha512_asm.S  |   0
 lib/crypto/tests/Kconfig                      |  24 +
 lib/crypto/tests/Makefile                     |   6 +
 lib/crypto/tests/hash-test-template.h         | 512 ++++++++++++++
 lib/crypto/tests/sha224-testvecs.h            | 223 ++++++
 lib/crypto/tests/sha224_kunit.c               |  50 ++
 lib/crypto/tests/sha256-testvecs.h            | 223 ++++++
 lib/crypto/tests/sha256_kunit.c               |  39 ++
 lib/crypto/tests/sha384-testvecs.h            | 566 +++++++++++++++
 lib/crypto/tests/sha384_kunit.c               |  48 ++
 lib/crypto/tests/sha512-testvecs.h            | 662 ++++++++++++++++++
 lib/crypto/tests/sha512_kunit.c               |  48 ++
 .../crypto/x86}/sha512-avx-asm.S              |  11 +-
 .../crypto/x86}/sha512-avx2-asm.S             |  11 +-
 .../crypto/x86}/sha512-ssse3-asm.S            |  12 +-
 lib/crypto/x86/sha512.h                       |  54 ++
 scripts/crypto/gen-hash-testvecs.py           |  83 +++
 77 files changed, 4012 insertions(+), 1756 deletions(-)
 delete mode 100644 arch/arm/crypto/sha512-glue.c
 delete mode 100644 arch/arm/crypto/sha512-neon-glue.c
 delete mode 100644 arch/arm/crypto/sha512.h
 delete mode 100644 arch/arm64/crypto/sha512-ce-glue.c
 delete mode 100644 arch/arm64/crypto/sha512-glue.c
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-sha512.c
 rename arch/mips/{cavium-octeon/crypto/octeon-crypto.h => include/asm/octeon/crypto.h} (100%)
 delete mode 100644 arch/riscv/crypto/sha512-riscv64-glue.c
 delete mode 100644 arch/s390/crypto/sha512_s390.c
 delete mode 100644 arch/sparc/crypto/sha512_glue.c
 delete mode 100644 arch/x86/crypto/sha512_ssse3_glue.c
 create mode 100644 crypto/sha512.c
 delete mode 100644 crypto/sha512_generic.c
 delete mode 100644 include/crypto/sha512_base.h
 create mode 100644 lib/crypto/arm/.gitignore
 rename {arch/arm/crypto => lib/crypto/arm}/sha512-armv4.pl (100%)
 create mode 100644 lib/crypto/arm/sha512.h
 create mode 100644 lib/crypto/arm64/.gitignore
 rename {arch/arm64/crypto => lib/crypto/arm64}/sha512-ce-core.S (97%)
 create mode 100644 lib/crypto/arm64/sha512.h
 create mode 100644 lib/crypto/mips/sha512.h
 rename {arch/riscv/crypto => lib/crypto/riscv}/sha512-riscv64-zvknhb-zvkb.S (98%)
 create mode 100644 lib/crypto/riscv/sha512.h
 create mode 100644 lib/crypto/s390/sha512.h
 create mode 100644 lib/crypto/sha512.c
 create mode 100644 lib/crypto/sparc/sha512.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/sha512_asm.S (100%)
 create mode 100644 lib/crypto/tests/Kconfig
 create mode 100644 lib/crypto/tests/Makefile
 create mode 100644 lib/crypto/tests/hash-test-template.h
 create mode 100644 lib/crypto/tests/sha224-testvecs.h
 create mode 100644 lib/crypto/tests/sha224_kunit.c
 create mode 100644 lib/crypto/tests/sha256-testvecs.h
 create mode 100644 lib/crypto/tests/sha256_kunit.c
 create mode 100644 lib/crypto/tests/sha384-testvecs.h
 create mode 100644 lib/crypto/tests/sha384_kunit.c
 create mode 100644 lib/crypto/tests/sha512-testvecs.h
 create mode 100644 lib/crypto/tests/sha512_kunit.c
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-avx-asm.S (97%)
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-avx2-asm.S (98%)
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-ssse3-asm.S (97%)
 create mode 100644 lib/crypto/x86/sha512.h
 create mode 100755 scripts/crypto/gen-hash-testvecs.py


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0


