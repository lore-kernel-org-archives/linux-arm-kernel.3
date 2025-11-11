Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13C3CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6lgaUPxY9uk/rxCed02bVJ/yGcPr1OrQZqZUHMp5VrA=; b=nXlvY7KtzaHUhSPaEm08Ggz6pa
	XqAd+3l29U2PmhOOY8GZVe0KVre2C57HgJbiKIBQiCz/ft4qxMWUDL1u9quX5sgO73FyOS2aRE0MV
	D65FtpN/CrSemp1r+TM64faSWNLvnYEiKdZf1VrbClW+OcrrlaNwjVkboPRy41R3ewHx+Q9e3znn2
	FvL8J0efBylbHnOHr1ajh7Vzk3LfqvNeKP8kvt6q+9BmAomYvfLlJPXaLsbqMm0JRUDgPt5H+YFfL
	bgErr0CEscEWLl1cX0It1B2KbkxTOErScUVDQooPSf0IC7IcGfGU2Gp5LpWkF2fZev8vV2SFLiY10
	nlWAQjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1U-00000007kCv-1qe3;
	Tue, 11 Nov 2025 20:31:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1M-00000007kBO-2qHB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63AAE4326B;
	Tue, 11 Nov 2025 20:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D873C4CEFB;
	Tue, 11 Nov 2025 20:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762893080;
	bh=gCZM1PW6lB4y/ctI+DBLIH5T9x6I2f3q/IeDY5nP8NY=;
	h=From:To:Cc:Subject:Date:From;
	b=hMLdmCzg667o9JxB9QrDVqLmME6u/bikaDYs9dlbLlCwWEoFdB7co4vETD5hmDeeg
	 mF1uD4dOPy+N+TtUMyozFIr4D/cMnoKJYbSbaDjUfCpvBYBzROVMRD7xPf7pNVZ7qW
	 CcLo+KW+Rr1AZVUrSQBFYqlGuKo7rzzu+IjOkIkZ0BkcneZz9smixyPY5ul+AWfcvr
	 kucQcAdi8zyySb6fcXZSHCOIIwEQ3lG8pgND4zuOoSfV/7+EeAZEzGVM+at1odjJp5
	 ivFcGmJBLU/eOtbTEyQS9L1jCkrTIUNGI6BxRtPnuBRMMEg3yOfdXpWFQab6monUJK
	 hwmud04yL1PaQ==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 6.12] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Date: Tue, 11 Nov 2025 12:29:36 -0800
Message-ID: <20251111202936.242896-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_123121_345793_A4CD5588 
X-CRM114-Status: GOOD (  11.96  )
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

commit 44e8241c51f762aafa50ed116da68fd6ecdcc954 upstream.

On big endian arm kernels, the arm optimized Curve25519 code produces
incorrect outputs and fails the Curve25519 test.  This has been true
ever since this code was added.

It seems that hardly anyone (or even no one?) actually uses big endian
arm kernels.  But as long as they're ostensibly supported, we should
disable this code on them so that it's not accidentally used.

Note: for future-proofing, use !CPU_BIG_ENDIAN instead of
CPU_LITTLE_ENDIAN.  Both of these are arch-specific options that could
get removed in the future if big endian support gets dropped.

Fixes: d8f1308a025f ("crypto: arm/curve25519 - wire up NEON implementation")
Cc: stable@vger.kernel.org
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/r/20251104054906.716914-1-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index f87e63b2212e..df2ae5c6af95 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
 config CRYPTO_CURVE25519_NEON
 	tristate
-	depends on KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
 	select CRYPTO_KPP
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	default CRYPTO_LIB_CURVE25519_INTERNAL
 	help

base-commit: 8a243ecde1f6447b8e237f2c1c67c0bb67d16d67
-- 
2.51.2


