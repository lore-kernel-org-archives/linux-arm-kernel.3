Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7611010F9313
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 00:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unHewld+dJt798Jq9li9R8/1g9BFw1ZhXfesj7v0xS8=; b=XscZTDIboglUezcyW1SatG61wS
	oOGAS36dWk5+qk4bAGxHUPKx+0YAaIh+TGzg4iFAzMFJplF6AOLVkRGChyC0Xab2gg4CNhwr+ff7/
	O9FthGmjPA3K8bAYK+ZFnMYomFbRMN2kGrnC6eVngQiIFR4QEK5MtqIYRTjHSOxBHfr92h0Wt84IF
	peoUZNVNr51F8QOO/X0OHcI+p57XAfm8tE1YdgawRruP8C0l9t0BFQr4WQpsMCI8vHEXh7Omtuohy
	hj24Q+WFbasCDmlxGA8EhuxetLFPXeORiJItIRKMh0MWE6FmlQdK1ZT5QT7WBRjpBtwChuULKAvrN
	PDpe9JpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7m-0000000DiEs-1VuE;
	Wed, 01 Apr 2026 00:07:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7j7e-0000000DiBP-2k4q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 00:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BC6C44517;
	Wed,  1 Apr 2026 00:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D7EC2BCB4;
	Wed,  1 Apr 2026 00:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775002070;
	bh=IDxofDV1l6itbnGBXpDqaJyt+/X6blNaQzeWk25J7Ts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MLnFZ9ZGjNSPQd/8I/31b5XsbGh4co6ArbnJCiY8mDm0jMZkPalDqjTX5wNAnkBNo
	 hjJnO+ANvexDSdzaAxZhxTYJT4F61XpgLpkvVPd++oiCnG57LPEr22T2+SeYSLVSel
	 +nxzysiwnMsFChEc1Ho0QgXp9yeVk/usNn8bz9/UWDc6YeZz/6eQ2Zsj8UPVCTyG9s
	 L+pFRYyUMQBPa8wRe89v3DROFp5Njl2tucohO6Y4LV9uzwAnal0dfP3mAtew+i9cn1
	 9VFc6z+HXIUkGapBP9Oq/Da6Eszzw0zImOdMXcqwYswJQtxXFqzM6ehAQcwbB4FP5V
	 yX1vWGuxuQibQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 4/9] lib/crypto: arm64/poly1305: Remove obsolete chunking logic
Date: Tue, 31 Mar 2026 17:05:43 -0700
Message-ID: <20260401000548.133151-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
References: <20260401000548.133151-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_170750_732350_57212A3E 
X-CRM114-Status: GOOD (  10.98  )
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

Since commit aefbab8e77eb ("arm64: fpsimd: Preserve/restore kernel mode
NEON at context switch"), kernel-mode NEON sections have been
preemptible on arm64.  And since commit 7dadeaa6e851 ("sched: Further
restrict the preemption modes"), voluntary preemption is no longer
supported on arm64 either.  Therefore, there's no longer any need to
limit the length of kernel-mode NEON sections on arm64.

Simplify the Poly1305 code accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/arm64/poly1305.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/lib/crypto/arm64/poly1305.h b/lib/crypto/arm64/poly1305.h
index b77669767cd6..3d4bde857699 100644
--- a/lib/crypto/arm64/poly1305.h
+++ b/lib/crypto/arm64/poly1305.h
@@ -25,21 +25,15 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 static void poly1305_blocks(struct poly1305_block_state *state, const u8 *src,
 			    unsigned int len, u32 padbit)
 {
 	if (static_branch_likely(&have_neon) && likely(may_use_simd())) {
-		do {
-			unsigned int todo = min_t(unsigned int, len, SZ_4K);
-
-			scoped_ksimd()
-				poly1305_blocks_neon(state, src, todo, padbit);
-
-			len -= todo;
-			src += todo;
-		} while (len);
-	} else
+		scoped_ksimd()
+			poly1305_blocks_neon(state, src, len, padbit);
+	} else {
 		poly1305_blocks_arm64(state, src, len, padbit);
+	}
 }
 
 #define poly1305_mod_init_arch poly1305_mod_init_arch
 static void poly1305_mod_init_arch(void)
 {
-- 
2.53.0


