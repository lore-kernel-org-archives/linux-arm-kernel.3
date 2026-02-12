Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09734EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOXH1N267G9hujtPzTm5MQjsS7J53g1yuw7bcNztYkk=; b=mwPzE0QVWXqQbpBJQjuu4GMX4A
	w0d5f+zGdyV2DMpht4d7b7seeqc13OvuNIexX0fkD0vcXMy0O6NQF+LewnnS3dWD5iE3N9gKYxsya
	P9nSsnAcBhAXKcBrfhYDtvWQMtDdoFN9J3tQbjMfx4v43PPc5vmSUqJtAxEjmAnEJZfYR/NqBJguW
	jqlGMR1GDBRFoRAOtBM0CCZOXdFYjIiPaMUWRJ4vrgPehP9kO5Ml86TKv6WM/mP1vY/7QwRfvrck+
	4K42nlYky4SI4Mp5tAh4y08K39pVmPy9CkvJiERcVDWcnTe+xiU0rF5+r1wojvdMTw1FyU5arBjeK
	qPCAAUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMzM-00000001SXY-3elB;
	Thu, 12 Feb 2026 03:03:32 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMzK-00000001SWc-14I6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865410; x=1802401410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zOXH1N267G9hujtPzTm5MQjsS7J53g1yuw7bcNztYkk=;
  b=cn57p3RwlTtaIUYUHCHa8Sy1Hb90Zq/WbOdn9kiN7ojK2BN1RI3yFSm5
   ejf+77Fb0hsDG6bq3GkRr+34ugBIvw9GAMZgdfV41+DYfZvib2FIi4Syy
   Rz1vXlfsTr2hHy1GgSArFf0DTYAYqKKMGOFL3ZxbJbtb31og/zDWjYoZX
   Qoe9uxbup5jTtmNk3JV+AhS+dSi9aDdJ3EnO2u7QsyMtnQtE3E+v9hlZR
   xTvL4L6YNxz0bAgQixsLOfjw4jxL+SYKV7goY0QhX4A91kJZXlvdZD0z/
   CbBw1df1CRvKLrA4gQgP/jOI2qtErfu4FHsaatP9HHD3euijUJnrqwyw9
   A==;
X-CSE-ConnectionGUID: JTIezI2fSB2LWCEUqfoOug==
X-CSE-MsgGUID: IYaTOyDxQKet5jqjaeY8rg==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803675"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:03:29 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:2423]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 26a7f20d-170f-462e-9658-434f6a797ab7; Thu, 12 Feb 2026 03:03:29 +0000 (UTC)
X-Farcaster-Flow-ID: 26a7f20d-170f-462e-9658-434f6a797ab7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:29 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:28 +0000
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
Subject: [PATCH 062/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_FCRYPT crypto
Date: Thu, 12 Feb 2026 02:46:38 +0000
Message-ID: <20260212024725.11264-63-wanjay@amazon.com>
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
X-CRM114-CacheID: sfid-20260211_190330_359272_AD540562 
X-CRM114-Status: GOOD (  10.74  )
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
CONFIG_CRYPTO_FCRYPT-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/fcrypt.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 05fdb0e2f1be..84dff7084f71 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -127,7 +127,7 @@ CFLAGS_aegis128-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)
 crypto-objs-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
 crypto-objs-$(CONFIG_CRYPTO_DES) += des_generic.o
-obj-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
+crypto-objs-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
 obj-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
 obj-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
 obj-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
diff --git a/crypto/fcrypt.c b/crypto/fcrypt.c
index 80036835cec5..f1c9ae91d4b5 100644
--- a/crypto/fcrypt.c
+++ b/crypto/fcrypt.c
@@ -411,8 +411,8 @@ static void __exit fcrypt_mod_fini(void)
 	crypto_unregister_alg(&fcrypt_alg);
 }
 
-module_init(fcrypt_mod_init);
-module_exit(fcrypt_mod_fini);
+crypto_module_init(fcrypt_mod_init);
+crypto_module_exit(fcrypt_mod_fini);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("FCrypt Cipher Algorithm");
-- 
2.47.3


