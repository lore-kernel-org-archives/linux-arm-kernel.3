Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E347C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekHwziOYa71/KxCLz9kxR3k6w8ssyZhYpJA+Kg/5PDU=; b=MG7aLHLekpILyDqzDZe+ASozkA
	5mHtY8ivCD+fWoPwEoMiR3T+Eh8F0MpGBKw7G8EDrU+BXUTXazxSstQSr0UTDD12aRb7qmu4Uh0iA
	b0KLM84KVU+CGVI1pz+IdPYocR96CvCkbDrag2ZabmsfYGTpKyVuLufa7xqZfuAXHuRddSBMFwi9T
	p09m+HxoOiEdzLVfdtMqGrThdhnva1KyLKvNCnmpRrovLCW3NxYCeZlX8qy1cbi4DlJkFU1m5sa4g
	GN8oIRpGnn7XQ0cGdbOlDli7Ww0x1PzZu9WAP0n8uu+Lna9ldTqbEm1XAixI8pj764DQ5Jfv9v4yf
	Di6l3Gog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMLD-00000002znU-44CN;
	Mon, 27 Jul 2026 14:30:03 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMLB-00000002zlQ-1ydM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:30:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785162599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekHwziOYa71/KxCLz9kxR3k6w8ssyZhYpJA+Kg/5PDU=;
	b=dTaBFvVGQzpRGOhAX1UlQkR4jYGmf72gDgG0gnQz5cFhTan5QM7OtC1MhQ1ULf6Hx14P7R
	p7NFM72XmVDw7eQyfVJXgUr1Kjtwx5ek2oJZrEpM8dZHBbChvOpWEJc7OZaiKdWxDimhIM
	VpbwVDEXWnEX/Ft5/++x/o0aftouYho=
From: Leon Hwang <leon.hwang@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests/bpf: Enable tracing_multi tests on arm64
Date: Mon, 27 Jul 2026 22:28:44 +0800
Message-ID: <20260727142844.21212-3-leon.hwang@linux.dev>
In-Reply-To: <20260727142844.21212-1-leon.hwang@linux.dev>
References: <20260727142844.21212-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_073001_672957_467A148E 
X-CRM114-Status: GOOD (  10.87  )
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

arm64 now supports dynamic ftrace direct calls backed by a single
ftrace_ops, which enables BPF tracing multi links.

Define ARCH_SUPPORTS_TRACING_MULTI_LINK for x86-64 and arm64, and use the
shared capability to gate the tracing_multi functional, rollback,
and attach benchmark tests.

This allows the tests to run on arm64 while continuing to skip
architectures without tracing multi link support. It also prevents the
rollback test from treating an unsupported-link error as its expected
attachment failure.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 tools/testing/selftests/bpf/prog_tests/tracing_multi.c | 9 +++++++--
 tools/testing/selftests/bpf/test_progs.h               | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/tracing_multi.c b/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
index f02ffc7f41d7..5aa48e090340 100644
--- a/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
+++ b/tools/testing/selftests/bpf/prog_tests/tracing_multi.c
@@ -612,7 +612,7 @@ void serial_test_tracing_multi_bench_attach(void)
 	struct btf *btf;
 	int err;
 
-#ifndef __x86_64__
+#if !ARCH_SUPPORTS_TRACING_MULTI_LINK
 	test__skip();
 	return;
 #endif
@@ -923,6 +923,11 @@ static void test_rollback_unlink(void)
 
 void serial_test_tracing_multi_attach_rollback(void)
 {
+#if !ARCH_SUPPORTS_TRACING_MULTI_LINK
+	test__skip();
+	return;
+#endif
+
 	if (test__start_subtest("put"))
 		test_rollback_put();
 	if (test__start_subtest("unlink"))
@@ -931,7 +936,7 @@ void serial_test_tracing_multi_attach_rollback(void)
 
 void test_tracing_multi_test(void)
 {
-#ifndef __x86_64__
+#if !ARCH_SUPPORTS_TRACING_MULTI_LINK
 	test__skip();
 	return;
 #endif
diff --git a/tools/testing/selftests/bpf/test_progs.h b/tools/testing/selftests/bpf/test_progs.h
index 2cf950afcd85..b1498e84773c 100644
--- a/tools/testing/selftests/bpf/test_progs.h
+++ b/tools/testing/selftests/bpf/test_progs.h
@@ -567,4 +567,10 @@ void validate_msgs(const char *log_buf, struct expected_msgs *msgs,
 void free_msgs(struct expected_msgs *msgs);
 void verify_test_stderr(struct bpf_object *obj, struct bpf_program *prog);
 
+#if defined(__x86_64__) || defined(__aarch64__)
+#define ARCH_SUPPORTS_TRACING_MULTI_LINK 1
+#else
+#define ARCH_SUPPORTS_TRACING_MULTI_LINK 0
+#endif
+
 #endif /* __TEST_PROGS_H */
-- 
2.55.0


