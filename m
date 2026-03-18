Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8159110775F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nvwln6rjBBZEEru9ErbEWkQ+3VNYPlbFaim9XRDohw=; b=fnWcv0J81r376hZLs6Q4tJCf3u
	tFGZrJvUIu3NaVQ/QRIwW+KeEKN+hBvWg/mXUFeCan5YE0EWcSNr+rOEfy90+MhEaLFaEkTYgSzws
	Oqf9Oc+TOxz7GGo+1ZUrt5tComHydl561pjwH/cLof9+zpbibzZPbaOXe4hFRR1xdTsf8CAWP7UwL
	ddti9QpUmzC3sh1ImepaUHolm9Sp1e8gbN+OJM0TR8ZtSXDC4NIOJsEoiDLoFDTZnSHMYMiq+wefR
	SQKHxk5a20WFUEQK8zYK5zH9DnEdD8Z/YFA0RbgjJ/x40MAociaoPQ2QZpj6P+nuADi2/wNhxiUUN
	aJf1YgPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uWe-000000092jO-3gxI;
	Wed, 18 Mar 2026 17:17:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uWc-000000092iE-3rzP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:17:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B58760142;
	Wed, 18 Mar 2026 17:17:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7FBC2BC87;
	Wed, 18 Mar 2026 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773854262;
	bh=x0FufSkSBt0JmK3zAYZJMpJPG4N7AJq2hUvuGYHPtHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IPxqoIT5TDspXYcqICCKpgMu1Nw/4KOwE3bz5m/m9yfeq7xoGn50BfHv2CWmFvAo/
	 FVu33vM2BUbegWV4B2Jev+ljb3HMULAZ2OHPuMykTfJnyIQhqMTokhiOIB967lPTj+
	 +fSwDA+GO7k9nghutUdIQCD64o+qbLr9ULwN1EKPQ8zM4JdlBunn52CkOFyRxq5Bpq
	 P6JuEYT0yXOmYDzg5sv3dntEUjqUYJ7Uhvv+dQaQozre79tjqpkicKUYt/Nmahtx0r
	 eoegWVlVBcwwpAfjhGPWwQMvtoPPvG/53Mci2Th7y1T9hWbhhfC7gzlkPwJgyUuKLU
	 Rn/oXzYra6QBQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2 4/4] selftests/bpf: Adjust wasted entries threshold for ARM64 BRBE
Date: Wed, 18 Mar 2026 10:16:58 -0700
Message-ID: <20260318171706.2840512-5-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318171706.2840512-1-puranjay@kernel.org>
References: <20260318171706.2840512-1-puranjay@kernel.org>
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
2.52.0


