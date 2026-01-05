Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E822AC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EgHCXMOz5gRh7eMughW4cZ4zBOrTNxJx4cu/aaTqL8=; b=pnBrPu5N4+TYTS9Zls2/SVkKWG
	Bsbwyws3y+TX6rWge4pQ+0nPfFGxu1zBpZb8FfmPuSiPWPcQRKnpji4HXThywrGzKTt3GBhIQlQ2D
	2o9gNTef87Y3biIkzUu8V4s+0dESysLyaIkiYEiKrHXnS6y1oJhE2LF+KmNKPfSzKeRG4v6YDJSxk
	o2lBfsHoJ60ZJIZr5qEYSfsMVoW6d/vckOH5eb63tLJpa4h/wSl8P/hgw4jJ+MKiyWjBWwni8Q/O4
	qR8yyVTFmxb6zS68qV+RZfPFpePhk0P/kIKIyWsAD30MT8cTS7rWAN/2bMGfBSTKBxlOQUD3Fh8tu
	BocnpHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccyb-0000000AnHh-1MY2;
	Mon, 05 Jan 2026 05:17:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvz-0000000AjUq-1O8g;
	Mon, 05 Jan 2026 05:15:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EF5760150;
	Mon,  5 Jan 2026 05:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF948C19421;
	Mon,  5 Jan 2026 05:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590114;
	bh=0EBUEmVTe0e4bzKdqvPELWwoIgTHdjzdDZHfkwljOsg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rOAhnKYROQMEoMD81Em7mWQ61HyLgE3WDv40a+uauy0zXQQ0mHHhwqwczGz06JzjM
	 BdNHtV7nIaURBKsF+oSa2rFdIAEXQ7LByXqGJRKmIrdfOf6QiEc5WT1lC9vh/BhW9a
	 IQ9OEsk+eGFsSOCFKi5iDvmfEmKDGx5jd+GTG1pUfu7myy1vVeHI3pUsbThA4X2oyu
	 lJCDZSbKqwRYYUw6a5frOfQp/Jv2FxRovn8kxjvrIGakLOdH6Z1+7/6yA/2TAaFePp
	 BbafT19y5VWI6JSqqbcyOypU34Iu6dDnPvbkNn++RQT2plgft3r939P/tX35BnbGzF
	 L9/mowQabouBA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 36/36] lib/crypto: aes: Drop 'volatile' from aes_sbox and aes_inv_sbox
Date: Sun,  4 Jan 2026 21:13:09 -0800
Message-ID: <20260105051311.1607207-37-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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

The volatile keyword is no longer necessary or useful on aes_sbox and
aes_inv_sbox, since the table prefetching is now done using a helper
function that casts to volatile itself and also includes an optimization
barrier.  Since it prevents some compiler optimizations, remove it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/aes.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index 98ade1758735..e85c905296f1 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -9,15 +9,11 @@
 #include <linux/crypto.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
 
-/*
- * Emit the sbox as volatile const to prevent the compiler from doing
- * constant folding on sbox references involving fixed indexes.
- */
-static volatile const u8 __cacheline_aligned aes_sbox[] = {
+static const u8 __cacheline_aligned aes_sbox[] = {
 	0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5,
 	0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
 	0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0,
 	0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
 	0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc,
@@ -48,11 +44,11 @@ static volatile const u8 __cacheline_aligned aes_sbox[] = {
 	0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
 	0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68,
 	0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16,
 };
 
-static volatile const u8 __cacheline_aligned aes_inv_sbox[] = {
+static const u8 __cacheline_aligned aes_inv_sbox[] = {
 	0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38,
 	0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb,
 	0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87,
 	0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb,
 	0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d,
@@ -428,11 +424,11 @@ static void __maybe_unused aes_decrypt_generic(const u32 inv_rndkeys[],
 		w[1] = w1;
 		w[2] = w2;
 		w[3] = w3;
 	} while (--n);
 
-	aes_prefetch((const void *)aes_inv_sbox, sizeof(aes_inv_sbox));
+	aes_prefetch(aes_inv_sbox, sizeof(aes_inv_sbox));
 	put_unaligned_le32(declast_quarterround(w, 0, *rkp++), &out[0]);
 	put_unaligned_le32(declast_quarterround(w, 1, *rkp++), &out[4]);
 	put_unaligned_le32(declast_quarterround(w, 2, *rkp++), &out[8]);
 	put_unaligned_le32(declast_quarterround(w, 3, *rkp++), &out[12]);
 }
-- 
2.52.0


