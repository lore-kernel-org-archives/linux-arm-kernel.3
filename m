Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4A0F3ED51
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gK2cUKGb7zaIt08EzqUV7OzfWojiEhI12f2EclJ30HY=; b=1so8DqaIjz0ds37xDT7HfDFObn
	0SzYnjWYZHJpdKVWvPJM4OGEkw2Q+0hNFzhxZ9wYQoB0cEJh6vKKFhjSCtXMb7/MocouU6FFxCKHs
	5cuc0Ajy2lGmwOtPs4ykO4NtLX3Rg8iU8KFrp0ScFW0vM2E5GiyPj5kQPYsZS0LRF6gpxaUDMcEz8
	pcuWeEo8qPfJgGoReWYtdMMlugBZsO6tuxAa9jckmI5pEYh6vsk2mUp17zRDFfRMlCPHcQH88Zbjf
	etBPWsrmsWnvrrbE4PKpsLpmTnGD9oICAEUTtiRskXh+Yb+48PxZsEB3mo/uWWYWBVbqADaCaTJyr
	spnosi3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYt9-0000000DUK5-2Yys;
	Sat, 11 Apr 2026 14:00:43 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYt6-0000000DUG9-0rKo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:00:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4ftFfV6m1dzYQtvT
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 21:59:46 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 4240C4058F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 22:00:26 +0800 (CST)
Received: from localhost.huawei.com (unknown [10.67.174.243])
	by APP1 (Coremail) with SMTP id cCh0CgBnDAfzU9ppvMQhAA--.23008S6;
	Sat, 11 Apr 2026 22:00:25 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Russell King <linux@armlinux.org.uk>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>,
	Paul Burton <paulburton@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Wang YanQing <udknight@gmail.com>
Subject: [PATCH bpf-next v13 4/5] bpf, x86: Emit ENDBR for indirect jump targets
Date: Sat, 11 Apr 2026 13:38:46 +0000
Message-ID: <20260411133847.1042658-5-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411133847.1042658-1-xukuohai@huaweicloud.com>
References: <20260411133847.1042658-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBnDAfzU9ppvMQhAA--.23008S6
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4DXF1DAFW8Jw13WFW3KFg_yoWrKF13pa
	9xJ3sIyrZ8WFs8KF1kXF47CFy7AF4qgryfGr4rt3yruw42grnYgF15Ka4FqFyYkrWrKrn7
	XFyjkr1DWw1ku37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPvb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_070040_705891_A69492CB 
X-CRM114-Status: GOOD (  13.17  )
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

On CPUs that support CET/IBT, the indirect jump selftest triggers
a kernel panic because the indirect jump targets lack ENDBR
instructions.

To fix it, emit an ENDBR instruction to each indirect jump target. Since
the ENDBR instruction shifts the position of original jited instructions,
fix the instruction address calculation wherever the addresses are used.

For reference, below is a sample panic log.

 Missing ENDBR: bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
 ------------[ cut here ]------------
 kernel BUG at arch/x86/kernel/cet.c:133!
 Oops: invalid opcode: 0000 [#1] SMP NOPTI

 ...

  ? 0xffffffffc00fb258
  ? bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
  bpf_prog_test_run_syscall+0x110/0x2f0
  ? fdget+0xba/0xe0
  __sys_bpf+0xe4b/0x2590
  ? __kmalloc_node_track_caller_noprof+0x1c7/0x680
  ? bpf_prog_test_run_syscall+0x215/0x2f0
  __x64_sys_bpf+0x21/0x30
  do_syscall_64+0x85/0x620
  ? bpf_prog_test_run_syscall+0x1e2/0x2f0

Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com> # v8
Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com> # v12
Acked-by: Leon Hwang <leon.hwang@linux.dev>
Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 arch/x86/net/bpf_jit_comp.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 72d9a5faa230..ea9e707e8abf 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -58,8 +58,8 @@ static u8 *emit_code(u8 *ptr, u32 bytes, unsigned int len)
 #define EMIT_ENDBR()		EMIT(gen_endbr(), 4)
 #define EMIT_ENDBR_POISON()	EMIT(gen_endbr_poison(), 4)
 #else
-#define EMIT_ENDBR()
-#define EMIT_ENDBR_POISON()
+#define EMIT_ENDBR()		do { } while (0)
+#define EMIT_ENDBR_POISON()	do { } while (0)
 #endif
 
 static bool is_imm8(int value)
@@ -1649,8 +1649,8 @@ static int emit_spectre_bhb_barrier(u8 **pprog, u8 *ip,
 	return 0;
 }
 
-static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image,
-		  int oldproglen, struct jit_context *ctx, bool jmp_padding)
+static int do_jit(struct bpf_verifier_env *env, struct bpf_prog *bpf_prog, int *addrs, u8 *image,
+		  u8 *rw_image, int oldproglen, struct jit_context *ctx, bool jmp_padding)
 {
 	bool tail_call_reachable = bpf_prog->aux->tail_call_reachable;
 	struct bpf_insn *insn = bpf_prog->insnsi;
@@ -1663,7 +1663,7 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image
 	void __percpu *priv_stack_ptr;
 	int i, excnt = 0;
 	int ilen, proglen = 0;
-	u8 *prog = temp;
+	u8 *ip, *prog = temp;
 	u32 stack_depth;
 	int err;
 
@@ -1734,6 +1734,11 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image, u8 *rw_image
 				dst_reg = X86_REG_R9;
 		}
 
+		if (bpf_insn_is_indirect_target(env, bpf_prog, i - 1))
+			EMIT_ENDBR();
+
+		ip = image + addrs[i - 1] + (prog - temp);
+
 		switch (insn->code) {
 			/* ALU */
 		case BPF_ALU | BPF_ADD | BPF_X:
@@ -2440,8 +2445,6 @@ st:			if (is_imm8(insn->off))
 
 			/* call */
 		case BPF_JMP | BPF_CALL: {
-			u8 *ip = image + addrs[i - 1];
-
 			func = (u8 *) __bpf_call_base + imm32;
 			if (src_reg == BPF_PSEUDO_CALL && tail_call_reachable) {
 				LOAD_TAIL_CALL_CNT_PTR(stack_depth);
@@ -2465,7 +2468,8 @@ st:			if (is_imm8(insn->off))
 			if (imm32)
 				emit_bpf_tail_call_direct(bpf_prog,
 							  &bpf_prog->aux->poke_tab[imm32 - 1],
-							  &prog, image + addrs[i - 1],
+							  &prog,
+							  ip,
 							  callee_regs_used,
 							  stack_depth,
 							  ctx);
@@ -2474,7 +2478,7 @@ st:			if (is_imm8(insn->off))
 							    &prog,
 							    callee_regs_used,
 							    stack_depth,
-							    image + addrs[i - 1],
+							    ip,
 							    ctx);
 			break;
 
@@ -2639,7 +2643,7 @@ st:			if (is_imm8(insn->off))
 			break;
 
 		case BPF_JMP | BPF_JA | BPF_X:
-			emit_indirect_jump(&prog, insn->dst_reg, image + addrs[i - 1]);
+			emit_indirect_jump(&prog, insn->dst_reg, ip);
 			break;
 		case BPF_JMP | BPF_JA:
 		case BPF_JMP32 | BPF_JA:
@@ -2729,8 +2733,6 @@ st:			if (is_imm8(insn->off))
 			ctx->cleanup_addr = proglen;
 			if (bpf_prog_was_classic(bpf_prog) &&
 			    !ns_capable_noaudit(&init_user_ns, CAP_SYS_ADMIN)) {
-				u8 *ip = image + addrs[i - 1];
-
 				if (emit_spectre_bhb_barrier(&prog, ip, bpf_prog))
 					return -EINVAL;
 			}
@@ -3791,7 +3793,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 	for (pass = 0; pass < MAX_PASSES || image; pass++) {
 		if (!padding && pass >= PADDING_PASSES)
 			padding = true;
-		proglen = do_jit(prog, addrs, image, rw_image, oldproglen, &ctx, padding);
+		proglen = do_jit(env, prog, addrs, image, rw_image, oldproglen, &ctx, padding);
 		if (proglen <= 0) {
 out_image:
 			image = NULL;
-- 
2.43.0


