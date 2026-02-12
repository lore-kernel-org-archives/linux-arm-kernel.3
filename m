Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88EBEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1e2gtCCscDFXMUiZXIsNyKCO7JeXLOW0dkrr5pHyRE=; b=fIMwTXicFOncLQjJPngLrcx1J1
	SQe3l5cHivqlAvrDWexcjYr53mgTQzvv4/U9bNiihV1FzwTIcVrNKl2wUw/TYIBl6KwiSW+moKivH
	uLgwtGo+vTvMujhKqe9E/DlukpeRq7aIc6nNQO8vG8R8dy2krW8hfwmgpGNlQJlMqOkev6b2qMgBU
	CBfaSdonuHm/BrKvaWawH62wu5dht7gBNkwcNukSkYyXDmQoiX/CBsum1qGQd7roLlAw+di2mbe7W
	ORvy0RUamqwkde/ucg+Da79TDI91SZNN5JHOzasxyZte3PKQm6ecLHvzR9SBf1ILnt3YQBAZxKskG
	VoDN0kkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNDA-00000001YGO-305Y;
	Thu, 12 Feb 2026 03:17:48 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqND7-00000001YFP-3CFs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866265; x=1802402265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+1e2gtCCscDFXMUiZXIsNyKCO7JeXLOW0dkrr5pHyRE=;
  b=kdpgcao6U6+/by7YgfGxo0frzFcAKlW5FmOqe+Am5B3hV1j5kKFrD5sK
   5QUbkgZZLKb6lZfE0QO8x92YzAfvKLBHvjjqKJtHLy9QNtuzKnZptiQzx
   ccENZU5g6eL5d1qhMzt0uZ8fs/eRWDKDndM+8T/uRYDH8ErsUz/706uOH
   1DDBD70cX4AgonPiVPXcR7hMcd+n7l2o+zi05w5XEWTzzTC1b0qtosI3x
   ivq2/QSZJYorWMpBQJdijL68EdpOa2dNZMLyAwOvwF4zcpyK+2qnWBaLe
   E7d5RFWM2WVy6FOY+LHfvbZxaxxBbUvC8RXksvPnqmMPM9jejBA81VWqo
   w==;
X-CSE-ConnectionGUID: neE3vW8ET9G3EB65rklbqA==
X-CSE-MsgGUID: 8OojjDyGSeOn+r/4fCHq9w==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12920027"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:17:44 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:28295]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 2647a3dc-a92f-48bf-bfaf-fc4eb7907164; Thu, 12 Feb 2026 03:17:43 +0000 (UTC)
X-Farcaster-Flow-ID: 2647a3dc-a92f-48bf-bfaf-fc4eb7907164
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:41 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:17:41 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH 09/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAMELLIA_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:07 +0000
Message-ID: <20260212031521.2124-10-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D042UWA004.ant.amazon.com (10.13.139.16) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191745_946108_FEADBF57 
X-CRM114-Status: GOOD (  12.51  )
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

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_CAMELLIA_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/camellia.h            | 29 ++++++++++++++++++---------
 arch/x86/crypto/camellia_glue.c       |  4 ++--
 arch/x86/crypto/fips140/fips140-api.c | 16 +++++++++++++++
 4 files changed, 38 insertions(+), 13 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 7118a7dba3c6..8751154e1328 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -23,7 +23,7 @@ serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
 crypto-objs-$(CONFIG_CRYPTO_DES3_EDE_X86_64) += des3_ede-x86_64.o
 des3_ede-x86_64-y := des3_ede-asm_64.o des3_ede_glue.o
 
-obj-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
 camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
 camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o camellia_aesni_avx_glue.o
diff --git a/arch/x86/crypto/camellia.h b/arch/x86/crypto/camellia.h
index 1dcea79e8f8e..bca0b64ab8d7 100644
--- a/arch/x86/crypto/camellia.h
+++ b/arch/x86/crypto/camellia.h
@@ -2,6 +2,7 @@
 #ifndef ASM_X86_CAMELLIA_H
 #define ASM_X86_CAMELLIA_H
 
+#include <crypto/api.h>
 #include <crypto/b128ops.h>
 #include <linux/crypto.h>
 #include <linux/kernel.h>
@@ -19,19 +20,25 @@ struct camellia_ctx {
 	u32 key_length;
 };
 
-extern int __camellia_setkey(struct camellia_ctx *cctx,
-			     const unsigned char *key,
-			     unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, __camellia_setkey, int,
+	(struct camellia_ctx *cctx, const unsigned char *key, unsigned int key_len),
+	(cctx, key, key_len));
 
 /* regular block cipher functions */
-asmlinkage void __camellia_enc_blk(const void *ctx, u8 *dst, const u8 *src,
-				   bool xor);
-asmlinkage void camellia_dec_blk(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, __camellia_enc_blk, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, bool xor),
+	(ctx, dst, src, xor));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, camellia_dec_blk, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 /* 2-way parallel cipher functions */
-asmlinkage void __camellia_enc_blk_2way(const void *ctx, u8 *dst, const u8 *src,
-					bool xor);
-asmlinkage void camellia_dec_blk_2way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, __camellia_enc_blk_2way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, bool xor),
+	(ctx, dst, src, xor));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, camellia_dec_blk_2way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 /* 16-way parallel cipher functions (avx/aes-ni) */
 asmlinkage void camellia_ecb_enc_16way(const void *ctx, u8 *dst, const u8 *src);
@@ -62,6 +69,8 @@ static inline void camellia_enc_blk_xor_2way(const void *ctx, u8 *dst,
 }
 
 /* glue helpers */
-extern void camellia_decrypt_cbc_2way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, camellia_decrypt_cbc_2way, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif /* ASM_X86_CAMELLIA_H */
diff --git a/arch/x86/crypto/camellia_glue.c b/arch/x86/crypto/camellia_glue.c
index cbede120e5f2..e545da7c8530 100644
--- a/arch/x86/crypto/camellia_glue.c
+++ b/arch/x86/crypto/camellia_glue.c
@@ -1408,8 +1408,8 @@ static void __exit camellia_fini(void)
 				    ARRAY_SIZE(camellia_skcipher_algs));
 }
 
-module_init(camellia_init);
-module_exit(camellia_fini);
+crypto_module_init(camellia_init);
+crypto_module_exit(camellia_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Camellia Cipher Algorithm, asm optimized");
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index 15a60258d4ee..57a1625219e0 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -34,4 +34,20 @@ DEFINE_CRYPTO_API_STUB(serpent_ecb_enc_8way_avx);
 DEFINE_CRYPTO_API_STUB(serpent_ecb_dec_8way_avx);
 DEFINE_CRYPTO_API_STUB(serpent_cbc_dec_8way_avx);
 
+#endif
+
+/*
+ * arch/x86/crypto/camellia_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAMELLIA_X86_64)
+
+#include <arch/x86/crypto/camellia.h>
+
+DEFINE_CRYPTO_API_STUB(__camellia_setkey);
+DEFINE_CRYPTO_API_STUB(__camellia_enc_blk);
+DEFINE_CRYPTO_API_STUB(camellia_dec_blk);
+DEFINE_CRYPTO_API_STUB(__camellia_enc_blk_2way);
+DEFINE_CRYPTO_API_STUB(camellia_dec_blk_2way);
+DEFINE_CRYPTO_API_STUB(camellia_decrypt_cbc_2way);
+
 #endif
\ No newline at end of file
-- 
2.47.3


