Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8A5C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UwvqxyJ2K/g48t8U4HwZCTixs5aBO0jfSMiokXjqnU=; b=JsOnpzusInLciGNXXxLlueDY8Q
	ZkuAoq1P3tVv8c1hj1pOq8DwTWfGRlwZjSCfQvkXNrYLrmHlq0PEw44vwS4xy7bTZ0DSnGW+heuXF
	AtfGNsDgSaesinOztHQm0P30ezJpyYA+9WofD5T6X9oMNsvRoPbaf+AkYRapC17MI7uFa4Bm/cU0m
	HzMgpU1gNDyNUA5iiuHphzqspF2MY2fERP84kFaDGvbXYrSqFROm/hSjWzF9IwnBnr+wH0fRJaCtM
	Tb8UKwKYvi4drjn7Zs4xgbUCP3DMQoeDpTMC9sG4pYyogTmwx8trCk2GB8idpHxJ3Uap2G1aixN0G
	2O72NGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYq6-0000000BqCg-3blu;
	Tue, 03 Jun 2025 21:06:30 +0000
Received: from mx-rz-3.rrze.uni-erlangen.de ([2001:638:a000:1025::16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMYnx-0000000Bq0T-3edy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 21:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1748984655; bh=2UwvqxyJ2K/g48t8U4HwZCTixs5aBO0jfSMiokXjqnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=wbOymEgZJKXNIzpeaUKrrp5oi0BLy74WRh9F3bwtCLqd61ATLudI+i9TyAASaewVx
	 1KCMgLhcMmSyhK5V2Gp4mHHdUrNt3yssRKlmRoRWNe/1aX51cOV1u1X1L0S1zYCPxr
	 E97Q6dNoPofYhPz6xe02s6xanKM1LKzcIbl6C03D+ylvz8wP7Z3Q4ybppxrGIeXM7r
	 FyiGksjD6Y+m4BZ9Wywtm8yksqQthGPndCVETWx6/tAqG5EgN1ie1zc6LyaEDfo/uW
	 RCyMLneCN9We0rW4+IVRP3rS1ONtTLecLrtsaQ7Ev9B+M84UW7h3/IIKvj0Z4rBCvr
	 S4CCr13iAm4vA==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4bBjrH49Rpz1yZg;
	Tue,  3 Jun 2025 23:04:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3639:fe00:a21f:4ce4:8495:5578
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3639:fe00:a21f:4ce4:8495:5578])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+WzYk6/QiU80/dd/SlFMOAjg12F+WTVXc=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4bBjrB4xLxz1y5T;
	Tue,  3 Jun 2025 23:04:10 +0200 (CEST)
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
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Saket Kumar Bhaskar <skb99@linux.ibm.com>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Jiayuan Chen <mrpre@163.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [PATCH bpf-next v4 2/9] bpf: Return -EFAULT on misconfigurations
Date: Tue,  3 Jun 2025 22:57:53 +0200
Message-ID: <20250603205800.334980-3-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603205800.334980-1-luis.gerhorst@fau.de>
References: <20250603205800.334980-1-luis.gerhorst@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_140418_058143_FDDFDD6B 
X-CRM114-Status: GOOD (  15.19  )
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

Mark these cases as non-recoverable to later prevent them from being
caught when they occur during speculative path verification.

Eduard writes [1]:

  The only pace I'm aware of that might act upon specific error code
  from verifier syscall is libbpf. Looking through libbpf code, it seems
  that this change does not interfere with libbpf.

[1] https://lore.kernel.org/all/785b4531ce3b44a84059a4feb4ba458c68fce719.camel@gmail.com/

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>
Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 2e70be0cad49..c76fbf46a365 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -8954,7 +8954,7 @@ static int resolve_map_arg_type(struct bpf_verifier_env *env,
 	if (!meta->map_ptr) {
 		/* kernel subsystem misconfigured verifier */
 		verbose(env, "invalid map_ptr to access map->type\n");
-		return -EACCES;
+		return -EFAULT;
 	}
 
 	switch (meta->map_ptr->map_type) {
@@ -9642,7 +9642,7 @@ static int check_func_arg(struct bpf_verifier_env *env, u32 arg,
 			 * that kernel subsystem misconfigured verifier
 			 */
 			verbose(env, "invalid map_ptr to access map->key\n");
-			return -EACCES;
+			return -EFAULT;
 		}
 		key_size = meta->map_ptr->key_size;
 		err = check_helper_mem_access(env, regno, key_size, BPF_READ, false, NULL);
@@ -9669,7 +9669,7 @@ static int check_func_arg(struct bpf_verifier_env *env, u32 arg,
 		if (!meta->map_ptr) {
 			/* kernel subsystem misconfigured verifier */
 			verbose(env, "invalid map_ptr to access map->value\n");
-			return -EACCES;
+			return -EFAULT;
 		}
 		meta->raw_mode = arg_type & MEM_UNINIT;
 		err = check_helper_mem_access(env, regno, meta->map_ptr->value_size,
@@ -10965,7 +10965,7 @@ record_func_map(struct bpf_verifier_env *env, struct bpf_call_arg_meta *meta,
 
 	if (map == NULL) {
 		verbose(env, "kernel subsystem misconfigured verifier\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	/* In case of read-only, some additional restrictions
@@ -11004,7 +11004,7 @@ record_func_key(struct bpf_verifier_env *env, struct bpf_call_arg_meta *meta,
 		return 0;
 	if (!map || map->map_type != BPF_MAP_TYPE_PROG_ARRAY) {
 		verbose(env, "kernel subsystem misconfigured verifier\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	reg = &regs[BPF_REG_3];
@@ -11258,7 +11258,7 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 	if (changes_data && fn->arg1_type != ARG_PTR_TO_CTX) {
 		verbose(env, "kernel subsystem misconfigured func %s#%d: r1 != ctx\n",
 			func_id_name(func_id), func_id);
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	memset(&meta, 0, sizeof(meta));
@@ -11560,7 +11560,7 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 		if (meta.map_ptr == NULL) {
 			verbose(env,
 				"kernel subsystem misconfigured verifier\n");
-			return -EINVAL;
+			return -EFAULT;
 		}
 
 		if (func_id == BPF_FUNC_map_lookup_elem &&
@@ -16729,7 +16729,7 @@ static int check_ld_imm(struct bpf_verifier_env *env, struct bpf_insn *insn)
 		dst_reg->type = CONST_PTR_TO_MAP;
 	} else {
 		verbose(env, "bpf verifier is misconfigured\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	return 0;
@@ -16776,7 +16776,7 @@ static int check_ld_abs(struct bpf_verifier_env *env, struct bpf_insn *insn)
 
 	if (!env->ops->gen_ld_abs) {
 		verbose(env, "bpf verifier is misconfigured\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 
 	if (insn->dst_reg != BPF_REG_0 || insn->off != 0 ||
@@ -20816,7 +20816,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 						 -(subprogs[0].stack_depth + 8));
 		if (epilogue_cnt >= INSN_BUF_SIZE) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		} else if (epilogue_cnt) {
 			/* Save the ARG_PTR_TO_CTX for the epilogue to use */
 			cnt = 0;
@@ -20839,13 +20839,13 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 	if (ops->gen_prologue || env->seen_direct_write) {
 		if (!ops->gen_prologue) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		}
 		cnt = ops->gen_prologue(insn_buf, env->seen_direct_write,
 					env->prog);
 		if (cnt >= INSN_BUF_SIZE) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		} else if (cnt) {
 			new_prog = bpf_patch_insn_data(env, 0, insn_buf, cnt);
 			if (!new_prog)
@@ -21002,7 +21002,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 
 			if (type == BPF_WRITE) {
 				verbose(env, "bpf verifier narrow ctx access misconfigured\n");
-				return -EINVAL;
+				return -EFAULT;
 			}
 
 			size_code = BPF_H;
@@ -21021,7 +21021,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 		if (cnt == 0 || cnt >= INSN_BUF_SIZE ||
 		    (ctx_field_size && !target_size)) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		}
 
 		if (is_narrower_load && size < target_size) {
@@ -21029,7 +21029,7 @@ static int convert_ctx_accesses(struct bpf_verifier_env *env)
 				off, size, size_default) * 8;
 			if (shift && cnt + 1 >= INSN_BUF_SIZE) {
 				verbose(env, "bpf verifier narrow ctx load misconfigured\n");
-				return -EINVAL;
+				return -EFAULT;
 			}
 			if (ctx_field_size <= 4) {
 				if (shift)
@@ -21794,7 +21794,7 @@ static int do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = env->ops->gen_ld_abs(insn, insn_buf);
 			if (cnt == 0 || cnt >= INSN_BUF_SIZE) {
 				verbose(env, "bpf verifier is misconfigured\n");
-				return -EINVAL;
+				return -EFAULT;
 			}
 
 			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
@@ -22130,7 +22130,7 @@ static int do_misc_fixups(struct bpf_verifier_env *env)
 					goto patch_map_ops_generic;
 				if (cnt <= 0 || cnt >= INSN_BUF_SIZE) {
 					verbose(env, "bpf verifier is misconfigured\n");
-					return -EINVAL;
+					return -EFAULT;
 				}
 
 				new_prog = bpf_patch_insn_data(env, i + delta,
@@ -22490,7 +22490,7 @@ static int do_misc_fixups(struct bpf_verifier_env *env)
 		    !map_ptr->ops->map_poke_untrack ||
 		    !map_ptr->ops->map_poke_run) {
 			verbose(env, "bpf verifier is misconfigured\n");
-			return -EINVAL;
+			return -EFAULT;
 		}
 
 		ret = map_ptr->ops->map_poke_track(map_ptr, prog->aux);
-- 
2.49.0


