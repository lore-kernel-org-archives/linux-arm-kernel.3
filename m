Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8E6C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 05:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:
	References:In-Reply-To:Message-Id:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEsQISDA3u12a7opt+0/BxEe+FnDfYm05yGNoN+ZGgs=; b=niYgDvTva7Pki6egLJveQ+Rykq
	VH61s4y1LSeIZnLsYku/6YvXupyXiwfllIXaBmKhvqX/mA1cHqGFgLkDpKRxCeBMDgLAuDtDwtywg
	nWeI1Q21h3Isge1+MjIyL/s+O7mbMNqgYEOu47x6QWHaSiQQ4+XKYM6fHwwLKR53l02RbijiA2GJS
	G/M8SjQurD2tYU9a2+oYspsiz5pw3b3oFB1cfcCM+7P/rv6rEqA/yIVeHwVdPL7xNqX1fRE0hxNvQ
	EKwunk3c8vvx9LLCQ4KCz34C6KS84f1sr/r6UHfAY1DJZCIe6FOe+sCaMKanqHoRc7kdtUZKPhYP/
	3WPOHtvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9GzS-00000004kwf-2X1X;
	Mon, 28 Apr 2025 05:25:14 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Grg-00000004hI3-0hBg;
	Mon, 28 Apr 2025 05:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vEsQISDA3u12a7opt+0/BxEe+FnDfYm05yGNoN+ZGgs=; b=Em6RC+92ZIhGDWZJ3ftfwdpBUp
	cBsK1u3fX8WJoEver0IK/pFnsxoZIkzRB8ooW7so3bQ48jQ2kw4fT30Gcrzbp8E1IQNHP4IKCG+S5
	vuy0wB5fM0FMpDtTw/lJG7n0GiBle4Q9x4MnOCnQRFgCLYtDwpbr+Bq5E0c84QLsmCLzSQJzikyW3
	WQwMa/GZCK+Tlpvice0t0wCAtCrCcORjVApCQogTcWMXnm8+vHSMq++V9GASeO/3nE+Fy1SAZnFNq
	JiEUsFKd/Jkx68DhGPmOHUMKa0oWcHSL1AtY6ggG14Y/Qwuw7fZ/fAcprY3n1d0pHiE5lVBSRyEVn
	SqSF+8pQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9Grd-001WRY-04;
	Mon, 28 Apr 2025 13:17:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 13:17:09 +0800
Date: Mon, 28 Apr 2025 13:17:09 +0800
Message-Id: <5787872fd00f3f761beb2f6e3ee3f5bddd8f2c3a.1745816372.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745816372.git.herbert@gondor.apana.org.au>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v3 PATCH 03/13] crypto: arm64/sha256 - remove obsolete chunking
 logic
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_221712_195355_8233B6F7 
X-CRM114-Status: GOOD (  11.00  )
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

Since kernel-mode NEON sections are now preemptible on arm64, there is
no longer any need to limit the length of them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 arch/arm64/crypto/sha256-glue.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/sha256-glue.c b/arch/arm64/crypto/sha256-glue.c
index 26f9fdfae87b..d63ea82e1374 100644
--- a/arch/arm64/crypto/sha256-glue.c
+++ b/arch/arm64/crypto/sha256-glue.c
@@ -86,23 +86,8 @@ static struct shash_alg algs[] = { {
 static int sha256_update_neon(struct shash_desc *desc, const u8 *data,
 			      unsigned int len)
 {
-	do {
-		unsigned int chunk = len;
-
-		/*
-		 * Don't hog the CPU for the entire time it takes to process all
-		 * input when running on a preemptible kernel, but process the
-		 * data block by block instead.
-		 */
-		if (IS_ENABLED(CONFIG_PREEMPTION))
-			chunk = SHA256_BLOCK_SIZE;
-
-		chunk -= sha256_base_do_update_blocks(desc, data, chunk,
-						      sha256_neon_transform);
-		data += chunk;
-		len -= chunk;
-	} while (len >= SHA256_BLOCK_SIZE);
-	return len;
+	return sha256_base_do_update_blocks(desc, data, len,
+					    sha256_neon_transform);
 }
 
 static int sha256_finup_neon(struct shash_desc *desc, const u8 *data,
-- 
2.39.5


