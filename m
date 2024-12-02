Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35CAD49793
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 01:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2ZEMphrvX9u5+tORLMJ6dI6Tur5EcaVgc4WTm9EFJo0=; b=nyMc54NvDOEPIKy3UMOJWnclsd
	CXcNCYTfhQS9Q3R/CicfCVBWMsjv4wuPwu4AgsEBqkuteaZMl/ECxFlIqk+Nc9ssus7ADNLi38bvQ
	qnhCa+xTjcNDNgK2ylizmbE900RrBpf9ImXIcs1v3ccqXRio9rkPU1K6sA0c19GVxiiSTD8HILUZ5
	AL03pIhqcnOMf73nynahNzEL39ri5e1ut3TuTYf2jXhr8S1YjyCoN9pUfZfbJ07MuTluvqLUU1OKk
	kLMNAZx7oJt9NLqYZntYbKxmJy3aUc38RD49kIQuJsSSNTjiZEKZSGnRu8anuvjEVvZ4C4IplU9Ob
	yY1NcJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHuyO-00000004erS-1Xd4;
	Mon, 02 Dec 2024 01:11:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHuwN-00000004dc6-2yva;
	Mon, 02 Dec 2024 01:09:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83A85A4014C;
	Mon,  2 Dec 2024 01:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA984C4CECF;
	Mon,  2 Dec 2024 01:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101769;
	bh=12FcUtzxv5+whb5AQMtarw/zUncx3kLD/s7M8+WySlU=;
	h=From:To:Cc:Subject:Date:From;
	b=kagcWz/xzzlX/ayo79ogwuKKR7S86e7FtER7xpn/1bqLLV/ldaW4GY2LRRrSjTYjF
	 lk413CBdu4OdDDYqIHmkGrV1ltsl6w2KyMccUtpiEvmPNFhcdELStrOTuskQTakw3u
	 fAOkyrfWGIX9v81yjQgmy6EKlh0fWwHquvq2PYxE97o/gNG3BVhZioVGxJgMDpfAt+
	 RmqhlKfzWf6e4yBMNRec599PXv+LKbN/vZmIp07Yu/Pa10ydeRbIck/TtwaZgRwgFQ
	 YFMXzkOvuNV6Ly6p0VesFm4+r9lMPK3xbQJoo2ylT+uhm9H+C7+VoCm5GsXOd8N0G0
	 XBKmD3iqcF35w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v4 00/19] Wire up CRC32 library functions to arch-optimized code
Date: Sun,  1 Dec 2024 17:08:25 -0800
Message-ID: <20241202010844.144356-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_170931_910024_1D368470 
X-CRM114-Status: GOOD (  26.39  )
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

This patchset applies to v6.13-rc1 and is also available in git via:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v4

CRC32 is a family of common non-cryptographic integrity check algorithms
that are fairly fast with a portable C implementation and become far
faster still with the CRC32 or carryless multiplication instructions
that most CPUs have.  9 architectures already have optimized code for at
least some CRC32 variants; however, except for arm64 this optimized code
was only accessible through the crypto API, not the library functions.

This patchset fixes that so that the CRC32 library functions use the
optimized code.  This allows users to just use the library instead of
the crypto API.  This is much simpler and also improves performance due
to eliminating the crypto API overhead including an indirect call.  Some
examples of updating users are included at the end of the patchset.

Note: crc32c() was a weird case.  It was a library function layered on
top of the crypto API, which in turn is layered on top of the real
library functions.  So while it was easy to use, it was still subject to
the crypto API overhead.  This patchset provides CRC32C acceleration in
the real library functions directly.

The updated CRC32 library design is:

- Each arch's CRC32 code (all variants) is in arch/$ARCH/lib/crc32*.
  This adopts what arm64 and riscv already did.  Note, the crypto
  directory is not used because CRC32 is not a cryptographic algorithm.

- Weak symbols are no longer used.  Instead there are crc32*_base() and
  crc32*_arch(), and the appropriate ones are called based on the
  kconfig.  This is similar to how the ChaCha20 library code works.

- Each arch's CRC32 library code is enabled by default when CRC32 is
  enabled, but it can now be disabled, controlled by the choice that
  previously controlled the base implementation only.  It can also now
  be built as a module if CRC32 is a module too, in which case it will
  be automatically loaded via direct symbol dependency when appropriate.

- Instead of lots of pointless glue code that wires up each CRC32
  variant to the crypto API for each architecture, we now just rely on
  the existing shash algorithms that use the library functions.

- As before, the library functions don't provide access to off-CPU
  crypto accelerators.  But these appear to have very little, if any,
  real-world relevance for CRC32 which is very fast on CPUs.

A separate patchset applies a similar cleanup to CRC-T10DIF.

Changed in v4:
  - Rebased onto v6.13-rc1.
  - Removed no-longer-needed CFI stubs from arch/arm/lib/crc32-core.S.
  - Removed no-longer-needed definition of JBD_MAX_CHECKSUM_SIZE from jbd2.h.
  - Removed no-longer-needed inclusion of <crypto/hash.h> from f2fs.h.
  - Merged 'if' statements with the same condition in jbd2_journal_set_features.
  - Added bcachefs dependency patch, as it wasn't merged in 6.13 as expected.
  - Reordered CPU feature checks to before crypto_simd_usable(), so that
    crypto_simd_usable() doesn't get called unnecessarily.
  - For loongarch, use cpu_has_crc32() instead of cpu_has(CPU_FEATURE_CRC32),
    for consistency with the rest of the loongarch code.
  - Correctly set the new dependencies of CRYPTO_VPMSUM_TESTER.
  - Added Reviewed-by's and Acked-by's.

Changed in v3:
  - Replaced crc32_optimizations global variable with
    crc32_optimizations() function.
  - Make ISCSI_TARGET keep selecting CRYPTO_HASH, since
    iscsi_target_auth.c still uses the shash API for other algorithms.

Changed in v2:
  - Added a way to determine if the arch-optimized code is actually
    being used at runtime, and used this to register the appropriate
    shash algorithms with crypto API.
  - Added a patch that converts iSCSI to use the library.
  - Listed a bcachefs patch as a dependency.
  - Added Ard's Reviewed-by.

Eric Biggers (19):
  lib/crc32: drop leading underscores from __crc32c_le_base
  lib/crc32: improve support for arch-specific overrides
  lib/crc32: expose whether the lib is really optimized at runtime
  crypto: crc32 - don't unnecessarily register arch algorithms
  arm/crc32: expose CRC32 functions through lib
  loongarch/crc32: expose CRC32 functions through lib
  mips/crc32: expose CRC32 functions through lib
  powerpc/crc32: expose CRC32 functions through lib
  s390/crc32: expose CRC32 functions through lib
  sparc/crc32: expose CRC32 functions through lib
  x86/crc32: update prototype for crc_pcl()
  x86/crc32: update prototype for crc32_pclmul_le_16()
  x86/crc32: expose CRC32 functions through lib
  bcachefs: Explicitly select CRYPTO from BCACHEFS_FS
  lib/crc32: make crc32c() go directly to lib
  ext4: switch to using the crc32c library
  jbd2: switch to using the crc32c library
  f2fs: switch to using the crc32 library
  scsi: target: iscsi: switch to using the crc32c library

 arch/arm/Kconfig                              |   1 +
 arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
 arch/arm/configs/multi_v7_defconfig           |   1 -
 arch/arm/crypto/Kconfig                       |  14 -
 arch/arm/crypto/Makefile                      |   2 -
 arch/arm/crypto/crc32-ce-glue.c               | 247 ------------
 arch/arm/lib/Makefile                         |   3 +
 .../crc32-ce-core.S => lib/crc32-core.S}      |   5 +-
 arch/arm/lib/crc32-glue.c                     | 123 ++++++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/lib/Makefile                       |   3 +-
 arch/arm64/lib/crc32-glue.c                   |  25 +-
 arch/loongarch/Kconfig                        |   1 +
 arch/loongarch/configs/loongson3_defconfig    |   1 -
 arch/loongarch/crypto/Kconfig                 |   9 -
 arch/loongarch/crypto/Makefile                |   2 -
 arch/loongarch/crypto/crc32-loongarch.c       | 300 ---------------
 arch/loongarch/lib/Makefile                   |   2 +
 arch/loongarch/lib/crc32-loongarch.c          | 135 +++++++
 arch/mips/Kconfig                             |   5 +-
 arch/mips/configs/eyeq5_defconfig             |   1 -
 arch/mips/configs/eyeq6_defconfig             |   1 -
 arch/mips/configs/generic/32r6.config         |   2 -
 arch/mips/configs/generic/64r6.config         |   1 -
 arch/mips/crypto/Kconfig                      |   9 -
 arch/mips/crypto/Makefile                     |   2 -
 arch/mips/crypto/crc32-mips.c                 | 354 ------------------
 arch/mips/lib/Makefile                        |   2 +
 arch/mips/lib/crc32-mips.c                    | 192 ++++++++++
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |  15 +-
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/crc32c-vpmsum_glue.c      | 173 ---------
 arch/powerpc/crypto/crct10dif-vpmsum_asm.S    |   2 +-
 arch/powerpc/lib/Makefile                     |   3 +
 arch/powerpc/lib/crc32-glue.c                 |  92 +++++
 .../{crypto => lib}/crc32-vpmsum_core.S       |   0
 .../{crypto => lib}/crc32c-vpmsum_asm.S       |   0
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/lib/Makefile                       |   3 +-
 arch/riscv/lib/{crc32.c => crc32-riscv.c}     |  25 +-
 arch/s390/Kconfig                             |   1 +
 arch/s390/configs/debug_defconfig             |   1 -
 arch/s390/configs/defconfig                   |   1 -
 arch/s390/crypto/Kconfig                      |  12 -
 arch/s390/crypto/Makefile                     |   2 -
 arch/s390/crypto/crc32-vx.c                   | 306 ---------------
 arch/s390/lib/Makefile                        |   3 +
 arch/s390/lib/crc32-glue.c                    |  92 +++++
 arch/s390/{crypto => lib}/crc32-vx.h          |   0
 arch/s390/{crypto => lib}/crc32be-vx.c        |   0
 arch/s390/{crypto => lib}/crc32le-vx.c        |   0
 arch/sparc/Kconfig                            |   1 +
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   4 -
 arch/sparc/crypto/crc32c_glue.c               | 184 ---------
 arch/sparc/lib/Makefile                       |   2 +
 arch/sparc/lib/crc32_glue.c                   |  93 +++++
 arch/sparc/{crypto => lib}/crc32c_asm.S       |   2 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/crypto/Kconfig                       |  22 --
 arch/x86/crypto/Makefile                      |   7 -
 arch/x86/crypto/crc32-pclmul_glue.c           | 202 ----------
 arch/x86/crypto/crc32c-intel_glue.c           | 250 -------------
 arch/x86/lib/Makefile                         |   4 +
 arch/x86/lib/crc32-glue.c                     | 124 ++++++
 .../crc32-pclmul_asm.S => lib/crc32-pclmul.S} |  19 +-
 .../crc32c-3way.S}                            |  63 ++--
 crypto/crc32_generic.c                        |   8 +-
 crypto/crc32c_generic.c                       |  12 +-
 drivers/target/iscsi/Kconfig                  |   4 +-
 drivers/target/iscsi/iscsi_target.c           | 153 +++-----
 drivers/target/iscsi/iscsi_target_login.c     |  50 ---
 drivers/target/iscsi/iscsi_target_login.h     |   1 -
 drivers/target/iscsi/iscsi_target_nego.c      |  21 +-
 fs/bcachefs/Kconfig                           |   1 +
 fs/ext4/Kconfig                               |   3 +-
 fs/ext4/ext4.h                                |  25 +-
 fs/ext4/super.c                               |  15 -
 fs/f2fs/Kconfig                               |   3 +-
 fs/f2fs/f2fs.h                                |  20 +-
 fs/f2fs/super.c                               |  15 -
 fs/jbd2/Kconfig                               |   2 -
 fs/jbd2/journal.c                             |  30 +-
 include/linux/crc32.h                         |  50 ++-
 include/linux/crc32c.h                        |   7 +-
 include/linux/jbd2.h                          |  33 +-
 include/target/iscsi/iscsi_target_core.h      |   3 -
 lib/Kconfig                                   |  80 ++--
 lib/Makefile                                  |   1 -
 lib/crc32.c                                   |  24 +-
 lib/libcrc32c.c                               |  74 ----
 94 files changed, 1159 insertions(+), 2646 deletions(-)
 delete mode 100644 arch/arm/crypto/crc32-ce-glue.c
 rename arch/arm/{crypto/crc32-ce-core.S => lib/crc32-core.S} (98%)
 create mode 100644 arch/arm/lib/crc32-glue.c
 delete mode 100644 arch/loongarch/crypto/crc32-loongarch.c
 create mode 100644 arch/loongarch/lib/crc32-loongarch.c
 delete mode 100644 arch/mips/crypto/crc32-mips.c
 create mode 100644 arch/mips/lib/crc32-mips.c
 delete mode 100644 arch/powerpc/crypto/crc32c-vpmsum_glue.c
 create mode 100644 arch/powerpc/lib/crc32-glue.c
 rename arch/powerpc/{crypto => lib}/crc32-vpmsum_core.S (100%)
 rename arch/powerpc/{crypto => lib}/crc32c-vpmsum_asm.S (100%)
 rename arch/riscv/lib/{crc32.c => crc32-riscv.c} (91%)
 delete mode 100644 arch/s390/crypto/crc32-vx.c
 create mode 100644 arch/s390/lib/crc32-glue.c
 rename arch/s390/{crypto => lib}/crc32-vx.h (100%)
 rename arch/s390/{crypto => lib}/crc32be-vx.c (100%)
 rename arch/s390/{crypto => lib}/crc32le-vx.c (100%)
 delete mode 100644 arch/sparc/crypto/crc32c_glue.c
 create mode 100644 arch/sparc/lib/crc32_glue.c
 rename arch/sparc/{crypto => lib}/crc32c_asm.S (92%)
 delete mode 100644 arch/x86/crypto/crc32-pclmul_glue.c
 delete mode 100644 arch/x86/crypto/crc32c-intel_glue.c
 create mode 100644 arch/x86/lib/crc32-glue.c
 rename arch/x86/{crypto/crc32-pclmul_asm.S => lib/crc32-pclmul.S} (95%)
 rename arch/x86/{crypto/crc32c-pcl-intel-asm_64.S => lib/crc32c-3way.S} (92%)
 delete mode 100644 lib/libcrc32c.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1


