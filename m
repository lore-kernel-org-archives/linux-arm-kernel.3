Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83170C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1OkdsfczKfuuMwdp5evoONWBl+wnTUoP+ZyM/DXJYg=; b=nCn1IahtPIP0cENEy3xnK7ji/z
	GMy2mIPln/BvKRXqxf7ZNjWVgfeyaWwQw7o/gZkkIhHFSY6PR6wlJXr5MJvTJJ/tsKFbH8K+awAdy
	tc2+9Z/Q/ho9P1ptK3ROsN2Y/2g5ttBLE5gwr4ua7J1WMtweUT6vw0b3yxEloBqUUQ0NexzemlM28
	TyKhy3jMnKgIlSB/JKE+opjtyQKssOivsW1n5jJ/MPYrQu6mZ45TCnN+ZW7elL6HTVxLevGe/jGcn
	YZFHXTTWgTTAgWCJMpBSE04aruRkLa+35wdK8yeNEFH1Zx2fDYePhccTxt0rvfFh0v+emk7izBc5S
	szV+euaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5UJp-0000000E6Sx-2jgW;
	Thu, 17 Apr 2025 18:50:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TxD-0000000E2Lf-3aUc;
	Thu, 17 Apr 2025 18:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 503C55C587E;
	Thu, 17 Apr 2025 18:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4949CC4CEEC;
	Thu, 17 Apr 2025 18:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914435;
	bh=wTYOYOEcD2tS5YApzAw5JpRPXQeBTl3cVi6SPyyOu+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XbNidi6AtUqg9ISmFMuBJvftddFhJ2bcWeL+ejDz2zW4ZErEzBHzZYDummTru8tmW
	 y4GOfnNa09S9itz1MfWA23c6oDCpNd7uqxbv1F/9JdCV0B2Db+8HsWek8EzVZdO+vO
	 +sRYZ5pucJykN1CDLhm35tsJPBJYshSIF25x70GuEHXa11iNNqyuO1DDOcDJ2EkRza
	 xWWwnzzSLvJGFi/kjZWECMXrYXrGklDMeY0x2rXJWAIFC+B6H8ACWQ5kPnlU+4xN3i
	 mkhVtPkRCj5RRVowUKtQFtRaTZhi7MCmpNj8shK6yD8mqvrdNNF7TxpMUYCJ9d3FwO
	 qcCdh5Ka8LHMQ==
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
Subject: [PATCH 10/15] crypto: s390 - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:18 -0700
Message-ID: <20250417182623.67808-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_112715_984500_5AB9C00D 
X-CRM114-Status: UNSURE (   9.53  )
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
CRYPTO_CHACHA_S390.  To do this, make arch/s390/crypto/Kconfig be
sourced regardless of CRYPTO, and explicitly list the CRYPTO dependency
in the symbols that do need it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/Kconfig        | 4 ++++
 arch/s390/crypto/Kconfig | 9 +++++++++
 crypto/Kconfig           | 3 ---
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index db8161ebb43c..2f32d51e8a73 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -679,10 +679,14 @@ config KERNEL_IMAGE_BASE
 
 	  If the value of this option leads to the kernel image overlapping
 	  the virtual memory where other data structures are located, this
 	  option is ignored and the image is loaded above the structures.
 
+if !KMSAN # avoid false positives from assembly
+source "arch/s390/crypto/Kconfig"
+endif
+
 endmenu
 
 menu "Memory setup"
 
 config ARCH_SPARSEMEM_ENABLE
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index e88d9cd256ef..a2e6efd8aed8 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -2,70 +2,77 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (s390)"
 
 config CRYPTO_SHA512_S390
 	tristate "Hash functions: SHA-384 and SHA-512"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: s390
 
 	  It is available as of z10.
 
 config CRYPTO_SHA1_S390
 	tristate "Hash functions: SHA-1"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: s390
 
 	  It is available as of z990.
 
 config CRYPTO_SHA256_S390
 	tristate "Hash functions: SHA-224 and SHA-256"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: s390
 
 	  It is available as of z9.
 
 config CRYPTO_SHA3_256_S390
 	tristate "Hash functions: SHA3-224 and SHA3-256"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA3-224 and SHA3-256 secure hash algorithms (FIPS 202)
 
 	  Architecture: s390
 
 	  It is available as of z14.
 
 config CRYPTO_SHA3_512_S390
 	tristate "Hash functions: SHA3-384 and SHA3-512"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  SHA3-384 and SHA3-512 secure hash algorithms (FIPS 202)
 
 	  Architecture: s390
 
 	  It is available as of z14.
 
 config CRYPTO_GHASH_S390
 	tristate "Hash functions: GHASH"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  GCM GHASH hash function (NIST SP800-38D)
 
 	  Architecture: s390
 
 	  It is available as of z196.
 
 config CRYPTO_AES_S390
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, XTS, GCM"
+	depends on CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	help
 	  Block cipher: AES cipher algorithms (FIPS 197)
 	  AEAD cipher: AES with GCM
@@ -83,10 +90,11 @@ config CRYPTO_AES_S390
 	  key sizes and XTS mode is hardware accelerated for 256 and
 	  512 bit keys.
 
 config CRYPTO_DES_S390
 	tristate "Ciphers: DES and Triple DES EDE, modes: ECB, CBC, CTR"
+	depends on CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_DES
 	help
 	  Block ciphers: DES (FIPS 46-2) cipher algorithm
@@ -105,10 +113,11 @@ config CRYPTO_CHACHA_S390
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_HMAC_S390
 	tristate "Keyed-hash message authentication code: HMAC"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  s390 specific HMAC hardware support for SHA224, SHA256, SHA384 and
 	  SHA512.
 
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 8c334c9f2081..78e83ce576ed 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if S390
-source "arch/s390/crypto/Kconfig"
-endif
 if SPARC
 source "arch/sparc/crypto/Kconfig"
 endif
 if X86
 source "arch/x86/crypto/Kconfig"
-- 
2.49.0


