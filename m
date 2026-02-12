Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FA9EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zklCA3SUmDM/v9rDNjTx89O8GDJlgKC0gw76p2K+s/k=; b=UvKksuACAFWA13Dvr8dtqNpG2F
	KcvxNWTg00vcP4opUwHHInkvMwAmG5wUQLlYMOOAmJEe6ZZMwepZz56hMYWg6HiqMXb7BAay73bER
	Hj+KqaCgvE0wNdL4D/mwepcU0utaQ7sqjajJHeFE1d8ADigC969f5KseFZQ8jo6waN7paYLaWVk22
	iilmXzxU8NVpuryMLHqbYMJCs66xv1+WLyZl1ESegW8bCaxG08emGUbhT5Cn2kum+KVANNrgwUa6F
	XpqS8dXdcFmjjRp3677CuAglALaDM/ZI96C7O7YnGKuItQA9Z3nVvhZu+a1wxmhr62Dn2AidhltVu
	WhL1Gbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN0O-00000001SzK-3sSc;
	Thu, 12 Feb 2026 03:04:36 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN0L-00000001SyC-3tPk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865473; x=1802401473;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zklCA3SUmDM/v9rDNjTx89O8GDJlgKC0gw76p2K+s/k=;
  b=Luos7p6TCS59g1qnKKnNpOFeoS/s8nlXYkI3aeqAGOo4sYiKqQA0m0fN
   AX7svK2+dy6mDwpJu6xjzFKO+lqVB0gDCpysQ3JiK/DLXkxWo3t3JAZjx
   3irgiWu729JQc7FBis1hlhOcwGSppPCGM9+U3OSsJ9Qho3dL8abV3H47e
   yquqZGA1+mz3XKV/tv/3goJkdlx/wy1jSO6Va8suK14jyEV88ivklsfMT
   TAAYuWGnbJNLMi3t9cl5WH4GCv+HwtIl2jFPXSvf/oh5tkCOZTiG3NN0m
   0nkTBAgJH4AjvpYz8NliKocFMviMKuLYFYOnfAm0+P2JoLdC4/ORfG7uw
   w==;
X-CSE-ConnectionGUID: nF/vgnDRQZ6caAxpaVaEyw==
X-CSE-MsgGUID: iWymHtvITVicPj6t5vx5iQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12455480"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:04:33 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:12108]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 8e2cff70-a55a-43a0-8247-bd29a6ea4afd; Thu, 12 Feb 2026 03:04:33 +0000 (UTC)
X-Farcaster-Flow-ID: 8e2cff70-a55a-43a0-8247-bd29a6ea4afd
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:04:31 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:04:31 +0000
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
Subject: [PATCH 066/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SERPENT crypto
Date: Thu, 12 Feb 2026 02:46:42 +0000
Message-ID: <20260212024725.11264-67-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D041UWA002.ant.amazon.com (10.13.139.121) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190434_021880_41EE3363 
X-CRM114-Status: GOOD (  11.77  )
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
CONFIG_CRYPTO_SERPENT-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/fips140/fips140-api.c | 13 +++++++++++++
 crypto/serpent_generic.c     |  4 ++--
 include/crypto/serpent.h     | 20 +++++++++++++++-----
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index e93edc49840a..c14713e9cc55 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -132,7 +132,7 @@ crypto-objs-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
 crypto-objs-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
 crypto-objs-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
 crypto-objs-$(CONFIG_CRYPTO_TWOFISH_COMMON) += twofish_common.o
-obj-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
 CFLAGS_serpent_generic.o := $(call cc-option,-fsched-pressure)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
 crypto-objs-$(CONFIG_CRYPTO_AES) += aes.o
 crypto-objs-$(CONFIG_CRYPTO_SM4) += sm4.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 9ad530743d1f..475cab990549 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -683,3 +683,16 @@ DEFINE_CRYPTO_API_STUB(__twofish_setkey);
 DEFINE_CRYPTO_API_STUB(twofish_setkey);
 
 #endif
+/*
+ * crypto/serpent_generic.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SERPENT)
+
+#include <crypto/serpent.h>
+
+DEFINE_CRYPTO_API_STUB(__serpent_setkey);
+DEFINE_CRYPTO_API_STUB(serpent_setkey);
+DEFINE_CRYPTO_API_STUB(__serpent_encrypt);
+DEFINE_CRYPTO_API_STUB(__serpent_decrypt);
+
+#endif
diff --git a/crypto/serpent_generic.c b/crypto/serpent_generic.c
index b21e7606c652..27c2da015d20 100644
--- a/crypto/serpent_generic.c
+++ b/crypto/serpent_generic.c
@@ -599,8 +599,8 @@ static void __exit serpent_mod_fini(void)
 	crypto_unregister_alg(&srp_alg);
 }
 
-module_init(serpent_mod_init);
-module_exit(serpent_mod_fini);
+crypto_module_init(serpent_mod_init);
+crypto_module_exit(serpent_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Serpent Cipher Algorithm");
diff --git a/include/crypto/serpent.h b/include/crypto/serpent.h
index 75c7eaa20853..8985ff684aeb 100644
--- a/include/crypto/serpent.h
+++ b/include/crypto/serpent.h
@@ -6,6 +6,7 @@
 #ifndef _CRYPTO_SERPENT_H
 #define _CRYPTO_SERPENT_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <linux/crypto.h>
 
@@ -18,11 +19,20 @@ struct serpent_ctx {
 	u32 expkey[SERPENT_EXPKEY_WORDS];
 };
 
-int __serpent_setkey(struct serpent_ctx *ctx, const u8 *key,
-		     unsigned int keylen);
-int serpent_setkey(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT, __serpent_setkey, int,
+	(struct serpent_ctx *ctx, const u8 *key, unsigned int keylen),
+	(ctx, key, keylen));
 
-void __serpent_encrypt(const void *ctx, u8 *dst, const u8 *src);
-void __serpent_decrypt(const void *ctx, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT, serpent_setkey, int,
+	(struct crypto_tfm *tfm, const u8 *key, unsigned int keylen),
+	(tfm, key, keylen));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT, __serpent_encrypt, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SERPENT, __serpent_decrypt, void,
+	(const void *ctx, u8 *dst, const u8 *src),
+	(ctx, dst, src));
 
 #endif
-- 
2.47.3


