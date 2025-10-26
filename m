Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C1DCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrT7Mf5omRHyRowKcG8xS225AK0Ko0WnNWSjwNURiY8=; b=gKTlsHaxi7YxPooePHT9u0ZYZu
	L/89CWhwUjB5ncbkzOzKKiWm3Z8N/p6vDrMQDE+pb9kMmjiW2zY5c+Q9p+7Sj7PKs7i+sS2nKAd+o
	XG+aDrUB4iHGEgr3Sj4X0U1gTOAPe5tn94pmH8vFfXDFJ02/IwbVAqnSsfuRV93VCKEgxK0fCNMes
	0dgGDelDhKumQvf9hxjexU6geMLLfraWpPCb4lP44Zv0UWxIJ2EwOAX4wwSCUY+wndO3k9zuKGNqq
	EyK3/4V5iKs1Ir4MJKLmsw4hKrtIrkKNEWWKRyUIr02RcqxTCXfUxn4fLY66rhOUrENs2lOx/uMrd
	ziylRmrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgl-0000000C2ob-3UnE;
	Sun, 26 Oct 2025 05:53:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCtgf-0000000C2ji-41Gt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 05:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46F4260331;
	Sun, 26 Oct 2025 05:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D9DC4AF09;
	Sun, 26 Oct 2025 05:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761457985;
	bh=G4phGjZg/4DyxMiZScpeB5F56Kh8gOR6USagGkBx7Vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TlTvEPglQOHat1LvQgZUeyeuH7Hcljru/KjtGuDlPGeis3n5PDywGuUR25jVngEOp
	 T5yZXcLFZ6og46oOZMuQ7zxtDth/L4dx3COFvfMV2Ow2EFNErD0glGUlcdwh7UeBOE
	 wWenUYvUP+Ih//cuIDUWWg4XEVrTtksjyp3Hrr6JIDvEU1OCybt2M1YcdmsLDis+mU
	 eWoRbzOIp5aaz5BtZ4nWu/8zl2nG9wqJV/h4GPP4EX2ZBDcXb8UQ5NFva900cfcsXS
	 Uah4c0CN9RaIVGM+Q7TDU4TRcbg3JQiuhVNtJMXM6hlZYSFRY4ishXF3Nd3XaNcyhX
	 3XHR8lijJDvvQ==
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
Subject: [PATCH v2 04/15] lib/crypto: sha3: Move SHA3 Iota step mapping into round function
Date: Sat, 25 Oct 2025 22:50:21 -0700
Message-ID: <20251026055032.1413733-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251026055032.1413733-1-ebiggers@kernel.org>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
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

In crypto/sha3_generic.c, the keccakf() function calls keccakf_round()
to do four of Keccak-f's five step mappings.  However, it does not do
the Iota step mapping - presumably because that is dependent on round
number, whereas Theta, Rho, Pi and Chi are not.

Note that the keccakf_round() function needs to be explicitly
non-inlined on certain architectures as gcc's produced output will (or
used to) use over 1KiB of stack space if inlined.

Now, this code was copied more or less verbatim into lib/crypto/sha3.c,
so that has the same aesthetic issue.  Fix this there by passing the
round number into sha3_keccakf_one_round_generic() and doing the Iota
step mapping there.

crypto/sha3_generic.c is left untouched as that will be converted to use
lib/crypto/sha3.c at some point.

Suggested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha3.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/crypto/sha3.c b/lib/crypto/sha3.c
index 049be8414de26..ee7a2ca92b2c5 100644
--- a/lib/crypto/sha3.c
+++ b/lib/crypto/sha3.c
@@ -46,11 +46,11 @@ static const u64 sha3_keccakf_rndc[SHA3_KECCAK_ROUNDS] = {
 };
 
 /*
  * Perform a single round of Keccak mixing.
  */
-static SHA3_INLINE void sha3_keccakf_one_round_generic(u64 st[25])
+static SHA3_INLINE void sha3_keccakf_one_round_generic(u64 st[25], int round)
 {
 	u64 t[5], tt, bc[5];
 
 	/* Theta */
 	bc[0] = st[0] ^ st[5] ^ st[10] ^ st[15] ^ st[20];
@@ -147,10 +147,13 @@ static SHA3_INLINE void sha3_keccakf_one_round_generic(u64 st[25])
 	st[20] ^= bc[ 0];
 	st[21] ^= bc[ 1];
 	st[22] ^= bc[ 2];
 	st[23] ^= bc[ 3];
 	st[24] ^= bc[ 4];
+
+	/* Iota */
+	st[0] ^= sha3_keccakf_rndc[round];
 }
 
 /* Generic implementation of the Keccak-f[1600] permutation */
 static void sha3_keccakf_generic(struct sha3_state *state)
 {
@@ -161,15 +164,12 @@ static void sha3_keccakf_generic(struct sha3_state *state)
 	 */
 
 	for (int i = 0; i < ARRAY_SIZE(state->words); i++)
 		state->native_words[i] = le64_to_cpu(state->words[i]);
 
-	for (int round = 0; round < SHA3_KECCAK_ROUNDS; round++) {
-		sha3_keccakf_one_round_generic(state->native_words);
-		/* Iota */
-		state->native_words[0] ^= sha3_keccakf_rndc[round];
-	}
+	for (int round = 0; round < SHA3_KECCAK_ROUNDS; round++)
+		sha3_keccakf_one_round_generic(state->native_words, round);
 
 	for (int i = 0; i < ARRAY_SIZE(state->words); i++)
 		state->words[i] = cpu_to_le64(state->native_words[i]);
 }
 
-- 
2.51.1.dirty


