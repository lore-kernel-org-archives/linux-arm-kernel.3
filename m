Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE6BEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUoSGWC8FwwChdiSv2XiY8EZfTBcx5B7eLz5nJg/iLQ=; b=zmBIDRIFUUaJ643Qm33G7BU/Ju
	QoPFQsD0oIjpVz6SnyL7Wt2ibUljo1olfiuJd9C2ykcDgPG9y4OsCpXzK3KElBg7CNAjaOCqRPeFC
	RIIof4DwaySlGq8OYrHc6sc2rSHcMMg0oR7hmlm1o0vUnGs3RansW3k1l7x32BXThKfdfxGWZH1hJ
	fKadDZWkaxl0C7kH3jqxJRz+A9RggsD97AIEB86TPCgzxBijRkKwR1+U4+5qZQR1/fqmP+V6az2Vo
	rPNs3f0mhWJKuRilblNvAZiswMaopODYO7Az2LcUM68RrW1XhWp4w02naiNGfJBgpTHKIfy0In0LJ
	DAUQir1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN8j-00000001WQq-0gU1;
	Thu, 12 Feb 2026 03:13:13 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN8f-00000001WPJ-2GjQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865989; x=1802401989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XUoSGWC8FwwChdiSv2XiY8EZfTBcx5B7eLz5nJg/iLQ=;
  b=K3CYEfMGGjGhB9D0d4YOQJeH+ZMfvuXVm4lpW5dzhSaLWnsQ0mfWsDS+
   3/MGku3v+Egz1FooZo3y2VgyN18heHuBsfeydU9ZHxWms4ydjDLmx55pb
   3ystLUUalIbJm6J2mph6oifuJG59itaVTNa25ZtiJluqNoaI0XF5DO/D4
   06klzqQPg7YPDHVvG7YktOfa2wdBt3BSfu7+B3xM2XLmpI1689WG205NK
   XXyLKsnOCn6oJRtFlegNr4sXJkkWGw9ufNEfuvw41ukxXFJXquRGLM6eQ
   ptLS2qabncSTT4KBFssgMm2gcUb5J+7d8XNsRjuHHxnEt0ZVWZv3N/w/8
   Q==;
X-CSE-ConnectionGUID: kYTx86IXSWuAJXDgUlx9xw==
X-CSE-MsgGUID: 3yPD7z2qTM+H+y6gsTfnpw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12727698"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:13:06 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:15230]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id b8ac0ff0-3f93-4400-b60e-d0173bb84aef; Thu, 12 Feb 2026 03:13:06 +0000 (UTC)
X-Farcaster-Flow-ID: b8ac0ff0-3f93-4400-b60e-d0173bb84aef
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:04 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:03 +0000
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
Subject: [PATCH 099/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_KDF800108_CTR crypto
Date: Thu, 12 Feb 2026 02:47:15 +0000
Message-ID: <20260212024725.11264-100-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWB003.ant.amazon.com (10.13.138.8) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191309_629626_A46EF636 
X-CRM114-Status: GOOD (  12.12  )
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
CONFIG_CRYPTO_KDF800108_CTR-related crypto to convert them into
pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile               |  2 +-
 crypto/fips140/fips140-api.c  | 11 +++++++++++
 crypto/kdf_sp800108.c         |  4 ++--
 include/crypto/kdf_sp800108.h | 14 ++++++++------
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 29e674c1f2ad..c1088b10f49a 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -205,7 +205,7 @@ obj-$(CONFIG_CRYPTO_SIMD) += crypto_simd.o
 #
 # Key derivation function
 #
-obj-$(CONFIG_CRYPTO_KDF800108_CTR) += kdf_sp800108.o
+crypto-objs-$(CONFIG_CRYPTO_KDF800108_CTR) += kdf_sp800108.o
 
 obj-$(CONFIG_CRYPTO_DF80090A) += df_sp80090a.o
 
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 7159c796d87f..0ed89baa3865 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -853,6 +853,17 @@ DEFINE_CRYPTO_API_STUB(async_syndrome_val);
 DEFINE_CRYPTO_API_STUB(async_raid6_2data_recov);
 DEFINE_CRYPTO_API_STUB(async_raid6_datap_recov);
 
+#endif
+/*
+ * crypto/kdf_sp800108.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_KDF800108_CTR)
+
+#include <crypto/kdf_sp800108.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_kdf108_ctr_generate);
+DEFINE_CRYPTO_API_STUB(crypto_kdf108_setkey);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/crypto/kdf_sp800108.c b/crypto/kdf_sp800108.c
index b7a6bf9da773..bf23a39bb657 100644
--- a/crypto/kdf_sp800108.c
+++ b/crypto/kdf_sp800108.c
@@ -149,8 +149,8 @@ static int __init crypto_kdf108_init(void)
 
 static void __exit crypto_kdf108_exit(void) { }
 
-module_init(crypto_kdf108_init);
-module_exit(crypto_kdf108_exit);
+crypto_module_init(crypto_kdf108_init);
+crypto_module_exit(crypto_kdf108_exit);
 
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Stephan Mueller <smueller@chronox.de>");
diff --git a/include/crypto/kdf_sp800108.h b/include/crypto/kdf_sp800108.h
index b7b20a778fb7..33cc2e75b014 100644
--- a/include/crypto/kdf_sp800108.h
+++ b/include/crypto/kdf_sp800108.h
@@ -7,6 +7,8 @@
 #ifndef _CRYPTO_KDF108_H
 #define _CRYPTO_KDF108_H
 
+#include <crypto/api.h>
+
 #include <crypto/hash.h>
 #include <linux/uio.h>
 
@@ -28,9 +30,9 @@
  *
  * @return 0 on success, < 0 on error
  */
-int crypto_kdf108_ctr_generate(struct crypto_shash *kmd,
-			       const struct kvec *info, unsigned int info_nvec,
-			       u8 *dst, unsigned int dlen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KDF800108_CTR, crypto_kdf108_ctr_generate, int,
+	(struct crypto_shash *kmd, const struct kvec *info, unsigned int info_nvec, u8 *dst, unsigned int dlen),
+	(kmd, info, info_nvec, dst, dlen));
 
 /**
  * Counter KDF setkey operation
@@ -54,8 +56,8 @@ int crypto_kdf108_ctr_generate(struct crypto_shash *kmd,
  *
  * @return 0 on success, < 0 on error
  */
-int crypto_kdf108_setkey(struct crypto_shash *kmd,
-			 const u8 *key, size_t keylen,
-			 const u8 *ikm, size_t ikmlen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KDF800108_CTR, crypto_kdf108_setkey, int,
+	(struct crypto_shash *kmd, const u8 *key, size_t keylen, const u8 *ikm, size_t ikmlen),
+	(kmd, key, keylen, ikm, ikmlen));
 
 #endif /* _CRYPTO_KDF108_H */
-- 
2.47.3


