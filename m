Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7E5CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2dzn/u327kMlDGEaPO2nM9P4HDSsVjwZNcpdrm5Z/c=; b=YFpYtR0LxACJ5vwlV8w/rrgRK5
	KtVCdATTKsD3mxKRz3glzb7a0rSu+4hCR5qkb6FN9pnKrGgBlcuqap4Ph8N9POQ6tTLqiUciKm78l
	5ZKauiQE+zlVP69mc93RSzu1RKJwdCFpC0vwArlofE9myC0lT9AV0l+oxJjckF0hzoyhp7Dke293k
	TGnIwxY4gIcRYdSqScT6A9du59RqJtzVuvqvYVHGDD23jxflnwney/1P5AnqD70VDo7TwE73Ely3L
	B8slgtTesMBvxx5A1LwsDZkKiV94OJaO/o7cEwiLPKjXLdEFUoYHrOLbasEbpNpfxRlT50t3D9EJd
	t3iTescg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9h-0000000BZVN-2Hii;
	Mon, 20 Oct 2025 00:53:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9a-0000000BZPz-3eZd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C81345C19;
	Mon, 20 Oct 2025 00:53:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F10C116D0;
	Mon, 20 Oct 2025 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921618;
	bh=C2S+qsv86X6YHw0RsYoz1ghvx9MVynx7qbxPFYMhHRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=btBxdSoKK8eYo3dLvauelp0i1L3qqEStWYUk3UWxMcbn+VLvQcBpCicN0lqNtUvfL
	 b72Ofqo+Qobk3gyo8/SYRFBVjb16+TEDVc3e07Nd59SbNJzZDJSldkTWua7lXgvYZ7
	 hGA+RnNVhh2BLaQq+Jgb5Z0J5KfF6LNb3dqpaZ/wPhq43KGEI+tqDGvnrsTewNKnk/
	 Mqr4vRGZSUv4+FZPZ5P0hJs4Fjwh+ogDkkZU2Kirgcvdj4DLOYhY083846AAWRmvet
	 kMnHKLRVfhGnz+nw1FZJJOWyBLlYRpmRZM0tF4aMQ/HTl2J0ExvYgonVCIrZQJorMs
	 axuWAhPVFSguw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 16/17] crypto: jitterentropy - use default sha3 implementation
Date: Sun, 19 Oct 2025 17:50:37 -0700
Message-ID: <20251020005038.661542-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020005038.661542-1-ebiggers@kernel.org>
References: <20251020005038.661542-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_175339_068075_E2E775E1 
X-CRM114-Status: GOOD (  15.93  )
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


