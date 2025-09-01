Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A629BCA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkCfNQSMCduwcUT3pMyREmC3tJV9XQ6M4+jKDSwW4KA=; b=MNC3z5M/mZtLoPg6Pd0em359bU
	/bcfcRD1+bcYcU5v6gP8Kw6RjDRf66iBWmIIbI8bdq7+4lw2fyaphk+T9JOXYFQZCDOcpUtxQRMI6
	UUlRXQ/tNUUIAl+TkMwUGKmoUO73v/jS7FTuZs29pUhxJWWn3nwZqbsWX89FZfznZUSH4ujnNBvl0
	17rP5JncwgX8jpzfCrav4VkFyCstG1x4R0l//aVFb1n/9RneDzlUA5QtgDIqnxJhBu4iiw3hlzy03
	wyyo1XFpW5Wh/p/IFRJpm7/P/jm2TC6kOazPL3cEHdsL2Wh93QKy+BxI4YNvRcdF9YWhDw/ZYYzBr
	RniJDYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnP-0000000EIVV-2FTw;
	Mon, 01 Sep 2025 23:18:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0i-0000000Dllh-2Rwi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Sep 2025 20:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=RkCfNQSMCduwcUT3pMyREmC3tJV9XQ6M4+jKDSwW4KA=; b=o2EC20Hk0vV2Mfl2b8hw22yplb
	nZE5sWmGF4p47XUD4V5IxU2l+3j6kjFsSVSjhZNh/MNxnZOoQyNw4OcV0SG0cC034G2jjQMVdCjzn
	17uDryjGhP17Kao50etr++dC0+o+1jeSogOkgdyw/CyD/AI4ZgEQ4PjMiQMS6+TgyMriIU2jQ8g19
	rqVPIVcG1Wf5+d/JrknNZv+zSlrmVxPgBitFEcLwEk2g8RBT+i7AYthpogWRyjPhpSAM/ERcVIgCU
	AmqMpBzYnUvCd4CynDu7b3nAFqSBSYbx8NDbBgy365SsB7lqnnix82yXXAThEhMryn4fRK53DkJoq
	WtFYnJeA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB0a-00000003rma-0ihP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 20:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6839B4519B;
	Mon,  1 Sep 2025 20:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0637DC4CEF9;
	Mon,  1 Sep 2025 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758004;
	bh=CQJ4knDhIHFMSRh4/nbpAJJmql9MOH99GJgLFyWdS58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UmTzfHJVn58a/hi+Y2BEVI/E0gwajpfj3l1+MhWb2/inRfscleDQ32kTkuenid5SL
	 K7l9t1IUSL9vIj3z1zolWo8XQdNqzsVPp/WnAil7mWZSAELJmSp0gjfmqgTRGDBfNg
	 nFSyHHMR8gXykAgVPG3TvllBPw9BSha/1ZHH7Zt/o0W/D+tde7zHFcu7NygYlnFZ9K
	 yocztZRzbyylq4hjA3CwIkGj2SsHagflp7P/Ul4KLFpCL2u8H/HVBKKXFizBMOw+UM
	 rT6byPz4yGFr78RhaZYpil4MXKPZ8g4nY0eeMsA2VyKSey4S4Glh0FyBPtDEAzKwFC
	 JjCJjJyaZxNIw==
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
Subject: [PATCH 4/6] lib/crypto: curve25519: Move a couple functions out-of-line
Date: Mon,  1 Sep 2025 13:18:13 -0700
Message-ID: <20250901201815.594177-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901201815.594177-1-ebiggers@kernel.org>
References: <20250901201815.594177-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_212011_718010_E5FF4023 
X-CRM114-Status: GOOD (  11.84  )
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


