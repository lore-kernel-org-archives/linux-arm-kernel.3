Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0A9EDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9y+iYdUq+u5qbwmOO4BGZaf5PyftfuT4Y2o/ZY6WxE=; b=a5hKyndtSgTDFJkKTahN4ujlJ/
	5RJ+WqtGBC9EQmGPO+Y4eRH3hPIXrG9LrNHINtFrsHJaWaACOhA76mBAKA0z+xiMk/S6kEn1IDi6g
	EaPKtLnCVqGd8TBqilPYpeKnio+LvLWT5Gal5nX/fVpsvutiAoBMSbBQelUQ9HJ4rg809tEoUgoL+
	BeYyXyWS5kHnWX4vRXkeww3PVqY3GVzi5AvsRG+pI7vPlSftT+TEwqkyMJTrprshc5wnG2I4AnEJQ
	/+hWIIqryIb+NoCWMC1MbhmgC60CpOr3pV2f1SE+uvPTJswK1Upuv88qlvT8xRqh0YHOSvq3D21zj
	SGDv1BUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN79-00000001Vlv-1Ldt;
	Thu, 12 Feb 2026 03:11:35 +0000
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.13.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN77-00000001Vkb-2BHX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865893; x=1802401893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v9y+iYdUq+u5qbwmOO4BGZaf5PyftfuT4Y2o/ZY6WxE=;
  b=SGt127E56SB47OA11koJtZIwW0esyCMAKioCLcjcR8gZV3zJ3SdJSH39
   KkV0a3vY3eMhTnTMBmxy8umjDEcxr/a37P7NnHbYpzBpOx1H+NYRHuN6F
   IsqrMsLLW2MKMdgnw9pNG1oZMw62QUrPSULkf3sw+2o6l06VHvQwXW3FW
   VmUx1hRwoySd6Fu4br++Z5A8Mi8LGHssi5YdddEe6NU5rDAC6gg7co5jf
   6ghGyri+9KAkESzvXHzVu5XG13eGK+78j5hJCM4d/PvdBwYsh6aJc1uD3
   sKcGCCHpWiO7HvzSJsWAo634oh6zGFEEd6KXnhNJKaZeLRaJjfvx8ix3D
   A==;
X-CSE-ConnectionGUID: zcksdY7eSiOWHvTvVWfLfw==
X-CSE-MsgGUID: k/+9mgozSXmbG3kM9R8kPw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918423"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:11:32 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:6718]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 259bb3e1-9ae2-44b1-9200-a816fa42078f; Thu, 12 Feb 2026 03:11:32 +0000 (UTC)
X-Farcaster-Flow-ID: 259bb3e1-9ae2-44b1-9200-a816fa42078f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:31 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:30 +0000
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
Subject: [PATCH 093/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_XOR_BLOCKS crypto
Date: Thu, 12 Feb 2026 02:47:09 +0000
Message-ID: <20260212024725.11264-94-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191133_678154_A266CB3C 
X-CRM114-Status: GOOD (  11.81  )
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
CONFIG_XOR_BLOCKS-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/fips140/fips140-api.c | 10 ++++++++++
 crypto/xor.c                 |  4 ++--
 include/linux/raid/xor.h     |  7 +++++--
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index dc70a464fc1a..29e674c1f2ad 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -196,7 +196,7 @@ crypto-objs-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
 #
 # generic algorithms and the async_tx api
 #
-obj-$(CONFIG_XOR_BLOCKS) += xor.o
+crypto-objs-$(CONFIG_XOR_BLOCKS) += xor.o
 obj-$(CONFIG_ASYNC_CORE) += async_tx/
 obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys/
 crypto_simd-y := simd.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 298ab496a395..5bcfc1a3cc7e 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -784,6 +784,16 @@ DEFINE_CRYPTO_API_STUB(aria_decrypt);
 
 DEFINE_CRYPTO_API_STUB(crypto_krb5enc_extractkeys);
 
+#endif
+/*
+ * crypto/xor.c
+ */
+#if IS_BUILTIN(CONFIG_XOR_BLOCKS)
+
+#include <linux/raid/xor.h>
+
+DEFINE_CRYPTO_API_STUB(xor_blocks);
+
 #endif
 /*
  * crypto/ecdh_helper.c
diff --git a/crypto/xor.c b/crypto/xor.c
index f39621a57bb3..a6b4e3b88f67 100644
--- a/crypto/xor.c
+++ b/crypto/xor.c
@@ -170,5 +170,5 @@ MODULE_LICENSE("GPL");
 core_initcall(register_xor_blocks);
 #endif
 
-module_init(calibrate_xor_blocks);
-module_exit(xor_exit);
+crypto_module_init(calibrate_xor_blocks);
+crypto_module_exit(xor_exit);
diff --git a/include/linux/raid/xor.h b/include/linux/raid/xor.h
index 51b811b62322..df8797d00b78 100644
--- a/include/linux/raid/xor.h
+++ b/include/linux/raid/xor.h
@@ -2,10 +2,13 @@
 #ifndef _XOR_H
 #define _XOR_H
 
+#include <crypto/api.h>
+
 #define MAX_XOR_BLOCKS 4
 
-extern void xor_blocks(unsigned int count, unsigned int bytes,
-	void *dest, void **srcs);
+DECLARE_CRYPTO_API(CONFIG_XOR_BLOCKS, xor_blocks, void,
+	(unsigned int count, unsigned int bytes, void *dest, void **srcs),
+	(count, bytes, dest, srcs));
 
 struct xor_block_template {
         struct xor_block_template *next;
-- 
2.47.3


