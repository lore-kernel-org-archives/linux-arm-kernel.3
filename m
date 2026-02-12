Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA5FEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EINF0r05fCGdozwxSs69xlxZRcrWOWG5viZG7pISjz8=; b=TwQ1o7gMmHR29hzrESOV4PeYyI
	qLsv6RgpcsXvOB4bG9KVTuMQYXIJZ65Po2V/uP8ckSQ418GN3HHDg0m9geDrtQd78P/sXu98rAoRh
	AV6FfgBc4H2zhCWk+q28eHlDOoB7IfZvMWECBluAyW9uDWbHT79XAn6sf4yxE1BHHU8rT5kNHv3QU
	rMHqUDK28z6TcBLPW1okI/Ei2bxxrrrooBzYyju9lGdpTOR89b/FSx++TD3oNQjHnqSWZBUbr9eMt
	qFDfpOvDBiuq1vG7YrFZ5UrShvMQsD69qmPSIXm6mB73NapgG33pjHH8YjuoQHuzohpcAwokAFphU
	opHO2SaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN07-00000001Srz-2Tc1;
	Thu, 12 Feb 2026 03:04:19 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN04-00000001Sq4-39Do
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865456; x=1802401456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EINF0r05fCGdozwxSs69xlxZRcrWOWG5viZG7pISjz8=;
  b=IFCmjIIyk3PPCT36dsXvjwPTd2VM1nU5D5si/6U8LC1UHU2AU+X9zgwM
   L6sWMIoqwbB/WvP7cI1tgAPuat+lPoMfhzzjEieUv2F7LMKRnwyWwzPGi
   O3HHmWs7qw3WTNjPB0OByK2ILEJ2LX5tiqlnMhaeOgUUXi3pujcktQfme
   ulZqlObfH1TzmWNMc3053dQnXXH3EENNlfz/LPZ+CDZ4im1mrwflIZM/R
   ee9d1y1f7AjQ1NrwRbDbc0i83j9IhKINp7ZdZo7LbEZyUJVrLEo14PHU7
   tk2J4Czys4r/bE251YWNIs0XEt6Kr6tvqUUhw9Jw4lmLDctOauHPzCnba
   g==;
X-CSE-ConnectionGUID: EkBT6euZSVe2RipQC++zSA==
X-CSE-MsgGUID: bpCS/gvoRQiibzFiuMZiyA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919372"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:04:16 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:5587]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id 9ec3b2db-7f8f-4dc3-8c1c-6ee7ffdafc15; Thu, 12 Feb 2026 03:04:16 +0000 (UTC)
X-Farcaster-Flow-ID: 9ec3b2db-7f8f-4dc3-8c1c-6ee7ffdafc15
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:04:15 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:04:15 +0000
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
Subject: [PATCH 065/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_TWOFISH and CONFIG_CRYPTO_TWOFISH_COMMON crypto
Date: Thu, 12 Feb 2026 02:46:41 +0000
Message-ID: <20260212024725.11264-66-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D042UWB002.ant.amazon.com (10.13.139.175) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190416_858052_415CA3D9 
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
CONFIG_CRYPTO_TWOFISH- and CONFIG_CRYPTO_TWOFISH_COMMON-related crypto
to convert them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  4 ++--
 crypto/fips140/fips140-api.c | 11 +++++++++++
 crypto/twofish_generic.c     |  4 ++--
 include/crypto/twofish.h     | 11 ++++++++---
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 326b37002e3d..e93edc49840a 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -130,8 +130,8 @@ crypto-objs-$(CONFIG_CRYPTO_DES) += des_generic.o
 crypto-objs-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
 crypto-objs-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
-obj-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
-obj-$(CONFIG_CRYPTO_TWOFISH_COMMON) += twofish_common.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_COMMON) += twofish_common.o
 obj-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
 CFLAGS_serpent_generic.o := $(call cc-option,-fsched-pressure)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
 crypto-objs-$(CONFIG_CRYPTO_AES) += aes.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 5b0ae8476ce7..9ad530743d1f 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -672,3 +672,14 @@ DEFINE_CRYPTO_API_STUB(sm4_expandkey);
 DEFINE_CRYPTO_API_STUB(sm4_crypt_block);
 
 #endif
+/*
+ * crypto/twofish_common.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_TWOFISH_COMMON)
+
+#include <crypto/twofish.h>
+
+DEFINE_CRYPTO_API_STUB(__twofish_setkey);
+DEFINE_CRYPTO_API_STUB(twofish_setkey);
+
+#endif
diff --git a/crypto/twofish_generic.c b/crypto/twofish_generic.c
index 368018cfa9bf..0d9cefa3350b 100644
--- a/crypto/twofish_generic.c
+++ b/crypto/twofish_generic.c
@@ -187,8 +187,8 @@ static void __exit twofish_mod_fini(void)
 	crypto_unregister_alg(&alg);
 }
 
-module_init(twofish_mod_init);
-module_exit(twofish_mod_fini);
+crypto_module_init(twofish_mod_init);
+crypto_module_exit(twofish_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION ("Twofish Cipher Algorithm");
diff --git a/include/crypto/twofish.h b/include/crypto/twofish.h
index f6b307a58554..4695480f5d44 100644
--- a/include/crypto/twofish.h
+++ b/include/crypto/twofish.h
@@ -2,6 +2,7 @@
 #ifndef _CRYPTO_TWOFISH_H
 #define _CRYPTO_TWOFISH_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 
 #define TF_MIN_KEY_SIZE 16
@@ -18,8 +19,12 @@ struct twofish_ctx {
 	u32 s[4][256], w[8], k[32];
 };
 
-int __twofish_setkey(struct twofish_ctx *ctx, const u8 *key,
-		     unsigned int key_len);
-int twofish_setkey(struct crypto_tfm *tfm, const u8 *key, unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_COMMON, __twofish_setkey, int,
+	(struct twofish_ctx *ctx, const u8 *key, unsigned int key_len),
+	(ctx, key, key_len));
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_TWOFISH_COMMON, twofish_setkey, int,
+	(struct crypto_tfm *tfm, const u8 *key, unsigned int key_len),
+	(tfm, key, key_len));
 
 #endif
-- 
2.47.3


