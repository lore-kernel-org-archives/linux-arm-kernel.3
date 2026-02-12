Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DC6EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEAseTC3S8JddkGZqDzPI8m8i5+Dvp7n7N+9tsPap0g=; b=PxnNbe/vubAu67pUgPYBq19st3
	/uG3aTyB/hfvFJBA6ydh2lDSOEq1hoQWmdoTmfzvIuMAAKStx7IAhh1Z9W3rptJcu1vuUkCzf7eAC
	rivkzOzdJOB04hoJjnTKSatoPQZIm6B0v2h6E/fszZno4rjC+tqfUfKV644ppoaP8YSSf4Xz7i2dg
	XhFvf8a0qOAn1V2CirbZE2j6socpxUSaCp8BXCyG48inUKCTKXMzZXRFasOIWOE5VmyRJdocPd4MM
	zQRSmo/ohDPYgsYmv6nSWkHfJr2qTNGRkZ4AGXtXipUjQfkYRE5omnNjnB4E2f/rSKfFbqkCKYvbZ
	vg8Pf3IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMiY-00000001Lc2-3iTQ;
	Thu, 12 Feb 2026 02:46:10 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMiW-00000001LaU-23Wj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864368; x=1802400368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eEAseTC3S8JddkGZqDzPI8m8i5+Dvp7n7N+9tsPap0g=;
  b=itG+RwTiupV2W/dPUlqqWNJV7jznGk0dBSjLjTnR8i1FXhMSEfqdgvHb
   UY0VbU3PJ6LvozKc2gp0XaA8z3HLzBsHCIsp/8WoZGbxEvxISuLArkFrE
   yqF46rGYV6hoi7UkVjTb+8r7D2JBq2V/cjoTLV/E3L2LQ+uh+abzwsvIz
   mWYOSoAGa5HAbPLMxuFMm4i8hJIh00GFpdTyMOzS3UFrsgKzMm+Sd0g8c
   EjUIyQPjL/QbWPbBpsDc1UmT/Ne8DVTm/QpkjzMqsMQp37ds6HQ4HJf20
   AFUGNHVOyEunMKcHmaNtesgtObur953btA/Hn8UgT1wkILavhgET3MlPK
   g==;
X-CSE-ConnectionGUID: cHjmmm8mR/ucuO5dfBIcAQ==
X-CSE-MsgGUID: kMNMUwLtR8SiAIHpCz4R6Q==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918492"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:46:06 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:4344]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.29.209:2525] with esmtp (Farcaster)
 id ae339ba5-9c91-4f3f-a0bf-313fc35b4241; Thu, 12 Feb 2026 02:46:06 +0000 (UTC)
X-Farcaster-Flow-ID: ae339ba5-9c91-4f3f-a0bf-313fc35b4241
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:06 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:05 +0000
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
Subject: [PATCH 14/17] crypto: fips140: add module integrity self-check
Date: Thu, 12 Feb 2026 02:42:18 +0000
Message-ID: <20260212024228.6267-15-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWB004.ant.amazon.com (10.13.138.91) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_184608_579349_30143CCC 
X-CRM114-Status: GOOD (  13.16  )
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

Add verify_integrity() function to perform HMAC-SHA256 self verification
of this standalone crypto module against pre-computed hash. This integrity
self-check is required by FIPS 140-3.

This patch is picked from Vegard Nossum <vegard.nossum@oracle.com> with
minor modifications.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/fips140-module.c | 52 +++++++++++++++++++++++++++++++++
 crypto/fips140/fips140-module.h |  4 +++
 2 files changed, 56 insertions(+)

diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
index e0e669ba1b5e..3bc8865567cb 100644
--- a/crypto/fips140/fips140-module.c
+++ b/crypto/fips140/fips140-module.c
@@ -16,6 +16,54 @@
 
 #define CRYPTO_INTERNAL "CRYPTO_INTERNAL"
 
+static const u8 fips140_integ_hmac_key[] = CONFIG_CRYPTO_FIPS140_HMAC_KEY;
+
+static int verify_integrity(void)
+{
+	extern const u8 *_binary_crypto_ko_start;
+	extern const u8 *_binary_crypto_ko_end;
+	extern const u8 *_binary_crypto_hmac_start;
+	
+	struct crypto_shash *tfm;
+	SHASH_DESC_ON_STACK(desc, tfm);
+	u8 digest[SHA256_DIGEST_SIZE];
+	int err;
+
+	tfm = crypto_alloc_shash("hmac(sha256)", 0, 0);
+	if (IS_ERR(tfm))
+		panic("FIPS 140: failed to allocate hmac tfm (%ld)\n", PTR_ERR(tfm));
+
+	desc->tfm = tfm;
+
+	err = crypto_shash_setkey(tfm, fips140_integ_hmac_key, sizeof(fips140_integ_hmac_key) - 1);
+	if (err)
+		panic("FIPS 140: crypto_shash_setkey() failed: %d\n", err);
+
+	err = crypto_shash_init(desc);
+	if (err)
+		panic("FIPS 140: crypto_shash_init() failed: %d\n", err);
+
+	err = crypto_shash_update(desc, _binary_crypto_ko_start, _binary_crypto_ko_end - _binary_crypto_ko_start);
+	if (err)
+		panic("FIPS 140: crypto_shash_update() failed: %d\n", err);
+
+	err = crypto_shash_final(desc, digest);
+	if (err)
+		panic("FIPS 140: crypto_shash_final() failed: %d\n", err);
+
+	shash_desc_zero(desc);
+
+	if (memcmp(digest, _binary_crypto_hmac_start, sizeof(digest)))
+		panic("FIPS 140: failed integrity check\n");
+
+	pr_info("FIPS 140: integrity verification passed\n");
+
+	crypto_free_shash(tfm);
+	memzero_explicit(digest, sizeof(digest));
+
+	return 0;
+}
+
 static int __init run_initcalls(void)
 {
 	typedef int (*initcall_t)(void);
@@ -68,6 +116,10 @@ static int __init fips140_init(void)
     pr_info("loading " FIPS140_MODULE_NAME "\n");
 
 	run_initcalls();
+
+	if (fips_enabled){
+		verify_integrity(); /* Panics if integrity check fails */
+	}
 	fips140_mark_module_level_complete(2);
     return 0;
 }
diff --git a/crypto/fips140/fips140-module.h b/crypto/fips140/fips140-module.h
index e95dac8eeda9..b8968d54800e 100644
--- a/crypto/fips140/fips140-module.h
+++ b/crypto/fips140/fips140-module.h
@@ -9,9 +9,13 @@
 #include <linux/module.h>
 #include <linux/crypto.h>
 #include <crypto/algapi.h>
+#include <crypto/hash.h>
+#include <crypto/sha2.h>
 #include <linux/init.h>
+#include <linux/string.h>
 #include <linux/atomic.h>
 #include <linux/wait.h>
+#include <linux/fips.h>
 
 /* FIPS140 synchronization between kernel and module */
 extern atomic_t fips140_kernel_level_complete;
-- 
2.47.3


