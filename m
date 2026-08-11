Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB3CC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 14:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ERaMPsjwHcuWRT7KK06+ij6/U9aQH1xxiJrGBBvL1s=; b=UVWnj+yyLRXwbsxbgsmEChJNrO
	kf5N1dNUqk+DTgHhfPZcBcgFyG/LP/4EjslKOhO+8oXve6tsp7IaEulQVn1HufJZ25w2RbjTjbYpy
	WP2itYBNPNzZHj8NkDBBT4N4OqiT3JLcJdXiCDYzvjY0cSTgOtes3EBpyiOZgqpYqmXYnRViPvIRM
	Usg6SLxEZ7Z/SmKdTxc4XjCX/AiLUExXJGdK9GyhPpSoayYi4db8cUZI/3zJS1HosK/Z8c70/1l6e
	qsli7mPPbBEOvSeAd0uX/7xiRb+g9Z68laqgoGvCYMFfBWLAPTizRee938tqkSNBaeZb34lKJtzhI
	Ln83pIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn33-0000000E9LK-197J;
	Tue, 11 Aug 2026 14:01:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtn31-0000000E9KR-1sMX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 14:01:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB93541FB0;
	Tue, 11 Aug 2026 14:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DBC1F00A3A;
	Tue, 11 Aug 2026 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456902;
	bh=5ERaMPsjwHcuWRT7KK06+ij6/U9aQH1xxiJrGBBvL1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dnVQBEwSU7ZSnl+Gz3XvYWXW5SbVRLAUDeykXKtv44rNTMDSTQcBpndecLT63MIJV
	 ETtcIGZzDcfAstoCc1M26RCjsuPFYzBC0xqU4pV0BL4u4P87i+YkIrLyDVHzimqAOi
	 5R9ETWWMCR56SPA33S2K0AfuNZHzRQLj2ExAaWAAnXVdiEMwjVDFiMROdgGX2jf3bP
	 +hqZKIh4AJBrt6ugDJ6KqP6G67uhwtdzTM2hkvlG/1Nhxmc/fUbmgrLDQgptC6X2II
	 iFclhEQASMDmf7ip4Kj31TGG1q1Sa5NdLGJah3FplAU3m8Pc7QfgchSzg7mvbxusod
	 M1fI+VcliCFbw==
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
Subject: [PATCH 01/12] selftests/arm64: Remove big-endian support
Date: Tue, 11 Aug 2026 15:01:20 +0100
Message-ID: <20260811140132.22778-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811140132.22778-1-will@kernel.org>
References: <20260811140132.22778-1-will@kernel.org>
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

Signed-off-by: Will Deacon <will@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 19 +------------------
 tools/testing/selftests/rseq/rseq-arm64.h    |  5 -----
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 22c584b78be5..77d630444996 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -112,23 +112,6 @@ static void handle_alarm(int sig, siginfo_t *info, void *context)
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
@@ -897,7 +880,7 @@ static void fpsimd_to_sve(__uint128_t *v, char *z, int vl)
 
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
2.55.0.679.g6767b8d81c-goog


