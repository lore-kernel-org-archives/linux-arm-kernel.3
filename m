Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAABFCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 22:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCb89IgsLwOFhpz4MbAPn0pNdnEI/VMM8b0yUQaEIW4=; b=PAfF7+t2UAjYw2fngnK1HGt2Yd
	EAAAhtpNO2Z1+8BPI406kZejy+nC3th8S0j2e3mi1ZTDcCSdjJpyjppybEmAIvgER1nMCY6RJGRku
	TOJjJ1LGvWp8sbLY+A9YeW+NNAOgtusCvSFsP9aNGmyINRuV0qdcLO7EW9xTaDEzBsELtOY26wp6I
	V+F/w1G1sliYbg0iNfUqe+6P6w9kmA1n8MATZ80TyHhhveKAg4b5u2LJYx3VXuFCtDYPcCRDy/v+3
	NEakb+rNNjE03dqPqqIceAFdYkjwoINGBKYRIKrSMjQKfX9DOhrQ9+jOCwCQ4/9dUipfaV0zhes+N
	lBzzqWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0zZ-00000008YcL-3bIW;
	Sat, 06 Sep 2025 22:02:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0am-00000008V9T-35tj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A9E645243;
	Sat,  6 Sep 2025 21:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC403C4CEF9;
	Sat,  6 Sep 2025 21:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194624;
	bh=qgC3ZMySIzbT7snif3jifRd6wEGhkdEbMg6+X/hdkEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HnoS8wHmNnAGXmjtE/Ly7bQ7EaKSHOs35JkeDWyFwsdG9Ef0wGj/vRGGJi9LdHgEG
	 6554LkhwPyJSQdav86Ah8LR1Az7qGvnT8pakFGsdrktTJPFodmNAYNDA7mplknq9hY
	 OW/gW6f8vnby4h7cHEhDMspXJQB2bekl39gTwXoKOksiJVJQ+fLpNSmlq3qGP4RllR
	 mruhQRhcwQXyF50nfeUOnWCxZ05ApEJuyYd5Ns1efTg6CeAPdnoat3/ddkoslV6bvx
	 BmzBRNBrkqfhfamYYWCtEEgKPMzOAiRgIM6VVp721vi9qCEbm0FQHrHW2VfmKizDAJ
	 oKm6HcxZ1EZYA==
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
Subject: [PATCH v2 08/12] lib/crypto: tests: Add Curve25519 benchmark
Date: Sat,  6 Sep 2025 14:35:19 -0700
Message-ID: <20250906213523.84915-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_143704_810021_83C6F472 
X-CRM114-Status: GOOD (  12.02  )
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

Add a benchmark to curve25519_kunit.  This brings it in line with the
other crypto KUnit tests and provides an easy way to measure
performance.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/curve25519_kunit.c | 31 +++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/lib/crypto/tests/curve25519_kunit.c b/lib/crypto/tests/curve25519_kunit.c
index 0d1c46ca74018..355ad79a210d1 100644
--- a/lib/crypto/tests/curve25519_kunit.c
+++ b/lib/crypto/tests/curve25519_kunit.c
@@ -3,10 +3,11 @@
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
 
 #include <crypto/curve25519.h>
 #include <kunit/test.h>
+#include <linux/timekeeping.h>
 
 struct curve25519_test_vector {
 	u8 private[CURVE25519_KEY_SIZE];
 	u8 public[CURVE25519_KEY_SIZE];
 	u8 result[CURVE25519_KEY_SIZE];
@@ -1314,13 +1315,43 @@ static void test_curve25519_basepoint(struct kunit *test)
 		KUNIT_EXPECT_MEMEQ_MSG(test, out, out2, CURVE25519_KEY_SIZE,
 				       "in=%*phN", CURVE25519_KEY_SIZE, in);
 	}
 }
 
+static void benchmark_curve25519(struct kunit *test)
+{
+	const u8 *private = curve25519_test_vectors[0].private;
+	const u8 *public = curve25519_test_vectors[0].public;
+	const size_t warmup_niter = 5000;
+	const size_t benchmark_niter = 1024;
+	u8 out[CURVE25519_KEY_SIZE];
+	bool ok = true;
+	u64 t;
+
+	if (!IS_ENABLED(CONFIG_CRYPTO_LIB_BENCHMARK))
+		kunit_skip(test, "not enabled");
+
+	/* Warm-up */
+	for (size_t i = 0; i < warmup_niter; i++)
+		ok &= curve25519(out, private, public);
+
+	/* Benchmark */
+	preempt_disable();
+	t = ktime_get_ns();
+	for (size_t i = 0; i < benchmark_niter; i++)
+		ok &= curve25519(out, private, public);
+	t = ktime_get_ns() - t;
+	preempt_enable();
+	KUNIT_EXPECT_TRUE(test, ok);
+	kunit_info(test, "%llu ops/s",
+		   div64_u64((u64)benchmark_niter * NSEC_PER_SEC, t ?: 1));
+}
+
 static struct kunit_case curve25519_test_cases[] = {
 	KUNIT_CASE(test_curve25519),
 	KUNIT_CASE(test_curve25519_basepoint),
+	KUNIT_CASE(benchmark_curve25519),
 	{},
 };
 
 static struct kunit_suite curve25519_test_suite = {
 	.name = "curve25519",
-- 
2.50.1


