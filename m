Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EF3C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntgsfQWiVpVb4y+TMEAENEQjeNqzPtISJnnNVS7HCkU=; b=ZGAvAO9y7gY3znh/u6KMDEq2uF
	Qug4GVeegB3UrPFylqYzVNnIx3EAWiey9X0AUimr9h55Nsy2miYJioH55bqgibc00gHmoGXyv3HeD
	/0pm84juw0nEZeRo/silO4hDrds8wi4NKaSLkln3EAliVEaFu9QMVns9HW3JtBA4HGUNfjHgfwMX7
	uLmBWE6bxns0WneOiVdOmO7b1QyTw8Y1BzgWszVORvk8qqqVIwjaNIje/8HBTGwAUYjjBCLRrQJLb
	aBb2/TyYe/vPFkUsm0dlX35Mi+H0mI/5h4rag2EGATyM0QlLLp8gMxSHTPkY6GHbMSLFWlpO87duA
	CDWka4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfVw-0000000FAKh-3Pi3;
	Mon, 24 Feb 2025 20:57:20 +0000
Received: from mx-rz-3.rrze.uni-erlangen.de ([131.188.11.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfUP-0000000FA5H-2qVM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:55:47 +0000
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Z1tL80JJJz1y9Q;
	Mon, 24 Feb 2025 21:55:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1740430544; bh=ntgsfQWiVpVb4y+TMEAENEQjeNqzPtISJnnNVS7HCkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=Y04RqWV6FNt/X2aHemmJcOpJU4l3/bOhUS/ZoXGLw9ZG1pPaPMOW2+iaRW53r1N8V
	 p2nDLvnuNqAc36yGaVDbzohF3sE+LlzeroqP5THt6Uw8fOE1WvJFrGPSG1nlA1ImBM
	 RhjOdPaTRwzZWvvFw58itvxGr9i36SXmTtR1ctxOtAFW4Oen2Tq276tt97z8EyzSz9
	 Kpz3FOhh6aCeYu3atIeP6aQaIU3kjNCwUbAer1JpkDmzaOCjDW5jVVP7NSBKipeEt3
	 0UiGUAbeIpYUYRkwC90gtYDzd/FpPnkK4yI7UUoi0+9Q9ahSwEa1upydirwgAfmNO6
	 2SgWUWJE2F+dg==
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:362e:e00:55a6:11d5:2473:17a9
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:362e:e00:55a6:11d5:2473:17a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1++pJ30EWaXZtK/wg5tWfK6Lqv7GXZL8rM=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Z1tL453j3z1y1k;
	Mon, 24 Feb 2025 21:55:40 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Alexei Starovoitov <ast@kernel.org>,
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
	Mykola Lysenko <mykolal@fb.com>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Luis Gerhorst <luis.gerhorst@fau.de>,
	Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [RFC PATCH 8/9] bpf: Fall back to nospec for sanitization-failures
Date: Mon, 24 Feb 2025 21:55:23 +0100
Message-ID: <20250224205523.608343-1-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224203619.594724-1-luis.gerhorst@fau.de>
References: <20250224203619.594724-1-luis.gerhorst@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_125546_011063_8FAA7D0C 
X-CRM114-Status: GOOD (  19.80  )
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

For the now raised REASON_STACK, this allows us to later fall back to
nospec for certain errors from push_stack() if we are on a speculative
path.

Fall back to nospec_result directly for the remaining sanitization errs
even if we are not on a speculative path. We must prevent a following
mem-access from using the result of the alu op speculatively. Therefore,
insert a nospec after the alu insn.

The latter requires us to modify the nospec_result patching code to work
not only for write-type insns.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 122 +++++++++++++++---------------------------
 1 file changed, 42 insertions(+), 80 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 406294bcd5ce..033780578966 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -13572,14 +13572,6 @@ static bool check_reg_sane_offset(struct bpf_verifier_env *env,
 	return true;
 }
 
-enum {
-	REASON_BOUNDS	= -1,
-	REASON_TYPE	= -2,
-	REASON_PATHS	= -3,
-	REASON_LIMIT	= -4,
-	REASON_STACK	= -5,
-};
-
 static int retrieve_ptr_limit(const struct bpf_reg_state *ptr_reg,
 			      u32 *alu_limit, bool mask_to_left)
 {
@@ -13602,11 +13594,13 @@ static int retrieve_ptr_limit(const struct bpf_reg_state *ptr_reg,
 			     ptr_reg->umax_value) + ptr_reg->off;
 		break;
 	default:
-		return REASON_TYPE;
+		/* Register has pointer with unsupported alu operation. */
+		return -ENOTSUPP;
 	}
 
+	/* Register tried access beyond pointer bounds. */
 	if (ptr_limit >= max)
-		return REASON_LIMIT;
+		return -ENOTSUPP;
 	*alu_limit = ptr_limit;
 	return 0;
 }
@@ -13625,8 +13619,12 @@ static int update_alu_sanitation_state(struct bpf_insn_aux_data *aux,
 	 */
 	if (aux->alu_state &&
 	    (aux->alu_state != alu_state ||
-	     aux->alu_limit != alu_limit))
-		return REASON_PATHS;
+	     aux->alu_limit != alu_limit)) {
+		/* Tried to perform alu op from different maps, paths or scalars */
+		aux->nospec_result = true;
+		aux->alu_state = 0;
+		return 0;
+	}
 
 	/* Corresponding fixup done in do_misc_fixups(). */
 	aux->alu_state = alu_state;
@@ -13707,16 +13705,24 @@ static int sanitize_ptr_alu(struct bpf_verifier_env *env,
 
 	if (!commit_window) {
 		if (!tnum_is_const(off_reg->var_off) &&
-		    (off_reg->smin_value < 0) != (off_reg->smax_value < 0))
-			return REASON_BOUNDS;
+		    (off_reg->smin_value < 0) != (off_reg->smax_value < 0)) {
+			/* Register has unknown scalar with mixed signed bounds. */
+			aux->nospec_result = true;
+			aux->alu_state = 0;
+			return 0;
+		}
 
 		info->mask_to_left = (opcode == BPF_ADD &&  off_is_neg) ||
 				     (opcode == BPF_SUB && !off_is_neg);
 	}
 
 	err = retrieve_ptr_limit(ptr_reg, &alu_limit, info->mask_to_left);
-	if (err < 0)
-		return err;
+	if (err) {
+		WARN_ON_ONCE(err != -ENOTSUPP);
+		aux->nospec_result = true;
+		aux->alu_state = 0;
+		return 0;
+	}
 
 	if (commit_window) {
 		/* In commit phase we narrow the masking window based on
@@ -13769,7 +13775,7 @@ static int sanitize_ptr_alu(struct bpf_verifier_env *env,
 					   env->insn_idx);
 	if (!ptr_is_dst_reg && !IS_ERR(branch))
 		*dst_reg = tmp;
-	return IS_ERR(branch) ? REASON_STACK : 0;
+	return PTR_ERR_OR_ZERO(branch);
 }
 
 static void sanitize_mark_insn_seen(struct bpf_verifier_env *env)
@@ -13785,45 +13791,6 @@ static void sanitize_mark_insn_seen(struct bpf_verifier_env *env)
 		env->insn_aux_data[env->insn_idx].seen = env->pass_cnt;
 }
 
-static int sanitize_err(struct bpf_verifier_env *env,
-			const struct bpf_insn *insn, int reason,
-			const struct bpf_reg_state *off_reg,
-			const struct bpf_reg_state *dst_reg)
-{
-	static const char *err = "pointer arithmetic with it prohibited for !root";
-	const char *op = BPF_OP(insn->code) == BPF_ADD ? "add" : "sub";
-	u32 dst = insn->dst_reg, src = insn->src_reg;
-
-	switch (reason) {
-	case REASON_BOUNDS:
-		verbose(env, "R%d has unknown scalar with mixed signed bounds, %s\n",
-			off_reg == dst_reg ? dst : src, err);
-		break;
-	case REASON_TYPE:
-		verbose(env, "R%d has pointer with unsupported alu operation, %s\n",
-			off_reg == dst_reg ? src : dst, err);
-		break;
-	case REASON_PATHS:
-		verbose(env, "R%d tried to %s from different maps, paths or scalars, %s\n",
-			dst, op, err);
-		break;
-	case REASON_LIMIT:
-		verbose(env, "R%d tried to %s beyond pointer bounds, %s\n",
-			dst, op, err);
-		break;
-	case REASON_STACK:
-		verbose(env, "R%d could not be pushed for speculative verification, %s\n",
-			dst, err);
-		break;
-	default:
-		verbose(env, "verifier internal error: unknown reason (%d)\n",
-			reason);
-		break;
-	}
-
-	return -EACCES;
-}
-
 /* check that stack access falls within stack limits and that 'reg' doesn't
  * have a variable offset.
  *
@@ -13989,7 +13956,7 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
 		ret = sanitize_ptr_alu(env, insn, ptr_reg, off_reg, dst_reg,
 				       &info, false);
 		if (ret < 0)
-			return sanitize_err(env, insn, ret, off_reg, dst_reg);
+			return ret;
 	}
 
 	switch (opcode) {
@@ -14117,7 +14084,7 @@ static int adjust_ptr_min_max_vals(struct bpf_verifier_env *env,
 		ret = sanitize_ptr_alu(env, insn, dst_reg, off_reg, dst_reg,
 				       &info, true);
 		if (ret < 0)
-			return sanitize_err(env, insn, ret, off_reg, dst_reg);
+			return ret;
 	}
 
 	return 0;
@@ -14711,7 +14678,7 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
 	if (sanitize_needed(opcode)) {
 		ret = sanitize_val_alu(env, insn);
 		if (ret < 0)
-			return sanitize_err(env, insn, ret, NULL, NULL);
+			return ret;
 	}
 
 	/* Calculate sign/unsigned bounds and tnum for alu32 and alu64 bit ops.
@@ -20515,6 +20482,22 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 			 */
 		}
 
+		if (env->insn_aux_data[i + delta].nospec_result) {
+			struct bpf_insn patch[] = {
+				*insn,
+				BPF_ST_NOSPEC(),
+			};
+
+			cnt = ARRAY_SIZE(patch);
+			new_prog = bpf_patch_insn_data(env, i + delta, patch, cnt);
+			if (!new_prog)
+				return -ENOMEM;
+
+			delta    += cnt - 1;
+			env->prog = new_prog;
+			insn      = new_prog->insnsi + i + delta;
+		}
+
 		if (insn->code == (BPF_LDX | BPF_MEM | BPF_B) ||
 		    insn->code == (BPF_LDX | BPF_MEM | BPF_H) ||
 		    insn->code == (BPF_LDX | BPF_MEM | BPF_W) ||
@@ -20561,27 +20544,6 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 			continue;
 		}
 
-		if (type == BPF_WRITE &&
-		    env->insn_aux_data[i + delta].nospec_result) {
-			/* nospec_result is only used to mitigate Spectre v4 and
-			 * to limit verification-time for Spectre v1.
-			 */
-			struct bpf_insn patch[] = {
-				*insn,
-				BPF_ST_NOSPEC(),
-			};
-
-			cnt = ARRAY_SIZE(patch);
-			new_prog = bpf_patch_insn_data(env, i + delta, patch, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
-			continue;
-		}
-
 		switch ((int)env->insn_aux_data[i + delta].ptr_type) {
 		case PTR_TO_CTX:
 			if (!ops->convert_ctx_access)
-- 
2.48.1


