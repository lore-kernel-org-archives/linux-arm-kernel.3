Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E4AC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83KXcYEIsD7ECHA1NKyy7H7dP/VBiX8gnJNujLDgaCQ=; b=s4pKIbCRAWNa+hKYlXRLjrcl7M
	97HYtni2Rq3owLQe8gue4uOgCflBzCMdMvaA4W98Ya9Tda/+bXsh5875Cmf2LWgnpDK2M16G44wcr
	B6imVVVGntZehi7bFYseMGTI7DKW03mFh5E9bjkGkX2/xgLgRP9mJ/WRQbXUkil3JdXR/Z2AT1VhG
	wzD3RkHiZwus14420R5Qn3/YlqcdP/hefBnkF3jCmMwSRGHWO9sDLKU1+kgsu2n26ioJE22QSCF1D
	+MZtLWBD3z6PrwFJkg915iplKpv7geZej9Rr7gIVFxfYk9Fy88pPc6geC4IOQnS7XSZnx2qEeb8IN
	be8noxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8i-000000085lF-2uZN;
	Tue, 22 Apr 2025 18:14:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FXk-00000007iM5-29Lf;
	Tue, 22 Apr 2025 15:28:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C48365C5C9A;
	Tue, 22 Apr 2025 15:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E98C4CEE9;
	Tue, 22 Apr 2025 15:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335695;
	bh=Wsz8KfnWpKz3RjYagwsQwuMx7mcDuZ3DmLJCHCvCnLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uBsUn+1uknnAtCvGxigHZ4JZToY6+Gy1ixr68PQvV2N71BUQl87w4yMZvlkmjCwZ0
	 RiCZCN4vIV2n0ynKuXxTLvrHQVn87JR/9LqXwv5UnpKrmGxngl4unZebkUVwATB/sE
	 IaMI4ynGGpFpbI3ZRnoRy8dF2K06NBvFqAB9SziK+JLDHzV8/1oz0c8BZdihd951Qw
	 c5+HPn83XoB+DEMH5jnPKhtWdxpTkVxm/BPC9ZhGUEnLGxZ5UomAOSh+VAoTMwUtNK
	 4tXgPPEpd0lYeetuHeVpKT/bTaC5YXBvG+nlQRTRr/c8aoQJpGfdjm9w+zNTOpb2JF
	 xGv23N6geYPRQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 02/13] crypto: powerpc - drop redundant dependencies on PPC
Date: Tue, 22 Apr 2025 08:27:05 -0700
Message-ID: <20250422152716.5923-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_082816_594691_712EE1C2 
X-CRM114-Status: UNSURE (   9.33  )
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

arch/powerpc/crypto/Kconfig is sourced only when CONFIG_PPC=y, so there
is no need for the symbols defined inside it to depend on PPC.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/Kconfig | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index cbcf76953d835..8bcc690134644 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -15,48 +15,46 @@ config CRYPTO_CURVE25519_PPC64
 	  Architecture: PowerPC64
 	  - Little-endian
 
 config CRYPTO_MD5_PPC
 	tristate "Digests: MD5"
-	depends on PPC
 	select CRYPTO_HASH
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: powerpc
 
 config CRYPTO_SHA1_PPC
 	tristate "Hash functions: SHA-1"
-	depends on PPC
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: powerpc
 
 config CRYPTO_SHA1_PPC_SPE
 	tristate "Hash functions: SHA-1 (SPE)"
-	depends on PPC && SPE
+	depends on SPE
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
 config CRYPTO_SHA256_PPC_SPE
 	tristate "Hash functions: SHA-224 and SHA-256 (SPE)"
-	depends on PPC && SPE
+	depends on SPE
 	select CRYPTO_SHA256
 	select CRYPTO_HASH
 	help
 	  SHA-224 and SHA-256 secure hash algorithms (FIPS 180)
 
 	  Architecture: powerpc using
 	  - SPE (Signal Processing Engine) extensions
 
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
-	depends on PPC && SPE
+	depends on SPE
 	select CRYPTO_SKCIPHER
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, and XTS modes
 
-- 
2.49.0


