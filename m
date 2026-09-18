Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DB8C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alAQXkbnxpjXDfvThdJzKpaGNsoJElzpO5O9I9uSqHs=; b=I1yguZg48+Q7+w+4Bz8jstvQLE
	wFkIEYZ57dHBq3IpYFeeFwchM8Q7Kqajdo1iIrQSEadc105/ik0dXL+C5sZ3qfowOQXNnirob7e8L
	GsyP7Xgn8EQMIPksNPcUwXcDTmMkEKIRVSYhPaFzqLDl53vmKicYQ1HSIO6T77AJRYaT3hdevnK+d
	TDgj3DAMx67+q6YcVwLkwSp11P4Jxlz2yot8CU2NeWDF7HlhNGgZqDx3LkMOzoQmkCvcnTq+SM3Xx
	CIttaFN+iv6IudxHc18qA9ODXeYjv59A2RrX6tB9q4bQmYwwR9Y+hmnvlXu9piLpM+Nj1mmu6/ski
	BWjHyTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zx3-0000000EmHl-0jKE;
	Fri, 18 Sep 2026 14:52:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zwy-0000000EmGR-34dg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:52:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F00FE602CC;
	Fri, 18 Sep 2026 14:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3608C1F00898;
	Fri, 18 Sep 2026 14:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743147;
	bh=alAQXkbnxpjXDfvThdJzKpaGNsoJElzpO5O9I9uSqHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jZi6GglU53TBP8sQOukY49URZBMglJbjKZVyPmWGiDdR2f2j9PlnH4ynsQ/DpTRz8
	 XhIRO2RjFjQgPw5+gfqVf671XbEKxyD5pcrkG6NMKfZ+VFKD7kJuwqj5A/WOZyzIJp
	 1daW/YIq7WjFLlt1hgXozLv6less93YykNMKXun7KQaq6KlvUe/I7HSa+Jb5+7UalN
	 yZnHU9RcEbh+vRhcSU8CKfLNhLEF/s/SkslPLHnDUKP/SuChLRBCVrElKfA386ZmbN
	 xGVpjMZFacMWo0loUg/eSx+3F2ro+m+MpDaD/uq8u1gO/q/S1t4xaL6Oe5v8MX60X5
	 8C5O4BkazNCCA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 01/13] selftests/arm64: Remove big-endian support
Date: Fri, 18 Sep 2026 15:52:03 +0100
Message-ID: <20260918145217.1669-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
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

Big-endian support on arm64 depends on BROKEN, so the arm64 selftests do
not need to worry about testing this configuration any more.

Remove the 128-bit byte-swapping helper from the fp-ptrace test and the
big-endian definition of RSEQ_SIG_DATA from the rseq test.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 19 +------------------
 tools/testing/selftests/rseq/rseq-arm64.h    |  5 -----
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index b435837c8c0e..9b184d78f4fd 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -115,23 +115,6 @@ static void handle_alarm(int sig, siginfo_t *info, void *context)
 	got_alarm = true;
 }
 
-#ifdef CONFIG_CPU_BIG_ENDIAN
-static __uint128_t arm64_cpu_to_le128(__uint128_t x)
-{
-	u64 a = swab64(x);
-	u64 b = swab64(x >> 64);
-
-	return ((__uint128_t)a << 64) | b;
-}
-#else
-static __uint128_t arm64_cpu_to_le128(__uint128_t x)
-{
-	return x;
-}
-#endif
-
-#define arm64_le128_to_cpu(x) arm64_cpu_to_le128(x)
-
 static bool sve_supported(void)
 {
 	return getauxval(AT_HWCAP) & HWCAP_SVE;
@@ -932,7 +915,7 @@ static void fpsimd_to_sve(__uint128_t *v, char *z, int vl)
 
 	for (i = 0; i < __SVE_NUM_ZREGS; i++) {
 		p = (__uint128_t *)&z[__SVE_ZREG_OFFSET(vq, i)];
-		*p = arm64_cpu_to_le128(v[i]);
+		*p = v[i];
 	}
 }
 
diff --git a/tools/testing/selftests/rseq/rseq-arm64.h b/tools/testing/selftests/rseq/rseq-arm64.h
index 21e1626a7235..f9fecf941bf2 100644
--- a/tools/testing/selftests/rseq/rseq-arm64.h
+++ b/tools/testing/selftests/rseq/rseq-arm64.h
@@ -12,12 +12,7 @@
  * matches code endianness.
  */
 #define RSEQ_SIG_CODE	0xd428bc00	/* BRK #0x45E0.  */
-
-#ifdef __AARCH64EB__
-#define RSEQ_SIG_DATA	0x00bc28d4	/* BRK #0x45E0.  */
-#else
 #define RSEQ_SIG_DATA	RSEQ_SIG_CODE
-#endif
 
 #define RSEQ_SIG	RSEQ_SIG_DATA
 
-- 
2.55.0.1082.g2b9226bbc0-goog


