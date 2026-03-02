Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC56E9B342
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFAkI0AjpVEVmRnCg11GpKbzH0c1en8cr2zQswIH6ho=; b=hMtLAjHa9j+DR/T9XzVcdMTZpl
	8Ts9wqFNUSXewSuDkwK+FvhKbg2fEzXyT3ZQCwLJKEb10e0PBOyNAOTUlk6ekEAu8kUU4xTrdWhtp
	Awrqj2xhyklcjd8xCB/0RYfZjLLkTei6vHJu3xuCziLEBaEj1OP+i1dUh/NVTRTcqb5k3Q8jVVdgX
	RWSgawsMOZJ7GOAgd/uWxiJufwHnJYYcqvYu1w7t7CQEe/oqkMqagFrLnh/Wl/fdYa6h2HQc+5zc1
	H2Bs9l/PeRYlumO42Vgdh2zMHb2fxaCBnkxjzQJJZRTmox3j1uKajs8Wgf2PCeg1iCO+cW/JAgQOH
	0LF/G2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx06T-0000000CeF5-49gw;
	Mon, 02 Mar 2026 10:02:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx06S-0000000CeE8-3i9o
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 10:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uFAkI0AjpVEVmRnCg11GpKbzH0c1en8cr2zQswIH6ho=; b=bVsyCGZCBhxUKdMCZOMuIZQyBj
	UWvYLJ2ZScABnEBuPOCdpSjKgwkz1UopGdpnBX8buofQ7pIAu7SnyRYC7p+UEYwaaEzL3IRVHQih4
	K1s77h14cpPk3wlW5nhiDTs70OIJ5847zTz/Tf5t5FzawYlQeU7eusXugJUnydA4RVWIrJmHvdHXU
	E8Pa7WxLG4QhBtxe7Gr1IRISQzKukSxdf/zJON7ZCipKiD4cF1f+C5JSBIhKDOVO2dxnbcBD5nWOL
	pP3zT0xU6/vQJ0kACYNgnVWiZhnMF/SCzNkAwivC4cozq4RhezEyau4WpXtkay+q+wLuPg8cZGX2H
	OsVDoLtA==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx06O-0000000HGw2-3Vt8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:02:15 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fPZFn5bgczYQv9Z
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 18:01:17 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id C2EC34058C
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 18:01:49 +0800 (CST)
Received: from k01.k01 (unknown [10.67.174.197])
	by APP4 (Coremail) with SMTP id gCh0CgCXQvMKYKVpfu0vJQ--.22492S7;
	Mon, 02 Mar 2026 18:01:49 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH bpf-next v5 5/5] bpf, arm64: Emit BTI for indirect jump target
Date: Mon,  2 Mar 2026 18:27:26 +0800
Message-ID: <20260302102726.1126019-6-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCXQvMKYKVpfu0vJQ--.22492S7
X-Coremail-Antispam: 1UD129KBjvJXoWxXrW8trW5XF45Cw1rWw4Uurg_yoW5Zw1fpF
	4DC3s0krW8Gr4jg3WDXayDAFyakF4kGFW3GFyFk3ySkrZ0qF98WF1UKF12kF93A3yrur1f
	Za90kr1UW34xJrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmmb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_Jw0_GFylc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I
	6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07j5CzZUUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_100213_815829_92A1ABFC 
X-CRM114-Status: GOOD (  12.82  )
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
Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 arch/arm64/net/bpf_jit_comp.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 823246c7ff5d..127e099d3d3a 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1198,8 +1198,8 @@ static int add_exception_handler(const struct bpf_insn *insn,
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
@@ -1224,6 +1224,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 	int ret;
 	bool sign_extend;
 
+	if (bpf_insn_is_indirect_target(env, ctx->prog, i))
+		emit_bti(A64_BTI_J, ctx);
+
 	switch (code) {
 	/* dst = src */
 	case BPF_ALU | BPF_MOV | BPF_X:
@@ -1899,7 +1902,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 	return 0;
 }
 
-static int build_body(struct jit_ctx *ctx, bool extra_pass)
+static int build_body(struct bpf_verifier_env *env, struct jit_ctx *ctx, bool extra_pass)
 {
 	const struct bpf_prog *prog = ctx->prog;
 	int i;
@@ -1918,7 +1921,7 @@ static int build_body(struct jit_ctx *ctx, bool extra_pass)
 		int ret;
 
 		ctx->offset[i] = ctx->idx;
-		ret = build_insn(insn, ctx, extra_pass);
+		ret = build_insn(env, insn, ctx, extra_pass);
 		if (ret > 0) {
 			i++;
 			ctx->offset[i] = ctx->idx;
@@ -2100,7 +2103,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 		goto out_off;
 	}
 
-	if (build_body(&ctx, extra_pass)) {
+	if (build_body(env, &ctx, extra_pass)) {
 		prog = orig_prog;
 		goto out_off;
 	}
@@ -2152,7 +2155,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 	/* Dont write body instructions to memory for now */
 	ctx.write = false;
 
-	if (build_body(&ctx, extra_pass)) {
+	if (build_body(env, &ctx, extra_pass)) {
 		prog = orig_prog;
 		goto out_free_hdr;
 	}
@@ -2163,7 +2166,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 	ctx.write = true;
 
 	/* Pass 3: Adjust jump offset and write final image */
-	if (build_body(&ctx, extra_pass) ||
+	if (build_body(env, &ctx, extra_pass) ||
 		WARN_ON_ONCE(ctx.idx != ctx.epilogue_offset)) {
 		prog = orig_prog;
 		goto out_free_hdr;
-- 
2.47.3


