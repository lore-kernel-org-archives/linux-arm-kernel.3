Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1910EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmeYz5qWEvxPRrYbBGIa1zZYcjyr1kNfHJJ7PterXgM=; b=dXUcC5iMy4sPI7OshQfCPIAmvD
	Aju9QUkrMN/LbW1LRbVXMl10W2zJQu1K978ZSd5T7H2PZqujw64GgAl94kiOt/Hz0VQgy7jJrZunr
	Pb/1pEAvBTcyrPOlY4MGuLIl1kqiNbMdXPWf951cJkX33GFAsU11BlypZCRiHCy8H8rArKpHfD4+H
	7lsRTC/wbeBKLIDqzokL3GCgaIblkmW9GYQ+xuJ2FVAi6ohWDCjAx5ryKiRxAVEgs0viRle7lIQ0Y
	NZTbgCULXgyHI3S9Y4dY2zIH/8AtW4t17/UOwaKunHqfJMUXl46zA8G0l+E5BjRu5s3AoG+yQMCSQ
	h6iRvroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMt8-00000001PuN-1VJf;
	Thu, 12 Feb 2026 02:57:06 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMt5-00000001PsF-0kC0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865023; x=1802401023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cmeYz5qWEvxPRrYbBGIa1zZYcjyr1kNfHJJ7PterXgM=;
  b=S6qcFJs1wImIvgLXDzCrRDHQxO6mNfjw541A2M+xBbgEzPXTlfmFPCYU
   EStfI13fh7O0ylqmwQIF4vACFiL2UQYdUEh1tKGlST+AWD9jvvN9+iNCE
   5hRFPkVZkG3eC3fwHGY5VBb2i9JFkaf9XYs7zo9AoAXqLsuCDw64Z8K3H
   th/IRFBKA5eAtl9e+Vmyepa17rlwF677ONe+8zj1DZd+Gh52ujbhWvRhA
   YHIcZAgoW05hd9vUO/773/1ARoKU4jXqACbRbqcL6KhCwsWmVOalgLYbz
   uYg/4MQWZ/mEMwW8O9wDmX4CC/42myH/jHG6K5BUOvq/Ia3VPvNokDzGl
   g==;
X-CSE-ConnectionGUID: 4KkKxyivTOSrf8cymaSnRA==
X-CSE-MsgGUID: bzQllJsfR56CXTjZvNSsog==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721709"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:57:02 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:29620]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 7781a320-cc77-46ad-bc1a-d0ac18add058; Thu, 12 Feb 2026 02:57:02 +0000 (UTC)
X-Farcaster-Flow-ID: 7781a320-cc77-46ad-bc1a-d0ac18add058
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:57:00 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:57:00 +0000
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
Subject: [PATCH 037/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_HKDF crypto
Date: Thu, 12 Feb 2026 02:46:13 +0000
Message-ID: <20260212024725.11264-38-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D044UWA003.ant.amazon.com (10.13.139.43) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185703_283054_253487F4 
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
CONFIG_CRYPTO_HKDF-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/fips140/fips140-api.c | 22 ++++++++++++++++++++++
 crypto/hkdf.c                |  4 ++--
 include/crypto/hkdf.h        | 13 +++++++------
 4 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index f2b9532a0320..42b45a8941b4 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -36,7 +36,7 @@ crypto-objs-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
 crypto-objs-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
 crypto-objs-$(CONFIG_CRYPTO_SIG2) += sig.o
 crypto-objs-$(CONFIG_CRYPTO_KPP2) += kpp.o
-obj-$(CONFIG_CRYPTO_HKDF) += hkdf.o
+crypto-objs-$(CONFIG_CRYPTO_HKDF) += hkdf.o
 
 dh_generic-y := dh.o
 dh_generic-y += dh_helper.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 05ada434d1ac..8db92603bd59 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -565,4 +565,26 @@ DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_skcipher);
 DEFINE_CRYPTO_API_STUB(crypto_engine_register_skciphers);
 DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_skciphers);
 
+#endif
+/*
+ * crypto/hkdf.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_HKDF)
+
+#include <crypto/hkdf.h>
+
+DEFINE_CRYPTO_API_STUB(hkdf_extract);
+DEFINE_CRYPTO_API_STUB(hkdf_expand);
+
+#endif
+/*
+ * crypto/hkdf.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_HKDF)
+
+#include <crypto/hkdf.h>
+
+DEFINE_CRYPTO_API_STUB(hkdf_extract);
+DEFINE_CRYPTO_API_STUB(hkdf_expand);
+
 #endif
\ No newline at end of file
diff --git a/crypto/hkdf.c b/crypto/hkdf.c
index 82d1b32ca6ce..c779353be68f 100644
--- a/crypto/hkdf.c
+++ b/crypto/hkdf.c
@@ -566,8 +566,8 @@ static int __init crypto_hkdf_module_init(void)
 
 static void __exit crypto_hkdf_module_exit(void) {}
 
-late_initcall(crypto_hkdf_module_init);
-module_exit(crypto_hkdf_module_exit);
+crypto_late_initcall(crypto_hkdf_module_init);
+crypto_module_exit(crypto_hkdf_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("HMAC-based Key Derivation Function (HKDF)");
diff --git a/include/crypto/hkdf.h b/include/crypto/hkdf.h
index 6a9678f508f5..8253aa2e004c 100644
--- a/include/crypto/hkdf.h
+++ b/include/crypto/hkdf.h
@@ -9,12 +9,13 @@
 #ifndef _CRYPTO_HKDF_H
 #define _CRYPTO_HKDF_H
 
+#include <crypto/api.h>
 #include <crypto/hash.h>
 
-int hkdf_extract(struct crypto_shash *hmac_tfm, const u8 *ikm,
-		 unsigned int ikmlen, const u8 *salt, unsigned int saltlen,
-		 u8 *prk);
-int hkdf_expand(struct crypto_shash *hmac_tfm,
-		const u8 *info, unsigned int infolen,
-		u8 *okm, unsigned int okmlen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HKDF, hkdf_extract, int,
+	(struct crypto_shash *hmac_tfm, const u8 *ikm, unsigned int ikmlen, const u8 *salt, unsigned int saltlen, u8 *prk),
+	(hmac_tfm, ikm, ikmlen, salt, saltlen, prk));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_HKDF, hkdf_expand, int,
+	(struct crypto_shash *hmac_tfm, const u8 *info, unsigned int infolen, u8 *okm, unsigned int okmlen),
+	(hmac_tfm, info, infolen, okm, okmlen));
 #endif
-- 
2.47.3


