Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE09FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zw4MSyzWB4yH0I0ixUpugJtIZoneq5w87jsqyaJuA64=; b=eXNQRblSUl9njzahQUT78A9feR
	hDtx9lAqq0HUNqVOuQP3x4mR9eVmwxnAJxtRz6/tfI3Bf8u/8EEiVs7wJaIYDctLdfDUQ8Oir2QMz
	ElFwpffCHQm/2T4OG3fZFSVIKX7aJZsxBnjwaqsqZSja4RZqvWphNp7Tsued0RQqnVniVPN+NdVEG
	xWqsRxO3pmUi//e4dei40SOgGSa8gHKpYMoTcNwwJy7irw9JO8PD1mzen5f+fgqkQWf52W4ZfGfVR
	aTUA+IfjOnmxSDVW6xOa2uC/YBhGUslNUFVkW6TftI/sqJbwmy6/4wbvHgdPz8ceEqDBg8exF4rHs
	Icr3QPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVgn-00000000J3Q-3q0a;
	Mon, 27 Apr 2026 23:48:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVgk-00000000J2B-0TUG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 23:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEF7143D1E;
	Mon, 27 Apr 2026 23:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784F4C2BCB6;
	Mon, 27 Apr 2026 23:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777333709;
	bh=4qgD8NXIgP60g2ZgfZ0Qni9zzpAN5k22pYvDGRANGqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BRIBfYrhSGTarGaNCzsZQTCCrKM1S7CB/q0pOPP8XvVIX51lg1R+7LSeoI33hCPJY
	 cfydGXEPNXiFNl2gzjeYatIjhhKI4muArXYxrLzGB2ighjZa1D+2ALiHw9Q495B2Z0
	 nfFxaHiUbFOChi+bKvaEDCj8t4dvCXXsBc2NOQz6rzAKMKlxGvPJga6ZT8ZFWkaLM5
	 KOtrFWCPXcVBogNSMiYugRiIR242WZRz7o1rZp1BbM6zkLTw6tHmzDWn1ThN/+9yrg
	 MLbS1yiwE6rLjtGV70OyZa0vrou+mfRM5yLiEjuEw6scnnjOgrYOS5hVsHGKLxrnpv
	 ISQkGkbOUO8Ew==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org,
	"Yonghong Song" <yonghong.song@linux.dev>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	"Alexei Starovoitov" <ast@kernel.org>,
	"Daniel Borkmann" <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	"Martin KaFai Lau" <martin.lau@linux.dev>,
	"Eduard Zingerman" <eddyz87@gmail.com>,
	"Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
	"Song Liu" <song@kernel.org>,
	"Xu Kuohai" <xukuohai@huaweicloud.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH bpf-next v2 3/3] selftests/bpf: Enable stack argument tests for arm64
Date: Mon, 27 Apr 2026 16:48:00 -0700
Message-ID: <20260427234801.2104511-4-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260427234801.2104511-1-puranjay@kernel.org>
References: <20260427234801.2104511-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_164830_191878_F7B92ED2 
X-CRM114-Status: GOOD (  10.77  )
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

Now that arm64 supports stack arguments, enable the existing stack_arg,
stack_arg_kfunc and verifier_stack_arg tests for __TARGET_ARCH_arm64.

Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c | 3 ++-
 tools/testing/selftests/bpf/progs/stack_arg.c                | 3 ++-
 tools/testing/selftests/bpf/progs/stack_arg_kfunc.c          | 3 ++-
 tools/testing/selftests/bpf/progs/stack_arg_precision.c      | 3 ++-
 tools/testing/selftests/bpf/progs/verifier_stack_arg.c       | 3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c b/tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c
index 296fddfe6804..8d38aafe66a2 100644
--- a/tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c
+++ b/tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c
@@ -4,7 +4,8 @@
 #include <bpf/bpf_helpers.h>
 #include "../test_kmods/bpf_testmod_kfunc.h"
 
-#if defined(__TARGET_ARCH_x86) && defined(__BPF_FEATURE_STACK_ARGUMENT)
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 long subprog_call_mem_kfunc(long a, long b, long c, long d, long e, long size)
 {
diff --git a/tools/testing/selftests/bpf/progs/stack_arg.c b/tools/testing/selftests/bpf/progs/stack_arg.c
index ab6240b997c5..b5e9929a4d63 100644
--- a/tools/testing/selftests/bpf/progs/stack_arg.c
+++ b/tools/testing/selftests/bpf/progs/stack_arg.c
@@ -21,7 +21,8 @@ struct {
 
 int timer_result;
 
-#if defined(__TARGET_ARCH_x86) && defined(__BPF_FEATURE_STACK_ARGUMENT)
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 const volatile bool has_stack_arg = true;
 
diff --git a/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c b/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c
index fa9def876ea5..da0d4f91d273 100644
--- a/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c
+++ b/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c
@@ -6,7 +6,8 @@
 #include "bpf_kfuncs.h"
 #include "../test_kmods/bpf_testmod_kfunc.h"
 
-#if defined(__TARGET_ARCH_x86) && defined(__BPF_FEATURE_STACK_ARGUMENT)
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 const volatile bool has_stack_arg = true;
 
diff --git a/tools/testing/selftests/bpf/progs/stack_arg_precision.c b/tools/testing/selftests/bpf/progs/stack_arg_precision.c
index 29b2f2aea931..460d1872a84c 100644
--- a/tools/testing/selftests/bpf/progs/stack_arg_precision.c
+++ b/tools/testing/selftests/bpf/progs/stack_arg_precision.c
@@ -6,7 +6,8 @@
 #include "../test_kmods/bpf_testmod_kfunc.h"
 #include "bpf_misc.h"
 
-#if defined(__TARGET_ARCH_x86) && defined(__BPF_FEATURE_STACK_ARGUMENT)
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 /* Force kfunc extern BTF generation for inline asm call below.
  * Uses its own SEC so it's not included as a .text subprog.
diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
index 6b596ad63774..b412c311b757 100644
--- a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
+++ b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
@@ -12,7 +12,8 @@ struct {
 	__type(value, long long);
 } map_hash_8b SEC(".maps");
 
-#if defined(__TARGET_ARCH_x86) && defined(__BPF_FEATURE_STACK_ARGUMENT)
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 __noinline __used
 static int subprog_6args(int a, int b, int c, int d, int e, int f)
-- 
2.52.0


