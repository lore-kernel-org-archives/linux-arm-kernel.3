Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4CCD68BFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Nov 2024 00:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTUM1q9Q3qAzGiXzAGwWc0e6cu08dWj+FhjfF8+HPCE=; b=MBh/UI2v+4PI3BnsKttiQGom+A
	tkZ5WPx+Y2pLDHVOCJ3Lu/eNabdPzr7nKvWEL9GHUtFK7O3xk9jRLwGPmdgFQnhr2zT1q4F8Jf//b
	gXMR1Ut3XYiCIX8DmUym/0vgs7PJ6b6fgp0ovKYHCoKoO7Mq0bVAdzmalBORhREU6NNR3BQYBGaiQ
	x7xRlYykg4/QURA2VWrDRw2YGlN3TYEwIRCLadMaPvk3HeGKXz9FnYDsdXnRWgjmuD057wLMrQhtR
	gQ/VtU6GFGONf9/JccmsmUFg493gadvh/y7CsD0gYvpIxZiYJD+iG3oQg2c9OvqyJOfFxxIfRPr+G
	BIumUP1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCT6u-00000006aeq-0kAh;
	Sun, 17 Nov 2024 00:25:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCT51-00000006Zqx-3ClC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Nov 2024 00:23:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85B0FA406D1;
	Sun, 17 Nov 2024 00:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AC4C4CEC3;
	Sun, 17 Nov 2024 00:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731803033;
	bh=CnepUwceJ5j9G5NUVs6UktH+oiMT+FJpiIqYKC1mGcA=;
	h=From:To:Cc:Subject:Date:From;
	b=QdBB+C8wOvDetydffbpqtgfNNLWzIrqbXMWelcLY8DuPmy5RGF5zfG+A0FsY+HaNG
	 O5PCgWFRW5GIMrGbfXgQ6Hbr4YtcyZFG8IX5XfaCSbHMkjiym1yO4Kr1vWmJjTz2fZ
	 sm8sHc6x2aDG3jtzdyegeDIKNBOQi7ERfR9RL9g136J9NuF533+AkCvwC9xhixjbJK
	 u1l2xA91Oc3DJfkMqNMcmT3wcn905syEAe0IL49XL3ZtPbOEUqsh2M59r6C7RbJfDQ
	 QdCEl8TCXEqTxxKPYmzGsTFdNGINwDhOyLJK07Ss4YFDkwMup0R7ZLkN14z7Cabzgs
	 4a3bW9/6PvKqQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 00/11] Wire up CRC-T10DIF library functions to arch-optimized code
Date: Sat, 16 Nov 2024 16:22:33 -0800
Message-ID: <20241117002244.105200-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_162355_937411_10AB98ED 
X-CRM114-Status: GOOD (  12.14  )
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-t10dif-lib-v1

This patchset updates the kernel's CRC-T10DIF library functions to be
directly optimized for x86, arm, arm64, and powerpc without taking an
unnecessary and inefficient detour through the crypto API.  It follows
the same approach that I'm taking for CRC32 in the patchset
https://lore.kernel.org/linux-crypto/20241103223154.136127-1-ebiggers@kernel.org

This patchset also adds a CRC KUnit test suite that covers multiple CRC
variants, and deletes some older ad-hoc tests that are obsoleted by it.

This patchset has several dependencies including my CRC32 patchset and
patches queued in several trees for 6.13.  It can be retrieved from git
using the command given above.  This is targeting 6.14.

Eric Biggers (11):
  lib/crc-t10dif: stop wrapping the crypto API
  lib/crc-t10dif: add support for arch overrides
  crypto: crct10dif - expose arch-optimized lib function
  x86/crc-t10dif: expose CRC-T10DIF function through lib
  arm/crc-t10dif: expose CRC-T10DIF function through lib
  arm64/crc-t10dif: expose CRC-T10DIF function through lib
  powerpc/crc-t10dif: expose CRC-T10DIF function through lib
  lib/crc_kunit.c: add KUnit test suite for CRC library functions
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
 arch/arm/lib/crc-t10dif-glue.c                |  77 ++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  10 -
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/crct10dif-ce-glue.c         | 132 ---
 arch/arm64/lib/Makefile                       |   3 +
 .../crc-t10dif-core.S}                        |   0
 arch/arm64/lib/crc-t10dif-glue.c              |  78 ++
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
 lib/Kconfig.debug                             |  20 +
 lib/Makefile                                  |   2 +-
 lib/crc-t10dif.c                              | 156 +---
 lib/crc32test.c                               | 852 ------------------
 lib/crc_kunit.c                               | 428 +++++++++
 .../testing/selftests/arm64/fp/kernel-test.c  |   3 +-
 57 files changed, 867 insertions(+), 1748 deletions(-)
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
 delete mode 100644 lib/crc32test.c
 create mode 100644 lib/crc_kunit.c

-- 
2.47.0


