Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE2FCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 21:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tzKuzsdhMKA/kd854LR6kFwx0tzwqw3fTchyWIzO++w=; b=CtOsmJTRExq41AwsFk4sEaH8lH
	ep5libftfdbLUVLcBbj3xVgWIqThFnrSavJP6IW4+F3qJzdM95z7x6Z7+2QNMiX8Q7F36cveSkixv
	h0asQePTOKeCjrKBzgqznBoZVRJuN5qrAVvKtpmg8KJOrKTzREMnu4MWZUWguHvnvtR5Ufh0GXxm0
	VkWhTApda7rhl485P5PJFksCdhuudpkzx4BIE2aD1FEP2w4MFTrZINCjSjBKska5PxCDlvwtMPUWA
	cma1SNxBxkP1VOhxdW6o14VK2Wtsl3Bq26/YfuJvkvE17EOQLzqKlH56ERKDI5cI0I1ikmoq8XBLF
	es1iNl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0dp-00000008W7C-0xtR;
	Sat, 06 Sep 2025 21:40:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0af-00000008V4E-11vy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 666B0436AD;
	Sat,  6 Sep 2025 21:36:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763D5C4CEE7;
	Sat,  6 Sep 2025 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194616;
	bh=IesAjkCYOGpflP2789SjEF/QyWGCcvo1W1xkNCqpIB4=;
	h=From:To:Cc:Subject:Date:From;
	b=C0gaTjHYH0JBqqIGhTuB0tR5U5fZpfgEQeXd0gD9RnbIC89y7hF85+QF9EWH5PphP
	 nVrC2w0jeMdNVHq5OqCCHlgYFUk3fHP1vQvqjoVXhJTjabgBMVPQEpQBZnLrHLG2Nj
	 pkGB0piOP1wo7OBhrrFQfA2FotmlCNQkuYb9SwvYeJRM72w4E0anatDeebM+Uw2T7q
	 Wvqf0F7vw/JPHgNnGjaB4BoWOxsLu+U1d/YyeF7QJ5BZ+KMpohdgdjzFyyJ8abvuo2
	 opDCZACNXQ2+PGZ8K9pJmstb9/sDkgRdOUxClGdg+tLpmRNUWt5hU/We/3YecB0jYB
	 QafJKoBplsIzA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 00/12] Curve25519 cleanup
Date: Sat,  6 Sep 2025 14:35:11 -0700
Message-ID: <20250906213523.84915-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_143657_330256_7F193233 
X-CRM114-Status: GOOD (  11.32  )
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git curve25519-v2

This series removes the unused crypto_kpp support for Curve25519,
migrates curve25519-selftest to a KUnit test suite, and reorganizes the
generic and arch-optimized Curve25519 code to all be located in
lib/crypto/ and built into a single libcurve25519 module.

Changed from v1:
- Split kpp removal into multiple patches
- Don't select CRYPTO_LIB_CURVE25519_GENERIC from KUnit test
- Removed unnecessary parameter from hpre_ecc_clear_ctx()
- Removed unnecessary 'return' from arm curve25519_base_arch()
- Updated file comment in lib/crypto/curve25519.c
- Made kconfig help text for KUnit test more consistent with other tests
- Used initializer in test_curve25519()
- Removed unnecessary newlines from messages in test_curve25519()
- Use NSEC_PER_SEC instead of literal 1000000000
- Added an Acked-by

Eric Biggers (12):
  crypto: hisilicon/hpre - Remove unused curve25519 kpp support
  crypto: arm/curve25519 - Remove unused kpp support
  crypto: powerpc/curve25519 - Remove unused kpp support
  crypto: x86/curve25519 - Remove unused kpp support
  crypto: testmgr - Remove curve25519 kpp tests
  crypto: curve25519 - Remove unused kpp support
  lib/crypto: tests: Migrate Curve25519 self-test to KUnit
  lib/crypto: tests: Add Curve25519 benchmark
  lib/crypto: curve25519: Move a couple functions out-of-line
  lib/crypto: curve25519: Consolidate into single module
  lib/crypto: tests: Enable Curve25519 test when CRYPTO_SELFTESTS
  wireguard: kconfig: Simplify crypto kconfig selections

 arch/arm/crypto/Kconfig                       |   13 -
 arch/arm/crypto/Makefile                      |    2 -
 arch/arm/crypto/curve25519-glue.c             |  137 --
 arch/m68k/configs/amiga_defconfig             |    1 -
 arch/m68k/configs/apollo_defconfig            |    1 -
 arch/m68k/configs/atari_defconfig             |    1 -
 arch/m68k/configs/bvme6000_defconfig          |    1 -
 arch/m68k/configs/hp300_defconfig             |    1 -
 arch/m68k/configs/mac_defconfig               |    1 -
 arch/m68k/configs/multi_defconfig             |    1 -
 arch/m68k/configs/mvme147_defconfig           |    1 -
 arch/m68k/configs/mvme16x_defconfig           |    1 -
 arch/m68k/configs/q40_defconfig               |    1 -
 arch/m68k/configs/sun3_defconfig              |    1 -
 arch/m68k/configs/sun3x_defconfig             |    1 -
 arch/powerpc/crypto/Kconfig                   |   13 -
 arch/powerpc/crypto/Makefile                  |    2 -
 arch/s390/configs/debug_defconfig             |    1 -
 arch/s390/configs/defconfig                   |    1 -
 arch/x86/crypto/Kconfig                       |   13 -
 arch/x86/crypto/Makefile                      |    5 -
 crypto/Kconfig                                |    8 -
 crypto/Makefile                               |    1 -
 crypto/curve25519-generic.c                   |   91 --
 crypto/testmgr.c                              |    6 -
 crypto/testmgr.h                              | 1225 -----------------
 drivers/crypto/hisilicon/Kconfig              |    1 -
 drivers/crypto/hisilicon/hpre/hpre_crypto.c   |  403 +-----
 drivers/net/Kconfig                           |   15 +-
 include/crypto/curve25519.h                   |   40 +-
 lib/crypto/Kconfig                            |   37 +-
 lib/crypto/Makefile                           |   27 +-
 .../crypto/arm}/curve25519-core.S             |    0
 lib/crypto/arm/curve25519.h                   |   47 +
 lib/crypto/curve25519-generic.c               |   25 -
 lib/crypto/curve25519.c                       |   69 +-
 .../crypto/powerpc}/curve25519-ppc64le_asm.S  |    0
 .../crypto/powerpc/curve25519.h               |  124 +-
 lib/crypto/tests/Kconfig                      |    9 +
 lib/crypto/tests/Makefile                     |    1 +
 .../curve25519_kunit.c}                       |   99 +-
 .../crypto/x86/curve25519.h                   |  127 +-
 42 files changed, 236 insertions(+), 2318 deletions(-)
 delete mode 100644 arch/arm/crypto/curve25519-glue.c
 delete mode 100644 crypto/curve25519-generic.c
 rename {arch/arm/crypto => lib/crypto/arm}/curve25519-core.S (100%)
 create mode 100644 lib/crypto/arm/curve25519.h
 delete mode 100644 lib/crypto/curve25519-generic.c
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/curve25519-ppc64le_asm.S (100%)
 rename arch/powerpc/crypto/curve25519-ppc64le-core.c => lib/crypto/powerpc/curve25519.h (56%)
 rename lib/crypto/{curve25519-selftest.c => tests/curve25519_kunit.c} (96%)
 rename arch/x86/crypto/curve25519-x86_64.c => lib/crypto/x86/curve25519.h (94%)


base-commit: 362f92286065d9f8282da5def89e173a12191568
-- 
2.50.1


