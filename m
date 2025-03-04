Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601F2C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 01:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=As2DPcESZJWowI4ZYutFcnaDQOl7DP+t093UG1sAE1A=; b=Om8PFjBwI9Y3cJgFjusVvg4PBh
	E4RC3R5ahB7G9go/uCQ6Fpt+I4LHQ1ylIGANR859W+iadco/XcOkmrV7AjdHwfQMBAwTYkdyhL/8f
	G6uvW0Oy4mQobNeCi5bLTwyNDomu+uf2+KH74Q1ri+kw8xeE1K4S1x8BBKnMP3Paa08CHbf6/dKGt
	xby2sJ1dotKN/6///Yis3jCudY7+VRP8v6WroYG6jgi98D+mhOw6d7rHBV5QOADb7rGBN9/BhcF1Q
	M8dk/H5w+okTLLuZ0jeWWYQXFmv6htszROfv3s7dW5uGIoPtFFKpet9lDUC1NV9fNOTxKJmYWndjn
	5EOHTfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGuD-00000002kMZ-1Cmp;
	Tue, 04 Mar 2025 01:17:09 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGkF-00000002jBn-3ZsG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:06:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2233b154004so94759095ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 17:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741050410; x=1741655210; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=As2DPcESZJWowI4ZYutFcnaDQOl7DP+t093UG1sAE1A=;
        b=I5ce2TuyAdZZMtNXJDxihh0KNqU1vL02L+QFjIXKh680W7KjhJ80GYeMED/qI8mmKK
         x7GjOhWIzgjwj3KF/Ui9c6Q/AuQfgw62DguYqepla+GzpQzBRcgx1jbxaxPfSK+WONF2
         tsRtLBXdU42LBztIYNAZuaUzQuxqA/uknxDZsKRUQTwuwrQxaigS4hEEqNTSuQKg01/O
         slDOg3jYLSCTOW23s+IzfcQO/1559Ztvw+25ZmzqkA3iC0/mnoo6lesV6NlvM0ktv4dW
         062dtMj6ZpiopiIswbGYrjwEzHjdRblMjm+EMSXKnABhuifXduvTT/ja+pZAidowqXYF
         eNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741050410; x=1741655210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=As2DPcESZJWowI4ZYutFcnaDQOl7DP+t093UG1sAE1A=;
        b=DjXfqYCmHsHUTfHTjL7x8kkhhQhzia5rWVFvET0IpoY/qt3OeV1+ybDcGgMghNBd1f
         40GhCoGkrUF2u2+xqhAjgraQkD5wxXeYAvEzx4iQMZsqpgaDa/Zci3L0PNdi1FnfVjP9
         GcEKwe2w3LCOzLrKH4lRyCk6uxoiP67+avvFh2Bn5VAJvudslQVT7mCgn4GNpd1vEzBX
         hVRvMD9kopIX9eRTvoOmkn9V3kxUPXJtnwn7Ge6mRzLX9so1bLB/dm6D0g6MQslG+319
         sYi/IRqFBWmMJ1hq3wd9Zsgi4axIK9vcekcRVsteFp7OEW7q/ZCyfay2Cza5oo7ZFyQy
         n4yA==
X-Forwarded-Encrypted: i=1; AJvYcCUf3lkbO890had+Eyfgcvc2lnyOBhTKp47YO67/1b7JH9OV2Je9SzcyVBPAALU8As0pQtDPz0EupYTHMwvUie2N@lists.infradead.org
X-Gm-Message-State: AOJu0YxkPnqgcniKqm7SNP9sm23nI4Cfl+riTcIuIPgrKUZKsRojyH7q
	FJGcjg4mQu9zACY7u2tNq3DGZvfirNk2OEn0tyF6mIKcifVkBUOkMjUp7S2uDsssH/F49MkfS9E
	FUclaJWhu1w==
X-Google-Smtp-Source: AGHT+IEMaT1EzAdyuD8snSqSfrtCGWQkZ0wVvD8/jL7m7XlzOk56dx2kP75+TyFyvKxxtK47PePEr4ApsVmu1Q==
X-Received: from pfbjw37.prod.google.com ([2002:a05:6a00:92a5:b0:736:46a8:452d])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f693:b0:223:4985:9da with SMTP id d9443c01a7336-2236920baf1mr209007915ad.50.1741050410618;
 Mon, 03 Mar 2025 17:06:50 -0800 (PST)
Date: Tue,  4 Mar 2025 01:06:46 +0000
In-Reply-To: <cover.1741049567.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1741049567.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <1b46c6feaf0f1b6984d9ec80e500cc7383e9da1a.1741049567.git.yepeilin@google.com>
Subject: [PATCH bpf-next v6 6/6] selftests/bpf: Add selftests for load-acquire
 and store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_170651_899018_F4FD981D 
X-CRM114-Status: GOOD (  23.20  )
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

Add several ./test_progs tests:

  - arena_atomics/load_acquire
  - arena_atomics/store_release
  - verifier_load_acquire/*
  - verifier_store_release/*
  - verifier_precision/bpf_load_acquire
  - verifier_precision/bpf_store_release

The last two tests are added to check if backtrack_insn() handles the
new instructions correctly.

Additionally, the last test also makes sure that the verifier
"remembers" the value (in src_reg) we store-release into e.g. a stack
slot.  For example, if we take a look at the test program:

    #0:  r1 = 8;
      /* store_release((u64 *)(r10 - 8), r1); */
    #1:  .8byte %[store_release];
    #2:  r1 = *(u64 *)(r10 - 8);
    #3:  r2 = r10;
    #4:  r2 += r1;
    #5:  r0 = 0;
    #6:  exit;

At #1, if the verifier doesn't remember that we wrote 8 to the stack,
then later at #4 we would be adding an unbounded scalar value to the
stack pointer, which would cause the program to be rejected:

  VERIFIER LOG:
  =============
...
  math between fp pointer and register with unbounded min value is not allowed

For easier CI integration, instead of using built-ins like
__atomic_{load,store}_n() which depend on the new
__BPF_FEATURE_LOAD_ACQ_STORE_REL pre-defined macro, manually craft
load-acquire/store-release instructions using __imm_insn(), as suggested
by Eduard.

All new tests depend on:

  (1) Clang major version >= 18, and
  (2) ENABLE_ATOMICS_TESTS is defined (currently implies -mcpu=v3 or
      v4), and
  (3) JIT supports load-acquire/store-release (currently arm64 and
      x86-64)

In .../progs/arena_atomics.c:

  /* 8-byte-aligned */
  __u8 __arena_global load_acquire8_value = 0x12;
  /* 1-byte hole */
  __u16 __arena_global load_acquire16_value = 0x1234;

That 1-byte hole in the .addr_space.1 ELF section caused clang-17 to
crash:

  fatal error: error in backend: unable to write nop sequence of 1 bytes

To work around such llvm-17 CI job failures, conditionally define
__arena_global variables as 64-bit if __clang_major__ < 18, to make sure
.addr_space.1 has no holes.  Ideally we should avoid compiling this file
using clang-17 at all (arena tests depend on
__BPF_FEATURE_ADDR_SPACE_CAST, and are skipped for llvm-17 anyway), but
that is a separate topic.

Acked-by: Eduard Zingerman <eddyz87@gmail.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 .../selftests/bpf/prog_tests/arena_atomics.c  |  66 ++++-
 .../selftests/bpf/prog_tests/verifier.c       |   4 +
 .../selftests/bpf/progs/arena_atomics.c       | 121 +++++++-
 .../bpf/progs/verifier_load_acquire.c         | 197 +++++++++++++
 .../selftests/bpf/progs/verifier_precision.c  |  49 ++++
 .../bpf/progs/verifier_store_release.c        | 264 ++++++++++++++++++
 6 files changed, 698 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_load_acquire.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_store_release.c

diff --git a/tools/testing/selftests/bpf/prog_tests/arena_atomics.c b/tools/testing/selftests/bpf/prog_tests/arena_atomics.c
index 26e7c06c6cb4..d98577a6babc 100644
--- a/tools/testing/selftests/bpf/prog_tests/arena_atomics.c
+++ b/tools/testing/selftests/bpf/prog_tests/arena_atomics.c
@@ -162,6 +162,66 @@ static void test_uaf(struct arena_atomics *skel)
 	ASSERT_EQ(skel->arena->uaf_recovery_fails, 0, "uaf_recovery_fails");
 }
 
+static void test_load_acquire(struct arena_atomics *skel)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
+	int err, prog_fd;
+
+	if (skel->data->skip_lacq_srel_tests) {
+		printf("%s:SKIP: ENABLE_ATOMICS_TESTS not defined, Clang doesn't support addr_space_cast, and/or JIT doesn't support load-acquire\n",
+		       __func__);
+		test__skip();
+		return;
+	}
+
+	/* No need to attach it, just run it directly */
+	prog_fd = bpf_program__fd(skel->progs.load_acquire);
+	err = bpf_prog_test_run_opts(prog_fd, &topts);
+	if (!ASSERT_OK(err, "test_run_opts err"))
+		return;
+	if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
+		return;
+
+	ASSERT_EQ(skel->arena->load_acquire8_result, 0x12,
+		  "load_acquire8_result");
+	ASSERT_EQ(skel->arena->load_acquire16_result, 0x1234,
+		  "load_acquire16_result");
+	ASSERT_EQ(skel->arena->load_acquire32_result, 0x12345678,
+		  "load_acquire32_result");
+	ASSERT_EQ(skel->arena->load_acquire64_result, 0x1234567890abcdef,
+		  "load_acquire64_result");
+}
+
+static void test_store_release(struct arena_atomics *skel)
+{
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
+	int err, prog_fd;
+
+	if (skel->data->skip_lacq_srel_tests) {
+		printf("%s:SKIP: ENABLE_ATOMICS_TESTS not defined, Clang doesn't support addr_space_cast, and/or JIT doesn't support store-release\n",
+		       __func__);
+		test__skip();
+		return;
+	}
+
+	/* No need to attach it, just run it directly */
+	prog_fd = bpf_program__fd(skel->progs.store_release);
+	err = bpf_prog_test_run_opts(prog_fd, &topts);
+	if (!ASSERT_OK(err, "test_run_opts err"))
+		return;
+	if (!ASSERT_OK(topts.retval, "test_run_opts retval"))
+		return;
+
+	ASSERT_EQ(skel->arena->store_release8_result, 0x12,
+		  "store_release8_result");
+	ASSERT_EQ(skel->arena->store_release16_result, 0x1234,
+		  "store_release16_result");
+	ASSERT_EQ(skel->arena->store_release32_result, 0x12345678,
+		  "store_release32_result");
+	ASSERT_EQ(skel->arena->store_release64_result, 0x1234567890abcdef,
+		  "store_release64_result");
+}
+
 void test_arena_atomics(void)
 {
 	struct arena_atomics *skel;
@@ -171,7 +231,7 @@ void test_arena_atomics(void)
 	if (!ASSERT_OK_PTR(skel, "arena atomics skeleton open"))
 		return;
 
-	if (skel->data->skip_tests) {
+	if (skel->data->skip_all_tests) {
 		printf("%s:SKIP:no ENABLE_ATOMICS_TESTS or no addr_space_cast support in clang",
 		       __func__);
 		test__skip();
@@ -198,6 +258,10 @@ void test_arena_atomics(void)
 		test_xchg(skel);
 	if (test__start_subtest("uaf"))
 		test_uaf(skel);
+	if (test__start_subtest("load_acquire"))
+		test_load_acquire(skel);
+	if (test__start_subtest("store_release"))
+		test_store_release(skel);
 
 cleanup:
 	arena_atomics__destroy(skel);
diff --git a/tools/testing/selftests/bpf/prog_tests/verifier.c b/tools/testing/selftests/bpf/prog_tests/verifier.c
index 8a0e1ff8a2dc..cfe47b529e01 100644
--- a/tools/testing/selftests/bpf/prog_tests/verifier.c
+++ b/tools/testing/selftests/bpf/prog_tests/verifier.c
@@ -45,6 +45,7 @@
 #include "verifier_ldsx.skel.h"
 #include "verifier_leak_ptr.skel.h"
 #include "verifier_linked_scalars.skel.h"
+#include "verifier_load_acquire.skel.h"
 #include "verifier_loops1.skel.h"
 #include "verifier_lwt.skel.h"
 #include "verifier_map_in_map.skel.h"
@@ -80,6 +81,7 @@
 #include "verifier_spill_fill.skel.h"
 #include "verifier_spin_lock.skel.h"
 #include "verifier_stack_ptr.skel.h"
+#include "verifier_store_release.skel.h"
 #include "verifier_subprog_precision.skel.h"
 #include "verifier_subreg.skel.h"
 #include "verifier_tailcall_jit.skel.h"
@@ -173,6 +175,7 @@ void test_verifier_int_ptr(void)              { RUN(verifier_int_ptr); }
 void test_verifier_iterating_callbacks(void)  { RUN(verifier_iterating_callbacks); }
 void test_verifier_jeq_infer_not_null(void)   { RUN(verifier_jeq_infer_not_null); }
 void test_verifier_jit_convergence(void)      { RUN(verifier_jit_convergence); }
+void test_verifier_load_acquire(void)         { RUN(verifier_load_acquire); }
 void test_verifier_ld_ind(void)               { RUN(verifier_ld_ind); }
 void test_verifier_ldsx(void)                  { RUN(verifier_ldsx); }
 void test_verifier_leak_ptr(void)             { RUN(verifier_leak_ptr); }
@@ -211,6 +214,7 @@ void test_verifier_sockmap_mutate(void)       { RUN(verifier_sockmap_mutate); }
 void test_verifier_spill_fill(void)           { RUN(verifier_spill_fill); }
 void test_verifier_spin_lock(void)            { RUN(verifier_spin_lock); }
 void test_verifier_stack_ptr(void)            { RUN(verifier_stack_ptr); }
+void test_verifier_store_release(void)        { RUN(verifier_store_release); }
 void test_verifier_subprog_precision(void)    { RUN(verifier_subprog_precision); }
 void test_verifier_subreg(void)               { RUN(verifier_subreg); }
 void test_verifier_tailcall_jit(void)         { RUN(verifier_tailcall_jit); }
diff --git a/tools/testing/selftests/bpf/progs/arena_atomics.c b/tools/testing/selftests/bpf/progs/arena_atomics.c
index 40dd57fca5cc..a52feff98112 100644
--- a/tools/testing/selftests/bpf/progs/arena_atomics.c
+++ b/tools/testing/selftests/bpf/progs/arena_atomics.c
@@ -6,6 +6,8 @@
 #include <stdbool.h>
 #include <stdatomic.h>
 #include "bpf_arena_common.h"
+#include "../../../include/linux/filter.h"
+#include "bpf_misc.h"
 
 struct {
 	__uint(type, BPF_MAP_TYPE_ARENA);
@@ -19,9 +21,17 @@ struct {
 } arena SEC(".maps");
 
 #if defined(ENABLE_ATOMICS_TESTS) && defined(__BPF_FEATURE_ADDR_SPACE_CAST)
-bool skip_tests __attribute((__section__(".data"))) = false;
+bool skip_all_tests __attribute((__section__(".data"))) = false;
 #else
-bool skip_tests = true;
+bool skip_all_tests = true;
+#endif
+
+#if defined(ENABLE_ATOMICS_TESTS) &&		  \
+	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+bool skip_lacq_srel_tests __attribute((__section__(".data"))) = false;
+#else
+bool skip_lacq_srel_tests = true;
 #endif
 
 __u32 pid = 0;
@@ -274,4 +284,111 @@ int uaf(const void *ctx)
 	return 0;
 }
 
+#if __clang_major__ >= 18
+__u8 __arena_global load_acquire8_value = 0x12;
+__u16 __arena_global load_acquire16_value = 0x1234;
+__u32 __arena_global load_acquire32_value = 0x12345678;
+__u64 __arena_global load_acquire64_value = 0x1234567890abcdef;
+
+__u8 __arena_global load_acquire8_result = 0;
+__u16 __arena_global load_acquire16_result = 0;
+__u32 __arena_global load_acquire32_result = 0;
+__u64 __arena_global load_acquire64_result = 0;
+#else
+/* clang-17 crashes if the .addr_space.1 ELF section has holes. Work around
+ * this issue by defining the below variables as 64-bit.
+ */
+__u64 __arena_global load_acquire8_value;
+__u64 __arena_global load_acquire16_value;
+__u64 __arena_global load_acquire32_value;
+__u64 __arena_global load_acquire64_value;
+
+__u64 __arena_global load_acquire8_result;
+__u64 __arena_global load_acquire16_result;
+__u64 __arena_global load_acquire32_result;
+__u64 __arena_global load_acquire64_result;
+#endif
+
+SEC("raw_tp/sys_enter")
+int load_acquire(const void *ctx)
+{
+#if defined(ENABLE_ATOMICS_TESTS) &&		  \
+	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+
+#define LOAD_ACQUIRE_ARENA(SIZEOP, SIZE, SRC, DST)	\
+	{ asm volatile (				\
+	"r1 = %[" #SRC "] ll;"				\
+	"r1 = addr_space_cast(r1, 0x0, 0x1);"		\
+	".8byte %[load_acquire_insn];"			\
+	"r3 = %[" #DST "] ll;"				\
+	"r3 = addr_space_cast(r3, 0x0, 0x1);"		\
+	"*(" #SIZE " *)(r3 + 0) = r2;"			\
+	:						\
+	: __imm_addr(SRC),				\
+	  __imm_insn(load_acquire_insn,			\
+		     BPF_ATOMIC_OP(BPF_##SIZEOP, BPF_LOAD_ACQ,	\
+				   BPF_REG_2, BPF_REG_1, 0)),	\
+	  __imm_addr(DST)				\
+	: __clobber_all); }				\
+
+	LOAD_ACQUIRE_ARENA(B, u8, load_acquire8_value, load_acquire8_result)
+	LOAD_ACQUIRE_ARENA(H, u16, load_acquire16_value,
+			   load_acquire16_result)
+	LOAD_ACQUIRE_ARENA(W, u32, load_acquire32_value,
+			   load_acquire32_result)
+	LOAD_ACQUIRE_ARENA(DW, u64, load_acquire64_value,
+			   load_acquire64_result)
+#undef LOAD_ACQUIRE_ARENA
+
+#endif
+	return 0;
+}
+
+#if __clang_major__ >= 18
+__u8 __arena_global store_release8_result = 0;
+__u16 __arena_global store_release16_result = 0;
+__u32 __arena_global store_release32_result = 0;
+__u64 __arena_global store_release64_result = 0;
+#else
+/* clang-17 crashes if the .addr_space.1 ELF section has holes. Work around
+ * this issue by defining the below variables as 64-bit.
+ */
+__u64 __arena_global store_release8_result;
+__u64 __arena_global store_release16_result;
+__u64 __arena_global store_release32_result;
+__u64 __arena_global store_release64_result;
+#endif
+
+SEC("raw_tp/sys_enter")
+int store_release(const void *ctx)
+{
+#if defined(ENABLE_ATOMICS_TESTS) &&		  \
+	defined(__BPF_FEATURE_ADDR_SPACE_CAST) && \
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+
+#define STORE_RELEASE_ARENA(SIZEOP, DST, VAL)	\
+	{ asm volatile (			\
+	"r1 = " VAL ";"				\
+	"r2 = %[" #DST "] ll;"			\
+	"r2 = addr_space_cast(r2, 0x0, 0x1);"	\
+	".8byte %[store_release_insn];"		\
+	:					\
+	: __imm_addr(DST),			\
+	  __imm_insn(store_release_insn,	\
+		     BPF_ATOMIC_OP(BPF_##SIZEOP, BPF_STORE_REL,	\
+				   BPF_REG_2, BPF_REG_1, 0))	\
+	: __clobber_all); }			\
+
+	STORE_RELEASE_ARENA(B, store_release8_result, "0x12")
+	STORE_RELEASE_ARENA(H, store_release16_result, "0x1234")
+	STORE_RELEASE_ARENA(W, store_release32_result, "0x12345678")
+	STORE_RELEASE_ARENA(DW, store_release64_result,
+			    "0x1234567890abcdef ll")
+#undef STORE_RELEASE_ARENA
+
+#endif
+	return 0;
+}
+
 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/verifier_load_acquire.c b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
new file mode 100644
index 000000000000..ff308f24d745
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/verifier_load_acquire.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Google LLC. */
+
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+#include "../../../include/linux/filter.h"
+#include "bpf_misc.h"
+
+#if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) && \
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+
+SEC("socket")
+__description("load-acquire, 8-bit")
+__success __success_unpriv __retval(0x12)
+__naked void load_acquire_8(void)
+{
+	asm volatile (
+	"w1 = 0x12;"
+	"*(u8 *)(r10 - 1) = w1;"
+	".8byte %[load_acquire_insn];" // w0 = load_acquire((u8 *)(r10 - 1));
+	"exit;"
+	:
+	: __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -1))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("load-acquire, 16-bit")
+__success __success_unpriv __retval(0x1234)
+__naked void load_acquire_16(void)
+{
+	asm volatile (
+	"w1 = 0x1234;"
+	"*(u16 *)(r10 - 2) = w1;"
+	".8byte %[load_acquire_insn];" // w0 = load_acquire((u16 *)(r10 - 2));
+	"exit;"
+	:
+	: __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_H, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -2))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("load-acquire, 32-bit")
+__success __success_unpriv __retval(0x12345678)
+__naked void load_acquire_32(void)
+{
+	asm volatile (
+	"w1 = 0x12345678;"
+	"*(u32 *)(r10 - 4) = w1;"
+	".8byte %[load_acquire_insn];" // w0 = load_acquire((u32 *)(r10 - 4));
+	"exit;"
+	:
+	: __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_W, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -4))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("load-acquire, 64-bit")
+__success __success_unpriv __retval(0x1234567890abcdef)
+__naked void load_acquire_64(void)
+{
+	asm volatile (
+	"r1 = 0x1234567890abcdef ll;"
+	"*(u64 *)(r10 - 8) = r1;"
+	".8byte %[load_acquire_insn];" // r0 = load_acquire((u64 *)(r10 - 8));
+	"exit;"
+	:
+	: __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -8))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("load-acquire with uninitialized src_reg")
+__failure __failure_unpriv __msg("R2 !read_ok")
+__naked void load_acquire_with_uninitialized_src_reg(void)
+{
+	asm volatile (
+	".8byte %[load_acquire_insn];" // r0 = load_acquire((u64 *)(r2 + 0));
+	"exit;"
+	:
+	: __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_2, 0))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("load-acquire with non-pointer src_reg")
+__failure __failure_unpriv __msg("R1 invalid mem access 'scalar'")
+__naked void load_acquire_with_non_pointer_src_reg(void)
+{
+	asm volatile (
+	"r1 = 0;"
+	".8byte %[load_acquire_insn];" // r0 = load_acquire((u64 *)(r1 + 0));
+	"exit;"
+	:
+	: __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_1, 0))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("misaligned load-acquire")
+__failure __failure_unpriv __msg("misaligned stack access off")
+__flag(BPF_F_ANY_ALIGNMENT)
+__naked void load_acquire_misaligned(void)
+{
+	asm volatile (
+	"r1 = 0;"
+	"*(u64 *)(r10 - 8) = r1;"
+	".8byte %[load_acquire_insn];" // w0 = load_acquire((u32 *)(r10 - 5));
+	"exit;"
+	:
+	: __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_W, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_10, -5))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("load-acquire from ctx pointer")
+__failure __failure_unpriv __msg("BPF_ATOMIC loads from R1 ctx is not allowed")
+__naked void load_acquire_from_ctx_pointer(void)
+{
+	asm volatile (
+	".8byte %[load_acquire_insn];" // w0 = load_acquire((u8 *)(r1 + 0));
+	"exit;"
+	:
+	: __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_1, 0))
+	: __clobber_all);
+}
+
+SEC("xdp")
+__description("load-acquire from pkt pointer")
+__failure __msg("BPF_ATOMIC loads from R2 pkt is not allowed")
+__naked void load_acquire_from_pkt_pointer(void)
+{
+	asm volatile (
+	"r2 = *(u32 *)(r1 + %[xdp_md_data]);"
+	".8byte %[load_acquire_insn];" // w0 = load_acquire((u8 *)(r2 + 0));
+	"exit;"
+	:
+	: __imm_const(xdp_md_data, offsetof(struct xdp_md, data)),
+	  __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_2, 0))
+	: __clobber_all);
+}
+
+SEC("flow_dissector")
+__description("load-acquire from flow_keys pointer")
+__failure __msg("BPF_ATOMIC loads from R2 flow_keys is not allowed")
+__naked void load_acquire_from_flow_keys_pointer(void)
+{
+	asm volatile (
+	"r2 = *(u64 *)(r1 + %[__sk_buff_flow_keys]);"
+	".8byte %[load_acquire_insn];" // w0 = load_acquire((u8 *)(r2 + 0));
+	"exit;"
+	:
+	: __imm_const(__sk_buff_flow_keys,
+		      offsetof(struct __sk_buff, flow_keys)),
+	  __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_2, 0))
+	: __clobber_all);
+}
+
+SEC("sk_reuseport")
+__description("load-acquire from sock pointer")
+__failure __msg("BPF_ATOMIC loads from R2 sock is not allowed")
+__naked void load_acquire_from_sock_pointer(void)
+{
+	asm volatile (
+	"r2 = *(u64 *)(r1 + %[sk_reuseport_md_sk]);"
+	".8byte %[load_acquire_insn];" // w0 = load_acquire((u8 *)(r2 + 0));
+	"exit;"
+	:
+	: __imm_const(sk_reuseport_md_sk, offsetof(struct sk_reuseport_md, sk)),
+	  __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_LOAD_ACQ, BPF_REG_0, BPF_REG_2, 0))
+	: __clobber_all);
+}
+
+#else
+
+SEC("socket")
+__description("Clang version < 18, ENABLE_ATOMICS_TESTS not defined, and/or JIT doesn't support load-acquire, use a dummy test")
+__success
+int dummy_test(void)
+{
+	return 0;
+}
+
+#endif
+
+char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/verifier_precision.c b/tools/testing/selftests/bpf/progs/verifier_precision.c
index 6b564d4c0986..6662d4b39969 100644
--- a/tools/testing/selftests/bpf/progs/verifier_precision.c
+++ b/tools/testing/selftests/bpf/progs/verifier_precision.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2023 SUSE LLC */
 #include <linux/bpf.h>
 #include <bpf/bpf_helpers.h>
+#include "../../../include/linux/filter.h"
 #include "bpf_misc.h"
 
 SEC("?raw_tp")
@@ -90,6 +91,54 @@ __naked int bpf_end_bswap(void)
 		::: __clobber_all);
 }
 
+#if defined(ENABLE_ATOMICS_TESTS) && \
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+
+SEC("?raw_tp")
+__success __log_level(2)
+__msg("mark_precise: frame0: regs=r2 stack= before 3: (bf) r3 = r10")
+__msg("mark_precise: frame0: regs=r2 stack= before 2: (db) r2 = load_acquire((u64 *)(r10 -8))")
+__msg("mark_precise: frame0: regs= stack=-8 before 1: (7b) *(u64 *)(r10 -8) = r1")
+__msg("mark_precise: frame0: regs=r1 stack= before 0: (b7) r1 = 8")
+__naked int bpf_load_acquire(void)
+{
+	asm volatile (
+	"r1 = 8;"
+	"*(u64 *)(r10 - 8) = r1;"
+	".8byte %[load_acquire_insn];" /* r2 = load_acquire((u64 *)(r10 - 8)); */
+	"r3 = r10;"
+	"r3 += r2;" /* mark_precise */
+	"r0 = 0;"
+	"exit;"
+	:
+	: __imm_insn(load_acquire_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_LOAD_ACQ, BPF_REG_2, BPF_REG_10, -8))
+	: __clobber_all);
+}
+
+SEC("?raw_tp")
+__success __log_level(2)
+__msg("mark_precise: frame0: regs=r1 stack= before 3: (bf) r2 = r10")
+__msg("mark_precise: frame0: regs=r1 stack= before 2: (79) r1 = *(u64 *)(r10 -8)")
+__msg("mark_precise: frame0: regs= stack=-8 before 1: (db) store_release((u64 *)(r10 -8), r1)")
+__msg("mark_precise: frame0: regs=r1 stack= before 0: (b7) r1 = 8")
+__naked int bpf_store_release(void)
+{
+	asm volatile (
+	"r1 = 8;"
+	".8byte %[store_release_insn];" /* store_release((u64 *)(r10 - 8), r1); */
+	"r1 = *(u64 *)(r10 - 8);"
+	"r2 = r10;"
+	"r2 += r1;" /* mark_precise */
+	"r0 = 0;"
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_STORE_REL, BPF_REG_10, BPF_REG_1, -8))
+	: __clobber_all);
+}
+
+#endif /* load-acquire, store-release */
 #endif /* v4 instruction */
 
 SEC("?raw_tp")
diff --git a/tools/testing/selftests/bpf/progs/verifier_store_release.c b/tools/testing/selftests/bpf/progs/verifier_store_release.c
new file mode 100644
index 000000000000..f1c64c08f25f
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/verifier_store_release.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2025 Google LLC. */
+
+#include <linux/bpf.h>
+#include <bpf/bpf_helpers.h>
+#include "../../../include/linux/filter.h"
+#include "bpf_misc.h"
+
+#if __clang_major__ >= 18 && defined(ENABLE_ATOMICS_TESTS) && \
+	(defined(__TARGET_ARCH_arm64) || defined(__TARGET_ARCH_x86))
+
+SEC("socket")
+__description("store-release, 8-bit")
+__success __success_unpriv __retval(0x12)
+__naked void store_release_8(void)
+{
+	asm volatile (
+	"w1 = 0x12;"
+	".8byte %[store_release_insn];" // store_release((u8 *)(r10 - 1), w1);
+	"w0 = *(u8 *)(r10 - 1);"
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_STORE_REL, BPF_REG_10, BPF_REG_1, -1))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("store-release, 16-bit")
+__success __success_unpriv __retval(0x1234)
+__naked void store_release_16(void)
+{
+	asm volatile (
+	"w1 = 0x1234;"
+	".8byte %[store_release_insn];" // store_release((u16 *)(r10 - 2), w1);
+	"w0 = *(u16 *)(r10 - 2);"
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_H, BPF_STORE_REL, BPF_REG_10, BPF_REG_1, -2))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("store-release, 32-bit")
+__success __success_unpriv __retval(0x12345678)
+__naked void store_release_32(void)
+{
+	asm volatile (
+	"w1 = 0x12345678;"
+	".8byte %[store_release_insn];" // store_release((u32 *)(r10 - 4), w1);
+	"w0 = *(u32 *)(r10 - 4);"
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_W, BPF_STORE_REL, BPF_REG_10, BPF_REG_1, -4))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("store-release, 64-bit")
+__success __success_unpriv __retval(0x1234567890abcdef)
+__naked void store_release_64(void)
+{
+	asm volatile (
+	"r1 = 0x1234567890abcdef ll;"
+	".8byte %[store_release_insn];" // store_release((u64 *)(r10 - 8), r1);
+	"r0 = *(u64 *)(r10 - 8);"
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_STORE_REL, BPF_REG_10, BPF_REG_1, -8))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("store-release with uninitialized src_reg")
+__failure __failure_unpriv __msg("R2 !read_ok")
+__naked void store_release_with_uninitialized_src_reg(void)
+{
+	asm volatile (
+	".8byte %[store_release_insn];" // store_release((u64 *)(r10 - 8), r2);
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_STORE_REL, BPF_REG_10, BPF_REG_2, -8))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("store-release with uninitialized dst_reg")
+__failure __failure_unpriv __msg("R2 !read_ok")
+__naked void store_release_with_uninitialized_dst_reg(void)
+{
+	asm volatile (
+	"r1 = 0;"
+	".8byte %[store_release_insn];" // store_release((u64 *)(r2 - 8), r1);
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_STORE_REL, BPF_REG_2, BPF_REG_1, -8))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("store-release with non-pointer dst_reg")
+__failure __failure_unpriv __msg("R1 invalid mem access 'scalar'")
+__naked void store_release_with_non_pointer_dst_reg(void)
+{
+	asm volatile (
+	"r1 = 0;"
+	".8byte %[store_release_insn];" // store_release((u64 *)(r1 + 0), r1);
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_STORE_REL, BPF_REG_1, BPF_REG_1, 0))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("misaligned store-release")
+__failure __failure_unpriv __msg("misaligned stack access off")
+__flag(BPF_F_ANY_ALIGNMENT)
+__naked void store_release_misaligned(void)
+{
+	asm volatile (
+	"w0 = 0;"
+	".8byte %[store_release_insn];" // store_release((u32 *)(r10 - 5), w0);
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_W, BPF_STORE_REL, BPF_REG_10, BPF_REG_0, -5))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("store-release to ctx pointer")
+__failure __failure_unpriv __msg("BPF_ATOMIC stores into R1 ctx is not allowed")
+__naked void store_release_to_ctx_pointer(void)
+{
+	asm volatile (
+	"w0 = 0;"
+	".8byte %[store_release_insn];" // store_release((u8 *)(r1 + 0), w0);
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_STORE_REL, BPF_REG_1, BPF_REG_0, 0))
+	: __clobber_all);
+}
+
+SEC("xdp")
+__description("store-release to pkt pointer")
+__failure __msg("BPF_ATOMIC stores into R2 pkt is not allowed")
+__naked void store_release_to_pkt_pointer(void)
+{
+	asm volatile (
+	"w0 = 0;"
+	"r2 = *(u32 *)(r1 + %[xdp_md_data]);"
+	".8byte %[store_release_insn];" // store_release((u8 *)(r2 + 0), w0);
+	"exit;"
+	:
+	: __imm_const(xdp_md_data, offsetof(struct xdp_md, data)),
+	  __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_STORE_REL, BPF_REG_2, BPF_REG_0, 0))
+	: __clobber_all);
+}
+
+SEC("flow_dissector")
+__description("store-release to flow_keys pointer")
+__failure __msg("BPF_ATOMIC stores into R2 flow_keys is not allowed")
+__naked void store_release_to_flow_keys_pointer(void)
+{
+	asm volatile (
+	"w0 = 0;"
+	"r2 = *(u64 *)(r1 + %[__sk_buff_flow_keys]);"
+	".8byte %[store_release_insn];" // store_release((u8 *)(r2 + 0), w0);
+	"exit;"
+	:
+	: __imm_const(__sk_buff_flow_keys,
+		      offsetof(struct __sk_buff, flow_keys)),
+	  __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_STORE_REL, BPF_REG_2, BPF_REG_0, 0))
+	: __clobber_all);
+}
+
+SEC("sk_reuseport")
+__description("store-release to sock pointer")
+__failure __msg("BPF_ATOMIC stores into R2 sock is not allowed")
+__naked void store_release_to_sock_pointer(void)
+{
+	asm volatile (
+	"w0 = 0;"
+	"r2 = *(u64 *)(r1 + %[sk_reuseport_md_sk]);"
+	".8byte %[store_release_insn];" // store_release((u8 *)(r2 + 0), w0);
+	"exit;"
+	:
+	: __imm_const(sk_reuseport_md_sk, offsetof(struct sk_reuseport_md, sk)),
+	  __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_B, BPF_STORE_REL, BPF_REG_2, BPF_REG_0, 0))
+	: __clobber_all);
+}
+
+SEC("socket")
+__description("store-release, leak pointer to stack")
+__success __success_unpriv __retval(0)
+__naked void store_release_leak_pointer_to_stack(void)
+{
+	asm volatile (
+	".8byte %[store_release_insn];" // store_release((u64 *)(r10 - 8), r1);
+	"r0 = 0;"
+	"exit;"
+	:
+	: __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_STORE_REL, BPF_REG_10, BPF_REG_1, -8))
+	: __clobber_all);
+}
+
+struct {
+	__uint(type, BPF_MAP_TYPE_HASH);
+	__uint(max_entries, 1);
+	__type(key, long long);
+	__type(value, long long);
+} map_hash_8b SEC(".maps");
+
+SEC("socket")
+__description("store-release, leak pointer to map")
+__success __retval(0)
+__failure_unpriv __msg_unpriv("R6 leaks addr into map")
+__naked void store_release_leak_pointer_to_map(void)
+{
+	asm volatile (
+	"r6 = r1;"
+	"r1 = %[map_hash_8b] ll;"
+	"r2 = 0;"
+	"*(u64 *)(r10 - 8) = r2;"
+	"r2 = r10;"
+	"r2 += -8;"
+	"call %[bpf_map_lookup_elem];"
+	"if r0 == 0 goto l0_%=;"
+	".8byte %[store_release_insn];" // store_release((u64 *)(r0 + 0), r6);
+"l0_%=:"
+	"r0 = 0;"
+	"exit;"
+	:
+	: __imm_addr(map_hash_8b),
+	  __imm(bpf_map_lookup_elem),
+	  __imm_insn(store_release_insn,
+		     BPF_ATOMIC_OP(BPF_DW, BPF_STORE_REL, BPF_REG_0, BPF_REG_6, 0))
+	: __clobber_all);
+}
+
+#else
+
+SEC("socket")
+__description("Clang version < 18, ENABLE_ATOMICS_TESTS not defined, and/or JIT doesn't support store-release, use a dummy test")
+__success
+int dummy_test(void)
+{
+	return 0;
+}
+
+#endif
+
+char _license[] SEC("license") = "GPL";
-- 
2.48.1.711.g2feabab25a-goog


