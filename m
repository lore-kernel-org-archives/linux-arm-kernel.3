Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ABACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnp2uVuhR1t7ourcun8xeDvHxO825rZAiXsNIuOySiw=; b=sVlHw+vsKCK3zsHeazUQ54b0+6
	cPBHwUP3kTKfdOifz9MbRkUasNPoUabLDpQ0an0a9ysr6NDhvAIw8gEff7L6Q6Y5e0GMbAWIWc7al
	CAXQ+mTyVNn+gu10DwYJIkQ9t8Pu3pXwUXBZdBF8hw2P451/DslS9h4o00TZx8NBtPo3WQ7LGAzg+
	Y7UfW5UB3Cfc3lFCa1tanqBofoi9ifhRLpNfOFK4P4j0ulCLyxPmDVF0sEpttqmOtB2zY5OFOhIw6
	DeNpxdWSP+Yt0G+CZ2Ag/SVYekc3fN0p9c5nWQBpO4ccmYk4PgFmzAzOxvrCa933Md1x/xBwqVkbU
	9/tqFmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCthR-0000000C3Ne-2akE;
	Sun, 26 Oct 2025 05:53:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgj-0000000C2n5-3UGa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 05:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F5F744D5B;
	Sun, 26 Oct 2025 05:53:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBC1C4CEE7;
	Sun, 26 Oct 2025 05:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761457989;
	bh=J3m+RqWldOSAlbAr+elclDhB5NSc/+pHmiWDmVt7Zz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fJWEPIXQJVdiF8om1EtHzN8GX9OBPNVfzf2bgq3sTdtKwrz3f5gMcKWNV3fJW3aId
	 FQgVyV5Nq8FwB4EVlMSZ2dgwXr6JWPzyQpRysrgBNptPeidPWzySe9sCEcAzCHgd46
	 wmFyiTVTrbUTd9lnxhdBncQ6tpkZ5wwQKND0af8Oo5rpoFoPMKAY2UBbkh/ExT620y
	 mon9WeI8757GA5SKwNN9FC4UJ6gz853GlVrykUPmtNQ3pE0FwFGtVQ1lypnXh26l85
	 yY+p7BuEsxsmvbc2PS0erCbH1bB4KZYL1AigdrHD1iPXQkMHFMRXFqy4wayfpB9cJu
	 N2dD2j64H0kvQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/15] crypto: jitterentropy - Use default sha3 implementation
Date: Sat, 25 Oct 2025 22:50:30 -0700
Message-ID: <20251026055032.1413733-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251026055032.1413733-1-ebiggers@kernel.org>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_225309_944470_8CBD14E0 
X-CRM114-Status: GOOD (  16.19  )
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

Make jitterentropy use "sha3-256" instead of "sha3-256-generic", as the
ability to explicitly request the generic code is going away.  It's not
worth providing a special generic API just for jitterentropy.  There are
many other solutions available to it, such as doing more iterations or
using a more effective jitter collection method.

Moreover, the status quo is that SHA-3 is quite slow anyway.  Currently
only arm64 and s390 have architecture-optimized SHA-3 code.  I'm not
familiar with the performance of the s390 one, but the arm64 one isn't
actually that much faster than the generic code anyway.

Note that jitterentropy should just use the library API instead of
crypto_shash.  But that belongs in a separate change later.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/jitterentropy-kcapi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/crypto/jitterentropy-kcapi.c b/crypto/jitterentropy-kcapi.c
index a53de7affe8d1..7c880cf34c523 100644
--- a/crypto/jitterentropy-kcapi.c
+++ b/crypto/jitterentropy-kcapi.c
@@ -46,11 +46,11 @@
 #include <linux/time.h>
 #include <crypto/internal/rng.h>
 
 #include "jitterentropy.h"
 
-#define JENT_CONDITIONING_HASH	"sha3-256-generic"
+#define JENT_CONDITIONING_HASH	"sha3-256"
 
 /***************************************************************************
  * Helper function
  ***************************************************************************/
 
@@ -228,19 +228,11 @@ static int jent_kcapi_init(struct crypto_tfm *tfm)
 	struct shash_desc *sdesc;
 	int size, ret = 0;
 
 	spin_lock_init(&rng->jent_lock);
 
-	/*
-	 * Use SHA3-256 as conditioner. We allocate only the generic
-	 * implementation as we are not interested in high-performance. The
-	 * execution time of the SHA3 operation is measured and adds to the
-	 * Jitter RNG's unpredictable behavior. If we have a slower hash
-	 * implementation, the execution timing variations are larger. When
-	 * using a fast implementation, we would need to call it more often
-	 * as its variations are lower.
-	 */
+	/* Use SHA3-256 as conditioner */
 	hash = crypto_alloc_shash(JENT_CONDITIONING_HASH, 0, 0);
 	if (IS_ERR(hash)) {
 		pr_err("Cannot allocate conditioning digest\n");
 		return PTR_ERR(hash);
 	}
-- 
2.51.1.dirty


