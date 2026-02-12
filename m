Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17405EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xGvL1J1uf2bkE2vJBLVKbbQ1epUeIGWBJcS2Tkl6SQ=; b=gnqjJiLioy2btBlzDGOwotPQT7
	INU3Zm4Bxr5nLUBGHIT1dzumgpC5YgJFXMWUA6ICmpgaPZB7uVqZv8+aZtHwCO5ycgzK5AuVZkWlh
	vsd7CHreB60jiRjm4kTcxvIjV8ejBZGz0nFXWHyat1oePUW6q5KRyStFxZe3hTvSJFVAhprs3RSVf
	6qNWnOCBzcjCAtz0RGi80LPfw8Z/AQ3h7xlgKI5Z43AzEGdxNGIhG73GAkI3flPZylK9Vd62B0rZ2
	dQVY95Rx3G8OueB/M5RUSD54Mx4osEbXauS+F+nSKrBWnU70fVZ6bJdeYVb+LddpxEUl0SuKGTAaP
	dXDr1GJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNFr-00000001ZT5-0BSj;
	Thu, 12 Feb 2026 03:20:35 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNFp-00000001ZS0-10d6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866433; x=1802402433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5xGvL1J1uf2bkE2vJBLVKbbQ1epUeIGWBJcS2Tkl6SQ=;
  b=pqaxNqrTGq6FYEiLSvax6TjbgAfms4owlgWMGbubgNuumqHU6DLxjYpI
   nBjrY3Cp9QX8ajy5op7lQ2bdNfiLDzUyXHBAgei1Omw4ZAEkHn9Y7Y1ag
   aIKclMYYnS0VVOXJd9NlEPChe84lgibdONB5j+cH3MMAFcFLeXwKeNUDs
   3rKl5kW0dyy/YXIEA/nLZXRRr8vBS0oUfl6j5+ekj915JH+1zDmZdnFal
   WsyH/ckD7oyr0RrpU1Hanx/cjwDDGpTULSwOrrEpc02K2IE9w00Yc+hoC
   736KldU2Luz1XzincIdUAF6tF2Zf4SWZW1Vz9btg7QZu6OZv3qIp6tXZe
   A==;
X-CSE-ConnectionGUID: OXwOh6UVQk2gn1Y/uFs1vQ==
X-CSE-MsgGUID: ky+o7QqbTnGbceSOGTiNtA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12699226"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:20:32 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:7311]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id ff660b6e-e9f2-4a1d-8590-80432ce5d08e; Thu, 12 Feb 2026 03:20:32 +0000 (UTC)
X-Farcaster-Flow-ID: ff660b6e-e9f2-4a1d-8590-80432ce5d08e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:32 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:20:31 +0000
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
Subject: [PATCH 20/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:18 +0000
Message-ID: <20260212031521.2124-21-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192033_344644_2EFA607F 
X-CRM114-Status: GOOD (  11.16  )
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
CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile               |  2 +-
 arch/x86/crypto/aria-avx.h             | 34 +++++++++++++++-----------
 arch/x86/crypto/aria_aesni_avx2_glue.c |  4 +--
 arch/x86/crypto/fips140/fips140-api.c  | 18 ++++++++++++++
 4 files changed, 41 insertions(+), 17 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index bda4e9cd5e2c..28ed31e7d6e3 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -65,7 +65,7 @@ sm4-aesni-avx2-x86_64-y := sm4-aesni-avx2-asm_64.o sm4_aesni_avx2_glue.o
 crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
 aria-aesni-avx-x86_64-y := aria-aesni-avx-asm_64.o aria_aesni_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
 aria-aesni-avx2-x86_64-y := aria-aesni-avx2-asm_64.o aria_aesni_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
diff --git a/arch/x86/crypto/aria-avx.h b/arch/x86/crypto/aria-avx.h
index e4109e67a640..9804d3f43fce 100644
--- a/arch/x86/crypto/aria-avx.h
+++ b/arch/x86/crypto/aria-avx.h
@@ -35,20 +35,26 @@ DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64, aria_aesni_avx_gfni_ctr_
 	(ctx, dst, src, keystream, iv));
 #endif /* CONFIG_AS_GFNI */
 
-asmlinkage void aria_aesni_avx2_encrypt_32way(const void *ctx, u8 *dst,
-					      const u8 *src);
-asmlinkage void aria_aesni_avx2_decrypt_32way(const void *ctx, u8 *dst,
-					      const u8 *src);
-asmlinkage void aria_aesni_avx2_ctr_crypt_32way(const void *ctx, u8 *dst,
-						const u8 *src,
-						u8 *keystream, u8 *iv);
-asmlinkage void aria_aesni_avx2_gfni_encrypt_32way(const void *ctx, u8 *dst,
-						   const u8 *src);
-asmlinkage void aria_aesni_avx2_gfni_decrypt_32way(const void *ctx, u8 *dst,
-						   const u8 *src);
-asmlinkage void aria_aesni_avx2_gfni_ctr_crypt_32way(const void *ctx, u8 *dst,
-						     const u8 *src,
-						     u8 *keystream, u8 *iv);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_encrypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_decrypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_ctr_crypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, u8 *keystream, u8 *iv),
+	(ctx, dst, src, keystream, iv));
+#ifdef CONFIG_AS_GFNI
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_gfni_encrypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_gfni_decrypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64, aria_aesni_avx2_gfni_ctr_crypt_32way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src, u8 *keystream, u8 *iv),
+	(ctx, dst, src, keystream, iv));
+#endif /* CONFIG_AS_GFNI */
 
 struct aria_avx_ops {
 	void (*aria_encrypt_16way)(const void *ctx, u8 *dst, const u8 *src);
diff --git a/arch/x86/crypto/aria_aesni_avx2_glue.c b/arch/x86/crypto/aria_aesni_avx2_glue.c
index 1487a49bfbac..26f9f10913a7 100644
--- a/arch/x86/crypto/aria_aesni_avx2_glue.c
+++ b/arch/x86/crypto/aria_aesni_avx2_glue.c
@@ -235,8 +235,8 @@ static void __exit aria_avx2_exit(void)
 	crypto_unregister_skciphers(aria_algs, ARRAY_SIZE(aria_algs));
 }
 
-module_init(aria_avx2_init);
-module_exit(aria_avx2_exit);
+crypto_module_init(aria_avx2_init);
+crypto_module_exit(aria_avx2_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Taehee Yoo <ap420073@gmail.com>");
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index ed7a2ad31f24..ced6b58fcb81 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -96,4 +96,22 @@ DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_decrypt_16way);
 DEFINE_CRYPTO_API_STUB(aria_aesni_avx_gfni_ctr_crypt_16way);
 #endif /* CONFIG_AS_GFNI */
 
+#endif
+
+/*
+ * arch/x86/crypto/aria_aesni_avx2_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64)
+
+#include <arch/x86/crypto/aria-avx.h>
+
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_encrypt_32way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_decrypt_32way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_ctr_crypt_32way);
+#ifdef CONFIG_AS_GFNI
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_gfni_encrypt_32way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_gfni_decrypt_32way);
+DEFINE_CRYPTO_API_STUB(aria_aesni_avx2_gfni_ctr_crypt_32way);
+#endif /* CONFIG_AS_GFNI */
+
 #endif
\ No newline at end of file
-- 
2.47.3


