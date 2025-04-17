Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03367C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 19:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f34Pxje0LPAvU7ue7x7IfVZE90Tx+4WVqacsDbq5RN0=; b=zIFeaCmSNjZPG1hnL0AapOq742
	n9MH1aRrdvkEU8IZhNuXgtG+SlxrKwpOcGvEEUiLVPry+xGFt+7C3iSeXp8VzJsSLDQqusJdzIGdG
	lu89XY5nqJ3862nFf3QB4VCng7DRVcrmXpCyue667QGWwJ2zqs55UEUA0zs3pTjgi6a4bYVcCa7iY
	JcQ4IhgGBszXsKZtsfnCo0a9dus5WvHN/ET8tOiOV5653UP/Dh9hF4lMx03lXkCDdvmilZ0j/P2+i
	cxO3ajy+t68NwU+3uvMn3T529rp97ho0/Ae7cbdpIk2BIFX5lDaFT3192FVw3yJBbq5ZsZNRzd22R
	1LSbnMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5V95-0000000ECmc-1i3K;
	Thu, 17 Apr 2025 19:43:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Tx6-0000000E2Gj-08ip;
	Thu, 17 Apr 2025 18:27:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C28ADA41B98;
	Thu, 17 Apr 2025 18:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1FFC4CEFC;
	Thu, 17 Apr 2025 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914426;
	bh=5dSTk9hCMalH9KouPCri0ueCaynOtEG8zNL9Aah4GBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dNicRjUq6+lSEG5MUjPWjKxrQv9g7Uqlt4v1mUDqOzfDmTlQ78EnINfC/7p4hhuLf
	 unDZ581a3lk1/CyVkyU/eRAe8C1IEg8saysLWZqDZWXoA45KcXcO4coHUJBFTuU3UU
	 +xsr3CESWT7KSNaneo8H65gLiuHccxH4KxKzFFMUUZGv2t6JHGf1kSabQmxcF0YHfK
	 mOf5Xw8XfiwsxdjEmQE1c84/BkqF9yF6Tj0betPMHuynJy3dKUlBW0wahGrgSTudTe
	 CMjPBeWPikTExhX+uBX+hcFcEgCFnb0elSvHf6BGxQc70WYDafl8soF2IP0mVYCoWJ
	 eIX8TaKHJUMvQ==
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
Subject: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:09 -0700
Message-ID: <20250417182623.67808-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_112708_191774_49D09660 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Eric Biggers <ebiggers@google.com>

Continue disentangling the crypto library functions from the generic
crypto infrastructure by removing the unnecessary CRYPTO dependency of
CRYPTO_BLAKE2S_ARM, CRYPTO_CHACHA20_NEON, and CRYPTO_POLY1305_ARM.  To
do this, make arch/arm/crypto/Kconfig be sourced regardless of CRYPTO,
and explicitly list the CRYPTO dependency in the symbols that do need
it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/Kconfig        |  2 ++
 arch/arm/crypto/Kconfig | 24 +++++++++++++-----------
 crypto/Kconfig          |  3 ---
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 25ed6f1a7c7a..86fcce738887 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1753,5 +1753,7 @@ config ARCH_HIBERNATION_POSSIBLE
 	bool
 	depends on MMU
 	default y if ARCH_SUSPEND_POSSIBLE
 
 endmenu
+
+source "arch/arm/crypto/Kconfig"
diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 3530e7c80793..a03017a6dbc4 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
 config CRYPTO_CURVE25519_NEON
 	tristate
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_KPP
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help
@@ -15,11 +15,11 @@ config CRYPTO_CURVE25519_NEON
 	  Architecture: arm with
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_GHASH_ARM_CE
 	tristate "Hash functions: GHASH (PMULL/NEON/ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_AEAD
 	select CRYPTO_HASH
 	select CRYPTO_CRYPTD
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_GF128MUL
@@ -36,11 +36,11 @@ config CRYPTO_GHASH_ARM_CE
 	  that is part of the ARMv8 Crypto Extensions, or a slower variant that
 	  uses the vmull.p8 instruction that is part of the basic NEON ISA.
 
 config CRYPTO_NHPOLY1305_NEON
 	tristate "Hash functions: NHPoly1305 (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_NHPOLY1305
 	help
 	  NHPoly1305 hash function (Adiantum)
 
 	  Architecture: arm using:
@@ -64,11 +64,11 @@ config CRYPTO_BLAKE2S_ARM
 	  There is no NEON implementation of BLAKE2s, since NEON doesn't
 	  really help with it.
 
 config CRYPTO_BLAKE2B_NEON
 	tristate "Hash functions: BLAKE2b (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_BLAKE2B
 	help
 	  BLAKE2b cryptographic hash function (RFC 7693)
 
 	  Architecture: arm using
@@ -80,20 +80,21 @@ config CRYPTO_BLAKE2B_NEON
 	  much faster than the SHA-2 family and slightly faster than
 	  SHA-1.
 
 config CRYPTO_SHA1_ARM
 	tristate "Hash functions: SHA-1"
+	depends on CRYPTO
 	select CRYPTO_SHA1
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: arm
 
 config CRYPTO_SHA1_ARM_NEON
 	tristate "Hash functions: SHA-1 (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SHA1_ARM
 	select CRYPTO_SHA1
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
@@ -101,51 +102,52 @@ config CRYPTO_SHA1_ARM_NEON
 	  Architecture: arm using
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SHA1_ARM_CE
 	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SHA1_ARM
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: arm using ARMv8 Crypto Extensions
 
 config CRYPTO_SHA2_ARM_CE
 	tristate "Hash functions: SHA-224 and SHA-256 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SHA256_ARM
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm using
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_SHA256_ARM
 	tristate "Hash functions: SHA-224 and SHA-256 (NEON)"
+	depends on CRYPTO && !CPU_V7M
 	select CRYPTO_HASH
-	depends on !CPU_V7M
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm using
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SHA512_ARM
 	tristate "Hash functions: SHA-384 and SHA-512 (NEON)"
+	depends on CRYPTO && !CPU_V7M
 	select CRYPTO_HASH
-	depends on !CPU_V7M
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm using
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_AES_ARM
 	tristate "Ciphers: AES"
+	depends on CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_AES
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 
@@ -160,11 +162,11 @@ config CRYPTO_AES_ARM
 	  disables IRQs and preloads the tables; it is hoped this makes
 	  such attacks very difficult.
 
 config CRYPTO_AES_ARM_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (bit-sliced NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_AES_ARM
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
@@ -188,11 +190,11 @@ config CRYPTO_AES_ARM_BS
 	  ciphertext stealing when the message isn't a multiple of 16 bytes, and
 	  CTR when invoked in a context in which NEON instructions are unusable.
 
 config CRYPTO_AES_ARM_CE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTS/CTR/XTS (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	   with block cipher modes:
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 9322e42e562d..cad71f32e1e3 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if ARM
-source "arch/arm/crypto/Kconfig"
-endif
 if ARM64
 source "arch/arm64/crypto/Kconfig"
 endif
 if LOONGARCH
 source "arch/loongarch/crypto/Kconfig"
-- 
2.49.0


