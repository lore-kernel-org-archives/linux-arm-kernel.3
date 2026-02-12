Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901CBEDF023
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EsFF6qYmobupnEVilsxg26zjFMI/RVZBIunkgvjfv6w=; b=Yrn6U+rH9db/etYwTDgolELYmA
	dWs9EAq8VuzhSBwFYKaRZMJM2i8BCaUWzGLKFIYP+gwOmSPJe/7wS3XtC31EI/+4hZDvz4b4Fm09/
	W6lBwUX1E3iCj2pvMTlaKVRBAhDBZvVUWG5Mi2vrfk2kaIbrnR1PcXRz8i+g2k5LycVLvEf6p0lHR
	EV7RwxdfMeSQrr+2GgXk5l/GwOwGra3tM+Ihz/Fb7JcSZhZWKm7QSmHhYPo+9uALzb48sCoamaOjn
	zxfRcZv4a0esxCSt6MzBRd95B7oxHDGLkBKipJLM3qopqxGl+VTRZyVHivCCFUJqGQAUdU2M9Jr/1
	eb9wZoRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN8w-00000001WVa-23XL;
	Thu, 12 Feb 2026 03:13:26 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN8t-00000001WU8-2rSE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:13:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866003; x=1802402003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EsFF6qYmobupnEVilsxg26zjFMI/RVZBIunkgvjfv6w=;
  b=A5ReQmehIOxaHMZ+ZWAuvzgC5F6sSrZY09XsLzccA79Cm83BUphJMpHr
   aDuVxuqM7476V9on7EoVqmKvG8exwWDIXNbWMI3edYhHVMP+eg0FSmo8V
   IuAAqspU/ZQpR5Whc3Rc8ht8p6iItgshRGpZ2uMnMLMzuGI6piKTSLjNl
   NWHNtwRA5ZDa+1e54wngs3tYLdurWdQQ7sQpqpNsIhTfJ6xqRNksWU+LE
   EzX9kpNgiehrx3912peigwUzCFqqpUkQQ4IKf3TWAqEBwBdzWAQWKXHwD
   4Do8TFwOVN1iRNoyLi/YctmFsjfOgXaiKb6q7h21k9ieBCx2VIBmK1jmL
   Q==;
X-CSE-ConnectionGUID: 3p5C+m1cTcawZj/T/aJh9g==
X-CSE-MsgGUID: H+Is+MO7RJenMAiG6MNy7A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918481"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:13:23 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:28955]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id b7fd1c74-e6bb-4b5b-bae5-f668a08df5e2; Thu, 12 Feb 2026 03:13:22 +0000 (UTC)
X-Farcaster-Flow-ID: b7fd1c74-e6bb-4b5b-bae5-f668a08df5e2
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:19 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:13:19 +0000
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
Subject: [PATCH 100/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_KRB5 crypto
Date: Thu, 12 Feb 2026 02:47:16 +0000
Message-ID: <20260212024725.11264-101-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWC001.ant.amazon.com (10.13.139.223) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191323_768739_EE530119 
X-CRM114-Status: GOOD (  13.84  )
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
CONFIG_CRYPTO_KRB5-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/fips140-api.c | 27 +++++++++++++
 crypto/krb5/Makefile         |  2 +-
 crypto/krb5/krb5_api.c       |  4 +-
 include/crypto/krb5.h        | 78 ++++++++++++++++--------------------
 4 files changed, 65 insertions(+), 46 deletions(-)

diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 0ed89baa3865..3e4203dd2aeb 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -864,6 +864,33 @@ DEFINE_CRYPTO_API_STUB(async_raid6_datap_recov);
 DEFINE_CRYPTO_API_STUB(crypto_kdf108_ctr_generate);
 DEFINE_CRYPTO_API_STUB(crypto_kdf108_setkey);
 
+#endif
+/*
+ * crypto/krb5/krb5.o
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_KRB5)
+
+#include <crypto/krb5.h>
+
+/*
+ * crypto/krb5/krb5_kdf.c
+ */
+DEFINE_CRYPTO_API_STUB(crypto_krb5_calc_PRFplus);
+
+/*
+ * crypto/krb5/krb5_api.c
+ */
+DEFINE_CRYPTO_API_STUB(crypto_krb5_find_enctype);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_how_much_buffer);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_how_much_data);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_where_is_the_data);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_prepare_encryption);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_prepare_checksum);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_encrypt);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_decrypt);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_get_mic);
+DEFINE_CRYPTO_API_STUB(crypto_krb5_verify_mic);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/crypto/krb5/Makefile b/crypto/krb5/Makefile
index d38890c0b247..513759fc8dcc 100644
--- a/crypto/krb5/Makefile
+++ b/crypto/krb5/Makefile
@@ -15,4 +15,4 @@ krb5-$(CONFIG_CRYPTO_KRB5_SELFTESTS) += \
 	selftest.o \
 	selftest_data.o
 
-obj-$(CONFIG_CRYPTO_KRB5) += krb5.o
+crypto-objs-$(CONFIG_CRYPTO_KRB5) += krb5.o
diff --git a/crypto/krb5/krb5_api.c b/crypto/krb5/krb5_api.c
index 23026d4206c8..5725ed1cb4b7 100644
--- a/crypto/krb5/krb5_api.c
+++ b/crypto/krb5/krb5_api.c
@@ -444,9 +444,9 @@ static int __init crypto_krb5_init(void)
 {
 	return krb5_selftest();
 }
-module_init(crypto_krb5_init);
+crypto_module_init(crypto_krb5_init);
 
 static void __exit crypto_krb5_exit(void)
 {
 }
-module_exit(crypto_krb5_exit);
+crypto_module_exit(crypto_krb5_exit);
diff --git a/include/crypto/krb5.h b/include/crypto/krb5.h
index 71dd38f59be1..e2de2d0391a1 100644
--- a/include/crypto/krb5.h
+++ b/include/crypto/krb5.h
@@ -8,6 +8,8 @@
 #ifndef _CRYPTO_KRB5_H
 #define _CRYPTO_KRB5_H
 
+#include <crypto/api.h>
+
 #include <linux/crypto.h>
 #include <crypto/aead.h>
 #include <crypto/hash.h>
@@ -114,52 +116,42 @@ struct krb5_enctype {
 /*
  * krb5_api.c
  */
-const struct krb5_enctype *crypto_krb5_find_enctype(u32 enctype);
-size_t crypto_krb5_how_much_buffer(const struct krb5_enctype *krb5,
-				   enum krb5_crypto_mode mode,
-				   size_t data_size, size_t *_offset);
-size_t crypto_krb5_how_much_data(const struct krb5_enctype *krb5,
-				 enum krb5_crypto_mode mode,
-				 size_t *_buffer_size, size_t *_offset);
-void crypto_krb5_where_is_the_data(const struct krb5_enctype *krb5,
-				   enum krb5_crypto_mode mode,
-				   size_t *_offset, size_t *_len);
-struct crypto_aead *crypto_krb5_prepare_encryption(const struct krb5_enctype *krb5,
-						   const struct krb5_buffer *TK,
-						   u32 usage, gfp_t gfp);
-struct crypto_shash *crypto_krb5_prepare_checksum(const struct krb5_enctype *krb5,
-						  const struct krb5_buffer *TK,
-						  u32 usage, gfp_t gfp);
-ssize_t crypto_krb5_encrypt(const struct krb5_enctype *krb5,
-			    struct crypto_aead *aead,
-			    struct scatterlist *sg, unsigned int nr_sg,
-			    size_t sg_len,
-			    size_t data_offset, size_t data_len,
-			    bool preconfounded);
-int crypto_krb5_decrypt(const struct krb5_enctype *krb5,
-			struct crypto_aead *aead,
-			struct scatterlist *sg, unsigned int nr_sg,
-			size_t *_offset, size_t *_len);
-ssize_t crypto_krb5_get_mic(const struct krb5_enctype *krb5,
-			    struct crypto_shash *shash,
-			    const struct krb5_buffer *metadata,
-			    struct scatterlist *sg, unsigned int nr_sg,
-			    size_t sg_len,
-			    size_t data_offset, size_t data_len);
-int crypto_krb5_verify_mic(const struct krb5_enctype *krb5,
-			   struct crypto_shash *shash,
-			   const struct krb5_buffer *metadata,
-			   struct scatterlist *sg, unsigned int nr_sg,
-			   size_t *_offset, size_t *_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_find_enctype, const struct krb5_enctype *,
+	(u32 enctype),
+	(enctype));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_how_much_buffer, size_t,
+	(const struct krb5_enctype *krb5, enum krb5_crypto_mode mode, size_t data_size, size_t *_offset),
+	(krb5, mode, data_size, _offset));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_how_much_data, size_t,
+	(const struct krb5_enctype *krb5, enum krb5_crypto_mode mode, size_t *_buffer_size, size_t *_offset),
+	(krb5, mode, _buffer_size, _offset));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_where_is_the_data, void,
+	(const struct krb5_enctype *krb5, enum krb5_crypto_mode mode, size_t *_offset, size_t *_len),
+	(krb5, mode, _offset, _len));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_prepare_encryption, struct crypto_aead *,
+	(const struct krb5_enctype *krb5, const struct krb5_buffer *TK, u32 usage, gfp_t gfp),
+	(krb5, TK, usage, gfp));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_prepare_checksum, struct crypto_shash *,
+	(const struct krb5_enctype *krb5, const struct krb5_buffer *TK, u32 usage, gfp_t gfp),
+	(krb5, TK, usage, gfp));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_encrypt, ssize_t,
+	(const struct krb5_enctype *krb5, struct crypto_aead *aead, struct scatterlist *sg, unsigned int nr_sg, size_t sg_len, size_t data_offset, size_t data_len, bool preconfounded),
+	(krb5, aead, sg, nr_sg, sg_len, data_offset, data_len, preconfounded));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_decrypt, int,
+	(const struct krb5_enctype *krb5, struct crypto_aead *aead, struct scatterlist *sg, unsigned int nr_sg, size_t *_offset, size_t *_len),
+	(krb5, aead, sg, nr_sg, _offset, _len));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_get_mic, ssize_t,
+	(const struct krb5_enctype *krb5, struct crypto_shash *shash, const struct krb5_buffer *metadata, struct scatterlist *sg, unsigned int nr_sg, size_t sg_len, size_t data_offset, size_t data_len),
+	(krb5, shash, metadata, sg, nr_sg, sg_len, data_offset, data_len));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_verify_mic, int,
+	(const struct krb5_enctype *krb5, struct crypto_shash *shash, const struct krb5_buffer *metadata, struct scatterlist *sg, unsigned int nr_sg, size_t *_offset, size_t *_len),
+	(krb5, shash, metadata, sg, nr_sg, _offset, _len));
 
 /*
  * krb5_kdf.c
  */
-int crypto_krb5_calc_PRFplus(const struct krb5_enctype *krb5,
-			     const struct krb5_buffer *K,
-			     unsigned int L,
-			     const struct krb5_buffer *S,
-			     struct krb5_buffer *result,
-			     gfp_t gfp);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5, crypto_krb5_calc_PRFplus, int,
+	(const struct krb5_enctype *krb5, const struct krb5_buffer *K, unsigned int L, const struct krb5_buffer *S, struct krb5_buffer *result, gfp_t gfp),
+	(krb5, K, L, S, result, gfp));
 
 #endif /* _CRYPTO_KRB5_H */
-- 
2.47.3


