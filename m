Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D72EDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PooI7hlgZLR+IQB4TgRDtdyU3XZA0Ua3ZFUPe1/xEyA=; b=zK4Fd3SPXaBJAUYwX3nH8dzikD
	0qU1ZEfbFushIeAXTBuN1kIdnSKI0XocggLyj0qbKwvNTosAfOuS8CbKyJr6Z54FcuSeZZgZHUjfX
	RTfzHaepWOkFhrzfo7K2K8qTPM9GZifh4WAlBnydJU5vb2JQLsShvcUyyazVUrbQf4LcdIyuS82hY
	lGlNQeQOgOJvIIeLPsZR4sZnJ+afWz8U/wrRlWVa8xUvrO2zevxzqxHBCvS7MyrOr7LmZ/K0Me9yw
	AS8OGg3du0rrfZovdsEKM2A3oMCbJmdshzn9PBb/y1cVWKqOE9WeEY8ZKWX24T3hmwJ4yGQMQxRvW
	rDDZCJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMvA-00000001QlX-0Eu2;
	Thu, 12 Feb 2026 02:59:12 +0000
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.246.77.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMv7-00000001Qka-24bW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865149; x=1802401149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PooI7hlgZLR+IQB4TgRDtdyU3XZA0Ua3ZFUPe1/xEyA=;
  b=ImXowdOWmc8lOL1qGUpGiBv0EGqG/6BVgiwqQoKK4EU9aJhDXdnKu21g
   I0HgaMiSF5e+iKi4mN0LhKB6oh4BhWFbT1e/644+7HL+FSV5NTeOLPdSp
   63qpvmjLKZAzgjNIaISDX+3FHARjLsA8op9Rw5llvrbujtiq4+mLBpjUW
   ybpNJ+DPSxBewhBlKzdb5Jpbuis1OAXkT+14gqrkkdgRTs1uS+uKknRIG
   7PtMbvByJpVdy4lLml/AUNHjZZJiW+B7M9imZS0eLi5Z29qZq1Z80I8xa
   6hJrrm4OqbDq62gsGAFdZtCbFbh3PGZgdwnoYNTbD2xwwQAf9Cg3lyqXE
   w==;
X-CSE-ConnectionGUID: 8oP4MU7SRRqwQazyVfd8XA==
X-CSE-MsgGUID: 4T/CMZOpSuOs+H7WgXGqOw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12914600"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:59:08 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:19076]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id a87abc65-028d-4053-aaaa-8c6744364d89; Thu, 12 Feb 2026 02:59:08 +0000 (UTC)
X-Farcaster-Flow-ID: a87abc65-028d-4053-aaaa-8c6744364d89
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:59:05 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:59:04 +0000
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
Subject: [PATCH 045/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_SHA1 crypto
Date: Thu, 12 Feb 2026 02:46:21 +0000
Message-ID: <20260212024725.11264-46-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D044UWA002.ant.amazon.com (10.13.139.11) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185910_009387_75A74CE9 
X-CRM114-Status: GOOD (  11.58  )
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
CONFIG_CRYPTO_SHA1-related crypto to convert them into pluggable
interface.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile | 2 +-
 crypto/sha1.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 45f0ae639ccd..ba7bc1e3a65a 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -79,7 +79,7 @@ crypto-objs-$(CONFIG_CRYPTO_NULL) += crypto_null.o
 crypto-objs-$(CONFIG_CRYPTO_MD4) += md4.o
 crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
 crypto-objs-$(CONFIG_CRYPTO_RMD160) += rmd160.o
-obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
+crypto-objs-$(CONFIG_CRYPTO_SHA1) += sha1.o
 crypto-objs-$(CONFIG_CRYPTO_SHA256) += sha256.o
 crypto-objs-$(CONFIG_CRYPTO_SHA512) += sha512.o
 crypto-objs-$(CONFIG_CRYPTO_SHA3) += sha3.o
diff --git a/crypto/sha1.c b/crypto/sha1.c
index 4fbf61cf0370..fe7028d018a8 100644
--- a/crypto/sha1.c
+++ b/crypto/sha1.c
@@ -223,13 +223,13 @@ static int __init crypto_sha1_mod_init(void)
 {
 	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
 }
-module_init(crypto_sha1_mod_init);
+crypto_module_init(crypto_sha1_mod_init);
 
 static void __exit crypto_sha1_mod_exit(void)
 {
 	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
 }
-module_exit(crypto_sha1_mod_exit);
+crypto_module_exit(crypto_sha1_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Crypto API support for SHA-1 and HMAC-SHA1");
-- 
2.47.3


