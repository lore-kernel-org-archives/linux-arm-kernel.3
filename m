Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3BCEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaXTANj3WdYLelf3OpIkwm0i1K8wVreZrvfuIhUYIUY=; b=o2opth5fQFVyXyh8Bs+smB2J61
	GTT90YJRmjvI+pUuNzpVGLnHr/BFVs2M6ou08X2HbbMJsS3S2B9yOvwHzJ/W9MPGICWyFKTN7q0hA
	1KExMxx+inLz17jeGnOVWOC6JTS+mqVU/cua5aPW0AnoXY64G5C/KjrdPyQQwzTMlycX3VGkho1fu
	dJC9zr415/P+uPCFcdrDVsVj3eFzPoVPbRqFCNdVmZEDBvoPDbB7dOeACTf4jvI3EsZpYK1QDKS1C
	T7jJZVYFZt6hilEWcTZOmcCSoVA9lAyZ1Rzbk6kdlzHnP2vLlErNvLyVx8CbaEUjK0iSHXdrp2U9v
	9eVkFXKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMsd-00000001PgB-37u5;
	Thu, 12 Feb 2026 02:56:35 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMsY-00000001Pdz-2hMy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864990; x=1802400990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LaXTANj3WdYLelf3OpIkwm0i1K8wVreZrvfuIhUYIUY=;
  b=T9kyi/Xv9tAwKiQdMTor1nZgdPuz410aMQ6sFaJz/VaSVhsKLsAcPgW/
   KmUQBPEYboY5ST9CV2aRYEBE4ByKFZwNWOq6vTIz6H/VfvKlbHvuKTyXa
   JKmuXmsp7KVglzpHbRPS/60utdnE5j3SnMfR1eP2wmfTqp47DOTXoQ/SK
   suDuv31PjuRYnfvq0zqD9LdnaAgz3hwq8SNMTTuywu8caSIFT2aifWH46
   Wlck3NvK/pFN6KOD1RoiuM1mi5t3HgFX25PPUU7fNTE8iG7X1Y+HAZ/2e
   oKQ9nqNSFgulqNjBIbzZ0uJC4t2s5w8VGsGLnx3JN9ZC/5FdRzQgU3dVh
   Q==;
X-CSE-ConnectionGUID: zZCaXZiOSGKoaKte3aZE+A==
X-CSE-MsgGUID: Qn2UBKQRQjaa9D5AJlI8lQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918104"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:56:30 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:4788]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 1538a963-b225-4216-9d58-6549fac3c68b; Thu, 12 Feb 2026 02:56:30 +0000 (UTC)
X-Farcaster-Flow-ID: 1538a963-b225-4216-9d58-6549fac3c68b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:29 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:29 +0000
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
Subject: [PATCH 035/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_PKCS7_MESSAGE_PARSER crypto
Date: Thu, 12 Feb 2026 02:46:11 +0000
Message-ID: <20260212024725.11264-36-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D044UWB004.ant.amazon.com (10.13.139.134) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185631_334623_740044F1 
X-CRM114-Status: GOOD (  13.70  )
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
CONFIG_PKCS7_MESSAGE_PARSER-related crypto to convert them into pluggable
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
 crypto/asymmetric_keys/Makefile |  2 +-
 crypto/fips140/fips140-api.c    | 33 +++++++++++++++++++++++++++++++++
 include/crypto/pkcs7.h          | 31 +++++++++++++++++++------------
 3 files changed, 53 insertions(+), 13 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index b42c48d973d3..c68fdcd2c5cf 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -50,7 +50,7 @@ clean-files	+= pkcs8.asn1.c pkcs8.asn1.h
 #
 # PKCS#7 message handling
 #
-obj-$(CONFIG_PKCS7_MESSAGE_PARSER) += pkcs7_message.o
+crypto-objs-$(CONFIG_PKCS7_MESSAGE_PARSER) += pkcs7_message.o
 pkcs7_message-y := \
 	pkcs7.asn1.o \
 	pkcs7_parser.o \
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index d08a001bb0db..e679932ab552 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -493,3 +493,36 @@ DEFINE_CRYPTO_API_STUB(x509_decode_time);
 DEFINE_CRYPTO_API_STUB(x509_load_certificate_list);
 
 #endif
+/*
+ * crypto/asymmetric_keys/pkcs7_parser.c
+ */
+#if IS_BUILTIN(CONFIG_PKCS7_MESSAGE_PARSER)
+
+#include <crypto/pkcs7.h>
+
+DEFINE_CRYPTO_API_STUB(pkcs7_parse_message);
+DEFINE_CRYPTO_API_STUB(pkcs7_free_message);
+DEFINE_CRYPTO_API_STUB(pkcs7_get_content_data);
+
+#endif
+/*
+ * crypto/asymmetric_keys/pkcs7_trust.c
+ */
+#if IS_BUILTIN(CONFIG_PKCS7_MESSAGE_PARSER)
+
+#include <crypto/pkcs7.h>
+
+DEFINE_CRYPTO_API_STUB(pkcs7_validate_trust);
+
+#endif
+/*
+ * crypto/asymmetric_keys/pkcs7_verify.c
+ */
+#if IS_BUILTIN(CONFIG_PKCS7_MESSAGE_PARSER)
+
+#include <crypto/pkcs7.h>
+
+DEFINE_CRYPTO_API_STUB(pkcs7_verify);
+DEFINE_CRYPTO_API_STUB(pkcs7_supply_detached_data);
+
+#endif
diff --git a/include/crypto/pkcs7.h b/include/crypto/pkcs7.h
index 38ec7f5f9041..63a7f2dbe627 100644
--- a/include/crypto/pkcs7.h
+++ b/include/crypto/pkcs7.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_PKCS7_H
 #define _CRYPTO_PKCS7_H
 
+#include <crypto/api.h>
 #include <linux/verification.h>
 #include <linux/hash_info.h>
 #include <crypto/public_key.h>
@@ -18,28 +19,34 @@ struct pkcs7_message;
 /*
  * pkcs7_parser.c
  */
-extern struct pkcs7_message *pkcs7_parse_message(const void *data,
-						 size_t datalen);
-extern void pkcs7_free_message(struct pkcs7_message *pkcs7);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_parse_message, struct pkcs7_message *,
+	(const void *data, size_t datalen),
+	(data, datalen));
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_free_message, void,
+	(struct pkcs7_message *pkcs7),
+	(pkcs7));
 
-extern int pkcs7_get_content_data(const struct pkcs7_message *pkcs7,
-				  const void **_data, size_t *_datalen,
-				  size_t *_headerlen);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_get_content_data, int,
+	(const struct pkcs7_message *pkcs7, const void **_data, size_t *_datalen, size_t *_headerlen),
+	(pkcs7, _data, _datalen, _headerlen));
 
 /*
  * pkcs7_trust.c
  */
-extern int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
-				struct key *trust_keyring);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_validate_trust, int,
+	(struct pkcs7_message *pkcs7, struct key *trust_keyring),
+	(pkcs7, trust_keyring));
 
 /*
  * pkcs7_verify.c
  */
-extern int pkcs7_verify(struct pkcs7_message *pkcs7,
-			enum key_being_used_for usage);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_verify, int,
+	(struct pkcs7_message *pkcs7, enum key_being_used_for usage),
+	(pkcs7, usage));
 
-extern int pkcs7_supply_detached_data(struct pkcs7_message *pkcs7,
-				      const void *data, size_t datalen);
+DECLARE_CRYPTO_API(CONFIG_PKCS7_MESSAGE_PARSER, pkcs7_supply_detached_data, int,
+	(struct pkcs7_message *pkcs7, const void *data, size_t datalen),
+	(pkcs7, data, datalen));
 
 extern int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf,
 			    u32 *len, enum hash_algo *hash_algo);
-- 
2.47.3


