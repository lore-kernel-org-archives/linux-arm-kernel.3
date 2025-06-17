Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC14C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 22:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6vNYcUym8RCs26HgEjsfbBhYr1Uldra33+azUd+Zes=; b=ME5jJ3Ew5uufwdoAILiQoVdhu8
	FHMxiXgkBSzKUCsr5ir3jqbW6DOfozamjmOFTcsU/pm6o9SLPOOs+IY6BhdQGA6IALiuhvCMjEksZ
	ILL0QXJv8Fijybv9jSwjyvAo1wKkU/D4FQwIh/idpkDDsU5JO4lnAyXPv98fbolblYM4i/Tp1Po8P
	FBETcRgBxMO8+IRR2wPRJakjdqHgoX6JFl8z31n1InVPgOrsuxxGS7usdNVJ3eySSiirg63CaQnrL
	uWJukm6B39DfJBQAcQ0zjEDOqRD3b1Neq7ZWSf+WMqhqHAYKqnPD1lj2LEDhZLYe60b3hbPh8rGwd
	FEKj3oYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRf1h-00000008Xqz-0xwk;
	Tue, 17 Jun 2025 22:43:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReoa-00000008Vow-0DiZ;
	Tue, 17 Jun 2025 22:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6540CA51FA0;
	Tue, 17 Jun 2025 22:29:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FA9C4CEF4;
	Tue, 17 Jun 2025 22:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199399;
	bh=oCGOvLpHCL5W2ZkDZ9iwmUr1h9xflh/WVFokVkwiIvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n1fuKE+TjvzwwIHuJptm/lhdma0jKIIADvDgWHzfPYyYFio+dkbFs7FIv9V1NUhzw
	 eiB4FeGixs00EnV5P6vBG1ZeOH76sq/OJstlcRiC81xjcSu+QyeTS5HtsNpTbhD1at
	 mEyLi4ZMek6U6bMjEcoNG+lkO/t5FqtznVB9HbCzmIXMT6+FqNqbsGpLx14LdkqHT4
	 tw2DrPFc29LKD0L1H/UcE6TL5RIwAPuUyPQ+Z0E1MDEOM2gslkZUQbmNiPu8rm3LtW
	 ykrREDXGIrMAvbjOjlF+Zbi2cIkZ1KBG6TsLvUm8eQdW6gYkspQHMrsewp9fC8QV0r
	 hSkxiDSJr1Flg==
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
Subject: [PATCH 3/9] lib/crypto/mips: move arch/mips/lib/crypto/ to lib/crypto/mips/
Date: Tue, 17 Jun 2025 15:27:20 -0700
Message-ID: <20250617222726.365148-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_153000_234153_38B60B15 
X-CRM114-Status: GOOD (  16.07  )
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

Move the contents of arch/mips/lib/crypto/ into lib/crypto/mips/.

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

arch/mips/lib/crypto/.gitignore is intentionally kept for now.  See
https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
I'll remove it later after some time has passed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/lib/Makefile                                     | 2 --
 lib/crypto/Kconfig                                         | 2 +-
 lib/crypto/Makefile                                        | 1 +
 lib/crypto/mips/.gitignore                                 | 2 ++
 {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig          | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/Makefile         | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c  | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl | 0
 10 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 lib/crypto/mips/.gitignore
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Makefile (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl (100%)

diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
index 9d75845ef78e1..9c024e6d5e54c 100644
--- a/arch/mips/lib/Makefile
+++ b/arch/mips/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for MIPS-specific library files..
 #
 
-obj-y	+= crypto/
-
 lib-y	+= bitops.o csum_partial.o delay.o memcpy.o memset.o \
 	   mips-atomic.o strncpy_user.o \
 	   strnlen_user.o uncached.o
 
 obj-y			+= iomap_copy.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index fdeb91bf00328..43c44316fbbdc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -194,11 +194,11 @@ source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
 source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
-source "arch/mips/lib/crypto/Kconfig"
+source "lib/crypto/mips/Kconfig"
 endif
 if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
 if RISCV
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 63ab907e8f53b..74331243b8c44 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -103,5 +103,6 @@ obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
+obj-$(CONFIG_MIPS) += mips/
diff --git a/lib/crypto/mips/.gitignore b/lib/crypto/mips/.gitignore
new file mode 100644
index 0000000000000..0d47d4f21c6de
--- /dev/null
+++ b/lib/crypto/mips/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
diff --git a/arch/mips/lib/crypto/Kconfig b/lib/crypto/mips/Kconfig
similarity index 100%
rename from arch/mips/lib/crypto/Kconfig
rename to lib/crypto/mips/Kconfig
diff --git a/arch/mips/lib/crypto/Makefile b/lib/crypto/mips/Makefile
similarity index 100%
rename from arch/mips/lib/crypto/Makefile
rename to lib/crypto/mips/Makefile
diff --git a/arch/mips/lib/crypto/chacha-core.S b/lib/crypto/mips/chacha-core.S
similarity index 100%
rename from arch/mips/lib/crypto/chacha-core.S
rename to lib/crypto/mips/chacha-core.S
diff --git a/arch/mips/lib/crypto/chacha-glue.c b/lib/crypto/mips/chacha-glue.c
similarity index 100%
rename from arch/mips/lib/crypto/chacha-glue.c
rename to lib/crypto/mips/chacha-glue.c
diff --git a/arch/mips/lib/crypto/poly1305-glue.c b/lib/crypto/mips/poly1305-glue.c
similarity index 100%
rename from arch/mips/lib/crypto/poly1305-glue.c
rename to lib/crypto/mips/poly1305-glue.c
diff --git a/arch/mips/lib/crypto/poly1305-mips.pl b/lib/crypto/mips/poly1305-mips.pl
similarity index 100%
rename from arch/mips/lib/crypto/poly1305-mips.pl
rename to lib/crypto/mips/poly1305-mips.pl
-- 
2.49.0


