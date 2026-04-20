Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9699CF588E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAyspL7EKrIbDHqJCbcHFawJ+vEyVY/BSfDfp7E0fyE=; b=ljryLSl6bESAVa1ESGrWBtj95t
	SGAqB3cEqRgLp1orwLfRt1B3KTr67RGlYQPjNkZPNrWKLz5gRXGoiGoViTt0+SjeudpeID3rPeaQ1
	M/bnE5cW+HZyjGXOSSOgu3LoXPBp4RzdGWR1CC4fAs+G0cOSFr47qwuWC57PD5415GL4DTM3DY82q
	gJlFnb4nqtlG4Z7WHX97UBDMLxBSujdo1+3pzz3L0gtCbtiRm+PpoNGZd4TTTIEVk4EMAwbJTeRC8
	c1M34JzCwtZhZo9rBjD6QOYHy7NOrhVrNVWP7CZVF/OVKqsfpZOWxAidU9a2fM7Ewo87OkB/MZ/yD
	JPXSDb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqgA-00000007K9r-0BJN;
	Mon, 20 Apr 2026 15:36:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqg5-00000007K7d-1uLg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:36:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C2EF42A7B;
	Mon, 20 Apr 2026 15:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11C8C19425;
	Mon, 20 Apr 2026 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776699409;
	bh=2UdaTs8H+StiygTWAEoCtUbaDZEZALTnFheiNtDzAo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jpzs03vWdlaSNYOXmfDIRlEpf3+TPokpmhlKeG8dQZogDJrYL/nQZDAcL83S0lsb1
	 ArCFF8oZKqk6iDMI2aFu2NOLhRAnfS2LW8N0EEIzHnabxC8guaboPbHemdiqtuOV6Z
	 bG91eSzR6tsAQiKPzXC4MB7GclcXYZF1Ew1RBeDmB643BBj/amGBlm4VT9jcWs2VDJ
	 D/2D2wQEOvCIERCBU9H/dBy71T7DryPPZxpVTP10B/34JKZK1RHHknbJuN6uL1hTnu
	 oNJl/9cZkSqEiPTw3BcjfV8kKBEO7KiXhIjp4JIKKu9uhoNjZM+NaH3jR8djwuLodE
	 zczFSENU62bSg==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	"Alexei Starovoitov" <ast@kernel.org>,
	"Daniel Borkmann" <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	"Martin KaFai Lau" <martin.lau@linux.dev>,
	"Eduard Zingerman" <eddyz87@gmail.com>,
	"Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
	"Song Liu" <song@kernel.org>,
	"Yonghong Song" <yonghong.song@linux.dev>,
	"Xu Kuohai" <xukuohai@huaweicloud.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH bpf-next 3/3] selftests/bpf: Enable stack argument tests for arm64
Date: Mon, 20 Apr 2026 08:36:01 -0700
Message-ID: <20260420153603.4097618-4-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260420153603.4097618-1-puranjay@kernel.org>
References: <20260420153603.4097618-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_083649_571167_7FD259E1 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 tools/testing/selftests/bpf/progs/stack_arg.c     |  3 ++-
 .../testing/selftests/bpf/progs/stack_arg_kfunc.c |  3 ++-
 .../selftests/bpf/progs/verifier_stack_arg.c      | 15 ++++++++++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/stack_arg.c b/tools/testing/selftests/bpf/progs/stack_arg.c
index 8c198ee952ff..b1276009fd30 100644
--- a/tools/testing/selftests/bpf/progs/stack_arg.c
+++ b/tools/testing/selftests/bpf/progs/stack_arg.c
@@ -23,7 +23,8 @@ struct {
 
 int timer_result;
 
-#if defined(__TARGET_ARCH_x86) && defined(__BPF_FEATURE_STACK_ARGUMENT)
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 const volatile bool has_stack_arg = true;
 
diff --git a/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c b/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c
index 6cc404d57863..3818cd0cb67b 100644
--- a/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c
+++ b/tools/testing/selftests/bpf/progs/stack_arg_kfunc.c
@@ -6,7 +6,8 @@
 #include "bpf_kfuncs.h"
 #include "../test_kmods/bpf_testmod_kfunc.h"
 
-#if defined(__TARGET_ARCH_x86) && defined(__BPF_FEATURE_STACK_ARGUMENT)
+#if (defined(__TARGET_ARCH_x86) || defined(__TARGET_ARCH_arm64)) && \
+	defined(__BPF_FEATURE_STACK_ARGUMENT)
 
 const volatile bool has_stack_arg = true;
 
diff --git a/tools/testing/selftests/bpf/progs/verifier_stack_arg.c b/tools/testing/selftests/bpf/progs/verifier_stack_arg.c
index 66dd11840a63..8f1eef911f70 100644
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
@@ -36,6 +37,7 @@ SEC("tc")
 __description("stack_arg: subprog with 6 args")
 __success
 __arch_x86_64
+__arch_arm64
 __naked void stack_arg_6args(void)
 {
 	asm volatile (
@@ -55,6 +57,7 @@ SEC("tc")
 __description("stack_arg: two subprogs with >5 args")
 __success
 __arch_x86_64
+__arch_arm64
 __naked void stack_arg_two_subprogs(void)
 {
 	asm volatile (
@@ -84,6 +87,7 @@ SEC("tc")
 __description("stack_arg: read from uninitialized stack arg slot")
 __failure
 __arch_x86_64
+__arch_arm64
 __msg("invalid read from stack arg off 8 depth 0")
 __naked void stack_arg_read_uninitialized(void)
 {
@@ -99,6 +103,7 @@ SEC("tc")
 __description("stack_arg: gap at offset -8, only wrote -16")
 __failure
 __arch_x86_64
+__arch_arm64
 __msg("stack arg#6 not properly initialized")
 __naked void stack_arg_gap_at_minus8(void)
 {
@@ -120,6 +125,7 @@ __description("stack_arg: pruning with different stack arg types")
 __failure
 __flag(BPF_F_TEST_STATE_FREQ)
 __arch_x86_64
+__arch_arm64
 __msg("R1 invalid mem access 'scalar'")
 __naked void stack_arg_pruning_type_mismatch(void)
 {
@@ -157,6 +163,7 @@ SEC("tc")
 __description("stack_arg: release_reference invalidates stack arg slot")
 __failure
 __arch_x86_64
+__arch_arm64
 __msg("R1 invalid mem access 'scalar'")
 __naked void stack_arg_release_ref(void)
 {
@@ -207,6 +214,7 @@ SEC("tc")
 __description("stack_arg: pkt pointer in stack arg slot invalidated after pull_data")
 __failure
 __arch_x86_64
+__arch_arm64
 __msg("R1 invalid mem access 'scalar'")
 __naked void stack_arg_stale_pkt_ptr(void)
 {
@@ -246,6 +254,7 @@ SEC("tc")
 __description("stack_arg: null propagation rejects deref on null branch")
 __failure
 __arch_x86_64
+__arch_arm64
 __msg("R1 invalid mem access 'scalar'")
 __naked void stack_arg_null_propagation_fail(void)
 {
@@ -285,6 +294,7 @@ SEC("tc")
 __description("stack_arg: missing store on one branch")
 __failure
 __arch_x86_64
+__arch_arm64
 __msg("stack arg#6 not properly initialized")
 __naked void stack_arg_missing_store_one_branch(void)
 {
@@ -327,6 +337,7 @@ SEC("tc")
 __description("stack_arg: share a store for both branches")
 __success __retval(0)
 __arch_x86_64
+__arch_arm64
 __naked void stack_arg_shared_store(void)
 {
 	asm volatile (
@@ -369,6 +380,7 @@ SEC("tc")
 __description("stack_arg: write beyond max outgoing depth")
 __failure
 __arch_x86_64
+__arch_arm64
 __msg("stack arg write offset -80 exceeds max 7 stack args")
 __naked void stack_arg_write_beyond_max(void)
 {
@@ -393,6 +405,7 @@ SEC("tc")
 __description("stack_arg: sequential calls reuse slots")
 __failure
 __arch_x86_64
+__arch_arm64
 __msg("stack arg#6 not properly initialized")
 __naked void stack_arg_sequential_calls(void)
 {
-- 
2.52.0


