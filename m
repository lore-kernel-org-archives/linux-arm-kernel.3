Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF4DC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXOTPuOli1eIcJwQG34NgZuSSH6yPSMhMkpDB3PNs3Y=; b=uIKZfPLNRLsjgZvgTcQPTVS35L
	8Lpo/go372qzgyGMALergnXFgcDXm1irIKd+6hbvdr3dgoQaZ6c//m3Zix+Or+QRPtvuU1dFEeisi
	/qWsje9I/7/V4pesejXlQTvefiILyLULpjH2V9ABC0Xg54xEa3Dc/hI5FfdRupZ6YQoVpNFzHpLBN
	5W3AVa+RUQgot5wm+2ih5QvKuhsxbil5Kh/3OrnR56BRXp30mG5+4ZArJkgMAhEQQsjw2CDr5VMt+
	JUQFcqSMJEPzcG0SoxKkVwkGkSHx9OWSQ1e5NArnKJtRJ40x5oSEV6m+kbQ9yoHGd1ttHBJhkM5Ma
	JLbNeOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8e-000000085fz-3Pxf;
	Tue, 22 Apr 2025 18:14:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FXj-00000007iLe-3LVw;
	Tue, 22 Apr 2025 15:28:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A905B4A93C;
	Tue, 22 Apr 2025 15:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BB9C4CEEE;
	Tue, 22 Apr 2025 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745335695;
	bh=ySujzJwEjUZrj9er8XlrWX/11KoXjZIlZ2vhV5/jq10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XEW0GEqxgTqLHaerzxUJU4xk3fj9xEqoO/EYKRS1Eft5CyaVT/Z1GFjj0U6ny1qYe
	 0aY/9Lrp4vdGIxKmiYNDft+Gp77LjbpWI2nbZ14A0PFu2mglRgt7zVdf2RwCSoSIhK
	 JoOYh9HORvTvGhtCLsAYk6bqotdZa7eMI64E/J2Jpzu2A4wcXQyMgFJq1tAcssT/D+
	 NPeWN6JPQ23t4tWsJH+v6OJhUYX5L+LBGlY0vbNLN+J+QMAL44zORAGF3hLgPPi5nP
	 UIZnBUvU8VRMrtYpcPHuUBZHYq19UFdT4KvlUGWex0ssq62MNSTsTp3AHmn6krvh74
	 LWnvtzdV9RGQw==
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
Subject: [PATCH v3 01/13] crypto: arm64 - drop redundant dependencies on ARM64
Date: Tue, 22 Apr 2025 08:27:04 -0700
Message-ID: <20250422152716.5923-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422152716.5923-1-ebiggers@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_082815_848530_FF21B726 
X-CRM114-Status: GOOD (  10.37  )
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


