Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5652F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bmm3UpjA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Hk/VeB6a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8eddZT9hDTRgRSZp5lKDiD9JXGbTl/NCxh/RdFf6Mc=; b=bmm3UpjAT0houfgHan7vO+n/yY
	SVtN2YGOxC49IGZnWF6a8itrI4uNcqBtyoVnZ41O8u5Y/M6D6SOXpfhA25KJM2GbUz3of4y5QwEOg
	/H2WEuSujvVbHCISeARM/J7UnEurKVTYhKbye9TpMEH9ymEJ2EckO0XY0xFjXSG4DZlMWpQ20oNeI
	+RKPyXcfDAgcIpZEDy2jBcYnZBSjtpZkTN7/5k3+Lwlxn18vyF1jrTtGmi5Q+UYbRWddW/PjZhk+v
	AEdnmutBmKK0Djv/jXF+ZXNUwGSOfzySmp6EWjAG/oTvUnP9z7AIlLsK8EmqxQ8zwB7zInCUUm/k7
	vcN+K9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRcy-0000000BKsx-0DHX;
	Wed, 21 Oct 2026 08:24:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRcw-0000000BKrZ-10XP;
	Wed, 21 Oct 2026 08:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=h8eddZT9hDTRgRSZp5lKDiD9JXGbTl/NCxh/RdFf6Mc=; b=Hk/VeB6aSyvZLzPRg90Ec6zBZd
	K0pq7IBgQtqBZU8Tyc1F2QcT9E1YGP7BMnMwwOpBpnGSSQJveVGwYsqDAiKQy3E4/BfGsanz92zaB
	OG+O+8NWxlZQKx/38OxokkmG9tLqelTf7ri9yq9FCVjKgAY9/gaYm0gn1SrddUBh0o8xE+Mfm0KaY
	F8ti79OFxMXAU6udqhsfKIguk1KE13dcWU3lWJwMYE2wWW/ow3b0QWXKrl3SQBJiv9wobO/YYMQxz
	90v6FdK4WRnksMq/XCI+az7bedQTU2NXdU8lMjeEJV4idZsFscii71YUv2znVd/JVa+Z0nKWYph+D
	myhCgG+Q==;
Received: from gw.zju.edu.cn ([210.32.2.4] helo=zju.edu.cn)
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJRcm-00000005acc-2TcW;
	Wed, 21 Oct 2026 08:24:46 +0000
Received: from zju.edu.cn (unknown [10.162.163.215])
	by mtasvr (Coremail) with SMTP id _____wAXAX+1dthqkVCtAQ--.382S3;
	Wed, 21 Oct 2026 16:24:21 +0800 (CST)
Received: from lutetium.tail477849.ts.net (unknown [10.162.163.215])
	by mail-app3 (Coremail) with UTF8SMTPA id zS_KCgA32KKsdthqPl21AA--.47446S2;
	Wed, 21 Oct 2026 16:24:13 +0800 (CST)
From: tangyazhou@zju.edu.cn
To: bpf@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	David Vernet <void@manifault.com>,
	bpf@ietf.org
Cc: John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Quentin Monnet <qmo@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	=?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Russell King <linux@armlinux.org.uk>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>,
	Paul Burton <paulburton@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Wang YanQing <udknight@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Tianci Cao <ziye@zju.edu.cn>,
	Yazhou Tang <tangyazhou518@outlook.com>,
	Shenghao Yuan <shenghaoyuan0928@163.com>
Subject: [PATCH bpf-next v2 7/8] bpf: Add verifier support for UHMUL and SHMUL
Date: Wed, 21 Oct 2026 16:24:10 +0800
Message-ID: <20261021-bpf-hmul-v2-7-88e260099f7d@outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021-bpf-hmul-v2-0-88e260099f7d@outlook.com>
References: <20261021-bpf-hmul-v2-0-88e260099f7d@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zS_KCgA32KKsdthqPl21AA--.47446S2
X-CM-SenderInfo: qssvjiasrsq6lmxovvfxof0/1tbiAhILCmrXxB0pugABsn
X-CM-DELIVERINFO: =?B?N5tuEgXKKxbFmtjJiESix3B1w3vD7IpoGYuur0o+r46DyAi5OfOO+T4vrW4FyUBIyu
	9q9Ks5WUqw3Z4rlIZd02nqEte7vE5X8r7PoGTmM5ivi+t+g0KhJc0NasiSc+kD3IPo+Y6X
	N+4FoHWeuFvL2eN8QXUH8FDuENTTluHYrAqEalW4/31dW7yDvuavBQKfbVwx1A==
X-Coremail-Antispam: 1Uk129KBj93XoWxWF1rZrykKF13urW3Xr4DZFc_yoWrWw1Dpr
	4kXr98KrWkCa17ua9xZa97Ar90qF18tw48ur9rA34xXFyUJF98tF42gFy7Z34ayrWvgFyx
	tF4Yv3sFga4UCFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBEb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr1j6rxdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IYc2Ij64
	vIr40E4x8a64kEw24lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxAIw28I
	cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41l
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07j50edUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_092443_454735_97B4774B 
X-CRM114-Status: GOOD (  15.96  )
X-Spam-Score: -0.0 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tianci Cao <ziye@zju.edu.cn>

Extend ALU variant validation to accept off == 1 and off == 2 as UHMUL and
SHMUL, respectively, for BPF_ALU64 MUL instructions. Both offsets remain
reserved for BPF_ALU MUL, since the high-half variants are only defined
for 64-bit operations. All other MUL offsets remain invalid.

For scalar tracking, compute the exact high-half result when both operands
are constants. Mark the destination unknown when either operand is variable
until range analysis for these variants is added. Keep the existing scalar
analysis for ordinary low-half MUL unchanged.

Reject UHMUL and SHMUL when either operand is PTR_TO_ARENA. Arena
arithmetic can be rewritten from BPF_ALU64 to BPF_ALU to enforce its 32-bit
pointer representation, but such a rewrite cannot preserve the semantics of
variants that are only defined for BPF_ALU64.

Link: https://lore.kernel.org/bpf/CAADnVQ+2O2zgdy11+vxE6dOp+3Br4zZBysHF-Hne7cP+eeucnQ@mail.gmail.com/
Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Signed-off-by: Tianci Cao <ziye@zju.edu.cn>
Co-developed-by: Yazhou Tang <tangyazhou518@outlook.com>
Signed-off-by: Yazhou Tang <tangyazhou518@outlook.com>
Co-developed-by: Shenghao Yuan <shenghaoyuan0928@163.com>
Signed-off-by: Shenghao Yuan <shenghaoyuan0928@163.com>
---
 kernel/bpf/verifier.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 4f9d7b3de442..fbb920239783 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -16664,6 +16664,24 @@ static void scalar_min_max_mul(struct bpf_reg_state *dst_reg,
 					cnum64_from_srange(smin, smax));
 }
 
+static void scalar_min_max_uhmul(struct bpf_reg_state *dst_reg,
+				 struct bpf_reg_state *src_reg)
+{
+	u64 dst = reg_const_value(dst_reg, false);
+	u64 src = reg_const_value(src_reg, false);
+
+	___mark_reg_known(dst_reg, bpf_uhmul64(dst, src));
+}
+
+static void scalar_min_max_shmul(struct bpf_reg_state *dst_reg,
+				 struct bpf_reg_state *src_reg)
+{
+	s64 dst = reg_const_value(dst_reg, false);
+	s64 src = reg_const_value(src_reg, false);
+
+	___mark_reg_known(dst_reg, bpf_shmul64(dst, src));
+}
+
 static void scalar32_min_max_udiv(struct bpf_reg_state *dst_reg,
 				  struct bpf_reg_state *src_reg)
 {
@@ -17364,6 +17382,25 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
 		reg_step_reset(dst_reg);
 		break;
 	case BPF_MUL:
+		/*
+		 * Range analysis for UHMUL/SHMUL is not implemented yet.
+		 * Compute an exact result only when both operands are constants.
+		 * Ordinary low-half MUL continues to use the analysis below.
+		 */
+		if (bpf_insn_is_hmul(insn) &&
+		    (!is_reg_const(dst_reg, false) ||
+		     !is_reg_const(&src_reg, false))) {
+			__mark_reg_unknown(env, dst_reg);
+			break;
+		}
+		if (!alu32 && insn->off == BPF_UHMUL) {
+			scalar_min_max_uhmul(dst_reg, &src_reg);
+			break;
+		}
+		if (!alu32 && insn->off == BPF_SHMUL) {
+			scalar_min_max_shmul(dst_reg, &src_reg);
+			break;
+		}
 		scalar_step_mul(dst_reg, &src_reg);
 		dst_reg->var_off = tnum_mul(dst_reg->var_off, src_reg.var_off);
 		scalar32_min_max_mul(dst_reg, &src_reg);
@@ -17499,6 +17536,11 @@ static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
 	/* Case where at least one operand is an arena. */
 	if (dst_reg->type == PTR_TO_ARENA || (src_reg && src_reg->type == PTR_TO_ARENA)) {
 
+		if (bpf_insn_is_hmul(insn)) {
+			verbose(env, "UHMUL/SHMUL with arena pointers are not supported\n");
+			return -EOPNOTSUPP;
+		}
+
 		if (dst_reg->type != PTR_TO_ARENA)
 			*dst_reg = *src_reg;
 
@@ -21197,6 +21239,8 @@ static int fd_array_get_map_idx(struct bpf_verifier_env *env, u32 idx)
 static bool is_valid_alu_variant(const struct bpf_insn *insn)
 {
 	switch (BPF_OP(insn->code)) {
+	case BPF_MUL:
+		return insn->off == 0 || bpf_insn_is_hmul(insn);
 	case BPF_DIV:
 	case BPF_MOD:
 		/* off == 1 selects SDIV/SMOD. */

-- 
2.56.0


