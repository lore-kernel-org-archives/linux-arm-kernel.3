Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C14EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2QGhhwgO9GU4JuAgmE7Qr14C7r7lixkHMTZvpvG73M=; b=4FbuI8E9edabuY4N0+asArPPR3
	NHgJVZzkP/rEx6EZ6JKMRA68qzVOaaaFh1MiGCLyyHLdexCFQUavaCfNSmAVC2YQtbTKxgwl31/Ip
	JW90T5nR0PqB2nW0j156MdVK4RLYSDogUKRJSzZ3haN1zmeT9E2TWyff5JpLe8kiyjhUWzm6znGsL
	4FKd4jNv7bnZIyQ3ONt8bFUPTklzAGQNasNd6Wa3s971N/a7lVAtTH7/qI4iwwy2i5thZIkuxDVpo
	CzScaS1gsPoZo792VYCCZuOhXVbg+albKLrlp+5Mvw7d1PhD2jEOOKvDE9VN0L1b1c92bzo8BIyHB
	l8giRA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMmr-00000001NKH-1doV;
	Thu, 12 Feb 2026 02:50:37 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMmo-00000001NIq-0GxR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864634; x=1802400634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B2QGhhwgO9GU4JuAgmE7Qr14C7r7lixkHMTZvpvG73M=;
  b=W6ZStRRV382X2QBhFYqs0nR6etWGS9fkVKNFJDevSIKfrfS/0edg7GOk
   imeJ7pExEUBa/+qClAT9yOw49Nyu97ggsYoPfpHoKWkvAw9Nls1+lsvXL
   k7ECB1DGSGA8u/K+YbcEWxi7gXMZ04uKuY3uYKlWYPWUCK9HdyOlfLYrs
   WswSle7jPMG1rP3S/1NWA/RcFUfAR+bkjzux7h+N4MClquhfcEI310rdB
   ZGQj2jqbrJtDDhuUKfRor7Q81dil3dy3bPhQCrGyEHmM0HfIhy49bUl19
   gC7NqF8YPuROU/zQ7CGOaDCJ18GuZa8C6YVbny4j9fS+NOaarXW4lojUy
   Q==;
X-CSE-ConnectionGUID: C46VZ+2USWCaG1DS5W6CjA==
X-CSE-MsgGUID: pfk2Fw++Q1eex6s2lT6Dxg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12917593"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:50:33 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:29396]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id 24755a17-82cc-4341-9c1e-604ecd8bb02b; Thu, 12 Feb 2026 02:50:33 +0000 (UTC)
X-Farcaster-Flow-ID: 24755a17-82cc-4341-9c1e-604ecd8bb02b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:33 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:50:32 +0000
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
Subject: [PATCH 012/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_RSA crypto
Date: Thu, 12 Feb 2026 02:45:48 +0000
Message-ID: <20260212024725.11264-13-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWA002.ant.amazon.com (10.13.139.53) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185035_288510_0E810F93 
X-CRM114-Status: GOOD (  14.52  )
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
CONFIG_CRYPTO_RSA-related crypto to convert them into pluggable
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
 crypto/fips140/fips140-api.c  | 12 ++++++++++++
 crypto/rsa.c                  |  4 ++--
 include/crypto/internal/rsa.h |  7 +++----
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 21197857ad7d..3e12b556bfa7 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -52,7 +52,7 @@ rsa_generic-y += rsa.o
 rsa_generic-y += rsa_helper.o
 rsa_generic-y += rsa-pkcs1pad.o
 rsa_generic-y += rsassa-pkcs1.o
-obj-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
+crypto-objs-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
 
 $(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsasignature.asn1.h
 $(obj)/ecdsa-x962.o: $(obj)/ecdsasignature.asn1.h
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 50603e7a8bb0..d10eded6b61e 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -303,4 +303,16 @@ DEFINE_CRYPTO_API_STUB(crypto_register_kpp);
 DEFINE_CRYPTO_API_STUB(crypto_unregister_kpp);
 DEFINE_CRYPTO_API_STUB(kpp_register_instance);
 
+#endif
+
+/*
+ * crypto/rsa_helper.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_RSA)
+
+#include <crypto/internal/rsa.h>
+
+DEFINE_CRYPTO_API_STUB(rsa_parse_pub_key);
+DEFINE_CRYPTO_API_STUB(rsa_parse_priv_key);
+
 #endif
\ No newline at end of file
diff --git a/crypto/rsa.c b/crypto/rsa.c
index 6c7734083c98..44eef74ebad8 100644
--- a/crypto/rsa.c
+++ b/crypto/rsa.c
@@ -430,8 +430,8 @@ static void __exit rsa_exit(void)
 	crypto_unregister_akcipher(&rsa);
 }
 
-module_init(rsa_init);
-module_exit(rsa_exit);
+crypto_module_init(rsa_init);
+crypto_module_exit(rsa_exit);
 MODULE_ALIAS_CRYPTO("rsa");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("RSA generic algorithm");
diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.h
index 071a1951b992..3d8fe098eaae 100644
--- a/include/crypto/internal/rsa.h
+++ b/include/crypto/internal/rsa.h
@@ -7,6 +7,7 @@
  */
 #ifndef _RSA_HELPER_
 #define _RSA_HELPER_
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <crypto/akcipher.h>
 
@@ -48,11 +49,9 @@ struct rsa_key {
 	size_t qinv_sz;
 };
 
-int rsa_parse_pub_key(struct rsa_key *rsa_key, const void *key,
-		      unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RSA, rsa_parse_pub_key, int, (struct rsa_key *rsa_key, const void *key, unsigned int key_len), (rsa_key, key, key_len));
 
-int rsa_parse_priv_key(struct rsa_key *rsa_key, const void *key,
-		       unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_RSA, rsa_parse_priv_key, int, (struct rsa_key *rsa_key, const void *key, unsigned int key_len), (rsa_key, key, key_len));
 
 #define RSA_PUB (true)
 #define RSA_PRIV (false)
-- 
2.47.3


