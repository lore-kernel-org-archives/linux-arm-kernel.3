Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1778C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XEBnwK5RXVU0kneRCErCZ0nRzPfJAlLl11dCpubW0s=; b=ybxJKvLT8Vaxm+75ScFABKAYv2
	qGp1iKGi7g2sMSjaDxq24KE+/SeNMIWUbnR9bghJNbcIAeP/fjFMf0MM7OtwiAuZs+mLYKZXLF6vr
	hm7YbpSWN4OFyZeEzoy4HRDIh99kEYN4q1ILeSKxeK6yAfh66AOFZG0+fPdYKoDnshqV0uHk9MA8w
	Wnaf+HzaeS1uboejzrwBlS4TbCAfBXrEmT0555uk8JCraEH1AfvRiKP2nymIg0yxt271X/zFmyFuU
	vAsuEYZZ+xfBwKQ55fYKfmpKChDg6TUR/ohgOnZyAw83A8u45XFQ4NLJr2IeweLW4LLPyfUNCXGbB
	wKs8DEDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5VNc-0000000EETA-3D3y;
	Thu, 17 Apr 2025 19:58:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TxC-0000000E2Kj-0hfR;
	Thu, 17 Apr 2025 18:27:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E8206846F;
	Thu, 17 Apr 2025 18:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7754CC4CEE4;
	Thu, 17 Apr 2025 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914433;
	bh=UX4WI8EDuBMolYsjuDM2U8XKg5QnChDBXSYKd39EvNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kEzKamQ77+ydJivcumu5A0EVk/kXXWFfSMds2u7k1YTk1H+rF/67bqU+j+jJWKdl+
	 Q2n7E/dnU6nc5VZ8aq76mLC/hUu6qr1DUvojFRMnBTG+hbecrgjHXxpJDYNWm7g372
	 mmod6G58GI206xhh4cwUi5gmbRp9pUV4UvcKffRJAd/SAd+OZL0MArn+XZe+a+lWse
	 WraOSg0kbetPV1xAm5FmZOqOUclZDEor8z8B8fJwgV0wrK0yHCkvuFiYjwgVictUSB
	 YND7Tu4UPgsbBXF3UxPOsP1otOEQDGQ0geJEuAFCBu/GYCNhtmvhRyLJmhJesven4e
	 nLNW8wApG8jyw==
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
Subject: [PATCH 08/15] crypto: riscv - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:16 -0700
Message-ID: <20250417182623.67808-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
CRYPTO_CHACHA_RISCV64.  To do this, make arch/riscv/crypto/Kconfig be
sourced regardless of CRYPTO, and explicitly list the CRYPTO dependency
in the symbols that do need it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/Kconfig        |  2 ++
 arch/riscv/crypto/Kconfig | 12 ++++++------
 crypto/Kconfig            |  3 ---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..baa7b8d98ed8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1349,8 +1349,10 @@ source "drivers/cpuidle/Kconfig"
 
 source "drivers/cpufreq/Kconfig"
 
 endmenu # "CPU Power Management"
 
+source "arch/riscv/crypto/Kconfig"
+
 source "arch/riscv/kvm/Kconfig"
 
 source "drivers/acpi/Kconfig"
diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index 27a1f26d41bd..08547694937c 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
 
 config CRYPTO_AES_RISCV64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XTS"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
 	help
 	  Block cipher: AES cipher algorithms
@@ -25,43 +25,43 @@ config CRYPTO_CHACHA_RISCV64
 	select CRYPTO_LIB_CHACHA_GENERIC
 	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_GHASH_RISCV64
 	tristate "Hash functions: GHASH"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_GCM
 	help
 	  GCM GHASH function (NIST SP 800-38D)
 
 	  Architecture: riscv64 using:
 	  - Zvkg vector crypto extension
 
 config CRYPTO_SHA256_RISCV64
 	tristate "Hash functions: SHA-224 and SHA-256"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_SHA256
 	help
 	  SHA-224 and SHA-256 secure hash algorithm (FIPS 180)
 
 	  Architecture: riscv64 using:
 	  - Zvknha or Zvknhb vector crypto extensions
 	  - Zvkb vector crypto extension
 
 config CRYPTO_SHA512_RISCV64
 	tristate "Hash functions: SHA-384 and SHA-512"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_SHA512
 	help
 	  SHA-384 and SHA-512 secure hash algorithm (FIPS 180)
 
 	  Architecture: riscv64 using:
 	  - Zvknhb vector crypto extension
 	  - Zvkb vector crypto extension
 
 config CRYPTO_SM3_RISCV64
 	tristate "Hash functions: SM3 (ShangMi 3)"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
 	help
 	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
 
@@ -69,11 +69,11 @@ config CRYPTO_SM3_RISCV64
 	  - Zvksh vector crypto extension
 	  - Zvkb vector crypto extension
 
 config CRYPTO_SM4_RISCV64
 	tristate "Ciphers: SM4 (ShangMi 4)"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_SM4
 	help
 	  SM4 block cipher algorithm (OSCCA GB/T 32907-2016,
 	  ISO/IEC 18033-3:2010/Amd 1:2021)
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 2467dba73372..8c334c9f2081 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if RISCV
-source "arch/riscv/crypto/Kconfig"
-endif
 if S390
 source "arch/s390/crypto/Kconfig"
 endif
 if SPARC
 source "arch/sparc/crypto/Kconfig"
-- 
2.49.0


