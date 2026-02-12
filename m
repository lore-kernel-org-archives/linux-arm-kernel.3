Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D404FEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hekAfqvesKLSO81lBkrtLnqa/7EsknP3bbaT26p15Kw=; b=2B5oyGDek63ItHikvsdAtBZbIy
	MbQBN+pdu5NWRXVsSmHC+gEowK20hTXSIENz07Mwb5m0TouxVdJ8qbZngt/MCO28cHPG2wmzCQKb+
	8+mZmu8qz80fwMqtdd9ARFIKAKLpabS9HdT1yDPUOogiQc1NwW+xq8+rNaAtXDIoWp2L29a1bpqai
	Wy+YNZCVyEO4gmFCJgWfRFEE/HsfgP6chqJ4VHWfVAGTi4owOp/9opmgDFuBPOWQTIVUFsHaMCWGn
	uU63vAosOb66LubfKDDwsMIHL3rnH6H9s5o6SEKprjbpwS4DoVwRW9nNJqKdhmiT5FBmg5XNuZIMp
	97Riyz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNFc-00000001ZKd-0jFQ;
	Thu, 12 Feb 2026 03:20:20 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNFZ-00000001ZJ7-3FiT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866417; x=1802402417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hekAfqvesKLSO81lBkrtLnqa/7EsknP3bbaT26p15Kw=;
  b=JJ38z8Pmuwhjxhu6kK8vRzjDyJYhmzVkB8zSoeppCpvhBVl9FvnV/L0G
   SvnGYsgr2kDgdyei4N2NJGYRQnU8PQ6AGAvul7PQhwNeL7+nUsqi2t1uz
   RsRh87Mv1rVfhLEdz7g5MGHY4ojrmmd8Y8Uunwg6pfjdcTsvimm6yD6L+
   dcpfBNsfL/FeyX3mkiM3OrRiAAj0dQvdvx3az4Px8BrVwQZOdpqLsrS0n
   LQiD4mmLyQYCo6Yq/zqJLGMqEjPAZyvsVa96qYQ6OGCqE/NPj+uIsCLM+
   m6DDn/XuD1joBrTIZ82QJX9d5UqDGSkI9yhL3JGFjFD+gIBgmsPcST8si
   A==;
X-CSE-ConnectionGUID: g4ltCrs4QwyT2+0iPYTpYA==
X-CSE-MsgGUID: RSFFzlKjR+il92qZsbqFsg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12699216"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:20:17 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:16169]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id e7d9fef8-ac4d-49f5-8288-f4d34bb1ee95; Thu, 12 Feb 2026 03:20:16 +0000 (UTC)
X-Farcaster-Flow-ID: e7d9fef8-ac4d-49f5-8288-f4d34bb1ee95
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:16 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:16 +0000
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
Subject: [PATCH 19/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:17 +0000
Message-ID: <20260212031521.2124-20-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWB003.ant.amazon.com (10.13.138.8) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192017_872971_9B523169 
X-CRM114-Status: GOOD (  10.96  )
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
CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/aria-avx.h            | 35 ++++++++++++++++-----------
 arch/x86/crypto/aria_aesni_avx_glue.c |  4 +--
 arch/x86/crypto/fips140/fips140-api.c | 18 ++++++++++++++
 4 files changed, 42 insertions(+), 17 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 103a49fbbac8..bda4e9cd5e2c 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -62,7 +62,7 @@ sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
 sm4-aesni-avx2-x86_64-y := sm4-aesni-avx2-asm_64.o sm4_aesni_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
 aria-aesni-avx-x86_64-y := aria-aesni-avx-asm_64.o aria_aesni_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
diff --git a/arch/x86/crypto/aria-avx.h b/arch/x86/crypto/aria-avx.h
index 6e1b2d8a31ed..e4109e67a640 100644
--- a/arch/x86/crypto/aria-avx.h
+++ b/arch/x86/crypto/aria-avx.h
@@ -2,6 +2,7 @@
 #ifndef ASM_X86_ARIA_AVX_H
 #define ASM_X86_ARIA_AVX_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 
 #define ARIA_AESNI_PARALLEL_BLOCKS 16
@@ -13,20 +14,26 @@
 #define ARIA_GFNI_AVX512_PARALLEL_BLOCKS 64
 #define ARIA_GFNI_AVX512_PARALLEL_BLOCK_SIZE  (ARIA_BLOCK_SIZE * ARIA_GFNI_AVX512_PARALLEL_BLOCKS)
 
-asmlinkage void aria_aesni_avx_encrypt_16way(const void *ctx, u8 *dst,
-					     const u8 *src);
-asmlinkage void aria_aesni_avx_decrypt_16way(const void *ctx, u8 *dst,
-					     const u8 *src);
-asmlinkage void aria_aesni_avx_ctr_crypt_16way(const void *ctx, u8 *dst,
-					       const u8 *src,
-					       u8 *keystream, u8 *iv);
-asmlinkage void aria_aesni_avx_gfni_encrypt_16way(const void *ctx, u8 *dst,
-						  const u8 *src);
-asmlinkage void aria_aesni_avx_gfni_decrypt_16way(const void *ctx, u8 *dst,
-						  const u8 *src);
-asmlinkage void aria_aesni_avx_gfni_ctr_crypt_16way(const void *ctx, u8 *dst,
-						    const u8 *src,
-						    u8 *keystream, u8 *iv);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_encrypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_decrypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_ctr_crypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, u8 *keystream, u8 *iv),
+	(ctx, dst, src, keystream, iv));
+#ifdef CONFIG_AS_GFNI
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_gfni_encrypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_gfni_decrypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_gfni_ctr_crypt_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, u8 *keystream, u8 *iv),
+	(ctx, dst, src, keystream, iv));
+#endif /* CONFIG_AS_GFNI */
 
 asmlinkage void aria_aesni_avx2_encrypt_32way(const void *ctx, u8 *dst,
 					      const u8 *src);
diff --git a/arch/x86/crypto/aria_aesni_avx_glue.c b/arch/x86/crypto/aria_aesni_avx_glue.c
index e4e3d78915a5..4a0bb385515a 100644
--- a/arch/x86/crypto/aria_aesni_avx_glue.c
+++ b/arch/x86/crypto/aria_aesni_avx_glue.c
@@ -215,8 +215,8 @@ static void __exit aria_avx_exit(void)
 	crypto_unregister_skciphers(aria_algs, ARRAY_SIZE(aria_algs));
 }
 
-module_init(aria_avx_init);
-module_exit(aria_avx_exit);
+crypto_module_init(aria_avx_init);
+crypto_module_exit(aria_avx_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Taehee Yoo <ap420073@gmail.com>");
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index 1333b1ce6cdf..ed7a2ad31f24 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -78,4 +78,22 @@ DEFINE_CRYPTO_API_STUB(sm4_cbc_encrypt);
 DEFINE_CRYPTO_API_STUB(sm4_avx_cbc_decrypt);
 DEFINE_CRYPTO_API_STUB(sm4_avx_ctr_crypt);
 
+#endif
+
+/*
+ * arch/x86/crypto/aria_aesni_avx_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64)
+
+#include <arch/x86/crypto/aria-avx.h>
+
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_encrypt_16way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_decrypt_16way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_ctr_crypt_16way);
+#ifdef CONFIG_AS_GFNI
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_encrypt_16way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_decrypt_16way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_ctr_crypt_16way);
+#endif /* CONFIG_AS_GFNI */
+
 #endif
\ No newline at end of file
-- 
2.47.3


