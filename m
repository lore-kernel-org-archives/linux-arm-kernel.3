Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F68BC369D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 19:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXOTPuOli1eIcJwQG34NgZuSSH6yPSMhMkpDB3PNs3Y=; b=dhTFmEBKsJ4SPsHaSVCRpRlKc5
	WgWErth0upsSgdDpahPWYIs/wRKOWiqrKCHzYCbKwRh4skPPohgFO5vQfMm2to8BFgjgO+jMtBTyk
	ruRIS9Z1pnwNxb39H/7Avc2hezUq5RGb7D1kusr4DATisrwHbQYsPsEXwBg6mssXRawLQp6+P8P9J
	ZrYciY3MnJSlnJD6X2KV1q4aAyI6JDLz0mmY0pISDk2ke6pD7ORxnZky4texX0VpnYkU37fYqf2Zh
	r9tSr6XrEgfwVApRMGCkAR0BwkJ3BT3xYsupIG3k7Ms6asnx7HMbjOvbPyx0g8m2ooekcGD/EQenQ
	g+YPeh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6aPz-00000002xK4-1SeS;
	Sun, 20 Apr 2025 19:33:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6aKJ-00000002vfT-3B0F;
	Sun, 20 Apr 2025 19:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5773C4A6E6;
	Sun, 20 Apr 2025 19:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A345C4CEF0;
	Sun, 20 Apr 2025 19:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745177257;
	bh=ySujzJwEjUZrj9er8XlrWX/11KoXjZIlZ2vhV5/jq10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o9TI7aC0W6sDFYjdwFetT0Htr1lKbZ7CRIb92PqjTlyPCPRl834rlsPq4Upa7TwVU
	 KUK3O17RKKGtV9jgwuXyKmuOVSZQqgsouS72xWZ2DXYXR2p3aaop7Z/twb1Pp2xNrh
	 VSR8kglU79GjgMfqghQnbKAFMEFT6wrVHmrnbFNrAdKrNv8Ow9NZ1Wk+PQCHs+Ubwf
	 05CeLhHFtz4u9QqW+2DLK5sXGu72F+lpuVxsqScpn5fKKuKiGEaQkcwCdA9aHHDDv0
	 KmyWrMC+UAVURp3ysmv/Bn5eXgycy3Jqe2p8DBklv3xLuCGcbUhveQqhNiOlXVgRYj
	 y//Xcbxc8AzVw==
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
Subject: [PATCH v2 01/13] crypto: arm64 - drop redundant dependencies on ARM64
Date: Sun, 20 Apr 2025 12:25:57 -0700
Message-ID: <20250420192609.295075-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420192609.295075-1-ebiggers@kernel.org>
References: <20250420192609.295075-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_122739_822048_88879BB9 
X-CRM114-Status: UNSURE (   9.87  )
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

arch/arm64/crypto/Kconfig is sourced only when CONFIG_ARM64=y, so there
is no need for the symbols defined inside it to depend on ARM64.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 7c2f63f2e3072..704d0b7e1d137 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -135,11 +135,11 @@ config CRYPTO_AES_ARM64
 
 	  Architecture: arm64
 
 config CRYPTO_AES_ARM64_CE
 	tristate "Ciphers: AES (ARMv8 Crypto Extensions)"
-	depends on ARM64 && KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 
@@ -252,11 +252,11 @@ config CRYPTO_SM4_ARM64_NEON_BLK
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_AES_ARM64_CE_CCM
 	tristate "AEAD cipher: AES in CCM mode (ARMv8 Crypto Extensions)"
-	depends on ARM64 && KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_AES_ARM64_CE
 	select CRYPTO_AES_ARM64_CE_BLK
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
-- 
2.49.0


