Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67DBC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24H3P72aA5pCEEqRrWmK7pg00LMX0cTI4Q9xjVYKxXA=; b=KTATQDJHwCtMZhBGXoVO045a+H
	antR6XFvZo1bFv2HWou1HxI2yhaAa6HfJxV+yDTaMqFSmqdzNR98xZnmgjXtBkd6/3qE57XZ7SODb
	TkcwNCnWBtOiCyAog5UssLN/OvXKDDvwI5EcLSW75fr0mhQBQpfyOj6vmLMrfLRvtK76of3N9W/kl
	NxFjGSQ/UNTS0WBPUkVgnMBKXFA2u/YnDECHF7kj7mlJVGg0JPp68/oTqY4qH6IdWjRG/DzlMTTeV
	Yn1fhd5I4Xa3JW0RFYJtFrs3pU0T5Au1PE9DoStUpShglmjN04dt63WyhM0MBayM8yc7bTLk6IYKb
	W5iS/ooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8p-000000085xG-2pZf;
	Tue, 22 Apr 2025 18:14:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FXm-00000007iOj-3ApU;
	Tue, 22 Apr 2025 15:28:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0A2464A941;
	Tue, 22 Apr 2025 15:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F74BC4CEF2;
	Tue, 22 Apr 2025 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335698;
	bh=J8uCpavgYu/bq2A7Hf4ZA97H/cAunDf26vqUDG1MGLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUxmNTn8AgQpRrLgdELItVrayTHCc34bWmQEOm6kFtC1wEoqFMj8V36G++QRB0KkK
	 XmZ9rXKUa/yKUmJ8RusFQ4qMCCGGp6w+R+tJ7snWoVB8h+U7MXfdJOkA/lDJXHFE6R
	 r24jn1S1Jfdtu1XFNQqfQm0mInUuuFCtbIOcO4+PMmXWwzcfyazTOJeflVZEYGTwzp
	 rij53w8zkeUtCZR+7YkI2JDpmAKiuk0649Xo/b3J4SvF22jID1OPUfoF+u7izfX19T
	 Gqzebht6PQ2/P3JVmHp1WYwXRCYv6a94up81N3knCmddtfFrR47TFT/AhDgOCw5C6A
	 he/0n9IQlEBEQ==
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
Subject: [PATCH v3 08/13] crypto: powerpc - move library functions to arch/powerpc/lib/crypto/
Date: Tue, 22 Apr 2025 08:27:11 -0700
Message-ID: <20250422152716.5923-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_082818_835470_C5B82F48 
X-CRM114-Status: GOOD (  15.73  )
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
crypto infrastructure by moving the powerpc ChaCha and Poly1305 library
functions into a new directory arch/powerpc/lib/crypto/ that does not
depend on CRYPTO.  This mirrors the distinction between crypto/ and
lib/crypto/.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/Kconfig                       | 14 --------------
 arch/powerpc/crypto/Makefile                      |  4 ----
 arch/powerpc/lib/Makefile                         |  2 ++
 arch/powerpc/lib/crypto/Kconfig                   | 15 +++++++++++++++
 arch/powerpc/lib/crypto/Makefile                  |  7 +++++++
 arch/powerpc/{ => lib}/crypto/chacha-p10-glue.c   |  0
 arch/powerpc/{ => lib}/crypto/chacha-p10le-8x.S   |  0
 arch/powerpc/{ => lib}/crypto/poly1305-p10-glue.c |  0
 arch/powerpc/{ => lib}/crypto/poly1305-p10le_64.S |  0
 lib/crypto/Kconfig                                |  3 +++
 10 files changed, 27 insertions(+), 18 deletions(-)
 create mode 100644 arch/powerpc/lib/crypto/Kconfig
 create mode 100644 arch/powerpc/lib/crypto/Makefile
 rename arch/powerpc/{ => lib}/crypto/chacha-p10-glue.c (100%)
 rename arch/powerpc/{ => lib}/crypto/chacha-p10le-8x.S (100%)
 rename arch/powerpc/{ => lib}/crypto/poly1305-p10-glue.c (100%)
 rename arch/powerpc/{ => lib}/crypto/poly1305-p10le_64.S (100%)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 8bcc690134644..4bf7b01228e72 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -88,24 +88,10 @@ config CRYPTO_AES_GCM_P10
 	    - Power10 or later features
 
 	  Support for cryptographic acceleration instructions on Power10 or
 	  later CPU. This module supports stitched acceleration for AES/GCM.
 
-config CRYPTO_CHACHA20_P10
-	tristate
-	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
-	default CRYPTO_LIB_CHACHA_INTERNAL
-
-config CRYPTO_POLY1305_P10
-	tristate
-	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
-	select CRYPTO_LIB_POLY1305_GENERIC
-	default CRYPTO_LIB_POLY1305_INTERNAL
-
 config CRYPTO_DEV_VMX
         bool "Support for VMX cryptographic acceleration instructions"
         depends on PPC64 && VSX
         help
           Support for VMX cryptographic acceleration instructions.
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 2f00b22b0823e..f13aec8a18335 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -9,23 +9,19 @@ obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_MD5_PPC) += md5-ppc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC) += sha1-powerpc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC_SPE) += sha1-ppc-spe.o
 obj-$(CONFIG_CRYPTO_SHA256_PPC_SPE) += sha256-ppc-spe.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
-obj-$(CONFIG_CRYPTO_CHACHA20_P10) += chacha-p10-crypto.o
-obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
 
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
 md5-ppc-y := md5-asm.o md5-glue.o
 sha1-powerpc-y := sha1-powerpc-asm.o sha1.o
 sha1-ppc-spe-y := sha1-spe-asm.o sha1-spe-glue.o
 sha256-ppc-spe-y := sha256-spe-asm.o sha256-spe-glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
-chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
-poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 curve25519-ppc64le-y := curve25519-ppc64le-core.o curve25519-ppc64le_asm.o
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
 override flavour := linux-ppc64le
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index dd8a4b52a0ccb..1cd74673cbf74 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -1,10 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for ppc-specific library files..
 #
 
+obj-y += crypto/
+
 CFLAGS_code-patching.o += -fno-stack-protector
 CFLAGS_feature-fixups.o += -fno-stack-protector
 
 CFLAGS_REMOVE_code-patching.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_feature-fixups.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/powerpc/lib/crypto/Kconfig b/arch/powerpc/lib/crypto/Kconfig
new file mode 100644
index 0000000000000..3f52610e45eb4
--- /dev/null
+++ b/arch/powerpc/lib/crypto/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config CRYPTO_CHACHA20_P10
+	tristate
+	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
+	default CRYPTO_LIB_CHACHA_INTERNAL
+	select CRYPTO_LIB_CHACHA_GENERIC
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+
+config CRYPTO_POLY1305_P10
+	tristate
+	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
+	default CRYPTO_LIB_POLY1305_INTERNAL
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	select CRYPTO_LIB_POLY1305_GENERIC
diff --git a/arch/powerpc/lib/crypto/Makefile b/arch/powerpc/lib/crypto/Makefile
new file mode 100644
index 0000000000000..5709ae14258a0
--- /dev/null
+++ b/arch/powerpc/lib/crypto/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_CRYPTO_CHACHA20_P10) += chacha-p10-crypto.o
+chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
+
+obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
+poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
diff --git a/arch/powerpc/crypto/chacha-p10-glue.c b/arch/powerpc/lib/crypto/chacha-p10-glue.c
similarity index 100%
rename from arch/powerpc/crypto/chacha-p10-glue.c
rename to arch/powerpc/lib/crypto/chacha-p10-glue.c
diff --git a/arch/powerpc/crypto/chacha-p10le-8x.S b/arch/powerpc/lib/crypto/chacha-p10le-8x.S
similarity index 100%
rename from arch/powerpc/crypto/chacha-p10le-8x.S
rename to arch/powerpc/lib/crypto/chacha-p10le-8x.S
diff --git a/arch/powerpc/crypto/poly1305-p10-glue.c b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
similarity index 100%
rename from arch/powerpc/crypto/poly1305-p10-glue.c
rename to arch/powerpc/lib/crypto/poly1305-p10-glue.c
diff --git a/arch/powerpc/crypto/poly1305-p10le_64.S b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
similarity index 100%
rename from arch/powerpc/crypto/poly1305-p10le_64.S
rename to arch/powerpc/lib/crypto/poly1305-p10le_64.S
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index c5c01bc3569d5..4b3e94ed84bb6 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -163,8 +163,11 @@ if ARM64
 source "arch/arm64/lib/crypto/Kconfig"
 endif
 if MIPS
 source "arch/mips/lib/crypto/Kconfig"
 endif
+if PPC
+source "arch/powerpc/lib/crypto/Kconfig"
+endif
 endif
 
 endmenu
-- 
2.49.0


