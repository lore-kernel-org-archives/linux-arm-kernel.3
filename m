Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167D2C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 20:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y72pwdJdv83NwOCELFCdobxpoVbiAdDTcG/DefDDSwU=; b=UvsJFpwuENDfFOiV3y2d3S/79q
	zlcIdPVUcRX3rlF8+/xbbDtXY/dNROBzxwHpNlYP41cwkxNMvSgBR9qxrUaHOo4b7OvvUQ9toox3Z
	x1GYuNHNnaU1OagljGWQwQPmBXoWn5KUofvWVqzhd1ORdTUfV3u/knLbh4LwtmxpZqFQQxhQK++an
	KF4yhxjsfy9PV8qy3AaN4WU+QgzNMHCjVXJS+E2DDdkhitNrUUEmtY073r1JJwBAgi6HI3DnNgKMh
	ZYKowaVvGKwYDtqRW+xQRv3HhiQeaWrtJuUmxZ+Bd+YAJL+fuTJVNQC8YU2NO7XJxpnrrBkJDDv6J
	zkLcW8fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzrP-000000022GE-1kPW;
	Sat, 07 Jun 2025 20:09:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNzpC-000000021UW-2MAP;
	Sat, 07 Jun 2025 20:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B802961154;
	Sat,  7 Jun 2025 20:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED56C4CEE4;
	Sat,  7 Jun 2025 20:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749326848;
	bh=8ysByzQduGckfXH5YPNhqS7N079XpguFcwm0rjzocS8=;
	h=From:To:Cc:Subject:Date:From;
	b=gRoV1HUb3mHoY0NTYNASmp068PIC0+XHH58cJ1J/iml3lxpURVeKEZfPdxsgVO5/E
	 TK3DERbIu0ad4NpJR3YGEuSRMtm8k0KjsQ/e1B6ndkfW21OCXr4gvOkwsYwPuN7LH/
	 4julzDjZZsQKV+2RON+e5sGErNlrupPxAURkSYaOM2C+BkrgAr2ludEhiDvmARNi+k
	 OIE8uM5VlwuktsCf7eeazyazLOd7RJ842W1OKAjSs1loeQcPjLgsXntgyAhj96Wgjf
	 gAb3yMih0ZFeI3XRHtMjOILX48N06wdtI+yfb6G24YVDu7SeDfBtRilpxHm1LhCGKV
	 HbiZlzB1oy8aA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is integrated
Date: Sat,  7 Jun 2025 13:04:42 -0700
Message-ID: <20250607200454.73587-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
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

This series is also available at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git lib-crc-arch-v2

This series improves how lib/crc supports arch-optimized code.  First,
instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
functions (e.g. crc32c_base()) will now be part of a single module for
each CRC type, allowing better inlining and dead code elimination.  The
second change is made possible by the first.

As an example, consider CONFIG_CRC32=m on x86.  We'll now have just
crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
were already coupled together and always both got loaded together via
direct symbol dependency, so the separation provided no benefit.

Note: later I'd like to apply the same design to lib/crypto/ too, where
often the API functions are out-of-line so this will work even better.
In those cases, for each algorithm we currently have 3 modules all
coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
sha256-x86.ko.  We should have just one, inline things properly, and
rely on the compiler's dead code elimination to decide the inclusion of
the generic code instead of manually setting it via kconfig.

Having arch-specific code outside arch/ was somewhat controversial when
Zinc proposed it back in 2018.  But I don't think the concerns are
warranted.  It's better from a technical perspective, as it enables the
improvements mentioned above.  This model is already successfully used
in other places in the kernel such as lib/raid6/.  The community of each
architecture still remains free to work on the code, even if it's not in
arch/.  At the time there was also a desire to put the library code in
the same files as the old-school crypto API, but that was a mistake; now
that the library is separate, that's no longer a constraint either.

Changed in v2:
   - Fixed build warning on architectures without any optimized CRC code
   - Fixed build warning in sparc/crc32.h by removing pr_fmt
   - Moved fallback definitions of crc32*_arch back into arch files
   - Remove ARCH_HAS_CRC* symbols at end of series instead of beginning,
     so that they're not removed until they're no longer being selected
   - Slightly improved some commit messages
   - Rebased onto other pending lib/crc changes

Eric Biggers (12):
  lib/crc: move files into lib/crc/
  lib/crc: prepare for arch-optimized code in subdirs of lib/crc/
  lib/crc/arm: migrate arm-optimized CRC code into lib/crc/
  lib/crc/arm64: migrate arm64-optimized CRC code into lib/crc/
  lib/crc/loongarch: migrate loongarch-optimized CRC code into lib/crc/
  lib/crc/mips: migrate mips-optimized CRC code into lib/crc/
  lib/crc/powerpc: migrate powerpc-optimized CRC code into lib/crc/
  lib/crc/riscv: migrate riscv-optimized CRC code into lib/crc/
  lib/crc/s390: migrate s390-optimized CRC code into lib/crc/
  lib/crc/sparc: migrate sparc-optimized CRC code into lib/crc/
  lib/crc/x86: migrate x86-optimized CRC code into lib/crc/
  lib/crc: remove ARCH_HAS_* kconfig symbols

 Documentation/core-api/kernel-api.rst         |  14 +--
 MAINTAINERS                                   |   4 +-
 arch/arm/Kconfig                              |   2 -
 arch/arm/lib/Makefile                         |   6 -
 arch/arm64/Kconfig                            |   2 -
 arch/arm64/lib/Makefile                       |   6 -
 arch/loongarch/Kconfig                        |   1 -
 arch/loongarch/lib/Makefile                   |   2 -
 arch/mips/Kconfig                             |   1 -
 arch/mips/lib/Makefile                        |   2 -
 arch/powerpc/Kconfig                          |   2 -
 arch/powerpc/lib/Makefile                     |   6 -
 arch/riscv/Kconfig                            |   3 -
 arch/riscv/lib/Makefile                       |   6 -
 arch/s390/Kconfig                             |   1 -
 arch/s390/lib/Makefile                        |   3 -
 arch/sparc/Kconfig                            |   1 -
 arch/sparc/lib/Makefile                       |   2 -
 arch/x86/Kconfig                              |   3 -
 arch/x86/lib/Makefile                         |  10 --
 include/linux/crc-t10dif.h                    |  10 +-
 include/linux/crc32.h                         |  30 +----
 include/linux/crc64.h                         |  22 +---
 lib/Kconfig                                   |  87 +------------
 lib/Kconfig.debug                             |  21 ----
 lib/Makefile                                  |  32 +----
 lib/crc/.gitignore                            |   5 +
 lib/crc/Kconfig                               | 118 ++++++++++++++++++
 lib/crc/Makefile                              |  63 ++++++++++
 .../arm/lib => lib/crc/arm}/crc-t10dif-core.S |   0
 .../crc-t10dif.c => lib/crc/arm/crc-t10dif.h  |  23 +---
 {arch/arm/lib => lib/crc/arm}/crc32-core.S    |   0
 arch/arm/lib/crc32.c => lib/crc/arm/crc32.h   |  38 ++----
 .../lib => lib/crc/arm64}/crc-t10dif-core.S   |   0
 .../crc/arm64/crc-t10dif.h                    |  22 +---
 .../arm64/lib => lib/crc/arm64}/crc32-core.S  |   0
 .../lib/crc32.c => lib/crc/arm64/crc32.h      |  19 +--
 lib/{ => crc}/crc-ccitt.c                     |   3 -
 lib/{ => crc}/crc-itu-t.c                     |   0
 lib/{crc-t10dif.c => crc/crc-t10dif-main.c}   |  37 ++++--
 lib/{ => crc}/crc16.c                         |   0
 lib/{crc32.c => crc/crc32-main.c}             |  69 ++++++++--
 lib/{ => crc}/crc4.c                          |   0
 lib/{crc64.c => crc/crc64-main.c}             |  47 +++++--
 lib/{ => crc}/crc7.c                          |   0
 lib/{ => crc}/crc8.c                          |   0
 lib/{ => crc}/gen_crc32table.c                |   4 +-
 lib/{ => crc}/gen_crc64table.c                |  11 +-
 .../crc/loongarch/crc32.h                     |  32 +----
 .../lib/crc32-mips.c => lib/crc/mips/crc32.h  |  33 +----
 .../crc/powerpc/crc-t10dif.h                  |  20 +--
 .../crc/powerpc}/crc-vpmsum-template.S        |   0
 .../lib/crc32.c => lib/crc/powerpc/crc32.h    |  38 ++----
 .../crc/powerpc}/crc32c-vpmsum_asm.S          |   0
 .../crc/powerpc}/crct10dif-vpmsum_asm.S       |   0
 .../lib => lib/crc/riscv}/crc-clmul-consts.h  |   0
 .../crc/riscv}/crc-clmul-template.h           |   0
 {arch/riscv/lib => lib/crc/riscv}/crc-clmul.h |   0
 .../crc/riscv/crc-t10dif.h                    |   8 +-
 {arch/riscv/lib => lib/crc/riscv}/crc16_msb.c |   0
 .../lib/crc32.c => lib/crc/riscv/crc32.h      |  17 +--
 {arch/riscv/lib => lib/crc/riscv}/crc32_lsb.c |   0
 {arch/riscv/lib => lib/crc/riscv}/crc32_msb.c |   0
 .../lib/crc64.c => lib/crc/riscv/crc64.h      |  11 +-
 {arch/riscv/lib => lib/crc/riscv}/crc64_lsb.c |   0
 {arch/riscv/lib => lib/crc/riscv}/crc64_msb.c |   0
 {arch/s390/lib => lib/crc/s390}/crc32-vx.h    |   0
 arch/s390/lib/crc32.c => lib/crc/s390/crc32.h |  16 +--
 {arch/s390/lib => lib/crc/s390}/crc32be-vx.c  |   0
 {arch/s390/lib => lib/crc/s390}/crc32le-vx.c  |   0
 .../lib/crc32.c => lib/crc/sparc/crc32.h      |  42 ++-----
 .../sparc/lib => lib/crc/sparc}/crc32c_asm.S  |   0
 lib/crc/tests/Makefile                        |   2 +
 lib/{ => crc}/tests/crc_kunit.c               |   0
 .../lib => lib/crc/x86}/crc-pclmul-consts.h   |   0
 .../lib => lib/crc/x86}/crc-pclmul-template.S |   0
 .../lib => lib/crc/x86}/crc-pclmul-template.h |   0
 .../crc-t10dif.c => lib/crc/x86/crc-t10dif.h  |  18 +--
 .../lib => lib/crc/x86}/crc16-msb-pclmul.S    |   0
 {arch/x86/lib => lib/crc/x86}/crc32-pclmul.S  |   0
 arch/x86/lib/crc32.c => lib/crc/x86/crc32.h   |  30 +----
 {arch/x86/lib => lib/crc/x86}/crc32c-3way.S   |   0
 {arch/x86/lib => lib/crc/x86}/crc64-pclmul.S  |   0
 arch/x86/lib/crc64.c => lib/crc/x86/crc64.h   |  21 +---
 lib/tests/Makefile                            |   1 -
 85 files changed, 406 insertions(+), 621 deletions(-)
 create mode 100644 lib/crc/.gitignore
 create mode 100644 lib/crc/Kconfig
 create mode 100644 lib/crc/Makefile
 rename {arch/arm/lib => lib/crc/arm}/crc-t10dif-core.S (100%)
 rename arch/arm/lib/crc-t10dif.c => lib/crc/arm/crc-t10dif.h (70%)
 rename {arch/arm/lib => lib/crc/arm}/crc32-core.S (100%)
 rename arch/arm/lib/crc32.c => lib/crc/arm/crc32.h (69%)
 rename {arch/arm64/lib => lib/crc/arm64}/crc-t10dif-core.S (100%)
 rename arch/arm64/lib/crc-t10dif.c => lib/crc/arm64/crc-t10dif.h (70%)
 rename {arch/arm64/lib => lib/crc/arm64}/crc32-core.S (100%)
 rename arch/arm64/lib/crc32.c => lib/crc/arm64/crc32.h (81%)
 rename lib/{ => crc}/crc-ccitt.c (98%)
 rename lib/{ => crc}/crc-itu-t.c (100%)
 rename lib/{crc-t10dif.c => crc/crc-t10dif-main.c} (78%)
 rename lib/{ => crc}/crc16.c (100%)
 rename lib/{crc32.c => crc/crc32-main.c} (58%)
 rename lib/{ => crc}/crc4.c (100%)
 rename lib/{crc64.c => crc/crc64-main.c} (66%)
 rename lib/{ => crc}/crc7.c (100%)
 rename lib/{ => crc}/crc8.c (100%)
 rename lib/{ => crc}/gen_crc32table.c (95%)
 rename lib/{ => crc}/gen_crc64table.c (81%)
 rename arch/loongarch/lib/crc32-loongarch.c => lib/crc/loongarch/crc32.h (71%)
 rename arch/mips/lib/crc32-mips.c => lib/crc/mips/crc32.h (82%)
 rename arch/powerpc/lib/crc-t10dif.c => lib/crc/powerpc/crc-t10dif.h (75%)
 rename {arch/powerpc/lib => lib/crc/powerpc}/crc-vpmsum-template.S (100%)
 rename arch/powerpc/lib/crc32.c => lib/crc/powerpc/crc32.h (64%)
 rename {arch/powerpc/lib => lib/crc/powerpc}/crc32c-vpmsum_asm.S (100%)
 rename {arch/powerpc/lib => lib/crc/powerpc}/crct10dif-vpmsum_asm.S (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul-consts.h (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul-template.h (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc-clmul.h (100%)
 rename arch/riscv/lib/crc-t10dif.c => lib/crc/riscv/crc-t10dif.h (62%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc16_msb.c (100%)
 rename arch/riscv/lib/crc32.c => lib/crc/riscv/crc32.h (66%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc32_lsb.c (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc32_msb.c (100%)
 rename arch/riscv/lib/crc64.c => lib/crc/riscv/crc64.h (65%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc64_lsb.c (100%)
 rename {arch/riscv/lib => lib/crc/riscv}/crc64_msb.c (100%)
 rename {arch/s390/lib => lib/crc/s390}/crc32-vx.h (100%)
 rename arch/s390/lib/crc32.c => lib/crc/s390/crc32.h (81%)
 rename {arch/s390/lib => lib/crc/s390}/crc32be-vx.c (100%)
 rename {arch/s390/lib => lib/crc/s390}/crc32le-vx.c (100%)
 rename arch/sparc/lib/crc32.c => lib/crc/sparc/crc32.h (60%)
 rename {arch/sparc/lib => lib/crc/sparc}/crc32c_asm.S (100%)
 create mode 100644 lib/crc/tests/Makefile
 rename lib/{ => crc}/tests/crc_kunit.c (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-consts.h (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.S (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc-pclmul-template.h (100%)
 rename arch/x86/lib/crc-t10dif.c => lib/crc/x86/crc-t10dif.h (56%)
 rename {arch/x86/lib => lib/crc/x86}/crc16-msb-pclmul.S (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc32-pclmul.S (100%)
 rename arch/x86/lib/crc32.c => lib/crc/x86/crc32.h (76%)
 rename {arch/x86/lib => lib/crc/x86}/crc32c-3way.S (100%)
 rename {arch/x86/lib => lib/crc/x86}/crc64-pclmul.S (100%)
 rename arch/x86/lib/crc64.c => lib/crc/x86/crc64.h (61%)


base-commit: 464e77d8417003dfa3b0f556eba0297169483249
-- 
2.49.0


