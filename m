Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A4BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 19:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hZQ2R0YEs0vZ6aEcLQBtSfCUDsQ+taoCfYorQUDELk=; b=o27lAgPs0sxGt7Soemz/rG37ZE
	ebXF5gRpMrfBmeiy8lmvuGjdYSD1BAQYYnH6SrXTIpGJIxxzQ74FsOSuX8mAgCqzmgxLStVA7nvI1
	EDs0ZePpOeOofr0NcmGV18kEMCYt3xL6O6FquDT15YHwv4daOYG2RMrt4rDSQmAxnIrC23tjYhROe
	efDbgrc1xRpEOc+HyzYjYabWGI+DAy1Iqopvwo6AXXaVWIex8cidxRgDehZLj65SwwU7lLlhP95/t
	efrOL+UHfe4rB3jyx3Un8OKLS9uvC/G9WJfYca5gVBQxBvvaCrshuK5EA49pqEL3vcCy+9m2FkIhx
	NfV7kcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5VNd-0000000EETa-3Q28;
	Thu, 17 Apr 2025 19:58:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TxI-0000000E2No-4Al4;
	Thu, 17 Apr 2025 18:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8hZQ2R0YEs0vZ6aEcLQBtSfCUDsQ+taoCfYorQUDELk=; b=flfnrYo06h7yakmM4b1x96WoUk
	5c4D2gWworLd0vtTvhJ2hjtGtr6uvblREVtjH3qdpV54cTtwnIEvJa9GzxMg5S2RjFu/L6mvbxACF
	ET5h5SMCuYSVx8HbReHI+YP92bZQMEPUn8SSkSsD/3UHS72nZO82AHpjPsJjswmeFsYRKVjzPZGeW
	TRaTTOnwskg9xqAKrxNh4V2PG+PEBHmDTwPTqo1z1ODWhhUJpVxbsHsYBKNAe7Ke8YjF7pycewUif
	T3yuw+miLSSieBCFOZC/GKnmBpw3HPlZL1Q98FJ3lqVX7fMm7bV3SHBHcu1m8fv0Asw6jRTEu0aW1
	1uTuHFOA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5TxF-0000000AMJG-3Pn4;
	Thu, 17 Apr 2025 18:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE1A549E43;
	Thu, 17 Apr 2025 18:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A178C4CEEE;
	Thu, 17 Apr 2025 18:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914435;
	bh=JbJS8/qnHgUt3U/s/OZ1wHouJGsPrwOIMNb0fsrruts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IsPQ7SM08OE2nVaOMuo7BI2L0WCPbuWvkvRFKYA1VN20m7TA2WLujzpAcLu7ZMcib
	 hPnCRg0E7SNiql3hUMjtjrKocI+hy9AGuNATMqCgnk/rNoSndaJyXohW2QtNmOUSPf
	 HrM2yP1EtnKQZI2TXj4jwGIcWlPFoOfnUtif6W1J55H7QSOzeGZBBl4pFsL/oOnTEN
	 CWOaPKhbHIyWJ9YsfjPH79eEhWbfY/xLRdrWQ9tJfUzkID0IPOW6mp/fkmf8M1/xUN
	 vdYRLr2CQUbbJhMAXeeDorK0RWUQEsRQB9v5kyhJZrk3fHLwmkx9SgLxxg4V3BakOJ
	 ld/9yQXGcf11g==
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
Subject: [PATCH 11/15] crypto: sparc - source arch/sparc/crypto/Kconfig without CRYPTO
Date: Thu, 17 Apr 2025 11:26:19 -0700
Message-ID: <20250417182623.67808-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_192718_217451_2D7CCFAA 
X-CRM114-Status: UNSURE (   8.03  )
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

Source arch/sparc/crypto/Kconfig regardless of CRYPTO, so that if
library functions are ever added to there they can be built without
pulling in the generic crypto infrastructure.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/Kconfig        |  2 ++
 arch/sparc/crypto/Kconfig | 14 +++++++-------
 crypto/Kconfig            |  3 ---
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 0f88123925a4..b1081e627a28 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -407,10 +407,12 @@ config UBOOT_ENTRY_ADDR
 	 hardcoded by the SPARC32 and LEON port.
 
 	 This is the virtual address u-boot jumps to when booting the Linux
 	 Kernel.
 
+source "arch/sparc/crypto/Kconfig"
+
 endmenu
 endif
 
 endmenu
 
diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index e858597de89d..477a85370507 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (sparc64)"
 
 config CRYPTO_DES_SPARC64
 	tristate "Ciphers: DES and Triple DES EDE, modes: ECB/CBC"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_DES
 	select CRYPTO_SKCIPHER
 	help
 	  Block cipher: DES (FIPS 46-2) cipher algorithm
@@ -16,61 +16,61 @@ config CRYPTO_DES_SPARC64
 
 	  Architecture: sparc64
 
 config CRYPTO_MD5_SPARC64
 	tristate "Digests: MD5"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_MD5
 	select CRYPTO_HASH
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: sparc64 using crypto instructions, when available
 
 config CRYPTO_SHA1_SPARC64
 	tristate "Hash functions: SHA-1"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_SHA1
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: sparc64
 
 config CRYPTO_SHA256_SPARC64
 	tristate "Hash functions: SHA-224 and SHA-256"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_SHA256
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: sparc64 using crypto instructions, when available
 
 config CRYPTO_SHA512_SPARC64
 	tristate "Hash functions: SHA-384 and SHA-512"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_SHA512
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
 	  Architecture: sparc64 using crypto instructions, when available
 
 config CRYPTO_AES_SPARC64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_SKCIPHER
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preseving ciphers: AES with ECB, CBC, and CTR modes
 
 	  Architecture: sparc64 using crypto instructions
 
 config CRYPTO_CAMELLIA_SPARC64
 	tristate "Ciphers: Camellia, modes: ECB, CBC"
-	depends on SPARC64
+	depends on CRYPTO && SPARC64
 	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	help
 	  Block ciphers: Camellia cipher algorithms
 	  Length-preserving ciphers: Camellia with ECB and CBC modes
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 78e83ce576ed..c0906bb4f844 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if SPARC
-source "arch/sparc/crypto/Kconfig"
-endif
 if X86
 source "arch/x86/crypto/Kconfig"
 endif
 endif
 
-- 
2.49.0


