Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD9AC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqzaEfuawTbv+rrxt9AxdIubReRU1/0OH7HicJujxhY=; b=upsEJHfpojUGBP2RURqHpNIlSK
	ek9Db6VXY3cBfLogsWkfxi9xxLu3ejbGQVha7Ip9KccYUbft16Jew7+U8kwS/BtvwA/M301LTF3oR
	gJaBRMFqF5TBC6ABeiI0kwGm4YTLTotdy1URk+hPrS5p3iTguxzWA/sQen7Iyf/CcMLIxb638sV+b
	MxdO2WZ+PW0eT5Ax/yqGYkX5q6HWNfEweLNcYFdlJ8WuDWPFZ9T4GqCl2rQwm92tRR6cQ2OZ8HAl7
	PARTEp0Sv6cVAbE+9DE5wYO22u8R/Qt08ZrHQrLIif4OCI+Ia1sMnq4kPSG+7VaNz/+WEhyPrnpOn
	9weT3edQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5U4r-0000000E4EF-3zlj;
	Thu, 17 Apr 2025 18:35:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Tx7-0000000E2Ho-2nz3;
	Thu, 17 Apr 2025 18:27:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AC78DA4A40B;
	Thu, 17 Apr 2025 18:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5078C4CEE4;
	Thu, 17 Apr 2025 18:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914428;
	bh=I03HgIe8hlztmVaX0kmyqHgQfk9uC8Y2YUsxqcekmxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dhq+jSRpIPLURJ7s8ysIZZYCuX6lz66JWazTUrzcabv+csLeQT+ovERbI+ddDLfrw
	 1Kgf+ZJjLsqxPtVC5El31bcJPPy05AhyHzed/kO+mlc0E9Xq+fJ1m+1CWprIHo56nA
	 273CkNbWjnRX35UsiY6IqK4NRWCRBQ0bVz5roGfPqj4p4pv+SamyAh4osGCswH4+Aj
	 LwZGPhbiAx9t3neXz2nWtjF8AG3GMWWzwWYeVmtb9a8GNogNqGaxc6N/N0pS9Nfulr
	 vVpGX9fkt0iciOEHT8EPdERvnFeMXTGoTuQqsLX1nvQ1/eOHdv8/e8u03/U+eIaSR1
	 /2/r8Yqh0y04g==
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
Subject: [PATCH 03/15] crypto: arm64 - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:11 -0700
Message-ID: <20250417182623.67808-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_112709_836610_44740420 
X-CRM114-Status: UNSURE (   8.01  )
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
CRYPTO_CHACHA20_NEON and CRYPTO_POLY1305_NEON.  To do this, make
arch/arm64/crypto/Kconfig be sourced regardless of CRYPTO, and
explicitly list the CRYPTO dependency in the symbols that do need it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/Kconfig        |  3 ++-
 arch/arm64/crypto/Kconfig | 41 +++++++++++++++++++++------------------
 crypto/Kconfig            |  3 ---
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08..7f6ce0da6f87 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2509,7 +2509,8 @@ source "drivers/cpufreq/Kconfig"
 
 endmenu # "CPU Power Management"
 
 source "drivers/acpi/Kconfig"
 
-source "arch/arm64/kvm/Kconfig"
+source "arch/arm64/crypto/Kconfig"
 
+source "arch/arm64/kvm/Kconfig"
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 704d0b7e1d13..a2cccd2accb0 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (arm64)"
 
 config CRYPTO_GHASH_ARM64_CE
 	tristate "Hash functions: GHASH (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_GF128MUL
 	select CRYPTO_AEAD
 	help
@@ -15,11 +15,11 @@ config CRYPTO_GHASH_ARM64_CE
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_NHPOLY1305_NEON
 	tristate "Hash functions: NHPoly1305 (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_NHPOLY1305
 	help
 	  NHPoly1305 hash function (Adiantum)
 
 	  Architecture: arm64 using:
@@ -31,102 +31,105 @@ config CRYPTO_POLY1305_NEON
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_SHA1_ARM64_CE
 	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA1
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_SHA256_ARM64
 	tristate "Hash functions: SHA-224 and SHA-256"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm64
 
 config CRYPTO_SHA2_ARM64_CE
 	tristate "Hash functions: SHA-224 and SHA-256 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA256_ARM64
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_SHA512_ARM64
 	tristate "Hash functions: SHA-384 and SHA-512"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm64
 
 config CRYPTO_SHA512_ARM64_CE
 	tristate "Hash functions: SHA-384 and SHA-512 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA512_ARM64
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_SHA3_ARM64
 	tristate "Hash functions: SHA-3 (ARMv8.2 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA3
 	help
 	  SHA-3 secure hash algorithms (FIPS 202)
 
 	  Architecture: arm64 using:
 	  - ARMv8.2 Crypto Extensions
 
 config CRYPTO_SM3_NEON
 	tristate "Hash functions: SM3 (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
 	help
 	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
 
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM3_ARM64_CE
 	tristate "Hash functions: SM3 (ARMv8.2 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
 	help
 	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
 
 	  Architecture: arm64 using:
 	  - ARMv8.2 Crypto Extensions
 
 config CRYPTO_POLYVAL_ARM64_CE
 	tristate "Hash functions: POLYVAL (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_POLYVAL
 	help
 	  POLYVAL hash function for HCTR2
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_AES_ARM64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, CTS, XCTR, XTS"
+	depends on CRYPTO
 	select CRYPTO_AES
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, CTS,
 	    XCTR, and XTS modes
@@ -135,22 +138,22 @@ config CRYPTO_AES_ARM64
 
 	  Architecture: arm64
 
 config CRYPTO_AES_ARM64_CE
 	tristate "Ciphers: AES (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_AES_ARM64_CE_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_AES_ARM64_CE
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
@@ -163,11 +166,11 @@ config CRYPTO_AES_ARM64_CE_BLK
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_AES_ARM64_NEON_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
@@ -187,11 +190,11 @@ config CRYPTO_CHACHA20_NEON
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_AES_ARM64_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XCTR/XTS modes (bit-sliced NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_AES_ARM64_NEON_BLK
 	select CRYPTO_LIB_AES
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
@@ -207,11 +210,11 @@ config CRYPTO_AES_ARM64_BS
 	  - bit-sliced algorithm
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_CE
 	tristate "Ciphers: SM4 (ARMv8.2 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_SM4
 	help
 	  Block ciphers: SM4 cipher algorithms (OSCCA GB/T 32907-2016)
 
@@ -219,11 +222,11 @@ config CRYPTO_SM4_ARM64_CE
 	  - ARMv8.2 Crypto Extensions
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_CE_BLK
 	tristate "Ciphers: SM4, modes: ECB/CBC/CTR/XTS (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SM4
 	help
 	  Length-preserving ciphers: SM4 cipher algorithms (OSCCA GB/T 32907-2016)
 	  with block cipher modes:
@@ -237,11 +240,11 @@ config CRYPTO_SM4_ARM64_CE_BLK
 	  - ARMv8 Crypto Extensions
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_NEON_BLK
 	tristate "Ciphers: SM4, modes: ECB/CBC/CTR (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SM4
 	help
 	  Length-preserving ciphers: SM4 cipher algorithms (OSCCA GB/T 32907-2016)
 	  with block cipher modes:
@@ -252,11 +255,11 @@ config CRYPTO_SM4_ARM64_NEON_BLK
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_AES_ARM64_CE_CCM
 	tristate "AEAD cipher: AES in CCM mode (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_AES_ARM64_CE
 	select CRYPTO_AES_ARM64_CE_BLK
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
@@ -269,11 +272,11 @@ config CRYPTO_AES_ARM64_CE_CCM
 	  - ARMv8 Crypto Extensions
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_CE_CCM
 	tristate "AEAD cipher: SM4 in CCM mode (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
 	select CRYPTO_SM4
 	select CRYPTO_SM4_ARM64_CE_BLK
 	help
@@ -285,11 +288,11 @@ config CRYPTO_SM4_ARM64_CE_CCM
 	  - ARMv8 Crypto Extensions
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SM4_ARM64_CE_GCM
 	tristate "AEAD cipher: SM4 in GCM mode (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
+	depends on CRYPTO && KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
 	select CRYPTO_SM4
 	select CRYPTO_SM4_ARM64_CE_BLK
 	help
diff --git a/crypto/Kconfig b/crypto/Kconfig
index cad71f32e1e3..a5225c6d0488 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if ARM64
-source "arch/arm64/crypto/Kconfig"
-endif
 if LOONGARCH
 source "arch/loongarch/crypto/Kconfig"
 endif
 if MIPS
 source "arch/mips/crypto/Kconfig"
-- 
2.49.0


