Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94819C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 20:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANbCgz3llHchROYIOQePoX+OweczqFG3E3wg3zfRZtQ=; b=pfccg5KpQsgZqmwYWj1imafOLU
	RRn99m/cX8e45oL1cPv4SnNCd+yTQMLi4jlBlKGuu2PxkzF7XJzhxmjYXGXvlazBTtbjBM6JiSYm5
	HwuV/ocfJmM59ZT85tM+gQBZkm8FBVa50Rwxdi98O2bRryrdRgXOzNBkFw0/trvEX2YvpNpoTUizO
	XcPQcEuNGKkAkiqmu/uFFMygoQBQ4IHTE3tts+WOLwTMveygnvgBKlWPrkC/dw5Iy/7oRegEzhro4
	jvunKom3zXsFuM6kzWNHQ9E/Tu9tj6HrLGolqbmV/T/0K/ab1wrwvbg9Lr/IZeuwKcIE+cDn7otuw
	3Zwr0h3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6bdk-0000000335G-1byF;
	Sun, 20 Apr 2025 20:51:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6aKM-00000002vjD-3Jza;
	Sun, 20 Apr 2025 19:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7F0CA4BA30;
	Sun, 20 Apr 2025 19:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CDADC4CEF0;
	Sun, 20 Apr 2025 19:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177261;
	bh=u+OK7tFveVR0om3+lNaIeYM0HzeTeASq3YZREbliyFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLQurH4mvImNRkbdsejvvFmWVFmrkhdpmyEEO9MnBmWuy8/+SmxN9LYIlDW3djSE2
	 /1xoV9sY7d/MZAwj5oFvWgyU6pQZbjgUyPxdVsKOsF54vbz1mutBkw4axN+VYwfYCn
	 Ms3bMFuXRd+OFvsjAgJkn0F3MuNidZw7NM055c+XbPkkksj/I2/vpuQiUbZOXRbJ5V
	 rxBJgpMYScXs1Mb3njNRNfY9LqY/zYKdhi1Jeb+PH0l97Xt5hRoviXNzmARfwnxeka
	 cWUOZmm71r1VQuU7NOBG4ny/tFUv8B9hOAkPB6FqaDKziniWnoCqNa69YcrMoEtg7/
	 cK2/icIun6j9w==
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
Subject: [PATCH v2 10/13] crypto: s390 - move library functions to arch/s390/lib/crypto/
Date: Sun, 20 Apr 2025 12:26:06 -0700
Message-ID: <20250420192609.295075-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420192609.295075-1-ebiggers@kernel.org>
References: <20250420192609.295075-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_122743_009354_282FD774 
X-CRM114-Status: GOOD (  15.64  )
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
crypto infrastructure by moving the s390 ChaCha library functions into a
new directory arch/s390/lib/crypto/ that does not depend on CRYPTO.
This mirrors the distinction between crypto/ and lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/crypto/Kconfig                 | 6 ------
 arch/s390/crypto/Makefile                | 3 ---
 arch/s390/lib/Makefile                   | 1 +
 arch/s390/lib/crypto/Kconfig             | 7 +++++++
 arch/s390/lib/crypto/Makefile            | 4 ++++
 arch/s390/{ => lib}/crypto/chacha-glue.c | 0
 arch/s390/{ => lib}/crypto/chacha-s390.S | 0
 arch/s390/{ => lib}/crypto/chacha-s390.h | 0
 lib/crypto/Kconfig                       | 3 +++
 9 files changed, 15 insertions(+), 9 deletions(-)
 create mode 100644 arch/s390/lib/crypto/Kconfig
 create mode 100644 arch/s390/lib/crypto/Makefile
 rename arch/s390/{ => lib}/crypto/chacha-glue.c (100%)
 rename arch/s390/{ => lib}/crypto/chacha-s390.S (100%)
 rename arch/s390/{ => lib}/crypto/chacha-s390.h (100%)

diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index e88d9cd256ef5..a2bfd6eef0ca3 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -97,16 +97,10 @@ config CRYPTO_DES_S390
 	  Architecture: s390
 
 	  As of z990 the ECB and CBC mode are hardware accelerated.
 	  As of z196 the CTR mode is hardware accelerated.
 
-config CRYPTO_CHACHA_S390
-	tristate
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
 config CRYPTO_HMAC_S390
 	tristate "Keyed-hash message authentication code: HMAC"
 	select CRYPTO_HASH
 	help
 	  s390 specific HMAC hardware support for SHA224, SHA256, SHA384 and
diff --git a/arch/s390/crypto/Makefile b/arch/s390/crypto/Makefile
index 14dafadbcbed4..e3853774e1a3a 100644
--- a/arch/s390/crypto/Makefile
+++ b/arch/s390/crypto/Makefile
@@ -9,12 +9,9 @@ obj-$(CONFIG_CRYPTO_SHA512_S390) += sha512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_256_S390) += sha3_256_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_512_S390) += sha3_512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_DES_S390) += des_s390.o
 obj-$(CONFIG_CRYPTO_AES_S390) += aes_s390.o
 obj-$(CONFIG_CRYPTO_PAES_S390) += paes_s390.o
-obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
 obj-$(CONFIG_S390_PRNG) += prng.o
 obj-$(CONFIG_CRYPTO_GHASH_S390) += ghash_s390.o
 obj-$(CONFIG_CRYPTO_HMAC_S390) += hmac_s390.o
 obj-y += arch_random.o
-
-chacha_s390-y := chacha-glue.o chacha-s390.o
diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index 14bbfe50033c7..fce4edbe8a078 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for s390-specific library files..
 #
 
+obj-y += crypto/
 lib-y += delay.o string.o uaccess.o find.o spinlock.o tishift.o
 lib-y += csum-partial.o
 obj-y += mem.o xor.o
 lib-$(CONFIG_KPROBES) += probes.o
 lib-$(CONFIG_UPROBES) += probes.o
diff --git a/arch/s390/lib/crypto/Kconfig b/arch/s390/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..b79fd91af9fe1
--- /dev/null
+++ b/arch/s390/lib/crypto/Kconfig
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA_S390
+	tristate
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
diff --git a/arch/s390/lib/crypto/Makefile b/arch/s390/lib/crypto/Makefile
new file mode 100644
index 0000000000000..06c2cf77178ef
--- /dev/null
+++ b/arch/s390/lib/crypto/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
+chacha_s390-y := chacha-glue.o chacha-s390.o
diff --git a/arch/s390/crypto/chacha-glue.c b/arch/s390/lib/crypto/chacha-glue.c
similarity index 100%
rename from arch/s390/crypto/chacha-glue.c
rename to arch/s390/lib/crypto/chacha-glue.c
diff --git a/arch/s390/crypto/chacha-s390.S b/arch/s390/lib/crypto/chacha-s390.S
similarity index 100%
rename from arch/s390/crypto/chacha-s390.S
rename to arch/s390/lib/crypto/chacha-s390.S
diff --git a/arch/s390/crypto/chacha-s390.h b/arch/s390/lib/crypto/chacha-s390.h
similarity index 100%
rename from arch/s390/crypto/chacha-s390.h
rename to arch/s390/lib/crypto/chacha-s390.h
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 0b06c25eb38a5..db19a7acc2fbf 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -169,8 +169,11 @@ if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
 if RISCV
 source "arch/riscv/lib/crypto/Kconfig"
 endif
+if S390
+source "arch/s390/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


