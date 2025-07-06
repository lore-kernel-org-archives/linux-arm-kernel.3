Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0E2C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjdnC8s6cNxQLR+WiYN5C+/TrAPQClXeRhOilPsX4eU=; b=ZFfJ7MBVVjZVOH92m+2zJ+cjEJ
	ahG0q2r6+hTws6QR8yvetaljL79wCBghp/4CYX3RKEwkSGpRRaDSLh2XPfzv5mJwfva91R0FoI/ny
	2ATVex4QHjKI0MkdXNyadKINLmr/8m9PoMtB5RwgyMyxkPpy/zQA/CLhM7YreDZ5n49NahbHFVcqH
	UmOh6Z8u0X/mSCwJ4cKxa5/1QQDri9vwxifW2vIeTdvWKOHrdZnmGuQpd8D+Wod+P/ApIP7dHjcIV
	KkgogUgGxUh8nEw9CMr2l9bHFr7ywS6KVa43o+AhnhZhCR3LjYhY872KZWu16zfuCqKV00dqpYB92
	wFtmPecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYdH-00000000wWH-37r3;
	Sun, 06 Jul 2025 23:18:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYWQ-00000000vme-0DZh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 23:11:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 600BB61473;
	Sun,  6 Jul 2025 23:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88026C4CEF1;
	Sun,  6 Jul 2025 23:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751843505;
	bh=eNLm4Gv8Ke0apz7fKKHlDcDiwap6peJnw5T7wbtI+Fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KEl716Q/rK2VskCIQXoLJ37scDB2Fm19apyuGqS/cPSPUMWjpMuGpH/CQk/nCvxwb
	 0MOsJ+LZR5sAEBNawyFs1A2IcutUGYMhilgG4Ih6IqfQ8BpjMY2o02fcqr9jU+Jl/b
	 Z6l54XfQegzQi4jRdpmV+zohLeDQV5EHEV+VY4hyXDxchkcv7lhdl0v90Tpa/f3OkR
	 abOc6SXVC0dtEWnbp6fgSs2+TAdnF4bOVLhfh/p6Hnm7SFGUUxIbWCt0cWRdQHedNu
	 ARrsqagae5ClEE5uLmBvMtLYXcrMWFInU4JuU4LAwq8PDUCxnKXm3ijXOM0XWDgD17
	 pIZeqhJR8EasA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 3/5] lib/crypto: arm64/poly1305: Fix register corruption in no-SIMD contexts
Date: Sun,  6 Jul 2025 16:10:58 -0700
Message-ID: <20250706231100.176113-4-ebiggers@kernel.org>
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

Restore the SIMD usability check that was removed by commit a59e5468a921
("crypto: arm64/poly1305 - Add block-only interface").

This safety check is cheap and is well worth eliminating a footgun.
While the Poly1305 functions *should* be called only where SIMD
registers are usable, if they are anyway, they should just do the right
thing instead of corrupting random tasks' registers and/or computing
incorrect MACs.  Fixing this is also needed for poly1305_kunit to pass.

Just use may_use_simd() instead of the original crypto_simd_usable(),
since poly1305_kunit won't rely on crypto_simd_disabled_for_test.

Fixes: a59e5468a921 ("crypto: arm64/poly1305 - Add block-only interface")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm64/poly1305-glue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/crypto/arm64/poly1305-glue.c b/lib/crypto/arm64/poly1305-glue.c
index c9a74766785b..31aea21ce42f 100644
--- a/lib/crypto/arm64/poly1305-glue.c
+++ b/lib/crypto/arm64/poly1305-glue.c
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
@@ -31,11 +32,11 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 			  unsigned int len, u32 padbit)
 {
 	len = round_down(len, POLY1305_BLOCK_SIZE);
-	if (static_branch_likely(&have_neon)) {
+	if (static_branch_likely(&have_neon) && likely(may_use_simd())) {
 		do {
 			unsigned int todo = min_t(unsigned int, len, SZ_4K);
 
 			kernel_neon_begin();
 			poly1305_blocks_neon(state, src, todo, padbit);
-- 
2.50.0


