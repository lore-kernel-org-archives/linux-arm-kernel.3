Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA0AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 05:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrhB+kNPtDwcIO4MusPOmHEI+kY9YhdYT3G1lfPHgZc=; b=xM0v143r0+UECy/vItRliFP1Ho
	ZVYmp8VaS4YpP34t/JfRDihH4FfhaSBt7s8KRafNvB+IrXikyWV6J6t95Mx0BCE4bIHY+M2tZ2B4K
	PB09WoUzwTTZd+M6lA60bv2qB824tx9ZW/ILJxJo7Ax8AAUNmNcecl4uE+kCXnyyYRwKA/tsBYgcB
	687HptL5aLl20zFZyBgMBxrEBUqEVe4/w+34MT1K26cyDEYecaZpmv9ut1eF4Om4rhJG0ubTROjvF
	vLi6Hqi3COVx1IJ0rKK2HS9XO2OhjdJmRMhREg4bu13pzP7yYCLdYVfjINoE+4mbKGYTu0lQd+JER
	YsPKssfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3pfM-0000000GpKp-3BDA;
	Sun, 13 Apr 2025 05:14:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3pNh-0000000GnjW-3hDR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 04:55:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB8DEA40D19;
	Sun, 13 Apr 2025 04:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8414CC4CEEC;
	Sun, 13 Apr 2025 04:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520144;
	bh=2gVkbo9MzVz9VvdMrst8TjWJgNjWQ5w/TelaNMUEtGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQ3TQJtkQRNwLXjjSV+ZirK4F2x5Ki3Bhv5FTKS0TwurPeEsyoDqm/+11jsc6KW/a
	 sS/UqHVfUu/IOzxUpNwkD1ovfmDwFhEzVnWxOWHFD05K5ZscmwjZU2oMjAfRLzRawn
	 30yLpt4R8qhT7ec13PW04vyT4DaMPls82NRUZ1euqmDGxs8CSb9p5bWhuXdCviGCUc
	 1zRw8fPcXC/Zdg2Lmqm7zA1a+dhQrtO9RiXimZ4QHwMHLCsaPR3Bnik+Zq35FnHVcq
	 lQ9gEU05caDHcf1lX0cxLWbGZOh7IM7YG2I8Vl/U07faajdBK8X4wf5HybE8IpkIAd
	 uhuSffzv6mTwg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 9/9] crypto: poly1305 - remove rset and sset fields of poly1305_desc_ctx
Date: Sat, 12 Apr 2025 21:54:21 -0700
Message-ID: <20250413045421.55100-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_215545_991576_CC9B6EA8 
X-CRM114-Status: GOOD (  11.41  )
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

These fields are no longer needed, so remove them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/crypto/poly1305.h | 4 ----
 lib/crypto/poly1305.c     | 2 --
 2 files changed, 6 deletions(-)

diff --git a/include/crypto/poly1305.h b/include/crypto/poly1305.h
index 91444965772a..6e21ec2d1dc2 100644
--- a/include/crypto/poly1305.h
+++ b/include/crypto/poly1305.h
@@ -41,14 +41,10 @@ struct poly1305_state {
 struct poly1305_desc_ctx {
 	/* partial buffer */
 	u8 buf[POLY1305_BLOCK_SIZE];
 	/* bytes used in partial buffer */
 	unsigned int buflen;
-	/* how many keys have been set in r[] */
-	unsigned short rset;
-	/* whether s[] has been set */
-	bool sset;
 	/* finalize key */
 	u32 s[4];
 	/* accumulator */
 	struct poly1305_state h;
 	/* key */
diff --git a/lib/crypto/poly1305.c b/lib/crypto/poly1305.c
index 6e80214ebad8..b633b043f0f6 100644
--- a/lib/crypto/poly1305.c
+++ b/lib/crypto/poly1305.c
@@ -20,12 +20,10 @@ void poly1305_init_generic(struct poly1305_desc_ctx *desc,
 	desc->s[1] = get_unaligned_le32(key + 20);
 	desc->s[2] = get_unaligned_le32(key + 24);
 	desc->s[3] = get_unaligned_le32(key + 28);
 	poly1305_core_init(&desc->h);
 	desc->buflen = 0;
-	desc->sset = true;
-	desc->rset = 2;
 }
 EXPORT_SYMBOL_GPL(poly1305_init_generic);
 
 void poly1305_update_generic(struct poly1305_desc_ctx *desc, const u8 *src,
 			     unsigned int nbytes)
-- 
2.49.0


