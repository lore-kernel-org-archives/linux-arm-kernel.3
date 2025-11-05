Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B81CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiUQ5+8FLYyesS1B4gyvaAybOQsKXnDyTRwQJ0HYTII=; b=WboOE+MFQnQrcpewbq2BigZt54
	4XylbsFE0ZjzsuDqrmjZiTLW3ci2M70AtuV1jynlBad+ENfWbnAbEM9767iY//VUNYQj1/M3ZNYNj
	v6XJnbloEK6hSyrrGB2IeSrgvENHJ7O56M2NVsa8cu+xac8+yI4tYNTTND8K7O4psAgbh+MoBIaJa
	xv2+gohl5K2U/vg7seaCZcmIvhLfSgjSVn5vySxKlzIl85Fi/4iC0dT3EZxEE/1PD9DMKW2UJzmDE
	jo9MO+/iryP0ED/1XxphwjXRnVLN8B9b0QtO8Gl+gPceXOt20JETyqE1kUN2Cs+1q/rw6cjeIidgP
	KCaTxw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd78-0000000Diqq-0Szw;
	Wed, 05 Nov 2025 12:59:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGd77-0000000DiqZ-00KG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 12:59:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 617CE60207;
	Wed,  5 Nov 2025 12:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7E96C4CEF8;
	Wed,  5 Nov 2025 12:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762347588;
	bh=pYdcHxsRXCEZFJBLVGty+ksLBg504S9Nj7797A0+RDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lo6PWFFomtjkMPv9RA6+wNc5mPpF9LdKXUl4uGjIockxE58Bo3dfCp+m7aVZkrxVa
	 qSHEIK+CmAFYbUKQ5qFuaFjCoLHSvcAnH7fr/jsAQ/ddBCM7szS9Vd6OISh+o/+kpz
	 yFh43T6Ne8ErIXehYOjWn412WMvKeMLGdKPs764oiZ0WYnxBq3DGSVcNmtbgjEd9/U
	 76ltNZgtGyCjjTXm0qUADIxuK1aeR0xfE1JjtcHIpeENxkSb5FPJM5IBRsFmfIitGG
	 tzfqpv11GccEVaYFnvxCgWw5S3xVY9WrwgoslXARgAjqjzvafPBypOnHRVcDkSvMW0
	 iAcJQJ013PXYw==
From: Jiri Olsa <jolsa@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Yonghong Song <yhs@fb.com>,
	Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mahe Tardy <mahe.tardy@gmail.com>
Subject: [PATCH 2/2] selftests/bpf: Add test for bpf_override_return helper
Date: Wed,  5 Nov 2025 13:59:24 +0100
Message-ID: <20251105125924.365205-2-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251105125924.365205-1-jolsa@kernel.org>
References: <20251105125924.365205-1-jolsa@kernel.org>
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

We do not actualy test the bpf_override_return helper functionality
itself at the moment, only the bpf program being able to attach it.

Adding test that override prctl syscall return value on top of
kprobe and kprobe.multi.

Signed-off-by: Jiri Olsa <jolsa@kernel.org>
---
 .../bpf/prog_tests/kprobe_multi_test.c        | 61 +++++++++++++++++++
 .../bpf/progs/kprobe_multi_override.c         | 15 +++++
 2 files changed, 76 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
index 6cfaa978bc9a..b5e5cc54b89a 100644
--- a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
+++ b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
@@ -1,4 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+#include <sys/prctl.h>
 #include <test_progs.h>
 #include "kprobe_multi.skel.h"
 #include "trace_helpers.h"
@@ -540,6 +542,63 @@ static void test_attach_override(void)
 	kprobe_multi_override__destroy(skel);
 }
 
+/* XXX I'll move this to common place and share with
+ * SYS_NANOSLEEP_KPROBE_NAME macro on repost.
+ */
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
+	if (!ASSERT_OK_PTR(skel->links.test_override, "bpf_program__attach_kprobe_multi_opts")) {
+		goto cleanup;
+	}
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
+	if (!ASSERT_OK_PTR(skel->links.test_kprobe_override, "bpf_program__attach_kprobe")) {
+		goto cleanup;
+	}
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
@@ -597,6 +656,8 @@ void test_kprobe_multi_test(void)
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
-- 
2.51.1


