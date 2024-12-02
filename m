Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2149BD49793
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 01:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JrZ+QUjRT4pqTOQJiT5ETJDWl3aPgmGybRdGwewC27M=; b=X9T0PE09l0ebw0nLxuBFXiYbsJ
	n1QAm4z0Jphdm0eQ3UmwvhpCC7s2OH9Sxy3KlpCUVzEZKeKN8rZ714yOGUmvWU8dNfgppxcc5cYUP
	pSOEHtfdl1qMI7nvBfIHUG3V7apJ3LRCNMPX55VX8H5xEANWHkK4s2mWIVMRy+qNzEy4j+fzSXGT0
	c+tjE9dXg/sDUt9bLHdvyiCFwZMwFbuoQnG3PdAnJdb7gRYUjVtXDuT3lxdOM+lsExypUG0RxRhD9
	dwPrF9P7dom5c1viPKdEJZoHUQUGiH+d1Lsd5K/76/YSyAKtMv5/0kvXZEofLOojQzYudNn/2jrko
	KAeHxdQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvGe-00000004j1K-2vDE;
	Mon, 02 Dec 2024 01:30:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHv7x-00000004hKO-3CGY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 01:21:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 739E2A409EC;
	Mon,  2 Dec 2024 01:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC63C4CECF;
	Mon,  2 Dec 2024 01:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733102488;
	bh=/7wxVzZwNcofbQOcXCfiHDj5ZWUNwfZ+aktniqfssqM=;
	h=From:To:Cc:Subject:Date:From;
	b=nh+Asw+ZZIteP03MdjDFm7cHrGNz+KxSlP178lnD9ZkMBRp6xMjw0ipr1Pou8AZMW
	 TvF2uuyV5O04PS/6BFann3nVTw7pZ7Qnr0FnOUtMT5kKlW3/WO5GPEm9vrKzluPVyS
	 jY5UuixHlURAjORTl39jgQ35uwmYOAdefS0uwcKYI40i9oxfmJL6VKw0dFF50ZwNQO
	 IjEg5EFbuqqen4fqa597LxXrFCmxL7o2429IKxQsmnBRrpHuV9r+VUryFkuq7TOcob
	 fdlTe0gH+XDl8RO0LfEwNQcRLNbilF8fGRwnPXWYn2ng8yi6yJJaImrzdqaQwH0MZM
	 OlfXx067f7ezQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2 00/12] Wire up CRC-T10DIF library functions to arch-optimized code
Date: Sun,  1 Dec 2024 17:20:44 -0800
Message-ID: <20241202012056.209768-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_172129_926667_838AB87A 
X-CRM114-Status: GOOD (  14.68  )
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

This patchset is also available in git via:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-t10dif-lib-v2

This patchset updates the kernel's CRC-T10DIF library functions to be
directly optimized for x86, arm, arm64, and powerpc without taking an
unnecessary and inefficient detour through the crypto API.  It follows
the same approach that I'm taking for CRC32 in the patchset
https://lore.kernel.org/lkml/20241202010844.144356-1-ebiggers@kernel.org/

This patchset also adds a CRC KUnit test suite that covers multiple CRC
variants, and deletes some older ad-hoc tests that are obsoleted by it.

This patchset applies to v6.13-rc1 plus my CRC32 patchset.  It can be
retrieved from git using above command.  This is targeting 6.14.

Changed in v2:
  - Rebased onto v6.13-rc1.
  - Tweaked crc_t10dif_arch() for arm32 and arm64 to not call
    crypto_simd_usable() more times than is necessary.
  - Added patch removing redundant crc16_kunit.c which got added in v6.13-rc1.
  - Made some small tweaks to crc_kunit.c.
  - Listed Ard as a reviewer in the MAINTAINERS entry.
  - Dropped scripts/crc from MAINTAINERS entry, as it hasn't been added yet.
  - Clarified a commit message.
  - Added Reviewed-by and Acked-by's.

Eric Biggers (12):
  lib/crc-t10dif: stop wrapping the crypto API
  lib/crc-t10dif: add support for arch overrides
  crypto: crct10dif - expose arch-optimized lib function
  x86/crc-t10dif: expose CRC-T10DIF function through lib
  arm/crc-t10dif: expose CRC-T10DIF function through lib
  arm64/crc-t10dif: expose CRC-T10DIF function through lib
  powerpc/crc-t10dif: expose CRC-T10DIF function through lib
  lib/crc_kunit.c: add KUnit test suite for CRC library functions
  lib/crc16_kunit: delete obsolete crc16_kunit.c
  lib/crc32test: delete obsolete crc32test.c
  powerpc/crc: delete obsolete crc-vpmsum_test.c
  MAINTAINERS: add entry for CRC library

 MAINTAINERS                                   |  11 +
 arch/arm/Kconfig                              |   1 +
 arch/arm/crypto/Kconfig                       |  11 -
 arch/arm/crypto/Makefile                      |   2 -
 arch/arm/crypto/crct10dif-ce-glue.c           | 124 ---
 arch/arm/lib/Makefile                         |   3 +
 .../crc-t10dif-core.S}                        |   0
 arch/arm/lib/crc-t10dif-glue.c                |  80 ++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  10 -
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/crct10dif-ce-glue.c         | 132 ---
 arch/arm64/lib/Makefile                       |   3 +
 .../crc-t10dif-core.S}                        |   0
 arch/arm64/lib/crc-t10dif-glue.c              |  81 ++
 arch/m68k/configs/amiga_defconfig             |   1 -
 arch/m68k/configs/apollo_defconfig            |   1 -
 arch/m68k/configs/atari_defconfig             |   1 -
 arch/m68k/configs/bvme6000_defconfig          |   1 -
 arch/m68k/configs/hp300_defconfig             |   1 -
 arch/m68k/configs/mac_defconfig               |   1 -
 arch/m68k/configs/multi_defconfig             |   1 -
 arch/m68k/configs/mvme147_defconfig           |   1 -
 arch/m68k/configs/mvme16x_defconfig           |   1 -
 arch/m68k/configs/q40_defconfig               |   1 -
 arch/m68k/configs/sun3_defconfig              |   1 -
 arch/m68k/configs/sun3x_defconfig             |   1 -
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   2 -
 arch/powerpc/crypto/Kconfig                   |  20 -
 arch/powerpc/crypto/Makefile                  |   3 -
 arch/powerpc/crypto/crc-vpmsum_test.c         | 133 ---
 arch/powerpc/lib/Makefile                     |   3 +
 .../crc-t10dif-glue.c}                        |  69 +-
 .../{crypto => lib}/crct10dif-vpmsum_asm.S    |   2 +-
 arch/s390/configs/debug_defconfig             |   1 -
 arch/x86/Kconfig                              |   1 +
 arch/x86/crypto/Kconfig                       |  10 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/crct10dif-pclmul_glue.c       | 143 ---
 arch/x86/lib/Makefile                         |   3 +
 arch/x86/lib/crc-t10dif-glue.c                |  51 ++
 .../{crypto => lib}/crct10dif-pcl-asm_64.S    |   0
 crypto/Kconfig                                |   1 +
 crypto/Makefile                               |   3 +-
 crypto/crct10dif_common.c                     |  82 --
 crypto/crct10dif_generic.c                    |  82 +-
 include/linux/crc-t10dif.h                    |  28 +-
 lib/Kconfig                                   |  43 +-
 lib/Kconfig.debug                             |  29 +-
 lib/Makefile                                  |   3 +-
 lib/crc-t10dif.c                              | 156 +---
 lib/crc16_kunit.c                             | 155 ----
 lib/crc32test.c                               | 852 ------------------
 lib/crc_kunit.c                               | 435 +++++++++
 .../testing/selftests/arm64/fp/kernel-test.c  |   3 +-
 58 files changed, 880 insertions(+), 1913 deletions(-)
 delete mode 100644 arch/arm/crypto/crct10dif-ce-glue.c
 rename arch/arm/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} (100%)
 create mode 100644 arch/arm/lib/crc-t10dif-glue.c
 delete mode 100644 arch/arm64/crypto/crct10dif-ce-glue.c
 rename arch/arm64/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} (100%)
 create mode 100644 arch/arm64/lib/crc-t10dif-glue.c
 delete mode 100644 arch/powerpc/crypto/crc-vpmsum_test.c
 rename arch/powerpc/{crypto/crct10dif-vpmsum_glue.c => lib/crc-t10dif-glue.c} (50%)
 rename arch/powerpc/{crypto => lib}/crct10dif-vpmsum_asm.S (99%)
 delete mode 100644 arch/x86/crypto/crct10dif-pclmul_glue.c
 create mode 100644 arch/x86/lib/crc-t10dif-glue.c
 rename arch/x86/{crypto => lib}/crct10dif-pcl-asm_64.S (100%)
 delete mode 100644 crypto/crct10dif_common.c
 delete mode 100644 lib/crc16_kunit.c
 delete mode 100644 lib/crc32test.c
 create mode 100644 lib/crc_kunit.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
prerequisite-patch-id: f8b995a05288ddc7f06f93d5eb7ffc71f53232d4
prerequisite-patch-id: cda9f22081116d690534a921473af93d06ab7539
prerequisite-patch-id: 12e0b107ed65a4d61fe3c9aa29451b082276f84f
prerequisite-patch-id: 292ec37c4a28e33cce4c13ad75a3ad2104799352
prerequisite-patch-id: b1cf6138d2a225dcda1adedc89d20d36a54bb309
prerequisite-patch-id: 1a7519c0d1fc64926480c8be838a98b5095534ec
prerequisite-patch-id: 0f22f1d50b6c17c93825e4a0651d51f4de9efe47
prerequisite-patch-id: 285ac22e7e2bad4920c3872992aa45e7f04d3702
prerequisite-patch-id: 9b085b26ff8fe55cf7cd343e9123e742f82a1fbb
prerequisite-patch-id: a4e94f9bb7c2c1d4d5486877b660ca6d606a46ef
prerequisite-patch-id: 5d541cd572220aa5c1885a639693fc78210c6112
prerequisite-patch-id: 95195b4e2e9d9e0e7b1cafa37d0cf2b3373f007f
prerequisite-patch-id: da2e5649997b6265ef0e6ad90b8be6a7a1509705
prerequisite-patch-id: e4b967a2d11e31bb8ee1402313bc0c70b34af26b
prerequisite-patch-id: d535ea87c7ac3b194abc358567b97b5fd524c144
prerequisite-patch-id: 1b919d5298106e9014f09f6e9ca5c75cbb157399
prerequisite-patch-id: 19f12966c5081d27bc64bced052814b15f16b087
prerequisite-patch-id: a4251f6e980b8ac54aeb6cfb09f0ffe92396331d
prerequisite-patch-id: 6fad2aeaf54145934d2dfd52bed0464b18445fb5
-- 
2.47.1


