Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E369CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NbVMXyUZ5inxdgY2SLFCR/wfTPMAAJ5LYcvDhvians=; b=C9sG+T7zZ8v/TZ25C/j8Yrqe+b
	SmD4WOIGd5AqTlYQrzHETv4w+EDNXghjtxBDYEq5Bk4NoUCJIH8JEXxXzfj9GDv0nQsLFAz7EUsN8
	slDMJarUUzMZUvnJfYpx0KbyAlVx9x0p3Bzh9cXDoCvv9iLqj4lO40HCK9god2z4t4sYEDUD6w+Cj
	d6zKxM62wPphEC4AB7YzjjjlJSTtPKH5HvXjX4X7r1Eyl3qnjw7olzEtuSyowMbVC3D/aOCM/yYHn
	7+J3LcEEFW6ZgLQAlfYnGZ9ZsVwLZ/+J13f9sy0BaV5lK7oqrbaOrM299gqkBlc/rTVicXrtaL/iw
	XRNxZreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA7l-00000006LOn-0NXk;
	Fri, 09 Oct 2026 12:54:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFA7j-00000006LO7-2Nmx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:54:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 07B1260A55;
	Fri,  9 Oct 2026 12:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B426D1F000FF;
	Fri,  9 Oct 2026 12:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791550494;
	bh=/NbVMXyUZ5inxdgY2SLFCR/wfTPMAAJ5LYcvDhvians=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fhhcVz2dcyR9Az8s/vN+8Z5V2P0Qh+R5tpwg5CFrNdL/J6N1au8J41Rh0mbhIJv//
	 jouk4ElWrEEEF12aO/DNsj9kfTIJkzCyaAVmXls7gsOyIHEoBOXHJCCkTZOeTRO1Xj
	 6N8G4qP5KTCleIUiD7wLOBWeTmgJANL0/zJcmcslTpzmptDTyNADOh5BqM0+Ndfisy
	 9dFr1mKoJYDJLkahmT0g7rJvMjVC+f1yDF9Qm1RGjIuzyI/nnNr2YhObGntKNSFAcN
	 eloItB4kmmzXLb0EK/uBriGfkTCyw8d9qcYtHzTnI4I3XlEZTmnN2IkNM9SRJSJRHk
	 fruVls0en554w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 2/2] lib/crypto: tests: Add Poly1305 split-update carry regression test
Date: Fri,  9 Oct 2026 14:53:54 +0200
Message-ID: <20261009125354.315476-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009125354.315476-1-ebiggers@kernel.org>
References: <20261009125354.315476-1-ebiggers@kernel.org>
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

Add a test case which reproduces the bug fixed by commit f5602ce803dc
("lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state").
It is written in a fairly general way, such that it should also be able
to reproduce similar bugs in other implementations.

Update the comment on test_poly1305_allones_keys_and_message() to more
accurately describe what it does and differentiate it from the new test.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/poly1305_kunit.c | 97 ++++++++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 9 deletions(-)

diff --git a/lib/crypto/tests/poly1305_kunit.c b/lib/crypto/tests/poly1305_kunit.c
index f3cb6245bc29..d065d8b6442f 100644
--- a/lib/crypto/tests/poly1305_kunit.c
+++ b/lib/crypto/tests/poly1305_kunit.c
@@ -55,16 +55,17 @@ static int poly1305_suite_init(struct kunit_suite *suite)
  * - Using an all-one-bits r_key tests the key clamping.
  * - Using an all-one-bits s_key tests carries in implementations of the
  *   addition mod 2**128 during finalization.
- * - Using all-one-bits message, and to a lesser extent r_key, tends to maximize
- *   any intermediate accumulator values.  This increases the chance of
- *   detecting bugs that occur only in rare cases where the accumulator values
- *   get very large, for example the bug fixed by commit 678cce4019d746da
- *   ("crypto: x86/poly1305 - fix overflow during partial reduction").
+ * - Using all-one-bits message and r_key results in large values for the
+ *   internal products of r_key by (accumulator + message block).  This
+ *   increases the chance of detecting bugs that occur only in rare cases where
+ *   the sum of these internal products is very large, for example the bug fixed
+ *   by commit 678cce4019d746da ("crypto: x86/poly1305 - fix overflow during
+ *   partial reduction").
  *
- * Accumulator overflow bugs may be specific to particular update lengths (in
- * blocks) and/or particular values of the previous acculumator.  Note that the
- * accumulator starts at 0 which gives the lowest chance of an overflow.  Thus,
- * a single all-one-bits test vector may be insufficient.
+ * Bugs with the handling of large internal product sums may be specific to
+ * particular update lengths (in blocks) and/or require that the accumulator
+ * also have a large value.  Note that the accumulator starts at 0.  Thus, a
+ * single all-one-bits test vector may be insufficient.
  *
  * Considering that, do the following test: continuously update a single
  * Poly1305 context with all-one-bits data of varying lengths (0, 16, 32, ...,
@@ -141,10 +142,88 @@ static void test_poly1305_reduction_edge_cases(struct kunit *test)
 	}
 }
 
+/*
+ * Test that Poly1305 MACs are computed correctly when r_key=1, s_key=0, and the
+ * message consists of all-ones blocks.
+ *
+ * With r_key=1 and s_key=0, Poly1305 degrades to the sum of the padded blocks
+ * mod 2**130 - 5, then reduced mod 2**128.  A padded all-ones block maps to
+ * 2**128 + (2**128 - 1) = 2**129 - 1.  Two such blocks sum to 2**130 - 2, which
+ * is congruent to 3 mod 2**130 - 5.  Thus, the expected MAC is just 3 *
+ * floor(nblocks / 2), minus 1 if nblocks is odd, then reduced mod 2**128.  If
+ * nblocks == 1 this is 2**128 - 1, otherwise it's just a small integer.
+ *
+ * Inside the Poly1305 implementation in this case, the multiplication does
+ * nothing and each block just adds 2**129 - 1 to the accumulator.  Without the
+ * multiplication to mix things up, this results in some interesting values
+ * being reached where the limbs are at or near their maximum values, even after
+ * (lazy) reduction.  This can reproduce bugs that happen only in such cases.
+ *
+ * For example, this test case reproduces the bug fixed by commit f5602ce803dc
+ * ("lib/crypto: arm64: Fix lost Poly1305 carry when resuming NEON state").
+ *
+ * However, reaching that bug required two consecutive updates: one with >= 8
+ * blocks to cause NEON code to be used and leave the accumulator in base 2**26
+ * with its limbs in a certain pattern, then one with an odd number of blocks >=
+ * 9 to cause NEON to be used again, but first processing one block using scalar
+ * code as a special case, triggering a conversion to base 2**64 where the carry
+ * into the 2**128 bit was lost.  To cover this and other similar edge cases
+ * that may exist in other Poly1305 implementations, just test all possible
+ * block-aligned splits between three poly1305_update() calls.
+ */
+static void test_poly1305_split_update_carry(struct kunit *test)
+{
+	static const u8 key[POLY1305_KEY_SIZE] = { 1 }; /* r_key=1, s_key=0 */
+	/*
+	 * Use max_nblocks=66 so that it's a bit more than twice the AVX-512
+	 * threshold of 32 blocks.
+	 */
+	const int max_nblocks = 66;
+	u8 *data = alloc_buf(test, max_nblocks * POLY1305_BLOCK_SIZE);
+	u8 expected_mac[POLY1305_DIGEST_SIZE];
+	u8 actual_mac[POLY1305_DIGEST_SIZE];
+	struct poly1305_desc_ctx ctx;
+
+	KUNIT_ASSERT_LE(test, 3 * (max_nblocks / 2), U8_MAX);
+
+	memset(data, 0xff, max_nblocks * POLY1305_BLOCK_SIZE);
+
+	for (int nblocks = 0; nblocks <= max_nblocks; nblocks++) {
+		size_t len = nblocks * POLY1305_BLOCK_SIZE;
+
+		expected_mac[0] = 3 * (nblocks / 2) - (nblocks % 2);
+		memset(&expected_mac[1], nblocks == 1 ? 0xff : 0,
+		       POLY1305_DIGEST_SIZE - 1);
+		for (size_t part1_len = 0; part1_len <= len;
+		     part1_len += POLY1305_BLOCK_SIZE) {
+			for (size_t part2_len = 0; part2_len <= len - part1_len;
+			     part2_len += POLY1305_BLOCK_SIZE) {
+				size_t part3_len = len - part1_len - part2_len;
+
+				poly1305_init(&ctx, key);
+				poly1305_update(&ctx, data, part1_len);
+				poly1305_update(&ctx, &data[part1_len],
+						part2_len);
+				poly1305_update(&ctx,
+						&data[part1_len + part2_len],
+						part3_len);
+				poly1305_final(&ctx, actual_mac);
+				KUNIT_ASSERT_MEMEQ_MSG(
+					test, actual_mac, expected_mac,
+					POLY1305_DIGEST_SIZE,
+					"Failed with nblocks=%d, part1_len=%zu, part2_len=%zu, part3_len=%zu",
+					nblocks, part1_len, part2_len,
+					part3_len);
+			}
+		}
+	}
+}
+
 static struct kunit_case poly1305_test_cases[] = {
 	HASH_KUNIT_CASES,
 	KUNIT_CASE(test_poly1305_allones_keys_and_message),
 	KUNIT_CASE(test_poly1305_reduction_edge_cases),
+	KUNIT_CASE(test_poly1305_split_update_carry),
 	KUNIT_CASE(benchmark_hash),
 	{},
 };
-- 
2.56.0


