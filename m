Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75476C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n1k+naLSzAKhDKJd+jEwqzr10qThbn6gZF8/aVc+SdY=; b=SzvudwZBYJRgGtwE2+s/y2MbRI
	/SfmkGUOAcnW37XYOPPMn/Q4qyy5CHHA1qqeHIjtmmkyw2SW7vcmhLlJXk7RHPkxltbkat1b2DyvB
	LdvWznrEtqyP5t46alvvvRXdssvT9SUn8gTS79EXH2RYQtN9NoDDXZdKNvnQSOafL+NUmEi3fcqD0
	juXCJWRO/liH2XqRPt7XLRVTRlJDAL6OowB44Li4syM3VSQpAbgtvkfdtgbBl9b0iCW+iBTNGT6Q3
	LKtHMGhSDyhM7eZEZmARWRlBfE3jcf4uBrA4nTFz1BYXvTYNzLKJj6w005cafeYduvV4KlKxyr0j2
	NNs87fSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyGl-00000000V1q-3e5Z;
	Tue, 25 Feb 2025 16:58:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy0m-00000000LDu-0wQs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:42:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C4E05C721B;
	Tue, 25 Feb 2025 16:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D075BC4CEE6;
	Tue, 25 Feb 2025 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740501743;
	bh=E1I+A2ijUQsaJXZ97m6qRzEkqsAgeCC2zPqldsjqxWo=;
	h=From:To:Cc:Subject:Date:From;
	b=gMVjLfi8RUbNJ1VSvtuyy71POodgGy0/kNnREyvDNg64smohUM2ALzQWrZi8w3f9I
	 4LVmOLgrARJol4lLYOoUiobbX7Y3aQFL3sOxabO6oTV7550ZjxQ2xUAMdZ3szOUVhj
	 CUPx79Br1nHmlgNXnJu7UF5b1ZfWSFhb6beB0/4BpMk6aGhwJT296Nyz+zHxGSZc1o
	 ZGDGCza9K9x6n7zMHowk721uOxmBPdUDnEEby16e1qkZLrvjqigseSzNQa6PhG7Len
	 hbONMGfxrM3RqDXrhZO0vN+dvny2/0bRrL91EkMBKKZR9FqYZPeEStSR4wYc9ujzIi
	 5EtkuYflCfmHA==
From: Arnd Bergmann <arnd@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: [PATCH] crypto: lib/Kconfig - fix chacha/poly1305 dependencies more more
Date: Tue, 25 Feb 2025 17:42:07 +0100
Message-Id: <20250225164216.4807-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_084224_415667_687DF122 
X-CRM114-Status: GOOD (  13.64  )
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

From: Arnd Bergmann <arnd@arndb.de>

A recent change tries to fix Kconfig dependencies, but introduced
two problems in the process:

 - only arm, powerpc and x86 are changed, while mips, arm64 and s390
   are now broken

 - there are now configurations where the architecture enables its
   own helper functions as loadable modules, but they remain silently
   unused because CRYPTO_LIB_* falls back to the generic helpers

Address both by changing the logic again: the architecture functions
select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA, which may be a loadable
module or built-in, and this controls whether the library is
also built-in.

Fixes: 04f9ccc955c7 ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I did not quite understand what problem the 04f9ccc955c7 patch
actually tried to solve, so there is a chance that my version
undoes it. I tested this on randconfig builds across, arm,
arm64 and x86 and found no other dependency problems with these
libraries.
---
 arch/arm64/crypto/Kconfig |  4 ++--
 arch/mips/crypto/Kconfig  |  4 ++--
 arch/s390/crypto/Kconfig  |  2 +-
 lib/crypto/Kconfig        | 20 +++++++++++---------
 4 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 5636ab83f22a..3d90efdcf5a5 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -29,7 +29,7 @@ config CRYPTO_POLY1305_NEON
 	tristate "Hash functions: Poly1305 (NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -190,7 +190,7 @@ config CRYPTO_CHACHA20_NEON
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 7decd40c4e20..cbeb2f62eb79 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -5,7 +5,7 @@ menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 config CRYPTO_POLY1305_MIPS
 	tristate "Hash functions: Poly1305"
 	depends on MIPS
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305
+	select CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
 
@@ -55,7 +55,7 @@ config CRYPTO_CHACHA_MIPS
 	tristate "Ciphers: ChaCha20, XChaCha20, XChaCha12 (MIPS32r2)"
 	depends on CPU_MIPS32_R2
 	select CRYPTO_SKCIPHER
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
 	  stream cipher algorithms
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index b760232537f1..6f7495264943 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -112,7 +112,7 @@ config CRYPTO_CHACHA_S390
 	depends on S390
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA
+	select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Length-preserving cipher: ChaCha20 stream cipher (RFC 7539)
 
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index c542ef1d64d0..6b45bd634cd9 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -50,8 +50,6 @@ config CRYPTO_ARCH_HAVE_LIB_CHACHA
 
 config CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	tristate
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_LIB_CHACHA=m
-	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA=y
 
 config CRYPTO_LIB_CHACHA_GENERIC
 	tristate
@@ -65,7 +63,9 @@ config CRYPTO_LIB_CHACHA_GENERIC
 
 config CRYPTO_LIB_CHACHA
 	tristate "ChaCha library interface"
-	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
+	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA=n
+	select CRYPTO_ARCH_HAVE_LIB_CHACHA if CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA!=n
+	depends on CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA || !CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	help
 	  Enable the ChaCha library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one
@@ -80,8 +80,6 @@ config CRYPTO_ARCH_HAVE_LIB_CURVE25519
 
 config CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
 	tristate
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_LIB_CURVE25519=m
-	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519=y
 
 config CRYPTO_LIB_CURVE25519_GENERIC
 	tristate
@@ -94,7 +92,9 @@ config CRYPTO_LIB_CURVE25519_GENERIC
 
 config CRYPTO_LIB_CURVE25519
 	tristate "Curve25519 scalar multiplication library"
-	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
+	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519=n
+	select CRYPTO_ARCH_HAVE_LIB_CURVE25519 if CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519!=n
+	depends on CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519 || !CRYPTO_ARCH_MAY_HAVE_LIB_CURVE25519
 	select CRYPTO_LIB_UTILS
 	help
 	  Enable the Curve25519 library interface. This interface may be
@@ -120,8 +120,6 @@ config CRYPTO_ARCH_HAVE_LIB_POLY1305
 
 config CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
 	tristate
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_LIB_POLY1305=m
-	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305=y
 
 config CRYPTO_LIB_POLY1305_GENERIC
 	tristate
@@ -134,7 +132,9 @@ config CRYPTO_LIB_POLY1305_GENERIC
 
 config CRYPTO_LIB_POLY1305
 	tristate "Poly1305 library interface"
-	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
+	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305=n
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305 if CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305!=n
+	depends on CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
 	help
 	  Enable the Poly1305 library interface. This interface may be fulfilled
 	  by either the generic implementation or an arch-specific one, if one
@@ -143,6 +143,8 @@ config CRYPTO_LIB_POLY1305
 config CRYPTO_LIB_CHACHA20POLY1305
 	tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library version)"
 	depends on CRYPTO
+	depends on CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_MAY_HAVE_LIB_POLY1305
+	depends on CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA || !CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA
 	select CRYPTO_LIB_CHACHA
 	select CRYPTO_LIB_POLY1305
 	select CRYPTO_ALGAPI
-- 
2.39.5


