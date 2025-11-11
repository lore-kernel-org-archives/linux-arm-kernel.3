Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB454CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TPVkaNl9EMV6ccXR/g+FfiJlVyHBk2JtZsqqU4GjliI=; b=NOfhvoPMIgchD8aRhkhmAbBPid
	SkAjC7k7Ox8+U3uessBSRkBWEawpJGmlAYMoJdRpx8Zh7D7H0URVP3eaHT75cUGaAkHZ+VR90lPIO
	FZ2+qVj9bljwwsbEBQdULbd1jJoIOWU5onsoP7I4FvJZX7jSmc2ctSEli/AUAqEfQkSInW5HmVnYR
	0vO8/e//YR3jb78AMfLJBP5vrPbX5KPQx7YXMuQEizm5sPZLC/mMcCjS1xYV2nHU2XrhJTrluIu7r
	w4qVa1d0vPQ4P9Xq3EoXe3pOKnSwh21fqzpuqj+rDuj56jbpfJInKw59hUsHzUTiycxTF2aK9ZIAe
	6l2FoWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1Y-00000007kEL-05pe;
	Tue, 11 Nov 2025 20:31:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIv1P-00000007kBm-2nKC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C58A43E86;
	Tue, 11 Nov 2025 20:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8654CC113D0;
	Tue, 11 Nov 2025 20:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762893082;
	bh=rT77b2HCYaDvTU3abPqxbFu9KwVZ7Glvk+EqZXcz3ro=;
	h=From:To:Cc:Subject:Date:From;
	b=hVejOsfGKcsbAuuyruGaXzWGTgnsPKfc64CZ0NEY05AuorQjA6RtkgLgId0BgSFzG
	 wmzA0fQgl6tpGVqrY+o8G3hrrvoIMQBkxc+DnDri7udraOWKAoarvRMCJWw7m3/pvf
	 gCwX2VRiVhpf6ihpKNbja7h0t4ZrfILmdh55t7ruEre+7MT0y9tJyNPPcrctSJj8l1
	 XtHjBbsHHvFjZvk/eSIk4ShyuaqKUeg4hsC1kZMvXFYeacgAdh4NO8qLQIsFismXul
	 K/j/sy2UIXu+x0UBixIiAkCOCbkQ18/zVhfXu8xTr+eui7vcmfrY3ajKxTbVSH7R9J
	 Uyn9ZwPS38f+w==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 6.6] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
Date: Tue, 11 Nov 2025 12:29:41 -0800
Message-ID: <20251111202941.242920-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_123123_723792_699D8B44 
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
index 847b7a003356..1f684e29cff2 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -2,11 +2,11 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (arm)"
 
 config CRYPTO_CURVE25519_NEON
 	tristate "Public key crypto: Curve25519 (NEON)"
-	depends on KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON && !CPU_BIG_ENDIAN
 	select CRYPTO_LIB_CURVE25519_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CURVE25519
 	help
 	  Curve25519 algorithm
 

base-commit: 0a805b6ea8cda0caa268b396a2e5117f3772d849
-- 
2.51.2


