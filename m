Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBC7EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCBgKRe0M7vD2sUEFFMMA+23dBh3vsQZmLk7rxQKUWo=; b=BA2o0jR4d4ep6FbPICPg5H12lW
	6DGixaNIkQayeJimIuAqx2GMgUaLtW4LmeSqI1jQ99zFAG5d3IHVeXGcFqXPax/E1WybgwKgvsNI8
	/z/3HOUWKovwkcxdWGTW/cdh6fF2HI+mxm5mY9dxMa1hHiqp+0mjYsKng6TpRJmdifxnyHTpnmDk+
	JMdrksrp3Maz3GF45ibWxKoFyHwg3nf8QE2w/LSS9rkfYUTWkzYyfRt88UiLZWVgWrdyRjCflmFGd
	GOl88V1j8bdZj+rIT1EM6MjY2iv9ooKf0jg6hRcf6djGdEgTCIJUocC9SFQMLcmGO1YgB0d8Fic1w
	6X2IFLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMkr-00000001MTb-0lPp;
	Thu, 12 Feb 2026 02:48:33 +0000
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.68.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMkp-00000001MSZ-2AJy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864511; x=1802400511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VCBgKRe0M7vD2sUEFFMMA+23dBh3vsQZmLk7rxQKUWo=;
  b=Nje6m5u3W9jKg7ejB4Vrkbmc2IzV8B1rT9qDQTWX9IBoGt8CH/pjVXH8
   TVGOPg+p2UI1uLRZ6cAgLr/DXHVO6+4xhx/2XIXaAcwQlX7bdk15qNSAL
   ygHCvUlaICFyLU66kvSZ9pPUXiEkpZdJW0O3XN+i0wAXwNscXZdIcJB6s
   5ftpuEXdihafEThpOxoYAbANxq8SSNCn7+ehfxJBLPVHjL+g6zzHtGAQn
   AaqO5NaewVrrAcnTMtBEhFW9tU1hSNAGr4HTlroGQ/xbw6v1Nn3/S5/zZ
   BdAfkvpWzJ0Fe6X6h5TezvNs4M6dUyz6osFcnD/ImEyC3ADPj/ON6j9/f
   w==;
X-CSE-ConnectionGUID: wYOjI1XLQASERCT4zCk1pA==
X-CSE-MsgGUID: iEXYafNuQ86gbTr0QciiTw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12924945"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:48:29 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:24514]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 9b351c8c-52ff-495f-85b4-a5639abb0c2c; Thu, 12 Feb 2026 02:48:28 +0000 (UTC)
X-Farcaster-Flow-ID: 9b351c8c-52ff-495f-85b4-a5639abb0c2c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:28 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:48:28 +0000
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
Subject: [PATCH 004/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_GENIV crypto
Date: Thu, 12 Feb 2026 02:45:40 +0000
Message-ID: <20260212024725.11264-5-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWB002.ant.amazon.com (10.13.139.181) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184831_608142_305376EC 
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
CONFIG_CRYPTO_GENIV-related crypto to convert them into pluggable
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
 crypto/Makefile                 |  2 +-
 crypto/fips140/fips140-api.c    | 13 +++++++++++++
 include/crypto/internal/geniv.h | 14 ++++++++++----
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 9aa52ddebb05..b05fdfacf170 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -16,7 +16,7 @@ crypto_algapi-y := algapi.o scatterwalk.o $(crypto_algapi-y)
 crypto-objs-$(CONFIG_CRYPTO_ALGAPI2) += crypto_algapi.o
 
 crypto-objs-$(CONFIG_CRYPTO_AEAD2) += aead.o
-obj-$(CONFIG_CRYPTO_GENIV) += geniv.o
+crypto-objs-$(CONFIG_CRYPTO_GENIV) += geniv.o
 
 crypto_skcipher-y += lskcipher.o
 crypto_skcipher-y += skcipher.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index eb02a56cb8b3..55129c62d813 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -129,4 +129,17 @@ DEFINE_CRYPTO_API_STUB(crypto_register_aeads);
 DEFINE_CRYPTO_API_STUB(crypto_unregister_aeads);
 DEFINE_CRYPTO_API_STUB(aead_register_instance);
 
+#endif
+
+/*
+ * crypto/geniv.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_GENIV)
+
+#include <crypto/internal/geniv.h>
+
+DEFINE_CRYPTO_API_STUB(aead_geniv_alloc);
+DEFINE_CRYPTO_API_STUB(aead_init_geniv);
+DEFINE_CRYPTO_API_STUB(aead_exit_geniv);
+
 #endif
\ No newline at end of file
diff --git a/include/crypto/internal/geniv.h b/include/crypto/internal/geniv.h
index 012f5fb22d43..f6dfe3292b3c 100644
--- a/include/crypto/internal/geniv.h
+++ b/include/crypto/internal/geniv.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_INTERNAL_GENIV_H
 #define _CRYPTO_INTERNAL_GENIV_H
 
+#include <crypto/api.h>
 #include <crypto/internal/aead.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
@@ -18,9 +19,14 @@ struct aead_geniv_ctx {
 	u8 salt[] __attribute__ ((aligned(__alignof__(u32))));
 };
 
-struct aead_instance *aead_geniv_alloc(struct crypto_template *tmpl,
-				       struct rtattr **tb);
-int aead_init_geniv(struct crypto_aead *tfm);
-void aead_exit_geniv(struct crypto_aead *tfm);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_GENIV, aead_geniv_alloc, struct aead_instance *,
+	(struct crypto_template *tmpl, struct rtattr **tb),
+	(tmpl, tb));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_GENIV, aead_init_geniv, int,
+	(struct crypto_aead *tfm),
+	(tfm));
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_GENIV, aead_exit_geniv, void,
+	(struct crypto_aead *tfm),
+	(tfm));
 
 #endif	/* _CRYPTO_INTERNAL_GENIV_H */
-- 
2.47.3


