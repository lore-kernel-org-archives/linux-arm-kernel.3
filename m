Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CCBC9EC7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 12:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iePCKqThvl8UucftY09/BLc7SJsp6+M3d3LYNyJg5xU=; b=iOIBLkij1IZtH/TAN/Z/PoEcZ6
	6GzBHiLJWjCQ5hKV0sADE90dtVuuPtqtMeAPtuLMydpzTqeoQ+WTBwp2U5BFOaP+99k3oa9lKGd4F
	m/yxABVWYCy7geoN8HYmBskpfHQnrkv3naEisM4URR6a6TEydnQ+toiJcgtaijfRD/6rEQq4zEOVb
	QDPpYJLo7E0rOHmZ5z9WFsBp+kKAMhdB4Ou1YfFc3HWRe5GMFjpDRnTDuaWq1fa+HbKCTKXD1+bLP
	bAH55PNpFp4pw4n06zFac9pgxZHaMtpU4Ust0NTR+dgiLuRJzd56bY25j7WOZQX2Li4uuzOkWwlIF
	BaGO3Vwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGmX-00000005JOe-3dzv;
	Mon, 12 Jan 2026 12:12:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGmU-00000005JO3-1Jb0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 12:12:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0905A4391E;
	Mon, 12 Jan 2026 12:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61294C16AAE;
	Mon, 12 Jan 2026 12:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768219941;
	bh=KYN08OfhJKdVOxdem4pFSBq1PJAMgzGcdLnB3YeasnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P2XBidzzhTmyO2SwYfh5ARhZLgNvJNHbUPixPtPUCNfnsLWXoVheNL+Urc8k0LyVg
	 9fEgCwyfa1amaJZZ4qrYkLTdwayQ/M9A4CyrCU2arz2pjo8nhxAhmX4PjfvW65XZwW
	 NehGLc77SnciQyAzAQ0MdsdMn6JQBzTwOI4U3Bu09gX+DLs2BVVuqCZePoCjaCzfpL
	 ARkvlSfzN9z5YiY5JBCzBEbafXjZlZ+LyzdbYUpcpntBJRWZPs8iSJsAtJnttDzd0c
	 ZIMoMnObhYpUD7JjxNCT/Ovckdk4vRdjEQiZ7eaopPG4QRWssbQOP3s3KuMcfskj/K
	 Pr9Od2SJJOzow==
From: Jiri Olsa <jolsa@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will Deacon <will@kernel.org>
Cc: Song Liu <song@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Yonghong Song <yhs@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mahe Tardy <mahe.tardy@gmail.com>
Subject: [PATCHv3 bpf-next 2/2] selftests/bpf: Add test for bpf_override_return helper
Date: Mon, 12 Jan 2026 13:11:57 +0100
Message-ID: <20260112121157.854473-2-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112121157.854473-1-jolsa@kernel.org>
References: <20260112121157.854473-1-jolsa@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_041222_386019_7FD0255E 
X-CRM114-Status: GOOD (  15.19  )
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

We do not actually test the bpf_override_return helper functionality
itself at the moment, only the bpf program being able to attach it.

Adding test that override prctl syscall return value on top of
kprobe and kprobe.multi.

Acked-by: Song Liu <song@kernel.org>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 .../bpf/prog_tests/kprobe_multi_test.c        | 44 +++++++++++++++++++
 .../bpf/progs/kprobe_multi_override.c         | 15 +++++++
 tools/testing/selftests/bpf/trace_helpers.h   | 12 +++++
 3 files changed, 71 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
index 6cfaa978bc9a..9caef222e528 100644
--- a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
+++ b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+#include <sys/prctl.h>
 #include <test_progs.h>
 #include "kprobe_multi.skel.h"
 #include "trace_helpers.h"
@@ -540,6 +542,46 @@ static void test_attach_override(void)
 	kprobe_multi_override__destroy(skel);
 }
 
+static void test_override(void)
+{
+	struct kprobe_multi_override *skel = NULL;
+	int err;
+
+	skel = kprobe_multi_override__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "kprobe_multi_empty__open_and_load"))
+		goto cleanup;
+
+	skel->bss->pid = getpid();
+
+	/* no override */
+	err = prctl(0xffff, 0);
+	ASSERT_EQ(err, -1, "err");
+
+	/* kprobe.multi override */
+	skel->links.test_override = bpf_program__attach_kprobe_multi_opts(skel->progs.test_override,
+						SYS_PREFIX "sys_prctl", NULL);
+	if (!ASSERT_OK_PTR(skel->links.test_override, "bpf_program__attach_kprobe_multi_opts"))
+		goto cleanup;
+
+	err = prctl(0xffff, 0);
+	ASSERT_EQ(err, 123, "err");
+
+	bpf_link__destroy(skel->links.test_override);
+	skel->links.test_override = NULL;
+
+	/* kprobe override */
+	skel->links.test_kprobe_override = bpf_program__attach_kprobe(skel->progs.test_kprobe_override,
+							false, SYS_PREFIX "sys_prctl");
+	if (!ASSERT_OK_PTR(skel->links.test_kprobe_override, "bpf_program__attach_kprobe"))
+		goto cleanup;
+
+	err = prctl(0xffff, 0);
+	ASSERT_EQ(err, 123, "err");
+
+cleanup:
+	kprobe_multi_override__destroy(skel);
+}
+
 #ifdef __x86_64__
 static void test_attach_write_ctx(void)
 {
@@ -597,6 +639,8 @@ void test_kprobe_multi_test(void)
 		test_attach_api_fails();
 	if (test__start_subtest("attach_override"))
 		test_attach_override();
+	if (test__start_subtest("override"))
+		test_override();
 	if (test__start_subtest("session"))
 		test_session_skel_api();
 	if (test__start_subtest("session_cookie"))
diff --git a/tools/testing/selftests/bpf/progs/kprobe_multi_override.c b/tools/testing/selftests/bpf/progs/kprobe_multi_override.c
index 28f8487c9059..14f39fa6d515 100644
--- a/tools/testing/selftests/bpf/progs/kprobe_multi_override.c
+++ b/tools/testing/selftests/bpf/progs/kprobe_multi_override.c
@@ -5,9 +5,24 @@
 
 char _license[] SEC("license") = "GPL";
 
+int pid = 0;
+
 SEC("kprobe.multi")
 int test_override(struct pt_regs *ctx)
 {
+	if (bpf_get_current_pid_tgid() >> 32 != pid)
+		return 0;
+
+	bpf_override_return(ctx, 123);
+	return 0;
+}
+
+SEC("kprobe")
+int test_kprobe_override(struct pt_regs *ctx)
+{
+	if (bpf_get_current_pid_tgid() >> 32 != pid)
+		return 0;
+
 	bpf_override_return(ctx, 123);
 	return 0;
 }
diff --git a/tools/testing/selftests/bpf/trace_helpers.h b/tools/testing/selftests/bpf/trace_helpers.h
index 9437bdd4afa5..a5576b2dfc26 100644
--- a/tools/testing/selftests/bpf/trace_helpers.h
+++ b/tools/testing/selftests/bpf/trace_helpers.h
@@ -4,6 +4,18 @@
 
 #include <bpf/libbpf.h>
 
+#ifdef __x86_64__
+#define SYS_PREFIX "__x64_"
+#elif defined(__s390x__)
+#define SYS_PREFIX "__s390x_"
+#elif defined(__aarch64__)
+#define SYS_PREFIX "__arm64_"
+#elif defined(__riscv)
+#define SYS_PREFIX "__riscv_"
+#else
+#define SYS_PREFIX ""
+#endif
+
 #define __ALIGN_MASK(x, mask)	(((x)+(mask))&~(mask))
 #define ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a)-1)
 
-- 
2.52.0


