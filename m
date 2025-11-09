Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69814CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pecVbuqBpV05XavVAU4yL2I7j6HvYJ3zPCrCAjTZops=; b=GYMLndFqH7bcFzmqou5cQxOwaY
	rJQR5tJVsvaKmcumxYXechXGb8J0Mq3xVzq9e0l1X/G4iFXlh2rAjcsbDn2YwgfO/5lzCvRr5JvdV
	vi76yPRDL/yAOVXYj+0i0VY+uIkUmrVSWQfAo4R7n1q9pxOiPDJ+mAHdAd2ldC0O2aiHAvlqr9yvt
	nYbnHsZh6ePpsadzeM7ijdmE/MvHwYe6a4YHz6FEGONfFx3NLA09z2o5Kl+MmWiZMwf+04z2xbQn3
	Rn1q6CfX1tmPMW8qEP6fl+i2MYBYYBMs1R/Xbgd2Uufb/UFOPrcP6XZvhnPE4AxmMNoxmHiTQPvem
	ILEhwhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAY-00000004VmY-1La6;
	Sun, 09 Nov 2025 23:50:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAV-00000004Vja-48G3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D41460054;
	Sun,  9 Nov 2025 23:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00FAC4CEF8;
	Sun,  9 Nov 2025 23:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762732197;
	bh=GGXE4CX6TLqH68fC6EBiO7twAZjKaaOW8LAfS8ijyYM=;
	h=From:To:Cc:Subject:Date:From;
	b=NVRhzD+MoJJn94RWzZhNEXYLomm4+Tz1zOklh9oOfPbYIc2pDiYrNdCj6fLLUxQA2
	 nyaOE9XlGqtoXUxS13EZeQj2FI2cxPm1eeOD30NujWA9biF/27nVW2h6zpYVaRG6bd
	 MSZgBRGMjpq0Z40fEx4ZZCAWFt5TLxGc4e845aLCjNqxrqJzw1/Oa9IoIe/QndAMX6
	 u6YvJoJDW71TcTnuYc4kahTVdEkw5aFx+/qQ4v6KZaJ5lMJfe3RbQAkZdzjLeeB5fF
	 qWIb65ZilWxgqp1ds4rTP757JqserJjjMLGbsVlgwShC39VHT9W/9rmhmDP+TH0/og
	 wH7Rrfrr7lTFQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/9] POLYVAL library
Date: Sun,  9 Nov 2025 15:47:15 -0800
Message-ID: <20251109234726.638437-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git polyval-lib-v1

This series migrates the POLYVAL code to lib/crypto/.  It turns out that
just like Poly1305, the library is a much better fit for it.

This series also replaces the generic implementation of POLYVAL with a
much better one.

Notably, this series improves the performance of HCTR2, since it
eliminates unnecessary overhead that was being incurred by accessing
POLYVAL via the crypto_shash API.  I see a 45% increase in throughput
with 64-byte messages, 53% with 128-byte, or 6% with 4096-byte.

It also eliminates the need to explicitly enable the optimized POLYVAL
code, as it's now enabled automatically when HCTR2 support is enabled.

Eric Biggers (9):
  crypto: polyval - Rename conflicting functions
  lib/crypto: polyval: Add POLYVAL library
  lib/crypto: tests: Add KUnit tests for POLYVAL
  lib/crypto: arm64/polyval: Migrate optimized code into library
  lib/crypto: x86/polyval: Migrate optimized code into library
  crypto: hctr2 - Convert to use POLYVAL library
  crypto: polyval - Remove the polyval crypto_shash
  crypto: testmgr - Remove polyval tests
  fscrypt: Drop obsolete recommendation to enable optimized POLYVAL

 Documentation/filesystems/fscrypt.rst         |   2 -
 arch/arm64/crypto/Kconfig                     |  10 -
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/polyval-ce-glue.c           | 158 ---------
 arch/x86/crypto/Kconfig                       |  10 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/polyval-clmulni_glue.c        | 180 ----------
 crypto/Kconfig                                |  12 +-
 crypto/Makefile                               |   1 -
 crypto/hctr2.c                                | 226 ++++---------
 crypto/polyval-generic.c                      | 205 ------------
 crypto/tcrypt.c                               |   4 -
 crypto/testmgr.c                              |   9 +-
 crypto/testmgr.h                              | 171 ----------
 include/crypto/polyval.h                      | 182 ++++++++++-
 lib/crypto/Kconfig                            |  12 +
 lib/crypto/Makefile                           |  10 +
 .../crypto/arm64}/polyval-ce-core.S           |  38 +--
 lib/crypto/arm64/polyval.h                    |  82 +++++
 lib/crypto/polyval.c                          | 307 ++++++++++++++++++
 lib/crypto/tests/Kconfig                      |   9 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/polyval-testvecs.h           | 186 +++++++++++
 lib/crypto/tests/polyval_kunit.c              | 223 +++++++++++++
 .../crypto/x86/polyval-pclmul-avx.S           |  40 ++-
 lib/crypto/x86/polyval.h                      |  83 +++++
 scripts/crypto/gen-hash-testvecs.py           |  47 ++-
 27 files changed, 1240 insertions(+), 974 deletions(-)
 delete mode 100644 arch/arm64/crypto/polyval-ce-glue.c
 delete mode 100644 arch/x86/crypto/polyval-clmulni_glue.c
 delete mode 100644 crypto/polyval-generic.c
 rename {arch/arm64/crypto => lib/crypto/arm64}/polyval-ce-core.S (92%)
 create mode 100644 lib/crypto/arm64/polyval.h
 create mode 100644 lib/crypto/polyval.c
 create mode 100644 lib/crypto/tests/polyval-testvecs.h
 create mode 100644 lib/crypto/tests/polyval_kunit.c
 rename arch/x86/crypto/polyval-clmulni_asm.S => lib/crypto/x86/polyval-pclmul-avx.S (91%)
 create mode 100644 lib/crypto/x86/polyval.h


base-commit: ce59a87d1cbd3fa075aba73efde946e61d5ef089
-- 
2.51.2


