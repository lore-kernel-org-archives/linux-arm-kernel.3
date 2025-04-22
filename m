Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFB9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZL3xL18OqBepeI2rMRy6I/9dIf6929xtLwXTLCkttl8=; b=nQ5OuWe8lRTjE0z4OlRCF2SgXs
	FWjCEDHI1OdcNlfhGBDeCbSrb9ae0RVmKXsPGcrBjdPu7WRWX+YLsdCmoE6LgTHQZ76iArq4avTyL
	vitCwF+1fWYsv/b8gKkTy6+3yuXBPfYwQihgodFB0KxBqFCF4+RC42KIStsVG+ljn8rHJ7Fb5g/Jf
	u1RdC6/4yX4sPEntZsDkmabn3ARO+pXPr6PrST7zlohladiTsId2nndFraiOWq56awxbz8ITthY/j
	DOe3rwvtF2CUErdOOUSw36/MinRra2WUl+rSh5FwOFucFqXbJYbOJaCsrNwnXyvrPwOV7jWHX5Blq
	nOyEZ8RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I94-000000086Ps-2NDq;
	Tue, 22 Apr 2025 18:14:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FXt-00000007iSm-2O1f;
	Tue, 22 Apr 2025 15:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZL3xL18OqBepeI2rMRy6I/9dIf6929xtLwXTLCkttl8=; b=eJPD97AbKpNrmSQzmX34BO2dRj
	eJoN0H4CZq3NbSLTTL0KtVBhngB69oX81eDr0jNaHpYT3MhxIAtoNo/4TMk7Wn6YCtJXhyuFdohp5
	gcTZZJlU5g9PPEc7Bbt3DnaFpbFSUKa+n2Z4+ODZ3ZkDFiDAu9bEmEXOublpBaa0iL/XJZSy+RpvS
	gcWTdIOtKun9ZRvIAyQlzbrfQA9OdDHQ+NGYYv9VqCFfyBmhhOePoZEEaVyLKmauORnSYiOAaQqPA
	itwCaoZXfu5+BBTHz+82WtoqJlGKnM+Hs78pRslycZLlPdaeADVbcZE42nONDciNEvJ9qlUqFMBoZ
	XuHtuFYQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7FXp-0000000BFWX-0enn;
	Tue, 22 Apr 2025 15:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 862564A95A;
	Tue, 22 Apr 2025 15:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901F7C4CEF0;
	Tue, 22 Apr 2025 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335697;
	bh=qN/B6X2mvQN94BK3RyJeOZTVFWohKhnnWgVazqat/cI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qCNc0DKFbLWtkplqTtT13CfwTQE6PaHVBBB82/X3fpAVVgtphrM7DaoQyH455ZtOA
	 3od7qCZHN+hjsgHwHoLLaoYUvUy0n4ZLD8MXqabiEQnfE8b0eEYnokQm4XP7Z6lAec
	 EXcafR4+DRXVWUUo+U3YX0MI9revROjD3N+FINWhLx2ySRUQS+CtMP5XWtT7z1Bse+
	 sWKjSYAtxfBtHbgvbh8/qo8Ii1gZwC22fBFUmufECRvIgkgizSl0vTv5e3ZptSKsYc
	 BMjVjUSfg43cgoox7tDqaWuq1v9tK+qmeq9iIGiYy9qynq949O7WRuHB2Su5l2kxzE
	 OsTl37h8/3eAg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 07/13] crypto: mips - move library functions to arch/mips/lib/crypto/
Date: Tue, 22 Apr 2025 08:27:10 -0700
Message-ID: <20250422152716.5923-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_162821_551748_C2550CEF 
X-CRM114-Status: GOOD (  14.85  )
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

Continue disentangling the crypto library functions from the generic
crypto infrastructure by moving the mips ChaCha and Poly1305 library
functions into a new directory arch/mips/lib/crypto/ that does not
depend on CRYPTO.  This mirrors the distinction between crypto/ and
lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/crypto/Kconfig                    | 11 -----------
 arch/mips/crypto/Makefile                   | 17 -----------------
 arch/mips/lib/Makefile                      |  2 ++
 arch/mips/lib/crypto/.gitignore             |  2 ++
 arch/mips/lib/crypto/Kconfig                | 12 ++++++++++++
 arch/mips/lib/crypto/Makefile               | 19 +++++++++++++++++++
 arch/mips/{ => lib}/crypto/chacha-core.S    |  0
 arch/mips/{ => lib}/crypto/chacha-glue.c    |  0
 arch/mips/{ => lib}/crypto/poly1305-glue.c  |  0
 arch/mips/{ => lib}/crypto/poly1305-mips.pl |  0
 lib/crypto/Kconfig                          |  3 +++
 11 files changed, 38 insertions(+), 28 deletions(-)
 create mode 100644 arch/mips/lib/crypto/.gitignore
 create mode 100644 arch/mips/lib/crypto/Kconfig
 create mode 100644 arch/mips/lib/crypto/Makefile
 rename arch/mips/{ => lib}/crypto/chacha-core.S (100%)
 rename arch/mips/{ => lib}/crypto/chacha-glue.c (100%)
 rename arch/mips/{ => lib}/crypto/poly1305-glue.c (100%)
 rename arch/mips/{ => lib}/crypto/poly1305-mips.pl (100%)

diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 8283664a1f24b..9db1fd6d9f0e0 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -1,14 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
-config CRYPTO_POLY1305_MIPS
-	tristate
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
-
 config CRYPTO_MD5_OCTEON
 	tristate "Digests: MD5 (OCTEON)"
 	depends on CPU_CAVIUM_OCTEON
 	select CRYPTO_MD5
 	select CRYPTO_HASH
@@ -45,12 +40,6 @@ config CRYPTO_SHA512_OCTEON
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: mips OCTEON using crypto instructions, when available
 
-config CRYPTO_CHACHA_MIPS
-	tristate
-	depends on CPU_MIPS32_R2
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 endmenu
diff --git a/arch/mips/crypto/Makefile b/arch/mips/crypto/Makefile
index fddc882814123..5adb631a69c18 100644
--- a/arch/mips/crypto/Makefile
+++ b/arch/mips/crypto/Makefile
@@ -1,22 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for MIPS crypto files..
 #
 
-obj-$(CONFIG_CRYPTO_CHACHA_MIPS) += chacha-mips.o
-chacha-mips-y := chacha-core.o chacha-glue.o
-AFLAGS_chacha-core.o += -O2 # needed to fill branch delay slots
-
-obj-$(CONFIG_CRYPTO_POLY1305_MIPS) += poly1305-mips.o
-poly1305-mips-y := poly1305-core.o poly1305-glue.o
-
-perlasm-flavour-$(CONFIG_32BIT) := o32
-perlasm-flavour-$(CONFIG_64BIT) := 64
-
-quiet_cmd_perlasm = PERLASM $@
-      cmd_perlasm = $(PERL) $(<) $(perlasm-flavour-y) $(@)
-
-$(obj)/poly1305-core.S: $(src)/poly1305-mips.pl FORCE
-	$(call if_changed,perlasm)
-
-targets += poly1305-core.S
diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
index 9c024e6d5e54c..9d75845ef78e1 100644
--- a/arch/mips/lib/Makefile
+++ b/arch/mips/lib/Makefile
@@ -1,10 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for MIPS-specific library files..
 #
 
+obj-y	+= crypto/
+
 lib-y	+= bitops.o csum_partial.o delay.o memcpy.o memset.o \
 	   mips-atomic.o strncpy_user.o \
 	   strnlen_user.o uncached.o
 
 obj-y			+= iomap_copy.o
diff --git a/arch/mips/lib/crypto/.gitignore b/arch/mips/lib/crypto/.gitignore
new file mode 100644
index 0000000000000..0d47d4f21c6de
--- /dev/null
+++ b/arch/mips/lib/crypto/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
diff --git a/arch/mips/lib/crypto/Kconfig b/arch/mips/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..5b82ba753c55c
--- /dev/null
+++ b/arch/mips/lib/crypto/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA_MIPS
+	tristate
+	depends on CPU_MIPS32_R2
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+
+config CRYPTO_POLY1305_MIPS
+	tristate
+	default CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
diff --git a/arch/mips/lib/crypto/Makefile b/arch/mips/lib/crypto/Makefile
new file mode 100644
index 0000000000000..804488c7adedc
--- /dev/null
+++ b/arch/mips/lib/crypto/Makefile
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA_MIPS) += chacha-mips.o
+chacha-mips-y := chacha-core.o chacha-glue.o
+AFLAGS_chacha-core.o += -O2 # needed to fill branch delay slots
+
+obj-$(CONFIG_CRYPTO_POLY1305_MIPS) += poly1305-mips.o
+poly1305-mips-y := poly1305-core.o poly1305-glue.o
+
+perlasm-flavour-$(CONFIG_32BIT) := o32
+perlasm-flavour-$(CONFIG_64BIT) := 64
+
+quiet_cmd_perlasm = PERLASM $@
+      cmd_perlasm = $(PERL) $(<) $(perlasm-flavour-y) $(@)
+
+$(obj)/poly1305-core.S: $(src)/poly1305-mips.pl FORCE
+	$(call if_changed,perlasm)
+
+targets += poly1305-core.S
diff --git a/arch/mips/crypto/chacha-core.S b/arch/mips/lib/crypto/chacha-core.S
similarity index 100%
rename from arch/mips/crypto/chacha-core.S
rename to arch/mips/lib/crypto/chacha-core.S
diff --git a/arch/mips/crypto/chacha-glue.c b/arch/mips/lib/crypto/chacha-glue.c
similarity index 100%
rename from arch/mips/crypto/chacha-glue.c
rename to arch/mips/lib/crypto/chacha-glue.c
diff --git a/arch/mips/crypto/poly1305-glue.c b/arch/mips/lib/crypto/poly1305-glue.c
similarity index 100%
rename from arch/mips/crypto/poly1305-glue.c
rename to arch/mips/lib/crypto/poly1305-glue.c
diff --git a/arch/mips/crypto/poly1305-mips.pl b/arch/mips/lib/crypto/poly1305-mips.pl
similarity index 100%
rename from arch/mips/crypto/poly1305-mips.pl
rename to arch/mips/lib/crypto/poly1305-mips.pl
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 7395234d654b7..c5c01bc3569d5 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -160,8 +160,11 @@ if ARM
 source "arch/arm/lib/crypto/Kconfig"
 endif
 if ARM64
 source "arch/arm64/lib/crypto/Kconfig"
 endif
+if MIPS
+source "arch/mips/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


