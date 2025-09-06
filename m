Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00230CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 22:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkCfNQSMCduwcUT3pMyREmC3tJV9XQ6M4+jKDSwW4KA=; b=3bIWKnCGZ0j9nC3vDOFRdFMxJs
	aqyfcJ/qjIRC1G/nUzi3AYG4lvaisbN1sFxX74Q2QIjsiOWxivnOlj61O14tc3+A/VqDKUVBp0PPF
	LfWbFd9uSuduADIinaKbOG3VyUJ/dXEhGoTPPSJydBGGtaIxMwcQEsHtAIppVv0lM64rT+F9YCQsC
	NJ43Bi+CcWufBoO33kBJeo+L2wSK1cRJZD6wCnlu0AOSELyalQeIK7+IzMVk19fhAtRguNy/Ukgar
	MtD6qP6G13JbIWAVm8dDl6hOb+1NNw3vBepgZzEfBPe4uP/rkmO7fArUbP9PHod5W0e3hOZN1n4y8
	Z/CoGvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv12I-00000008Yot-2mIf;
	Sat, 06 Sep 2025 22:05:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0an-00000008VAJ-2wuK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6ACA04523C;
	Sat,  6 Sep 2025 21:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9174EC4CEF5;
	Sat,  6 Sep 2025 21:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194625;
	bh=CQJ4knDhIHFMSRh4/nbpAJJmql9MOH99GJgLFyWdS58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vC0Kr4aV2MDmbVpnymLdTPEZrGi3BkuR7l6W7PpSF5Hy0JlNrPuytbWgARqDEFWa4
	 ksLj7ObBc4HIiTFQnpZraghc+4ZAxZ7ioXuydpWTZ4MELVghPd1RD7aXGCEXCeaOW1
	 87lHedKJzwLvy+1jTtDOo8Q2kz37c7gTztVpg1RWvKqgWwEevXx4sJ2+upJpJHZY21
	 91QIKZ38fMjYyYaN9kYVmNqvpfM9y0gmOPzDzCCtqlbTDpSpjNvuyV5+kz2arf0ZSP
	 HiDCrFyj6R3DHGrZyUbp9crRNTK2/izTBCE0rBrWam6dUR+XIEPQqJFToXJz3e6yqz
	 BuxmwJBc/SW1Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 09/12] lib/crypto: curve25519: Move a couple functions out-of-line
Date: Sat,  6 Sep 2025 14:35:20 -0700
Message-ID: <20250906213523.84915-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_143705_796054_9EF6C383 
X-CRM114-Status: GOOD (  11.36  )
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

Move curve25519() and curve25519_generate_public() from curve25519.h to
curve25519.c.  There's no good reason for them to be inline.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/curve25519.h | 28 +++-------------------------
 lib/crypto/curve25519.c     | 34 +++++++++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 26 deletions(-)

diff --git a/include/crypto/curve25519.h b/include/crypto/curve25519.h
index 4e6dc840b1592..78aa5f28c847f 100644
--- a/include/crypto/curve25519.h
+++ b/include/crypto/curve25519.h
@@ -4,11 +4,10 @@
  */
 
 #ifndef CURVE25519_H
 #define CURVE25519_H
 
-#include <crypto/algapi.h> // For crypto_memneq.
 #include <linux/types.h>
 #include <linux/random.h>
 
 enum curve25519_lengths {
 	CURVE25519_KEY_SIZE = 32
@@ -26,37 +25,16 @@ void curve25519_arch(u8 out[CURVE25519_KEY_SIZE],
 		     const u8 point[CURVE25519_KEY_SIZE]);
 
 void curve25519_base_arch(u8 pub[CURVE25519_KEY_SIZE],
 			  const u8 secret[CURVE25519_KEY_SIZE]);
 
-static inline
 bool __must_check curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
 			     const u8 secret[CURVE25519_KEY_SIZE],
-			     const u8 basepoint[CURVE25519_KEY_SIZE])
-{
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
-		curve25519_arch(mypublic, secret, basepoint);
-	else
-		curve25519_generic(mypublic, secret, basepoint);
-	return crypto_memneq(mypublic, curve25519_null_point,
-			     CURVE25519_KEY_SIZE);
-}
+			     const u8 basepoint[CURVE25519_KEY_SIZE]);
 
-static inline bool
-__must_check curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
-					const u8 secret[CURVE25519_KEY_SIZE])
-{
-	if (unlikely(!crypto_memneq(secret, curve25519_null_point,
-				    CURVE25519_KEY_SIZE)))
-		return false;
-
-	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
-		curve25519_base_arch(pub, secret);
-	else
-		curve25519_generic(pub, secret, curve25519_base_point);
-	return crypto_memneq(pub, curve25519_null_point, CURVE25519_KEY_SIZE);
-}
+bool __must_check curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
+					     const u8 secret[CURVE25519_KEY_SIZE]);
 
 static inline void curve25519_clamp_secret(u8 secret[CURVE25519_KEY_SIZE])
 {
 	secret[0] &= 248;
 	secret[31] = (secret[31] & 127) | 64;
diff --git a/lib/crypto/curve25519.c b/lib/crypto/curve25519.c
index 25f16777865bf..1b786389d714a 100644
--- a/lib/crypto/curve25519.c
+++ b/lib/crypto/curve25519.c
@@ -8,12 +8,44 @@
  *
  * Information: https://cr.yp.to/ecdh.html
  */
 
 #include <crypto/curve25519.h>
-#include <linux/module.h>
+#include <crypto/utils.h>
+#include <linux/export.h>
 #include <linux/init.h>
+#include <linux/module.h>
+
+bool __must_check
+curve25519(u8 mypublic[CURVE25519_KEY_SIZE],
+	   const u8 secret[CURVE25519_KEY_SIZE],
+	   const u8 basepoint[CURVE25519_KEY_SIZE])
+{
+	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
+		curve25519_arch(mypublic, secret, basepoint);
+	else
+		curve25519_generic(mypublic, secret, basepoint);
+	return crypto_memneq(mypublic, curve25519_null_point,
+			     CURVE25519_KEY_SIZE);
+}
+EXPORT_SYMBOL(curve25519);
+
+bool __must_check
+curve25519_generate_public(u8 pub[CURVE25519_KEY_SIZE],
+			   const u8 secret[CURVE25519_KEY_SIZE])
+{
+	if (unlikely(!crypto_memneq(secret, curve25519_null_point,
+				    CURVE25519_KEY_SIZE)))
+		return false;
+
+	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CURVE25519))
+		curve25519_base_arch(pub, secret);
+	else
+		curve25519_generic(pub, secret, curve25519_base_point);
+	return crypto_memneq(pub, curve25519_null_point, CURVE25519_KEY_SIZE);
+}
+EXPORT_SYMBOL(curve25519_generate_public);
 
 static int __init curve25519_init(void)
 {
 	return 0;
 }
-- 
2.50.1


