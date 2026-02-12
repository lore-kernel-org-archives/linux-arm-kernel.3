Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B300CEDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w49qDPq+rQDtkwFtlcyW9tMGaHhTNclxaEhT6RpCKdA=; b=iF2hA/80rOdLDvkCxW/PvYwlbz
	s3U3V74bSf3dS5InKbMUQjg8SIPFkRA3BK3moV4sX30KQ7fP5zyXDceWzVCrxz9vkdlb1tkkbWvab
	U4ODEabYYxPwR5gB23PbXjilJ+YgO9CQen2/kHVV7vsRmmTtOFB5D0d4xzSDDSTTb2RYAnL5TQNid
	Nx8aU87prFALnXFmMenF2pfQabV+/D+7wmYmSeur38BR+4SoPau8+gRyYvL5dtkYdzXpqPdve3exF
	ZAhHzkxr24IH92kHKNoOGbK47CMcKgpeHhxVkn80Gi+QnbBXdq3Gmo/5K2mCUgzpKropK/+FNNYQp
	hqgYl5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN0v-00000001TBN-2Ndy;
	Thu, 12 Feb 2026 03:05:09 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN0r-00000001TAW-2hqW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865505; x=1802401505;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w49qDPq+rQDtkwFtlcyW9tMGaHhTNclxaEhT6RpCKdA=;
  b=YFkQaP7C4L0AagF7+Q6rI8CQqV4dVwt8x0JmF2HP/XQGZwgP2XNZZTbZ
   ivOevIwR8FzzGdnxM5S71hGcpDzEZJhy/TYI8jW5zUaF74scHSYPMNbLO
   dyEHpquN3p56I7da0d/yjqoL4lr4qETz0mljiYw3tCP3eyQ1QDeVLb+iK
   K4mPxclSP8rwaOiQ2Vx0pLXz9fxccrI3cvypN89ZydnaXUwpJ9NlmHEG7
   AZBtwajf3BfgwxtI+C03Gy5ScnRz6f4LSM9clOuH0DhajwmucQcPW3wTf
   bfFFLiPgCWjaY1SJbaBAXpVry0iAinevqtv4HkxEBPCbi61c/7qclSDkS
   A==;
X-CSE-ConnectionGUID: xPtC0UHFQy+v2tcWROPvBQ==
X-CSE-MsgGUID: G8n403sgQta2fiOegM8+gw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918540"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:05:05 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:32050]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 005c2e7b-7f30-42c8-9bfd-293f240741ec; Thu, 12 Feb 2026 03:05:05 +0000 (UTC)
X-Farcaster-Flow-ID: 005c2e7b-7f30-42c8-9bfd-293f240741ec
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:02 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:05:02 +0000
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
Subject: [PATCH 068/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CAST_COMMON, CONFIG_CRYPTO_CAST5, CONFIG_CRYPTO_CAST6 crypto
Date: Thu, 12 Feb 2026 02:46:44 +0000
Message-ID: <20260212024725.11264-69-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWB002.ant.amazon.com (10.13.138.89) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190505_742447_4D22215D 
X-CRM114-Status: GOOD (  11.29  )
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
CONFIG_CRYPTO_CAST_COMMON-, CONFIG_CRYPTO_CAST5-, and
CONFIG_CRYPTO_CAST6-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  6 +++---
 crypto/cast5_generic.c       |  4 ++--
 crypto/cast6_generic.c       |  4 ++--
 crypto/fips140/fips140-api.c | 42 ++++++++++++++++++++++++++++++++++++
 include/crypto/cast5.h       | 14 +++++++++---
 include/crypto/cast6.h       | 19 ++++++++++++----
 include/crypto/cast_common.h | 17 +++++++++++----
 7 files changed, 88 insertions(+), 18 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 4b6e56ad4d1c..7635fd4b698c 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -138,9 +138,9 @@ crypto-objs-$(CONFIG_CRYPTO_AES) += aes.o
 crypto-objs-$(CONFIG_CRYPTO_SM4) += sm4.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_GENERIC) += sm4_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
-obj-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
-obj-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
-obj-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
+crypto-objs-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
 obj-$(CONFIG_CRYPTO_ARC4) += arc4.o
 obj-$(CONFIG_CRYPTO_TEA) += tea.o
 obj-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
diff --git a/crypto/cast5_generic.c b/crypto/cast5_generic.c
index f68330793e0c..241738e09945 100644
--- a/crypto/cast5_generic.c
+++ b/crypto/cast5_generic.c
@@ -531,8 +531,8 @@ static void __exit cast5_mod_fini(void)
 	crypto_unregister_alg(&alg);
 }
 
-module_init(cast5_mod_init);
-module_exit(cast5_mod_fini);
+crypto_module_init(cast5_mod_init);
+crypto_module_exit(cast5_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Cast5 Cipher Algorithm");
diff --git a/crypto/cast6_generic.c b/crypto/cast6_generic.c
index 4c08c42646f0..53deace18e63 100644
--- a/crypto/cast6_generic.c
+++ b/crypto/cast6_generic.c
@@ -271,8 +271,8 @@ static void __exit cast6_mod_fini(void)
 	crypto_unregister_alg(&alg);
 }
 
-module_init(cast6_mod_init);
-module_exit(cast6_mod_fini);
+crypto_module_init(cast6_mod_init);
+crypto_module_exit(cast6_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Cast6 Cipher Algorithm");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 475cab990549..f6d6a6e79a9e 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -696,3 +696,45 @@ DEFINE_CRYPTO_API_STUB(__serpent_encrypt);
 DEFINE_CRYPTO_API_STUB(__serpent_decrypt);
 
 #endif
+/*
+ * crypto/cast_common.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAST_COMMON)
+
+#include <crypto/cast_common.h>
+
+#undef cast_s1
+#undef cast_s2
+#undef cast_s3
+#undef cast_s4
+DEFINE_CRYPTO_VAR_STUB(cast_s1);
+DEFINE_CRYPTO_VAR_STUB(cast_s2);
+DEFINE_CRYPTO_VAR_STUB(cast_s3);
+DEFINE_CRYPTO_VAR_STUB(cast_s4);
+
+#endif
+/*
+ * crypto/cast5_generic.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAST5)
+
+#include <crypto/cast5.h>
+
+DEFINE_CRYPTO_API_STUB(cast5_setkey);
+DEFINE_CRYPTO_API_STUB(__cast5_encrypt);
+DEFINE_CRYPTO_API_STUB(__cast5_decrypt);
+
+#endif
+/*
+ * crypto/cast6_generic.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAST6)
+
+#include <crypto/cast6.h>
+
+DEFINE_CRYPTO_API_STUB(__cast6_setkey);
+DEFINE_CRYPTO_API_STUB(cast6_setkey);
+DEFINE_CRYPTO_API_STUB(__cast6_encrypt);
+DEFINE_CRYPTO_API_STUB(__cast6_decrypt);
+
+#endif
diff --git a/include/crypto/cast5.h b/include/crypto/cast5.h
index 3d4ed4ea9c3b..cdd85cd974bb 100644
--- a/include/crypto/cast5.h
+++ b/include/crypto/cast5.h
@@ -2,6 +2,7 @@
 #ifndef _CRYPTO_CAST5_H
 #define _CRYPTO_CAST5_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <linux/crypto.h>
 #include <crypto/cast_common.h>
@@ -16,9 +17,16 @@ struct cast5_ctx {
 	int rr;	/* rr ? rounds = 12 : rounds = 16; (rfc 2144) */
 };
 
-int cast5_setkey(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST5, cast5_setkey, int,
+	(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
 
-void __cast5_encrypt(struct cast5_ctx *ctx, u8 *dst, const u8 *src);
-void __cast5_decrypt(struct cast5_ctx *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST5, __cast5_encrypt, void,
+	(struct cast5_ctx *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST5, __cast5_decrypt, void,
+	(struct cast5_ctx *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif
diff --git a/include/crypto/cast6.h b/include/crypto/cast6.h
index 38f490cd50a8..5fd28d7ed70f 100644
--- a/include/crypto/cast6.h
+++ b/include/crypto/cast6.h
@@ -2,6 +2,7 @@
 #ifndef _CRYPTO_CAST6_H
 #define _CRYPTO_CAST6_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <linux/crypto.h>
 #include <crypto/cast_common.h>
@@ -15,10 +16,20 @@ struct cast6_ctx {
 	u8 Kr[12][4];
 };
 
-int __cast6_setkey(struct cast6_ctx *ctx, const u8 *key, unsigned int keylen);
-int cast6_setkey(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST6, __cast6_setkey, int,
+	(struct cast6_ctx *ctx, const u8 *key, unsigned int keylen),
+	(ctx, key, keylen));
 
-void __cast6_encrypt(const void *ctx, u8 *dst, const u8 *src);
-void __cast6_decrypt(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST6, cast6_setkey, int,
+	(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST6, __cast6_encrypt, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_CAST6, __cast6_decrypt, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif
diff --git a/include/crypto/cast_common.h b/include/crypto/cast_common.h
index b90090244164..68f8b4b5ea76 100644
--- a/include/crypto/cast_common.h
+++ b/include/crypto/cast_common.h
@@ -2,9 +2,18 @@
 #ifndef _CRYPTO_CAST_COMMON_H
 #define _CRYPTO_CAST_COMMON_H
 
-extern const u32 cast_s1[256];
-extern const u32 cast_s2[256];
-extern const u32 cast_s3[256];
-extern const u32 cast_s4[256];
+#include <crypto/api.h>
+
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s1, const u32, [256]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s2, const u32, [256]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s3, const u32, [256]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s4, const u32, [256]);
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_CRYPTO_CAST_COMMON)
+#define cast_s1 (((const u32*)CRYPTO_VAR_NAME(cast_s1)))
+#define cast_s2 (((const u32*)CRYPTO_VAR_NAME(cast_s2)))
+#define cast_s3 (((const u32*)CRYPTO_VAR_NAME(cast_s3)))
+#define cast_s4 (((const u32*)CRYPTO_VAR_NAME(cast_s4)))
+#endif
 
 #endif
-- 
2.47.3


