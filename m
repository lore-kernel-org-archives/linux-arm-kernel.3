Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AD6CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+3CqiaAxQ5Dv0GtkZ5CxmnUA/r641bbuVCbWTaIuXY=; b=QSfdinsRRLODxfA+HpwBNZ4e2f
	H+CZ0H67mJ9Y5sAyNCGuDqnNCgIflems7TGP+oC/kBGEvdtNL0HOzQNFySCmU2b7bNOWWh+FkPwFW
	gcXxZzNJs0kKRWGSjG599woLQnaz5AK+a3K4M9w2/1knhyDLeQFIMUrXWAXYKLukj1pcTdsaOGtmg
	dsdL5z6abUohxpjObz/6pKDpeiwVHm0RtINrst5z8KlUQpv0Zwj0VQQITDafibMrRcmSMcQ2tCTFQ
	dX1YgqN0eiBTMMyAx0OFgABVswgNotzzSx1PhaTmUGdD0b7xfKhAU94nJQ4yt2RF2X3NoyuolLhU7
	Q/89eDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNcE-0000000BXik-2WKh;
	Mon, 12 Oct 2026 21:31:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNcD-0000000BXhx-2jHS;
	Mon, 12 Oct 2026 21:31:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12C9343E9B;
	Mon, 12 Oct 2026 21:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D85E6C2BD00;
	Mon, 12 Oct 2026 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791840684;
	bh=GcFzL4ELL+nj+IyYHX4ybTeXBADFAD0vifTNK3LDVpE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JUujQ7gZEryMLbfpU/+xwAy//VOL6BczdfDYLGKRwdHOSdNvpoLCoG8vt5Lmp5Q5w
	 oLaLn6ZexYSve4umd/bGAvbhRayPc3yNmTyMOzrhQUL/mpTPy7lUgPBUBj1h+n/VP+
	 UjzZ50WC/1a3cQFWJEO3J2eIfGDBiJs09wSQmXC2cyQ/TePeIxWctwdP6/HhnQyLcI
	 xZP3jyoqCILgAARdAYjm1E6hWskNEbRt5RJYVBeqonGetbxQZ/8TUm0tt+WwEh81He
	 IIc11sRBcFXoUo3RTg4s7fa1Rfg8pZApkGlZvEzr2QbpBsWgLhJpLeh+7o+o8YRC64
	 S8j9HE3M4YMpA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD458CA9EC5;
	Mon, 12 Oct 2026 21:31:24 +0000 (UTC)
From: Vladimir Kukharenko via B4 Relay <devnull+vladimir.genproof.com@kernel.org>
Date: Mon, 12 Oct 2026 21:31:19 +0000
Subject: [PATCH 2/5] lib/crypto: mips/poly1305: Fix 32-bit length treated
 as 64-bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-libcrypto-4gib-lengths-v1-2-ea566c129a2e@genproof.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791840683; l=2076;
 i=vladimir@genproof.com; s=20261012; h=from:subject:message-id;
 bh=fo5zvO7UGWzgKX7Y6Cw4E2/Klsa+sRLhgZA+i34R0sg=;
 b=qNZ/9YoLUTr8vXw0bDqkJZS43lC7EbywsG6X/i3+sSaB8XXjEggmfsTbfNvgZUWX0Tu6pxc7B
 To4AbqoJXZaAUjuzCKv2HtNnM2a74xvrwkGl+SRB1gqKqFv4A28EdkB
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

The C code declares the length argument of the assembly function
poly1305_blocks() as u32.  The assembly comes from OpenSSL/CRYPTOGAMS,
which declares the length as size_t, and its 64-bit flavour uses all
64 bits of the register.  However, the MIPS n64 ABI keeps 32-bit values,
including unsigned ones, sign-extended in 64-bit registers.  So for a
length of 2 GiB or more, the assembly computes an end pointer 4 GiB
lower than the correct one, below the start of the input, and the loop
reads past the input until it faults.  poly1305_update() passes all
complete blocks to poly1305_blocks() in one call, so a single
poly1305_update() of 2 GiB to 4 GiB triggers this on 64-bit kernels.

Declare the length as size_t, as OpenSSL and the x86_64 code do, rather
than changing the imported assembly.  32-bit kernels use the o32 flavour
of the assembly, and size_t is 32 bits wide there, so nothing changes
for them.

This bug was introduced by commit a11d055e7a64 ("crypto: mips/poly1305 -
incorporate OpenSSL/CRYPTOGAMS optimized implementation").  No in-tree
caller passes 2 GiB or more in one call, so this is an ABI robustness
improvement.

I reproduced the fault on mips64 in QEMU with a single 2 GiB
poly1305_update(), and this patch fixes it.

Assisted-by: LLM
Signed-off-by: Vladimir Kukharenko <vladimir@genproof.com>
---
 lib/crypto/mips/poly1305.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crypto/mips/poly1305.h b/lib/crypto/mips/poly1305.h
index 85de450f1a93..9e9147f40d17 100644
--- a/lib/crypto/mips/poly1305.h
+++ b/lib/crypto/mips/poly1305.h
@@ -8,7 +8,7 @@
 asmlinkage void poly1305_block_init(struct poly1305_block_state *state,
 				    const u8 raw_key[POLY1305_BLOCK_SIZE]);
 asmlinkage void poly1305_blocks(struct poly1305_block_state *state,
-				const u8 *src, u32 len, u32 hibit);
+				const u8 *src, size_t len, u32 hibit);
 asmlinkage void poly1305_emit(const struct poly1305_state *state,
 			      u8 digest[POLY1305_DIGEST_SIZE],
 			      const u32 nonce[4]);

-- 
2.43.0



