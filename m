Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B03EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Owxsz28nAJCFuOT7TBfLKsjNyxHBzYTmQ9QV5ow7WUs=; b=fPRKpJZ6ocO0TtRppTkqlVChWP
	FDFKwGRXsZDYDHD0Vq2XPal3I0hPN6Ej5N3P0KIa/M3ebs4zMTfBgps5O6t917pBbiT0/Da1WjC4o
	6Mdd30Pky87wwddUaEvwHx4DiFklJFpYC4ikC1S6H95lYXP8efdkvvSGCPOWPgFAjaKwC2EYB/G+S
	IGPpXAC5JYG0u/APKA+ZAVHnfzcdtwl6gar3YCdJa2RQeR7MbyCwQLr6JFXugKeYTBxd5nfIpakRD
	9J44rgd7xkDl1jjCYigyyDjV1lr1PzFVFUF18WSVdMTSm9+KfpqUyV8e++92l278RY5izskPv4Duc
	rHJFF36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyNb-000000033F1-2JYV;
	Mon, 16 Jun 2025 01:11:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyLN-000000032zm-11YC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:09:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 634265C55F3;
	Mon, 16 Jun 2025 01:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7154AC4CEE3;
	Mon, 16 Jun 2025 01:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750036139;
	bh=OcGhC0/lwGuhRZjjubRH24r65WOYjJN+RLthQl7NbaI=;
	h=From:To:Cc:Subject:Date:From;
	b=NhOkLjP8gQhIVU1evklDKXIz5QVnCaZf3tnjaKeIyVtZJK2DSbRn5RI1OgMMHrXsq
	 fbcOs620RSNlh9JQecb7rhoNQSOqrQg8fvhf+LzgOjgn3G2gshOqftI344VE/3Y62f
	 5NT+Hu5abZz8Nc7qqn/nk4PxzIoZxVf8CqqSMMnq5FYxCMBClpbEgVrNcRRIx8Si0i
	 hQw+sea6xgQwGAxT4TZrP681aqUteYfrUkePUbhaVOe7U5fsq20zgOYc9IQBdNWjHK
	 H8sYWExRs3+RdbY2KujaS8wJHS/5co+Nv2eEII4CawwJ0rjA5JcF4W0TPW7r9p3h5G
	 MMyk+uOcSS24A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH] lib/crypto/poly1305: Fix arm64's poly1305_blocks_arch()
Date: Sun, 15 Jun 2025 18:06:54 -0700
Message-ID: <20250616010654.367302-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_180901_673135_BB63EA99 
X-CRM114-Status: GOOD (  11.64  )
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

For some reason arm64's Poly1305 code got changed to ignore the padbit
argument.  As a result, the output is incorrect when the message length
is not a multiple of 16 (which is not reached with the standard
ChaCha20Poly1305, but bcachefs could reach this).  Fix this.

Fixes: a59e5468a921 ("crypto: arm64/poly1305 - Add block-only interface")
Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crypto/poly1305-glue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/lib/crypto/poly1305-glue.c b/arch/arm64/lib/crypto/poly1305-glue.c
index 6a661cf048213..c9a74766785bd 100644
--- a/arch/arm64/lib/crypto/poly1305-glue.c
+++ b/arch/arm64/lib/crypto/poly1305-glue.c
@@ -36,18 +36,18 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 	if (static_branch_likely(&have_neon)) {
 		do {
 			unsigned int todo = min_t(unsigned int, len, SZ_4K);
 
 			kernel_neon_begin();
-			poly1305_blocks_neon(state, src, todo, 1);
+			poly1305_blocks_neon(state, src, todo, padbit);
 			kernel_neon_end();
 
 			len -= todo;
 			src += todo;
 		} while (len);
 	} else
-		poly1305_blocks(state, src, len, 1);
+		poly1305_blocks(state, src, len, padbit);
 }
 EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
 
 bool poly1305_is_arch_optimized(void)
 {

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0


