Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310F0FCB602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 22:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2OdrhXadYI72IWq7kWyQIfUPgWNwxvyos0YIZEVBG4=; b=beuLJKzWk7StYf0k7Y6+2hrAZg
	SKbJ3IK3nilTBkMvLSTwKGh5aX6V5kYMdYiH2R6SdHzfmJqOD2vdMkxCwLyfj4xOkBabi8IS/JwxH
	8SmkJmLoJlgm3ROuIx0wYkDJnhN7gVsYI4qnOwEjYlSJ5roJt707vT/ePwxkH0wv7Q4LdPp7Z8u63
	T9OLbsNIclnJg6n1yxXhKJR3vcw/CHDWxcfvmmBFnhUpTQDmMmYtzoGRAQN+yOmThzoLI6dNssLlG
	w743y4NBD1y2BBwH5YJyUwc53lz22Uz5WqXLN3r0J/mstp6Xhf8eoL5tZbAIOwUUu/czYuou1lcxq
	9gkLWm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydQX-00000004ZPj-0coQ;
	Fri, 06 Mar 2026 22:13:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydQT-00000004ZOK-32cV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 22:13:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E333D175A;
	Fri,  6 Mar 2026 14:13:34 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A779C3F7BD;
	Fri,  6 Mar 2026 14:13:38 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	puranjay@kernel.org,
	xukuohai@huaweicloud.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	richardcochran@gmail.com,
	a.s.protopopov@gmail.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/3] bpf: introduce bpf_jit_insn_aux_data
Date: Fri,  6 Mar 2026 22:13:29 +0000
Message-Id: <20260306221330.630971-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306221330.630971-1-yeoreum.yun@arm.com>
References: <20260306221330.630971-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_141341_841395_EBE01447 
X-CRM114-Status: GOOD (  22.38  )
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

This patch prepares for fixing the BTI exception related to gotox.

bpf_jit_insn_aux_data contains per-instruction auxiliary data for the JIT,
extracted from env->insn_aux_data.

For example, it is used to determine whether an instruction is
a destination of a gotox, allowing the JIT to emit
the appropriate BTI instruction at that location in arm64.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/linux/bpf.h    |  6 +++++
 include/linux/filter.h |  4 +++
 kernel/bpf/core.c      | 59 +++++++++++++++++++++++++++++++++++++++++-
 kernel/bpf/verifier.c  | 30 ++++++++++++++++++++-
 4 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 05b34a6355b0..12fed098ec85 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1606,6 +1606,11 @@ struct bpf_jit_poke_descriptor {
 	u32 insn_idx;
 };
 
+/* Per-instruction auxiliary data for JIT. */
+struct bpf_jit_insn_aux_data {
+	bool gotox_point;
+};
+
 /* reg_type info for ctx arguments */
 struct bpf_ctx_arg_aux {
 	u32 offset;
@@ -1768,6 +1773,7 @@ struct bpf_prog_aux {
 	struct bpf_stream stream[2];
 	struct mutex st_ops_assoc_mutex;
 	struct bpf_map __rcu *st_ops_assoc;
+	struct bpf_jit_insn_aux_data *insn_aux_data;
 };
 
 #define BPF_NR_CONTEXTS        4       /* normal, softirq, hardirq, NMI */
diff --git a/include/linux/filter.h b/include/linux/filter.h
index 44d7ae95ddbc..79b18a061cc0 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -38,6 +38,7 @@ struct xdp_buff;
 struct sock_reuseport;
 struct ctl_table;
 struct ctl_table_header;
+struct bpf_insn_aux_data;
 
 /* ArgX, context and stack frame pointer register positions. Note,
  * Arg1, Arg2, Arg3, etc are used as argument mappings of function
@@ -1116,6 +1117,9 @@ bool bpf_opcode_in_insntable(u8 code);
 void bpf_prog_fill_jited_linfo(struct bpf_prog *prog,
 			       const u32 *insn_to_jit_off);
 int bpf_prog_alloc_jited_linfo(struct bpf_prog *prog);
+int bpf_prog_alloc_jit_insn_aux_data(struct bpf_prog *prog);
+void bpf_prog_fill_jit_insn_aux_data(struct bpf_prog *prog,
+				    struct bpf_insn_aux_data *insn_aux_data);
 void bpf_prog_jit_attempt_done(struct bpf_prog *prog);
 
 struct bpf_prog *bpf_prog_alloc(unsigned int size, gfp_t gfp_extra_flags);
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 3ece2da55625..32656ef7750e 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -189,8 +189,27 @@ int bpf_prog_alloc_jited_linfo(struct bpf_prog *prog)
 	return 0;
 }
 
+int bpf_prog_alloc_jit_insn_aux_data(struct bpf_prog *prog)
+{
+	if (!prog->len || !prog->jit_requested)
+		return -EINVAL;
+
+	prog->aux->insn_aux_data = kvzalloc_objs(*prog->aux->insn_aux_data,
+						 prog->len,
+						 bpf_memcg_flags(GFP_KERNEL | __GFP_NOWARN));
+	if (!prog->aux->insn_aux_data)
+		return -ENOMEM;
+
+	return 0;
+}
+
 void bpf_prog_jit_attempt_done(struct bpf_prog *prog)
 {
+	if (prog->aux->insn_aux_data) {
+		kvfree(prog->aux->insn_aux_data);
+		prog->aux->insn_aux_data = NULL;
+	}
+
 	if (prog->aux->jited_linfo &&
 	    (!prog->jited || !prog->aux->jited_linfo[0])) {
 		kvfree(prog->aux->jited_linfo);
@@ -254,6 +273,20 @@ void bpf_prog_fill_jited_linfo(struct bpf_prog *prog,
 			insn_to_jit_off[linfo[i].insn_off - insn_start - 1];
 }
 
+void bpf_prog_fill_jit_insn_aux_data(struct bpf_prog *prog,
+				    struct bpf_insn_aux_data *insn_aux_data)
+{
+	int i;
+
+	if (!prog->aux->insn_aux_data || !insn_aux_data)
+		return;
+
+	for (i = 0; i < prog->len; i++) {
+		prog->aux->insn_aux_data[i].gotox_point =
+			insn_aux_data[i].gotox_point;
+	}
+}
+
 struct bpf_prog *bpf_prog_realloc(struct bpf_prog *fp_old, unsigned int size,
 				  gfp_t gfp_extra_flags)
 {
@@ -458,6 +491,7 @@ struct bpf_prog *bpf_patch_insn_single(struct bpf_prog *prog, u32 off,
 	u32 insn_adj_cnt, insn_rest, insn_delta = len - 1;
 	const u32 cnt_max = S16_MAX;
 	struct bpf_prog *prog_adj;
+	struct bpf_jit_insn_aux_data *insn_aux_data = NULL;
 	int err;
 
 	/* Since our patchlet doesn't expand the image, we're done. */
@@ -477,14 +511,28 @@ struct bpf_prog *bpf_patch_insn_single(struct bpf_prog *prog, u32 off,
 	    (err = bpf_adj_branches(prog, off, off + 1, off + len, true)))
 		return ERR_PTR(err);
 
+	if (prog->aux->insn_aux_data) {
+		insn_aux_data = kvzalloc_objs(*prog->aux->insn_aux_data,
+					       insn_adj_cnt,
+					       bpf_memcg_flags(GFP_KERNEL | __GFP_NOWARN));
+		if (!insn_aux_data)
+			return ERR_PTR(-ENOMEM);
+
+		memcpy(insn_aux_data, prog->aux->insn_aux_data,
+		       prog->len * sizeof(*prog->aux->insn_aux_data));
+	}
+
 	/* Several new instructions need to be inserted. Make room
 	 * for them. Likely, there's no need for a new allocation as
 	 * last page could have large enough tailroom.
 	 */
 	prog_adj = bpf_prog_realloc(prog, bpf_prog_size(insn_adj_cnt),
 				    GFP_USER);
-	if (!prog_adj)
+	if (!prog_adj) {
+		if (insn_aux_data)
+			kvfree(insn_aux_data);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	prog_adj->len = insn_adj_cnt;
 
@@ -502,6 +550,15 @@ struct bpf_prog *bpf_patch_insn_single(struct bpf_prog *prog, u32 off,
 		sizeof(*patch) * insn_rest);
 	memcpy(prog_adj->insnsi + off, patch, sizeof(*patch) * len);
 
+	if (insn_aux_data) {
+		memmove(insn_aux_data + off + len, insn_aux_data + off + 1,
+			sizeof(*insn_aux_data) * insn_rest);
+		memset(insn_aux_data + off + 1, 0x00,
+		       sizeof(*insn_aux_data) * insn_delta);
+		kvfree(prog_adj->aux->insn_aux_data);
+		prog_adj->aux->insn_aux_data = insn_aux_data;
+	}
+
 	/* We are guaranteed to not fail at this point, otherwise
 	 * the ship has sailed to reverse to the original state. An
 	 * overflow cannot happen at this point.
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index bf0281fb5db9..cfc87106aae2 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -22865,6 +22865,12 @@ static int jit_subprogs(struct bpf_verifier_env *env)
 		func[i]->aux->arena = prog->aux->arena;
 		func[i]->aux->used_maps = env->used_maps;
 		func[i]->aux->used_map_cnt = env->used_map_cnt;
+
+		err = bpf_prog_alloc_jit_insn_aux_data(func[i]);
+		if (err)
+			goto out_free;
+		bpf_prog_fill_jit_insn_aux_data(func[i], &env->insn_aux_data[subprog_start]);
+
 		num_exentries = 0;
 		insn = func[i]->insnsi;
 		for (j = 0; j < func[i]->len; j++, insn++) {
@@ -22957,6 +22963,9 @@ static int jit_subprogs(struct bpf_verifier_env *env)
 	for (i = 0; i < env->subprog_cnt; i++) {
 		func[i]->aux->used_maps = NULL;
 		func[i]->aux->used_map_cnt = 0;
+		func[i]->aux->insn_aux_data = NULL;
+		kvfree(func[i]->aux->insn_aux_data);
+		func[i]->aux->insn_aux_data = NULL;
 	}
 
 	/* finally lock prog and jit images for all functions and
@@ -23019,6 +23028,10 @@ static int jit_subprogs(struct bpf_verifier_env *env)
 		if (!func[i])
 			continue;
 		func[i]->aux->poke_tab = NULL;
+		if (func[i]->aux->insn_aux_data) {
+			kvfree(func[i]->aux->insn_aux_data);
+			func[i]->aux->insn_aux_data = NULL;;
+		}
 		bpf_jit_free(func[i]);
 	}
 	kfree(func);
@@ -26086,6 +26099,15 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u3
 	print_verification_stats(env);
 	env->prog->aux->verified_insns = env->insn_processed;
 
+	if (ret == 0 && !env->prog->jited && env->prog->jit_requested &&
+	    !bpf_prog_is_offloaded(env->prog->aux)) {
+		/* jit_insn_aux_data will be freed at bpf_prog_select_runtime() */
+		ret = bpf_prog_alloc_jit_insn_aux_data(env->prog);
+		if (ret)
+			goto err_release_maps;
+		bpf_prog_fill_jit_insn_aux_data(env->prog, env->insn_aux_data);
+	}
+
 	/* preserve original error even if log finalization is successful */
 	err = bpf_vlog_finalize(&env->log, &log_true_size);
 	if (err)
@@ -26140,8 +26162,14 @@ int bpf_check(struct bpf_prog **prog, union bpf_attr *attr, bpfptr_t uattr, __u3
 	adjust_btf_func(env);
 
 err_release_maps:
-	if (ret)
+	if (ret) {
+		if (env->prog->aux->insn_aux_data) {
+			kvfree(env->prog->aux->insn_aux_data);
+			env->prog->aux->insn_aux_data = NULL;
+		}
+
 		release_insn_arrays(env);
+	}
 	if (!env->prog->aux->used_maps)
 		/* if we didn't copy map pointers into bpf_prog_info, release
 		 * them now. Otherwise free_used_maps() will release them.
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


