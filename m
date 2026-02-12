Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E5EEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llTiMmMlJ0GyWnV3th6rLzU3WngxBPXPgfgrgxMgmTg=; b=pqFYhl7nUB+aEplw+9kS6hQp2M
	s0+mn17JLtTbqo5Zv6CF/wzkoRQU0GqZTV7nO0Csah3wfQCiE7+EG69ZXLCruq5FZEiGgZOqJH2SU
	9zhPyz5NdTxXyklumMOyuilT+zYUm3wYh0m+79t0zqYSuTY/G5Dba7BLThosOxpEFj6kmvaMfCMSL
	BCMeM7lTYrcB5h9+lwUYl7ASGNW84ylov9Id0GcIJ5YjJz6BnkBKLKfz/cHiPEXSwFc8qErWJCGvQ
	0r5pg8obe5CkZvzJeHp8bh0VWWiTu1BlMJv2LiZtR3lFHVoTtMB2Sjod6FJIIdje/in5Kh7s0L4OE
	Lx4kidDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMn5-00000001NQd-3Lph;
	Thu, 12 Feb 2026 02:50:51 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMn4-00000001NPq-0NO3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864650; x=1802400650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=llTiMmMlJ0GyWnV3th6rLzU3WngxBPXPgfgrgxMgmTg=;
  b=rmaqzEie1UVPJQozKgSdIYjokF7qEAnYKHlIEuNdFRV8Qu+GNJ++rj5s
   wlmDOnDTdiT54c974yI7jzegNGnuB9ahxcfTlin+d8oNrmykaq4rESZ4O
   +057oQE8beoI1E/Oy7sBaoq9sV8Mfts8BPguOT8jL3yFNVXi8fd48wcYh
   1z/JnQ1sjmuQh/hGoP6gHlcQB1aLGDQXYsixQrt8iO0VX88MJcyD8RV5+
   8WMMEZ0Q6VFeJX65Nqito9wVxS2MONfFfIc74E3vWEiK/o2T3AWdUuYki
   ql+382H7H3kDnoimXx9AJVps91QmvBfRL2x0lzPt53t37Rr3aDN8VBEW9
   g==;
X-CSE-ConnectionGUID: jyXHOONbTWimwGXNQkrVvQ==
X-CSE-MsgGUID: /r7k9pssTziM9d1HoJ102Q==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918662"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:50:49 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:26998]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.85:2525] with esmtp (Farcaster)
 id 5ca45784-e325-40bc-9f35-c400a4095129; Thu, 12 Feb 2026 02:50:49 +0000 (UTC)
X-Farcaster-Flow-ID: 5ca45784-e325-40bc-9f35-c400a4095129
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:48 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:48 +0000
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
Subject: [PATCH 013/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ACOMP2 crypto
Date: Thu, 12 Feb 2026 02:45:49 +0000
Message-ID: <20260212024725.11264-14-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D045UWC002.ant.amazon.com (10.13.139.230) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185050_182944_4391340F 
X-CRM114-Status: GOOD (  12.63  )
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
CONFIG_CRYPTO_ACOMP2-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile                     |  2 +-
 crypto/fips140/fips140-api.c        | 42 +++++++++++++++++++++++++++++
 include/crypto/acompress.h          | 14 +++++-----
 include/crypto/internal/acompress.h | 27 +++++++++----------
 include/crypto/internal/scompress.h |  9 ++++---
 5 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 3e12b556bfa7..e940f9ed357d 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -66,7 +66,7 @@ obj-$(CONFIG_CRYPTO_MLDSA) += mldsa.o
 
 crypto_acompress-y := acompress.o
 crypto_acompress-y += scompress.o
-obj-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
+crypto-objs-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
 
 cryptomgr-y := algboss.o testmgr.o
 
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index d10eded6b61e..9a9c66cc1d90 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -315,4 +315,46 @@ DEFINE_CRYPTO_API_STUB(kpp_register_instance);
 DEFINE_CRYPTO_API_STUB(rsa_parse_pub_key);
 DEFINE_CRYPTO_API_STUB(rsa_parse_priv_key);
 
+#endif
+
+/*
+ * crypto/acompress.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ACOMP2)
+
+#include <crypto/acompress.h>
+#include <crypto/internal/acompress.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_alloc_acomp);
+DEFINE_CRYPTO_API_STUB(crypto_alloc_acomp_node);
+DEFINE_CRYPTO_API_STUB(crypto_acomp_compress);
+DEFINE_CRYPTO_API_STUB(crypto_acomp_decompress);
+DEFINE_CRYPTO_API_STUB(crypto_register_acomp);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_acomp);
+DEFINE_CRYPTO_API_STUB(crypto_register_acomps);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_acomps);
+DEFINE_CRYPTO_API_STUB(crypto_acomp_free_streams);
+DEFINE_CRYPTO_API_STUB(crypto_acomp_alloc_streams);
+DEFINE_CRYPTO_API_STUB(_crypto_acomp_lock_stream_bh);
+DEFINE_CRYPTO_API_STUB(acomp_walk_done_src);
+DEFINE_CRYPTO_API_STUB(acomp_walk_done_dst);
+DEFINE_CRYPTO_API_STUB(acomp_walk_next_src);
+DEFINE_CRYPTO_API_STUB(acomp_walk_next_dst);
+DEFINE_CRYPTO_API_STUB(acomp_walk_virt);
+DEFINE_CRYPTO_API_STUB(acomp_request_clone);
+
+#endif
+
+/*
+ * crypto/scompress.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ACOMP2)
+
+#include <crypto/internal/scompress.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_register_scomp);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_scomp);
+DEFINE_CRYPTO_API_STUB(crypto_register_scomps);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_scomps);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/acompress.h b/include/crypto/acompress.h
index 9eacb9fa375d..54545cd3f2f8 100644
--- a/include/crypto/acompress.h
+++ b/include/crypto/acompress.h
@@ -9,6 +9,7 @@
 #ifndef _CRYPTO_ACOMP_H
 #define _CRYPTO_ACOMP_H
 
+#include <crypto/api.h>
 #include <linux/atomic.h>
 #include <linux/args.h>
 #include <linux/compiler_types.h>
@@ -143,8 +144,7 @@ struct comp_alg_common COMP_ALG_COMMON;
  * Return:	allocated handle in case of success; IS_ERR() is true in case
  *		of an error, PTR_ERR() returns the error code.
  */
-struct crypto_acomp *crypto_alloc_acomp(const char *alg_name, u32 type,
-					u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_alloc_acomp, struct crypto_acomp *, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 /**
  * crypto_alloc_acomp_node() -- allocate ACOMPRESS tfm handle with desired NUMA node
  * @alg_name:	is the cra_name / name or cra_driver_name / driver name of the
@@ -161,8 +161,7 @@ struct crypto_acomp *crypto_alloc_acomp(const char *alg_name, u32 type,
  * Return:	allocated handle in case of success; IS_ERR() is true in case
  *		of an error, PTR_ERR() returns the error code.
  */
-struct crypto_acomp *crypto_alloc_acomp_node(const char *alg_name, u32 type,
-					u32 mask, int node);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_alloc_acomp_node, struct crypto_acomp *, (const char *alg_name, u32 type, u32 mask, int node), (alg_name, type, mask, node));
 
 static inline struct crypto_tfm *crypto_acomp_tfm(struct crypto_acomp *tfm)
 {
@@ -529,7 +528,7 @@ static inline void acomp_request_set_dst_folio(struct acomp_req *req,
  *
  * Return:	zero on success; error code in case of error
  */
-int crypto_acomp_compress(struct acomp_req *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_acomp_compress, int, (struct acomp_req *req), (req));
 
 /**
  * crypto_acomp_decompress() -- Invoke asynchronous decompress operation
@@ -540,7 +539,7 @@ int crypto_acomp_compress(struct acomp_req *req);
  *
  * Return:	zero on success; error code in case of error
  */
-int crypto_acomp_decompress(struct acomp_req *req);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_acomp_decompress, int, (struct acomp_req *req), (req));
 
 static inline struct acomp_req *acomp_request_on_stack_init(
 	char *buf, struct crypto_acomp *tfm)
@@ -551,7 +550,6 @@ static inline struct acomp_req *acomp_request_on_stack_init(
 	return req;
 }
 
-struct acomp_req *acomp_request_clone(struct acomp_req *req,
-				      size_t total, gfp_t gfp);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_request_clone, struct acomp_req *, (struct acomp_req *req, size_t total, gfp_t gfp), (req, total, gfp));
 
 #endif
diff --git a/include/crypto/internal/acompress.h b/include/crypto/internal/acompress.h
index 9a3f28baa804..20a9c4e96e0c 100644
--- a/include/crypto/internal/acompress.h
+++ b/include/crypto/internal/acompress.h
@@ -9,6 +9,7 @@
 #ifndef _CRYPTO_ACOMP_INT_H
 #define _CRYPTO_ACOMP_INT_H
 
+#include <crypto/api.h>
 #include <crypto/acompress.h>
 #include <crypto/algapi.h>
 #include <crypto/scatterwalk.h>
@@ -130,7 +131,7 @@ static inline void acomp_request_complete(struct acomp_req *req,
  *
  * Return:	zero on success; error code in case of error
  */
-int crypto_register_acomp(struct acomp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_register_acomp, int, (struct acomp_alg *alg), (alg));
 
 /**
  * crypto_unregister_acomp() -- Unregister asynchronous compression algorithm
@@ -140,10 +141,10 @@ int crypto_register_acomp(struct acomp_alg *alg);
  *
  * @alg:	algorithm definition
  */
-void crypto_unregister_acomp(struct acomp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_unregister_acomp, void, (struct acomp_alg *alg), (alg));
 
-int crypto_register_acomps(struct acomp_alg *algs, int count);
-void crypto_unregister_acomps(struct acomp_alg *algs, int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_register_acomps, int, (struct acomp_alg *algs, int count), (algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_unregister_acomps, void, (struct acomp_alg *algs, int count), (algs, count));
 
 static inline bool acomp_request_issg(struct acomp_req *req)
 {
@@ -188,12 +189,11 @@ static inline bool crypto_acomp_req_virt(struct crypto_acomp *tfm)
 	return crypto_tfm_req_virt(&tfm->base);
 }
 
-void crypto_acomp_free_streams(struct crypto_acomp_streams *s);
-int crypto_acomp_alloc_streams(struct crypto_acomp_streams *s);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_acomp_free_streams, void, (struct crypto_acomp_streams *s), (s));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_acomp_alloc_streams, int, (struct crypto_acomp_streams *s), (s));
 
 #define crypto_acomp_lock_stream_bh(...) __acquire_ret(_crypto_acomp_lock_stream_bh(__VA_ARGS__), &__ret->lock);
-struct crypto_acomp_stream *_crypto_acomp_lock_stream_bh(
-		struct crypto_acomp_streams *s) __acquires_ret;
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, _crypto_acomp_lock_stream_bh, struct crypto_acomp_stream *, (struct crypto_acomp_streams *s), (s)) __acquires_ret;
 
 static inline void crypto_acomp_unlock_stream_bh(
 	struct crypto_acomp_stream *stream) __releases(&stream->lock)
@@ -201,12 +201,11 @@ static inline void crypto_acomp_unlock_stream_bh(
 	spin_unlock_bh(&stream->lock);
 }
 
-void acomp_walk_done_src(struct acomp_walk *walk, int used);
-void acomp_walk_done_dst(struct acomp_walk *walk, int used);
-int acomp_walk_next_src(struct acomp_walk *walk);
-int acomp_walk_next_dst(struct acomp_walk *walk);
-int acomp_walk_virt(struct acomp_walk *__restrict walk,
-		    struct acomp_req *__restrict req, bool atomic);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_done_src, void, (struct acomp_walk *walk, int used), (walk, used));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_done_dst, void, (struct acomp_walk *walk, int used), (walk, used));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_next_src, int, (struct acomp_walk *walk), (walk));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_next_dst, int, (struct acomp_walk *walk), (walk));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, acomp_walk_virt, int, (struct acomp_walk *walk, struct acomp_req *req, bool atomic), (walk, req, atomic));
 
 static inline bool acomp_walk_more_src(const struct acomp_walk *walk, int cur)
 {
diff --git a/include/crypto/internal/scompress.h b/include/crypto/internal/scompress.h
index 6a2c5f2e90f9..02226b300ea8 100644
--- a/include/crypto/internal/scompress.h
+++ b/include/crypto/internal/scompress.h
@@ -9,6 +9,7 @@
 #ifndef _CRYPTO_SCOMP_INT_H
 #define _CRYPTO_SCOMP_INT_H
 
+#include <crypto/api.h>
 #include <crypto/internal/acompress.h>
 
 struct crypto_scomp {
@@ -90,7 +91,7 @@ static inline int crypto_scomp_decompress(struct crypto_scomp *tfm,
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_register_scomp(struct scomp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_register_scomp, int, (struct scomp_alg *alg), (alg));
 
 /**
  * crypto_unregister_scomp() -- Unregister synchronous compression algorithm
@@ -100,9 +101,9 @@ int crypto_register_scomp(struct scomp_alg *alg);
  *
  * @alg:	algorithm definition
  */
-void crypto_unregister_scomp(struct scomp_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_unregister_scomp, void, (struct scomp_alg *alg), (alg));
 
-int crypto_register_scomps(struct scomp_alg *algs, int count);
-void crypto_unregister_scomps(struct scomp_alg *algs, int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_register_scomps, int, (struct scomp_alg *algs, int count), (algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ACOMP2, crypto_unregister_scomps, void, (struct scomp_alg *algs, int count), (algs, count));
 
 #endif
-- 
2.47.3


