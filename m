Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BFBC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 18:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=opnZfCZ0neXJH9H/qFRNtMe7ebtD0rAGv16WYa1Q+Fo=; b=YTaXyrRgnKgJn6OQ5FEo5ysw5u
	d+uBUDW4r57DAbuod2FLEB+1La6VMhaEcuYkMDLz2Q+PbLFt/86FkM9bJeLJ2v+mBoCK/PVxNzhOS
	OD15M1aTybH6hv6Nap3xJm8BoVPg9Zpwz8L3ekpKXfIlp+zUSraWjhOPPg7MmZ85mCso2cznR6/qg
	9Io6QWm0DxBhkzSvudybtLzT2UmZUiQu4fyxKLqwGaJsVIz0KB4mkypI52xYJSUCQmDgNeJgyybiC
	rHoq4/VL5sfvttesR96ersnriNWc2UueYfKGEDa9axFIaSdMMgGWIZVBS/WFzLuYDPapTls+WEexv
	Rt0Qdw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18Jy-0000000EM89-275c;
	Sat, 05 Apr 2025 18:32:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u18IA-0000000ELcf-00YF;
	Sat, 05 Apr 2025 18:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 073235C4A31;
	Sat,  5 Apr 2025 18:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571E2C4CEE4;
	Sat,  5 Apr 2025 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877852;
	bh=NUeI4U0WXhSt3zBtNRQTMMK3/MdfX1g2dDF6Z2qmcBk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZADTKA2XpWmUoC1UvEdiBW5vfd7VpA7EcazTAeFqV6IYRAcTwJj32Vg1Wq5fCGLgs
	 7JyOAjRuSsqqgqYWs71EQVJOb9Z2n5pA17nrPeJlhMKCA/eAK9NXkFZR3p91Y8caSt
	 jinR8neVOTsIM05C1MclF0w8iWixTieJ05Msm7l1WKlKmf9VdzyhgwbvbhsJ497vsg
	 XywIxp8b7zKgwiB5AvFpxMRMingbmpZEm6NwEgL/uIHCSdA3oOaTUTX2dXfFwk4hjZ
	 yqf7tRidgJduOJ/eghplQ3/3xFBzLYQ40Eu7Y4R9D9qCW1JAc/ukkE3kpFwTEyuN6k
	 35/hTz+afw7oA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 0/9] Remove per-architecture ChaCha skcipher glue code
Date: Sat,  5 Apr 2025 11:26:00 -0700
Message-ID: <20250405182609.404216-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_113054_147015_8F3FE65B 
X-CRM114-Status: GOOD (  16.98  )
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

Currently each architecture exposes ChaCha not only through the library
API, but also through the crypto_skcipher API.  That requires each
architecture to implement essentially the same skcipher glue code.

Following the example of what's been done for crc32 and crc32c,
eliminate this redundancy by making crypto/chacha.c register both the
generic and architecture-optimized skcipher algorithms, implemented on
top of the appropriate library functions.  This removes almost 800 lines
of code and disentangles the library code from the skcipher API.

From what I remember, the following are the reasons why it wasn't just
done this way originally.  But none of these really hold water:

- The skcipher code was there first, so it may have seemed more natural
  to add onto it rather than replace it.

- Architectures could register multiple skcipher algorithms using
  different CPU features and have them all be tested in a single boot.
  This was convenient in theory, but it never really worked properly.
  It didn't apply to the library code, the x86 ChaCha code wasn't
  actually doing this (it used static keys instead), and this cannot
  catch bugs like accidentally using an AVX instruction in SSE code.
  Instead, a correct solution, which also doesn't require any special
  kernel support, is to just boot the kernel in QEMU using different
  -cpu arguments as needed to test all the code.

- There was a concern about changing cra_driver_names potentially
  breaking users.  But in practice users rely on cra_name, not
  cra_driver_name.  We already change, add, and remove cra_driver_names
  occasionally for various reasons.  And even if someone was relying on
  a specific cra_driver_name, there are some more lightweight
  compatibility tricks that could be used.

- There was a desire for users to be able to override the kernel's
  choice of ChaCha implementation by blacklisting the arch-optimized
  ChaCha module.  But that already became mostly impossible when the
  library functions were added to the same module.  And in practice
  users don't do this anyway.  Even if, hypothetically, someone really
  needed to do this and for some reason the kernel couldn't be fixed to
  make the right choice in their case automatically, there are other
  ways this could be implemented such as a module parameter.

Eric Biggers (9):
  crypto: riscv/chacha - implement library instead of skcipher
  crypto: chacha - centralize the skcipher wrappers for arch code
  crypto: arm/chacha - remove the redundant skcipher algorithms
  crypto: arm64/chacha - remove the skcipher algorithms
  crypto: mips/chacha - remove the skcipher algorithms
  crypto: powerpc/chacha - remove the skcipher algorithms
  crypto: s390/chacha - remove the skcipher algorithms
  crypto: x86/chacha - remove the skcipher algorithms
  crypto: chacha - remove <crypto/internal/chacha.h>

 arch/arm/crypto/Kconfig                 |   7 -
 arch/arm/crypto/chacha-glue.c           | 243 +---------------------
 arch/arm/crypto/chacha-neon-core.S      |   2 +-
 arch/arm64/crypto/Kconfig               |   7 -
 arch/arm64/crypto/chacha-neon-core.S    |   2 +-
 arch/arm64/crypto/chacha-neon-glue.c    | 146 +------------
 arch/mips/crypto/Kconfig                |   6 -
 arch/mips/crypto/chacha-glue.c          | 131 +-----------
 arch/powerpc/crypto/Kconfig             |   8 -
 arch/powerpc/crypto/chacha-p10-glue.c   | 147 +-------------
 arch/riscv/crypto/Kconfig               |  11 +-
 arch/riscv/crypto/chacha-riscv64-glue.c | 112 ++++------
 arch/riscv/crypto/chacha-riscv64-zvkb.S |  71 +++----
 arch/s390/crypto/Kconfig                |   7 -
 arch/s390/crypto/chacha-glue.c          |  99 ++-------
 arch/x86/crypto/Kconfig                 |   9 -
 arch/x86/crypto/chacha_glue.c           | 144 +------------
 crypto/Makefile                         |   3 +-
 crypto/chacha.c                         | 260 ++++++++++++++++++++++++
 crypto/chacha_generic.c                 | 139 -------------
 include/crypto/chacha.h                 |   9 +
 include/crypto/internal/chacha.h        |  43 ----
 22 files changed, 413 insertions(+), 1193 deletions(-)
 create mode 100644 crypto/chacha.c
 delete mode 100644 crypto/chacha_generic.c
 delete mode 100644 include/crypto/internal/chacha.h

base-commit: 56f944529ec2292cbe63377a76df3759d702dd39
-- 
2.49.0


