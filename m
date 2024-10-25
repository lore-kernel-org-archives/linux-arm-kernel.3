Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CC1D0C5EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 08:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O2kUQRj4CNiS2F4WG16Olwz8YuS0hImd/l8EFAme2DM=; b=Ch6PBi75c8XtWuaX7nTSX7M8Sw
	2ct3aJzedk/OWUcKjEi2lP4SJmuQJrTLL/PU7B7BvKGF0buK9xa82lo6xn+8A9kJO6WbMlfLaQMHr
	gCDKg5DMMt7gvxYVGh43tYjjK92/X1rrxK3u1bUcKOVxbn8/bODe3BR/Z5y7Jj3U8vERYqazjWYfy
	xMqvHTbxqQDHR9TjxGyo3Hof4k4aUArDR2vEdc4/NrLv2wOUgt6V477OgXEplcim6GcO0o3iJj8Jb
	fjTnpzJtAqTwlD54eLUQlpSPc3/+EzcLbqu8zI03fK+agAyPOzR+XZyeqDMq3Zxr65lcKZ8K0+4XF
	D3qraRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4G0E-000000032Lf-0kov;
	Fri, 25 Oct 2024 08:49:02 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FsH-000000030ip-0elO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 08:40:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XZbp25f7Yz4f3k6R
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 16:40:26 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 31E1C1A018C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 16:40:39 +0800 (CST)
Received: from k01.huawei.com (unknown [10.67.174.197])
	by APP4 (Coremail) with SMTP id gCh0CgCnJ8SEWRtnOalHFA--.45621S2;
	Fri, 25 Oct 2024 16:40:37 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH bpf-next v2] bpf, arm64: Remove garbage frame for struct_ops trampoline
Date: Fri, 25 Oct 2024 16:52:20 +0800
Message-Id: <20241025085220.533949-1-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCnJ8SEWRtnOalHFA--.45621S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr17XF48Jw4kZr1xWF45KFg_yoW7Gryxpr
	1fCry5CF4xXr45XF4vgr4xAF1rtan7tw1UKFWUC3yrCa4FvryfKF1rtrWjyrZ3Wr9xCw1x
	ZFyqyrn2kFWDArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc7CjxVAKzI0E
	Y4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8
	mjg7UUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_014049_519114_676ADD00 
X-CRM114-Status: GOOD (  17.12  )
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

From: Xu Kuohai <xukuohai@huawei.com>

The callsite layout for arm64 fentry is:

mov x9, lr
nop

When a bpf prog is attached, the nop instruction is patched to a call
to bpf trampoline:

mov x9, lr
bl <bpf trampoline>

So two return addresses are passed to bpf trampoline: the return address
for the traced function/prog, stored in x9, and the return address for
the bpf trampoline itself, stored in lr. To obtain a full and accurate
call stack, the bpf trampoline constructs two fake function frames using
x9 and lr.

However, struct_ops progs are invoked directly as function callbacks,
meaning that x9 is not set as it is in the fentry callsite. In this case,
the frame constructed using x9 is garbage. The following stack trace for
struct_ops, captured by perf sampling, illustrates this issue, where
tcp_ack+0x404 is a garbage frame:

ffffffc0801a04b4 bpf_prog_50992e55a0f655a9_bpf_cubic_cong_avoid+0x98 (bpf_prog_50992e55a0f655a9_bpf_cubic_cong_avoid)
ffffffc0801a228c [unknown] ([kernel.kallsyms]) // bpf trampoline
ffffffd08d362590 tcp_ack+0x798 ([kernel.kallsyms]) // caller for bpf trampoline
ffffffd08d3621fc tcp_ack+0x404 ([kernel.kallsyms]) // garbage frame
ffffffd08d36452c tcp_rcv_established+0x4ac ([kernel.kallsyms])
ffffffd08d375c58 tcp_v4_do_rcv+0x1f0 ([kernel.kallsyms])
ffffffd08d378630 tcp_v4_rcv+0xeb8 ([kernel.kallsyms])

To fix it, construct only one frame using lr for struct_ops.

The above stack trace also indicates that there is no kernel symbol for
struct_ops bpf trampoline. This will be addressed in a follow-up patch.

Fixes: efc9909fdce0 ("bpf, arm64: Add bpf trampoline for arm64")
Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
Acked-by: Puranjay Mohan <puranjay@kernel.org>
Tested-by: Puranjay Mohan <puranjay@kernel.org>
---
v2:
Refine the commit message for clarity

v1:
https://lore.kernel.org/bpf/20241019092709.128359-1-xukuohai@huaweicloud.com/
---
 arch/arm64/net/bpf_jit_comp.c | 47 +++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 5db82bfc9dc1..27ef366363e4 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2094,6 +2094,12 @@ static void restore_args(struct jit_ctx *ctx, int args_off, int nregs)
 	}
 }
 
+static bool is_struct_ops_tramp(const struct bpf_tramp_links *fentry_links)
+{
+	return fentry_links->nr_links == 1 &&
+		fentry_links->links[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
+}
+
 /* Based on the x86's implementation of arch_prepare_bpf_trampoline().
  *
  * bpf prog and function entry before bpf trampoline hooked:
@@ -2123,6 +2129,7 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
 	bool save_ret;
 	__le32 **branches = NULL;
+	bool is_struct_ops = is_struct_ops_tramp(fentry);
 
 	/* trampoline stack layout:
 	 *                  [ parent ip         ]
@@ -2191,11 +2198,14 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	 */
 	emit_bti(A64_BTI_JC, ctx);
 
-	/* frame for parent function */
-	emit(A64_PUSH(A64_FP, A64_R(9), A64_SP), ctx);
-	emit(A64_MOV(1, A64_FP, A64_SP), ctx);
+	/* x9 is not set for struct_ops */
+	if (!is_struct_ops) {
+		/* frame for parent function */
+		emit(A64_PUSH(A64_FP, A64_R(9), A64_SP), ctx);
+		emit(A64_MOV(1, A64_FP, A64_SP), ctx);
+	}
 
-	/* frame for patched function */
+	/* frame for patched function for tracing, or caller for struct_ops */
 	emit(A64_PUSH(A64_FP, A64_LR, A64_SP), ctx);
 	emit(A64_MOV(1, A64_FP, A64_SP), ctx);
 
@@ -2289,19 +2299,24 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	/* reset SP  */
 	emit(A64_MOV(1, A64_SP, A64_FP), ctx);
 
-	/* pop frames  */
-	emit(A64_POP(A64_FP, A64_LR, A64_SP), ctx);
-	emit(A64_POP(A64_FP, A64_R(9), A64_SP), ctx);
-
-	if (flags & BPF_TRAMP_F_SKIP_FRAME) {
-		/* skip patched function, return to parent */
-		emit(A64_MOV(1, A64_LR, A64_R(9)), ctx);
-		emit(A64_RET(A64_R(9)), ctx);
+	if (is_struct_ops) {
+		emit(A64_POP(A64_FP, A64_LR, A64_SP), ctx);
+		emit(A64_RET(A64_LR), ctx);
 	} else {
-		/* return to patched function */
-		emit(A64_MOV(1, A64_R(10), A64_LR), ctx);
-		emit(A64_MOV(1, A64_LR, A64_R(9)), ctx);
-		emit(A64_RET(A64_R(10)), ctx);
+		/* pop frames */
+		emit(A64_POP(A64_FP, A64_LR, A64_SP), ctx);
+		emit(A64_POP(A64_FP, A64_R(9), A64_SP), ctx);
+
+		if (flags & BPF_TRAMP_F_SKIP_FRAME) {
+			/* skip patched function, return to parent */
+			emit(A64_MOV(1, A64_LR, A64_R(9)), ctx);
+			emit(A64_RET(A64_R(9)), ctx);
+		} else {
+			/* return to patched function */
+			emit(A64_MOV(1, A64_R(10), A64_LR), ctx);
+			emit(A64_MOV(1, A64_LR, A64_R(9)), ctx);
+			emit(A64_RET(A64_R(10)), ctx);
+		}
 	}
 
 	kfree(branches);
-- 
2.39.5


