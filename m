Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30106CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PdbaZ/Pl0YWr2v9cp9gdq00lpdA5rIKJC9kP//Magco=; b=n/ualJ32G741r65vgJh1p/GuR8
	GMxZ1YMDozFlYhqNBSpbvHtBCauw1O9uZexujKwbre599QraNen9xOaqgCEvj0LQGifL6CIIhGjGE
	ycrLjHL3tBUCQQmLmM3iQFlytC5KnHDUEOS3IKOV+E/d75++UxIUMimqDdqg5u01mgceBdIZVtxWI
	RPCVnRZTSxBCj0rnMS4qK0aCb0mpYqwP9eEH3avnV1ZFXrqI3W7Vtc9dFHd9xkQ+ipjrPs+/odDZ7
	tf9VZosrNvu8bD34Uz8EoZK99pbO8kba3VohwsSxfSHqLbPWOg91/1YpXt1Q0baZNKhlr4r52a5Gj
	Thg4EM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNcF-0000000BXjt-06uJ;
	Mon, 12 Oct 2026 21:31:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNcD-0000000BXi2-48Nd;
	Mon, 12 Oct 2026 21:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E1DA602A8;
	Mon, 12 Oct 2026 21:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3821C2BCFD;
	Mon, 12 Oct 2026 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791840685;
	bh=I7f6rDN7NdrQVCnnQyVijoCApsep/PLG4qtIDjWsGzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e0xPa4RltyZWgPt3j0VFEHM7b9mH4LFPFiwYdgxvt6G7asAdr23qDlubOHXCanRG2
	 1Cnm+DVptXYgFxXzWNTtdQI6P181/NOCo14YX91XLYxuAg9JEj1ysI3K/DKi/1tEQc
	 EV/LvmgnIOp9qxgSZFd/c+hzO9Q3egwldF/SZZ/MISqGwYdwbVMIfkKfoEt+MyaURv
	 VZCJZAZyOcAi0skYMD1b4g1aUPM8hbNyJMzz/nw43utU6AAg0OK//cq6D6n6tYOMo+
	 UX8PnHdxxGZL5a75nr5XhyWyNw86k5/oslLmRFxo8qEIVP1yk6y3SBZJpy2oQCAdKp
	 JWa6Hjeva6ZLQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF65CC6B03;
	Mon, 12 Oct 2026 21:31:24 +0000 (UTC)
From: Vladimir Kukharenko via B4 Relay <devnull+vladimir.genproof.com@kernel.org>
Date: Mon, 12 Oct 2026 21:31:20 +0000
Subject: [PATCH 3/5] lib/crypto: arm64/poly1305: Fix 32-bit length treated
 as 64-bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-libcrypto-4gib-lengths-v1-3-ea566c129a2e@genproof.com>
References: <20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com>
In-Reply-To: <20261012-libcrypto-4gib-lengths-v1-0-ea566c129a2e@genproof.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Vladimir Kukharenko <vladimir@genproof.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791840683; l=1781;
 i=vladimir@genproof.com; s=20261012; h=from:subject:message-id;
 bh=3X4KjNZCvYTpASxJw7cTyOKaRln3LqL4XSBvokwu7TM=;
 b=W2t+f5+yF8aKsOGkWzZBLm4nYHkonWwAO7SmhDYiVEI4JDEB/vmFQan2b6+ZguD/gEb1HKimy
 TOTzMpjGThnCdpj01JXCsli5BOroYcTU+x+DnbWYgOBTXABEvFUFWeG
X-Developer-Key: i=vladimir@genproof.com; a=ed25519;
 pk=EqOzBSKBgFn7ExzKj5f9T8u+1yTrGVlLBwf3fj/sdHM=
X-Endpoint-Received: by B4 Relay for vladimir@genproof.com/20261012 with
 auth_id=1169
X-Original-From: Vladimir Kukharenko <vladimir@genproof.com>
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
Reply-To: vladimir@genproof.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vladimir Kukharenko <vladimir@genproof.com>

The C code declares the length argument of poly1305_blocks_arm64() and
poly1305_blocks_neon() as u32, but the assembly, which comes from
OpenSSL/CRYPTOGAMS where the length is a size_t, reads it from the
64-bit register x2.  The arm64 ABI leaves the upper 32 bits of a 32-bit
argument unspecified, and gcc and clang don't zero-extend it.  In
practice the upper bits are zero in the current callers, so I don't
know of a failure.

Declare the length as size_t, as OpenSSL and the x86_64 code do, rather
than changing the imported assembly.  The assembly also reads hibit from
x3, but the callers always pass the constant 0 or 1.

This has been the case since commit f569ca164751 ("crypto:
arm64/poly1305 - incorporate OpenSSL/CRYPTOGAMS NEON implementation").

Assisted-by: LLM
Signed-off-by: Vladimir Kukharenko <vladimir@genproof.com>
---
 lib/crypto/arm64/poly1305.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/crypto/arm64/poly1305.h b/lib/crypto/arm64/poly1305.h
index 3d4bde857699..205a7b5fcf47 100644
--- a/lib/crypto/arm64/poly1305.h
+++ b/lib/crypto/arm64/poly1305.h
@@ -14,9 +14,9 @@
 asmlinkage void poly1305_block_init(struct poly1305_block_state *state,
 				    const u8 raw_key[POLY1305_BLOCK_SIZE]);
 asmlinkage void poly1305_blocks_arm64(struct poly1305_block_state *state,
-				      const u8 *src, u32 len, u32 hibit);
+				      const u8 *src, size_t len, u32 hibit);
 asmlinkage void poly1305_blocks_neon(struct poly1305_block_state *state,
-				     const u8 *src, u32 len, u32 hibit);
+				     const u8 *src, size_t len, u32 hibit);
 asmlinkage void poly1305_emit(const struct poly1305_state *state,
 			      u8 digest[POLY1305_DIGEST_SIZE],
 			      const u32 nonce[4]);

-- 
2.43.0



