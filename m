Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E09EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dd1i966UbHbohsXYyD1lNX8OHFyJUWZHZw+gT8gzz8E=; b=y+/arWy05J6IZjPTstaSdYHnNI
	W9oKlp/+gQsuksxiMkK1hL0Jb78kuw4ESio9WBDuqJTeoD0vhXR/4Q3+y6CHDB8eKyJJTc9SnoP9A
	MozFOH58Ou53BzdR/H9YjOFA8z4Fl8X3NeW+/WIoJyqrn2Fx3D+IJHUmNU13Q3bp0yI5UuSsAB8M0
	CHl24Bu2VVFdqcQKxB2Rm/cvDmFmIKvAbc2VgrWHRER9McrN0XufYnAlEw5F7ouW/ROQKlwT7Vtge
	TnCwlkcwsTRRQZ4c246HChNSwxxGVUW9iNCoE6sfztKGnaxJ9Wea0Y5DqBfMa4ZDfA4UdtOsguFtz
	lpczLdSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMqM-00000001OkJ-2rnv;
	Thu, 12 Feb 2026 02:54:14 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMqJ-00000001Oiw-0Xqp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864851; x=1802400851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dd1i966UbHbohsXYyD1lNX8OHFyJUWZHZw+gT8gzz8E=;
  b=mJY1wouJgY64U2Kz2I96od9K5m+Fl+2GcXApIN4/hn5AqwrC7RiWdTFS
   zPU2EpTrDbFBYMCNmulIoQy9LDBybUA48LFtPWA2y2d6pKHD0fEGAc4D+
   WZxWIBzYAxKHkMNOKmR1ouuQkkpbcJj0g/uzINe8aaXxbPN6PCabq/lxX
   hopCSzXN7ALA5kOzfdprp3b5J4Daklo1UPQUWj8f/M5I6D7MK6Wu1b9J5
   5wncuxAdHsA6sQMRuXu7D0b+siNuMNnlhPSnyXYR2Rpclwz8RZgVuEKo6
   M0mGWu+ZTTlJjwBn9A6/VUgM6wuI5n+Xb+fjcxrH67u6ixUBQEaf+x8+v
   Q==;
X-CSE-ConnectionGUID: bygMv3X3R4mAvly89Y+CJg==
X-CSE-MsgGUID: GIi41z0gQ6eiF61t1qCmUg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12914350"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:54:10 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:11353]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 6f3e2035-981b-466a-8912-97bec792f14e; Thu, 12 Feb 2026 02:54:10 +0000 (UTC)
X-Farcaster-Flow-ID: 6f3e2035-981b-466a-8912-97bec792f14e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:10 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:54:09 +0000
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
Subject: [PATCH 026/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_AUTHENC crypto
Date: Thu, 12 Feb 2026 02:46:02 +0000
Message-ID: <20260212024725.11264-27-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWA003.ant.amazon.com (10.13.139.31) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185411_700602_FD74AC8A 
X-CRM114-Status: GOOD (  13.74  )
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
CONFIG_CRYPTO_AUTHENC-related crypto to convert them into pluggable
interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/authenc.c             |  4 ++--
 crypto/authencesn.c          |  4 ++--
 crypto/fips140/fips140-api.c | 12 ++++++++++++
 include/crypto/authenc.h     |  6 ++++--
 5 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 9dc0d5d55eaa..3a2da61b4581 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -155,7 +155,7 @@ obj-$(CONFIG_CRYPTO_CRC32C) += crc32c-cryptoapi.o
 crc32c-cryptoapi-y := crc32c.o
 obj-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
 crc32-cryptoapi-y := crc32.o
-obj-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
+crypto-objs-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 obj-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
 obj-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
diff --git a/crypto/authenc.c b/crypto/authenc.c
index ac679ce2cb95..132c30d75165 100644
--- a/crypto/authenc.c
+++ b/crypto/authenc.c
@@ -446,8 +446,8 @@ static void __exit crypto_authenc_module_exit(void)
 	crypto_unregister_template(&crypto_authenc_tmpl);
 }
 
-module_init(crypto_authenc_module_init);
-module_exit(crypto_authenc_module_exit);
+crypto_module_init(crypto_authenc_module_init);
+crypto_module_exit(crypto_authenc_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Simple AEAD wrapper for IPsec");
diff --git a/crypto/authencesn.c b/crypto/authencesn.c
index 542a978663b9..6279d877a95a 100644
--- a/crypto/authencesn.c
+++ b/crypto/authencesn.c
@@ -439,8 +439,8 @@ static void __exit crypto_authenc_esn_module_exit(void)
 	crypto_unregister_template(&crypto_authenc_esn_tmpl);
 }
 
-module_init(crypto_authenc_esn_module_init);
-module_exit(crypto_authenc_esn_module_exit);
+crypto_module_init(crypto_authenc_esn_module_init);
+crypto_module_exit(crypto_authenc_esn_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Steffen Klassert <steffen.klassert@secunet.com>");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 77ed24a3cd3b..3cfe147b984c 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -379,4 +379,16 @@ DEFINE_CRYPTO_API_STUB(alg_test);
 
 #undef md5_zero_message_hash
 DEFINE_CRYPTO_VAR_STUB(md5_zero_message_hash);
+
+#endif
+
+/*
+ * crypto/authenc.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_AUTHENC)
+
+#include <crypto/authenc.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_authenc_extractkeys);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/authenc.h b/include/crypto/authenc.h
index 15a9caa2354a..4871b7bdcd8e 100644
--- a/include/crypto/authenc.h
+++ b/include/crypto/authenc.h
@@ -7,6 +7,7 @@
 #ifndef _CRYPTO_AUTHENC_H
 #define _CRYPTO_AUTHENC_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 
 enum {
@@ -26,8 +27,9 @@ struct crypto_authenc_keys {
 	unsigned int enckeylen;
 };
 
-int crypto_authenc_extractkeys(struct crypto_authenc_keys *keys, const u8 *key,
-			       unsigned int keylen);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_AUTHENC, crypto_authenc_extractkeys, int,
+	(struct crypto_authenc_keys *keys, const u8 *key, unsigned int keylen),
+	(keys, key, keylen));
 int crypto_krb5enc_extractkeys(struct crypto_authenc_keys *keys, const u8 *key,
 			       unsigned int keylen);
 
-- 
2.47.3


