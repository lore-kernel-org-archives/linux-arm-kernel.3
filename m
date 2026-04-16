Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7362BF88090
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 07:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvMi3CquXwILs9Gvgghqd+xIUqf5rCW/3KWkgJ9xanM=; b=JhchUMefFEqj6g1cGVXIMnOjTY
	BcGw6/q+RdQKMBHQYQ4qQ79JWEOvN5FPcUmZ6ucot6kXgm/WeAa1dp1NCk2xWMagYqdGxi4UBEi3q
	a+9TWPuvPPdIyMCjw+vXPKQhzV8JyBAMji4frGp+CDzpGvkMSPntNah7KDlm0tpCCJLE+5c4veW4/
	O7s1gsDBdJ2NgxCFR2mtXNrHsHsU1ZMH2eBX+bTLKq1dv9hV6m/27PDQnXqMxo+PmjK57+e52OI8P
	GtcULY7KRyokcXjHLGkqpyLLoiodiKVpTx4D/un3WkER08es89bsgoD5x6zUQvyWsepTchsuWMJTH
	w36pQgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGn6-000000025ZE-1jgD;
	Thu, 16 Apr 2026 07:05:32 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGn2-000000025Wt-2J8q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 07:05:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4fx8Ch6VtBzKHMTL
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 15:05:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id C6BE94058D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 15:05:15 +0800 (CST)
Received: from localhost.huawei.com (unknown [10.67.174.243])
	by APP1 (Coremail) with SMTP id cCh0CgDHawYniuBpdFBbAg--.51915S7;
	Thu, 16 Apr 2026 15:05:15 +0800 (CST)
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
Subject: [PATCH bpf v15 5/5] bpf, arm64: Emit BTI for indirect jump target
Date: Thu, 16 Apr 2026 06:43:41 +0000
Message-ID: <20260416064341.151802-6-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416064341.151802-1-xukuohai@huaweicloud.com>
References: <20260416064341.151802-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgDHawYniuBpdFBbAg--.51915S7
X-Coremail-Antispam: 1UD129KBjvJXoWxXrW8trW5XF45Cw1rWw4Uurg_yoW5tFW7pF
	4DC3s0krW8Gr4UWa1DXayDAFyakr4kGFW3GFyFk3yIkrZ0qFy5WF1UKF12kF93A3yrur1f
	AayYkr15W34xJrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
	v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
	vjxUI-eODUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_000528_957357_53A7649A 
X-CRM114-Status: GOOD (  12.02  )
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

On CPUs that support BTI, the indirect jump selftest triggers a kernel
panic because there is no BTI instructions at the indirect jump targets.

Fix it by emitting a BTI instruction for each indirect jump target.

For reference, below is a sample panic log.

Internal error: Oops - BTI: 0000000036000003 [#1]  SMP
...
Call trace:
 bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x54/0xf8 (P)
 bpf_prog_run_pin_on_cpu+0x140/0x468
 bpf_prog_test_run_syscall+0x280/0x3b8
 bpf_prog_test_run+0x22c/0x2c0

Fixes: f4a66cf1cb14 ("bpf: arm64: Add support for indirect jumps")
Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com> # v8
Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com> # v12
Acked-by: Leon Hwang <leon.hwang@linux.dev>
Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 arch/arm64/net/bpf_jit_comp.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index bd8757952507..0816c40fc7af 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1197,8 +1197,8 @@ static int add_exception_handler(const struct bpf_insn *insn,
  * >0 - successfully JITed a 16-byte eBPF instruction.
  * <0 - failed to JIT.
  */
-static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
-		      bool extra_pass)
+static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn *insn,
+		      struct jit_ctx *ctx, bool extra_pass)
 {
 	const u8 code = insn->code;
 	u8 dst = bpf2a64[insn->dst_reg];
@@ -1223,6 +1223,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 	int ret;
 	bool sign_extend;
 
+	if (bpf_insn_is_indirect_target(env, ctx->prog, i))
+		emit_bti(A64_BTI_J, ctx);
+
 	switch (code) {
 	/* dst = src */
 	case BPF_ALU | BPF_MOV | BPF_X:
@@ -1898,7 +1901,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 	return 0;
 }
 
-static int build_body(struct jit_ctx *ctx, bool extra_pass)
+static int build_body(struct bpf_verifier_env *env, struct jit_ctx *ctx, bool extra_pass)
 {
 	const struct bpf_prog *prog = ctx->prog;
 	int i;
@@ -1917,7 +1920,7 @@ static int build_body(struct jit_ctx *ctx, bool extra_pass)
 		int ret;
 
 		ctx->offset[i] = ctx->idx;
-		ret = build_insn(insn, ctx, extra_pass);
+		ret = build_insn(env, insn, ctx, extra_pass);
 		if (ret > 0) {
 			i++;
 			ctx->offset[i] = ctx->idx;
@@ -2073,7 +2076,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 	if (build_prologue(&ctx, was_classic))
 		goto out_off;
 
-	if (build_body(&ctx, extra_pass))
+	if (build_body(env, &ctx, extra_pass))
 		goto out_off;
 
 	ctx.epilogue_offset = ctx.idx;
@@ -2121,7 +2124,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 	/* Dont write body instructions to memory for now */
 	ctx.write = false;
 
-	if (build_body(&ctx, extra_pass))
+	if (build_body(env, &ctx, extra_pass))
 		goto out_free_hdr;
 
 	ctx.epilogue_offset = ctx.idx;
@@ -2130,7 +2133,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 	ctx.write = true;
 
 	/* Pass 3: Adjust jump offset and write final image */
-	if (build_body(&ctx, extra_pass) ||
+	if (build_body(env, &ctx, extra_pass) ||
 		WARN_ON_ONCE(ctx.idx != ctx.epilogue_offset))
 		goto out_free_hdr;
 
-- 
2.43.0


