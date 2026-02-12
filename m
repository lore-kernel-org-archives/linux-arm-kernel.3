Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2DBEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sgxCjhm5cJH8SjQ15OI9DSATcBhwakKChkzWtlILHI=; b=RIIFsOVDlQIFDu2AXls0nrnHst
	f2GBNKm8C0JNP1bdnyC8KdVgnGnPCrZ9ZqCjpKksfgkoas6AOmtFdxReguYhJHAK/fWuo4FXM4s1s
	CA42TS1+Lu3qxSFizXjJmyBv8hBcb4ltzO94eKTuMAaDcb/s4l1Xd9RhXlL8sEj7jFq3vGlHRdYhr
	3tp6kbN4u8o9DZ4FXHnGhZHli+ap3DMehRe63smL4NnUYzI/LhS5Mmv3E7Sm9bioBnpMYDYxzbyRu
	u/Birf0X8KK50dYUHqC+hCBjJSpljta61hFuyzT0QIrjww2d2B6x35Qq51JxaPqVaMLkD7wnsVP09
	8cAtagAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNDh-00000001YT2-1bvm;
	Thu, 12 Feb 2026 03:18:21 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNDe-00000001YRo-42hd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866298; x=1802402298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2sgxCjhm5cJH8SjQ15OI9DSATcBhwakKChkzWtlILHI=;
  b=OOPbT6d4FfElHQbH7NauMRq0CbX67WiMJwR7rgsg7G9O66Negqb2ve/E
   AChV75ABXv4aOWhbIL41a/urCpmoR9sceFz0Tz5AcieZuVR4sveiFCa5p
   HBaQDUu0EU5fsppNMDBgnNLnTncEFCSBy3365iAnm2ZnEs3Asli7pP8MT
   WWxmBaEeglWGF6eV96nU6LJi2HXHEXwnJFXUYRtFhk6tTHtniDKG8Ofs0
   zE+6YSVgzEnpchNJQ5Bo74/6eJAV6PP71AbBKKCz82Ua11wQqmfHeBy28
   /YlNQjYHg1bA2Mh8dZ3szFdlAhwHGV08lHdskzrphRiWE4PRte2trvCZe
   A==;
X-CSE-ConnectionGUID: CXxigHAnSYiuPdXSwDrhrw==
X-CSE-MsgGUID: MKBysYrTQFG883cIN9bc6g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12915408"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:18:13 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:5328]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 2e50abd0-be15-4203-b2be-d79b7ee2fbed; Thu, 12 Feb 2026 03:18:12 +0000 (UTC)
X-Farcaster-Flow-ID: 2e50abd0-be15-4203-b2be-d79b7ee2fbed
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:12 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:18:12 +0000
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
Subject: [PATCH 11/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:09 +0000
Message-ID: <20260212031521.2124-12-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWA001.ant.amazon.com (10.13.139.83) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191819_066754_25AE940B 
X-CRM114-Status: GOOD (  10.94  )
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
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile                  |  2 +-
 arch/x86/crypto/camellia.h                | 13 +++++++++----
 arch/x86/crypto/camellia_aesni_avx_glue.c |  4 ++--
 arch/x86/crypto/fips140/fips140-api.c     | 13 +++++++++++++
 4 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index a3af66c98760..205b4467ab79 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -25,7 +25,7 @@ des3_ede-x86_64-y := des3_ede-asm_64.o des3_ede_glue.o
 
 crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
 camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
-obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
 camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o camellia_aesni_avx_glue.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
 camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
diff --git a/arch/x86/crypto/camellia.h b/arch/x86/crypto/camellia.h
index bca0b64ab8d7..6cfe3dd134ae 100644
--- a/arch/x86/crypto/camellia.h
+++ b/arch/x86/crypto/camellia.h
@@ -41,10 +41,15 @@ DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_X86_64, camellia_dec_blk_2way, asmlink
 	(ctx, dst, src));
 
 /* 16-way parallel cipher functions (avx/aes-ni) */
-asmlinkage void camellia_ecb_enc_16way(const void *ctx, u8 *dst, const u8 *src);
-asmlinkage void camellia_ecb_dec_16way(const void *ctx, u8 *dst, const u8 *src);
-
-asmlinkage void camellia_cbc_dec_16way(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64, camellia_ecb_enc_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64, camellia_ecb_dec_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64, camellia_cbc_dec_16way, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 static inline void camellia_enc_blk(const void *ctx, u8 *dst, const u8 *src)
 {
diff --git a/arch/x86/crypto/camellia_aesni_avx_glue.c b/arch/x86/crypto/camellia_aesni_avx_glue.c
index 5c321f255eb7..14e70c0f6fb7 100644
--- a/arch/x86/crypto/camellia_aesni_avx_glue.c
+++ b/arch/x86/crypto/camellia_aesni_avx_glue.c
@@ -122,8 +122,8 @@ static void __exit camellia_aesni_fini(void)
 	crypto_unregister_skciphers(camellia_algs, ARRAY_SIZE(camellia_algs));
 }
 
-module_init(camellia_aesni_init);
-module_exit(camellia_aesni_fini);
+crypto_module_init(camellia_aesni_init);
+crypto_module_exit(camellia_aesni_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Camellia Cipher Algorithm, AES-NI/AVX optimized");
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index 57a1625219e0..8048f1568852 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -50,4 +50,17 @@ DEFINE_CRYPTO_API_STUB(__camellia_enc_blk_2way);
 DEFINE_CRYPTO_API_STUB(camellia_dec_blk_2way);
 DEFINE_CRYPTO_API_STUB(camellia_decrypt_cbc_2way);
 
+#endif
+
+/*
+ * arch/x86/crypto/camellia_aesni_avx_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64)
+
+#include <arch/x86/crypto/camellia.h>
+
+DEFINE_CRYPTO_API_STUB(camellia_ecb_enc_16way);
+DEFINE_CRYPTO_API_STUB(camellia_ecb_dec_16way);
+DEFINE_CRYPTO_API_STUB(camellia_cbc_dec_16way);
+
 #endif
\ No newline at end of file
-- 
2.47.3


