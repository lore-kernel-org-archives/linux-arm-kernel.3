Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA24C369D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 19:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24H3P72aA5pCEEqRrWmK7pg00LMX0cTI4Q9xjVYKxXA=; b=X6G6xez4nn0guWIUlqivZyDVCj
	EeHwvUiJxiYy+CWxAHSnmkpMRD79wB/g/OEviGKMqyeBZxCMjFVhOMTmtLYqZNnZwOW2vRpHYyXQG
	Mf3o+bxiBXJNrly+j0IMDKAn/STTGfHzPlMMjJ+qSnrB1lyUADgw4Y+LpO37qoWmBPqeJwnRdQbC3
	aq5r6pEjWluM9IqxE4FlJuOhaiy6uN3cvqLJTSLYy/r6aY5vhd/DFAk3R8CxwelV4JFM0eVZWuL+M
	NBwtW1nW9XRhbprqYRu7Q2j3eSJObKp++xr5R2exBTehoW/dRHyy/Bw3BO5yvUuIx8x1Uz0x/0RDu
	S9Lfyhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6adN-00000002zHb-2ID1;
	Sun, 20 Apr 2025 19:47:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6aKM-00000002vi9-0SlL;
	Sun, 20 Apr 2025 19:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06C27A4BA2C;
	Sun, 20 Apr 2025 19:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80162C4CEE9;
	Sun, 20 Apr 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177260;
	bh=J8uCpavgYu/bq2A7Hf4ZA97H/cAunDf26vqUDG1MGLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R8RoY7Xk2+HzXh2P2QjIH6yktKf9tZx4Ejn9TAliuEFKa5F0exi9scB4GGLALnRu0
	 eQ/+oEJutbwcOIXF33IuZ7DJ+XYAw8Xd6M+D2NJWgfrdQLdwmH9iIuYieO5CDd7xso
	 SMDVKYgDEBMo8Q63lZmhCQyrSyPzgNvPQKMzSoh/DEdYdwjj3kiDpAGHSRZVu3Cc2k
	 XGRaxcvD5dUdB1pIBzYsWi91SjOEXakj39zXjJTHfCbO4T9B1U5kWm/HwfRrZuH8u9
	 dGB4IeL8LC60qso9q9iPRiDH91gggajuaDGTrq7yVzQCpLLteklDVj4RlAskIk9jng
	 Oo+4oz+SGLnVQ==
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
Subject: [PATCH v2 08/13] crypto: powerpc - move library functions to arch/powerpc/lib/crypto/
Date: Sun, 20 Apr 2025 12:26:04 -0700
Message-ID: <20250420192609.295075-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420192609.295075-1-ebiggers@kernel.org>
References: <20250420192609.295075-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_122742_313093_07E5412F 
X-CRM114-Status: GOOD (  15.14  )
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


