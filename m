Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5E4D6B07A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UsgKjphUXvRPEydfwuOJKsLCOnCuQnH8s33K54ne5cQ=; b=2PMKbQtqrFw2waAYOyh03xD66q
	Z13g64i/btklEbP957bOUEy+gVMzpV1zCvPGUyySvK+T30cFe2qzDzQrfkvkO/XruiV8IlKk6Ng64
	ZpoJ+h9yTHkVP5REJ0w0chVZAtlRT69hGbpDQbRP/Ph0iXEwZgGodNRTCoDxg8wJg9g5yy9/ewJfT
	6J66UGaQKwRgqOk/ATK16e0RHpD/hXqYcftqW/Jr3ullQLh1T83rpMpSDNF+eRLZ1I28xXvFJN2Rw
	oBfqvpCdwQ5KM9BEp7ohxKRTilTfxpgAeUHqwZdMizqrd5GL4YoiEen0A7B1ZZqspZ3P7KsZda0TU
	fENFtI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUIx-00000000INr-2vM6;
	Thu, 29 Jan 2026 15:51:35 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUIt-00000000IMU-2aMu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:51:34 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769701889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UsgKjphUXvRPEydfwuOJKsLCOnCuQnH8s33K54ne5cQ=;
	b=Jg+RgFu3Tk22UtFb2WkFeSavtg/YuMaVdG/oKHvrWJmscr0ZN5hAK84SirZQkzncAQtWrn
	vD4ngzBWSa3iMFlcBRCm1EMX6BJRkK1OWXFl+D/kMwYI4k7vfvp59Jtk5W3un0O1pUnGcO
	gdTqgXbpruynjlUAlo7MENVu5PLipHQ=
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next v4 1/3] bpf: Add bpf_jit_supports_fsession()
Date: Thu, 29 Jan 2026 23:49:51 +0800
Message-ID: <20260129154953.66915-2-leon.hwang@linux.dev>
In-Reply-To: <20260129154953.66915-1-leon.hwang@linux.dev>
References: <20260129154953.66915-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_075131_949875_C988E825 
X-CRM114-Status: GOOD (  12.11  )
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

The added fsession does not prevent running on those architectures, that
haven't added fsession support.

For example, try to run fsession tests on arm64:

test_fsession_basic:PASS:fsession_test__open_and_load 0 nsec
test_fsession_basic:PASS:fsession_attach 0 nsec
check_result:FAIL:test_run_opts err unexpected error: -14 (errno 14)

In order to prevent such errors, add bpf_jit_supports_fsession() to guard
those architectures.

Fixes: 2d419c44658f ("bpf: add fsession support")
Acked-by: Puranjay Mohan <puranjay@kernel.org>
Tested-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 arch/x86/net/bpf_jit_comp.c                   |  5 +++
 include/linux/filter.h                        |  1 +
 kernel/bpf/core.c                             |  5 +++
 kernel/bpf/verifier.c                         |  5 +++
 .../selftests/bpf/prog_tests/fsession_test.c  | 32 ++++++++++++++-----
 5 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 5a075e06cf45..070ba80e39d7 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -4112,3 +4112,8 @@ bool bpf_jit_supports_timed_may_goto(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_fsession(void)
+{
+	return true;
+}
diff --git a/include/linux/filter.h b/include/linux/filter.h
index fd54fed8f95f..4e1cb4f91f49 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -1167,6 +1167,7 @@ bool bpf_jit_supports_arena(void);
 bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena);
 bool bpf_jit_supports_private_stack(void);
 bool bpf_jit_supports_timed_may_goto(void);
+bool bpf_jit_supports_fsession(void);
 u64 bpf_arch_uaddress_limit(void);
 void arch_bpf_stack_walk(bool (*consume_fn)(void *cookie, u64 ip, u64 sp, u64 bp), void *cookie);
 u64 arch_bpf_timed_may_goto(void);
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index e0b8a8a5aaa9..3b1eb632bf7c 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -3142,6 +3142,11 @@ bool __weak bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 	return false;
 }
 
+bool __weak bpf_jit_supports_fsession(void)
+{
+	return false;
+}
+
 u64 __weak bpf_arch_uaddress_limit(void)
 {
 #if defined(CONFIG_64BIT) && defined(CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index e7ff8394e0da..3f6ac0095ca6 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -24874,6 +24874,11 @@ int bpf_check_attach_target(struct bpf_verifier_log *log,
 	case BPF_TRACE_FENTRY:
 	case BPF_TRACE_FEXIT:
 	case BPF_TRACE_FSESSION:
+		if (prog->expected_attach_type == BPF_TRACE_FSESSION &&
+		    !bpf_jit_supports_fsession()) {
+			bpf_log(log, "JIT does not support fsession\n");
+			return -EOPNOTSUPP;
+		}
 		if (!btf_type_is_func(t)) {
 			bpf_log(log, "attach_btf_id %u is not a function\n",
 				btf_id);
diff --git a/tools/testing/selftests/bpf/prog_tests/fsession_test.c b/tools/testing/selftests/bpf/prog_tests/fsession_test.c
index 0c4b428e1cee..a299aeb8cc2e 100644
--- a/tools/testing/selftests/bpf/prog_tests/fsession_test.c
+++ b/tools/testing/selftests/bpf/prog_tests/fsession_test.c
@@ -29,8 +29,16 @@ static void test_fsession_basic(void)
 	struct fsession_test *skel = NULL;
 	int err;
 
-	skel = fsession_test__open_and_load();
-	if (!ASSERT_OK_PTR(skel, "fsession_test__open_and_load"))
+	skel = fsession_test__open();
+	if (!ASSERT_OK_PTR(skel, "fsession_test__open"))
+		return;
+
+	err = fsession_test__load(skel);
+	if (err == -EOPNOTSUPP) {
+		test__skip();
+		goto cleanup;
+	}
+	if (!ASSERT_OK(err, "fsession_test__load"))
 		goto cleanup;
 
 	err = fsession_test__attach(skel);
@@ -47,8 +55,16 @@ static void test_fsession_reattach(void)
 	struct fsession_test *skel = NULL;
 	int err;
 
-	skel = fsession_test__open_and_load();
-	if (!ASSERT_OK_PTR(skel, "fsession_test__open_and_load"))
+	skel = fsession_test__open();
+	if (!ASSERT_OK_PTR(skel, "fsession_test__open"))
+		return;
+
+	err = fsession_test__load(skel);
+	if (err == -EOPNOTSUPP) {
+		test__skip();
+		goto cleanup;
+	}
+	if (!ASSERT_OK(err, "fsession_test__load"))
 		goto cleanup;
 
 	/* first attach */
@@ -94,6 +110,10 @@ static void test_fsession_cookie(void)
 	bpf_program__set_autoload(skel->progs.test6, false);
 
 	err = fsession_test__load(skel);
+	if (err == -EOPNOTSUPP) {
+		test__skip();
+		goto cleanup;
+	}
 	if (!ASSERT_OK(err, "fsession_test__load"))
 		goto cleanup;
 
@@ -111,10 +131,6 @@ static void test_fsession_cookie(void)
 
 void test_fsession_test(void)
 {
-#if !defined(__x86_64__)
-	test__skip();
-	return;
-#endif
 	if (test__start_subtest("fsession_test"))
 		test_fsession_basic();
 	if (test__start_subtest("fsession_reattach"))
-- 
2.52.0


