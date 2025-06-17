Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11EFC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QCkOlL+4+seiO2+WL3DoxSOsmGY8RtBk/qJCXZ3ylYI=; b=P8WCHJxHzI1wfe5vsdb79bcj/a
	NQMKMiL2Zp06FAca3C5OHoGYhw65yeex6dOP07o7aZ/OcFqsZkmPT7RcANXV6fDgO65+QjCVfKjNU
	wZllQvYauthTUdiw6DhDqaG55VAuf2YqI+gQ2RIi+bB7llX1gLy1ySw6xXTmcgHNgho48DhM8Q3Dk
	Lnb6TG3Ynvrgb5T6Jqps8spFlRENseyn7pV4EeBthgM62hGrUBM6OMn5S70LeZMxUft/hbtWGBzGj
	COCRK5FK+5csNeY3i4F1S39e/LONoeRs6BBg7iJW763loBUJWSY1sowwk1X3BxQLCCtyk27ZL0/rA
	LOxjm8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReqn-00000008WWz-1M2b;
	Tue, 17 Jun 2025 22:32:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReoZ-00000008VoE-024F;
	Tue, 17 Jun 2025 22:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1ABBA6111C;
	Tue, 17 Jun 2025 22:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70007C4CEE3;
	Tue, 17 Jun 2025 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199397;
	bh=0mROCvAkY84h3wsIpbNLCY1gzYL1020FxJLMgOjDJTY=;
	h=From:To:Cc:Subject:Date:From;
	b=n+7P/y3EpQYb9JC/xhcaAICmrBI9FlrvjdYlDCtennrygikav6it9ZSmPjELmu69A
	 +Zw+41ZhtHJEZMq4R/XTXsTuAIS5I3BgSGnqPpd+lwcem/AfJ+kqTuNi8JXZOo+FuD
	 P0rLGSV7Q+xFY6bWX6bfYAiA4s6Y2hEVD4ZFIT9wiBOfLtzXQgeDQ73o6vcFBnyDws
	 USOn8XsBOS9cmwle7zRncqZdHbuZgJIfnPjFzY5KkFkozqxlmNIH6zbfWdisNH4BdY
	 vitO8k2Xa+pTENrYSdz/WA3iDYjm72BKzMeNOq8bxdT8sz44cMaG0kxKkZv/oESAhx
	 pQAuGH0okF9nA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to lib/crypto/$(ARCH)/
Date: Tue, 17 Jun 2025 15:27:17 -0700
Message-ID: <20250617222726.365148-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
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

This series applies on top of
https://lore.kernel.org/r/20250616014019.415791-1-ebiggers@kernel.org/
and is also available in git at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v1

This series moves the contents of arch/$(ARCH)/lib/crypto/ into
lib/crypto/$(ARCH)/.

The new code organization makes a lot more sense for how this code
actually works and is developed.  In particular, it makes it possible to
build each algorithm as a single module, with better inlining and dead
code elimination.  For a more detailed explanation, see the patchset
which did this for the CRC library code:
https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
Also see the patchset which did this for SHA-512:
https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/

This is just a preparatory series, which does the move to get the files
into their new location but keeps them building the same way as before.
Later patch series will make the actual improvements to the way the
arch-optimized code is integrated for each algorithm.

Note that .gitignore files are being intentionally kept for now.  See
https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
I'll remove it later after some time has passed.

Eric Biggers (9):
  lib/crypto/arm: move arch/arm/lib/crypto/ to lib/crypto/arm/
  lib/crypto/arm64: move arch/arm64/lib/crypto/ to lib/crypto/arm64/
  lib/crypto/mips: move arch/mips/lib/crypto/ to lib/crypto/mips/
  lib/crypto/powerpc: move arch/powerpc/lib/crypto/ to
    lib/crypto/powerpc/
  lib/crypto/riscv: move arch/riscv/lib/crypto/ to lib/crypto/riscv/
  lib/crypto/s390: move arch/s390/lib/crypto/ to lib/crypto/s390/
  lib/crypto/sparc: move arch/sparc/lib/crypto/ to lib/crypto/sparc/
  lib/crypto/x86: move arch/x86/lib/crypto/ to lib/crypto/x86/
  MAINTAINERS: drop arch/*/lib/crypto/ pattern

 MAINTAINERS                                      |  1 -
 arch/arm/lib/Makefile                            |  2 --
 arch/arm64/lib/Makefile                          |  3 ---
 arch/mips/lib/Makefile                           |  2 --
 arch/powerpc/lib/Makefile                        |  2 --
 arch/riscv/lib/Makefile                          |  1 -
 arch/s390/lib/Makefile                           |  1 -
 arch/sparc/lib/Makefile                          |  1 -
 arch/x86/lib/Makefile                            |  2 --
 lib/crypto/Kconfig                               | 16 ++++++++--------
 lib/crypto/Makefile                              | 11 ++++++++++-
 lib/crypto/arm/.gitignore                        |  2 ++
 {arch/arm/lib/crypto => lib/crypto/arm}/Kconfig  |  0
 {arch/arm/lib/crypto => lib/crypto/arm}/Makefile |  0
 .../lib/crypto => lib/crypto/arm}/blake2s-core.S |  0
 .../lib/crypto => lib/crypto/arm}/blake2s-glue.c |  0
 .../lib/crypto => lib/crypto/arm}/chacha-glue.c  |  0
 .../crypto => lib/crypto/arm}/chacha-neon-core.S |  0
 .../crypto/arm}/chacha-scalar-core.S             |  0
 .../crypto => lib/crypto/arm}/poly1305-armv4.pl  |  0
 .../crypto => lib/crypto/arm}/poly1305-glue.c    |  0
 .../crypto => lib/crypto/arm}/sha256-armv4.pl    |  0
 .../lib/crypto => lib/crypto/arm}/sha256-ce.S    |  0
 {arch/arm/lib/crypto => lib/crypto/arm}/sha256.c |  0
 lib/crypto/arm64/.gitignore                      |  2 ++
 .../lib/crypto => lib/crypto/arm64}/Kconfig      |  0
 .../lib/crypto => lib/crypto/arm64}/Makefile     |  0
 .../crypto/arm64}/chacha-neon-core.S             |  0
 .../crypto/arm64}/chacha-neon-glue.c             |  0
 .../crypto/arm64}/poly1305-armv8.pl              |  0
 .../crypto => lib/crypto/arm64}/poly1305-glue.c  |  0
 .../crypto => lib/crypto/arm64}/sha2-armv8.pl    |  0
 .../lib/crypto => lib/crypto/arm64}/sha256-ce.S  |  0
 .../lib/crypto => lib/crypto/arm64}/sha256.c     |  0
 lib/crypto/mips/.gitignore                       |  2 ++
 .../mips/lib/crypto => lib/crypto/mips}/Kconfig  |  0
 .../mips/lib/crypto => lib/crypto/mips}/Makefile |  0
 .../lib/crypto => lib/crypto/mips}/chacha-core.S |  0
 .../lib/crypto => lib/crypto/mips}/chacha-glue.c |  0
 .../crypto => lib/crypto/mips}/poly1305-glue.c   |  0
 .../crypto => lib/crypto/mips}/poly1305-mips.pl  |  0
 .../lib/crypto => lib/crypto/powerpc}/Kconfig    |  0
 .../lib/crypto => lib/crypto/powerpc}/Makefile   |  0
 .../crypto/powerpc}/chacha-p10-glue.c            |  0
 .../crypto/powerpc}/chacha-p10le-8x.S            |  0
 .../crypto/powerpc}/poly1305-p10-glue.c          |  0
 .../crypto/powerpc}/poly1305-p10le_64.S          |  0
 .../crypto/powerpc}/sha256-spe-asm.S             |  0
 .../lib/crypto => lib/crypto/powerpc}/sha256.c   |  0
 .../lib/crypto => lib/crypto/riscv}/Kconfig      |  0
 .../lib/crypto => lib/crypto/riscv}/Makefile     |  0
 .../crypto/riscv}/chacha-riscv64-glue.c          |  0
 .../crypto/riscv}/chacha-riscv64-zvkb.S          |  0
 .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S       |  0
 .../lib/crypto => lib/crypto/riscv}/sha256.c     |  0
 .../s390/lib/crypto => lib/crypto/s390}/Kconfig  |  0
 .../s390/lib/crypto => lib/crypto/s390}/Makefile |  0
 .../lib/crypto => lib/crypto/s390}/chacha-glue.c |  0
 .../lib/crypto => lib/crypto/s390}/chacha-s390.S |  0
 .../lib/crypto => lib/crypto/s390}/chacha-s390.h |  0
 .../s390/lib/crypto => lib/crypto/s390}/sha256.c |  0
 .../lib/crypto => lib/crypto/sparc}/Kconfig      |  0
 .../lib/crypto => lib/crypto/sparc}/Makefile     |  0
 .../lib/crypto => lib/crypto/sparc}/sha256.c     |  0
 .../lib/crypto => lib/crypto/sparc}/sha256_asm.S |  0
 lib/crypto/x86/.gitignore                        |  2 ++
 {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig  |  0
 {arch/x86/lib/crypto => lib/crypto/x86}/Makefile |  0
 .../lib/crypto => lib/crypto/x86}/blake2s-core.S |  0
 .../lib/crypto => lib/crypto/x86}/blake2s-glue.c |  0
 .../crypto/x86}/chacha-avx2-x86_64.S             |  0
 .../crypto/x86}/chacha-avx512vl-x86_64.S         |  0
 .../crypto/x86}/chacha-ssse3-x86_64.S            |  0
 .../lib/crypto => lib/crypto/x86}/chacha_glue.c  |  0
 .../crypto/x86}/poly1305-x86_64-cryptogams.pl    |  0
 .../crypto => lib/crypto/x86}/poly1305_glue.c    |  0
 .../crypto => lib/crypto/x86}/sha256-avx-asm.S   |  0
 .../crypto => lib/crypto/x86}/sha256-avx2-asm.S  |  0
 .../crypto => lib/crypto/x86}/sha256-ni-asm.S    |  0
 .../crypto => lib/crypto/x86}/sha256-ssse3-asm.S |  0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c |  0
 81 files changed, 26 insertions(+), 24 deletions(-)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/Kconfig (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/Makefile (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-core.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-glue.c (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/chacha-glue.c (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/chacha-neon-core.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/chacha-scalar-core.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-armv4.pl (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-glue.c (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/sha256-armv4.pl (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/sha256-ce.S (100%)
 rename {arch/arm/lib/crypto => lib/crypto/arm}/sha256.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c (100%)
 create mode 100644 lib/crypto/mips/.gitignore
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Makefile (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Kconfig (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Makefile (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10le-8x.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10le_64.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256-spe-asm.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256.c (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Kconfig (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Makefile (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-glue.c (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.S (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.h (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/sha256.c (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Kconfig (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Makefile (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256.c (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256_asm.S (100%)
 create mode 100644 lib/crypto/x86/.gitignore
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Makefile (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-core.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx2-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx512vl-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-ssse3-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305-x86_64-cryptogams.pl (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx2-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ni-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ssse3-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c (100%)

-- 
2.49.0


