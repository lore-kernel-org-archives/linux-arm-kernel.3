Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE311093170
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 04:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH/AwBmhxtGQj2T8ZTmK3ZgZ6MCFFkUtntOpj9gPHT4=; b=Uk7gxa+DNoTfPuIPr1609fm9mi
	ouCQjrcjLiKKgWK0K+j5hQvwL2u8g2PhvfarBw/E/BFBy13/jvq01z3PtdxltuCu+krPnrQRJ0CKu
	OFuR7u2pCvfH7lMpIVGA/rjBy+pJ66TFydxHNIKLoky9fl8C8veFpu902/Vz3k7QMC7LePxWV42Dy
	fMm5LypbV2xwkNnmcgBzZA+HwAza+jS+Cfej8EqVldM9m/z9+HXf4RF2nQ1eS+y88SClB+kO5OH0J
	om0o23NQBCp75iLH/lVYSCVcW68sRbIc5oMvQ4q6L9BvTRYyfsDmWqz7U1y+PGV1udv6ys9NRoael
	6gyKhXeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3nh9-0000000DzWX-20o2;
	Sat, 21 Mar 2026 04:12:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ngv-0000000DzOV-04gH;
	Sat, 21 Mar 2026 04:12:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7B1C4457E;
	Sat, 21 Mar 2026 04:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7B8C2BCB1;
	Sat, 21 Mar 2026 04:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774066318;
	bh=LFyrpEF3QvWGOvRWq/UotcrYPoPPntBBC70R8Z4P+no=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PCF9OFR+8ZUEqZzBoCEQ4qqqtsIcx+/I1Dr26HxDTP/JPJwj7gMHMUNAUW4vRvRVb
	 0vXwTN+980MajNK4yucFSoDA+fRIy87a9DWaK0wb4w5kzo+iaSJq4Jom4r49efuMx+
	 Dz7gVTwF1G4iwhGJjLa/A5AfHPmZKZTCKuL1bcdcwwEWdZXlg1yiwiESCKd+zJtQCi
	 t9zp1e4rKdIjn14c4UGu4e9ECKES4c/rzf21LQA5Rl5oxpz1M+8gum+NFnuSO06cO1
	 drZpc8UEXTo/zci0sPWDFhCCQ+P5hWlXJr0HLDeGKOKNgsm16Ffwz9Zz/+jTWAv2jg
	 Dj0N4A/N6zEPQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 02/12] crypto: sm3 - Remove sm3_zero_message_hash and SM3_T[1-2]
Date: Fri, 20 Mar 2026 21:09:25 -0700
Message-ID: <20260321040935.410034-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321040935.410034-1-ebiggers@kernel.org>
References: <20260321040935.410034-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_211201_081213_3321F89B 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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

Remove these, since they are unused.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sm3_generic.c | 8 --------
 include/crypto/sm3.h | 5 -----
 2 files changed, 13 deletions(-)

diff --git a/crypto/sm3_generic.c b/crypto/sm3_generic.c
index 7529139fcc96..0c606f526347 100644
--- a/crypto/sm3_generic.c
+++ b/crypto/sm3_generic.c
@@ -12,18 +12,10 @@
 #include <crypto/sm3.h>
 #include <crypto/sm3_base.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-const u8 sm3_zero_message_hash[SM3_DIGEST_SIZE] = {
-	0x1A, 0xB2, 0x1D, 0x83, 0x55, 0xCF, 0xA1, 0x7F,
-	0x8e, 0x61, 0x19, 0x48, 0x31, 0xE8, 0x1A, 0x8F,
-	0x22, 0xBE, 0xC8, 0xC7, 0x28, 0xFE, 0xFB, 0x74,
-	0x7E, 0xD0, 0x35, 0xEB, 0x50, 0x82, 0xAA, 0x2B
-};
-EXPORT_SYMBOL_GPL(sm3_zero_message_hash);
-
 static int crypto_sm3_update(struct shash_desc *desc, const u8 *data,
 			  unsigned int len)
 {
 	return sm3_base_do_update_blocks(desc, data, len, sm3_block_generic);
 }
diff --git a/include/crypto/sm3.h b/include/crypto/sm3.h
index c09f6bf4c0bf..918d318795ef 100644
--- a/include/crypto/sm3.h
+++ b/include/crypto/sm3.h
@@ -14,24 +14,19 @@
 
 #define SM3_DIGEST_SIZE	32
 #define SM3_BLOCK_SIZE	64
 #define SM3_STATE_SIZE	40
 
-#define SM3_T1		0x79CC4519
-#define SM3_T2		0x7A879D8A
-
 #define SM3_IVA		0x7380166f
 #define SM3_IVB		0x4914b2b9
 #define SM3_IVC		0x172442d7
 #define SM3_IVD		0xda8a0600
 #define SM3_IVE		0xa96f30bc
 #define SM3_IVF		0x163138aa
 #define SM3_IVG		0xe38dee4d
 #define SM3_IVH		0xb0fb0e4e
 
-extern const u8 sm3_zero_message_hash[SM3_DIGEST_SIZE];
-
 struct sm3_state {
 	u32 state[SM3_DIGEST_SIZE / 4];
 	u64 count;
 	u8 buffer[SM3_BLOCK_SIZE];
 };
-- 
2.53.0


