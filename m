Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3498CEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3y3Y/YahMHu/cI3CnH2Kckur43X2LodXOqWgadEueQc=; b=cpyYcjv1Is0WLXym9A4fSRpTVi
	Ql77jk+o87ZUfYmtcyVhVhSAH26t/7qyIAWbgqvgD5gE2kGD00FcZTahbNIpBrFE/st1gBMzpD9XW
	G4ekcdC0kyNyu6Qg2e2IcjzknNo/5YkvKOvwZn0opCZeOWplOvyBGo1NHVmltCWM7nSHEoIQ0hF4a
	lsFLRjBg+ltIAaev7nYkI6po0UuBI6bF/8rzadg/TSLh7dp6Eln+6tLTpPNN4yQffVaxp66EuqEtS
	hVsHaKweVdw2pWZkI3Dn0yhMjdYNl9f92ovO2yU5L5BhrNXoOBAN2hvmn9uOzzXdteGnn2tlaqCEb
	h5QNIW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNFA-00000001Z5H-0k0Y;
	Thu, 12 Feb 2026 03:19:52 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNF6-00000001Z2v-0JVR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:19:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866388; x=1802402388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3y3Y/YahMHu/cI3CnH2Kckur43X2LodXOqWgadEueQc=;
  b=BP3hxwdCsR1D9hEw/JxU+fLBRxTvKSfp3X+aUcGWJmJ1ZrAjuWqm2H09
   l73GZg8pijgnrNKQOXtYae+/x0PteHG+6D0vd/vMx6P6FrnrzhBN46RNe
   e7PlT+O4p5e2zmKcFuLDsTdKUf5bIpV8LVIkGlBwSbGp71fzBkXV9kmcv
   GTVqJIgFwjAIMRrZlpB3cbH4MpZ7j88LHun4eeDbd1wtkLDIZPFd5OqUF
   Vh+b8wleW4dkoVAbpznqbjhCDlob7e94BNkeZYw1y4ofQxuEZB1DogRfx
   HmZ6t6kIUqcPs6sBqlVbO96DRc3933A2oFcpCyH6z6l2gsRuQUNTHm4oW
   Q==;
X-CSE-ConnectionGUID: C8uMKJAAQKOAV2lfJKuiFg==
X-CSE-MsgGUID: aHxu2BR6T6adhSZnVdZONw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12915462"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:19:47 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:2200]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id b5021a5e-12c2-45fa-84cb-b65883112639; Thu, 12 Feb 2026 03:19:47 +0000 (UTC)
X-Farcaster-Flow-ID: b5021a5e-12c2-45fa-84cb-b65883112639
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:19:45 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:19:45 +0000
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
Subject: [PATCH 17/21] x86: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 crypto
Date: Thu, 12 Feb 2026 03:15:15 +0000
Message-ID: <20260212031521.2124-18-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212031521.2124-1-wanjay@amazon.com>
References: <20260212031521.2124-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWA003.ant.amazon.com (10.13.139.42) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191948_162333_372DB313 
X-CRM114-Status: GOOD (  11.32  )
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
CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  2 +-
 arch/x86/crypto/fips140/fips140-api.c | 15 +++++++++++++++
 arch/x86/crypto/sm4-avx.h             | 26 +++++++++++++++++---------
 arch/x86/crypto/sm4_aesni_avx_glue.c  |  4 ++--
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index ffe37f4d4a7b..ce00d3e0e451 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -56,7 +56,7 @@ ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 crypto-objs-$(CONFIG_CRYPTO_SM3_AVX_X86_64) += sm3-avx-x86_64.o
 sm3-avx-x86_64-y := sm3-avx-asm_64.o sm3_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
 sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
index 8048f1568852..1333b1ce6cdf 100644
--- a/arch/x86/crypto/fips140/fips140-api.c
+++ b/arch/x86/crypto/fips140/fips140-api.c
@@ -63,4 +63,19 @@ DEFINE_CRYPTO_API_STUB(camellia_ecb_enc_16way);
 DEFINE_CRYPTO_API_STUB(camellia_ecb_dec_16way);
 DEFINE_CRYPTO_API_STUB(camellia_cbc_dec_16way);
 
+#endif
+
+/*
+ * arch/x86/crypto/sm4_aesni_avx_glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64)
+
+#include <arch/x86/crypto/sm4-avx.h>
+
+DEFINE_CRYPTO_API_STUB(sm4_avx_ecb_encrypt);
+DEFINE_CRYPTO_API_STUB(sm4_avx_ecb_decrypt);
+DEFINE_CRYPTO_API_STUB(sm4_cbc_encrypt);
+DEFINE_CRYPTO_API_STUB(sm4_avx_cbc_decrypt);
+DEFINE_CRYPTO_API_STUB(sm4_avx_ctr_crypt);
+
 #endif
\ No newline at end of file
diff --git a/arch/x86/crypto/sm4-avx.h b/arch/x86/crypto/sm4-avx.h
index b5b5e67e40ed..2a8c05e6f255 100644
--- a/arch/x86/crypto/sm4-avx.h
+++ b/arch/x86/crypto/sm4-avx.h
@@ -2,19 +2,27 @@
 #ifndef ASM_X86_SM4_AVX_H
 #define ASM_X86_SM4_AVX_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <crypto/sm4.h>
 
 typedef void (*sm4_crypt_func)(const u32 *rk, u8 *dst, const u8 *src, u8 *iv);
 
-int sm4_avx_ecb_encrypt(struct skcipher_request *req);
-int sm4_avx_ecb_decrypt(struct skcipher_request *req);
-
-int sm4_cbc_encrypt(struct skcipher_request *req);
-int sm4_avx_cbc_decrypt(struct skcipher_request *req,
-			unsigned int bsize, sm4_crypt_func func);
-
-int sm4_avx_ctr_crypt(struct skcipher_request *req,
-			unsigned int bsize, sm4_crypt_func func);
+struct skcipher_request;
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_avx_ecb_encrypt, int,
+	(struct skcipher_request *req),
+	(req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_avx_ecb_decrypt, int,
+	(struct skcipher_request *req),
+	(req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_cbc_encrypt, int,
+	(struct skcipher_request *req),
+	(req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_avx_cbc_decrypt, int,
+	(struct skcipher_request *req, unsigned int bsize, sm4_crypt_func func),
+	(req, bsize, func));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64, sm4_avx_ctr_crypt, int,
+	(struct skcipher_request *req, unsigned int bsize, sm4_crypt_func func),
+	(req, bsize, func));
 
 #endif
diff --git a/arch/x86/crypto/sm4_aesni_avx_glue.c b/arch/x86/crypto/sm4_aesni_avx_glue.c
index 88caf418a06f..787468f9dcf2 100644
--- a/arch/x86/crypto/sm4_aesni_avx_glue.c
+++ b/arch/x86/crypto/sm4_aesni_avx_glue.c
@@ -339,8 +339,8 @@ static void __exit sm4_exit(void)
 				    ARRAY_SIZE(sm4_aesni_avx_skciphers));
 }
 
-module_init(sm4_init);
-module_exit(sm4_exit);
+crypto_module_init(sm4_init);
+crypto_module_exit(sm4_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Tianjia Zhang <tianjia.zhang@linux.alibaba.com>");
-- 
2.47.3


