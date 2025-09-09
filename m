Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4872CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 23:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjNDafTG6cNgXgHQ+8bb/UvqEKCzTh/hfl+5pjYzOfI=; b=VuRfGgSuAxwgit06+UUnCv+hii
	buFPT1HYBlZHOVmc9AB2TnpXQPRf8MiurAlG3KxQ9Lqp9xbKESsaJdmAF6IViNuZU6D21rO5bQfyy
	N+G4qrtVxrcR6Xsse+HIE7GFnRv7m0g7bDj/enijY2J+S8Fd3HxQ0E6BS/pId3qSlG8Z14tDzGbRn
	SMAAXmT9Brcg2NvG7J2THJtoSlhsF/YM+jUl5n5NLwxfVV0GnGhgPBkIAwbe2l3mpQP8QsnLwV31q
	STXAh5fNRZJpHp8E1M64wViwgYNxwFHmfRgAxmqKwUOYrK2gGNftU9YMf3I45/Z8sz6SOEtwCf6oM
	pYpnnKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw7Zh-0000000ArCP-1GVi;
	Tue, 09 Sep 2025 23:16:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw7Zc-0000000Ar69-19Om
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 23:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC6BE44D71;
	Tue,  9 Sep 2025 23:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854C4C4CEF8;
	Tue,  9 Sep 2025 23:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757459787;
	bh=+jtPvEG9mqAA+HOHIx5a/x8gc0AqK7W2yRGI6eP50+8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qdEk+uaFOdHaGiDPsTxBY7RpVY48whywiERdxCFE/N3bJzKqWolxFwS/BUhsFR5pX
	 F5XDQszx6JgNe6yVCY4dV/pvdRyPuRuef/Si9wyxfP4QP+PFyGpJnYv1QKLQNApHBk
	 qpu2cvprtfVcFxCwCXnorgXuLEvLDIwrUmpB986Kd8aGAwB5mnggFaoUodlhFz/62u
	 ROmn62pPL2w3FFIRLhvoz40HkvqmYMPMi18RaXe+AWHJs3jnvvFIvp+Gxa+KhATbtr
	 nOtxEtqGbawD7TGzOtNmyW1C/sVgYUci42C+1VEuRS2PBK1bfj4uiwWCyvobz9iaVi
	 QqJKplc9Bwk/g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	fsverity@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 4/6] lib/crypto: tests: Add tests and benchmark for sha256_finup_2x()
Date: Tue,  9 Sep 2025 16:13:24 -0700
Message-ID: <20250909231326.1074672-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250909231326.1074672-1-ebiggers@kernel.org>
References: <20250909231326.1074672-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_161628_364247_D97D87F9 
X-CRM114-Status: GOOD (  17.03  )
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

Update sha256_kunit to include test cases and a benchmark for the new
sha256_finup_2x() function.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/sha256_kunit.c | 184 ++++++++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/lib/crypto/tests/sha256_kunit.c b/lib/crypto/tests/sha256_kunit.c
index 1cd4caee6010d..628981f0a7eff 100644
--- a/lib/crypto/tests/sha256_kunit.c
+++ b/lib/crypto/tests/sha256_kunit.c
@@ -3,10 +3,11 @@
  * Copyright 2025 Google LLC
  */
 #include <crypto/sha2.h>
 #include "sha256-testvecs.h"
 
+/* Generate the HASH_KUNIT_CASES using hash-test-template.h. */
 #define HASH sha256
 #define HASH_CTX sha256_ctx
 #define HASH_SIZE SHA256_DIGEST_SIZE
 #define HASH_INIT sha256_init
 #define HASH_UPDATE sha256_update
@@ -19,13 +20,196 @@
 #define HMAC_FINAL hmac_sha256_final
 #define HMAC hmac_sha256
 #define HMAC_USINGRAWKEY hmac_sha256_usingrawkey
 #include "hash-test-template.h"
 
+static void free_guarded_buf(void *buf)
+{
+	vfree(buf);
+}
+
+/*
+ * Allocate a KUnit-managed buffer that has length @len bytes immediately
+ * followed by an unmapped page.
+ */
+static void *alloc_guarded_buf(struct kunit *test, size_t len)
+{
+	size_t full_len = round_up(len, PAGE_SIZE);
+	void *buf = vmalloc(full_len);
+
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+	if (kunit_add_action_or_reset(test, free_guarded_buf, buf) != 0)
+		return NULL;
+	return buf + full_len - len;
+}
+
+/*
+ * Test for sha256_finup_2x().  Specifically, choose various data lengths and
+ * salt lengths, and for each one, verify that sha256_finup_2x() produces the
+ * same results as sha256_update() and sha256_final().
+ *
+ * Use guarded buffers for all inputs and outputs to reliably detect any
+ * out-of-bounds reads or writes, even if they occur in assembly code.
+ */
+static void test_sha256_finup_2x(struct kunit *test)
+{
+	const size_t max_data_len = 16384;
+	u8 *data1_buf, *data2_buf, *hash1, *hash2;
+	u8 expected_hash1[SHA256_DIGEST_SIZE];
+	u8 expected_hash2[SHA256_DIGEST_SIZE];
+	u8 salt[SHA256_BLOCK_SIZE];
+	struct sha256_ctx *ctx;
+
+	data1_buf = alloc_guarded_buf(test, max_data_len);
+	data2_buf = alloc_guarded_buf(test, max_data_len);
+	hash1 = alloc_guarded_buf(test, SHA256_DIGEST_SIZE);
+	hash2 = alloc_guarded_buf(test, SHA256_DIGEST_SIZE);
+	ctx = alloc_guarded_buf(test, sizeof(*ctx));
+
+	rand_bytes(data1_buf, max_data_len);
+	rand_bytes(data2_buf, max_data_len);
+	rand_bytes(salt, sizeof(salt));
+
+	for (size_t i = 0; i < 500; i++) {
+		size_t salt_len = rand_length(sizeof(salt));
+		size_t data_len = rand_length(max_data_len);
+		const u8 *data1 = data1_buf + max_data_len - data_len;
+		const u8 *data2 = data2_buf + max_data_len - data_len;
+		struct sha256_ctx orig_ctx;
+
+		sha256_init(ctx);
+		sha256_update(ctx, salt, salt_len);
+		orig_ctx = *ctx;
+
+		sha256_finup_2x(ctx, data1, data2, data_len, hash1, hash2);
+		KUNIT_ASSERT_MEMEQ_MSG(
+			test, ctx, &orig_ctx, sizeof(*ctx),
+			"sha256_finup_2x() modified its ctx argument");
+
+		sha256_update(ctx, data1, data_len);
+		sha256_final(ctx, expected_hash1);
+		sha256_update(&orig_ctx, data2, data_len);
+		sha256_final(&orig_ctx, expected_hash2);
+		KUNIT_ASSERT_MEMEQ_MSG(
+			test, hash1, expected_hash1, SHA256_DIGEST_SIZE,
+			"Wrong hash1 with salt_len=%zu data_len=%zu", salt_len,
+			data_len);
+		KUNIT_ASSERT_MEMEQ_MSG(
+			test, hash2, expected_hash2, SHA256_DIGEST_SIZE,
+			"Wrong hash2 with salt_len=%zu data_len=%zu", salt_len,
+			data_len);
+	}
+}
+
+/* Test sha256_finup_2x() with ctx == NULL */
+static void test_sha256_finup_2x_defaultctx(struct kunit *test)
+{
+	const size_t data_len = 128;
+	struct sha256_ctx ctx;
+	u8 hash1_a[SHA256_DIGEST_SIZE];
+	u8 hash2_a[SHA256_DIGEST_SIZE];
+	u8 hash1_b[SHA256_DIGEST_SIZE];
+	u8 hash2_b[SHA256_DIGEST_SIZE];
+
+	rand_bytes(test_buf, 2 * data_len);
+
+	sha256_init(&ctx);
+	sha256_finup_2x(&ctx, test_buf, &test_buf[data_len], data_len, hash1_a,
+			hash2_a);
+
+	sha256_finup_2x(NULL, test_buf, &test_buf[data_len], data_len, hash1_b,
+			hash2_b);
+
+	KUNIT_ASSERT_MEMEQ(test, hash1_a, hash1_b, SHA256_DIGEST_SIZE);
+	KUNIT_ASSERT_MEMEQ(test, hash2_a, hash2_b, SHA256_DIGEST_SIZE);
+}
+
+/*
+ * Test that sha256_finup_2x() and sha256_update/final() produce consistent
+ * results with total message lengths that require more than 32 bits.
+ */
+static void test_sha256_finup_2x_hugelen(struct kunit *test)
+{
+	const size_t data_len = 4 * SHA256_BLOCK_SIZE;
+	struct sha256_ctx ctx = {};
+	u8 expected_hash[SHA256_DIGEST_SIZE];
+	u8 hash[SHA256_DIGEST_SIZE];
+
+	rand_bytes(test_buf, data_len);
+	for (size_t align = 0; align < SHA256_BLOCK_SIZE; align++) {
+		sha256_init(&ctx);
+		ctx.ctx.bytecount = 0x123456789abcd00 + align;
+
+		sha256_finup_2x(&ctx, test_buf, test_buf, data_len, hash, hash);
+
+		sha256_update(&ctx, test_buf, data_len);
+		sha256_final(&ctx, expected_hash);
+
+		KUNIT_ASSERT_MEMEQ(test, hash, expected_hash,
+				   SHA256_DIGEST_SIZE);
+	}
+}
+
+/* Benchmark for sha256_finup_2x() */
+static void benchmark_sha256_finup_2x(struct kunit *test)
+{
+	/*
+	 * Try a few different salt lengths, since sha256_finup_2x() performance
+	 * may vary slightly for the same data_len depending on how many bytes
+	 * were already processed in the initial context.
+	 */
+	static const size_t salt_lens_to_test[] = { 0, 32, 64 };
+	const size_t data_len = 4096;
+	const size_t num_iters = 4096;
+	struct sha256_ctx ctx;
+	u8 hash1[SHA256_DIGEST_SIZE];
+	u8 hash2[SHA256_DIGEST_SIZE];
+	u64 t;
+
+	if (!IS_ENABLED(CONFIG_CRYPTO_LIB_BENCHMARK))
+		kunit_skip(test, "not enabled");
+	if (!sha256_finup_2x_is_optimized())
+		kunit_skip(test, "not relevant");
+
+	rand_bytes(test_buf, data_len * 2);
+
+	/* Warm-up */
+	for (size_t i = 0; i < num_iters; i++)
+		sha256_finup_2x(NULL, &test_buf[0], &test_buf[data_len],
+				data_len, hash1, hash2);
+
+	for (size_t i = 0; i < ARRAY_SIZE(salt_lens_to_test); i++) {
+		size_t salt_len = salt_lens_to_test[i];
+
+		/*
+		 * Prepare the initial context.  The time to process the salt is
+		 * not measured; we're just interested in sha256_finup_2x().
+		 */
+		sha256_init(&ctx);
+		sha256_update(&ctx, test_buf, salt_len);
+
+		preempt_disable();
+		t = ktime_get_ns();
+		for (size_t j = 0; j < num_iters; j++)
+			sha256_finup_2x(&ctx, &test_buf[0], &test_buf[data_len],
+					data_len, hash1, hash2);
+		t = ktime_get_ns() - t;
+		preempt_enable();
+		kunit_info(test, "data_len=%zu salt_len=%zu: %llu MB/s",
+			   data_len, salt_len,
+			   div64_u64((u64)data_len * 2 * num_iters * 1000,
+				     t ?: 1));
+	}
+}
+
 static struct kunit_case hash_test_cases[] = {
 	HASH_KUNIT_CASES,
+	KUNIT_CASE(test_sha256_finup_2x),
+	KUNIT_CASE(test_sha256_finup_2x_defaultctx),
+	KUNIT_CASE(test_sha256_finup_2x_hugelen),
 	KUNIT_CASE(benchmark_hash),
+	KUNIT_CASE(benchmark_sha256_finup_2x),
 	{},
 };
 
 static struct kunit_suite hash_test_suite = {
 	.name = "sha256",
-- 
2.50.1


