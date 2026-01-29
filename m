Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BB2D6B07A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5GSaSHEQwCgQV2kznGolT1ez3UMT9oxFtVcmUADaKI=; b=DN6rfLxCSh0zAKcGyUpNeRw5Wd
	0R3V4HMI2duPD/57FDpRdxC9RPBUSi+KzIvfixSl9Ri7rv6JjpGBQ4bWyWcKKp2ys2SKH95yP1i/1
	sHhI9a+SuGH7K0+2c8V2C2QW9DbcJz5gcVKQcETEeHTZO9CobtQnz5Zki03X0FktfEf2gwLWNexjG
	7SAu1A26tUQFe9mauMA53cFZBpVTFvtHSXUaRS/uJWfiSM347tO7JKbjhkSXEQeJoYcm0RjSY+m6t
	fEGcCj+m9w5xezocg/BPC6meuVz7x04ZuQpp/KLDwf/CPYpyxgR+rheZ/Jz29v6NL9pak4YxTmexS
	3SM8wMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUJ7-00000000IPh-056X;
	Thu, 29 Jan 2026 15:51:45 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUJ3-00000000IOc-3mjL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:51:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769701898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A5GSaSHEQwCgQV2kznGolT1ez3UMT9oxFtVcmUADaKI=;
	b=ggYLrAowza9Mh87uE7KHG4X79hFJVFM05Is5YPaxSxuTPFOmAllSo2Yl0MWgdzPDly3d3Z
	07A/eRNAB5B7cT1qDbFJRDqDgv3hxEkhMdsHGnf9XE6uOAMjYFus1DmI3yJK+Y7PWpFRhE
	FvEJZh9zsFGvKIxftJ4yDLmGRXX1hxw=
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
Subject: [PATCH bpf-next v4 2/3] bpf, arm64: Add fsession support
Date: Thu, 29 Jan 2026 23:49:52 +0800
Message-ID: <20260129154953.66915-3-leon.hwang@linux.dev>
In-Reply-To: <20260129154953.66915-1-leon.hwang@linux.dev>
References: <20260129154953.66915-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_075142_081721_9C9AD468 
X-CRM114-Status: GOOD (  16.48  )
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

Implement fsession support in the arm64 BPF JIT trampoline.

Extend the trampoline stack layout to store function metadata and
session cookies, and pass the appropriate metadata to fentry and
fexit programs. This mirrors the existing x86 behavior and enables
session cookies on arm64.

Acked-by: Puranjay Mohan <puranjay@kernel.org>
Tested-by: Puranjay Mohan <puranjay@kernel.org>
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 arch/arm64/net/bpf_jit_comp.c | 71 ++++++++++++++++++++++++++++++-----
 include/linux/bpf.h           |  7 +++-
 2 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 0c4d44bcfbf4..952e00e078b2 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2510,6 +2510,12 @@ static bool is_struct_ops_tramp(const struct bpf_tramp_links *fentry_links)
 		fentry_links->links[0]->link.type == BPF_LINK_TYPE_STRUCT_OPS;
 }
 
+static void store_func_meta(struct jit_ctx *ctx, u64 func_meta, int func_meta_off)
+{
+	emit_a64_mov_i64(A64_R(10), func_meta, ctx);
+	emit(A64_STR64I(A64_R(10), A64_SP, func_meta_off), ctx);
+}
+
 /* Based on the x86's implementation of arch_prepare_bpf_trampoline().
  *
  * bpf prog and function entry before bpf trampoline hooked:
@@ -2533,7 +2539,7 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	int regs_off;
 	int retval_off;
 	int bargs_off;
-	int nfuncargs_off;
+	int func_meta_off;
 	int ip_off;
 	int run_ctx_off;
 	int oargs_off;
@@ -2544,6 +2550,9 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	bool save_ret;
 	__le32 **branches = NULL;
 	bool is_struct_ops = is_struct_ops_tramp(fentry);
+	int cookie_off, cookie_cnt, cookie_bargs_off;
+	int fsession_cnt = bpf_fsession_cnt(tlinks);
+	u64 func_meta;
 
 	/* trampoline stack layout:
 	 *                    [ parent ip         ]
@@ -2562,10 +2571,14 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	 *                    [ ...               ]
 	 * SP + bargs_off     [ arg reg 1         ] for bpf
 	 *
-	 * SP + nfuncargs_off [ arg regs count    ]
+	 * SP + func_meta_off [ regs count, etc   ]
 	 *
 	 * SP + ip_off        [ traced function   ] BPF_TRAMP_F_IP_ARG flag
 	 *
+	 *                    [ stack cookie N    ]
+	 *                    [ ...               ]
+	 * SP + cookie_off    [ stack cookie 1    ]
+	 *
 	 * SP + run_ctx_off   [ bpf_tramp_run_ctx ]
 	 *
 	 *                    [ stack arg N       ]
@@ -2582,13 +2595,18 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	/* room for bpf_tramp_run_ctx */
 	stack_size += round_up(sizeof(struct bpf_tramp_run_ctx), 8);
 
+	cookie_off = stack_size;
+	/* room for session cookies */
+	cookie_cnt = bpf_fsession_cookie_cnt(tlinks);
+	stack_size += cookie_cnt * 8;
+
 	ip_off = stack_size;
 	/* room for IP address argument */
 	if (flags & BPF_TRAMP_F_IP_ARG)
 		stack_size += 8;
 
-	nfuncargs_off = stack_size;
-	/* room for args count */
+	func_meta_off = stack_size;
+	/* room for function metadata, such as regs count */
 	stack_size += 8;
 
 	bargs_off = stack_size;
@@ -2646,9 +2664,9 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 		emit(A64_STR64I(A64_R(10), A64_SP, ip_off), ctx);
 	}
 
-	/* save arg regs count*/
-	emit(A64_MOVZ(1, A64_R(10), nfuncargs, 0), ctx);
-	emit(A64_STR64I(A64_R(10), A64_SP, nfuncargs_off), ctx);
+	/* save function metadata */
+	func_meta = nfuncargs;
+	store_func_meta(ctx, func_meta, func_meta_off);
 
 	/* save args for bpf */
 	save_args(ctx, bargs_off, oargs_off, m, a, false);
@@ -2666,10 +2684,27 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 		emit_call((const u64)__bpf_tramp_enter, ctx);
 	}
 
-	for (i = 0; i < fentry->nr_links; i++)
+	if (fsession_cnt) {
+		/* clear all the session cookies' value */
+		emit(A64_MOVZ(1, A64_R(10), 0, 0), ctx);
+		for (int i = 0; i < cookie_cnt; i++)
+			emit(A64_STR64I(A64_R(10), A64_SP, cookie_off + 8 * i), ctx);
+		/* clear the return value to make sure fentry always gets 0 */
+		emit(A64_STR64I(A64_R(10), A64_SP, retval_off), ctx);
+	}
+
+	cookie_bargs_off = (bargs_off - cookie_off) / 8;
+	for (i = 0; i < fentry->nr_links; i++) {
+		if (bpf_link_prog_session_cookie(fentry->links[i])) {
+			u64 meta = func_meta | (cookie_bargs_off << BPF_TRAMP_COOKIE_INDEX_SHIFT);
+
+			store_func_meta(ctx, meta, func_meta_off);
+			cookie_bargs_off--;
+		}
 		invoke_bpf_prog(ctx, fentry->links[i], bargs_off,
 				retval_off, run_ctx_off,
 				flags & BPF_TRAMP_F_RET_FENTRY_RET);
+	}
 
 	if (fmod_ret->nr_links) {
 		branches = kcalloc(fmod_ret->nr_links, sizeof(__le32 *),
@@ -2701,9 +2736,22 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 		*branches[i] = cpu_to_le32(A64_CBNZ(1, A64_R(10), offset));
 	}
 
-	for (i = 0; i < fexit->nr_links; i++)
+	/* set the "is_return" flag for fsession */
+	func_meta |= (1ULL << BPF_TRAMP_IS_RETURN_SHIFT);
+	if (fsession_cnt)
+		store_func_meta(ctx, func_meta, func_meta_off);
+
+	cookie_bargs_off = (bargs_off - cookie_off) / 8;
+	for (i = 0; i < fexit->nr_links; i++) {
+		if (bpf_link_prog_session_cookie(fexit->links[i])) {
+			u64 meta = func_meta | (cookie_bargs_off << BPF_TRAMP_COOKIE_INDEX_SHIFT);
+
+			store_func_meta(ctx, meta, func_meta_off);
+			cookie_bargs_off--;
+		}
 		invoke_bpf_prog(ctx, fexit->links[i], bargs_off, retval_off,
 				run_ctx_off, false);
+	}
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		im->ip_epilogue = ctx->ro_image + ctx->idx;
@@ -2753,6 +2801,11 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	return ctx->idx;
 }
 
+bool bpf_jit_supports_fsession(void)
+{
+	return true;
+}
+
 int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
 			     struct bpf_tramp_links *tlinks, void *func_addr)
 {
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 5524f9429e76..77e0c83c19fc 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2195,13 +2195,18 @@ static inline int bpf_fsession_cnt(struct bpf_tramp_links *links)
 	return cnt;
 }
 
+static inline bool bpf_link_prog_session_cookie(struct bpf_tramp_link *link)
+{
+	return link->link.prog->call_session_cookie;
+}
+
 static inline int bpf_fsession_cookie_cnt(struct bpf_tramp_links *links)
 {
 	struct bpf_tramp_links fentries = links[BPF_TRAMP_FENTRY];
 	int cnt = 0;
 
 	for (int i = 0; i < links[BPF_TRAMP_FENTRY].nr_links; i++) {
-		if (fentries.links[i]->link.prog->call_session_cookie)
+		if (bpf_link_prog_session_cookie(fentries.links[i]))
 			cnt++;
 	}
 
-- 
2.52.0


