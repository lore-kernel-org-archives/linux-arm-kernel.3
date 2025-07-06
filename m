Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46821C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czGuSTyHwNzLJ6v8X0XVwNakgTSawlJS73MLps3QLYs=; b=vvDplsRN6ieZ/sAklrkidiDGEI
	DAwWaybG4hz7Q84JjowRr8kG88xnT60PLEZJO1LXuAseoA5E/X/uNrR9yiBSRrPzDzIuQKb7tjAMx
	YGHojXEx9W3B482LY0g9Qx4Z8fVf0TX5eTY8tHaxmRLLWYKtLI6eg4qd4yerY0gWdsOe7VbwGy9BZ
	U05jMUrSH0/6blllkARZPS6sAOxubQUapP9SES8UAe79QONu+hNkzKzfrnkLFG7uvIjJUV7SjYlM0
	sDt1oUY6nItm1BmvBzj72rsrmkhFekEX7A9pc63egTsqbx0q1Qeu1bN15aNDE1L9FLhNnnJH+adJ7
	9CifXetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYb0-00000000wOK-05yN;
	Sun, 06 Jul 2025 23:16:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYWO-00000000vmH-2fyi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 23:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C492961461;
	Sun,  6 Jul 2025 23:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51AFC4CEF3;
	Sun,  6 Jul 2025 23:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751843503;
	bh=teoV448S0gcMOu8C5WoirpthEs9NO+TdMk4xuLOATJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f3a7W0of7/Jn47K34fx9xqgeSmDmpq/O5gMCPuremhPnhrR8nwudK87rOYh6nUYqd
	 OLWLwRYYw2X37+u+56dtHC/AQTkEIjrXb+ZSc7XGDYjHMLfn8D9FSa0Ia+B0+F1S0f
	 nVJKmv8qJw0qtGzW50Lw+T1S5O1aKhKjvXSvGkGyg+ntLDKkmeiPvRLoF4NhTTitdP
	 OJ1n/3J0FSbQEL9n1uI1Xb27QBA9uF8IbpUdbePaW6x7BpBlVDWqGkBUHo1NCtSEdG
	 quNoqEUTbkT2B68MKYjFZGb8+AczHW119pYGvbGi0SgC0eMj9I5feNFdJ7fnEk6ObS
	 0aqVgphHrc6NA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 1/5] lib/crypto: arm/poly1305: Remove unneeded empty weak function
Date: Sun,  6 Jul 2025 16:10:56 -0700
Message-ID: <20250706231100.176113-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706231100.176113-1-ebiggers@kernel.org>
References: <20250706231100.176113-1-ebiggers@kernel.org>
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

The __weak and empty definition of poly1305_blocks_neon() was a
workaround to prevent link errors when CONFIG_KERNEL_MODE_NEON=n, as
compilers didn't always optimize out the call.

This call is now guarded by IS_ENABLED(CONFIG_KERNEL_MODE_NEON).  That
guarantees the call is removed at compile time when NEON support is
disabled.  Therefore, the workaround is no longer needed.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm/poly1305-glue.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/lib/crypto/arm/poly1305-glue.c b/lib/crypto/arm/poly1305-glue.c
index 2603b0771f2c..5b65b840c166 100644
--- a/lib/crypto/arm/poly1305-glue.c
+++ b/lib/crypto/arm/poly1305-glue.c
@@ -25,15 +25,10 @@ asmlinkage void poly1305_blocks_neon(struct poly1305_block_state *state,
 asmlinkage void poly1305_emit_arch(const struct poly1305_state *state,
 				   u8 digest[POLY1305_DIGEST_SIZE],
 				   const u32 nonce[4]);
 EXPORT_SYMBOL_GPL(poly1305_emit_arch);
 
-void __weak poly1305_blocks_neon(struct poly1305_block_state *state,
-				 const u8 *src, u32 len, u32 hibit)
-{
-}
-
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 			  unsigned int len, u32 padbit)
 {
-- 
2.50.0


