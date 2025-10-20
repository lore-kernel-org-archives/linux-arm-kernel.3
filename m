Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA9ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3uAofyZIz3EJi4BZV+8Q1tzIpaXFsUP3M6ZBqMFeDE=; b=4Gro0W167LUE/kM4Eqk/9VmM9J
	ehsFWqgtZ2Q+TFw99k5d/YS1WakRJu5+mSdk+QV499p/w4M7acgY80kmtVUx5DYn4LvwWPgI05+Is
	XdgxIw/KyR+Zz/5B7Xqcq3wLwTFVTwM8zkZOLhOJVsrriEsw1TQia6SLCzMAnS3wVKOiYY+Q7btLN
	dJrVp/apRr4aEXYMgdb6YvtYXbh8eU0CGRj15ceG5vYhKrbXomLmUInDcAqUZlubPCKJ1Y2gvc2vt
	hceUax5M5mTjkiIQKhvkHBu9R06iTu3y8j5eMQ+JAhaUQ1xHWoLfRacwTC7VqwZPq/T19i/MIjISN
	5O9vYK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9z-0000000BZgl-10fO;
	Mon, 20 Oct 2025 00:54:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9j-0000000BZWd-3o1r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D276C60213;
	Mon, 20 Oct 2025 00:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AAAC113D0;
	Mon, 20 Oct 2025 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921613;
	bh=m4BeHgL3buDxrxSoDsgZ+7mjmPnxE72GJARRG8xIu+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rBDV/pVMzGjHxm865ok1NZc5G0dnVmrH5vjolGOawgHxav/kKUrk6XzA1D4ecY0xk
	 HXmHZMhs53VAs8kTrnqZZZc73jstRhleO2L9s3EFJu2Ofpt8OutVure1oPYyvHkNuG
	 ochoya4yqoev0bLsEzNfOKdio6vxwAFucZngTY8rNPZf/s3mreh2JvVu8+pPd0z+la
	 4ECJTJwqB3Q7YwpMFBy3T6/rRREWZ3qUiC9Uic5Vb5SZ/G/aUe3WmA0Sy8JkMYW4ey
	 CeEZv1IOGjAIMKOCvsV4dAB/O2Y+W7Thdfv4evOrH/v6BQgj8ESXqpCwYmfFD7pIcN
	 c3eu3h8Lwg0UA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>
Subject: [PATCH 04/17] lib/crypto: Move the SHA3 Iota transform into the single round function
Date: Sun, 19 Oct 2025 17:50:25 -0700
Message-ID: <20251020005038.661542-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020005038.661542-1-ebiggers@kernel.org>
References: <20251020005038.661542-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: David Howells <dhowells@redhat.com>

In crypto/sha3_generic.c, the keccakf() function calls keccakf_round() to
do most of the transforms, but not the Iota transform - presumably because
that is dependent on round number, whereas the Theta, Rho, Pi and Chi
transforms are not.

Note that the keccakf_round() function needs to be explicitly non-inlined
on certain architectures as gcc's produced output will (or used to) use
over 1KiB of stack space if inlined.

Now, this code was copied more or less verbatim into lib/crypto/sha3.c, so
that has the same aesthetic issue.  Fix this there by passing the round
number into sha3_keccakf_one_round_generic() and doing the Iota transform
there.

crypto/sha3_generic.c is left untouched as that will be converted to use
lib/crypto/sha3.c at some point.

Suggested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Stephan Mueller <smueller@chronox.de>
cc: linux-crypto@vger.kernel.org
Link: https://lore.kernel.org/r/20251017144311.817771-5-dhowells@redhat.com
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha3.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/crypto/sha3.c b/lib/crypto/sha3.c
index 5f847a5eecdc7..2c292b0b3db34 100644
--- a/lib/crypto/sha3.c
+++ b/lib/crypto/sha3.c
@@ -46,11 +46,12 @@ static const u64 sha3_keccakf_rndc[24] = {
 };
 
 /*
  * Perform a single round of Keccak mixing.
  */
-static SHA3_INLINE void sha3_keccakf_one_round_generic(struct sha3_state *state)
+static SHA3_INLINE void sha3_keccakf_one_round_generic(struct sha3_state *state,
+						       int round)
 {
 	u64 *st = state->st;
 	u64 t[5], tt, bc[5];
 
 	/* Theta */
@@ -148,19 +149,19 @@ static SHA3_INLINE void sha3_keccakf_one_round_generic(struct sha3_state *state)
 	st[20] ^= bc[ 0];
 	st[21] ^= bc[ 1];
 	st[22] ^= bc[ 2];
 	st[23] ^= bc[ 3];
 	st[24] ^= bc[ 4];
+
+	/* Iota */
+	state->st[0] ^= sha3_keccakf_rndc[round];
 }
 
 static void sha3_keccakf_rounds_generic(struct sha3_state *state)
 {
-	for (int round = 0; round < SHA3_KECCAK_ROUNDS; round++) {
-		sha3_keccakf_one_round_generic(state);
-		/* Iota */
-		state->st[0] ^= sha3_keccakf_rndc[round];
-	}
+	for (int round = 0; round < SHA3_KECCAK_ROUNDS; round++)
+		sha3_keccakf_one_round_generic(state, round);
 }
 
 /*
  * Byteswap the state buckets to CPU-endian if we're not on a little-endian
  * machine for the duration of the Keccak mixing function.  Note that these
-- 
2.51.1.dirty


