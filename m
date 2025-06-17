Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC071C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0I2b5U+Xv81Zn8s0sdSKH8/oDhCFkwv0ShdSLVv9ycM=; b=Z3iqOUN7QVomWm0zgZgaMZ0mMk
	l5brxVfZFq+Pi/mGe8xbCn79QKMKu8KePg9yOUbJylChtEdSg2uwnKorXfk/Qjy7XioClqlUakGxp
	VoYoZtcUEipROYxan6jBe5WJL8Fu71Gk9aLO3DupTQiWFW7qegYwwaFAmlICx5xtxXNYQvcjxMuqT
	Uc2h480t2TkOPmt+9LEZAoo96KEBgnJvwqk34EfjuoRPKSaVv3Lg+HpbGaSxKXS4tDqBMKjynK8PK
	0jqwmCi1++V2a1oQxLrZeYZtV74JBFB0M58oOHxoWXSZRGM8TYGj2Gta6vSAQtsaFqrf4WN34iwPH
	a+NxhZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uResy-00000008Wzm-2MwO;
	Tue, 17 Jun 2025 22:34:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReoY-00000008VoG-2u1b;
	Tue, 17 Jun 2025 22:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 642494A5C3;
	Tue, 17 Jun 2025 22:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8544C4CEF1;
	Tue, 17 Jun 2025 22:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199398;
	bh=E1R8tZTC4zFm0PByz0jO522hOoQZFenFe04oUA8okGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r876IishAxc+pn2+pvqnZzqka17ASUqbTJbVRTqL20VRsiOnlfPiaMkAv817AJJGh
	 sGqJN5H8LVXpj+EKPjnSUI4g4bTGgDzjvYDTevWAqxOIJW7cZMQnFRL/rKd5FUWHBK
	 HgheC4z3wqYI5pUZgOIWex2e4xR9XOKNKtQEdUGLG6fC7ioQP9legtxFA6s9JQn8ZL
	 aiRtEdfX93s7BmvRkX5toKuNEtqtwx//Ifm3dTZ/U1mv5DGcLJ7IT8KeNXQLRl14vx
	 w11r8GkTWnZDuj78P/14I5ydg6GH7U5Wsl5SF6OjemIAnpyTIQxf4bVkYOTIlsAjQd
	 KaO82TpsNYkCA==
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
Subject: [PATCH 1/9] lib/crypto/arm: move arch/arm/lib/crypto/ to lib/crypto/arm/
Date: Tue, 17 Jun 2025 15:27:18 -0700
Message-ID: <20250617222726.365148-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_152958_780942_31AA9F03 
X-CRM114-Status: GOOD (  13.18  )
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

From: Eric Biggers <ebiggers@google.com>

Move the contents of arch/arm/lib/crypto/ into lib/crypto/arm/.

The new code organization makes a lot more sense for how this code
actually works and is developed.  In particular, it makes it possible to
build each algorithm as a single module, with better inlining and dead
code elimination.  For a more detailed explanation, see the patchset
which did this for the CRC library code:
https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
Also see the patchset which did this for SHA-512:
https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/

This is just a preparatory commit, which does the move to get the files
into their new location but keeps them building the same way as before.
Later commits will make the actual improvements to the way the
arch-optimized code is integrated for each algorithm.

arch/arm/lib/crypto/.gitignore is intentionally kept for now.  See
https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
I'll remove it later after some time has passed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/lib/Makefile                                        | 2 --
 lib/crypto/Kconfig                                           | 2 +-
 lib/crypto/Makefile                                          | 2 ++
 lib/crypto/arm/.gitignore                                    | 2 ++
 {arch/arm/lib/crypto => lib/crypto/arm}/Kconfig              | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/Makefile             | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-core.S       | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/blake2s-glue.c       | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/chacha-glue.c        | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/chacha-neon-core.S   | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/chacha-scalar-core.S | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-armv4.pl    | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/poly1305-glue.c      | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/sha256-armv4.pl      | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/sha256-ce.S          | 0
 {arch/arm/lib/crypto => lib/crypto/arm}/sha256.c             | 0
 16 files changed, 5 insertions(+), 3 deletions(-)
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

diff --git a/arch/arm/lib/Makefile b/arch/arm/lib/Makefile
index 91ea0e29107af..d05dd672bcd9c 100644
--- a/arch/arm/lib/Makefile
+++ b/arch/arm/lib/Makefile
@@ -3,12 +3,10 @@
 # linux/arch/arm/lib/Makefile
 #
 # Copyright (C) 1995-2000 Russell King
 #
 
-obj-y += crypto/
-
 lib-y		:= changebit.o csumipv6.o csumpartial.o               \
 		   csumpartialcopy.o csumpartialcopyuser.o clearbit.o \
 		   delay.o delay-loop.o findbit.o memchr.o memcpy.o   \
 		   memmove.o memset.o setbit.o                        \
 		   strchr.o strrchr.o                                 \
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index dce127a69f131..e14bef8e87af2 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -188,11 +188,11 @@ config CRYPTO_LIB_SHA512_ARCH
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
 if ARM
-source "arch/arm/lib/crypto/Kconfig"
+source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
 source "arch/arm64/lib/crypto/Kconfig"
 endif
 if MIPS
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 4a76169de251b..ddf04e2270f1e 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -100,5 +100,7 @@ obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
+
+obj-$(CONFIG_ARM) += arm/
diff --git a/lib/crypto/arm/.gitignore b/lib/crypto/arm/.gitignore
index 670a4d97b5684..f6c4e8ef80dae 100644
--- a/lib/crypto/arm/.gitignore
+++ b/lib/crypto/arm/.gitignore
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
+sha256-core.S
 sha512-core.S
diff --git a/arch/arm/lib/crypto/Kconfig b/lib/crypto/arm/Kconfig
similarity index 100%
rename from arch/arm/lib/crypto/Kconfig
rename to lib/crypto/arm/Kconfig
diff --git a/arch/arm/lib/crypto/Makefile b/lib/crypto/arm/Makefile
similarity index 100%
rename from arch/arm/lib/crypto/Makefile
rename to lib/crypto/arm/Makefile
diff --git a/arch/arm/lib/crypto/blake2s-core.S b/lib/crypto/arm/blake2s-core.S
similarity index 100%
rename from arch/arm/lib/crypto/blake2s-core.S
rename to lib/crypto/arm/blake2s-core.S
diff --git a/arch/arm/lib/crypto/blake2s-glue.c b/lib/crypto/arm/blake2s-glue.c
similarity index 100%
rename from arch/arm/lib/crypto/blake2s-glue.c
rename to lib/crypto/arm/blake2s-glue.c
diff --git a/arch/arm/lib/crypto/chacha-glue.c b/lib/crypto/arm/chacha-glue.c
similarity index 100%
rename from arch/arm/lib/crypto/chacha-glue.c
rename to lib/crypto/arm/chacha-glue.c
diff --git a/arch/arm/lib/crypto/chacha-neon-core.S b/lib/crypto/arm/chacha-neon-core.S
similarity index 100%
rename from arch/arm/lib/crypto/chacha-neon-core.S
rename to lib/crypto/arm/chacha-neon-core.S
diff --git a/arch/arm/lib/crypto/chacha-scalar-core.S b/lib/crypto/arm/chacha-scalar-core.S
similarity index 100%
rename from arch/arm/lib/crypto/chacha-scalar-core.S
rename to lib/crypto/arm/chacha-scalar-core.S
diff --git a/arch/arm/lib/crypto/poly1305-armv4.pl b/lib/crypto/arm/poly1305-armv4.pl
similarity index 100%
rename from arch/arm/lib/crypto/poly1305-armv4.pl
rename to lib/crypto/arm/poly1305-armv4.pl
diff --git a/arch/arm/lib/crypto/poly1305-glue.c b/lib/crypto/arm/poly1305-glue.c
similarity index 100%
rename from arch/arm/lib/crypto/poly1305-glue.c
rename to lib/crypto/arm/poly1305-glue.c
diff --git a/arch/arm/lib/crypto/sha256-armv4.pl b/lib/crypto/arm/sha256-armv4.pl
similarity index 100%
rename from arch/arm/lib/crypto/sha256-armv4.pl
rename to lib/crypto/arm/sha256-armv4.pl
diff --git a/arch/arm/lib/crypto/sha256-ce.S b/lib/crypto/arm/sha256-ce.S
similarity index 100%
rename from arch/arm/lib/crypto/sha256-ce.S
rename to lib/crypto/arm/sha256-ce.S
diff --git a/arch/arm/lib/crypto/sha256.c b/lib/crypto/arm/sha256.c
similarity index 100%
rename from arch/arm/lib/crypto/sha256.c
rename to lib/crypto/arm/sha256.c
-- 
2.49.0


