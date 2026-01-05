Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A113C2A077
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8A5s08j9C620oqGFPCl12LgSyPZskDWpf26EFaiB/u4=; b=pEvur/q0NRPrqNcio1Utp2SFj+
	F0+hFbQlPLa3GPjQWSKp90qxQ9YRLTX4z5sVW191AWd39cgsrtwG/D73oGDpWN0EgVb0UYV4Y40C8
	1profbPBbjoZM2K2C2ADj4hyBR53be+vQ+peZn4WUFQk/K5a+xI4XtrJc8gByI1JNLGkJlye92JzS
	m56V0aDcCSstM0rQ/fz2Qxo1Jzj0MJpY2BKmuDB8buXj9W2aUuJIdKb+AmnqeTroSr84thUo+6zha
	WweWcaRq6XCqP5mu0yH+w6N+I3hBaAfLYYjSWlYcWfOEcZxP2aVDKAW45CDbBx+Ns1NDh2PUoh1Bl
	MtES4niw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvo-0000000AjEr-0ewc;
	Mon, 05 Jan 2026 05:15:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccve-0000000Aj2d-2MEF;
	Mon, 05 Jan 2026 05:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A1CE4430B;
	Mon,  5 Jan 2026 05:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9360AC19424;
	Mon,  5 Jan 2026 05:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590094;
	bh=NaJeCMt68rOEMjT7oGa1VxCfK2+6f9/LQJxPSOh0Gn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=igzB1iG36I5ddwcCBE6IyNjLvWLYZddcUzh3vYUDSgjc80fDHOeJgz4Ttks7krqct
	 Xaj+2+Pd+DV44mOpYKoOdnjBs63BiWnHvapVzcjGu4Lueu2IvUOOJLTjDWT7qdeS+0
	 r2Wqpt2qb3tX0hWPzIB9Sl/T2zeTBmaSX2YRUxnTSWGcH7egQzFmEw1xenEG2kRiN3
	 sr1FQe6dnkZ70RTBR6ok0orcHW3XKrfBwnq7jWs/q9gtch1mvSPjAPzIUciiTs2LiM
	 vcQCl+yMtyokIL//1b7maM2ojnVhXhqx8Ol3cvyjugy8onEJpcWWz4iUR479Pbfeb4
	 c6dikBpXXTx7Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 06/36] crypto: arm64/aes - Select CRYPTO_LIB_SHA256 from correct places
Date: Sun,  4 Jan 2026 21:12:39 -0800
Message-ID: <20260105051311.1607207-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211454_652033_5807EBEB 
X-CRM114-Status: UNSURE (   8.67  )
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

The call to sha256() occurs in code that is built when either
CRYPTO_AES_ARM64_CE_BLK or CRYPTO_AES_ARM64_NEON_BLK.  The option
CRYPTO_AES_ARM64 is unrelated, notwithstanding its documentation.  I'll
be removing CRYPTO_AES_ARM64 soon anyway, but before doing that, fix
where CRYPTO_LIB_SHA256 is selected from.

Fixes: 01834444d972 ("crypto: arm64/aes - use SHA-256 library instead of crypto_shash")
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index da1c9ea8ea83..4453dff8f0c1 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -38,11 +38,10 @@ config CRYPTO_SM3_ARM64_CE
 	  - ARMv8.2 Crypto Extensions
 
 config CRYPTO_AES_ARM64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR, CTS, XCTR, XTS"
 	select CRYPTO_AES
-	select CRYPTO_LIB_SHA256
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 	  Length-preserving ciphers: AES with ECB, CBC, CTR, CTS,
 	    XCTR, and XTS modes
 	  AEAD cipher: AES with CBC, ESSIV, and SHA-256
@@ -64,10 +63,11 @@ config CRYPTO_AES_ARM64_CE
 config CRYPTO_AES_ARM64_CE_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_AES_ARM64_CE
+	select CRYPTO_LIB_SHA256
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
 	  - ECB (Electronic Codebook) mode (NIST SP800-38A)
 	  - CBC (Cipher Block Chaining) mode (NIST SP800-38A)
@@ -81,10 +81,11 @@ config CRYPTO_AES_ARM64_CE_BLK
 config CRYPTO_AES_ARM64_NEON_BLK
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
+	select CRYPTO_LIB_SHA256
 	help
 	  Length-preserving ciphers: AES cipher algorithms (FIPS-197)
 	  with block cipher modes:
 	  - ECB (Electronic Codebook) mode (NIST SP800-38A)
 	  - CBC (Cipher Block Chaining) mode (NIST SP800-38A)
-- 
2.52.0


