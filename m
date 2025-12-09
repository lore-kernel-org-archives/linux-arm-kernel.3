Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C83D3B982
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 22:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PxowHSFcrJ1vXq6KJNZ4sYqE1keLaVpwRUrJL/fRVg=; b=jZOXN35Uk7JAauvbUj/ud+/Nfu
	zHkhLAZurE//Szpzb7Rj3CvyMwwWEGYxxOcRivYaZPYeKKpogJrmtpmOs5B11w7ug2SCo+QkRIPSa
	JY7KowhfxloCXHy6DLJVMxfmjwfeYuDhNDBpChJs9yekzdsoynIWKyiyolrg1PmIo3EkdAp+T3cnj
	d5BlSMvmG9x6C4N3BSjgwiz6x4rnm1Y1YdZpmFJO+smMh1fOSrPOnrUm/CirYLyaxO+xM7W7om2eV
	1rgO/vcZAgJ0nLt69uCUZwvsjyKEWkoaSyhcEdlZpFGfJfbENt6npFEswEX+KjOLaB9F5G6B7MQdu
	LHOyNeZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6IX-0000000ErxY-1Bpy;
	Tue, 09 Dec 2025 22:35:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT6IV-0000000ErxR-3xCF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 22:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CADC6017F;
	Tue,  9 Dec 2025 22:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66852C4CEF5;
	Tue,  9 Dec 2025 22:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765319706;
	bh=E3ZY5GrmUasYc7LNtlvHAHgQyO5fJCHZUGxegGCcdyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K6pKhJtk2coLOHazLr8r43p7gqFd3uwLSXvX+usbee0GsRzK+15Dz46TSOkyIuH2f
	 TmXKb2aqvW2Lsp78EASY9/Xc0kpETlELrBgOqwPmg81ODw53Od1mLvm68Q2fkDwh9g
	 nJfC3xMVHPpjPtQOBRT3tmOOulYiqs65R1T4LKejfx8C4dpr5FRBTQQnmDi3QUCBPR
	 iOjFtXojHwCOwN877kZTE4QXBoHUHhRfKCUPw0lwYNhekNUVIXiuQsfLIli09izfIx
	 w7Y0MRe/uYko2LAcSth729Fg8bN6BXbOcByHOjmxNY5/QLKT5OGfllbjO59GFjF++W
	 fly38mbKT4Y2Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] crypto: arm64/ghash - Fix incorrect output from ghash-neon
Date: Tue,  9 Dec 2025 14:34:17 -0800
Message-ID: <20251209223417.112294-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com>
References: <DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com>
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

Commit 9a7c987fb92b ("crypto: arm64/ghash - Use API partial block
handling") made ghash_finup() pass the wrong buffer to
ghash_do_simd_update().  As a result, ghash-neon now produces incorrect
outputs when the message length isn't divisible by 16 bytes.  Fix this.

(I didn't notice this earlier because this code is reached only on CPUs
that support NEON but not PMULL.  I haven't yet found a way to get
qemu-system-aarch64 to emulate that configuration.)

Fixes: 9a7c987fb92b ("crypto: arm64/ghash - Use API partial block handling")
Cc: stable@vger.kernel.org
Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Closes: https://lore.kernel.org/linux-crypto/DETXT7QI62KE.F3CGH2VWX1SC@cknow-tech.com/
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

If it's okay, I'd like to just take this via libcrypto-fixes.

 arch/arm64/crypto/ghash-ce-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index 7951557a285a..ef249d06c92c 100644
--- a/arch/arm64/crypto/ghash-ce-glue.c
+++ b/arch/arm64/crypto/ghash-ce-glue.c
@@ -131,11 +131,11 @@ static int ghash_finup(struct shash_desc *desc, const u8 *src,
 
 	if (len) {
 		u8 buf[GHASH_BLOCK_SIZE] = {};
 
 		memcpy(buf, src, len);
-		ghash_do_simd_update(1, ctx->digest, src, key, NULL,
+		ghash_do_simd_update(1, ctx->digest, buf, key, NULL,
 				     pmull_ghash_update_p8);
 		memzero_explicit(buf, sizeof(buf));
 	}
 	return ghash_export(desc, dst);
 }

base-commit: 7a3984bbd69055898add0fe22445f99435f33450
-- 
2.52.0


