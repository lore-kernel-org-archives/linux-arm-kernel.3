Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B333AC369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zkygNKKSJ6A/yCBu0e02gVkBmVl2/XwjeTtPr2xnTyU=; b=luD10TKva+VNECYNN4ACx+B7JY
	ZJhGuJI4pZH18xAPLSlTYCdy7Ks87VY56d6Cyfe74sTHJg0dUzj5ev6iLopxflXCXk5VyyUd8vTpv
	/7EtdkzQggBmUqiI/8jg30lBvF2mKKTlqV2Uwgmbj0XGdmbAHk+kT5I3pXGjUUCgVDRVMemAHvW72
	AkpqX/LMcPpYUtYhCsNHQhlmVE32En+tDes/lk7XrYJQFv7iihcqCk9RkePK/V9mSivMVzdc0Z059
	pxsb+Tk5CA8GVxdZyUxxCA6ZpH+GPHPr8O76xtsBbu/Ixa5rbiPFe48ir37gH45jDTcE4SXviRoNm
	u889laKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5U1C-0000000E3Jc-0sm2;
	Thu, 17 Apr 2025 18:31:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Tx4-0000000E2GF-2CTR;
	Thu, 17 Apr 2025 18:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3C9149E43;
	Thu, 17 Apr 2025 18:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241E8C4CEEC;
	Thu, 17 Apr 2025 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914425;
	bh=eYlw8AhwDiKSQwbJxBZMP6nL7U7/odFuPU2SW3GNcIs=;
	h=From:To:Cc:Subject:Date:From;
	b=OIGe0C4HhyE/SwSQmKx2rHmtBTJv+C//vsUPyHQ9nBNZ7SM70FI5kAjNOXx0SiPAT
	 oAV2RDvW3y7SexpSfNzDbW3E0WnI97wnBu7vd0ixGUtDVT++ajf0iwHpYPkfRoPvP9
	 dT4SFF4LmjWuyS23J7I28QPr2BOEobjN9OeNUvVqomFKSjPZoUnpDk/aJjRQhRsRIa
	 2jmz2BHEDWHCJM4wvqlkIeqwkGTdW4f9UXQwxbXtBHS8en8Ihmr+5OuGxO4m0tt2DT
	 hAvSXPNfuhibOtdvN7de1S4/+B2pChejRWcf0/OP2SYlBqQ90ckVcnffrq7XEP05h7
	 kOgQb7+Go6l8A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 00/15] Finish disentangling ChaCha, Poly1305, and BLAKE2s from CRYPTO
Date: Thu, 17 Apr 2025 11:26:08 -0700
Message-ID: <20250417182623.67808-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_112706_585331_713CD3CC 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

This series removes the unnecessary dependency of the ChaCha, Poly1305,
and BLAKE2s library functions on the generic crypto infrastructure, i.e.
CONFIG_CRYPTO.  To do this, it moves arch/*/crypto/Kconfig from a
submenu of crypto/Kconfig to a submenu of arch/*/Kconfig, then re-adds
the CRYPTO dependency to the symbols that actually need it.

Patches 14-15 then simplify the ChaCha and Poly1305 symbols by removing
the unneeded "internal" symbols.

Note that Curve25519 is still entangled.  Later patches will fix that.

Eric Biggers (15):
  crypto: arm - remove CRYPTO dependency of library functions
  crypto: arm64 - drop redundant dependencies on ARM64
  crypto: arm64 - remove CRYPTO dependency of library functions
  crypto: loongarch - source arch/loongarch/crypto/Kconfig without
    CRYPTO
  crypto: mips - remove CRYPTO dependency of library functions
  crypto: powerpc - drop redundant dependencies on PPC
  crypto: powerpc - remove CRYPTO dependency of library functions
  crypto: riscv - remove CRYPTO dependency of library functions
  crypto: s390 - drop redundant dependencies on S390
  crypto: s390 - remove CRYPTO dependency of library functions
  crypto: sparc - source arch/sparc/crypto/Kconfig without CRYPTO
  crypto: x86 - drop redundant dependencies on X86
  crypto: x86 - remove CRYPTO dependency of library functions
  crypto: lib/chacha - remove INTERNAL symbol and selection of CRYPTO
  crypto: lib/poly1305 - remove INTERNAL symbol and selection of CRYPTO

 arch/arm/Kconfig            |  2 ++
 arch/arm/crypto/Kconfig     | 28 ++++++++-------
 arch/arm64/Kconfig          |  3 +-
 arch/arm64/crypto/Kconfig   | 45 ++++++++++++-----------
 arch/loongarch/Kconfig      |  1 +
 arch/mips/Kconfig           |  2 ++
 arch/mips/crypto/Kconfig    | 12 +++----
 arch/powerpc/Kconfig        |  2 ++
 arch/powerpc/crypto/Kconfig | 22 ++++++------
 arch/riscv/Kconfig          |  2 ++
 arch/riscv/crypto/Kconfig   | 14 ++++----
 arch/s390/Kconfig           |  4 +++
 arch/s390/crypto/Kconfig    | 21 ++++++-----
 arch/sparc/Kconfig          |  2 ++
 arch/sparc/crypto/Kconfig   | 14 ++++----
 arch/x86/Kconfig            |  4 +++
 arch/x86/crypto/Kconfig     | 72 ++++++++++++++++++-------------------
 crypto/Kconfig              | 34 ++----------------
 lib/crypto/Kconfig          | 32 ++++++-----------
 19 files changed, 149 insertions(+), 167 deletions(-)


base-commit: da4cb617bc7d827946cbb368034940b379a1de90
-- 
2.49.0


