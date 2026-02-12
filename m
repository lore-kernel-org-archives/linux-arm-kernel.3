Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1609FEDF021
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 03:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6QqEkBL7DgFsxQZDQrwC/3ZGjpQLYXS1PTCxfCJq3I=; b=gRXRLci6ctv8OyyIsTZeFXhl1u
	XFNXzuU9iEeu5xbejUcJkV+N+slGD5jP6TjrcMCBOxyVOZ+o1o5DZImFFn7tfHj6LPyw486MGaP4p
	4WezPadYAMp4YdW2Vh/UM5K9J3zCwZIwvd16IZRyVuKuvM25xPgtWcF2BHa62+1o96OaXSRO6K6bG
	mm+Kw6eQsYdN+tMazxg96X5892lB5ReT40FcQ2lOOIQkYpHQ1OHxMVnrlNHh4fe/iCki8inAwoWAJ
	GXx/NqWGNuziY/8vFuVjwZviYiWa3ZQRQo8XA08BNVBpZP9OrGlpS7O+zeTkbqponBcmO4DuQ81m9
	hJ5WukiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN3s-00000001UQg-1nnm;
	Thu, 12 Feb 2026 03:08:12 +0000
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.42.203.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqN3q-00000001UPR-1WCD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 03:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770865690; x=1802401690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q6QqEkBL7DgFsxQZDQrwC/3ZGjpQLYXS1PTCxfCJq3I=;
  b=bjoHl2cECDeHQgcPAaOPjzEfdL+xgmS3Cyoj95hOzTUXE5wY7WT31LVG
   Vqfc69Lbm2oKSqepY28hQMzk6azYW5PyzUHgFlgsthAp2PpfqbZdMtj8D
   cj8ZR2sqaDaTbh+4rSr6J0Oo8+o/gdPrfrWbuJdCAAqq6DHkgntEFKHLm
   DtbQNGmpK+RSWlpaNWPPSg26s446YfKm84uNzzID/xpgaiB21BB5otL0Y
   Ino0jhuZEl9otiySf16npDOELD+KA8h7OfED7sl7Ibpz3A2UOjKlBmGEr
   tYvUZALQ0S43++SsKmG/btHXscMPJW6IT48gxCYa0C5r5/xS5hd10Ri6w
   A==;
X-CSE-ConnectionGUID: IJnGLnGSS2uS35ymSHEjsA==
X-CSE-MsgGUID: uh6X7aJgRYqtNT60kNNJnw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12913987"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:08:09 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:1536]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.39.165:2525] with esmtp (Farcaster)
 id a8ce263f-2af6-42be-aaea-cdcc071f605a; Thu, 12 Feb 2026 03:08:09 +0000 (UTC)
X-Farcaster-Flow-ID: a8ce263f-2af6-42be-aaea-cdcc071f605a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:09 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:08:08 +0000
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
Subject: [PATCH 080/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_CRYPTO_KRB5ENC crypto
Date: Thu, 12 Feb 2026 02:46:56 +0000
Message-ID: <20260212024725.11264-81-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D042UWB003.ant.amazon.com (10.13.139.135) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_190810_448746_AFF5AB26 
X-CRM114-Status: GOOD (  12.33  )
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
CONFIG_CRYPTO_KRB5ENC-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Makefile              |  2 +-
 crypto/fips140/fips140-api.c | 10 ++++++++++
 crypto/krb5enc.c             |  4 ++--
 include/crypto/authenc.h     |  6 ++++--
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/crypto/Makefile b/crypto/Makefile
index 6d332c55fd4e..61fdf39dc1ec 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -156,7 +156,7 @@ crc32c-cryptoapi-y := crc32c.o
 crypto-objs-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
 crc32-cryptoapi-y := crc32.o
 crypto-objs-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
-obj-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
+crypto-objs-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
 crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
 obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
 obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
index e6d2e3680792..70b57939c753 100644
--- a/crypto/fips140/fips140-api.c
+++ b/crypto/fips140/fips140-api.c
@@ -775,3 +775,13 @@ DEFINE_CRYPTO_API_STUB(aria_encrypt);
 DEFINE_CRYPTO_API_STUB(aria_decrypt);
 
 #endif
+/*
+ * crypto/krb5enc.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_KRB5ENC)
+
+#include <crypto/authenc.h>
+
+DEFINE_CRYPTO_API_STUB(crypto_krb5enc_extractkeys);
+
+#endif
diff --git a/crypto/krb5enc.c b/crypto/krb5enc.c
index a1de55994d92..5688f8916fd0 100644
--- a/crypto/krb5enc.c
+++ b/crypto/krb5enc.c
@@ -496,8 +496,8 @@ static void __exit crypto_krb5enc_module_exit(void)
 	crypto_unregister_template(&crypto_krb5enc_tmpl);
 }
 
-module_init(crypto_krb5enc_module_init);
-module_exit(crypto_krb5enc_module_exit);
+crypto_module_init(crypto_krb5enc_module_init);
+crypto_module_exit(crypto_krb5enc_module_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Simple AEAD wrapper for Kerberos 5 RFC3961");
diff --git a/include/crypto/authenc.h b/include/crypto/authenc.h
index 4871b7bdcd8e..710e0976b295 100644
--- a/include/crypto/authenc.h
+++ b/include/crypto/authenc.h
@@ -30,7 +30,9 @@ struct crypto_authenc_keys {
 DECLARE_CRYPTO_API(CONFIG_CRYPTO_AUTHENC, crypto_authenc_extractkeys, int,
 	(struct crypto_authenc_keys *keys, const u8 *key, unsigned int keylen),
 	(keys, key, keylen));
-int crypto_krb5enc_extractkeys(struct crypto_authenc_keys *keys, const u8 *key,
-			       unsigned int keylen);
+
+DECLARE_CRYPTO_API(CONFIG_CRYPTO_KRB5ENC, crypto_krb5enc_extractkeys, int,
+	(struct crypto_authenc_keys *keys, const u8 *key, unsigned int keylen),
+	(keys, key, keylen));
 
 #endif	/* _CRYPTO_AUTHENC_H */
-- 
2.47.3


