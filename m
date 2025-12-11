Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A383D3E785
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 01:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IBYjFPyUsAltSKXqdtNkp0PayAe7erzqOmITS+KcuQc=; b=rz3I/MmRjnzAPYE1/a4uUqy1nn
	B/grn7ZCOAatrsdjgF7NlhJpGz1rBs1xXpS6BNKR+FeMvWH3mWkJiS+rd2Dy+SriyogBGVve11wA4
	XJ5EnKvFp3yDwLvJ4gtZi+dKk4HZ/i4FTy8gFRA0sg3ACsCJ4CXOv/oeCr2ZRq8/7PXHyIVtfG/HX
	vDl4xOzeu3zqR/u1jCZEYrAb3ekFYBXri+CVqaJWlQbDQ6guMGFV1kFWtTBdflP7b0E/oYLDpWcel
	lX/TDk9usqOXC/5z8r3ef3g3d03fFRXRo9nJmXCgIvBZqiPorH3NxMm4ANo913K/GoNR6JPHF/ld5
	jnwdaD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMY-0000000G3hK-3GD8;
	Thu, 11 Dec 2025 01:20:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMT-0000000G3bA-38p4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 01:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42C9E4445C;
	Thu, 11 Dec 2025 01:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78D0C4CEF1;
	Thu, 11 Dec 2025 01:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765416051;
	bh=9WZxU3SduU/OLs3KoFGUeeQN0S01x7wwQRNZ8loj4I0=;
	h=From:To:Cc:Subject:Date:From;
	b=eYt9t0+ccn3lTySgqTYX5mqswut1aCmRSzK+fFWXg0ejmOqIYIGaLZFFBNklX3XGt
	 Fz+MWFQLhzgOGIqNKEkKgF3zwGajWqrxEEPDtfMudwtDo0r3UaKKFzsLtRnphKlscb
	 TMK5GelVApE2cWZogUy13U8IiPyw45IMIwStXDUWLg7WF+doHkHf4fqAaxaemop9BU
	 jbn4mCD+yWm/rSgjHzL5PyIjxVyE/dw2W+kMJ9R28KY5l366KR+cIT1+tTCMNjlwK4
	 JQ711Mr+7Kb5iLRokMmEYYWnqdQsnpcgthpKBXK7kLAX53ykogsqVQQOYSDf9lxH99
	 jxoDejdAisb+Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 00/12] NH library and Adiantum cleanup
Date: Wed, 10 Dec 2025 17:18:32 -0800
Message-ID: <20251211011846.8179-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_172053_828504_0A604540 
X-CRM114-Status: GOOD (  12.85  )
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

This series can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git nh-lib-v1

This series removes the nhpoly1305 crypto_shash algorithm, which existed
only to fit Adiantum hashing into the traditional Linux crypto API
paradigm.  It replaces it with an nh() library function, combined with
code in the "adiantum" template that handles the Poly1305 step.

The result is simpler code.  As usual, I've also fixed the issue where
the architecture-optimized code was disabled by default.

I've also included some additional cleanups for the Adiantum code.

I'm planning to take this via libcrypto-next.

Eric Biggers (12):
  lib/crypto: nh: Add NH library
  lib/crypto: tests: Add KUnit tests for NH
  lib/crypto: arm/nh: Migrate optimized code into library
  lib/crypto: arm64/nh: Migrate optimized code into library
  lib/crypto: x86/nh: Migrate optimized code into library
  crypto: adiantum - Convert to use NH library
  crypto: adiantum - Use scatter_walk API instead of sg_miter
  crypto: adiantum - Use memcpy_{to,from}_sglist()
  crypto: adiantum - Drop support for asynchronous xchacha ciphers
  crypto: nhpoly1305 - Remove crypto_shash support
  crypto: testmgr - Remove nhpoly1305 tests
  fscrypt: Drop obsolete recommendation to enable optimized NHPoly1305

 Documentation/filesystems/fscrypt.rst         |    5 -
 arch/arm/crypto/Kconfig                       |   10 -
 arch/arm/crypto/Makefile                      |    2 -
 arch/arm/crypto/nhpoly1305-neon-glue.c        |   80 -
 arch/arm64/crypto/Kconfig                     |   10 -
 arch/arm64/crypto/Makefile                    |    3 -
 arch/arm64/crypto/nhpoly1305-neon-glue.c      |   79 -
 arch/x86/crypto/Kconfig                       |   20 -
 arch/x86/crypto/Makefile                      |    5 -
 arch/x86/crypto/nhpoly1305-avx2-glue.c        |   81 -
 arch/x86/crypto/nhpoly1305-sse2-glue.c        |   80 -
 crypto/Kconfig                                |    8 +-
 crypto/Makefile                               |    1 -
 crypto/adiantum.c                             |  442 +++---
 crypto/nhpoly1305.c                           |  255 ---
 crypto/testmgr.c                              |   10 +-
 crypto/testmgr.h                              | 1372 -----------------
 include/crypto/nh.h                           |   52 +
 include/crypto/nhpoly1305.h                   |   74 -
 lib/crypto/Kconfig                            |   13 +
 lib/crypto/Makefile                           |   11 +
 .../crypto => lib/crypto/arm}/nh-neon-core.S  |    0
 lib/crypto/arm/nh.h                           |   33 +
 .../crypto/arm64}/nh-neon-core.S              |    3 +-
 lib/crypto/arm64/nh.h                         |   34 +
 lib/crypto/nh.c                               |   82 +
 lib/crypto/tests/Kconfig                      |    8 +
 lib/crypto/tests/Makefile                     |    1 +
 lib/crypto/tests/nh-testvecs.h                |  298 ++++
 lib/crypto/tests/nh_kunit.c                   |   43 +
 .../crypto/x86/nh-avx2.S                      |    3 +-
 .../crypto/x86/nh-sse2.S                      |    3 +-
 lib/crypto/x86/nh.h                           |   45 +
 scripts/crypto/gen-hash-testvecs.py           |   40 +
 34 files changed, 909 insertions(+), 2297 deletions(-)
 delete mode 100644 arch/arm/crypto/nhpoly1305-neon-glue.c
 delete mode 100644 arch/arm64/crypto/nhpoly1305-neon-glue.c
 delete mode 100644 arch/x86/crypto/nhpoly1305-avx2-glue.c
 delete mode 100644 arch/x86/crypto/nhpoly1305-sse2-glue.c
 delete mode 100644 crypto/nhpoly1305.c
 create mode 100644 include/crypto/nh.h
 delete mode 100644 include/crypto/nhpoly1305.h
 rename {arch/arm/crypto => lib/crypto/arm}/nh-neon-core.S (100%)
 create mode 100644 lib/crypto/arm/nh.h
 rename {arch/arm64/crypto => lib/crypto/arm64}/nh-neon-core.S (97%)
 create mode 100644 lib/crypto/arm64/nh.h
 create mode 100644 lib/crypto/nh.c
 create mode 100644 lib/crypto/tests/nh-testvecs.h
 create mode 100644 lib/crypto/tests/nh_kunit.c
 rename arch/x86/crypto/nh-avx2-x86_64.S => lib/crypto/x86/nh-avx2.S (98%)
 rename arch/x86/crypto/nh-sse2-x86_64.S => lib/crypto/x86/nh-sse2.S (97%)
 create mode 100644 lib/crypto/x86/nh.h


base-commit: 0914d5848096af6496c7aa5e1ac051fcdb3f755b
-- 
2.52.0


