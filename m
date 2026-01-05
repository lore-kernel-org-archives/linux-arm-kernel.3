Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0100DC2A077
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtGf9AiI9Nwq/oGqxtHvIvrxYhG/Oukz+SHY0bYH7BA=; b=AmEKS8rPpwMVxfloxyGK2pfDbr
	DvVVZkLPNTiVVTvg/OKx0N/nm/s6CIg/vAZpxtuD6LN1HWFozXufR3RQxNJ9hIKXjbiOgmK8zoSEs
	0Q0DR8iy3Vwz5ooabpnMtBAe4kSmA59DT5QqTFGay02H1WFqXF5hQhTLq3zeSjBfchhzygSNjg3DW
	9PPbIu2ejzb4ewBBmn81ui++MfbKtF8ZkCCtTJblnBhLZB2Hm90dQfrZh/Re6oHUT4K6OP7WRwGbH
	jYZppPlaMhKAKUErx+k/eqTB/4SjkjHEka2mvEB5zj2B53QXmV51X31Cm3IjtCV35LpWIhZAOiCVU
	hm2BfEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccx7-0000000Al6g-1IAA;
	Mon, 05 Jan 2026 05:16:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvq-0000000AjH4-1ZGC;
	Mon, 05 Jan 2026 05:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C870260010;
	Mon,  5 Jan 2026 05:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED002C116D0;
	Mon,  5 Jan 2026 05:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590105;
	bh=4EW0N35+HHe/JqWcRGzDlUw5apTDeyYhZ2K2O9GZlcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vEUIRbuxPtyDpcgmvaJX3BlnFYwziFzZ5LfbmtiO1eZS18vDNbYb6RE8wz6jnFJBr
	 kvSoc+6RJvlqMWm6zGwwF3J8K9CRcgRwTFqq5ruJiQHv9pKFl6sisZiRTmU5umyMV6
	 5y/D8y9+nH/tgL9Zzp8ALotiaPDgASAI8NUwirGnKJt0rW0IFK0YFO4Kwq/4OiZeaA
	 qpBlNBlePkfHmuyQURnujm3lufzjXc0b8jB0p/K4gDvjHb7mJ6JjrKq79aDQ2hjan6
	 vDml3XCcwpnT15sp+GsYP8x5G92t4t4yFwKshaqoy+fQHo6AU+dXUug8XcyQd//w8l
	 9Nt6JW399D6kA==
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
Subject: [PATCH 22/36] staging: rtl8723bs: core: Use new AES library API
Date: Sun,  4 Jan 2026 21:12:55 -0800
Message-ID: <20260105051311.1607207-23-ebiggers@kernel.org>
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note: aes_encrypt_new() will be renamed to aes_encrypt() once all
callers of the old aes_encrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..79825324e70f 100644
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
+	aes_encrypt_new(&aes, ciphertext, data);
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
+			aes_encrypt_new(&aes, cbc, cbc);
 		left -= AES_BLOCK_SIZE;
 	}
 
 	memset(pad, 0, AES_BLOCK_SIZE);
-	aes_encrypt(&ctx, pad, pad);
+	aes_encrypt_new(&aes, pad, pad);
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
+	aes_encrypt_new(&aes, pad, mac);
+	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 /**
  * omac1_aes_128 - One-Key CBC MAC (OMAC1) hash with AES-128 (aka AES-CMAC)
-- 
2.52.0


