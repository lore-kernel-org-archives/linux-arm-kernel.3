Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13F8C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4/iVPOekibSVcXx6xn/2OFGRib3PJkM5gI51BVRk2c=; b=BlkmMDXpSeOmXlZImBukMIct4B
	qXIvTMztJIBEtDq1ReLExT3f1pMbW3Sm88t5rFqEPSnQz4CGQFG8AY8rIigsgZqNrMPGq7I+uAp7X
	9hHD9L9p77Kp0WR+l0r89bIjKiAqjRo0E6YQYiqH30VznKLjya7z6kZw6mIXTD2L14ePv6LKwTee/
	p7Amhle62xU7XoBD2NF3dvPXpxwyPxeNMXANXI18TGKryW2+SAuOx+BR4doWgQm3mT7ndUIGXEOFZ
	SmCAhZTstspUrwTT2ASBhMA9R6JzFm0eTLj5jHi+DgtEUw7zEsejIziUiX3E0wBlrUAWsFbXvc/kd
	SFNhDKaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I92-000000086L8-0XhE;
	Tue, 22 Apr 2025 18:14:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FXt-00000007iSi-2OFr;
	Tue, 22 Apr 2025 15:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N4/iVPOekibSVcXx6xn/2OFGRib3PJkM5gI51BVRk2c=; b=BeFbh2zJaDns+cxt+4+uw91s1u
	M8wou82hvISxg1Tepb2y8e56KdZCRtgSOm43bEZ/+PdMrbt9/ZnyV8dH2TM7tf75DRR87x+dDsN8O
	31kFwH+ElQGxkSvdFq4y0tvofN5oGaeqGPF26BKhjuMh0rQDd+3PCPwY1fEHb3oy7k8PXL62Gy84E
	01Sh21ueldSnbyI+5W2SoVc7xnWOB+EBolBBJkUR9LOgVXOXRiu2F5Uz0AP1jzBOsIPdczgv2uSnL
	bebeRdasY+PlRLGf+Ih6m6kA8WV8f0Ye0fxcZY1mu+mdruhmYcP7YpFVanEYFKsG8XAhKmsZvEL4E
	BNkU3eOQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7FXo-0000000BFWW-2khx;
	Tue, 22 Apr 2025 15:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12CD94A952;
	Tue, 22 Apr 2025 15:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F90DC4CEF2;
	Tue, 22 Apr 2025 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335697;
	bh=qwubLRmYWTY89E3AJnlutYUREOIU1w2leDnXcCjVCNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o1LyDYSbr3xXzcTK7cUP6vBUaQU0bYdQdf8XFaS5jGfJvul+5CF6fBlnz/W0GEbp/
	 PJ9fcIScb+4yn5sV8LHDxWYhzCrstzFS/mtR8hm3+Zqx6Fy2tw1XaKsQgqfZypZvzO
	 GiQ1HON3RTHW1JwN6IaJpWmVCHFwiQLn5BFiJBJjlAhuxWFZlgAnTvHinn0MHsyfBU
	 q0OD2lo2r+ZIkYLsaKX0eGlY8YlI+PJszhxJOq0HUshnoVH6IF3jE9PdGdJVAVk+x4
	 YynfesOqur8aWXcpRQp1Mmz/tNma/AGsCb6TVRkDL7LMfgANrRDdd7FiL/fcWpU7dJ
	 U3O284Fy7Arrw==
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
Subject: [PATCH v3 06/13] crypto: arm64 - move library functions to arch/arm64/lib/crypto/
Date: Tue, 22 Apr 2025 08:27:09 -0700
Message-ID: <20250422152716.5923-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_162821_203251_74BF7F1E 
X-CRM114-Status: GOOD (  14.81  )
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
crypto infrastructure by moving the arm64 ChaCha and Poly1305 library
functions into a new directory arch/arm64/lib/crypto/ that does not
depend on CRYPTO.  This mirrors the distinction between crypto/ and
lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/Kconfig                      | 13 -------------
 arch/arm64/crypto/Makefile                     |  9 +--------
 arch/arm64/lib/Makefile                        |  3 +++
 arch/arm64/lib/crypto/.gitignore               |  2 ++
 arch/arm64/lib/crypto/Kconfig                  | 14 ++++++++++++++
 arch/arm64/lib/crypto/Makefile                 | 16 ++++++++++++++++
 arch/arm64/{ => lib}/crypto/chacha-neon-core.S |  0
 arch/arm64/{ => lib}/crypto/chacha-neon-glue.c |  0
 arch/arm64/{ => lib}/crypto/poly1305-armv8.pl  |  0
 arch/arm64/{ => lib}/crypto/poly1305-glue.c    |  0
 lib/crypto/Kconfig                             |  3 +++
 11 files changed, 39 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm64/lib/crypto/.gitignore
 create mode 100644 arch/arm64/lib/crypto/Kconfig
 create mode 100644 arch/arm64/lib/crypto/Makefile
 rename arch/arm64/{ => lib}/crypto/chacha-neon-core.S (100%)
 rename arch/arm64/{ => lib}/crypto/chacha-neon-glue.c (100%)
 rename arch/arm64/{ => lib}/crypto/poly1305-armv8.pl (100%)
 rename arch/arm64/{ => lib}/crypto/poly1305-glue.c (100%)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 704d0b7e1d137..55a7d87a67690 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -23,16 +23,10 @@ config CRYPTO_NHPOLY1305_NEON
 	  NHPoly1305 hash function (Adiantum)
 
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
-config CRYPTO_POLY1305_NEON
-	tristate
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	default CRYPTO_LIB_POLY1305_INTERNAL
-
 config CRYPTO_SHA1_ARM64_CE
 	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA1
@@ -178,17 +172,10 @@ config CRYPTO_AES_ARM64_NEON_BLK
 	    and IEEE 1619)
 
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
-config CRYPTO_CHACHA20_NEON
-	tristate
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 config CRYPTO_AES_ARM64_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XCTR/XTS modes (bit-sliced NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_AES_ARM64_NEON_BLK
diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index e7139c4768ce4..089ae3ddde810 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -60,17 +60,10 @@ obj-$(CONFIG_CRYPTO_SHA256_ARM64) += sha256-arm64.o
 sha256-arm64-y := sha256-glue.o sha256-core.o
 
 obj-$(CONFIG_CRYPTO_SHA512_ARM64) += sha512-arm64.o
 sha512-arm64-y := sha512-glue.o sha512-core.o
 
-obj-$(CONFIG_CRYPTO_CHACHA20_NEON) += chacha-neon.o
-chacha-neon-y := chacha-neon-core.o chacha-neon-glue.o
-
-obj-$(CONFIG_CRYPTO_POLY1305_NEON) += poly1305-neon.o
-poly1305-neon-y := poly1305-core.o poly1305-glue.o
-AFLAGS_poly1305-core.o += -Dpoly1305_init=poly1305_init_arm64
-
 obj-$(CONFIG_CRYPTO_NHPOLY1305_NEON) += nhpoly1305-neon.o
 nhpoly1305-neon-y := nh-neon-core.o nhpoly1305-neon-glue.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64) += aes-arm64.o
 aes-arm64-y := aes-cipher-core.o aes-cipher-glue.o
@@ -85,6 +78,6 @@ $(obj)/%-core.S: $(src)/%-armv8.pl
 	$(call cmd,perlasm)
 
 $(obj)/sha256-core.S: $(src)/sha512-armv8.pl
 	$(call cmd,perlasm)
 
-clean-files += poly1305-core.S sha256-core.S sha512-core.S
+clean-files += sha256-core.S sha512-core.S
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 4d49dff721a84..25be7825f28d8 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
+
+obj-y += crypto/
+
 lib-y		:= clear_user.o delay.o copy_from_user.o		\
 		   copy_to_user.o copy_page.o				\
 		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
 		   memset.o memcmp.o strcmp.o strncmp.o strlen.o	\
 		   strnlen.o strchr.o strrchr.o tishift.o
diff --git a/arch/arm64/lib/crypto/.gitignore b/arch/arm64/lib/crypto/.gitignore
new file mode 100644
index 0000000000000..0d47d4f21c6de
--- /dev/null
+++ b/arch/arm64/lib/crypto/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
diff --git a/arch/arm64/lib/crypto/Kconfig b/arch/arm64/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..169311547efe3
--- /dev/null
+++ b/arch/arm64/lib/crypto/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA20_NEON
+	tristate
+	depends on KERNEL_MODE_NEON
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+
+config CRYPTO_POLY1305_NEON
+	tristate
+	depends on KERNEL_MODE_NEON
+	default CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
diff --git a/arch/arm64/lib/crypto/Makefile b/arch/arm64/lib/crypto/Makefile
new file mode 100644
index 0000000000000..ac624c3effdaf
--- /dev/null
+++ b/arch/arm64/lib/crypto/Makefile
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA20_NEON) += chacha-neon.o
+chacha-neon-y := chacha-neon-core.o chacha-neon-glue.o
+
+obj-$(CONFIG_CRYPTO_POLY1305_NEON) += poly1305-neon.o
+poly1305-neon-y := poly1305-core.o poly1305-glue.o
+AFLAGS_poly1305-core.o += -Dpoly1305_init=poly1305_init_arm64
+
+quiet_cmd_perlasm = PERLASM $@
+      cmd_perlasm = $(PERL) $(<) void $(@)
+
+$(obj)/%-core.S: $(src)/%-armv8.pl
+	$(call cmd,perlasm)
+
+clean-files += poly1305-core.S
diff --git a/arch/arm64/crypto/chacha-neon-core.S b/arch/arm64/lib/crypto/chacha-neon-core.S
similarity index 100%
rename from arch/arm64/crypto/chacha-neon-core.S
rename to arch/arm64/lib/crypto/chacha-neon-core.S
diff --git a/arch/arm64/crypto/chacha-neon-glue.c b/arch/arm64/lib/crypto/chacha-neon-glue.c
similarity index 100%
rename from arch/arm64/crypto/chacha-neon-glue.c
rename to arch/arm64/lib/crypto/chacha-neon-glue.c
diff --git a/arch/arm64/crypto/poly1305-armv8.pl b/arch/arm64/lib/crypto/poly1305-armv8.pl
similarity index 100%
rename from arch/arm64/crypto/poly1305-armv8.pl
rename to arch/arm64/lib/crypto/poly1305-armv8.pl
diff --git a/arch/arm64/crypto/poly1305-glue.c b/arch/arm64/lib/crypto/poly1305-glue.c
similarity index 100%
rename from arch/arm64/crypto/poly1305-glue.c
rename to arch/arm64/lib/crypto/poly1305-glue.c
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 59135009e4f02..7395234d654b7 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -157,8 +157,11 @@ config CRYPTO_LIB_SM3
 
 if !KMSAN # avoid false positives from assembly
 if ARM
 source "arch/arm/lib/crypto/Kconfig"
 endif
+if ARM64
+source "arch/arm64/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


