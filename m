Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFF9EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HBU0nwclYf+6ttesv1icUIPfdfgwyseOCXiMKyjg10=; b=qrocmnidnfXiXPp1EvnO9EHqnb
	0usHay42OyV0h0YlNaaXUrLdRGO/s33rRudk0jHdVdLpzSsuTDJOX7YmVGllw+/kjo8AXlCLlE6f3
	Oe3rcPmeWxpwAWQAHJjhss7HzHJZ+2W5qNHdfaM+IhcncmjQx3KKvvwnmg6rG8l7L5HvWOm0OLz8p
	8i3S1kvpDtPBvqJcGqmyby6bC8OjTaDdlDPFHIo99cJoXp5T/lCoXPSZ1sedVL3KDw9cz2p6fRVPc
	CW/fntfGWzCgvKjnJ6k9OR1NJhoTKf784pao7YnpGK3K8Zl2l6CrgeiI6X5BeUddEWHIqziVhIPV8
	/spnopTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMsr-00000001PmL-09rt;
	Thu, 12 Feb 2026 02:56:49 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMso-00000001Pku-0iHm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865006; x=1802401006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+HBU0nwclYf+6ttesv1icUIPfdfgwyseOCXiMKyjg10=;
  b=o3tPzfjGkQKenGPHnFOJk7QhxWwWupzLnmE4o01kG1N8VIsYgR/LHSya
   nsVcrss1GWlbw6V9f9V5i1OFu9vPM9KsyFLYO6cigyer9xn19mEL4vMth
   95QJufk0a9Et1RGJFQDrfcp2Uo9IOaGemzN6Q2+jdm0WiSj5GigU+lhoL
   35577mW4dgyPkNBpNSGXjWOsoiKdhFkdyv3Bl4/+yPCZTK7Uef+Rqpf0w
   reLYkrYZu7L4aQtiNSbvkc32mmt9wlXDRSOsdajM6Ltmydrxb3nYvxW7d
   TnoplC2FvS3FWCFQ3/I25bzxtBUA918t2/Sjkn2ZqP1ILnIMnefLU2+At
   w==;
X-CSE-ConnectionGUID: nJe8wMq6ST6bGVA1ZzwoLw==
X-CSE-MsgGUID: AF/jBofLR/KadomO1O/YPQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12744217"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:56:45 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:31792]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.42.95:2525] with esmtp (Farcaster)
 id 107c2b80-81e1-4181-b6c2-9e5ed19488ee; Thu, 12 Feb 2026 02:56:45 +0000 (UTC)
X-Farcaster-Flow-ID: 107c2b80-81e1-4181-b6c2-9e5ed19488ee
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:45 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:56:45 +0000
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
Subject: [PATCH 036/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ENGINE crypto
Date: Thu, 12 Feb 2026 02:46:12 +0000
Message-ID: <20260212024725.11264-37-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D036UWC002.ant.amazon.com (10.13.139.242) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185646_269546_1C7FD385 
X-CRM114-Status: GOOD (  11.38  )
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
CONFIG_CRYPTO_ENGINE-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |   2 +-
 crypto/fips140/fips140-api.c |  40 ++++++++++
 include/crypto/engine.h      | 140 +++++++++++++++++++++++------------
 3 files changed, 135 insertions(+), 47 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index d58b5e2b5b43..f2b9532a0320 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -8,7 +8,7 @@ CONTEXT_ANALYSIS := y
 crypto-objs-$(CONFIG_CRYPTO) += crypto.o
 crypto-y := api.o cipher.o
 
-obj-$(CONFIG_CRYPTO_ENGINE) += crypto_engine.o
+crypto-objs-$(CONFIG_CRYPTO_ENGINE) += crypto_engine.o
 obj-$(CONFIG_CRYPTO_FIPS) += fips.o
 
 crypto_algapi-$(CONFIG_PROC_FS) += proc.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index e679932ab552..05ada434d1ac 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -526,3 +526,43 @@ DEFINE_CRYPTO_API_STUB(pkcs7_verify);
 DEFINE_CRYPTO_API_STUB(pkcs7_supply_detached_data);
 
 #endif
+/*
+ * crypto/crypto_engine.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ENGINE)
+
+#include <crypto/engine.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_transfer_aead_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_transfer_akcipher_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_transfer_hash_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_transfer_kpp_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_transfer_skcipher_request_to_engine);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_aead_request);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_akcipher_request);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_hash_request);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_kpp_request);
+DEFINE_CRYPTO_API_STUB(crypto_finalize_skcipher_request);
+DEFINE_CRYPTO_API_STUB(crypto_engine_start);
+DEFINE_CRYPTO_API_STUB(crypto_engine_stop);
+DEFINE_CRYPTO_API_STUB(crypto_engine_alloc_init);
+DEFINE_CRYPTO_API_STUB(crypto_engine_alloc_init_and_set);
+DEFINE_CRYPTO_API_STUB(crypto_engine_exit);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_aead);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_aead);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_aeads);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_aeads);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_ahash);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_ahashes);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_ahashes);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_akcipher);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_akcipher);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_kpp);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_kpp);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_skcipher);
+DEFINE_CRYPTO_API_STUB(crypto_engine_register_skciphers);
+DEFINE_CRYPTO_API_STUB(crypto_engine_unregister_skciphers);
+
+#endif
\ No newline at end of file
diff --git a/include/crypto/engine.h b/include/crypto/engine.h
index 2e60344437da..82552e11880a 100644
--- a/include/crypto/engine.h
+++ b/include/crypto/engine.h
@@ -7,6 +7,7 @@
 #ifndef _CRYPTO_ENGINE_H
 #define _CRYPTO_ENGINE_H
 
+#include <crypto/api.h>
 #include <crypto/aead.h>
 #include <crypto/akcipher.h>
 #include <crypto/hash.h>
@@ -51,56 +52,103 @@ struct skcipher_engine_alg {
 	struct crypto_engine_op op;
 };
 
-int crypto_transfer_aead_request_to_engine(struct crypto_engine *engine,
-					   struct aead_request *req);
-int crypto_transfer_akcipher_request_to_engine(struct crypto_engine *engine,
-					       struct akcipher_request *req);
-int crypto_transfer_hash_request_to_engine(struct crypto_engine *engine,
-					       struct ahash_request *req);
-int crypto_transfer_kpp_request_to_engine(struct crypto_engine *engine,
-					  struct kpp_request *req);
-int crypto_transfer_skcipher_request_to_engine(struct crypto_engine *engine,
-					       struct skcipher_request *req);
-void crypto_finalize_aead_request(struct crypto_engine *engine,
-				  struct aead_request *req, int err);
-void crypto_finalize_akcipher_request(struct crypto_engine *engine,
-				      struct akcipher_request *req, int err);
-void crypto_finalize_hash_request(struct crypto_engine *engine,
-				  struct ahash_request *req, int err);
-void crypto_finalize_kpp_request(struct crypto_engine *engine,
-				 struct kpp_request *req, int err);
-void crypto_finalize_skcipher_request(struct crypto_engine *engine,
-				      struct skcipher_request *req, int err);
-int crypto_engine_start(struct crypto_engine *engine);
-int crypto_engine_stop(struct crypto_engine *engine);
-struct crypto_engine *crypto_engine_alloc_init(struct device *dev, bool rt);
-struct crypto_engine *crypto_engine_alloc_init_and_set(struct device *dev,
-						       bool retry_support,
-						       bool rt, int qlen);
-void crypto_engine_exit(struct crypto_engine *engine);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_aead_request_to_engine, int,
+	(struct crypto_engine *engine, struct aead_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_akcipher_request_to_engine, int,
+	(struct crypto_engine *engine, struct akcipher_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_hash_request_to_engine, int,
+	(struct crypto_engine *engine, struct ahash_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_kpp_request_to_engine, int,
+	(struct crypto_engine *engine, struct kpp_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_transfer_skcipher_request_to_engine, int,
+	(struct crypto_engine *engine, struct skcipher_request *req),
+	(engine, req));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_aead_request, void,
+	(struct crypto_engine *engine, struct aead_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_akcipher_request, void,
+	(struct crypto_engine *engine, struct akcipher_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_hash_request, void,
+	(struct crypto_engine *engine, struct ahash_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_kpp_request, void,
+	(struct crypto_engine *engine, struct kpp_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_finalize_skcipher_request, void,
+	(struct crypto_engine *engine, struct skcipher_request *req, int err),
+	(engine, req, err));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_start, int,
+	(struct crypto_engine *engine),
+	(engine));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_stop, int,
+	(struct crypto_engine *engine),
+	(engine));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_alloc_init, struct crypto_engine *,
+	(struct device *dev, bool rt),
+	(dev, rt));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_alloc_init_and_set, struct crypto_engine *,
+	(struct device *dev, bool retry_support, bool rt, int qlen),
+	(dev, retry_support, rt, qlen));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_exit, void,
+	(struct crypto_engine *engine),
+	(engine));
 
-int crypto_engine_register_aead(struct aead_engine_alg *alg);
-void crypto_engine_unregister_aead(struct aead_engine_alg *alg);
-int crypto_engine_register_aeads(struct aead_engine_alg *algs, int count);
-void crypto_engine_unregister_aeads(struct aead_engine_alg *algs, int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_aead, int,
+	(struct aead_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_aead, void,
+	(struct aead_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_aeads, int,
+	(struct aead_engine_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_aeads, void,
+	(struct aead_engine_alg *algs, int count),
+	(algs, count));
 
-int crypto_engine_register_ahash(struct ahash_engine_alg *alg);
-void crypto_engine_unregister_ahash(struct ahash_engine_alg *alg);
-int crypto_engine_register_ahashes(struct ahash_engine_alg *algs, int count);
-void crypto_engine_unregister_ahashes(struct ahash_engine_alg *algs,
-				      int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_ahash, int,
+	(struct ahash_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_ahash, void,
+	(struct ahash_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_ahashes, int,
+	(struct ahash_engine_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_ahashes, void,
+	(struct ahash_engine_alg *algs, int count),
+	(algs, count));
 
-int crypto_engine_register_akcipher(struct akcipher_engine_alg *alg);
-void crypto_engine_unregister_akcipher(struct akcipher_engine_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_akcipher, int,
+	(struct akcipher_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_akcipher, void,
+	(struct akcipher_engine_alg *alg),
+	(alg));
 
-int crypto_engine_register_kpp(struct kpp_engine_alg *alg);
-void crypto_engine_unregister_kpp(struct kpp_engine_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_kpp, int,
+	(struct kpp_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_kpp, void,
+	(struct kpp_engine_alg *alg),
+	(alg));
 
-int crypto_engine_register_skcipher(struct skcipher_engine_alg *alg);
-void crypto_engine_unregister_skcipher(struct skcipher_engine_alg *alg);
-int crypto_engine_register_skciphers(struct skcipher_engine_alg *algs,
-				     int count);
-void crypto_engine_unregister_skciphers(struct skcipher_engine_alg *algs,
-					int count);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_skcipher, int,
+	(struct skcipher_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_skcipher, void,
+	(struct skcipher_engine_alg *alg),
+	(alg));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_register_skciphers, int,
+	(struct skcipher_engine_alg *algs, int count),
+	(algs, count));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ENGINE, crypto_engine_unregister_skciphers, void,
+	(struct skcipher_engine_alg *algs, int count),
+	(algs, count));
 
 #endif /* _CRYPTO_ENGINE_H */
-- 
2.47.3


