Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66591EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RAu+ngRu7VaJdEnVHpRjXf3jf5khVFBS8T9OL30w4g=; b=gk5i2ShaG/Oh5MLyHOmnGT9JLe
	um6VJu2ankb/K5De1PRdteDCqjj5n34Kd2X3Tx0bneItdOBLs+RvEy23PUFX1/viaB8ZyCUq3axnR
	jSsIMpRTYU425gWuKTHaHYnuACwtQhKGAKssZHZE+962Zma57/XeHjfQfdqZAz3VX55ejOkcrPN+k
	UttKxsrHcViOp6SW1Nr77W+7pJ/J9QTPOL7wBnJAxbfMdofblL2W9jPTqRDB3SZgs3pxB7FJeGkiE
	JZE0IBxLuJSa7aRBs+jIqugL4wt6qef91KhsrsT3h32miCDmyqivs0kK8UKupP0Sw4lPWRx4AJGo3
	AQjyJmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMrd-00000001PIc-2iXs;
	Thu, 12 Feb 2026 02:55:33 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMrZ-00000001PGO-0ANK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864929; x=1802400929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8RAu+ngRu7VaJdEnVHpRjXf3jf5khVFBS8T9OL30w4g=;
  b=pqC4qORSuMkyaLwwHIeBwzcbU8VWyvlv6o0isH/2zaeft/J2kJo1pbHi
   iKsb8reSMMSFb3Mt86kmJP3PA3NjEFwXVPqKIcC+bAd1Z/o3fL1GcIdTa
   4FDrDGO/JKtufunoNYVfUYE0i7Lnjr7sYZy6WByYLEUGNU+mhsd+4f7TV
   tAhqU6XrAkbqrHf8bu92Zoioqlpm7YSEFn+CAL9PKCbMnXQ4lI4w6mhLK
   MEiGX5bkIOznF+2sdjP/vnQvZErKUIiHMTDKMmI1AIVB/wUSi1MJ2L66C
   eSUW1NmI2HGfKXXGIaIYNoqPFIGqM2kS31ArBsDxkkjQeoeuRM0zvO+9z
   A==;
X-CSE-ConnectionGUID: gpHKtz4YTLG1rHyqtyz9CQ==
X-CSE-MsgGUID: AtxtWYvsQEKWGC83ast3Hw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12455045"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:55:28 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:26346]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 53fd7e8e-f714-48b8-b5b3-72121ae549e1; Thu, 12 Feb 2026 02:55:28 +0000 (UTC)
X-Farcaster-Flow-ID: 53fd7e8e-f714-48b8-b5b3-72121ae549e1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:27 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:55:27 +0000
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
Subject: [PATCH 031/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_GHASH crypto
Date: Thu, 12 Feb 2026 02:46:07 +0000
Message-ID: <20260212024725.11264-32-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWA004.ant.amazon.com (10.13.139.41) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185529_354823_DB008838 
X-CRM114-Status: GOOD (  11.03  )
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

From: Vegard Nossum <vegard.nossum@oracle.com>

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_CRYPTO_GHASH-related crypto to convert them into pluggable
interface.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[add ghash-generic.o into crypto-objs-y; revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile        | 2 +-
 crypto/ghash-generic.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 1d5ee8dc24d9..d58b5e2b5b43 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -171,7 +171,7 @@ UBSAN_SANITIZE_jitterentropy.o = n
 jitterentropy_rng-y := jitterentropy.o jitterentropy-kcapi.o
 obj-$(CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE) += jitterentropy-testing.o
 obj-$(CONFIG_CRYPTO_BENCHMARK) += tcrypt.o
-obj-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
+crypto-objs-$(CONFIG_CRYPTO_GHASH) += ghash-generic.o
 obj-$(CONFIG_CRYPTO_USER_API) += af_alg.o
 obj-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
 obj-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
diff --git a/crypto/ghash-generic.c b/crypto/ghash-generic.c
index e5803c249c12..37e98aa546c7 100644
--- a/crypto/ghash-generic.c
+++ b/crypto/ghash-generic.c
@@ -153,8 +153,8 @@ static void __exit ghash_mod_exit(void)
 	crypto_unregister_shash(&ghash_alg);
 }
 
-module_init(ghash_mod_init);
-module_exit(ghash_mod_exit);
+crypto_module_init(ghash_mod_init);
+crypto_module_exit(ghash_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("GHASH hash function");
-- 
2.47.3


