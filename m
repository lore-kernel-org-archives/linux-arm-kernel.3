Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EF6C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 00:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwQJWT3E4Za1gMFmO0KiwKEGd+4lX/BAmsR8ca0Ov4o=; b=Dx3bGlliRrKOd4S1R1BJQa3mwr
	wrlmukOjkRwAf3FQJ37PfqCfKXd8af3h9Ft41QHvRbf3jc8dZxZe1q6sGu5MNkDowjajH4kZEv/1A
	ylW6vRPCuF9LWx4WPuE+49jefxuv92dGv463kSIEJ0dxWQaVT5FycDnf34YnshkbheOSw8XXM0cmM
	vAoZDO/FPHQTbQA24e6ToUVt6kuImIUlkWYN7uBGBJUXK1+Zr+zfFTwma1VUf0DFU5vIqv5qf/+Lc
	WCv5C7F25g+e+7u/qBU66irO/LCIA7D/Un8wW3nVXCgyn4eWWpfg35tCBn05Tlg3i/cctxfn6Z/aq
	BZknqHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0UbM-0000000ANNm-0h3T;
	Fri, 04 Apr 2025 00:08:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0UYa-0000000AMmx-1isN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 00:05:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8F1FAA46A8E;
	Thu,  3 Apr 2025 23:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EB0C4CEE3;
	Fri,  4 Apr 2025 00:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725111;
	bh=kVQgNxq4m2oGBNbzDF5BjkGwrAuG/5jrS+kaq/UaZzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TeaEjhBbCQSJHQu2oOakvU3VJOdnaAPlxybbFw3CiY/b6ZUpxdUJOULr0igtTwkj/
	 N7cb7T/oIlDQFUhejWsaWKuJ9mLdikAoxhSrUdUzvOicU7o7Llg19Mjyb9G20bbDdN
	 desEkL0bU1F/i7qrxaMGjAOSqn2hm51x7x33/z9uYIwAQbtVraOGl4DFCGDASQZlSM
	 4h4UUPdFC4xapT7ga4hLX9be2YV6IUgzfZm6kjsAFihqVdTwahUzp+XeS8qQxZnCBB
	 ikU3NTrbtZ+xrxMq0WyszIMkBYs+TK3IIIB77ia5RRckAPSuqcULcxpyneoiON6KG7
	 UzGCT0pEzPZeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	davem@davemloft.net,
	linux@armlinux.org.uk,
	leitao@debian.org,
	nayna@linux.ibm.com,
	pfsmorigo@gmail.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.13 07/22] crypto: lib/Kconfig - Fix lib built-in failure when arch is modular
Date: Thu,  3 Apr 2025 20:04:36 -0400
Message-Id: <20250404000453.2688371-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000453.2688371-1-sashal@kernel.org>
References: <20250404000453.2688371-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_170512_578696_4F41B9FE 
X-CRM114-Status: GOOD (  12.32  )
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

From: Herbert Xu <herbert@gondor.apana.org.au>

[ Upstream commit 1047e21aecdf17c8a9ab9fd4bd24c6647453f93d ]

The HAVE_ARCH Kconfig options in lib/crypto try to solve the
modular versus built-in problem, but it still fails when the
the LIB option (e.g., CRYPTO_LIB_CURVE25519) is selected externally.

Fix this by introducing a level of indirection with ARCH_MAY_HAVE
Kconfig options, these then go on to select the ARCH_HAVE options
if the ARCH Kconfig options matches that of the LIB option.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501230223.ikroNDr1-lkp@intel.com/
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/crypto/Kconfig     |  6 +++---
 arch/powerpc/crypto/Kconfig |  4 ++--
 arch/x86/crypto/Kconfig     |  6 +++---
 lib/crypto/Kconfig          | 26 ++++++++++++++++++--------
 4 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 5ff49a5e9afc9..8af59c1735ea4 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -6,7 +6,7 @@ config CRYPTO_CURVE25519_NEON
 	tristate "Public key crypto: Curve25519 (NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -47,7 +47,7 @@ config CRYPTO_NHPOLY1305_NEON
 config CRYPTO_POLY1305_ARM
 	tristate "Hash functions: Poly1305 (NEON)"
 	select CRYPTO_HASH
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -214,7 +214,7 @@ config CRYPTO_AES_ARM_CE
 config CRYPTO_CHACHA20_NEON
 	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (NEON)"
 	select CRYPTO_SKCIPHER
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 951a437264611..14299927d7964 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -6,7 +6,7 @@ config CRYPTO_CURVE25519_PPC64
 	tristate "Public key crypto: Curve25519 (PowerPC64)"
 	depends on PPC64 && CPU_LITTLE_ENDIAN
 	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -128,7 +128,7 @@ config CRYPTO_CHACHA20_P10
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 3d2e38ba52403..82c5fbb13f048 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -6,7 +6,7 @@ config CRYPTO_CURVE25519_X86
 	tristate "Public key crypto: Curve25519 (ADX)"
 	depends on X86 && 64BIT
 	select CRYPTO_LIB_CURVE25519_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 
@@ -352,7 +352,7 @@ config CRYPTO_CHACHA20_X86_64
 	depends on X86 && 64BIT
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
@@ -420,7 +420,7 @@ config CRYPTO_POLY1305_X86_64
 	tristate "Hash functions: Poly1305 (SSE2/AVX2)"
 	depends on X86 && 64BIT
 	select CRYPTO_LIB_POLY1305_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index b01253cac70a7..c542ef1d64d03 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -42,12 +42,17 @@ config CRYPTO_LIB_BLAKE2S_GENERIC
 	  of CRYPTO_LIB_BLAKE2S.
 
 config CRYPTO_ARCH_HAVE_LIB_CHACHA
-	tristate
+	bool
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the ChaCha library interface,
 	  either builtin or as a module.
 
+config CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
+	tristate
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_LIB_CHACHA=m
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA=y
+
 config CRYPTO_LIB_CHACHA_GENERIC
 	tristate
 	select CRYPTO_LIB_UTILS
@@ -60,7 +65,6 @@ config CRYPTO_LIB_CHACHA_GENERIC
 
 config CRYPTO_LIB_CHACHA
 	tristate "ChaCha library interface"
-	depends on CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_CHACHA
 	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
 	help
 	  Enable the ChaCha library interface. This interface may be fulfilled
@@ -68,12 +72,17 @@ config CRYPTO_LIB_CHACHA
 	  is available and enabled.
 
 config CRYPTO_ARCH_HAVE_LIB_CURVE25519
-	tristate
+	bool
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the Curve25519 library interface,
 	  either builtin or as a module.
 
+config CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
+	tristate
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_LIB_CURVE25519=m
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519=y
+
 config CRYPTO_LIB_CURVE25519_GENERIC
 	tristate
 	help
@@ -85,7 +94,6 @@ config CRYPTO_LIB_CURVE25519_GENERIC
 
 config CRYPTO_LIB_CURVE25519
 	tristate "Curve25519 scalar multiplication library"
-	depends on CRYPTO_ARCH_HAVE_LIB_CURVE25519 || !CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
 	select CRYPTO_LIB_UTILS
 	help
@@ -104,12 +112,17 @@ config CRYPTO_LIB_POLY1305_RSIZE
 	default 1
 
 config CRYPTO_ARCH_HAVE_LIB_POLY1305
-	tristate
+	bool
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the Poly1305 library interface,
 	  either builtin or as a module.
 
+config CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
+	tristate
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_LIB_POLY1305=m
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305=y
+
 config CRYPTO_LIB_POLY1305_GENERIC
 	tristate
 	help
@@ -121,7 +134,6 @@ config CRYPTO_LIB_POLY1305_GENERIC
 
 config CRYPTO_LIB_POLY1305
 	tristate "Poly1305 library interface"
-	depends on CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
 	help
 	  Enable the Poly1305 library interface. This interface may be fulfilled
@@ -130,8 +142,6 @@ config CRYPTO_LIB_POLY1305
 
 config CRYPTO_LIB_CHACHA20POLY1305
 	tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library version)"
-	depends on CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_CHACHA
-	depends on CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_POLY1305
 	depends on CRYPTO
 	select CRYPTO_LIB_CHACHA
 	select CRYPTO_LIB_POLY1305
-- 
2.39.5


