Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE13AC369D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xh/2S/nGlgGPJFz9Db514FKyYaJNeBByzBj8vgmPv3Q=; b=n0NgWdr+RTDBVt6SZNOory/j7C
	l2dGSXG1Hdnjjo2etl4fy9uGbhrUk7ldwqG8hHxBbjG1dZXYfAsAbtJ6SG8giKqAenETQ2jL4QSb9
	AAJ/qI8wkGwwfS7SBNjMD3AOE1f/oUzLD6LnBPA8AiVvGzGu9GbzIAt6dGBlomcL0v9T4MHh02gZu
	bG5RN0crnnH7zklurNH2ZhqMHsWTLl4506UYJYjXfdlLPhlZU1GZWmlYjjZf2HJtjouciE4w9oezY
	pJLzLIZKEIqXFMsb1eMcBY03Cw9CJFitm1/gq/H+TJh48+qkEa+qWPPlhJzKSmnzbjII77GM/Ia64
	ErbaBgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5V96-0000000ECmy-2Gx7;
	Thu, 17 Apr 2025 19:43:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Tx8-0000000E2If-3QFr;
	Thu, 17 Apr 2025 18:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 640C94A239;
	Thu, 17 Apr 2025 18:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C6EC4CEEC;
	Thu, 17 Apr 2025 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914430;
	bh=502owMjVm+hoOhMR1Hf0JVEnqbSzLpYcfIVzN4dcz4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XAMyrHeHfLzRwrbxfetwQRDA3HiqUq0/dEEsCTS0UxPPaEbIG5tJmbg3rAGVg2Tk/
	 FWgRyd7u4oJs/J9r/MSQDgrCniZyAAjfv07x8Q433tbtXM/cj02e8z9ogeT8hV3q3k
	 ltrMfiL0NqXOsLJSCktIBNSFeapon/0xKWEuD3gknlKZk/QqP8tIAQ9/aoOZLyKT+w
	 wEHiJRhrRc4OPQUjdEv6x14RMWAq8a1PQmaEc495s7C1yDMMD/HY9o9jkx28ppdzyF
	 5g8gRBVnj0K+a02wOI8Fe01UgGzGW+BWFfJ0rfAaj1KSLahA7+5wtmYqemxVSM60AF
	 fngOflAxzYM2A==
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
Subject: [PATCH 05/15] crypto: mips - remove CRYPTO dependency of library functions
Date: Thu, 17 Apr 2025 11:26:13 -0700
Message-ID: <20250417182623.67808-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_112710_897174_7D7C7B7C 
X-CRM114-Status: UNSURE (   8.99  )
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
CRYPTO_CHACHA_MIPS and CRYPTO_POLY1305_MIPS.  To do this, make
arch/mips/crypto/Kconfig be sourced regardless of CRYPTO, and explicitly
list the CRYPTO dependency in the symbols that do need it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/Kconfig        | 2 ++
 arch/mips/crypto/Kconfig | 8 ++++----
 crypto/Kconfig           | 3 ---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc0772c1bad4..9e0cf394a46b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3136,8 +3136,10 @@ endif # CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER
 
 source "drivers/cpuidle/Kconfig"
 
 endmenu
 
+source "arch/mips/crypto/Kconfig"
+
 source "arch/mips/kvm/Kconfig"
 
 source "arch/mips/vdso/Kconfig"
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 8283664a1f24..beb7b20cf3e8 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -7,41 +7,41 @@ config CRYPTO_POLY1305_MIPS
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_MD5_OCTEON
 	tristate "Digests: MD5 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
+	depends on CRYPTO && CPU_CAVIUM_OCTEON
 	select CRYPTO_MD5
 	select CRYPTO_HASH
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: mips OCTEON using crypto instructions, when available
 
 config CRYPTO_SHA1_OCTEON
 	tristate "Hash functions: SHA-1 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
+	depends on CRYPTO && CPU_CAVIUM_OCTEON
 	select CRYPTO_SHA1
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: mips OCTEON
 
 config CRYPTO_SHA256_OCTEON
 	tristate "Hash functions: SHA-224 and SHA-256 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
+	depends on CRYPTO && CPU_CAVIUM_OCTEON
 	select CRYPTO_SHA256
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: mips OCTEON using crypto instructions, when available
 
 config CRYPTO_SHA512_OCTEON
 	tristate "Hash functions: SHA-384 and SHA-512 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
+	depends on CRYPTO && CPU_CAVIUM_OCTEON
 	select CRYPTO_SHA512
 	select CRYPTO_HASH
 	help
 	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
 
diff --git a/crypto/Kconfig b/crypto/Kconfig
index de71e9c9f2ad..cfa426bea0c6 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1424,13 +1424,10 @@ endmenu
 
 config CRYPTO_HASH_INFO
 	bool
 
 if !KMSAN # avoid false positives from assembly
-if MIPS
-source "arch/mips/crypto/Kconfig"
-endif
 if PPC
 source "arch/powerpc/crypto/Kconfig"
 endif
 if RISCV
 source "arch/riscv/crypto/Kconfig"
-- 
2.49.0


