Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BBDCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gLDG4A1tsNLBaRs42XgPbRUHZv+IZExO27zbHrp1mOA=; b=dmnGd19K4GmGHskxwX4R5GSeUW
	E5wx9VKdzIo06NRb51tIkEgQ1UTVI6UMTIE6SMoNftjL9izC6TdneXFIlA4ucj+Dency5HiYlfgrm
	vdEpvRJvNK7fXOdvadETr6g6fOJUXWRasuEBHPSy/twddHDWaqeKTL0yiFZ7NjZCl6kczmZbD1gH6
	xgR/1dNqyqtWVuOFWJtfiw+4xoRdGaFbcV2HZv1t4uK9cwAoyPXx+FTubCVMcoMF6SvVrt2e0LVWE
	KhbqSF16sLx919gMBr83u5yMCks98xA6SFzigSMEW+TMoPwF5fF2nJAX1F3LzE5UqqfnBjwM7xIek
	OyYDdEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9a-0000000BZQ0-2uiH;
	Mon, 20 Oct 2025 00:53:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9W-0000000BZNR-31ML
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3ECD4580F;
	Mon, 20 Oct 2025 00:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED4AC4CEE7;
	Mon, 20 Oct 2025 00:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921611;
	bh=JmOANjyD/5j6cWmAe84VhHCBmVIXWn3nb+w9e/Dv9Ds=;
	h=From:To:Cc:Subject:Date:From;
	b=a/wAwz++HOKRcfz9DcEAOY2sylzStIUZNP4xJm9y3uzHsLR9qu7KYWo630H4TD9mZ
	 Du7k2rDKKuzY2rHR3s8u+h0vtGyRO3wFaqFxVbcwrP7QWizJ/Eh/k90udvxWpb25kI
	 ZgLL3xBBHmweo2Cc+KPWLhWMkosDhXvMS3Y+hujXL10R8TshutyCNFF/YTnJyFWBBl
	 cFBo6rGTlWNnbsChsVhY7mMbHxhHPAOn5STP+0YYrII/m0b1sQm73yvdFGridtHKwf
	 uJKKC/Mk4CqvjW2P0t0Xv3OApbhC105t2kxI6yqgyjuoY9OlAIuuAksuKj3Jfq8pTf
	 x0hwFWzW091Rw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 00/17] SHA-3 library
Date: Sun, 19 Oct 2025 17:50:21 -0700
Message-ID: <20251020005038.661542-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_175335_565311_A63AD5EC 
X-CRM114-Status: GOOD (  13.83  )
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha3-lib-v1

This series builds on the first 5 patches of David's v6 series
(https://lore.kernel.org/r/20251017144311.817771-1-dhowells@redhat.com),
which I've included unmodified as the initial patches.  The remaining
patches improve the SHA-3 library, for example by simplifying the API
and migrating the existing arm64 and s390-optimized SHA-3 code into the
library.  The last patch reimplements the sha3-* crypto_shash algorithms
on top of the library.

If the s390 folks could re-test the s390 optimized SHA-3 code, that
would be helpful.  QEMU doesn't support the instructions it uses.

David Howells (5):
  s390/sha3: Rename conflicting functions
  arm64/sha3: Rename conflicting functions
  lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128,
    SHAKE256
  lib/crypto: Move the SHA3 Iota transform into the single round
    function
  lib/crypto: Add SHA3 kunit tests

Eric Biggers (12):
  lib/crypto: sha3: Fix libsha3 build condition
  lib/crypto: sha3: Use appropriate conversions in
    sha3_keccakf_generic()
  lib/crypto: sha3: Drop unfinished SHAKE support from
    gen-hash-testvecs.py
  lib/crypto: sha3: Consistently use EXPORT_SYMBOL_GPL
  lib/crypto: sha3: Replace redundant ad-hoc test with FIPS test
  lib/crypto: sha3: Simplify the API
  lib/crypto: sha3: Document one-shot functions in header and improve
    docs
  crypto: arm64/sha3 - Update sha3_ce_transform() to prepare for library
  lib/crypto: arm64/sha3: Migrate optimized code into library
  lib/crypto: s390/sha3: Migrate optimized code into library
  crypto: jitterentropy - use default sha3 implementation
  crypto: sha3 - Reimplement using library API

 Documentation/crypto/index.rst                |   1 +
 Documentation/crypto/sha3.rst                 | 147 +++++++
 arch/arm64/configs/defconfig                  |   2 +-
 arch/arm64/crypto/Kconfig                     |  11 -
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/sha3-ce-glue.c              | 151 -------
 arch/s390/configs/debug_defconfig             |   3 +-
 arch/s390/configs/defconfig                   |   3 +-
 arch/s390/crypto/Kconfig                      |  20 -
 arch/s390/crypto/Makefile                     |   2 -
 arch/s390/crypto/sha.h                        |  51 ---
 arch/s390/crypto/sha3_256_s390.c              | 157 --------
 arch/s390/crypto/sha3_512_s390.c              | 157 --------
 arch/s390/crypto/sha_common.c                 | 117 ------
 crypto/Makefile                               |   2 +-
 crypto/jitterentropy-kcapi.c                  |  12 +-
 crypto/sha3.c                                 | 172 ++++++++
 crypto/sha3_generic.c                         | 290 -------------
 crypto/testmgr.c                              |   8 +
 include/crypto/sha3.h                         | 314 ++++++++++++++-
 lib/crypto/Kconfig                            |  13 +
 lib/crypto/Makefile                           |  10 +
 .../crypto/arm64}/sha3-ce-core.S              |  66 +--
 lib/crypto/arm64/sha3.h                       |  64 +++
 lib/crypto/fips.h                             |   7 +
 lib/crypto/s390/sha3.h                        |  76 ++++
 lib/crypto/sha3.c                             | 380 ++++++++++++++++++
 lib/crypto/tests/Kconfig                      |  11 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/sha3_kunit.c                 | 344 ++++++++++++++++
 lib/crypto/tests/sha3_testvecs.h              | 231 +++++++++++
 scripts/crypto/gen-fips-testvecs.py           |   4 +
 scripts/crypto/gen-hash-testvecs.py           |   6 +-
 33 files changed, 1822 insertions(+), 1014 deletions(-)
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
 create mode 100644 lib/crypto/tests/sha3_kunit.c
 create mode 100644 lib/crypto/tests/sha3_testvecs.h

base-commit: 123fa1574bccee87da735d13e89c931e88288b40
-- 
2.51.1.dirty


