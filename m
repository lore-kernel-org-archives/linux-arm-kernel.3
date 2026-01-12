Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13543CF45C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMxlSvPQL7S3V41U4MUzI5yC5X7IcvJTh/x5oQJm1eg=; b=Qn/sSqzLGgIZ69tFK8asyV2I3J
	eu1i7mup/AaCMtfMlm+OR9twtJb+iHHBl+RIOnExuQBOUXgb1gNYkSa/uFJVkUwiCWp46Xh3JtVoO
	4ZwHUEDHDkuKTO+TIIipUxdLrcrN15SmzT+e7aDKP3UwlUt84o96PVW5et4B4YeY3CA+X99TF/ksK
	+KNiyihYWhCLzHHQJuZPMet+JtQ+RZQ0xPGPMIn9F7oe1BDlm1UPyQvKgr9bkl/4ql8PAfo92dlPa
	MUMz4eusGtIYmtsO27p9YQu1ftYeMs4UVKmQtbMUcHApOo1bUJd4PVdxpUXRMZcC7wixqvXA6bSBs
	iIm1yS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNXG-0000000618H-2yQe;
	Mon, 12 Jan 2026 19:25:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVi-00000005z5K-20MW;
	Mon, 12 Jan 2026 19:23:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5112060055;
	Mon, 12 Jan 2026 19:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A322C2BC86;
	Mon, 12 Jan 2026 19:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245810;
	bh=wXdwY1WoVa5ZNu1Fe87Z9mILsLA3s28tZHNhWF6S8gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gj85ij8qJIew+bWKcniT1QlwS/ryjNF9CQBcnJ8+C99RNEOoBqERPk4+1FRbNhhw0
	 FZGVIA1d56xRQ+5i2prmCgQ5T+K156MKnGC9hAtOYNu+5kRR2YT0qGwptAkoCBCf54
	 rDdZRiy4YuiA9Tsxq+bEV3KDyjzv6XZto+e39v5MAzqLjDYypucU44X5+AGKiAuMm1
	 gVy605yDG4qjxS5/wUd5S5E9WiRd3DZKQ3uVMlmVp9KBGAKsdjvi+/8jWGd1aisRvp
	 db/Cr2lSi0DrDychLsRvaGIBD9agCrol/u3YT7AOB4sZgb0wbn1k5hbcfcWAHgexUs
	 LUbeyOTiy34tg==
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
Subject: [PATCH v2 22/35] staging: rtl8723bs: core: Use new AES library API
Date: Mon, 12 Jan 2026 11:20:20 -0800
Message-ID: <20260112192035.10427-23-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note that in addition to the change in the key preparation function and
the key struct type itself, the change in the type of the key struct
results in aes_encrypt() (which is temporarily a type-generic macro)
calling the new encryption function rather than the old one.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..8ee5bed252bf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -635,15 +635,15 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 /* Performs a 128 bit AES encrypt with  */
 /* 128 bit data.                        */
 /****************************************/
 static void aes128k128d(u8 *key, u8 *data, u8 *ciphertext)
 {
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 
-	aes_expandkey(&ctx, key, 16);
-	aes_encrypt(&ctx, ciphertext, data);
-	memzero_explicit(&ctx, sizeof(ctx));
+	aes_prepareenckey(&aes, key, 16);
+	aes_encrypt(&aes, ciphertext, data);
+	memzero_explicit(&aes, sizeof(aes));
 }
 
 /************************************************/
 /* construct_mic_iv()                           */
 /* Builds the MIC IV from header fields and PN  */
@@ -1404,17 +1404,17 @@ static void gf_mulx(u8 *pad)
  * (SP) 800-38B.
  */
 static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 				u8 *addr[], size_t *len, u8 *mac)
 {
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 	u8 cbc[AES_BLOCK_SIZE], pad[AES_BLOCK_SIZE];
 	u8 *pos, *end;
 	size_t i, e, left, total_len;
 	int ret;
 
-	ret = aes_expandkey(&ctx, key, 16);
+	ret = aes_prepareenckey(&aes, key, 16);
 	if (ret)
 		return -1;
 	memset(cbc, 0, AES_BLOCK_SIZE);
 
 	total_len = 0;
@@ -1434,16 +1434,16 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 				pos = addr[e];
 				end = pos + len[e];
 			}
 		}
 		if (left > AES_BLOCK_SIZE)
-			aes_encrypt(&ctx, cbc, cbc);
+			aes_encrypt(&aes, cbc, cbc);
 		left -= AES_BLOCK_SIZE;
 	}
 
 	memset(pad, 0, AES_BLOCK_SIZE);
-	aes_encrypt(&ctx, pad, pad);
+	aes_encrypt(&aes, pad, pad);
 	gf_mulx(pad);
 
 	if (left || total_len == 0) {
 		for (i = 0; i < left; i++) {
 			cbc[i] ^= *pos++;
@@ -1457,12 +1457,12 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 		gf_mulx(pad);
 	}
 
 	for (i = 0; i < AES_BLOCK_SIZE; i++)
 		pad[i] ^= cbc[i];
-	aes_encrypt(&ctx, pad, mac);
-	memzero_explicit(&ctx, sizeof(ctx));
+	aes_encrypt(&aes, pad, mac);
+	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 /**
  * omac1_aes_128 - One-Key CBC MAC (OMAC1) hash with AES-128 (aka AES-CMAC)
-- 
2.52.0


