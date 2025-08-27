Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9780CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hwyra7C8FHuLot8oxIXu4t2ORLvQks5XybEyadgNba8=; b=EBe8EKopJtZ3elZ+axoCO5rxks
	OTNyUKoBF/zZ/o2/k81/9QR+Un3lcGpUAEX8CJoSyEyGkSfQlvA897yIhhIpaQ208tftISr5a2kR8
	hvi4FkFv9WtsLULIWY2+lIVXFJL23dGG2lWe8jy6niTZrDViFwIhP5e7SOLjvCPYQywpega+8FaGW
	p5gHMY0ddM7gNrDR+RwyR/xH94n1E2aNQgGom4S4gJkv2+bajJOFYvjmpyTuC+HYwPmy39N/tySFd
	n1AmlBXaIjwAAl6ckRR9KysGYqoe0OoiUHcDh7DdQSo4SkeSWfclXjPao4WdHcPVUqr1zgCPjH15S
	MKR5ikeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJpF-0000000GIUa-1kIo;
	Wed, 27 Aug 2025 17:20:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHrU-0000000Fsf1-34Ql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:14:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A9BD44483;
	Wed, 27 Aug 2025 15:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2828C4CEF6;
	Wed, 27 Aug 2025 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756307696;
	bh=mmDQNPS9N5kMegbUh98Cgx00yLXbX56h4s2EcF4EV4Y=;
	h=From:To:Cc:Subject:Date:From;
	b=iKx/Fpg87a2VhaG0WubP4cHM/IYbhWbeYvhBXzhx9iNXTq5x2TF7WtKoXZ4B/FJ9Y
	 yBJrxXQ8fNz7vSC4mZaHpQLDBbL3A+69b8N4ejyM8SljsYgEicVF4bJKfbuPTm0z+G
	 gZOS9keQyYN/vet5X+P+Sr957ovqgH1OYpGAbtgJhabk9p8M2pIqi/hmk1FszGZwDk
	 BfZh/fj/iDrFIjrAhYGeOopf6ByJrCXAPAKSyoj2bmZxRdCBeJKi2DviJirzgn28Fw
	 BDBQTbcTcC1AAlnhLUNDcYBbikjVYIT70dRSqbRjNWj9znZENaFCJcOXFg+wEGBc5f
	 6ZlCmaoXutUsQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 00/12] ChaCha and BLAKE2s cleanups
Date: Wed, 27 Aug 2025 08:11:19 -0700
Message-ID: <20250827151131.27733-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_081456_816647_E277DCA0 
X-CRM114-Status: GOOD (  15.73  )
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

This series is targeting libcrypto-next.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git chacha-blake2s-v1

This series consolidates how the ChaCha and BLAKE2s code is organized.
This is essentially the same change that I made to the other algorithms,
so this should be fairly boring by now.

These algorithms were the last two users of
lib/crypto/$(SRCARCH)/{Makefile,Kconfig}.  So this series removes all
those files, finishing the transition to the centralized build process
(at least for the algorithms supported by lib/crypto/ so far).

This series also makes the arch-optimized BLAKE2s code start being
enabled by default, again following the pattern of the other algorithms.

Finally, it adds a KUnit test suite for BLAKE2s and deletes the older
blake2s-selftest.

Eric Biggers (12):
  arm: configs: Remove obsolete assignments to CRYPTO_CHACHA20_NEON
  crypto: chacha - register only "-lib" drivers
  lib/crypto: chacha: Remove unused function chacha_is_arch_optimized()
  lib/crypto: chacha: Rename chacha.c to chacha-block-generic.c
  lib/crypto: chacha: Rename libchacha.c to chacha.c
  lib/crypto: chacha: Consolidate into single module
  lib/crypto: x86/blake2s: Reduce size of BLAKE2S_SIGMA2
  lib/crypto: blake2s: Remove obsolete self-test
  lib/crypto: blake2s: Always enable arch-optimized BLAKE2s code
  lib/crypto: blake2s: Move generic code into blake2s.c
  lib/crypto: blake2s: Consolidate into single C translation unit
  lib/crypto: tests: Add KUnit tests for BLAKE2s

 arch/arm/configs/exynos_defconfig             |   1 -
 arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
 arch/arm/configs/multi_v7_defconfig           |   1 -
 arch/arm/configs/omap2plus_defconfig          |   1 -
 crypto/Kconfig                                |   1 -
 crypto/chacha.c                               | 129 +---
 crypto/testmgr.c                              |   9 +-
 include/crypto/chacha.h                       |  37 +-
 include/crypto/internal/blake2s.h             |  21 -
 lib/crypto/Kconfig                            |  74 +-
 lib/crypto/Makefile                           |  57 +-
 lib/crypto/arm/Kconfig                        |  19 -
 lib/crypto/arm/Makefile                       |   8 -
 lib/crypto/arm/blake2s-core.S                 |   5 +-
 lib/crypto/arm/blake2s-glue.c                 |   7 -
 lib/crypto/arm/blake2s.h                      |   5 +
 lib/crypto/arm/{chacha-glue.c => chacha.h}    |  35 +-
 lib/crypto/arm64/Kconfig                      |   8 -
 lib/crypto/arm64/Makefile                     |   4 -
 .../arm64/{chacha-neon-glue.c => chacha.h}    |  32 +-
 lib/crypto/blake2s-generic.c                  | 111 ---
 lib/crypto/blake2s-selftest.c                 | 651 ------------------
 lib/crypto/blake2s.c                          | 105 ++-
 lib/crypto/chacha-block-generic.c             | 114 +++
 lib/crypto/chacha.c                           | 142 ++--
 lib/crypto/libchacha.c                        |  35 -
 lib/crypto/mips/Kconfig                       |   7 -
 lib/crypto/mips/Makefile                      |   5 -
 lib/crypto/mips/chacha-glue.c                 |  29 -
 lib/crypto/mips/chacha.h                      |  14 +
 lib/crypto/powerpc/Kconfig                    |   8 -
 lib/crypto/powerpc/Makefile                   |   4 -
 .../powerpc/{chacha-p10-glue.c => chacha.h}   |  36 +-
 lib/crypto/riscv/Kconfig                      |   8 -
 lib/crypto/riscv/Makefile                     |   4 -
 .../riscv/{chacha-riscv64-glue.c => chacha.h} |  36 +-
 lib/crypto/s390/Kconfig                       |   7 -
 lib/crypto/s390/Makefile                      |   4 -
 lib/crypto/s390/{chacha-glue.c => chacha.h}   |  29 +-
 lib/crypto/tests/Kconfig                      |  10 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/blake2s-testvecs.h           | 238 +++++++
 lib/crypto/tests/blake2s_kunit.c              | 134 ++++
 lib/crypto/x86/Kconfig                        |  20 -
 lib/crypto/x86/Makefile                       |   7 -
 lib/crypto/x86/blake2s-core.S                 |  28 +-
 lib/crypto/x86/{blake2s-glue.c => blake2s.h}  |  16 +-
 lib/crypto/x86/{chacha_glue.c => chacha.h}    |  36 +-
 scripts/crypto/gen-hash-testvecs.py           |  27 +-
 49 files changed, 840 insertions(+), 1481 deletions(-)
 delete mode 100644 include/crypto/internal/blake2s.h
 delete mode 100644 lib/crypto/arm/Kconfig
 delete mode 100644 lib/crypto/arm/Makefile
 delete mode 100644 lib/crypto/arm/blake2s-glue.c
 create mode 100644 lib/crypto/arm/blake2s.h
 rename lib/crypto/arm/{chacha-glue.c => chacha.h} (76%)
 delete mode 100644 lib/crypto/arm64/Kconfig
 delete mode 100644 lib/crypto/arm64/Makefile
 rename lib/crypto/arm64/{chacha-neon-glue.c => chacha.h} (75%)
 delete mode 100644 lib/crypto/blake2s-generic.c
 delete mode 100644 lib/crypto/blake2s-selftest.c
 create mode 100644 lib/crypto/chacha-block-generic.c
 delete mode 100644 lib/crypto/libchacha.c
 delete mode 100644 lib/crypto/mips/Kconfig
 delete mode 100644 lib/crypto/mips/Makefile
 delete mode 100644 lib/crypto/mips/chacha-glue.c
 create mode 100644 lib/crypto/mips/chacha.h
 delete mode 100644 lib/crypto/powerpc/Kconfig
 delete mode 100644 lib/crypto/powerpc/Makefile
 rename lib/crypto/powerpc/{chacha-p10-glue.c => chacha.h} (62%)
 delete mode 100644 lib/crypto/riscv/Kconfig
 delete mode 100644 lib/crypto/riscv/Makefile
 rename lib/crypto/riscv/{chacha-riscv64-glue.c => chacha.h} (57%)
 delete mode 100644 lib/crypto/s390/Kconfig
 delete mode 100644 lib/crypto/s390/Makefile
 rename lib/crypto/s390/{chacha-glue.c => chacha.h} (51%)
 create mode 100644 lib/crypto/tests/blake2s-testvecs.h
 create mode 100644 lib/crypto/tests/blake2s_kunit.c
 delete mode 100644 lib/crypto/x86/Kconfig
 delete mode 100644 lib/crypto/x86/Makefile
 rename lib/crypto/x86/{blake2s-glue.c => blake2s.h} (83%)
 rename lib/crypto/x86/{chacha_glue.c => chacha.h} (85%)


base-commit: 44781c45f26623c3b92b28e933bf349144c10fe6
-- 
2.50.1


