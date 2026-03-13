Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63290105F78F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvfFpAeEzO8mpJMgvfojf+PtfgHI/igh01b3biiWulw=; b=aXDEnHK5YAbsY56gMJX2igxGRz
	zQz7G+wVrGm3PsOFMjejSGNFdv+3K9Sr0ifDDeSq0RQHMEDjtq6cAXkBLpLN1J6ONAHWGR5GX98W7
	6P3RgBH3/46vj3ur9frRD6AGJhkaweHN5zqlm+le/oINasY0cSkugYJoavqqocyXOJ/d+iyx/LDV4
	rt+utL0RMPBoYv14AzDGlxZuY6Q3vml2T6st+T+2oiMUVEsnQHHVUtKqQllfpRDEMuH2rfvVe9gTi
	1rJCNLMCNy1bLXiyTpY+LI8XXeYMi+aBOur1uAL58EeOSGMzVK6rl+ujApHyvXoT7rarQB7Pc6I1/
	vsVP3w3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zYe-0000000HUwj-0TQk;
	Fri, 13 Mar 2026 10:15:52 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zYa-0000000HUvl-0wg7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 10:15:50 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773396932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvfFpAeEzO8mpJMgvfojf+PtfgHI/igh01b3biiWulw=;
	b=qFsOcU+T/lKC5uaoxx2i7gVwSaRAZiw5Rbuz+aBrVIORZA4ull+Uld8ft0d8CKAXDGTFq1
	aCMPZnS9tduygQS7RZNgju3rnwsBELie0lgfZvP652ap4N6jLpIfyOzQ62LSGDh16UPFAx
	hPEeo3QL69GxbPFxqQ/n4yxGag8ILs4=
From: Leon Hwang <leon.hwang@linux.dev>
To: xukuohai@huaweicloud.com
Cc: a.s.protopopov@gmail.com,
	alexis.lothore@bootlin.com,
	andrii@kernel.org,
	ast@kernel.org,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	chleroy@kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	eddyz87@gmail.com,
	gor@linux.ibm.com,
	hbathini@linux.ibm.com,
	hca@linux.ibm.com,
	hengqi.chen@gmail.com,
	iii@linux.ibm.com,
	johan.almbladh@anyfinetworks.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	list+bpf@vahedi.org,
	luke.r.nels@gmail.com,
	martin.lau@linux.dev,
	naveen@kernel.org,
	paulburton@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	udknight@gmail.com,
	xi.wang@gmail.com,
	yangtiezhu@loongson.cn,
	yonghong.song@linux.dev,
	Leon Hwang <leon.hwang@linux.dev>
Subject: Re: [PATCH bpf-next v9 4/5] bpf, x86: Emit ENDBR for indirect jump targets
Date: Fri, 13 Mar 2026 18:15:05 +0800
Message-ID: <20260313101505.104686-1-leon.hwang@linux.dev>
In-Reply-To: <20260312170255.3427799-5-xukuohai@huaweicloud.com>
References: <20260312170255.3427799-5-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_031549_625263_33823B75 
X-CRM114-Status: GOOD (  13.58  )
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


On Fri, Mar 13, 2026 at 01:02:54AM +0800, Xu Kuohai wrote:
>From: Xu Kuohai <xukuohai@huawei.com>
>
>On CPUs that support CET/IBT, the indirect jump selftest triggers
>a kernel panic because the indirect jump targets lack ENDBR
>instructions.
>
>To fix it, emit an ENDBR instruction to each indirect jump target. Since
>the ENDBR instruction shifts the position of original jited instructions,
>fix the instruction address calculation wherever the addresses are used.
>
>For reference, below is a sample panic log.
>
> Missing ENDBR: bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
> ------------[ cut here ]------------
> kernel BUG at arch/x86/kernel/cet.c:133!
> Oops: invalid opcode: 0000 [#1] SMP NOPTI
>
> ...
>
>  ? 0xffffffffc00fb258
>  ? bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
>  bpf_prog_test_run_syscall+0x110/0x2f0
>  ? fdget+0xba/0xe0
>  __sys_bpf+0xe4b/0x2590
>  ? __kmalloc_node_track_caller_noprof+0x1c7/0x680
>  ? bpf_prog_test_run_syscall+0x215/0x2f0
>  __x64_sys_bpf+0x21/0x30
>  do_syscall_64+0x85/0x620
>  ? bpf_prog_test_run_syscall+0x1e2/0x2f0
>
>Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
>Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>
>Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
>---
> arch/x86/net/bpf_jit_comp.c | 26 +++++++++++++++-----------
> 1 file changed, 15 insertions(+), 11 deletions(-)
>
>diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
>index 72d9a5faa230..2d29830700f1 100644
>--- a/arch/x86/net/bpf_jit_comp.c
>+++ b/arch/x86/net/bpf_jit_comp.c
>@@ -1649,8 +1649,8 @@ static int emit_spectre_bhb_barrier(u8 **pprog, u8 *ip,
> 	return 0;
> }
>
>-static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image,
>-		  int oldproglen, struct jit_context *ctx, bool jmp_padding)
>+static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *addrs, u8 *image,
>+		  u8 *rw_image, int oldproglen, struct jit_context *ctx, bool jmp_padding)
> {
> 	bool tail_call_reachable = bpf_prog->aux->tail_call_reachable;
> 	struct bpf_insn *insn = bpf_prog->insnsi;
>@@ -1663,7 +1663,7 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image
> 	void __percpu *priv_stack_ptr;
> 	int i, excnt = 0;
> 	int ilen, proglen = 0;
>-	u8 *prog = temp;
>+	u8 *ip, *prog = temp;
> 	u32 stack_depth;
> 	int err;
>
>@@ -1734,6 +1734,13 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image
> 				dst_reg = X86_REG_R9;
> 		}
>
>+#ifdef CONFIG_X86_KERNEL_IBT
>+		if (bpf_insn_is_indirect_target(env, bpf_prog, i - 1))
>+			EMIT_ENDBR();
>+#endif

NIT: is this CONFIG check necessary?

EMIT_ENDBR already checks it.

#ifdef CONFIG_X86_KERNEL_IBT
#define EMIT_ENDBR()		EMIT(gen_endbr(), 4)
#define EMIT_ENDBR_POISON()	EMIT(gen_endbr_poison(), 4)
#else
#define EMIT_ENDBR()
#define EMIT_ENDBR_POISON()
#endif

Thanks,
Leon

>+
>+		ip = image + addrs[i - 1] + (prog - temp);
>+
> 		switch (insn->code) {
> 			/* ALU */
> 		case BPF_ALU | BPF_ADD | BPF_X:
>@@ -2440,8 +2447,6 @@ st:			if (is_imm8(insn->off))
>
> 			/* call */
> 		case BPF_JMP | BPF_CALL: {
>-			u8 *ip = image + addrs[i - 1];
>-
> 			func = (u8 *) __bpf_call_base + imm32;
> 			if (src_reg == BPF_PSEUDO_CALL && tail_call_reachable) {
> 				LOAD_TAIL_CALL_CNT_PTR(stack_depth);
>@@ -2465,7 +2470,8 @@ st:			if (is_imm8(insn->off))
> 			if (imm32)
> 				emit_bpf_tail_call_direct(bpf_prog,
> 							  &bpf_prog->aux->poke_tab[imm32 - 1],
>-							  &prog, image + addrs[i - 1],
>+							  &prog,
>+							  ip,
> 							  callee_regs_used,
> 							  stack_depth,
> 							  ctx);
>@@ -2474,7 +2480,7 @@ st:			if (is_imm8(insn->off))
> 							    &prog,
> 							    callee_regs_used,
> 							    stack_depth,
>-							    image + addrs[i - 1],
>+							    ip,
> 							    ctx);
> 			break;
>
>@@ -2639,7 +2645,7 @@ st:			if (is_imm8(insn->off))
> 			break;
>
> 		case BPF_JMP | BPF_JA | BPF_X:
>-			emit_indirect_jump(&prog, insn->dst_reg, image + addrs[i - 1]);
>+			emit_indirect_jump(&prog, insn->dst_reg, ip);
> 			break;
> 		case BPF_JMP | BPF_JA:
> 		case BPF_JMP32 | BPF_JA:
>@@ -2729,8 +2735,6 @@ st:			if (is_imm8(insn->off))
> 			ctx->cleanup_addr = proglen;
> 			if (bpf_prog_was_classic(bpf_prog) &&
> 			    !ns_capable_noaudit(&init_user_ns, CAP_SYS_ADMIN)) {
>-				u8 *ip = image + addrs[i - 1];
>-
> 				if (emit_spectre_bhb_barrier(&prog, ip, bpf_prog))
> 					return -EINVAL;
> 			}
>@@ -3791,7 +3795,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
> 	for (pass = 0; pass < MAX_PASSES || image; pass++) {
> 		if (!padding && pass >= PADDING_PASSES)
> 			padding = true;
>-		proglen = do_jit(prog, addrs, image, rw_image, oldproglen, &ctx, padding);
>+		proglen = do_jit(env, prog, addrs, image, rw_image, oldproglen, &ctx, padding);
> 		if (proglen <= 0) {
> out_image:
> 			image = NULL;

