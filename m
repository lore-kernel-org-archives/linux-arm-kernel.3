Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91E8EDF023
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8bcaqST4sT4ka4W2kdwlqwU26a79PQUu0UVPZFgKms=; b=L5x7vKnSndakW9DupG2FnWAuzd
	zwOc+1gZ9tOukuqxgfREBSwuPRrJxpKEvEFWNgWAe65iuHy3sdbHaq+7ecOuoTNnmmu2JzsyI5Sfi
	N9B2miyf1G94eC/gNrsd1ek9NnJQaJ0hdOSTd2UgNL512+FCZTnYY7LcxQu6je66Z5WbQHn0Z5147
	8ZDYgK2aapJ2HpxdqDOIrm4BRhLNyziNhDn6ieEvZ6KDdapRkI8hppS/uveU460qucc6Dd6wNE+dc
	0ga3Gn/ePYghxFRNB1hHXXQm7vDUjF/nn6pXLMUPDkZjGccLUYVz9pBP3KAzq5UzL/pjlXEc63uXI
	K5rxoxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN6g-00000001VZ2-45et;
	Thu, 12 Feb 2026 03:11:07 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN6b-00000001VWL-0GxE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865861; x=1802401861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D8bcaqST4sT4ka4W2kdwlqwU26a79PQUu0UVPZFgKms=;
  b=a+ocsh5YnbSLWAOx5L80VHiJapeWs7E658i6vxDh/9yD4K0f5O8Pl5g8
   Pn/TGHt3hSMp9ImRn+SS51mfl3DImJH2xh0Mn3uW8+YCo3u5w9GTaK2a5
   Wb/32ldhG2ucAmApYty7Fd8Ys/2INaWMpc1R+Ux27kfdbMBh4TAd0azlE
   Aygos/LhvN8CmbTayhhr7paenIextPpOyoFsIZpy1P/8uSBxr34RUQUoA
   /2sa0Kb2RLXiU85ISRuKLSIefc1DLRl+j1pV6MQQtQL/DFCZUxCUcWDsx
   3WQ5vVXXtBkO3e3PETQs736TZ5G80NfCgJMtB2J9MVZhX31s1tNaJugRi
   Q==;
X-CSE-ConnectionGUID: /MRZWbgRRSeXxs1knJCqwA==
X-CSE-MsgGUID: L/0FLelGS0CSfdWWfo/LRA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12918811"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:11:00 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:14512]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 3015654e-2db3-4441-95bf-57da6a2d7a1a; Thu, 12 Feb 2026 03:11:00 +0000 (UTC)
X-Farcaster-Flow-ID: 3015654e-2db3-4441-95bf-57da6a2d7a1a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:11:00 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:10:59 +0000
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
Subject: [PATCH 091/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_ECDH crypto
Date: Thu, 12 Feb 2026 02:47:07 +0000
Message-ID: <20260212024725.11264-92-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D033UWA003.ant.amazon.com (10.13.139.42) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_191101_756116_244CD587 
X-CRM114-Status: GOOD (  15.79  )
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
CONFIG_CRYPTO_ECDH-related crypto to convert them into pluggable
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
 crypto/ecdh.c                |  4 ++--
 crypto/fips140/fips140-api.c | 12 ++++++++++++
 include/crypto/ecdh.h        | 14 +++++++++++---
 4 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 3247d53c1fc6..cdc74dcea2f1 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -183,7 +183,7 @@ crypto-objs-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
 ecdh_generic-y += ecdh.o
 ecdh_generic-y += ecdh_helper.o
-obj-$(CONFIG_CRYPTO_ECDH) += ecdh_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ECDH) += ecdh_generic.o
 
 $(obj)/ecrdsa_params.asn1.o: $(obj)/ecrdsa_params.asn1.c $(obj)/ecrdsa_params.asn1.h
 $(obj)/ecrdsa_pub_key.asn1.o: $(obj)/ecrdsa_pub_key.asn1.c $(obj)/ecrdsa_pub_key.asn1.h
diff --git a/crypto/ecdh.c b/crypto/ecdh.c
index 9f0b93b3166d..32c98cebfda6 100644
--- a/crypto/ecdh.c
+++ b/crypto/ecdh.c
@@ -240,8 +240,8 @@ static void __exit ecdh_exit(void)
 	crypto_unregister_kpp(&ecdh_nist_p384);
 }
 
-module_init(ecdh_init);
-module_exit(ecdh_exit);
+crypto_module_init(ecdh_init);
+crypto_module_exit(ecdh_exit);
 MODULE_ALIAS_CRYPTO("ecdh");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("ECDH generic algorithm");
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index 70b57939c753..298ab496a395 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -785,3 +785,15 @@ DEFINE_CRYPTO_API_STUB(aria_decrypt);
 DEFINE_CRYPTO_API_STUB(crypto_krb5enc_extractkeys);
 
 #endif
+/*
+ * crypto/ecdh_helper.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_ECDH)
+
+#include <crypto/ecdh.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_ecdh_key_len);
+DEFINE_CRYPTO_API_STUB(crypto_ecdh_encode_key);
+DEFINE_CRYPTO_API_STUB(crypto_ecdh_decode_key);
+
+#endif
\ No newline at end of file
diff --git a/include/crypto/ecdh.h b/include/crypto/ecdh.h
index 9784ecdd2fb4..03d54f531ca2 100644
--- a/include/crypto/ecdh.h
+++ b/include/crypto/ecdh.h
@@ -8,6 +8,8 @@
 #ifndef _CRYPTO_ECDH_
 #define _CRYPTO_ECDH_
 
+#include <crypto/api.h>
+
 /**
  * DOC: ECDH Helper Functions
  *
@@ -49,7 +51,9 @@ struct ecdh {
  *
  * Return: size of the key in bytes
  */
-unsigned int crypto_ecdh_key_len(const struct ecdh *params);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECDH, crypto_ecdh_key_len, unsigned int,
+	(const struct ecdh *params),
+	(params));
 
 /**
  * crypto_ecdh_encode_key() - encode the private key
@@ -64,7 +68,9 @@ unsigned int crypto_ecdh_key_len(const struct ecdh *params);
  *
  * Return:	-EINVAL if buffer has insufficient size, 0 on success
  */
-int crypto_ecdh_encode_key(char *buf, unsigned int len, const struct ecdh *p);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECDH, crypto_ecdh_encode_key, int,
+	(char *buf, unsigned int len, const struct ecdh *p),
+	(buf, len, p));
 
 /**
  * crypto_ecdh_decode_key() - decode a private key
@@ -78,6 +84,8 @@ int crypto_ecdh_encode_key(char *buf, unsigned int len, const struct ecdh *p);
  *
  * Return:	-EINVAL if buffer has insufficient size, 0 on success
  */
-int crypto_ecdh_decode_key(const char *buf, unsigned int len, struct ecdh *p);
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_ECDH, crypto_ecdh_decode_key, int,
+	(const char *buf, unsigned int len, struct ecdh *p),
+	(buf, len, p));
 
 #endif
-- 
2.47.3


