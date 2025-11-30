Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EECCD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 03:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m0p3MB+U3U5R8x4fnIlQ6tglm65aSMovRXQi5lWru0g=; b=sYril/eWkqjOO+tJWkRD9dGNW+
	6AfF0rWqBls+hOMV760baLMgmTJUiNmdSu2lSbPYuR2j5QkZmnUfvgzQWPsclkFNrWukWBWvxiS26
	QsPicYxBauhfGIL1H3Kq7pIs4g7DFokFl8ypEMHwyd+drLTuE7nU0MK78sEAV3u5pC++qM+pFU+Em
	bKFb/hsQFGJHFR0bFBPShtC3ECYdQZ4EcixbI5tnyMXxYDff5w3j9hXsAgxpeoxPuB1sNWQYMoO06
	JXGjWZlADIwsKn9SiSj2N/KUn0HhB39zd8pIyAS5e5BSjZA7ZvbOIAPNR6s0nMm6w/FmEBY2mNA2Q
	etvWRcPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPXiF-00000001yz0-0HeP;
	Sun, 30 Nov 2025 03:02:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPXiD-00000001yyo-1lps
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 03:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 249746000A;
	Sun, 30 Nov 2025 03:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EAD9C113D0;
	Sun, 30 Nov 2025 03:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764471775;
	bh=isCPr0NiiiINXGXM7pxP4p9yORIK/EO5rqpXAC5ZRd0=;
	h=Date:From:To:Cc:Subject:From;
	b=siB8anujW+7tvvkEP+bPcdKSSEwsJsQ4RqRQHNkPep9YaRggWILNOQPVhEkoHgeZ6
	 rdW84NJje8Z0N0AqRWuyGSemmjqqORsx0c+6mkH3fkaTr7lIgjHgK0Kuf0RYzoFobg
	 0jSFFF1vmK6pICzCZ5Dr7dShiDGSnU74X+AW8KqZY1QchZRT45+SrPS7GpMKs1d2DM
	 TwUZh3CC1PEmne3Gssimi6cF8jarBZW8s4GXl8Zbw58xpBoBaOJhIuQeJSJjU/HTQu
	 mYxNP2LBRDM9fL9cIayeScptSgdLVNZ65/2WLl5Oeotv1a62+9ANhmThiWRC6eVeoF
	 mVlOPpunYv1NA==
Date: Sat, 29 Nov 2025 19:01:05 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Kees Cook <kees@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Mark Bloch <mbloch@nvidia.com>, Mark Brown <broonie@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [GIT PULL] arm64 FPSIMD buffer on-stack for 6.19
Message-ID: <20251130030105.GF12664@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Note: this is more of a core arm64 change.  However, I was asked to take
this because most uses of kernel-mode FPSIMD are in crypto or CRC code.
There were also conflicts with lib/crypto/ changes this cycle, which I
resolved.  But as a result, this depends on the pull request "Crypto
library updates for 6.19".  So that one needs to be merged first.

The following changes since commit 2dbb6f4a25d38fcf7d6c1c682e45a13e6bbe9562:

  fscrypt: Drop obsolete recommendation to enable optimized POLYVAL (2025-11-11 11:03:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/fpsimd-on-stack-for-linus

for you to fetch changes up to 5dc8d277520be6f0be11f36712e557167b3964c8:

  Merge tag 'arm64-fpsimd-on-stack-for-v6.19' into libcrypto-fpsimd-on-stack (2025-11-12 10:15:07 -0800)

----------------------------------------------------------------

In v6.8, the size of task_struct on arm64 increased by 528 bytes due
to the new 'kernel_fpsimd_state' field. This field was added to allow
kernel-mode FPSIMD code to be preempted.

Unfortunately, 528 bytes is kind of a lot for task_struct. This
regression in the task_struct size was noticed and reported.

Recover that space by making this state be allocated on the stack at
the beginning of each kernel-mode FPSIMD section.

To make it easier for all the users of kernel-mode FPSIMD to do that
correctly, introduce and use a 'scoped_ksimd' abstraction.

----------------------------------------------------------------
Ard Biesheuvel (23):
      arm64/simd: Add scoped guard API for kernel mode SIMD
      ARM/simd: Add scoped guard API for kernel mode SIMD
      lib/crypto: Switch ARM and arm64 to 'ksimd' scoped guard API
      lib/crc: Switch ARM and arm64 to 'ksimd' scoped guard API
      crypto/arm64: aes-ce-ccm - Avoid pointless yield of the NEON unit
      crypto/arm64: sm4-ce-ccm - Avoid pointless yield of the NEON unit
      crypto/arm64: sm4-ce-gcm - Avoid pointless yield of the NEON unit
      crypto: aegis128-neon - Move to more abstract 'ksimd' guard API
      raid6: Move to more abstract 'ksimd' guard API
      crypto/arm64: aes-ccm - Switch to 'ksimd' scoped guard API
      crypto/arm64: aes-blk - Switch to 'ksimd' scoped guard API
      crypto/arm64: aes-gcm - Switch to 'ksimd' scoped guard API
      crypto/arm64: nhpoly1305 - Switch to 'ksimd' scoped guard API
      crypto/arm64: polyval - Switch to 'ksimd' scoped guard API
      crypto/arm64: sha3 - Switch to 'ksimd' scoped guard API
      crypto/arm64: sm3 - Switch to 'ksimd' scoped guard API
      crypto/arm64: sm4 - Switch to 'ksimd' scoped guard API
      arm64/xorblocks:  Switch to 'ksimd' scoped guard API
      net/mlx5: Switch to more abstract scoped ksimd guard API on arm64
      arm64/fpu: Enforce task-context only for generic kernel mode FPU
      arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack
      lib/crypto: arm/blake2b: Move to scoped ksimd API
      lib/crypto: arm64: Move remaining algorithms to scoped ksimd API

Eric Biggers (2):
      Merge tag 'scoped-ksimd-for-arm-arm64' into libcrypto-fpsimd-on-stack
      Merge tag 'arm64-fpsimd-on-stack-for-v6.19' into libcrypto-fpsimd-on-stack

 arch/arm/include/asm/simd.h                  |   7 +
 arch/arm64/crypto/aes-ce-ccm-glue.c          | 116 +++++++--------
 arch/arm64/crypto/aes-ce-glue.c              |  87 ++++++-----
 arch/arm64/crypto/aes-glue.c                 | 139 ++++++++---------
 arch/arm64/crypto/aes-neonbs-glue.c          | 150 +++++++++----------
 arch/arm64/crypto/ghash-ce-glue.c            |  27 ++--
 arch/arm64/crypto/nhpoly1305-neon-glue.c     |   5 +-
 arch/arm64/crypto/sm3-ce-glue.c              |  15 +-
 arch/arm64/crypto/sm3-neon-glue.c            |  16 +-
 arch/arm64/crypto/sm4-ce-ccm-glue.c          |  49 ++----
 arch/arm64/crypto/sm4-ce-cipher-glue.c       |  10 +-
 arch/arm64/crypto/sm4-ce-gcm-glue.c          |  62 +++-----
 arch/arm64/crypto/sm4-ce-glue.c              | 214 ++++++++++++---------------
 arch/arm64/crypto/sm4-neon-glue.c            |  25 +---
 arch/arm64/include/asm/fpu.h                 |  16 +-
 arch/arm64/include/asm/neon.h                |   4 +-
 arch/arm64/include/asm/processor.h           |   7 +-
 arch/arm64/include/asm/simd.h                |  10 ++
 arch/arm64/include/asm/xor.h                 |  22 ++-
 arch/arm64/kernel/fpsimd.c                   |  54 +++++--
 crypto/aegis128-neon.c                       |  33 ++---
 drivers/net/ethernet/mellanox/mlx5/core/wc.c |  19 +--
 lib/crc/arm/crc-t10dif.h                     |  19 +--
 lib/crc/arm/crc32.h                          |  11 +-
 lib/crc/arm64/crc-t10dif.h                   |  19 +--
 lib/crc/arm64/crc32.h                        |  16 +-
 lib/crypto/arm/blake2b.h                     |   5 +-
 lib/crypto/arm/chacha.h                      |  11 +-
 lib/crypto/arm/curve25519.h                  |   5 +-
 lib/crypto/arm/poly1305.h                    |   6 +-
 lib/crypto/arm/sha1.h                        |  13 +-
 lib/crypto/arm/sha256.h                      |  12 +-
 lib/crypto/arm/sha512.h                      |   5 +-
 lib/crypto/arm64/chacha.h                    |  11 +-
 lib/crypto/arm64/poly1305.h                  |   6 +-
 lib/crypto/arm64/polyval.h                   |  24 ++-
 lib/crypto/arm64/sha1.h                      |   7 +-
 lib/crypto/arm64/sha256.h                    |  19 +--
 lib/crypto/arm64/sha3.h                      |  13 +-
 lib/crypto/arm64/sha512.h                    |   8 +-
 lib/raid6/neon.c                             |  17 +--
 lib/raid6/recov_neon.c                       |  15 +-
 42 files changed, 617 insertions(+), 712 deletions(-)

