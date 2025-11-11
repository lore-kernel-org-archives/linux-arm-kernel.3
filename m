Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B31CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KdN31xXuYFKVQI8Jp2FnJYaw1yv2Qv3LtNQ5g8z6PCE=; b=0pZPB5y4d7x3Z1Jd2kHp1WJOpC
	07AjiccooeACF1JpSN5e4ALczc8lH87Uj5K0t+W+sCGIxf8HLzx49ntrJistdJ1aq81NRapf3dPYS
	CCXIEHfbC5T0w0B4ZFXRujgn3bEk7PgCANCiZvMZGCcLJPqbCCY6wNPTGIGi0N9HKtJV/wwdXbLa4
	0j7PowA2gxpoKPbFbdqkNOr5yoBQpzg9LC53eey/JlwjJnkMSgbQPQS/LYUt2KeafhBcBDE/EhkWg
	vJ+DawUSjUYzrk7rkn8dUV/CYx94yaFcaq5oFRIai593BjJrD+VXPZHp5hFINNtY/wQCLv+ROoopd
	4v3eZ9Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1Y-00000007kEe-1N8u;
	Tue, 11 Nov 2025 20:31:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1U-00000007kCu-3t1o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 215EC60203;
	Tue, 11 Nov 2025 20:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942EFC4CEFB;
	Tue, 11 Nov 2025 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762893087;
	bh=dXiCaWUGSa4Z/KJc4JAWLqIkBPTGwgLMrgbnWFFzsrQ=;
	h=From:To:Cc:Subject:Date:From;
	b=cw3v8poCuJW0u4V7p7iwqOGspyGNT5oSTMzwy/nMmaCcBowIU83xm/H+W7af7Nyfp
	 YSuHyCrX0tCJ/zREliCtYzsfDGDHOB6FogxqTtRKaNG6lt2gtFbBef/C7WHtgqti4T
	 y8FXZqFa1gpqiVCi1LtBSkvRPYcZvbNLZD43EI9F89rSQm/9efegLqyMILYAqYn843
	 6evTfnKe/24grZfiQI0VXC/cfDiznNFL5yzboj9dGXq+J0xN+qckfBTK66uHnD/P5U
	 aQ2Mr3uFQW5o4qlI85OZp+e8MjQWVaPkpBXsh+sfvvz9y8zFnOsHAaRt43Lg+YQDSk
	 Cd/v3yBXxX7Cg==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 5.15] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Date: Tue, 11 Nov 2025 12:29:46 -0800
Message-ID: <20251111202946.242970-1-ebiggers@kernel.org>
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
index 149a5bd6b88c..d3d318df0e38 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -164,10 +164,10 @@ config CRYPTO_NHPOLY1305_NEON
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_NHPOLY1305
 
 config CRYPTO_CURVE25519_NEON
 	tristate "NEON accelerated Curve25519 scalar multiplication library"
-	depends on KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 
 endif

base-commit: cc5ec87693063acebb60f587e8a019ba9b94ae0e
-- 
2.51.2


