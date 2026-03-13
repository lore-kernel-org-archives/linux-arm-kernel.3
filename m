Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36796107BCD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UMtuVEFD2T43+F10rGmWLIj2Z7Hr+qQ1fmwTRpqp9oo=; b=lcJBgNLrYwqyKO8vemBcNsqd0R
	O8l+L/4wYw0SXUf/10hgB67nVpW4DWDqPQAZXGk4TH25I3X8mBqFYwBbBpjxDthNTfp6zY/I0EWAz
	BBAgpAeLAJp0UEuYFIOhUCUs+zE4wcgDlDZQrHrR5QzTRHpsQsJiV+dBl5Yh/2o4bGkzCtPmOJ0mM
	H4FHctCjh+C06A1ZJTqDYljSc6UuEaaJtXmSfQlVHch0+W4f53I7oUgmUXToCJKH0T/Rr0FXjNLfw
	aqSi3GptmAysNy45zUyR6xPDEV7vfitAY8UbBC4xXncKBks6iJIYD3fPSWicwpbC3C86m46eCWbQE
	34eBZAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16sA-00000000qN3-3wXV;
	Fri, 13 Mar 2026 18:04:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16s6-00000000qLE-1S2h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 18:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 110F34025A;
	Fri, 13 Mar 2026 18:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4C5C19424;
	Fri, 13 Mar 2026 18:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773425065;
	bh=/hJzZqLtW90/z2cs76iSHZO9bAMYHyE+DmDY/xzj7dk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JrLB9pUHNrt7KrF2ESCD69HTOOsFnghTyF3hfod84m2fJzISUaRXcJMj8j0gCj87T
	 /FbVMfiQ1z4mScDvxuzJ3Qd1BJZRn6t/FtTevOpNUzDX+EA43gN1h5zbJVnEUZYewn
	 aLg6VnPMouUcvQ9ZUfTgVpZlxubVFx5BEqv2imL01qr+WG4DSRM+c/wlFs9OpyTE8I
	 0kxS3JAqrVNL/PW2793MrCCGVQUISPb0zs5TGFWrJQmcplYXdqCxf1FxP0bOoq3KxN
	 05JgN2KmGnU4oLRxa8wyustIsQZWr+hGXkj/AWw/sTAQFEV3pktW0ddJfXxFutCe5A
	 aFaqWB7BeTLeg==
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
Subject: [PATCH bpf 3/3] selftests/bpf: Adjust wasted entries threshold for ARM64 BRBE
Date: Fri, 13 Mar 2026 11:03:34 -0700
Message-ID: <20260313180352.3800358-4-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260313180352.3800358-1-puranjay@kernel.org>
References: <20260313180352.3800358-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_110426_423062_65CB6B75 
X-CRM114-Status: GOOD (  10.01  )
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
resulting in about 13 wasted entries. The overhead comes from
__bpf_prog_exit_recur which on ARM64 makes out-of-line calls to
__rcu_read_unlock and generates more conditional branches than x86:

  [#24] dump_bpf_prog+0x118d0       ->  __bpf_prog_exit_recur+0x0
  [#23] __bpf_prog_exit_recur+0x78  ->  __bpf_prog_exit_recur+0xf4
  [#22] __bpf_prog_exit_recur+0xf8  ->  __bpf_prog_exit_recur+0x80
  [#21] __bpf_prog_exit_recur+0x80  ->  __rcu_read_unlock+0x0
  [#20] __rcu_read_unlock+0x24      ->  __bpf_prog_exit_recur+0x84
  [#19] __bpf_prog_exit_recur+0xe0  ->  __bpf_prog_exit_recur+0x11c
  [#18] __bpf_prog_exit_recur+0x120 ->  __bpf_prog_exit_recur+0xe8
  [#17] __bpf_prog_exit_recur+0xf0  ->  dump_bpf_prog+0x118d4

Increase the threshold to < 16 to accommodate ARM64.

The test passes after the change:

 [root@(none) bpf]# ./test_progs -t get_branch_snapshot
 #136     get_branch_snapshot:OK
 Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 .../selftests/bpf/prog_tests/get_branch_snapshot.c       | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c b/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c
index 0394a1156d99..dcb0ba3d6285 100644
--- a/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c
+++ b/tools/testing/selftests/bpf/prog_tests/get_branch_snapshot.c
@@ -116,13 +116,14 @@ void serial_test_get_branch_snapshot(void)
 
 	ASSERT_GT(skel->bss->test1_hits, 6, "find_looptest_in_lbr");
 
-	/* Given we stop LBR in software, we will waste a few entries.
+	/* Given we stop LBR/BRBE in software, we will waste a few entries.
 	 * But we should try to waste as few as possible entries. We are at
-	 * about 7 on x86_64 systems.
-	 * Add a check for < 10 so that we get heads-up when something
+	 * about 7 on x86_64 and about 13 on arm64 systems (the arm64 BPF
+	 * trampoline generates more branches than x86_64).
+	 * Add a check for < 16 so that we get heads-up when something
 	 * changes and wastes too many entries.
 	 */
-	ASSERT_LT(skel->bss->wasted_entries, 10, "check_wasted_entries");
+	ASSERT_LT(skel->bss->wasted_entries, 16, "check_wasted_entries");
 
 cleanup:
 	get_branch_snapshot__destroy(skel);
-- 
2.52.0


