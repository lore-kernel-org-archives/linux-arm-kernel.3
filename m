Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471EEEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObrnNwKgvBVT1qOLixa6iU3SVBsh83IAm47IsCVBx9c=; b=dfxQzN+rfF4H6jSOBBKDRNjuIX
	J/NQ4HOLvJJ5i1CgvS8PKfloXMWsx9nIJGZ6ZOl87RTxLujoBrPUPmcszUciAl7s5P8ymi7HN9c40
	y+B/CArayu9ogDv4eaJrR9Y9wZXWOX4cjDbQBE6eqQZS3UuhIeHPHrBTP0gEE8BJLxROcuN/0UVly
	MqsdkX9DCDqnQgPH7rErfAU9Uy1UUuT5sQnusmaGG0pzNQ/6/o2pye+Q4WeQmUxnePBIKczLmCSRs
	rW7NR+Gh1AhgtOIEyX9AQD6NVtW6QRNLVwMe+AtrfkxRLfuzAVNXw1PFbaXdSNiV/U1xlWyM8++Re
	7WIQvNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMnO-00000001NXL-0UVf;
	Thu, 12 Feb 2026 02:51:10 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMnJ-00000001NVO-0ctl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864665; x=1802400665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ObrnNwKgvBVT1qOLixa6iU3SVBsh83IAm47IsCVBx9c=;
  b=GSN5Kxs2MN2fCOfnnv3611sxvpWrxyqOkJw+dR6/m8H/+8tAzMG2KW7K
   QGuEZ/EK4SPkQjRPFqZWsD8UsNQ0nHW5sJiSPtvXecVqgn3I+cGYqlyiD
   SKuerPDRUXpeGU1/DvMZscOEDxH7P6zJQYaS5qndiPXezJfHG4gdiRjAk
   q+gqxuQfzX2FD9oAXPtyUOC6/CaYkoKPBB2D+8nIv1anAkrYwIXVhrnGy
   YSDbkjiV5LeGz6VHvJjql+rznonrB0emiP4cMM4XxS87K44jf23io0zKk
   xSkXwtUzBsdRt8Y8KlvmJeT3Vy1oQv76G8uY1kyfkSTqXkrmT2N7C+Cpm
   Q==;
X-CSE-ConnectionGUID: DhkAt3PJRZijzPiRQDargA==
X-CSE-MsgGUID: bX5fTuB6QvSwC8fIylEgyw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12454828"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:51:04 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:27605]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id 709cb468-4e01-4eab-bb04-e49139add5d0; Thu, 12 Feb 2026 02:51:04 +0000 (UTC)
X-Farcaster-Flow-ID: 709cb468-4e01-4eab-bb04-e49139add5d0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:04 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:51:03 +0000
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
Subject: [PATCH 014/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_MANAGER2 crypto
Date: Thu, 12 Feb 2026 02:45:50 +0000
Message-ID: <20260212024725.11264-15-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D037UWB004.ant.amazon.com (10.13.138.84) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185105_243593_B2A4C395 
X-CRM114-Status: GOOD (  14.73  )
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
CONFIG_CRYPTO_MANAGER2-related crypto to convert them into pluggable
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
 crypto/Makefile              |  2 +-
 crypto/algboss.c             |  4 ++--
 crypto/fips140/fips140-api.c | 11 +++++++++++
 crypto/internal.h            |  3 ++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index e940f9ed357d..10cf1c6991fa 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -70,7 +70,7 @@ crypto-objs-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
 
 cryptomgr-y := algboss.o testmgr.o
 
-obj-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
+crypto-objs-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
 obj-$(CONFIG_CRYPTO_USER) += crypto_user.o
 obj-$(CONFIG_CRYPTO_CMAC) += cmac.o
 obj-$(CONFIG_CRYPTO_HMAC) += hmac.o
diff --git a/crypto/algboss.c b/crypto/algboss.c
index 846f586889ee..1c26524e2541 100644
--- a/crypto/algboss.c
+++ b/crypto/algboss.c
@@ -247,8 +247,8 @@ static void __exit cryptomgr_exit(void)
 	BUG_ON(err);
 }
 
-module_init(cryptomgr_init);
-module_exit(cryptomgr_exit);
+crypto_module_init(cryptomgr_init);
+crypto_module_exit(cryptomgr_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Crypto Algorithm Manager");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 9a9c66cc1d90..17e03d4c1c9a 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -357,4 +357,15 @@ DEFINE_CRYPTO_API_STUB(crypto_unregister_scomp);
 DEFINE_CRYPTO_API_STUB(crypto_register_scomps);
 DEFINE_CRYPTO_API_STUB(crypto_unregister_scomps);
 
+#endif
+
+/*
+ * crypto/testmgr.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_MANAGER2)
+
+#include <crypto/internal.h>
+
+DEFINE_CRYPTO_API_STUB(alg_test);
+
 #endif
\ No newline at end of file
diff --git a/crypto/internal.h b/crypto/internal.h
index 8ebe4dc336bc..0296d9830c62 100644
--- a/crypto/internal.h
+++ b/crypto/internal.h
@@ -8,6 +8,7 @@
 #ifndef _CRYPTO_INTERNAL_H
 #define _CRYPTO_INTERNAL_H
 
+#include <crypto/api.h>
 #include <crypto/algapi.h>
 #include <linux/completion.h>
 #include <linux/err.h>
@@ -65,7 +66,7 @@ extern struct rw_semaphore crypto_alg_sem;
 extern struct list_head crypto_alg_list __guarded_by(&crypto_alg_sem);
 extern struct blocking_notifier_head crypto_chain;
 
-int alg_test(const char *driver, const char *alg, u32 type, u32 mask);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_MANAGER2, alg_test, int, (const char *driver, const char *alg, u32 type, u32 mask), (driver, alg, type, mask));
 
 #if !IS_BUILTIN(CONFIG_CRYPTO_ALGAPI) || !IS_ENABLED(CONFIG_CRYPTO_SELFTESTS)
 static inline bool crypto_boot_test_finished(void)
-- 
2.47.3


