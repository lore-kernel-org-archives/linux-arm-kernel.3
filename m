Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C84EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3V4quBbOIFG09t6y5Tgt1YSCmqXUpYhT3hsnForu/4=; b=4TGxtpgjt5DT8Dp8eo4xZ5Y7FM
	55M2gDAAFe0Cmrw+EjX1YpgTUcjVKlB0msDdSAXz22944vQ2sJ98Gnbd/BN44elvmEmsmqJk/uL0b
	d3tq8s+42pjX5ykDd9MHHBvEOcpLjY0oJFmre8lNQxkVlv7Mwjk7rCVlVRfBXBwhN+M29+yNpNw48
	I6mh1PWth9BZIFL69FDUGRqwS7vpyOGoejPmprkErsLE7g0CLq/+j+h4K5jIxxu9IQigMq/7otTWl
	/AbwD4OC97TL9CAstuDafRGLGvDK4yFRdoghM3Ll2IYSppiuzjD4DGQHVy8/Wj7obv0aGbMk2NHxG
	zxM+O/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNCM-00000001Xtj-48ZI;
	Thu, 12 Feb 2026 03:16:58 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNCK-00000001Xry-0Scw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866216; x=1802402216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e3V4quBbOIFG09t6y5Tgt1YSCmqXUpYhT3hsnForu/4=;
  b=VHgDdhJCsO6wJGJuKEaOg4E+c3oWhAu/iU0fnTjPmzj4WY2ivHhMbHC/
   yTxZRgQMJ8HocTRUO4u81LbARO+YTjR6B9lSx1S1PwDdrEJSbqS/P/yTH
   trkVujwTni3P2XBk8tYSM8/tXw+m0qY1/HWNpd+3erhSK58oCOJNDONTr
   uNFjC55k5LQZejsZmPKV3AswJUY16633keBu6ZOhBiT8bfe6p5U+r81QG
   TAdK32a9E60DeMWHYsAtvfWyE0YwoqQmElKJ/057cWbRqAbeyy/ojQd2t
   1jUKzCsUFZ6GawF9/5Zp/wCnSCTKg1JmmSmwRWYAI/iitVadLyzzp8AE6
   g==;
X-CSE-ConnectionGUID: +80tQamRSW2Boz3oyW592w==
X-CSE-MsgGUID: t0DrpEIQQFObMDEguCI/PA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12920612"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:16:55 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:4426]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id c682c964-50de-491a-ac4a-8edf5074c1ac; Thu, 12 Feb 2026 03:16:55 +0000 (UTC)
X-Farcaster-Flow-ID: c682c964-50de-491a-ac4a-8edf5074c1ac
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:55 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:16:54 +0000
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
Subject: [PATCH 06/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SERPENT_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:04 +0000
Message-ID: <20260212031521.2124-7-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWA004.ant.amazon.com (10.13.139.91) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191656_205551_9FF193DA 
X-CRM114-Status: GOOD (  11.67  )
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
CONFIG_CRYPTO_SERPENT_AVX_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/fips140/fips140-api.c | 13 +++++++++++++
 arch/x86/crypto/serpent-avx.h         | 17 ++++++++++-------
 arch/x86/crypto/serpent_avx_glue.c    |  4 ++--
 4 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index 986ed1d64b51..8be124f5e05d 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_CRYPTO_SERPENT_SSE2_586) += serpent-sse2-i586.o
 serpent-sse2-i586-y := serpent-sse2-i586-asm_32.o serpent_sse2_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
 serpent-sse2-x86_64-y := serpent-sse2-x86_64-asm_64.o serpent_sse2_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
 serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
 obj-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
 serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index a1a207fa34cd..15a60258d4ee 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -21,4 +21,17 @@ DEFINE_CRYPTO_API_STUB(__twofish_enc_blk_3way);
 DEFINE_CRYPTO_API_STUB(twofish_dec_blk_3way);
 DEFINE_CRYPTO_API_STUB(twofish_dec_blk_cbc_3way);
 
+#endif
+
+/*
+ * arch/x86/crypto/serpent_avx_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SERPENT_AVX_X86_64)
+
+#include <arch/x86/crypto/serpent-avx.h>
+
+DEFINE_CRYPTO_API_STUB(serpent_ecb_enc_8way_avx);
+DEFINE_CRYPTO_API_STUB(serpent_ecb_dec_8way_avx);
+DEFINE_CRYPTO_API_STUB(serpent_cbc_dec_8way_avx);
+
 #endif
\ No newline at end of file
diff --git a/arch/x86/crypto/serpent-avx.h b/arch/x86/crypto/serpent-avx.h
index 23f3361a0e72..8e7f285273ca 100644
--- a/arch/x86/crypto/serpent-avx.h
+++ b/arch/x86/crypto/serpent-avx.h
@@ -2,6 +2,7 @@
 #ifndef ASM_X86_SERPENT_AVX_H
 #define ASM_X86_SERPENT_AVX_H
 
+#include <crypto/api.h>
 #include <crypto/b128ops.h>
 #include <crypto/serpent.h>
 #include <linux/types.h>
@@ -10,12 +11,14 @@ struct crypto_skcipher;
 
 #define SERPENT_PARALLEL_BLOCKS 8
 
-asmlinkage void serpent_ecb_enc_8way_avx(const void *ctx, u8 *dst,
-					 const u8 *src);
-asmlinkage void serpent_ecb_dec_8way_avx(const void *ctx, u8 *dst,
-					 const u8 *src);
-
-asmlinkage void serpent_cbc_dec_8way_avx(const void *ctx, u8 *dst,
-					 const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT_AVX_X86_64, serpent_ecb_enc_8way_avx, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT_AVX_X86_64, serpent_ecb_dec_8way_avx, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT_AVX_X86_64, serpent_cbc_dec_8way_avx, asmlinkage void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif
diff --git a/arch/x86/crypto/serpent_avx_glue.c b/arch/x86/crypto/serpent_avx_glue.c
index 9c8b3a335d5c..43c877a2fc7e 100644
--- a/arch/x86/crypto/serpent_avx_glue.c
+++ b/arch/x86/crypto/serpent_avx_glue.c
@@ -117,8 +117,8 @@ static void __exit serpent_exit(void)
 	crypto_unregister_skciphers(serpent_algs, ARRAY_SIZE(serpent_algs));
 }
 
-module_init(serpent_init);
-module_exit(serpent_exit);
+crypto_module_init(serpent_init);
+crypto_module_exit(serpent_exit);
 
 MODULE_DESCRIPTION("Serpent Cipher Algorithm, AVX optimized");
 MODULE_LICENSE("GPL");
-- 
2.47.3


