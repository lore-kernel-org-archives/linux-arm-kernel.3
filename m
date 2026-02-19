Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165CBE9A04A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2bRCV7yDeBf8GuOUBEvMnX2Y0xlNieUH03bOqMBKOs=; b=oWJhpgnSR9HDOcrk1aTk/5tqSv
	5xnN3CW4oZij/15evZ6ww1MeluX/6GD6N3/9o0xS8iV4b8yW3/z1D+/3K4C/MZ94ajis6hClDk16K
	gaSwAPyBYaNziapWa3RJcDqXJ/k5RUBydPJUeVFFuWy3x7SyATXvAyC/jz6Fa1IH0kXdQZejkqAiC
	lS4SYEd2kZTfshUAI3EcnzHIyuDj3LHjwJvTzveKa6sE1qOJPcC9Atd5DjBQZpW+7pLPxEyoyOVgf
	qIhwuMxlUvCvz14F09Gx/7rU//iW7ZoO2Fs+wxod/5YC/or04zhg47ANeX5goVNToablekPU1XIp/
	n8T7hvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt54y-0000000BSZK-0Lgb;
	Thu, 19 Feb 2026 14:32:32 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt54v-0000000BSY9-2YEt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:32:31 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771511547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q2bRCV7yDeBf8GuOUBEvMnX2Y0xlNieUH03bOqMBKOs=;
	b=sr5M0+63Wsz/ZZW1ycof/LgoMgshho1gsH8aRzB8qzGyjBs7rbmGy5s3WQDYQs8NGiSTHH
	mq0TRXvTdlSZkV6BWgnSjsF3wTVpux4bX3ZZf61jgHFh7IQrelrkdZ8gq8t86l0TpmxOZm
	hR78dUiXmERnYMyYvwn87pHpaqddEYo=
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
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	Peilin Ye <yepeilin@google.com>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Viktor Malik <vmalik@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next v2 6/6] selftests/bpf: Add JIT disassembly tests for 64-bit bitops kfuncs
Date: Thu, 19 Feb 2026 22:29:28 +0800
Message-ID: <20260219142933.13904-7-leon.hwang@linux.dev>
In-Reply-To: <20260219142933.13904-1-leon.hwang@linux.dev>
References: <20260219142933.13904-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_063229_940316_5BB11A98 
X-CRM114-Status: GOOD (  11.41  )
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

Add bitops_jit selftests that verify JITed instruction sequences for
supported 64-bit bitops kfuncs on x86_64 and arm64, including
CPU-feature-gated coverage on x86 where required.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 .../testing/selftests/bpf/prog_tests/bitops.c |   6 +
 .../testing/selftests/bpf/progs/bitops_jit.c  | 153 ++++++++++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/bitops_jit.c

diff --git a/tools/testing/selftests/bpf/prog_tests/bitops.c b/tools/testing/selftests/bpf/prog_tests/bitops.c
index 9acc3cb1908c..2c203904880d 100644
--- a/tools/testing/selftests/bpf/prog_tests/bitops.c
+++ b/tools/testing/selftests/bpf/prog_tests/bitops.c
@@ -2,6 +2,7 @@
 
 #include <test_progs.h>
 #include "bitops.skel.h"
+#include "bitops_jit.skel.h"
 
 struct bitops_case {
 	__u64 x;
@@ -180,3 +181,8 @@ void test_bitops(void)
 	if (test__start_subtest("ror64"))
 		test_ror64();
 }
+
+void test_bitops_jit(void)
+{
+	RUN_TESTS(bitops_jit);
+}
diff --git a/tools/testing/selftests/bpf/progs/bitops_jit.c b/tools/testing/selftests/bpf/progs/bitops_jit.c
new file mode 100644
index 000000000000..9f414e56b1e8
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/bitops_jit.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <vmlinux.h>
+#include <bpf/bpf_helpers.h>
+#include "bpf_experimental.h"
+#include "bpf_misc.h"
+
+SEC("syscall")
+__description("bitops jit: clz64 uses lzcnt on x86 with abm")
+__success __retval(63)
+__arch_x86_64
+__cpu_feature("abm")
+__jited("	lzcnt{{.*}}")
+int bitops_jit_clz64_x86(void *ctx)
+{
+	return bpf_clz64(1);
+}
+
+SEC("syscall")
+__description("bitops jit: ctz64 uses tzcnt on x86 with bmi1")
+__success __retval(4)
+__arch_x86_64
+__cpu_feature("bmi1")
+__jited("	tzcnt{{.*}}")
+int bitops_jit_ctz64_x86(void *ctx)
+{
+	return bpf_ctz64(0x10);
+}
+
+SEC("syscall")
+__description("bitops jit: ffs64 uses tzcnt on x86 with bmi1")
+__success __retval(5)
+__arch_x86_64
+__cpu_feature("bmi1")
+__jited("	tzcnt{{.*}}")
+int bitops_jit_ffs64_x86(void *ctx)
+{
+	return bpf_ffs64(0x10);
+}
+
+SEC("syscall")
+__description("bitops jit: fls64 uses lzcnt on x86 with abm")
+__success __retval(5)
+__arch_x86_64
+__cpu_feature("abm")
+__jited("	lzcnt{{.*}}")
+int bitops_jit_fls64_x86(void *ctx)
+{
+	return bpf_fls64(0x10);
+}
+
+SEC("syscall")
+__description("bitops jit: popcnt64 uses popcnt on x86")
+__success __retval(3)
+__arch_x86_64
+__cpu_feature("popcnt")
+__jited("	popcnt{{.*}}")
+int bitops_jit_popcnt64_x86(void *ctx)
+{
+	return bpf_popcnt64(0x1011);
+}
+
+SEC("syscall")
+__description("bitops jit: rol64 uses rol on x86")
+__success __retval(6)
+__arch_x86_64
+__jited("	rol{{.*}}")
+int bitops_jit_rol64_x86(void *ctx)
+{
+	return bpf_rol64(3, 1);
+}
+
+SEC("syscall")
+__description("bitops jit: ror64 uses ror on x86")
+__success __retval(3)
+__arch_x86_64
+__jited("	ror{{.*}}")
+int bitops_jit_ror64_x86(void *ctx)
+{
+	return bpf_ror64(6, 1);
+}
+
+SEC("syscall")
+__description("bitops jit: clz64 uses clz on arm64")
+__success __retval(63)
+__arch_arm64
+__jited("	clz	{{.*}}")
+int bitops_jit_clz64_arm64(void *ctx)
+{
+	return bpf_clz64(1);
+}
+
+SEC("syscall")
+__description("bitops jit: ctz64 uses ctz or rbit+clz on arm64")
+__success __retval(4)
+__arch_arm64
+__jited("	{{(ctz|rbit)}}	{{.*}}")
+int bitops_jit_ctz64_arm64(void *ctx)
+{
+	return bpf_ctz64(0x10);
+}
+
+SEC("syscall")
+__description("bitops jit: ffs64 uses ctz or rbit+clz on arm64")
+__success __retval(5)
+__arch_arm64
+__jited("	{{(ctz|rbit)}}	{{.*}}")
+int bitops_jit_ffs64_arm64(void *ctx)
+{
+	return bpf_ffs64(0x10);
+}
+
+SEC("syscall")
+__description("bitops jit: fls64 uses clz on arm64")
+__success __retval(5)
+__arch_arm64
+__jited("	clz	{{.*}}")
+int bitops_jit_fls64_arm64(void *ctx)
+{
+	return bpf_fls64(0x10);
+}
+
+SEC("syscall")
+__description("bitops jit: bitrev64 uses rbit on arm64")
+__success __retval(1)
+__arch_arm64
+__jited("	rbit	{{.*}}")
+int bitops_jit_bitrev64_arm64(void *ctx)
+{
+	return bpf_bitrev64(0x8000000000000000ULL);
+}
+
+SEC("syscall")
+__description("bitops jit: rol64 uses rorv on arm64")
+__success __retval(6)
+__arch_arm64
+__jited("	ror	{{.*}}")
+int bitops_jit_rol64_arm64(void *ctx)
+{
+	return bpf_rol64(3, 1);
+}
+
+SEC("syscall")
+__description("bitops jit: ror64 uses rorv on arm64")
+__success __retval(3)
+__arch_arm64
+__jited("	ror	{{.*}}")
+int bitops_jit_ror64_arm64(void *ctx)
+{
+	return bpf_ror64(6, 1);
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.52.0


