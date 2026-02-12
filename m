Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D97EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4yK8WicVdE8ixC2fqu9NxvZYG/kMokZid0aN9xc718=; b=0WDNhLUUq5+0haATyuiagoLbvv
	SIOrVx5IxrnwGaZSWFXaLbg/+1l8GIXk/voxGIqY2BvULYJO04/imGUpQSEjY1ezNEPnMYdigYBVG
	iVdLB234VPON9xzlP/BxLIj2k4HIyBy70pyZR2MQXHzRN29FKQ/Ym6fmDxIp+glCU5+HBcFY2HW50
	8VZW0YMR3hT1D/oqdP8zhEqnnmL90Abdhv9K+AfhkdroV+uTkfzIa/MfvdQXhfgcMGY9x/LM837Fv
	Q3NmNA5RGRz/9GCE5XNcv7oOA+kQrg6KhZ8oua43QpTlRLmLPvaxrya8zUqcn7ptItBArYKe2NI2R
	MpjbnK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMsA-00000001PVE-05Xa;
	Thu, 12 Feb 2026 02:56:06 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMs7-00000001PU5-3STv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864963; x=1802400963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y4yK8WicVdE8ixC2fqu9NxvZYG/kMokZid0aN9xc718=;
  b=apifc5buI5XbaKA+jOkPi2dugvH+WgQ5i/i2i/XpFa+REqYQEnak9H03
   rk0RyLv+YgOaCpglOA494sexhYMMK2zQoHOP8q8QYzggtFuh2NxDuibTD
   ZfBKq9mdMUu+PmGiFlwhs+94CbcFBudAAV3ZIAEkqt4k5QdmYeSV489Vs
   LvRoaJLD7DquAsasCMSrFBX3pxr4UjmP1+8cMSImlq4EK0GBTa7M3+lXt
   9FyINlSlvrs76BTY2vldyRWqK8b+U73nrKL5/Xw8OBq3WTXfl1QL8EHqN
   V2ISTeK4HNQYmU0FkVR2mge9CZLBK38WgDDAWAh8QdunwV0nGT3QEf2N6
   A==;
X-CSE-ConnectionGUID: CUld7qZWT3ehwR5Iwrnu6g==
X-CSE-MsgGUID: z3Jc180zR26kxXm3G8Fa1A==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919570"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:56:03 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:7273]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 21bc2199-4b92-424a-8288-a9a4cc86a0eb; Thu, 12 Feb 2026 02:56:03 +0000 (UTC)
X-Farcaster-Flow-ID: 21bc2199-4b92-424a-8288-a9a4cc86a0eb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:58 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:58 +0000
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
Subject: [PATCH 033/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE crypto
Date: Thu, 12 Feb 2026 02:46:09 +0000
Message-ID: <20260212024725.11264-34-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D038UWC002.ant.amazon.com (10.13.139.238) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185603_920853_55B39779 
X-CRM114-Status: GOOD (  14.63  )
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
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE-related crypto to convert them into
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
 crypto/asymmetric_keys/Makefile |  2 +-
 crypto/fips140/fips140-api.c    | 14 ++++++++++++++
 include/crypto/public_key.h     | 15 +++++++++++----
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index 252536153d73..4f29401016f1 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -10,7 +10,7 @@ asymmetric_keys-y := \
 	restrict.o \
 	signature.o
 
-obj-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
+crypto-objs-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
 
 #
 # X.509 Certificate handling
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 100f50ad7b43..6dce18f81e91 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -457,3 +457,17 @@ DEFINE_CRYPTO_API_STUB(restrict_link_by_signature);
 DEFINE_CRYPTO_API_STUB(restrict_link_by_digsig);
 
 #endif
+/*
+ * crypto/asymmetric_keys/public_key.c
+ */
+#if IS_BUILTIN(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
+
+#include <crypto/public_key.h>
+
+DEFINE_CRYPTO_API_STUB(public_key_free);
+DEFINE_CRYPTO_API_STUB(public_key_verify_signature);
+
+#undef public_key_subtype
+DEFINE_CRYPTO_VAR_STUB(public_key_subtype);
+
+#endif
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index be789854fdcb..b0e737d1dc1a 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -36,7 +36,9 @@ struct public_key {
 #define KEY_EFLAG_KEYCERTSIGN	2	/* set if the keyCertSign usage is set */
 };
 
-extern void public_key_free(struct public_key *key);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE, public_key_free, void,
+	(struct public_key *key),
+	(key));
 
 /*
  * Public key cryptography signature data
@@ -58,7 +60,11 @@ DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, public_key_signature_free, void,
 	(struct public_key_signature *sig),
 	(sig));
 
-extern struct asymmetric_key_subtype public_key_subtype;
+DECLARE_CRYPTO_VAR(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE, public_key_subtype, struct asymmetric_key_subtype, );
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
+#define public_key_subtype (*((struct asymmetric_key_subtype*)CRYPTO_VAR_NAME(public_key_subtype)))
+#endif
 
 struct key;
 struct key_type;
@@ -113,8 +119,9 @@ DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_KEY_TYPE, verify_signature, int,
 	(arg1, arg2));
 
 #if IS_REACHABLE(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
-int public_key_verify_signature(const struct public_key *pkey,
-				const struct public_key_signature *sig);
+DECLARE_CRYPTO_API(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE, public_key_verify_signature, int,
+	(const struct public_key *pkey, const struct public_key_signature *sig),
+	(pkey, sig));
 #else
 static inline
 int public_key_verify_signature(const struct public_key *pkey,
-- 
2.47.3


