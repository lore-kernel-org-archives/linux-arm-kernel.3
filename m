Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66C3C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5NCP1iL/rH8zzNIa7uNqWAL/C6tg/YPNhdi5gJ7aiU=; b=fEWkdKmqK1Me9h+YUvSb/y8nx4
	zVVethazgqtLnp0Gpqd8/5TQWGMa9p+quPItwOO+xmW5eBm5iwnVQubc2j66LIzFBfagqmMs3YVVH
	KlgDq3ydEMtYC33liPX4tC3Od+eTSkvqxaSI00N/VlBGND7U4cvo9CHmgldMRnSoONBYObNIbiQbs
	IsqBC2e4DKiXZHgngasDwCRqrg0O7SxMndczpMzeMjmzZRUQykUR/6S8U5iAt/HsMCb/pcM5am3im
	mfAaQiwI4YIHE0DLsO7dqfJhBzE/ntO+L+494c8uKGw0un2MErvxgvbp7LTTTLRm6FnFj1Eb5Y6MB
	qexs+Y0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYfZ-00000000weq-1qZM;
	Sun, 06 Jul 2025 23:21:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYWP-00000000vmT-33jy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 23:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8204DA50CDB;
	Sun,  6 Jul 2025 23:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF17FC4CEF2;
	Sun,  6 Jul 2025 23:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751843504;
	bh=XWfjXYT5FJgcE1mXz/f5qW91oQVmDL2Rc7vpGHvJHCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VZw/74aYNyJCvF/E+Jw7X4nCvVoF1NKvNTDjDkO+pFKvp8sd1Hz2oEKygRlE9SNKD
	 kZ6an3PCWsh5GWm4eMc0X8yp39Cjrm1ZDbhlNAHXcL7A2Hj3wQt94iyJgg1j3YllVj
	 LxG3tdal1EGEqgsswwdZlSoWFhiD993bVunTZl5qv22vTFOfJTiKotnaUjdeT6OXIC
	 WaE5LyvYbTUdDj6xTB49htkSUrkp6/8JHXjo7OS4mMbxaYsF5dUu9nY1urWz8hF1yv
	 /iReSS8SiAP6BNraPAb3kD7t4mi6PAgY3hiAddznUaDRLWYDpS+nqW+r75G3sHJXR7
	 UwsKKa0LsJ0Rw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/5] lib/crypto: arm/poly1305: Fix register corruption in no-SIMD contexts
Date: Sun,  6 Jul 2025 16:10:57 -0700
Message-ID: <20250706231100.176113-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250706231100.176113-1-ebiggers@kernel.org>
References: <20250706231100.176113-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_161145_846137_BB41A51B 
X-CRM114-Status: GOOD (  11.48  )
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

Restore the SIMD usability check that was removed by commit 773426f4771b
("crypto: arm/poly1305 - Add block-only interface").

This safety check is cheap and is well worth eliminating a footgun.
While the Poly1305 functions *should* be called only where SIMD
registers are usable, if they are anyway, they should just do the right
thing instead of corrupting random tasks' registers and/or computing
incorrect MACs.  Fixing this is also needed for poly1305_kunit to pass.

Just use may_use_simd() instead of the original crypto_simd_usable(),
since poly1305_kunit won't rely on crypto_simd_disabled_for_test.

Fixes: 773426f4771b ("crypto: arm/poly1305 - Add block-only interface")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm/poly1305-glue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/crypto/arm/poly1305-glue.c b/lib/crypto/arm/poly1305-glue.c
index 5b65b840c166..2d86c78af883 100644
--- a/lib/crypto/arm/poly1305-glue.c
+++ b/lib/crypto/arm/poly1305-glue.c
@@ -5,10 +5,11 @@
  * Copyright (C) 2019 Linaro Ltd. <ard.biesheuvel@linaro.org>
  */
 
 #include <asm/hwcap.h>
 #include <asm/neon.h>
+#include <asm/simd.h>
 #include <crypto/internal/poly1305.h>
 #include <linux/cpufeature.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -32,11 +33,11 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 			  unsigned int len, u32 padbit)
 {
 	len = round_down(len, POLY1305_BLOCK_SIZE);
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
-	    static_branch_likely(&have_neon)) {
+	    static_branch_likely(&have_neon) && likely(may_use_simd())) {
 		do {
 			unsigned int todo = min_t(unsigned int, len, SZ_4K);
 
 			kernel_neon_begin();
 			poly1305_blocks_neon(state, src, todo, padbit);
-- 
2.50.0


