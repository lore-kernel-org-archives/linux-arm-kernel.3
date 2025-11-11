Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6D2CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wDEGmBvnx7PN8BYka/ZU349eCo+Mu7hd+drVSbcKmtM=; b=cziENyTIW4wC459hq5Zji2z7Ud
	UmMYGvvDSKi9d7GZZg2Av467s5fOPHACj9K3257vob18M47Yg0vmR9gS6k6+qTi62Zi3J0VQS33b4
	lqUerP072PeP+UIEKsym1nacHNQrmQIh5bRbdo5RLn4wznhVKAVgzHowybrKwf/J79CZAsKUD4xpK
	oxfYONZc9NLzqbLYzEhJVVLmFfJv3gw0Yy54RMNvgXtonT/a0YFzX/U/4rbKQ/0egnekn4AeajlR8
	Dj29kwj3rPDdlf/3jmUw6MMLFv1+zT6zf1jOx+42ec7hhZoEYp5JqTh2ClkDgiCzHuqkgIuEE9GBA
	LfDcxJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1e-00000007kHv-0TtD;
	Tue, 11 Nov 2025 20:31:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1X-00000007kDv-1JUS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:31:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B68443EBF;
	Tue, 11 Nov 2025 20:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EC2C113D0;
	Tue, 11 Nov 2025 20:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762893090;
	bh=zHzBxlkGa6nv7WpmX7dVn82lvsoCbLYGAXnLZMG86fk=;
	h=From:To:Cc:Subject:Date:From;
	b=CZCXafIIi6srVX6ENRsfpJtHYWt+jPl63auzeyYcXn+f2x5u9O5psc7dgKBaIZTVl
	 4WDovrqyQFudbYfC2sSlP9dVD37bZhBg6K8GWg3Jw1vwBf7xiR5YiQsmPMiwblJeW+
	 MckU5m0tHdE95gyj5wJMBLkyR+2xRID60wNdWAXgSn+eWiHog6UXyRP4P2DTX9O8gp
	 YCNG0Bmnqodyb4opgM8RECBBX75/0nnoDbnZJqrr1/EvVFnosKm3dHsXp5nYypAXsS
	 2UIAG4+AVpB61ZT6TDrYQw+4QjQCnpn28Ok0UsQDiLK6oehBhK9eOYddrGix+UGCpH
	 PYH0WVUMYFHJA==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 5.10] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Date: Tue, 11 Nov 2025 12:29:49 -0800
Message-ID: <20251111202949.242994-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_123131_374849_B1C3FED6 
X-CRM114-Status: GOOD (  11.88  )
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
index c46c05548080..c5d676e7f16b 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -145,10 +145,10 @@ config CRYPTO_NHPOLY1305_NEON
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_NHPOLY1305
 
 config CRYPTO_CURVE25519_NEON
 	tristate "NEON accelerated Curve25519 scalar multiplication library"
-	depends on KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 
 endif

base-commit: df70e44fa05b01476a78d0f6a210354784ff0992
-- 
2.51.2


