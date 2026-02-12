Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021A4EDF022
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHNtR/7QmTtVnnCUoECKwYmPTr1Y+/bXdGh1XWQ/a9c=; b=otK0gQMbrA8dz2zNQEklw3LKHN
	pf7TzjeNpTIwgMyrD6Wbv2rHCrhumj/SqBEXqFnvBy9+urggYUgP/6bQWnwX0bs7I3C1U+cnIyst2
	mIRGHER9SnQMZ1Q4ZVglqbE82SQMwleMZy43GAB0JaKspSU/+MmytuZgomhe+nC0zcj74v4bsLZK0
	4gSg582ZX703017kuBJSOLuqO23/eYnku34JedTWzWBJunRrteXi+uFJzA8TfYfPtVGSJk8x2H4k2
	FweLBaIo+bIInHleo0MVBwi25VRLUUmK6TMsj/pVNOxEp3mVd9NnMduY2ZPmdmuZiv7k6oI1GplVo
	3pMPmMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMzd-00000001Sdj-0pp2;
	Thu, 12 Feb 2026 03:03:49 +0000
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.1.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMzZ-00000001ScF-331A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865425; x=1802401425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UHNtR/7QmTtVnnCUoECKwYmPTr1Y+/bXdGh1XWQ/a9c=;
  b=PyTlnW6irp95yBYkVEzjtKStQWqu2+C5kL9e1foSpNGuz1up4n6tG4Qn
   JO571s+/OwuutDnz7L7klMjSKrkLUu1mZLs+PAZHla/6vlO+u+LxYHgaf
   +UHq4J5reaQ6OlUJCM404yPRD/hWNidMlTJojIryH8BAsCyykhVyirS4p
   /RUVRbYg6zCa172i93B+HKqtIFskVqSDo1TnacoyI3c/fpfFy64+d3It/
   n+IuAiTN/pxEz/E3XaCgHwzKotApylzUtwvfHZl5jhAuP5N9A/8NbpQQA
   TvB3fLhTVc2iWR5+3pfZxRpipWvD04v+OnPdalZS0eYKseTqB6dMERG/C
   w==;
X-CSE-ConnectionGUID: Ke5dWnhcTiGEXnO/dKWRpA==
X-CSE-MsgGUID: LsFdnx7CQuuTxWP814qExQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12919329"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:03:45 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:9588]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id 8f779d84-4316-482a-8876-b63bf89d9abe; Thu, 12 Feb 2026 03:03:45 +0000 (UTC)
X-Farcaster-Flow-ID: 8f779d84-4316-482a-8876-b63bf89d9abe
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:44 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:03:44 +0000
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
Subject: [PATCH 063/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_BLOWFISH and CONFIG_CRYPTO_BLOWFISH_COMMON crypto
Date: Thu, 12 Feb 2026 02:46:39 +0000
Message-ID: <20260212024725.11264-64-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D046UWB001.ant.amazon.com (10.13.139.187) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190346_779420_10B34D51 
X-CRM114-Status: GOOD (  11.69  )
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
CONFIG_CRYPTO_BLOWFISH- and CONFIG_CRYPTO_BLOWFISH_COMMON-related crypto
to convert them into pluggable interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  4 ++--
 crypto/blowfish_generic.c    |  4 ++--
 crypto/fips140/fips140-api.c | 10 ++++++++++
 include/crypto/blowfish.h    |  6 ++++--
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 84dff7084f71..795c76357bff 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -128,8 +128,8 @@ crypto-objs-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
 crypto-objs-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
 crypto-objs-$(CONFIG_CRYPTO_DES) += des_generic.o
 crypto-objs-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
-obj-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
-obj-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
+crypto-objs-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
+crypto-objs-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
 obj-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
 obj-$(CONFIG_CRYPTO_TWOFISH_COMMON) += twofish_common.o
 obj-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
diff --git a/crypto/blowfish_generic.c b/crypto/blowfish_generic.c
index f3c5f9b09850..8a0390b14867 100644
--- a/crypto/blowfish_generic.c
+++ b/crypto/blowfish_generic.c
@@ -124,8 +124,8 @@ static void __exit blowfish_mod_fini(void)
 	crypto_unregister_alg(&alg);
 }
 
-module_init(blowfish_mod_init);
-module_exit(blowfish_mod_fini);
+crypto_module_init(blowfish_mod_init);
+crypto_module_exit(blowfish_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Blowfish Cipher Algorithm");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 1452439319cc..61f7884d0f34 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -644,3 +644,13 @@ DEFINE_CRYPTO_API_STUB(cryptd_aead_queued);
 DEFINE_CRYPTO_API_STUB(cryptd_free_aead);
 
 #endif
+/*
+ * crypto/blowfish_common.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_BLOWFISH_COMMON)
+
+#include <crypto/blowfish.h>
+
+DEFINE_CRYPTO_API_STUB(blowfish_setkey);
+
+#endif
diff --git a/include/crypto/blowfish.h b/include/crypto/blowfish.h
index 9b384670b356..46e42a89bdf9 100644
--- a/include/crypto/blowfish.h
+++ b/include/crypto/blowfish.h
@@ -6,6 +6,7 @@
 #ifndef _CRYPTO_BLOWFISH_H
 #define _CRYPTO_BLOWFISH_H
 
+#include <crypto/api.h>
 #include <linux/types.h>
 #include <linux/crypto.h>
 
@@ -18,7 +19,8 @@ struct bf_ctx {
 	u32 s[1024];
 };
 
-int blowfish_setkey(struct crypto_tfm *tfm, const u8 *key,
-		    unsigned int key_len);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_BLOWFISH_COMMON, blowfish_setkey, int,
+	(struct crypto_tfm *tfm, const u8 *key, unsigned int key_len),
+	(tfm, key, key_len));
 
 #endif
-- 
2.47.3


