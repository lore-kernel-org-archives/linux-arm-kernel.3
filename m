Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1994CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 05:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a5ufBgOpY2gQKYmzD4MobeK7u4TYGpALUai94hrRF9c=; b=1gNljgMxtQLgjCquij5vj0gA4l
	VgtFNyL2C0vc6AsX24RdWN1qIwgFN9rcFRGewtt8c53FeUyiQG3XZbN0nbcpdOkT1hFEXMg9g77/S
	TWuF05ZkK498KcytDCrl8Uf4GWBi/1Usn9HH8iI5ymh8KFyiPrfNVqjtis9jrI/65IedCH9+Q1eKz
	N38rEtvFy/I4JJ/pO9Z1+dXhoz5NtMPNQ0mFeGmOMGReVOawV5DeacD9w6q22Xeo+1UfbijuYF8V+
	sitAdlC+Q+YldRwX/9dWIJaLVuZfKYJD5REZgYNquFS5FljGY5NI8zXrGym/o1omIvFckyhFs8W2v
	tEGgy6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG9x3-0000000BClt-0DvP;
	Tue, 04 Nov 2025 05:51:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG9x1-0000000BCki-3aes
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 05:51:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E3DC601E7;
	Tue,  4 Nov 2025 05:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEADC4CEF7;
	Tue,  4 Nov 2025 05:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762235486;
	bh=+zIjCyngQqsvAfo8AR7dkJkLn9qM+SwI4b9HqY5K+Pk=;
	h=From:To:Cc:Subject:Date:From;
	b=eizjvtRx6NsjrEsOsNhJcNTVKKLIsXJ7oUbIaV8aRsTgWT/p+J64taxBobqTFrZvY
	 6OIlp8zMqfHLB/gav3KITTRTtYI63qBODgUTue2maHNe6EmewqqPQN2zLfkiTuUb9Z
	 i0WzZNGKeOe3f4tblvcszGpEFUohXTeSz+X0cc5BMU8RfgtE5rEyxrOjabw+qvFhrR
	 hRFSmR9PvUgWUZ/bTcrOireJaKbCOzEqSMubsBnnNOibHcQYZnu5TKtJnRA+AELcoK
	 5mOFu2k/uVzb7MXQaTZ6XI6fD9OEpTLtHIE0RYkbAj7xmkJwcGQgYdb2qkcpso6T6W
	 fdqe9BM+8CmMQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Date: Mon,  3 Nov 2025 21:49:06 -0800
Message-ID: <20251104054906.716914-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
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
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

This patch is targeting libcrypto-fixes

 lib/crypto/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 8886055e938f..16859c6226dd 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -62,11 +62,11 @@ config CRYPTO_LIB_CURVE25519
 	  of the functions from <crypto/curve25519.h>.
 
 config CRYPTO_LIB_CURVE25519_ARCH
 	bool
 	depends on CRYPTO_LIB_CURVE25519 && !UML && !KMSAN
-	default y if ARM && KERNEL_MODE_NEON
+	default y if ARM && KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
 	default y if PPC64 && CPU_LITTLE_ENDIAN
 	default y if X86_64
 
 config CRYPTO_LIB_CURVE25519_GENERIC
 	bool

base-commit: 1af424b15401d2be789c4dc2279889514e7c5c94
-- 
2.51.2


