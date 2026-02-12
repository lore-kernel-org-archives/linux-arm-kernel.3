Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8692EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MM9/lfGKGixCO0cCT/QXCgbIKvyINBAPlL8hgocq9c=; b=Oer7BgloUPpLxH2gEdckUzN04l
	fyYH69+vAnRgIZsjvugRUGY0BBYhoA82dbqTXrnDqVnlfvFGnRgnUWlBxugNkwuZ0Si1iO6R5VDSh
	b6GoLNNsn7xmWYo2Z5CvYqh/e7k4HkAMzNDC0bgvwX6jbBrHYjprP8zChKOl6AflprjDqJ5aqeu4d
	bNcSLxh6lPtg83zUKqGTVhnWg8uKMjk/PEdJ+ZNdyWJIagahX3av+Ty/3N00b45kMiVGRqqyPEwuN
	sq+C9WQxFFyutz5DQV7oSpBjMDCtoImvnoCMv3XzuAyrRPJlmh4PX/g4N2CaR/6W57IuTH/rCBWzv
	93O0KJSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN3d-00000001UKC-2Cl6;
	Thu, 12 Feb 2026 03:07:57 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN3a-00000001UIS-2tVK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865674; x=1802401674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/MM9/lfGKGixCO0cCT/QXCgbIKvyINBAPlL8hgocq9c=;
  b=K9cdyGj6JdYu+h8lfkOOZw7LYgANutpR5b6/m16I+iPMLZfSuf7QzXnF
   rJFIt1+eESQZAgOqsMN7itV5sjUWbf0K2Ukbzirdv7XOMZgeGwabZofV6
   xrSflCS7kDsKYha99PxTo2Alo26pqCdPxvWaRaBPl9no1iZdxx1WIJMX5
   8vgYKq0JSuSGhxXsjNEhDGGYrIn94DkRJGWwpaJOtD6VFzIJS9Hzj68CU
   iSVXzLjwp7EtUHNwOpWjdLpGcZte6d6ZpziUcocihPuvG/xHYOLNBBo+Y
   /n74BXkJ+wlZDaro1FeUeKUo7ycmPaJpnpIRbdCdAfwMqZF80HFeupIdz
   Q==;
X-CSE-ConnectionGUID: 0AsAnmPhTFugsicu9P0TFQ==
X-CSE-MsgGUID: EpnN48T3SZ2OeSx83d7vCw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918720"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:07:54 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:14435]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 47f0067c-1ad6-4a5e-91e9-a8be92f30050; Thu, 12 Feb 2026 03:07:53 +0000 (UTC)
X-Farcaster-Flow-ID: 47f0067c-1ad6-4a5e-91e9-a8be92f30050
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:53 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:07:53 +0000
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
Subject: [PATCH 079/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_CRC32C and CONFIG_CRYPTO_CRC32 crypto
Date: Thu, 12 Feb 2026 02:46:55 +0000
Message-ID: <20260212024725.11264-80-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D043UWA003.ant.amazon.com (10.13.139.31) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190754_823293_7A533537 
X-CRM114-Status: GOOD (  10.58  )
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
CONFIG_CRYPTO_CRC32C- and CONFIG_CRYPTO_CRC32-related crypto to convert
them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 4 ++--
 crypto/crc32.c  | 4 ++--
 crypto/crc32c.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index f8cd388ca03c..6d332c55fd4e 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -151,9 +151,9 @@ crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
 crypto-objs-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
 crypto-objs-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
-obj-$(CONFIG_CRYPTO_CRC32C) += crc32c-cryptoapi.o
+crypto-objs-$(CONFIG_CRYPTO_CRC32C) += crc32c-cryptoapi.o
 crc32c-cryptoapi-y := crc32c.o
-obj-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
+crypto-objs-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
 crc32-cryptoapi-y := crc32.o
 crypto-objs-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
 obj-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
diff --git a/crypto/crc32.c b/crypto/crc32.c
index 489cbed9422e..cfbf86ed9926 100644
--- a/crypto/crc32.c
+++ b/crypto/crc32.c
@@ -120,8 +120,8 @@ static void __exit crc32_mod_fini(void)
 	crypto_unregister_shash(&alg);
 }
 
-module_init(crc32_mod_init);
-module_exit(crc32_mod_fini);
+crypto_module_init(crc32_mod_init);
+crypto_module_exit(crc32_mod_fini);
 
 MODULE_AUTHOR("Alexander Boyko <alexander_boyko@xyratex.com>");
 MODULE_DESCRIPTION("CRC32 calculations wrapper for lib/crc32");
diff --git a/crypto/crc32c.c b/crypto/crc32c.c
index 1eff54dde2f7..d8122c4aa26e 100644
--- a/crypto/crc32c.c
+++ b/crypto/crc32c.c
@@ -157,8 +157,8 @@ static void __exit crc32c_mod_fini(void)
 	crypto_unregister_shash(&alg);
 }
 
-module_init(crc32c_mod_init);
-module_exit(crc32c_mod_fini);
+crypto_module_init(crc32c_mod_init);
+crypto_module_exit(crc32c_mod_fini);
 
 MODULE_AUTHOR("Clay Haapala <chaapala@cisco.com>");
 MODULE_DESCRIPTION("CRC32c (Castagnoli) calculations wrapper for lib/crc32c");
-- 
2.47.3


