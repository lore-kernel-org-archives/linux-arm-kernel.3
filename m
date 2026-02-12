Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0B5EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpbhbPxg+gu3tJ1/w30KRtOqtaU7542YRWWeRnaMZHM=; b=Sf6HHr6AXYOEOMOdcuXD1H+N0h
	8Vcyhj1lKNIRVHnOMEI1TbBkBzgmLoL5j1o4GfuvutpVyOxQkTKBXZ7kcvKklf2tnhpMaWC4O00Kn
	N+S1aCk+ku/azVeYdY8UH+BK/62vkSppw3+LUmCEOSkTUHtEa5zwRNqlPxYVoVS/Mh4wIqv7ImQoe
	drulM6+D2P1grYJ/XMUmj+r+Cx8gaDbVmvcMintK7OMR+34GDph3eEu5NsE3SWhzN7LpJLbazuIZS
	T2uvcno1h9SsLJ3A/4MD7HK2fXJHw5GSz9bCq9becGwpUXvooo6a68vRnAX9svEeXqRz8ndsJO8Om
	+RnKm2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMmO-00000001N9f-0TEG;
	Thu, 12 Feb 2026 02:50:08 +0000
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.162.73.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMmJ-00000001N8B-2x4V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864603; x=1802400603;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rpbhbPxg+gu3tJ1/w30KRtOqtaU7542YRWWeRnaMZHM=;
  b=CrnqZqkLdihU8X6KlO56XPgMhyxdQDndBgs/LL5lyyTliM1YXPDkpc65
   h9Oul2X8IyJVzaChDEBl+eDR2x2VsidHRXFgyNLkt+7dxQI2Xrau4uWWF
   3LoQSrsy/4K14jfDN8EbZWN8CTDdBVPTniiXiSWCzSV46mpzsmXxBh+67
   zLeFN+CNuMDUAjyy4DCx9QApLmV52m97A4g93W7ntPW3o/iS+2m1WMzDY
   Ay6Xbig5FkveRcOJZDplR7PnCQ8genmFaXAYXfeUV2Zet2Uvl8VkBUyn2
   vcJabXp/rVrheCyprKmiJPYeuGF0cF6lN3sRegEgL8U7GpfEbL2byUM1Y
   A==;
X-CSE-ConnectionGUID: 5F/E3f8dQNiVGg2UzmuqAg==
X-CSE-MsgGUID: +mw6SbhvQLqVBffFubyB3A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721377"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:50:03 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:26164]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 4601986b-18d6-45ee-8270-76dba3472325; Thu, 12 Feb 2026 02:50:02 +0000 (UTC)
X-Farcaster-Flow-ID: 4601986b-18d6-45ee-8270-76dba3472325
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:01 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:01 +0000
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
Subject: [PATCH 010/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SIG2 crypto
Date: Thu, 12 Feb 2026 02:45:46 +0000
Message-ID: <20260212024725.11264-11-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D035UWB001.ant.amazon.com (10.13.138.33) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185003_804011_40038B32 
X-CRM114-Status: GOOD (  15.07  )
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
CONFIG_CRYPTO_SIG2-related crypto to convert them into pluggable
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
 crypto/Makefile               |  2 +-
 crypto/fips140/fips140-api.c  | 16 ++++++++++++++++
 include/crypto/internal/sig.h | 12 +++++-------
 include/crypto/sig.h          |  3 ++-
 4 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 7d55be467108..2e722f7961d4 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -34,7 +34,7 @@ crypto_hash-y += shash.o
 crypto-objs-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
 
 crypto-objs-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
-obj-$(CONFIG_CRYPTO_SIG2) += sig.o
+crypto-objs-$(CONFIG_CRYPTO_SIG2) += sig.o
 obj-$(CONFIG_CRYPTO_KPP2) += kpp.o
 obj-$(CONFIG_CRYPTO_HKDF) += hkdf.o
 
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 8d4d07060d86..c97806cfdd05 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -270,4 +270,20 @@ DEFINE_CRYPTO_API_STUB(akcipher_register_instance);
 DEFINE_CRYPTO_API_STUB(crypto_akcipher_sync_encrypt);
 DEFINE_CRYPTO_API_STUB(crypto_akcipher_sync_decrypt);
 
+#endif
+
+/*
+ * crypto/sig.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SIG2)
+
+#include <crypto/sig.h>
+#include <crypto/internal/sig.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_alloc_sig);
+DEFINE_CRYPTO_API_STUB(crypto_register_sig);
+DEFINE_CRYPTO_API_STUB(crypto_unregister_sig);
+DEFINE_CRYPTO_API_STUB(sig_register_instance);
+DEFINE_CRYPTO_API_STUB(crypto_grab_sig);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/internal/sig.h b/include/crypto/internal/sig.h
index b16648c1a986..51d3a617c00d 100644
--- a/include/crypto/internal/sig.h
+++ b/include/crypto/internal/sig.h
@@ -7,6 +7,7 @@
 #ifndef _CRYPTO_INTERNAL_SIG_H
 #define _CRYPTO_INTERNAL_SIG_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 #include <crypto/sig.h>
 
@@ -39,7 +40,7 @@ static inline void *crypto_sig_ctx(struct crypto_sig *tfm)
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_register_sig(struct sig_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, crypto_register_sig, int, (struct sig_alg *alg), (alg));
 
 /**
  * crypto_unregister_sig() -- Unregister public key signature algorithm
@@ -48,10 +49,9 @@ int crypto_register_sig(struct sig_alg *alg);
  *
  * @alg:	algorithm definition
  */
-void crypto_unregister_sig(struct sig_alg *alg);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, crypto_unregister_sig, void, (struct sig_alg *alg), (alg));
 
-int sig_register_instance(struct crypto_template *tmpl,
-			  struct sig_instance *inst);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, sig_register_instance, int, (struct crypto_template *tmpl, struct sig_instance *inst), (tmpl, inst));
 
 static inline struct sig_instance *sig_instance(struct crypto_instance *inst)
 {
@@ -74,9 +74,7 @@ static inline void *sig_instance_ctx(struct sig_instance *inst)
 	return crypto_instance_ctx(sig_crypto_instance(inst));
 }
 
-int crypto_grab_sig(struct crypto_sig_spawn *spawn,
-		    struct crypto_instance *inst,
-		    const char *name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, crypto_grab_sig, int, (struct crypto_sig_spawn *spawn, struct crypto_instance *inst, const char *name, u32 type, u32 mask), (spawn, inst, name, type, mask));
 
 static inline struct crypto_sig *crypto_spawn_sig(struct crypto_sig_spawn
 								   *spawn)
diff --git a/include/crypto/sig.h b/include/crypto/sig.h
index fa6dafafab3f..1b0595b3b245 100644
--- a/include/crypto/sig.h
+++ b/include/crypto/sig.h
@@ -7,6 +7,7 @@
 #ifndef _CRYPTO_SIG_H
 #define _CRYPTO_SIG_H
 
+#include <crypto/api.h>
 #include <linux/crypto.h>
 
 /**
@@ -91,7 +92,7 @@ struct sig_alg {
  * Return: allocated handle in case of success; IS_ERR() is true in case
  *	   of an error, PTR_ERR() returns the error code.
  */
-struct crypto_sig *crypto_alloc_sig(const char *alg_name, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SIG2, crypto_alloc_sig, struct crypto_sig *, (const char *alg_name, u32 type, u32 mask), (alg_name, type, mask));
 
 static inline struct crypto_tfm *crypto_sig_tfm(struct crypto_sig *tfm)
 {
-- 
2.47.3


