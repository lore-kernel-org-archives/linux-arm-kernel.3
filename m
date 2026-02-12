Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3802AEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWVnzMKqZwXb7ujBa879sgo4S8DJVmDQ4KTRf7FzagM=; b=pqCLZSQN3bh/RGRGYDoMW+1TT/
	QirJOQnCmVlpKtt1AydP75i9ZQ011fEMTSXleUSQQn63NTBY/5fVI1HOe5wKstQXXT0ssQbSLz1IR
	UL1bfZwlAYuOuWcSJibPCAp4ICau0Q7rPIQDmnh8KdGLV9s8ZAbknV7POq3u0Hb/tNfm0ujNSw8+C
	F5IWHWwi2eQ5Tmct6yRQWQgacvpppgiGkrCiBbcXf+2xnFac8IDcMfthHqBHk5qqhOmvYFqG3N5m0
	Yzm0MIKk+qkKlIwq6Fx06b9dC9MXM+YQLiCJ6Z/AdpDgpoG9aXvCoeksxdZ91FPa8K+ijAoFBEir5
	W1Gs3MAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN2r-00000001Tzy-1vX9;
	Thu, 12 Feb 2026 03:07:09 +0000
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.35.192.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN2p-00000001Tyc-36bs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865627; x=1802401627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NWVnzMKqZwXb7ujBa879sgo4S8DJVmDQ4KTRf7FzagM=;
  b=fA6vz38KJ/3HY9cek+uPdNv6aTH+9Wvc2obWzmh7zjaRpatoBrs1ul+I
   L3SYXvkqnyduO+ZgPairFNBj7p5hqiW7L8WwiNYsftSwZziJNDyz7T5UU
   CzsItJFK9wRxW6pl/R4UXTPEywkUgS5DzRhtj0L6lg2ZzgSLunS+6u5ad
   Mw6dPUm7nXOwOD6Dp4EYT7DVgghmMR9kwNFMWCIbkPC7H2fi0EHt1XHNW
   sXh/hFsZXuqgfugbah/lDKvY81yd4ros9LZWyWbv2fcrk6ZoWHoQ0QJEu
   B9J09pVhMLnEUVFDyJ0uXPy4FeSgoD21o8EXlarMGZEoCodU4YgomgeD0
   w==;
X-CSE-ConnectionGUID: LA2eZqqUSUK3tEPKrZtTWQ==
X-CSE-MsgGUID: I9l+eu1OSQKwsbiU+7WrUA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12698784"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:07:07 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:18877]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id 60bdb2f2-d74a-43cf-840a-82c272fcc309; Thu, 12 Feb 2026 03:07:07 +0000 (UTC)
X-Farcaster-Flow-ID: 60bdb2f2-d74a-43cf-840a-82c272fcc309
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:06 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:06 +0000
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
Subject: [PATCH 076/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ARIA crypto
Date: Thu, 12 Feb 2026 02:46:52 +0000
Message-ID: <20260212024725.11264-77-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D039UWA002.ant.amazon.com (10.13.139.32) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190707_828742_D87C7C42 
X-CRM114-Status: GOOD (  11.34  )
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
CONFIG_CRYPTO_ARIA-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/aria_generic.c        |  4 ++--
 crypto/fips140/fips140-api.c | 12 ++++++++++++
 include/crypto/aria.h        | 16 ++++++++++++----
 4 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 3e515caa72f5..c7dcc0e55325 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -146,7 +146,7 @@ crypto-objs-$(CONFIG_CRYPTO_TEA) += tea.o
 crypto-objs-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 crypto-objs-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
 crypto-objs-$(CONFIG_CRYPTO_SEED) += seed.o
-obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
 crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
diff --git a/crypto/aria_generic.c b/crypto/aria_generic.c
index faa7900383f6..7a66ae96312a 100644
--- a/crypto/aria_generic.c
+++ b/crypto/aria_generic.c
@@ -304,8 +304,8 @@ static void __exit aria_fini(void)
 	crypto_unregister_alg(&aria_alg);
 }
 
-module_init(aria_init);
-module_exit(aria_fini);
+crypto_module_init(aria_init);
+crypto_module_exit(aria_fini);
 
 MODULE_DESCRIPTION("ARIA Cipher Algorithm");
 MODULE_LICENSE("GPL");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index e20c9601637a..e6d2e3680792 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -763,3 +763,15 @@ DEFINE_CRYPTO_API_STUB(af_alg_alloc_areq);
 DEFINE_CRYPTO_API_STUB(af_alg_get_rsgl);
 
 #endif
+/*
+ * crypto/aria_generic.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ARIA)
+
+#include <crypto/aria.h>
+
+DEFINE_CRYPTO_API_STUB(aria_set_key);
+DEFINE_CRYPTO_API_STUB(aria_encrypt);
+DEFINE_CRYPTO_API_STUB(aria_decrypt);
+
+#endif
diff --git a/include/crypto/aria.h b/include/crypto/aria.h
index 73295146be11..55108db53ca3 100644
--- a/include/crypto/aria.h
+++ b/include/crypto/aria.h
@@ -18,6 +18,7 @@
 #ifndef _CRYPTO_ARIA_H
 #define _CRYPTO_ARIA_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -450,9 +451,16 @@ static inline void aria_gsrk(u32 *rk, u32 *x, u32 *y, u32 n)
 		((y[(q + 2) % 4]) << (32 - r));
 }
 
-void aria_encrypt(void *ctx, u8 *out, const u8 *in);
-void aria_decrypt(void *ctx, u8 *out, const u8 *in);
-int aria_set_key(struct crypto_tfm *tfm, const u8 *in_key,
-		 unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA, aria_encrypt, void,
+	(void *ctx, u8 *out, const u8 *in),
+	(ctx, out, in));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA, aria_decrypt, void,
+	(void *ctx, u8 *out, const u8 *in),
+	(ctx, out, in));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ARIA, aria_set_key, int,
+	(struct crypto_tfm *tfm, const u8 *in_key, unsigned int key_len),
+	(tfm, in_key, key_len));
 
 #endif
-- 
2.47.3


