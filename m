Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30992C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWTRKkKWhvpczKSnn8QWkVNNu349jBQ7I522SXZ74dU=; b=PCmIcT4zZROn9oh26Wv/24F86I
	VFRQFwg/xHu6QeXINbX+7pUrK/fH3q6anogkoGgjhdnn7+jJ2HmNeu43ONIWodxGcskXS25Dlnl3T
	6fKidZCNiLUNpcljdPcDEPu2SqnUkbzzN3+PWZnFvbmumGOkzhJXJFKq0TY4uwM+V7M1LxTQihbPN
	RGdkpnOta9P3lPgEcE2nUb2CcdCpqlMbiydS1qL5eht3l2fIG46W5s7jy2+6BTBxXL12rKl61JWfn
	QGbjyuuCBy8V1EtCFvYovUMk6HVx2E0ntf7zgY1e0jBfH1TZ3gpLdNiriO/NjlotIevfUp/k1BE3O
	23Ty4kjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5UCY-0000000E5bt-1L4H;
	Thu, 17 Apr 2025 18:43:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TxA-0000000E2K3-2g52;
	Thu, 17 Apr 2025 18:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38CB74A526;
	Thu, 17 Apr 2025 18:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96532C4CEEA;
	Thu, 17 Apr 2025 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914432;
	bh=dsE7qfp3A3zmlcPG+tvm4sv24/L4ppO0aAJ6BZiEshE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rDsCxtn3lebQV/DysLhlXFbm/jncgwomZE43WtxQP24LtFE9xOa6eiBclZTQg8gDA
	 3i+j3v6r50KIUvO1d2f48AAFIoj4fUY/I6hS7t2+pB5aL99Y91V+Kzolg1S3dFzK1W
	 YmIRVjS0t8vEJ6EiUPzxMajKFyxEWSlavCF2LEd6VhnTb/rYUhXfOqH5nXDNaDa8ni
	 ar9klYXp61RWo3pSI30VW4AUilqd4McXNnCe0pDOHszpxAKhTden3pUGSby2brHFmP
	 9x6UwlkgdIPBH9H34XsZtVKioNaIav0ZkUaIIrvvYZfYdw17pnWZSyakOtR5xQXcRz
	 o04U7Rx5/k7vg==
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
Subject: [PATCH 07/15] crypto: powerpc - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:15 -0700
Message-ID: <20250417182623.67808-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_112712_716403_C8512905 
X-CRM114-Status: UNSURE (   9.50  )
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
CRYPTO_CHACHA20_P10 and CRYPTO_POLY1305_P10.  To do this, make
arch/powerpc/crypto/Kconfig be sourced regardless of CRYPTO, and
explicitly list the CRYPTO dependency in the symbols that do need it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/Kconfig        |  2 ++
 arch/powerpc/crypto/Kconfig | 16 +++++++++-------
 crypto/Kconfig              |  3 ---
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6722625a406a..9ffd80880675 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1346,8 +1346,10 @@ config PHYSICAL_START
 endif
 
 config PPC_LIB_RHEAP
 	bool
 
+source "arch/powerpc/crypto/Kconfig"
+
 source "arch/powerpc/kvm/Kconfig"
 
 source "kernel/livepatch/Kconfig"
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 8bcc69013464..0f14bdf104d5 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (powerpc)"
 
 config CRYPTO_CURVE25519_PPC64
 	tristate
-	depends on PPC64 && CPU_LITTLE_ENDIAN
+	depends on CRYPTO && PPC64 && CPU_LITTLE_ENDIAN
 	select CRYPTO_KPP
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help
@@ -15,46 +15,48 @@ config CRYPTO_CURVE25519_PPC64
 	  Architecture: PowerPC64
 	  - Little-endian
 
 config CRYPTO_MD5_PPC
 	tristate "Digests: MD5"
+	depends on CRYPTO
 	select CRYPTO_HASH
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: powerpc
 
 config CRYPTO_SHA1_PPC
 	tristate "Hash functions: SHA-1"
+	depends on CRYPTO
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: powerpc
 
 config CRYPTO_SHA1_PPC_SPE
 	tristate "Hash functions: SHA-1 (SPE)"
-	depends on SPE
+	depends on CRYPTO && SPE
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
 config CRYPTO_SHA256_PPC_SPE
 	tristate "Hash functions: SHA-224 and SHA-256 (SPE)"
-	depends on SPE
+	depends on CRYPTO && SPE
 	select CRYPTO_SHA256
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
-	depends on SPE
+	depends on CRYPTO && SPE
 	select CRYPTO_SKCIPHER
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, and XTS modes
 
@@ -72,11 +74,11 @@ config CRYPTO_AES_PPC_SPE
 	  architecture specific assembler implementations that work on 1KB
 	  tables or 256 bytes S-boxes.
 
 config CRYPTO_AES_GCM_P10
 	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
-	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
+	depends on CRYPTO && PPC64 && CPU_LITTLE_ENDIAN && VSX
 	select CRYPTO_LIB_AES
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
 	select CRYPTO_SIMD
@@ -104,17 +106,17 @@ config CRYPTO_POLY1305_P10
 	select CRYPTO_LIB_POLY1305_GENERIC
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_DEV_VMX
         bool "Support for VMX cryptographic acceleration instructions"
-        depends on PPC64 && VSX
+        depends on CRYPTO && PPC64 && VSX
         help
           Support for VMX cryptographic acceleration instructions.
 
 config CRYPTO_DEV_VMX_ENCRYPT
 	tristate "Encryption acceleration support on P8 CPU"
-	depends on CRYPTO_DEV_VMX
+	depends on CRYPTO && CRYPTO_DEV_VMX
 	select CRYPTO_AES
 	select CRYPTO_CBC
 	select CRYPTO_CTR
 	select CRYPTO_GHASH
 	select CRYPTO_XTS
diff --git a/crypto/Kconfig b/crypto/Kconfig
index cfa426bea0c6..2467dba73372 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if PPC
-source "arch/powerpc/crypto/Kconfig"
-endif
 if RISCV
 source "arch/riscv/crypto/Kconfig"
 endif
 if S390
 source "arch/s390/crypto/Kconfig"
-- 
2.49.0


