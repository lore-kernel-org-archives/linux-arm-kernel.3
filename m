Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945F8CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2I29sVWPGLqUjIDyjNAdYt3UxHapRuSjOGldiuvjnFA=; b=bOSx27SiEjGtly3Mm9TYQBRJOu
	guwmPHi95ObA0Q3IhxosA055uaYYSByI3FaZ70mkk4IK/lupzkOOwWts7MLyDzrFowOumTz/5TyvE
	OvkiHP2MPLtmqWm30+CRqOVQYsHnLe3hO6ud4O2bOS1ujlJdLbfmD6UecLjkuH1pkjsrw/kXIxthJ
	ZoZg/PkrrGbd5dTgdUxbOxQGVhJxQrLfn1buuxdUozgZ1q4zbVwoO2ACawN+exxWu3E85kwiDl9sT
	fzbb5eXULFYnRGuA0dY9zpNJbUNQX8pAN1cI7KNgIGKm3iGtYSzeS0DqGFknV1oC3nfnH977IwYkS
	sCMAZwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWAd-0000000G3f1-12Kx;
	Tue, 16 Jun 2026 15:57:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWAb-0000000G3dw-0owx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:57:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5E2E43436;
	Tue, 16 Jun 2026 15:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A96C1F000E9;
	Tue, 16 Jun 2026 15:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781625464;
	bh=2I29sVWPGLqUjIDyjNAdYt3UxHapRuSjOGldiuvjnFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hvMrhoDsIv55pDkqtMQJkIvBvYtP03iTeGsHOKYQksDENhjkdvt9oTdqQ6yGdQlKd
	 fOW7NTIQXoVV2mbxwF15GJj2IJpSsejIFL9HNkDRbSZFD9B1OlmtQycYJ0cmPFb0kw
	 1Drcf4CbSV259gNGECV3IW90U1lovSnbmhAnZjzVOeJdmOUuzeQZHBaE7xDofPcJez
	 bpoflV05cCVyOiJfYSKL7WioHrVHh5WF6Lr+uKIfhwPi4LyznsS/UqeZCOcyyDPMYd
	 PE0o/Au1LOj7t+lvbuOtwYQaM7iCDKtlhvp2DYc9ed78wZECHVpWozbf3kXeQz5nn5
	 lGQiaqEE3z8QA==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Shuah Khan <shuah@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Stephane Eranian <eranian@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v5 4/4] selftests/bpf: Adjust wasted entries threshold for ARM64 BRBE
Date: Tue, 16 Jun 2026 08:57:09 -0700
Message-ID: <20260616155716.2631508-5-puranjay@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260616155716.2631508-1-puranjay@kernel.org>
References: <20260616155716.2631508-1-puranjay@kernel.org>
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

The get_branch_snapshot test checks that bpf_get_branch_snapshot()
doesn't waste too many branch entries on infrastructure overhead. The
threshold of < 10 was calibrated for x86 where about 7 entries are
wasted.

On ARM64, the BPF trampoline generates more branches than x86,
resulting in about 13 wasted entries. The overhead comes from the BPF
trampoline calling __bpf_prog_enter_recur which on ARM64 makes
out-of-line calls to __rcu_read_lock and generates more conditional
branches than x86:

 [#12] bpf_testmod_loop_test+0x40    -> bpf_trampoline_...+0x48
 [#11] bpf_trampoline_...+0x68       -> __bpf_prog_enter_recur+0x0
 [#10] __bpf_prog_enter_recur+0x20   -> __bpf_prog_enter_recur+0x118
 [#09] __bpf_prog_enter_recur+0x154  -> __bpf_prog_enter_recur+0x160
 [#08] __bpf_prog_enter_recur+0x164  -> __bpf_prog_enter_recur+0x2c
 [#07] __bpf_prog_enter_recur+0x2c   -> __rcu_read_lock+0x0
 [#06] __rcu_read_lock+0x18          -> __bpf_prog_enter_recur+0x30
 [#05] __bpf_prog_enter_recur+0x9c   -> __bpf_prog_enter_recur+0xf0
 [#04] __bpf_prog_enter_recur+0xf4   -> __bpf_prog_enter_recur+0xa8
 [#03] __bpf_prog_enter_recur+0xb8   -> __bpf_prog_enter_recur+0x100
 [#02] __bpf_prog_enter_recur+0x114  -> bpf_trampoline_...+0x6c
 [#01] bpf_trampoline_...+0x78       -> bpf_prog_...test1+0x0
 [#00] bpf_prog_...test1+0x58        -> arm_brbe_snapshot_branch_stack+0x0

Use an architecture-specific threshold of < 14 for ARM64 to accommodate
this overhead while still detecting regressions.

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 .../selftests/bpf/prog_tests/get_branch_snapshot.c  | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c b/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c
index 0394a1156d99..8d1a3480767f 100644
--- a/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c
+++ b/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c
@@ -116,13 +116,18 @@ void serial_test_get_branch_snapshot(void)
 
 	ASSERT_GT(skel->bss->test1_hits, 6, "find_looptest_in_lbr");
 
-	/* Given we stop LBR in software, we will waste a few entries.
+	/* Given we stop LBR/BRBE in software, we will waste a few entries.
 	 * But we should try to waste as few as possible entries. We are at
-	 * about 7 on x86_64 systems.
-	 * Add a check for < 10 so that we get heads-up when something
-	 * changes and wastes too many entries.
+	 * about 7 on x86_64 and about 13 on arm64 systems (the arm64 BPF
+	 * trampoline generates more branches than x86_64).
+	 * Add a check so that we get heads-up when something changes and
+	 * wastes too many entries.
 	 */
+#if defined(__aarch64__)
+	ASSERT_LT(skel->bss->wasted_entries, 14, "check_wasted_entries");
+#else
 	ASSERT_LT(skel->bss->wasted_entries, 10, "check_wasted_entries");
+#endif
 
 cleanup:
 	get_branch_snapshot__destroy(skel);
-- 
2.53.0-Meta


