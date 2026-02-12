Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6BBEDF020
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 02:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RJ5/TCPVPJGHHNbMRBx6ErQEZwdDcl8aKmYVsjiXI8=; b=zp1I4fR/eh3m7lsXV/uLjDyAcc
	RJBdfLXi5UcPO2y38l11tJ0q9QjAdwE8yrnKICHRYtunlAMzqRn+qQ8LI07qypPPis746hzg7JLHq
	lycBt+7ntIofrO24sNq7VhEl5Fp3/71IHNOhXXrGlTitq7V8vHQXg6fggYYV7eaO2X4NoIkbTbeT8
	CmuS/8NcyMzUJnHJZvjYcZesa+Z2N+sCwdI+2YkObTGS8pkmgxlKY0NFYpqGaOJiFevNqLUvYBIld
	fg9fy8E20dvV6QHSFyUy/vIYERJXGvepvZCNm4fvEjMuPVM65NeWPn/IMYTI3mp1KnCKC0oSh8fbK
	Cg7Iyvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMtL-00000001Q0m-2qR5;
	Thu, 12 Feb 2026 02:57:19 +0000
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.83.148.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqMtJ-00000001PzS-0ycV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 02:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865037; x=1802401037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1RJ5/TCPVPJGHHNbMRBx6ErQEZwdDcl8aKmYVsjiXI8=;
  b=Elo/FSmzhBqNEfi7mQ/h81rBGaZ8GM5wnyv6nLww6F/0wFv8nh52ni9+
   nenHSl4IfGWdW3qASWwmawLmLGGtPEb5ZwUMRqUdNYKzJPqq+pnVmvC2u
   fPfuFkfThcySWeC/5D/ZkaMnExCXeaB3WsIKnN6m5HPENkqnUjEApYUF5
   KSqpF0LXVGFfVFIcpVlG1bMCT9UWMY/Q9CF2hqPcxH051dLyBUAVMTvql
   XSS/KHRZSPj5t4M6LV8EJALvhkO91JBR46gGIhDevM+UJjJQ64qreEdjZ
   myC8mR2nUeOUwNJnVREbQX/lO7ynAlUxgDY2XqiBFjzRFG/UYZdwSrH+H
   Q==;
X-CSE-ConnectionGUID: PDKuFpfzTWO7uHhfS3+Qkw==
X-CSE-MsgGUID: x9imqmZlRzeKB+RD/K90pA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12696646"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:57:16 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:24712]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id 2b9aa903-573e-47ed-b479-b33bb1eba65f; Thu, 12 Feb 2026 02:57:16 +0000 (UTC)
X-Farcaster-Flow-ID: 2b9aa903-573e-47ed-b479-b33bb1eba65f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:57:16 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:57:16 +0000
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
Subject: [PATCH 038/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_DH crypto
Date: Thu, 12 Feb 2026 02:46:14 +0000
Message-ID: <20260212024725.11264-39-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWC001.ant.amazon.com (10.13.139.218) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_185717_321570_5122A54D 
X-CRM114-Status: GOOD (  14.62  )
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
CONFIG_CRYPTO_DH-related crypto to convert them into pluggable
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
 crypto/dh.c                  |  4 ++--
 crypto/fips140/fips140-api.c | 13 +++++++------
 include/crypto/dh.h          | 14 +++++++++++---
 4 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 42b45a8941b4..7b1188d5d953 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -40,7 +40,7 @@ crypto-objs-$(CONFIG_CRYPTO_HKDF) += hkdf.o
 
 dh_generic-y := dh.o
 dh_generic-y += dh_helper.o
-obj-$(CONFIG_CRYPTO_DH) += dh_generic.o
+crypto-objs-$(CONFIG_CRYPTO_DH) += dh_generic.o
 
 $(obj)/rsapubkey.asn1.o: $(obj)/rsapubkey.asn1.c $(obj)/rsapubkey.asn1.h
 $(obj)/rsaprivkey.asn1.o: $(obj)/rsaprivkey.asn1.c $(obj)/rsaprivkey.asn1.h
diff --git a/crypto/dh.c b/crypto/dh.c
index 8250eeeebd0f..5eacd5a4a92a 100644
--- a/crypto/dh.c
+++ b/crypto/dh.c
@@ -920,8 +920,8 @@ static void __exit dh_exit(void)
 	crypto_unregister_kpp(&dh);
 }
 
-module_init(dh_init);
-module_exit(dh_exit);
+crypto_module_init(dh_init);
+crypto_module_exit(dh_exit);
 MODULE_ALIAS_CRYPTO("dh");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("DH generic algorithm");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 8db92603bd59..0b1794340b77 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -578,13 +578,14 @@ DEFINE_CRYPTO_API_STUB(hkdf_expand);
 
 #endif
 /*
- * crypto/hkdf.c
+ * crypto/dh_helper.c
  */
-#if IS_BUILTIN(CONFIG_CRYPTO_HKDF)
+#if IS_BUILTIN(CONFIG_CRYPTO_DH)
 
-#include <crypto/hkdf.h>
+#include <crypto/dh.h>
 
-DEFINE_CRYPTO_API_STUB(hkdf_extract);
-DEFINE_CRYPTO_API_STUB(hkdf_expand);
+DEFINE_CRYPTO_API_STUB(crypto_dh_key_len);
+DEFINE_CRYPTO_API_STUB(crypto_dh_encode_key);
+DEFINE_CRYPTO_API_STUB(crypto_dh_decode_key);
 
-#endif
\ No newline at end of file
+#endif
diff --git a/include/crypto/dh.h b/include/crypto/dh.h
index 7b863e911cb4..08d74c548535 100644
--- a/include/crypto/dh.h
+++ b/include/crypto/dh.h
@@ -8,6 +8,8 @@
 #ifndef _CRYPTO_DH_
 #define _CRYPTO_DH_
 
+#include <crypto/api.h>
+
 /**
  * DOC: DH Helper Functions
  *
@@ -48,7 +50,9 @@ struct dh {
  *
  * Return: size of the key in bytes
  */
-unsigned int crypto_dh_key_len(const struct dh *params);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_DH, crypto_dh_key_len, unsigned int,
+	(const struct dh *params),
+	(params));
 
 /**
  * crypto_dh_encode_key() - encode the private key
@@ -63,7 +67,9 @@ unsigned int crypto_dh_key_len(const struct dh *params);
  *
  * Return:	-EINVAL if buffer has insufficient size, 0 on success
  */
-int crypto_dh_encode_key(char *buf, unsigned int len, const struct dh *params);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_DH, crypto_dh_encode_key, int,
+	(char *buf, unsigned int len, const struct dh *params),
+	(buf, len, params));
 
 /**
  * crypto_dh_decode_key() - decode a private key
@@ -77,7 +83,9 @@ int crypto_dh_encode_key(char *buf, unsigned int len, const struct dh *params);
  *
  * Return:	-EINVAL if buffer has insufficient size, 0 on success
  */
-int crypto_dh_decode_key(const char *buf, unsigned int len, struct dh *params);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_DH, crypto_dh_decode_key, int,
+	(const char *buf, unsigned int len, struct dh *params),
+	(buf, len, params));
 
 /**
  * __crypto_dh_decode_key() - decode a private key without parameter checks
-- 
2.47.3


