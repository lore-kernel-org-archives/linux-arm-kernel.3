Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CE6EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRIBs9Wsgog8IU+nYjdPvBpy4OpKlnmgXZ0sO3jgkQI=; b=JB7Nw+BHi1i3dNE0bGAStWYm8Y
	dJUBsqvmSm0cPHSTxwuIPIm9mXurDPDjuTAlHEgg1yQNQij5VtvvOcJDCc6CbpgNtDGVjoJkhsnes
	EOIaLGnyZaNvQ+a15fVU52lckVN7FjOt95f1nAt+ZQboKwl9GhlUiVXSwc+GoHWV7Rg2jrqyUuJSF
	Gipc2MQ3h6hwcJ5isZQuxAHvcWh/CkDNUcEx2oklXJWuOFTjkwqyFw+DrnzdxrpfoUk7QSJpKam4z
	gQsattYU4ctGBgnBps4+expnYN0NOk6+ng9uauf7OPnjfYaGfAPJ7M0eKssCNE4Fq/pke1lWsimwX
	UQsUc/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNHc-00000001a8u-2qq4;
	Thu, 12 Feb 2026 03:22:24 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqNHY-00000001a6r-3Sug
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866540; x=1802402540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dRIBs9Wsgog8IU+nYjdPvBpy4OpKlnmgXZ0sO3jgkQI=;
  b=BkCr6I7d5IzLvAvt5MKqmNUo/MlwtIRNw/yLCIxc5wp7nOGAxsd7wqGE
   9lHS0r449NIVIIfkKmCFqiPmq+WTZ0F2eByOBXSQK6fpm5MFygNERKJt1
   z1siQh0TwkrgeJOgBBKhzpJIVWYRW5fqyDdV8yGdmUw/JkdR4q9+whlTE
   NWqDACh9Rc5P/5jLZ3AWlDFQYrsZ87i0T1dqvQ3WZcfhhQPvBBdMjLX1f
   HTWpBpOpmlZw7unApCRV0FnZVzhp/y7Gd5V1EioQFSyxnrzgXw+iqCIDm
   4z14+TBUMyjGbbQtjFdVJ0ddc5o1fn/Cd+q1hpUcFlsipgAsifib1Fb73
   g==;
X-CSE-ConnectionGUID: pWM+c+Z2Qw2rx/MbQP4rvw==
X-CSE-MsgGUID: Pn0AxGWYT3+tJ/RxOZQhQg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12456113"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:22:20 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:15288]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 17ec802b-88aa-4cc3-8f8b-6a017524a26f; Thu, 12 Feb 2026 03:22:19 +0000 (UTC)
X-Farcaster-Flow-ID: 17ec802b-88aa-4cc3-8f8b-6a017524a26f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:19 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:22:19 +0000
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
Subject: [PATCH 04/12] arm64: crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SM4_ARM64_CE_BLK crypto
Date: Thu, 12 Feb 2026 03:21:04 +0000
Message-ID: <20260212032117.9166-5-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212032117.9166-1-wanjay@amazon.com>
References: <20260212032117.9166-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D039UWB004.ant.amazon.com (10.13.138.57) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_192220_918442_1A97C79B 
X-CRM114-Status: GOOD (  11.97  )
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
CONFIG_CRYPTO_SM4_ARM64_CE_BLK-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile              |  2 +-
 arch/arm64/crypto/fips140/fips140-api.c | 12 ++++++++++++
 arch/arm64/crypto/sm4-ce-glue.c         |  4 ++--
 arch/arm64/crypto/sm4-ce.h              | 16 +++++++++++-----
 4 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index a4fe2bf71c6b..59e94f714ef9 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -14,7 +14,7 @@ sm3-ce-y := sm3-ce-glue.o sm3-ce-core.o
 crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE) += sm4-ce-cipher.o
 sm4-ce-cipher-y := sm4-ce-cipher-glue.o sm4-ce-cipher-core.o
 
-obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_ARM64_CE_BLK) += sm4-ce.o
 sm4-ce-y := sm4-ce-glue.o sm4-ce-core.o
 
 obj-$(CONFIG_CRYPTO_SM4_ARM64_CE_CCM) += sm4-ce-ccm.o
diff --git a/arch/arm64/crypto/fips140/fips140-api.c b/arch/arm64/crypto/fips140/fips140-api.c
index e69de29bb2d1..a36c8f3b0741 100644
--- a/arch/arm64/crypto/fips140/fips140-api.c
+++ b/arch/arm64/crypto/fips140/fips140-api.c
@@ -0,0 +1,12 @@
+/*
+ * arch/arm64/crypto/sm4-ce-glue.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SM4_ARM64_CE_BLK)
+
+#include <arch/arm64/crypto/sm4-ce.h>
+
+DEFINE_CRYPTO_API_STUB(sm4_ce_expand_key);
+DEFINE_CRYPTO_API_STUB(sm4_ce_crypt_block);
+DEFINE_CRYPTO_API_STUB(sm4_ce_cbc_enc);
+
+#endif
diff --git a/arch/arm64/crypto/sm4-ce-glue.c b/arch/arm64/crypto/sm4-ce-glue.c
index 0eeabfa9ef25..cf90b53ef46a 100644
--- a/arch/arm64/crypto/sm4-ce-glue.c
+++ b/arch/arm64/crypto/sm4-ce-glue.c
@@ -701,8 +701,8 @@ static void __exit sm4_exit(void)
 	crypto_unregister_skciphers(sm4_algs, ARRAY_SIZE(sm4_algs));
 }
 
-module_cpu_feature_match(SM4, sm4_init);
-module_exit(sm4_exit);
+crypto_module_cpu_feature_match(SM4, sm4_init);
+crypto_module_exit(sm4_exit);
 
 MODULE_DESCRIPTION("SM4 ECB/CBC/CTR/XTS using ARMv8 Crypto Extensions");
 MODULE_ALIAS_CRYPTO("sm4-ce");
diff --git a/arch/arm64/crypto/sm4-ce.h b/arch/arm64/crypto/sm4-ce.h
index 1e235c4371eb..189f69762248 100644
--- a/arch/arm64/crypto/sm4-ce.h
+++ b/arch/arm64/crypto/sm4-ce.h
@@ -4,10 +4,16 @@
  * Copyright (C) 2022 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
  */
 
-void sm4_ce_expand_key(const u8 *key, u32 *rkey_enc, u32 *rkey_dec,
-		       const u32 *fk, const u32 *ck);
+#include <crypto/api.h>
 
-void sm4_ce_crypt_block(const u32 *rkey, u8 *dst, const u8 *src);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_ARM64_CE_BLK, sm4_ce_expand_key, void,
+	(const u8 *key, u32 *rkey_enc, u32 *rkey_dec, const u32 *fk, const u32 *ck),
+	(key, rkey_enc, rkey_dec, fk, ck));
 
-void sm4_ce_cbc_enc(const u32 *rkey_enc, u8 *dst, const u8 *src,
-		    u8 *iv, unsigned int nblocks);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_ARM64_CE_BLK, sm4_ce_crypt_block, void,
+	(const u32 *rkey, u8 *dst, const u8 *src),
+	(rkey, dst, src));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_SM4_ARM64_CE_BLK, sm4_ce_cbc_enc, void,
+	(const u32 *rkey_enc, u8 *dst, const u8 *src, u8 *iv, unsigned int nblocks),
+	(rkey_enc, dst, src, iv, nblocks));
-- 
2.47.3


