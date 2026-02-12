Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C60EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V9uqEHT0wjXC+bQxH8T137ezoZZBdhvIZ8Goy0vY9qE=; b=Th2fnkqdftZdoAbUmIaPgmJcbu
	ytA2OFHq9sG0txj3IbOSi4cibrcZzdU++tn0awTjzKGijJZdAvmzQHTGiXOgEm6aGIZDtR1InTkh8
	Fv33F8MbFb3scDD/W8ydZ7SuxqMHcOJah9LLq1Sy4k8EoorCjBpCEy7KbtgGmfNqRxTtX0oHGAnYg
	PhP8n9ODOsnOv6V8geU+KxYi3rglgOdjtPIs8AtBOJzjmrDXodimxbtKvL3LFYtjNEsRRkMovDx4L
	22Br0K1cM1e72EgufY5DyQVectDXBh0rGrakOk2x262uzJLqoktpwrHAnoqw1EE90FHmkQye1+fJm
	M64BFbmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMsT-00000001PcK-1cOM;
	Thu, 12 Feb 2026 02:56:25 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMsJ-00000001PZ2-0Li4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864975; x=1802400975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V9uqEHT0wjXC+bQxH8T137ezoZZBdhvIZ8Goy0vY9qE=;
  b=MOGgyZY8LyRPgzxu9iHAyHM0LHMUGTm0C2Vt0ilV0P5c1+pdaGO8g4kw
   1Sp4bKYcLW1UqTi3zMhVjqUpmp8hsw3KyfLm+JMVWhoDYZFXpVVKogZsO
   HDTEcctnB5M0wgJ7mxaam9WXqLA6hWCTbYJRy8a8dUAQ+eUUIgGrRF7gP
   /KLgkhP6uh0lcwkUORQYDrST8x9CbspOJSPUt6ZwWqfQTac7y7ZgNyR3P
   9Xr9Ha2042qGSXIO7ViuEvsNXHz757BtKrBMKp+HSHtOVmwnUs0rTx291
   x/Ly66AVJEQZXQA3IGsMSTfVZ+9/dZo27rDe86bq0foeVcKFEu7DBzEYY
   g==;
X-CSE-ConnectionGUID: nbeHQWtLTkSpS7JV7CbRJQ==
X-CSE-MsgGUID: 6Ax4YZHcQQuY9DMvkNcNYw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919599"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:56:14 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:7172]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id a06caf46-592c-4caa-8698-c9bd61ee5fa9; Thu, 12 Feb 2026 02:56:14 +0000 (UTC)
X-Farcaster-Flow-ID: a06caf46-592c-4caa-8698-c9bd61ee5fa9
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:14 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:14 +0000
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
Subject: [PATCH 034/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_X509_CERTIFICATE_PARSER crypto
Date: Thu, 12 Feb 2026 02:46:10 +0000
Message-ID: <20260212024725.11264-35-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D035UWA004.ant.amazon.com (10.13.139.109) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185620_358408_CD9DFE6A 
X-CRM114-Status: GOOD (  16.91  )
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
CONFIG_X509_CERTIFICATE_PARSER-related crypto to convert them into
pluggable interface.

This patch is partially based on work by Vegard Nossum, with
modifications. Unlike the original, we do not include
DEFINE_CRYPTO_API since only one copy of the crypto symbols is
kept, either in the crypto module or in the main kernel, and we ensure
such wrapper do not have impact on crypto already chosen built as
module.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/asymmetric_keys/Makefile          |  2 +-
 crypto/asymmetric_keys/x509_parser.h     | 15 ++++++++++-----
 crypto/asymmetric_keys/x509_public_key.c |  4 ++--
 crypto/fips140/fips140-api.c             | 22 ++++++++++++++++++++++
 include/keys/asymmetric-type.h           |  5 +++--
 5 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index 4f29401016f1..b42c48d973d3 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -15,7 +15,7 @@ crypto-objs-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
 #
 # X.509 Certificate handling
 #
-obj-$(CONFIG_X509_CERTIFICATE_PARSER) += x509_key_parser.o
+crypto-objs-$(CONFIG_X509_CERTIFICATE_PARSER) += x509_key_parser.o
 x509_key_parser-y := \
 	x509.asn1.o \
 	x509_akid.asn1.o \
diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index b7aeebdddb36..53bfc5f807bb 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -5,6 +5,7 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
+#include <crypto/api.h>
 #include <linux/cleanup.h>
 #include <linux/time.h>
 #include <crypto/public_key.h>
@@ -46,13 +47,17 @@ struct x509_certificate {
 /*
  * x509_cert_parser.c
  */
-extern void x509_free_certificate(struct x509_certificate *cert);
+DECLARE_CRYPTO_API(CONFIG_X509_CERTIFICATE_PARSER, x509_free_certificate, void,
+	(struct x509_certificate *cert),
+	(cert));
 DEFINE_FREE(x509_free_certificate, struct x509_certificate *,
 	    if (!IS_ERR(_T)) x509_free_certificate(_T))
-extern struct x509_certificate *x509_cert_parse(const void *data, size_t datalen);
-extern int x509_decode_time(time64_t *_t,  size_t hdrlen,
-			    unsigned char tag,
-			    const unsigned char *value, size_t vlen);
+DECLARE_CRYPTO_API(CONFIG_X509_CERTIFICATE_PARSER, x509_cert_parse, struct x509_certificate *,
+	(const void *data, size_t datalen),
+	(data, datalen));
+DECLARE_CRYPTO_API(CONFIG_X509_CERTIFICATE_PARSER, x509_decode_time, int,
+	(time64_t *_t, size_t hdrlen, unsigned char tag, const unsigned char *value, size_t vlen),
+	(_t, hdrlen, tag, value, vlen));
 
 /*
  * x509_public_key.c
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 27b4fea37845..e840bd8019be 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -258,8 +258,8 @@ static void __exit x509_key_exit(void)
 	unregister_asymmetric_key_parser(&x509_key_parser);
 }
 
-module_init(x509_key_init);
-module_exit(x509_key_exit);
+crypto_module_init(x509_key_init);
+crypto_module_exit(x509_key_exit);
 
 MODULE_DESCRIPTION("X.509 certificate parser");
 MODULE_AUTHOR("Red Hat, Inc.");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 6dce18f81e91..d08a001bb0db 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -471,3 +471,25 @@ DEFINE_CRYPTO_API_STUB(public_key_verify_signature);
 DEFINE_CRYPTO_VAR_STUB(public_key_subtype);
 
 #endif
+/*
+ * crypto/asymmetric_keys/x509_cert_parser.c
+ */
+#if IS_BUILTIN(CONFIG_X509_CERTIFICATE_PARSER)
+
+#include <crypto/asymmetric_keys/x509_parser.h>
+
+DEFINE_CRYPTO_API_STUB(x509_free_certificate);
+DEFINE_CRYPTO_API_STUB(x509_cert_parse);
+DEFINE_CRYPTO_API_STUB(x509_decode_time);
+
+#endif
+/*
+ * crypto/asymmetric_keys/x509_loader.c
+ */
+#if IS_BUILTIN(CONFIG_X509_CERTIFICATE_PARSER)
+
+#include <keys/asymmetric-type.h>
+
+DEFINE_CRYPTO_API_STUB(x509_load_certificate_list);
+
+#endif
diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 96e718a550a3..dd5b4d9980c1 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -88,8 +88,9 @@ DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, find_asymmetric_key, struct key *
 	(struct key *keyring, const struct asymmetric_key_id *id_0, const struct asymmetric_key_id *id_1, const struct asymmetric_key_id *id_2, bool partial),
 	(keyring, id_0, id_1, id_2, partial));
 
-int x509_load_certificate_list(const u8 cert_list[], const unsigned long list_size,
-			       const struct key *keyring);
+DECLARE_CRYPTO_API(CONFIG_X509_CERTIFICATE_PARSER, x509_load_certificate_list, int,
+	(const u8 cert_list[], const unsigned long list_size, const struct key *keyring),
+	(cert_list, list_size, keyring));
 
 /*
  * The payload is at the discretion of the subtype.
-- 
2.47.3


