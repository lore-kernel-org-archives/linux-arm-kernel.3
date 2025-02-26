Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2299FC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 04:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXOZaR6/PGazYRzBCe1uSyWCfVEJvtHu1Fz6Y1sK7yg=; b=2ocqzRjYhNns432Cegzrun+0N8
	rYXldodNGgKj8bzNqF1Ryd4DqMX/4C5fVGTDOH/dSkadNHQWowFtpVGkoG3+vsyDy8RKCrd0jDkOm
	sWkToulZp2CFYI+baQVUiJZefmKTBVuWDizUTH3iDVLtKAegOs19KxqTYLHy1VfMvbNVbNMQHObzR
	eMiZf4R9sS0yG61wE1GFL3oKHjvJEiPTQA4e1aK2p4LNntfJTl9G8jhZROGjV0rXHS32e4+giG8II
	//ZADd/q7XofJc5YdcyNqikRvbBVXUJHpEGLWhogN5aFasmEAswII4FvJ227tbH+CdZwph4sF5DJr
	BB4ke1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn9Bx-00000002O19-0Jr3;
	Wed, 26 Feb 2025 04:38:41 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn9AP-00000002NvR-1Xnp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 04:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NXOZaR6/PGazYRzBCe1uSyWCfVEJvtHu1Fz6Y1sK7yg=; b=i35Zjp/lQ/g3zMTt0++/NQhvIP
	iImy+eywSlmrR4HV0JsT/FIOCWSs8WSlACoSq2vsgyRugY1Vnj6YqwZeEV7GidarctXBbkFGEY70n
	/RzG2I8dKIawXJdrI/9/p2Hwk2EAdkBFDrLFsXawWkfpbFFpf1/5f88JbV5kZ/P6mSRUmaVw/mwvj
	JVA+ZFgGftFCmnA1/tdIjGnaHJqqLtnhrQgK9HtJJ0bIsb/0JsVRKtaTaMGigUJ2Z9/jG/YQNsPPE
	1XNSoo0aRRSYMXy3s2VGcTE8VO9YDDUMMqbs0JwOSeVdTxTEgk1b+mLaws7FOpGDco05WPibRZ//V
	8znIVxVw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tn99t-001pbR-2t;
	Wed, 26 Feb 2025 12:36:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 26 Feb 2025 12:36:33 +0800
Date: Wed, 26 Feb 2025 12:36:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: [PATCH] crypto: lib/Kconfig - Select and hide arch options
Message-ID: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z75xKexTUNm_FnSK@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_203705_719879_BEB87CA6 
X-CRM114-Status: GOOD (  10.98  )
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

The ARCH_MAY_HAVE patch missed arm64, mips and s390.  But it may
also lead to arch options being enabled but ineffective because
of modular/built-in conflicts.

As the primary user of all these options wireguard is selecting
the arch options anyway, make the same selections at the lib/crypto
option level and hide the arch options from the user.

Fixes: 1047e21aecdf ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Arnd Bergmann <arnd@kernel.org>
Closes: https://lore.kernel.org/oe-kbuild-all/202502232152.JC84YDLp-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 47d9cc59f254..e28c177e63d3 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -3,10 +3,10 @@
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
 config CRYPTO_CURVE25519_NEON
-	tristate "Public key crypto: Curve25519 (NEON)"
+	tristate
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
+	select CRYPTO_KPP
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -45,9 +45,9 @@ config CRYPTO_NHPOLY1305_NEON
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_ARM
-	tristate "Hash functions: Poly1305 (NEON)"
+	tristate
 	select CRYPTO_HASH
-	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -212,9 +212,9 @@ config CRYPTO_AES_ARM_CE
 	  - ARMv8 Crypto Extensions
 
 config CRYPTO_CHACHA20_NEON
-	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (NEON)"
+	tristate
 	select CRYPTO_SKCIPHER
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 5636ab83f22a..6bf844da022d 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -26,7 +26,7 @@ config CRYPTO_NHPOLY1305_NEON
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_NEON
-	tristate "Hash functions: Poly1305 (NEON)"
+	tristate
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
@@ -186,10 +186,9 @@ config CRYPTO_AES_ARM64_NEON_BLK
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_CHACHA20_NEON
-	tristate "Ciphers: ChaCha (NEON)"
+	tristate
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 7decd40c4e20..e02481cc9c06 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -3,8 +3,9 @@
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
 config CRYPTO_POLY1305_MIPS
-	tristate "Hash functions: Poly1305"
+	tristate
 	depends on MIPS
+	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
@@ -52,7 +53,7 @@ config CRYPTO_SHA512_OCTEON
 	  Architecture: mips OCTEON using crypto instructions, when available
 
 config CRYPTO_CHACHA_MIPS
-	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (MIPS32r2)"
+	tristate
 	depends on CPU_MIPS32_R2
 	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index e453cb0c82d2..589ae680a272 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -3,10 +3,10 @@
 menu "Accelerated Cryptographic Algorithms for CPU (powerpc)"
 
 config CRYPTO_CURVE25519_PPC64
-	tristate "Public key crypto: Curve25519 (PowerPC64)"
+	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
+	select CRYPTO_KPP
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -91,11 +91,10 @@ config CRYPTO_AES_GCM_P10
 	  later CPU. This module supports stitched acceleration for AES/GCM.
 
 config CRYPTO_CHACHA20_P10
-	tristate "Ciphers: ChaCha20, XChacha20, XChacha12 (P10 or later)"
+	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index ad58dad9a580..c67095a3d669 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -22,7 +22,6 @@ config CRYPTO_CHACHA_RISCV64
 	tristate "Ciphers: ChaCha"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
 	help
 	  Length-preserving ciphers: ChaCha20 stream cipher algorithm
 
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index b760232537f1..c327aeccfde7 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -108,10 +108,9 @@ config CRYPTO_DES_S390
 	  As of z196 the CTR mode is hardware accelerated.
 
 config CRYPTO_CHACHA_S390
-	tristate "Ciphers: ChaCha20"
+	tristate
 	depends on S390
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	help
 	  Length-preserving cipher: ChaCha20 stream cipher (RFC 7539)
diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index c189dad0969b..725105919cd3 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -3,10 +3,10 @@
 menu "Accelerated Cryptographic Algorithms for CPU (x86)"
 
 config CRYPTO_CURVE25519_X86
-	tristate "Public key crypto: Curve25519 (ADX)"
+	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
+	select CRYPTO_KPP
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -348,11 +348,10 @@ config CRYPTO_ARIA_GFNI_AVX512_X86_64
 	  Processes 64 blocks in parallel.
 
 config CRYPTO_CHACHA20_X86_64
-	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (SSSE3/AVX2/AVX-512VL)"
+	tristate
 	depends on X86 && 64BIT
 	select CRYPTO_SKCIPHER
-	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
@@ -417,10 +416,10 @@ config CRYPTO_POLYVAL_CLMUL_NI
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
 config CRYPTO_POLY1305_X86_64
-	tristate "Hash functions: Poly1305 (SSE2/AVX2)"
+	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_LIB_POLY1305_GENERIC
-	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
+	select CRYPTO_HASH
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index c542ef1d64d0..f095df82f5e9 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -48,11 +48,6 @@ config CRYPTO_ARCH_HAVE_LIB_CHACHA
 	  accelerated implementation of the ChaCha library interface,
 	  either builtin or as a module.
 
-config CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
-	tristate
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_LIB_CHACHA=m
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA=y
-
 config CRYPTO_LIB_CHACHA_GENERIC
 	tristate
 	select CRYPTO_LIB_UTILS
@@ -65,7 +60,13 @@ config CRYPTO_LIB_CHACHA_GENERIC
 
 config CRYPTO_LIB_CHACHA
 	tristate "ChaCha library interface"
+	select CRYPTO
 	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
+	select CRYPTO_CHACHA20_X86_64 if X86 && 64BIT
+	select CRYPTO_CHACHA20_NEON if ARM || (ARM64 && KERNEL_MODE_NEON)
+	select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
+	select CRYPTO_CHACHA_S390 if S390
+	select CRYPTO_CHACHA20_P10 if PPC64 && CPU_LITTLE_ENDIAN && VSX
 	help
 	  Enable the ChaCha library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one
@@ -78,13 +79,9 @@ config CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	  accelerated implementation of the Curve25519 library interface,
 	  either builtin or as a module.
 
-config CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
-	tristate
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_LIB_CURVE25519=m
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519=y
-
 config CRYPTO_LIB_CURVE25519_GENERIC
 	tristate
+	select CRYPTO_LIB_UTILS
 	help
 	  This symbol can be depended upon by arch implementations of the
 	  Curve25519 library interface that require the generic code as a
@@ -95,7 +92,9 @@ config CRYPTO_LIB_CURVE25519_GENERIC
 config CRYPTO_LIB_CURVE25519
 	tristate "Curve25519 scalar multiplication library"
 	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
-	select CRYPTO_LIB_UTILS
+	select CRYPTO_CURVE25519_X86 if X86 && 64BIT
+	select CRYPTO_CURVE25519_NEON if ARM && KERNEL_MODE_NEON
+	select CRYPTO_CURVE25519_PPC64 if PPC64 && CPU_LITTLE_ENDIAN
 	help
 	  Enable the Curve25519 library interface. This interface may be
 	  fulfilled by either the generic implementation or an arch-specific
@@ -118,11 +117,6 @@ config CRYPTO_ARCH_HAVE_LIB_POLY1305
 	  accelerated implementation of the Poly1305 library interface,
 	  either builtin or as a module.
 
-config CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
-	tristate
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_LIB_POLY1305=m
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305=y
-
 config CRYPTO_LIB_POLY1305_GENERIC
 	tristate
 	help
@@ -135,6 +129,10 @@ config CRYPTO_LIB_POLY1305_GENERIC
 config CRYPTO_LIB_POLY1305
 	tristate "Poly1305 library interface"
 	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
+	select CRYPTO_POLY1305_X86_64 if X86 && 64BIT
+	select CRYPTO_POLY1305_NEON if ARM64 && KERNEL_MODE_NEON
+	select CRYPTO_POLY1305_ARM if ARM
+	select CRYPTO_POLY1305_MIPS if MIPS
 	help
 	  Enable the Poly1305 library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one
@@ -142,9 +140,10 @@ config CRYPTO_LIB_POLY1305
 
 config CRYPTO_LIB_CHACHA20POLY1305
 	tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library version)"
-	depends on CRYPTO
+	select CRYPTO
 	select CRYPTO_LIB_CHACHA
 	select CRYPTO_LIB_POLY1305
+	select CRYPTO_LIB_UTILS
 	select CRYPTO_ALGAPI
 
 config CRYPTO_LIB_SHA1
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

