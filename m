Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A11CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rf4T4sRPTVz6rgZ6n5eNH/fTKQkDJmD0kHiokaoIUIw=; b=g1XuPdfokFxeBljPyLUTlxU4xl
	Dw6WIW12PniRnHQ85gNpJWQbaPqAkugLakZHwQXfVnEa1xNIzm0kC5poT2aDd0VAeRafNidj2Hz79
	wQi1l5qQBeCtNQmwr3zQBkvTB6qHG5kG5vxt6Hegqh7dqR7IQzI10kQp+1gcvLlivcIsqxxvgEwqr
	btqrV6g6+QGXmoxIDujyhAwPxhKUB4LGfU98vmm32V5MSdJKNHCoZ72z7TIjMrzj0+XzcSqUdlXF1
	M0W1vs2czImvKjXKCyKvivChC50VOdRJCAhGWAzpaVQvmLQQPNU98UPe/YjCnrGsKeL4EFYwr/J0x
	U4EPxk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgg-0000000C2jt-0vvv;
	Sun, 26 Oct 2025 05:53:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgf-0000000C2jg-2m4y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 05:53:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DFD96022D;
	Sun, 26 Oct 2025 05:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC27BC4CEE7;
	Sun, 26 Oct 2025 05:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761457983;
	bh=q6vLamfneYVI54zMckqkVG2DRb1HUk+gJgFQY0AJgAg=;
	h=From:To:Cc:Subject:Date:From;
	b=HrhAnm1DKzqRE02P4K7NTX0u3hms/ym3Wgy3+pa+xhHHi5Wv0WKRIqwVq0/qIkwUb
	 10/wMUn2sWcuOH+ygEXDWM4kycFyufEQcLfVXsdIXaZWCtSZeL9tX1Z+zmed69gzx/
	 ZnVaRSofIfNpeF7uu55ldppuiq9Hhi/dy4S68rgyGWA0DMyraAjY4TC02rg05i1mQw
	 28QlZbxDIA0NptzuVHd0kzW7V/8j35xUG+FNswB7UPa4x09neJL/wuxXS81wqi2E2X
	 15vlS0j2IvJhZMuiVUSNtU2ze3xENAASd8r9MGAgOxS4HinKSwe+SxxDprh0N/l5Ll
	 aKB/QW4ovjlcg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/15] SHA-3 library
Date: Sat, 25 Oct 2025 22:50:17 -0700
Message-ID: <20251026055032.1413733-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
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

This series is targeting libcrypto-next.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha3-lib-v2

This series adds SHA-3 support to lib/crypto/.  This includes support
for the digest algorithms SHA3-224, SHA3-256, SHA3-384, and SHA3-512,
and also support for the extendable-output functions SHAKE128 and
SHAKE256.  The SHAKE128 and SHAKE256 support will be needed by ML-DSA.

The architecture-optimized SHA-3 code for arm64 and s390 is migrated
into lib/crypto/.  (The existing s390 code couldn't really be reused, so
really I rewrote it from scratch.)  This makes the SHA-3 library
functions be accelerated on these architectures.

Finally, the sha3-224, sha3-256, sha3-384, and sha3-512 crypto_shash
algorithms are reimplemented on top of the library API.

If the s390 folks could re-test the s390 optimized SHA-3 code (by
enabling CRYPTO_LIB_SHA3_KUNIT_TEST and CRYPTO_LIB_BENCHMARK), that
would be helpful.  QEMU doesn't support the instructions it uses.  Also,
it would be helpful to provide the benchmark output from just before
"lib/crypto: s390/sha3: Add optimized Keccak function", just after it,
and after "lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest
functions".  Then we can verify that each change is useful.

Changed in v2:
  - Added missing selection of CRYPTO_LIB_SHA3 from CRYPTO_SHA3.
  - Fixed a bug where incorrect SHAKE output was produced if a
    zero-length squeeze was followed by a nonzero-length squeeze.
  - Improved the SHAKE tests.
  - Utilized the one-shot SHA-3 digest instructions on s390.
  - Split the s390 changes into several patches.
  - Folded some of my patches into David's.
  - Dropped some unnecessary changes from the first 2 patches.
  - Lots more cleanups, mainly to "lib/crypto: sha3: Add SHA-3 support".

Changed in v1 (vs. first 5 patches of David's v6 patchset):
  - Migrated the arm64 and s390 code into lib/crypto/
  - Simplified the library API
  - Added FIPS test
  - Many other fixes and improvements

The first 5 patches are derived from David's v6 patchset
(https://lore.kernel.org/linux-crypto/20251017144311.817771-1-dhowells@redhat.com/).
Earlier changelogs can be found there.

David Howells (5):
  crypto: s390/sha3 - Rename conflicting functions
  crypto: arm64/sha3 - Rename conflicting function
  lib/crypto: sha3: Add SHA-3 support
  lib/crypto: sha3: Move SHA3 Iota step mapping into round function
  lib/crypto: tests: Add SHA3 kunit tests

Eric Biggers (10):
  lib/crypto: tests: Add additional SHAKE tests
  lib/crypto: sha3: Add FIPS cryptographic algorithm self-test
  crypto: arm64/sha3 - Update sha3_ce_transform() to prepare for library
  lib/crypto: arm64/sha3: Migrate optimized code into library
  lib/crypto: s390/sha3: Add optimized Keccak functions
  lib/crypto: sha3: Support arch overrides of one-shot digest functions
  lib/crypto: s390/sha3: Add optimized one-shot SHA-3 digest functions
  crypto: jitterentropy - Use default sha3 implementation
  crypto: sha3 - Reimplement using library API
  crypto: s390/sha3 - Remove superseded SHA-3 code

 Documentation/crypto/index.rst                |   1 +
 Documentation/crypto/sha3.rst                 | 130 ++++++
 arch/arm64/configs/defconfig                  |   2 +-
 arch/arm64/crypto/Kconfig                     |  11 -
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/sha3-ce-glue.c              | 151 -------
 arch/s390/configs/debug_defconfig             |   3 +-
 arch/s390/configs/defconfig                   |   3 +-
 arch/s390/crypto/Kconfig                      |  20 -
 arch/s390/crypto/Makefile                     |   2 -
 arch/s390/crypto/sha.h                        |  51 ---
 arch/s390/crypto/sha3_256_s390.c              | 157 -------
 arch/s390/crypto/sha3_512_s390.c              | 157 -------
 arch/s390/crypto/sha_common.c                 | 117 -----
 crypto/Kconfig                                |   1 +
 crypto/Makefile                               |   2 +-
 crypto/jitterentropy-kcapi.c                  |  12 +-
 crypto/sha3.c                                 | 166 +++++++
 crypto/sha3_generic.c                         | 290 ------------
 crypto/testmgr.c                              |   8 +
 include/crypto/sha3.h                         | 306 ++++++++++++-
 lib/crypto/Kconfig                            |  13 +
 lib/crypto/Makefile                           |  10 +
 .../crypto/arm64}/sha3-ce-core.S              |  67 +--
 lib/crypto/arm64/sha3.h                       |  62 +++
 lib/crypto/fips.h                             |   7 +
 lib/crypto/s390/sha3.h                        | 151 +++++++
 lib/crypto/sha3.c                             | 411 +++++++++++++++++
 lib/crypto/tests/Kconfig                      |  11 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/sha3-testvecs.h              | 249 +++++++++++
 lib/crypto/tests/sha3_kunit.c                 | 422 ++++++++++++++++++
 scripts/crypto/gen-fips-testvecs.py           |   4 +
 scripts/crypto/gen-hash-testvecs.py           |  27 +-
 34 files changed, 2012 insertions(+), 1016 deletions(-)
 create mode 100644 Documentation/crypto/sha3.rst
 delete mode 100644 arch/arm64/crypto/sha3-ce-glue.c
 delete mode 100644 arch/s390/crypto/sha.h
 delete mode 100644 arch/s390/crypto/sha3_256_s390.c
 delete mode 100644 arch/s390/crypto/sha3_512_s390.c
 delete mode 100644 arch/s390/crypto/sha_common.c
 create mode 100644 crypto/sha3.c
 delete mode 100644 crypto/sha3_generic.c
 rename {arch/arm64/crypto => lib/crypto/arm64}/sha3-ce-core.S (84%)
 create mode 100644 lib/crypto/arm64/sha3.h
 create mode 100644 lib/crypto/s390/sha3.h
 create mode 100644 lib/crypto/sha3.c
 create mode 100644 lib/crypto/tests/sha3-testvecs.h
 create mode 100644 lib/crypto/tests/sha3_kunit.c

base-commit: e3068492d0016d0ea9a1ff07dbfa624d2ec773ca
-- 
2.51.1.dirty


