Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66887C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yDurYd6msfoL8mSdL6axYYnHQRG9iT7rHPbJKFYp8Q=; b=NvIlXfkN3u3yA8NI5Yq3E99Gtn
	5fJIYko5/i/YP8kXs3gcCu/LsHM6FBJ3r1BMAmKgypdH7Isw45rq6sphK04+kyPxYRPlGZJ2OdD5C
	sBXLqBZL1FG5EPvMtswofrwaBVzgHJXovOpawioe6nrT7QGbBgbyhB+ivUElVDXGlPrJoJXlYU9kR
	I3AOgChr+GKTymNhh6KNQG6DaOH50ZGre4dk9qG/oZXNLN2GglGh00RnJmIuDxyXNo2UGgNruwvu/
	VZ0Ub8S9FvUtZh9gncsUWpSkiAatEyZKCVATR21rxeBIuLS+Y2UiBgWLzq6cU9AR36gHbfT2o0qLF
	dG1PtWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRexL-00000008XTM-0pe3;
	Tue, 17 Jun 2025 22:39:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReoZ-00000008Vot-3uT1;
	Tue, 17 Jun 2025 22:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 192B4A51F9C;
	Tue, 17 Jun 2025 22:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67248C4CEF3;
	Tue, 17 Jun 2025 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199398;
	bh=C+iLWRA20P3X1lC1oFCgQmxMpv2O73JWlAx7pptA2cY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZsitZocB41oAkkPQyvyXhXqiDNBnwaQ4sEvYshVLiXH0oyCVKXGvTAevOMFGVIEXZ
	 kY1+mTaemqobfKe0sOeuuj68Zz7appHM4k1I/jZo0BU74IUNttSmxDTT4QYvsKuDRy
	 Ps8+5uHMzGuXGa43J+UoxBdxpSZPHyX2qdljDE8scEg6gpN6e5g2AAWzADmurzXi7m
	 PZjqnql0C+Rx2OST5bGfXe01e9aFZHwdZeHEs8LkvKLvDqNOLh4w2PgjfltJAPenrh
	 jHKU5sXenFTuzL1pN5dCSIqwv0sAHMk+qgmIrOtUv7vnxE5wEfqvNn2t71+RbVOFFb
	 FMPN33q43wcZQ==
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
Subject: [PATCH 2/9] lib/crypto/arm64: move arch/arm64/lib/crypto/ to lib/crypto/arm64/
Date: Tue, 17 Jun 2025 15:27:19 -0700
Message-ID: <20250617222726.365148-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_153000_117418_107742E4 
X-CRM114-Status: GOOD (  12.68  )
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

Move the contents of arch/arm64/lib/crypto/ into lib/crypto/arm64/.

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

arch/arm64/lib/crypto/.gitignore is intentionally kept for now.  See
https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
I'll remove it later after some time has passed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/Makefile                                        | 3 ---
 lib/crypto/Kconfig                                             | 2 +-
 lib/crypto/Makefile                                            | 3 ++-
 lib/crypto/arm64/.gitignore                                    | 2 ++
 {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig            | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile           | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl  | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c    | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl      | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S        | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c           | 0
 13 files changed, 5 insertions(+), 5 deletions(-)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c (100%)

diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 027bfa9689c6a..d97e290619bc5 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-
-obj-y += crypto/
-
 lib-y		:= clear_user.o delay.o copy_from_user.o		\
 		   copy_to_user.o copy_page.o				\
 		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
 		   memset.o memcmp.o strcmp.o strncmp.o strlen.o	\
 		   strnlen.o strchr.o strrchr.o tishift.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index e14bef8e87af2..fdeb91bf00328 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -191,11 +191,11 @@ config CRYPTO_LIB_SM3
 if !KMSAN # avoid false positives from assembly
 if ARM
 source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
-source "arch/arm64/lib/crypto/Kconfig"
+source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
 source "arch/mips/lib/crypto/Kconfig"
 endif
 if PPC
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index ddf04e2270f1e..63ab907e8f53b 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -81,11 +81,11 @@ clean-files += arm/sha512-core.S
 AFLAGS_arm/sha512-core.o += $(aflags-thumb2-y)
 endif
 
 ifeq ($(CONFIG_ARM64),y)
 libsha512-y += arm64/sha512-core.o
-$(obj)/arm64/sha512-core.S: $(src)/../../arch/arm64/lib/crypto/sha2-armv8.pl
+$(obj)/arm64/sha512-core.S: $(src)/arm64/sha2-armv8.pl
 	$(call cmd,perlasm_with_args)
 clean-files += arm64/sha512-core.S
 libsha512-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha512-ce-core.o
 endif
 
@@ -102,5 +102,6 @@ obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
+obj-$(CONFIG_ARM64) += arm64/
diff --git a/lib/crypto/arm64/.gitignore b/lib/crypto/arm64/.gitignore
index 670a4d97b5684..f6c4e8ef80dae 100644
--- a/lib/crypto/arm64/.gitignore
+++ b/lib/crypto/arm64/.gitignore
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
+sha256-core.S
 sha512-core.S
diff --git a/arch/arm64/lib/crypto/Kconfig b/lib/crypto/arm64/Kconfig
similarity index 100%
rename from arch/arm64/lib/crypto/Kconfig
rename to lib/crypto/arm64/Kconfig
diff --git a/arch/arm64/lib/crypto/Makefile b/lib/crypto/arm64/Makefile
similarity index 100%
rename from arch/arm64/lib/crypto/Makefile
rename to lib/crypto/arm64/Makefile
diff --git a/arch/arm64/lib/crypto/chacha-neon-core.S b/lib/crypto/arm64/chacha-neon-core.S
similarity index 100%
rename from arch/arm64/lib/crypto/chacha-neon-core.S
rename to lib/crypto/arm64/chacha-neon-core.S
diff --git a/arch/arm64/lib/crypto/chacha-neon-glue.c b/lib/crypto/arm64/chacha-neon-glue.c
similarity index 100%
rename from arch/arm64/lib/crypto/chacha-neon-glue.c
rename to lib/crypto/arm64/chacha-neon-glue.c
diff --git a/arch/arm64/lib/crypto/poly1305-armv8.pl b/lib/crypto/arm64/poly1305-armv8.pl
similarity index 100%
rename from arch/arm64/lib/crypto/poly1305-armv8.pl
rename to lib/crypto/arm64/poly1305-armv8.pl
diff --git a/arch/arm64/lib/crypto/poly1305-glue.c b/lib/crypto/arm64/poly1305-glue.c
similarity index 100%
rename from arch/arm64/lib/crypto/poly1305-glue.c
rename to lib/crypto/arm64/poly1305-glue.c
diff --git a/arch/arm64/lib/crypto/sha2-armv8.pl b/lib/crypto/arm64/sha2-armv8.pl
similarity index 100%
rename from arch/arm64/lib/crypto/sha2-armv8.pl
rename to lib/crypto/arm64/sha2-armv8.pl
diff --git a/arch/arm64/lib/crypto/sha256-ce.S b/lib/crypto/arm64/sha256-ce.S
similarity index 100%
rename from arch/arm64/lib/crypto/sha256-ce.S
rename to lib/crypto/arm64/sha256-ce.S
diff --git a/arch/arm64/lib/crypto/sha256.c b/lib/crypto/arm64/sha256.c
similarity index 100%
rename from arch/arm64/lib/crypto/sha256.c
rename to lib/crypto/arm64/sha256.c
-- 
2.49.0


