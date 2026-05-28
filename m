Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F68CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tQgGnkdHxEM/wLQx5ec96DsLADSPZSksdytZbAN40g=; b=jb0MNTkEfUuaD1k6sgE9tOeQx9
	2q3iIj0zLqvAQ1Pwf8FwDkLRwXjqWge4RDmyCOQs/4doZOG1pFrJ7AabCsM8UF/CF8Bt7F+cmAWf1
	KyOHGABHllTmO+JCq24C9SBLj+rjP7ZgG/cFaZMvGHIdZgffJ0GazWJfWykI3WQMEe1GToSto6KDL
	gBPQU+I6X82WmoZ/79DMZg8xVPnIc6RiEKSOQbAtSlZ5jGRGRTFl8zCLTMhgqP+vVDtcGNhBQEQnJ
	IBGEPMsNl6pKFcA14T5S7ZpiB4pu2GsSVgeJTc9UvC+ZKV0Xgbff5z4DcKrugO6UcQ857vJHPndb+
	NuBpGElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdR1-00000005yvF-1eIk;
	Thu, 28 May 2026 16:18:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdQx-00000005ytz-2T4O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:18:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 51C8F40B90;
	Thu, 28 May 2026 16:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4501F00A3C;
	Thu, 28 May 2026 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779985091;
	bh=5tQgGnkdHxEM/wLQx5ec96DsLADSPZSksdytZbAN40g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DpmASJunHqJOI6D0vRI3GOgtWzcW0Jzqx/Vogt5tE6kqRR8zPTOlr9s8+3yNaFZ+S
	 zMLtDvS1ckG/ZoF6OvY8p6Dqmk3hfIX10poUQW5bEusEbqnOpBjbJvXJKXd9OAnCB/
	 PsTqpa0VjkUQQm5x84AWXYJvs6oSO77xiDEDgKxxDZe/yV6ezDj/sl37YoDtUFTh3T
	 ZHeTVnlDBNy7EH3q9ra9l8Lb+B97/2ISsgvHGSofdjdBLGXLU5EmxU+UP0CPRaYvWs
	 golw9K1W3TZGT+MNmKGEYJQe7GhPRe1i12f8nGs8/6xWP62s+9AI0FkaIg+dtODGdj
	 h7o3jwgLJHpTg==
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
Subject: [PATCH bpf-next 1/2] bpf, arm64: Fix redundant MOV and clarify stack arg comments
Date: Thu, 28 May 2026 09:17:47 -0700
Message-ID: <20260528161750.1900674-2-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260528161750.1900674-1-puranjay@kernel.org>
References: <20260528161750.1900674-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_091811_648074_7E53BA93 
X-CRM114-Status: GOOD (  11.32  )
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

emit_stack_arg_store_imm() materializes the immediate into tmp and
then moves tmp to the target register (x5-x7).  Emit the immediate
directly into the target register to avoid the redundant MOV.

While here, qualify the bare "FP" in the stack-layout ASCII art as
"A64_FP" so it is not confused with BPF_FP, and note that incoming
stack arguments sit above the FP/LR pair pushed by the callee
prologue.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 arch/arm64/net/bpf_jit_comp.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index e3bbeaa94590..b4abc3138f37 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -546,7 +546,8 @@ static int build_prologue(struct jit_ctx *ctx, bool ebpf_from_cbpf)
 	 *                          low
 	 *
 	 * Stack args 6-8 are passed in x5-x7, args 9+ at [SP].
-	 * Incoming args 9+ are at [FP + 16], [FP + 24], ...
+	 * Incoming args 9+ are at [A64_FP + 16], [A64_FP + 24], ...
+	 * (above the saved FP/LR pair pushed in the callee prologue).
 	 */
 
 	emit_kcfi(is_main_prog ? cfi_bpf_hash : cfi_bpf_subprog_hash, ctx);
@@ -1235,11 +1236,12 @@ static void emit_stack_arg_store_imm(s32 imm, s16 bpf_off, const u8 tmp, struct
 {
 	int idx = -bpf_off / sizeof(u64) - 1;
 
-	emit_a64_mov_i(1, tmp, imm, ctx);
-	if (idx < NR_STACK_ARG_REGS)
-		emit(A64_MOV(1, stack_arg_reg[idx], tmp), ctx);
-	else
+	if (idx < NR_STACK_ARG_REGS) {
+		emit_a64_mov_i(1, stack_arg_reg[idx], imm, ctx);
+	} else {
+		emit_a64_mov_i(1, tmp, imm, ctx);
 		emit(A64_STR64I(tmp, A64_SP, (idx - NR_STACK_ARG_REGS) * sizeof(u64)), ctx);
+	}
 }
 
 /* JITs an eBPF instruction.
-- 
2.53.0-Meta


