Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E889C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e55mlTGuBtf8ZUCPwwbiD1SPhG7sGOkFDv6fFB5pZ2g=; b=FP53Q50lM11+i6TYRXEarEdN9M
	cD71EZ6UupbNOhClKVePBcYIkZF0ndfTp7dP7WDdu0CATWrlSiRBHLZhsbSOGG0A94QZPjrjZB0U5
	wvGv2xjDUx1gxt6msETVsqmCMph+HkUOO5SzSKDbdCC2HRzesvSSHrHIBSrUCWQA3T75sLD7hJ/vi
	+YfYaC+mCCRKs/AfGjtIj1GNpWzsyvTB/+/N71MYstjoUVA0XlQ57X5UGVCQ2Q80EBuMnRt3XlKbZ
	dzS6I6PH089OA6EprIoRz2WrNjBM6mLWtOVJOm6V9DL7tyDF/hP93M2ykfvZbqBd0jXLGRggpz0W8
	qzPuX3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYhr-00000000wmU-22n9;
	Sun, 06 Jul 2025 23:23:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYWR-00000000vo2-2pXn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 23:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2087B61475;
	Sun,  6 Jul 2025 23:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489D6C4CEED;
	Sun,  6 Jul 2025 23:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751843506;
	bh=Szsb85EsQ+Zh1w4jNZz/88qNbUj4Tj26HrAtW7FyjqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BLw6kDkrizdxub9fjMWAZyiLgAQCIRS02Qtjf8aBUsmv08tcyRIpytwlj6zVajjSx
	 A7gFOuwgrjL+9yKxrWrIi3ND3tl0UGiRNQPz5q2gRrfFMHt1YvASf4ssJfSo4nXqKc
	 /33jxZCkDvHL93ZJGVywgCZdV7QkLSBkjZvmXZvdv/KuDakTidmefdfshG55iLCOZ1
	 9gDLNdYzbhTlCxHYF0+CyeHRoGGkaLBeTqQ6p/0CJ839Vrva+HomoBhwSGAC60vnb7
	 oAIEx4RUFtj1kMA0eLGt5ERxEXxrxjKQv0uci+8sRz4TeJL1SG7XG9IRfuS//mkmpX
	 Ux/qgcMUvcIEw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 5/5] lib/crypto: x86/poly1305: Fix performance regression on short messages
Date: Sun,  6 Jul 2025 16:11:00 -0700
Message-ID: <20250706231100.176113-6-ebiggers@kernel.org>
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

Restore the len >= 288 condition on using the AVX implementation, which
was incidentally removed by commit 318c53ae02f2 ("crypto: x86/poly1305 -
Add block-only interface").  This check took into account the overhead
in key power computation, kernel-mode "FPU", and tail handling
associated with the AVX code.  Indeed, restoring this check slightly
improves performance for len < 256 as measured using poly1305_kunit on
an "AMD Ryzen AI 9 365" (Zen 5) CPU:

    Length      Before       After
    ======  ==========  ==========
         1     30 MB/s     36 MB/s
        16    516 MB/s    598 MB/s
        64   1700 MB/s   1882 MB/s
       127   2265 MB/s   2651 MB/s
       128   2457 MB/s   2827 MB/s
       200   2702 MB/s   3238 MB/s
       256   3841 MB/s   3768 MB/s
       511   4580 MB/s   4585 MB/s
       512   5430 MB/s   5398 MB/s
      1024   7268 MB/s   7305 MB/s
      3173   8999 MB/s   8948 MB/s
      4096   9942 MB/s   9921 MB/s
     16384  10557 MB/s  10545 MB/s

While the optimal threshold for this CPU might be slightly lower than
288 (see the len == 256 case), other CPUs would need to be tested too,
and these sorts of benchmarks can underestimate the true cost of
kernel-mode "FPU".  Therefore, for now just restore the 288 threshold.

Fixes: 318c53ae02f2 ("crypto: x86/poly1305 - Add block-only interface")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/x86/poly1305_glue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/crypto/x86/poly1305_glue.c b/lib/crypto/x86/poly1305_glue.c
index 968d84677631..856d48fd422b 100644
--- a/lib/crypto/x86/poly1305_glue.c
+++ b/lib/crypto/x86/poly1305_glue.c
@@ -96,11 +96,19 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *inp,
 
 	/* SIMD disables preemption, so relax after processing each page. */
 	BUILD_BUG_ON(SZ_4K < POLY1305_BLOCK_SIZE ||
 		     SZ_4K % POLY1305_BLOCK_SIZE);
 
+	/*
+	 * The AVX implementations have significant setup overhead (e.g. key
+	 * power computation, kernel FPU enabling) which makes them slower for
+	 * short messages.  Fall back to the scalar implementation for messages
+	 * shorter than 288 bytes, unless the AVX-specific key setup has already
+	 * been performed (indicated by ctx->is_base2_26).
+	 */
 	if (!static_branch_likely(&poly1305_use_avx) ||
+	    (len < POLY1305_BLOCK_SIZE * 18 && !ctx->is_base2_26) ||
 	    unlikely(!irq_fpu_usable())) {
 		convert_to_base2_64(ctx);
 		poly1305_blocks_x86_64(ctx, inp, len, padbit);
 		return;
 	}
-- 
2.50.0


