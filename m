Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13ECC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 05:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPM/d8ucU/aCvkPtTtqBYkvS0mdPeqTCnB8f7vkTZfc=; b=oQwMCFWpCRZ67cuAu8wtQS2KyC
	J1ntncME+QaAh8h2yxyCEpPmMM9/raV0/FoACr8R4mieA5B2BLZqr9OlwEce2KyAuK3huCy+9v7Ll
	bbfwSFSjwxxuqI8IB8cG0ooCrHg46ah+fPGkijtkVXM6/06rzC9znert4qF4dMOGrDPUUptjTXpd7
	/c0AcEVKmM9xgZEJb6HRVmNtsfz9XRDWIqoUmOt9IiEZDJG2npqLXZsQerMRyrpHC+7F0sHtu2krp
	ouEHFMumMAqeb3sXi3vekJmphP0ZhyRz+ZUkbAgw8ZZihjK2Ew1kXg0JPTqJCtVMOFb8UePXlnkKi
	V9pLQkiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toyaI-0000000HH59-2dvQ;
	Mon, 03 Mar 2025 05:43:22 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toyUd-0000000HGKt-49OC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 05:37:33 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-22328fb6cbfso72619855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 21:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740980250; x=1741585050; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xPM/d8ucU/aCvkPtTtqBYkvS0mdPeqTCnB8f7vkTZfc=;
        b=TzQJidolUVYpibgKf1ZjquN7JFdAZj+EMNTE/AUxe+a7pwu43TvVMLjTXKgfnD4BS1
         CV2XXh43QPRZd7BLgjmSmeZcVHE0tDxWtyZ+vgadFd5Ke6TtzgWfQGgHbjCKTg2C/+9c
         0e6KWlGGAtqXaobOE0w2qNAyc18aiEygtG+JeTHcN6UGAbaIKmDNd2MVzCeSQgEhRh+W
         ALhpHcOYVq3cHoNVOeaPgC5SEuB7bk5JrREDQEKNu8DQei+3uImNypCWxETy99TKv3dx
         lou7vOUVOZTs4WvGBiEYRVMakqyT0gXy+S4mqy9jkt3fgcr9v4MpAsnNSaW+WzO3NlSo
         DstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980250; x=1741585050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPM/d8ucU/aCvkPtTtqBYkvS0mdPeqTCnB8f7vkTZfc=;
        b=tDlBiEEH/HWEsrTQSoGhwFroKvvjk++qkhbcdjEqhpwOtafWWWshl0m9/3l3Ra21pJ
         5lgd7uB4sgSZJpdK2OcHbaLCD5Q0pUzvOzUQ7r+Zpf9kseu0QZ+1Hj2l/jBmv1+AXiMU
         ACzQcA34HOZYMrf6LXMXHuSW2uiNsX0mN/QUVFP9NEKBPrOH8EX+FP2XsN21lnH65SbL
         yzALzKKIK5uI5cQ8C8xtRCQIOihzCG81oWgghDfx0kbfDbePswtPvcf+O3WRRp2SxlOG
         ankcczl0PIkTIzSxDZX8vZxNFzz+M4Uq6e/Wsf5Xdz5sAHpTg4Ewpb2S8c5mzqwiwOHP
         JHUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDUuD3YMZrsv+yfHHZwK2YJLERPpYsBCqSVg2ofpP8MwXY2X4HDKazGY8ZIrcgZyAPpRa0LzurkrmySwr7awU3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy15i5lulfDIMq2ULtJ8wg7ODVAX2gRvWhYSnHEGyqBBECVZSR7
	iLEYtlBdCcH7gnzM+xmLygbGh6KHClbzKDc4JmTkarVJtCthwjacDenbiBCFHXFF80Sgf6hX6Qc
	BhEToCLFXbg==
X-Google-Smtp-Source: AGHT+IFd0bRzT6Rf6GCL8yvgeLbmofEZHIi8D+gz8MXJG3yNYxhrfMMp8T7aKzxnwK4iYpxZh2FJ3rZewRiYoA==
X-Received: from pjur6.prod.google.com ([2002:a17:90a:d406:b0:2fc:2959:b397])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:244d:b0:216:6901:d588 with SMTP id d9443c01a7336-22368f75980mr157873115ad.15.1740980250225;
 Sun, 02 Mar 2025 21:37:30 -0800 (PST)
Date: Mon,  3 Mar 2025 05:37:25 +0000
In-Reply-To: <cover.1740978603.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740978603.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <8b39c94eac2bb7389ff12392ca666f939124ec4f.1740978603.git.yepeilin@google.com>
Subject: [PATCH bpf-next v4 03/10] bpf/verifier: Factor out check_load_mem()
 and check_store_reg()
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Alexei Starovoitov <ast@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_213732_041637_77A87458 
X-CRM114-Status: GOOD (  16.22  )
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

Extract BPF_LDX and most non-ATOMIC BPF_STX instruction handling logic
in do_check() into helper functions to be used later.  While we are
here, make that comment about "reserved fields" more specific.

Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
Acked-by: Eduard Zingerman <eddyz87@gmail.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 kernel/bpf/verifier.c | 110 +++++++++++++++++++++++++-----------------
 1 file changed, 67 insertions(+), 43 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index e3991ac72029..22c4edc8695c 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7616,6 +7616,67 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 static int save_aux_ptr_type(struct bpf_verifier_env *env, enum bpf_reg_type type,
 			     bool allow_trust_mismatch);
 
+static int check_load_mem(struct bpf_verifier_env *env, struct bpf_insn *insn,
+			  bool strict_alignment_once, bool is_ldsx,
+			  bool allow_trust_mismatch, const char *ctx)
+{
+	struct bpf_reg_state *regs = cur_regs(env);
+	enum bpf_reg_type src_reg_type;
+	int err;
+
+	/* check src operand */
+	err = check_reg_arg(env, insn->src_reg, SRC_OP);
+	if (err)
+		return err;
+
+	/* check dst operand */
+	err = check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
+	if (err)
+		return err;
+
+	src_reg_type = regs[insn->src_reg].type;
+
+	/* Check if (src_reg + off) is readable. The state of dst_reg will be
+	 * updated by this call.
+	 */
+	err = check_mem_access(env, env->insn_idx, insn->src_reg, insn->off,
+			       BPF_SIZE(insn->code), BPF_READ, insn->dst_reg,
+			       strict_alignment_once, is_ldsx);
+	err = err ?: save_aux_ptr_type(env, src_reg_type,
+				       allow_trust_mismatch);
+	err = err ?: reg_bounds_sanity_check(env, &regs[insn->dst_reg], ctx);
+
+	return err;
+}
+
+static int check_store_reg(struct bpf_verifier_env *env, struct bpf_insn *insn,
+			   bool strict_alignment_once)
+{
+	struct bpf_reg_state *regs = cur_regs(env);
+	enum bpf_reg_type dst_reg_type;
+	int err;
+
+	/* check src1 operand */
+	err = check_reg_arg(env, insn->src_reg, SRC_OP);
+	if (err)
+		return err;
+
+	/* check src2 operand */
+	err = check_reg_arg(env, insn->dst_reg, SRC_OP);
+	if (err)
+		return err;
+
+	dst_reg_type = regs[insn->dst_reg].type;
+
+	/* Check if (dst_reg + off) is writeable. */
+	err = check_mem_access(env, env->insn_idx, insn->dst_reg, insn->off,
+			       BPF_SIZE(insn->code), BPF_WRITE, insn->src_reg,
+			       strict_alignment_once, false);
+	err = err ?: save_aux_ptr_type(env, dst_reg_type, false);
+
+	return err;
+}
+
 static int check_atomic_rmw(struct bpf_verifier_env *env,
 			    struct bpf_insn *insn)
 {
@@ -19199,35 +19260,16 @@ static int do_check(struct bpf_verifier_env *env)
 				return err;
 
 		} else if (class == BPF_LDX) {
-			enum bpf_reg_type src_reg_type;
-
-			/* check for reserved fields is already done */
-
-			/* check src operand */
-			err = check_reg_arg(env, insn->src_reg, SRC_OP);
-			if (err)
-				return err;
+			bool is_ldsx = BPF_MODE(insn->code) == BPF_MEMSX;
 
-			err = check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
-			if (err)
-				return err;
-
-			src_reg_type = regs[insn->src_reg].type;
-
-			/* check that memory (src_reg + off) is readable,
-			 * the state of dst_reg will be updated by this func
+			/* Check for reserved fields is already done in
+			 * resolve_pseudo_ldimm64().
 			 */
-			err = check_mem_access(env, env->insn_idx, insn->src_reg,
-					       insn->off, BPF_SIZE(insn->code),
-					       BPF_READ, insn->dst_reg, false,
-					       BPF_MODE(insn->code) == BPF_MEMSX);
-			err = err ?: save_aux_ptr_type(env, src_reg_type, true);
-			err = err ?: reg_bounds_sanity_check(env, &regs[insn->dst_reg], "ldx");
+			err = check_load_mem(env, insn, false, is_ldsx, true,
+					     "ldx");
 			if (err)
 				return err;
 		} else if (class == BPF_STX) {
-			enum bpf_reg_type dst_reg_type;
-
 			if (BPF_MODE(insn->code) == BPF_ATOMIC) {
 				err = check_atomic(env, insn);
 				if (err)
@@ -19241,25 +19283,7 @@ static int do_check(struct bpf_verifier_env *env)
 				return -EINVAL;
 			}
 
-			/* check src1 operand */
-			err = check_reg_arg(env, insn->src_reg, SRC_OP);
-			if (err)
-				return err;
-			/* check src2 operand */
-			err = check_reg_arg(env, insn->dst_reg, SRC_OP);
-			if (err)
-				return err;
-
-			dst_reg_type = regs[insn->dst_reg].type;
-
-			/* check that memory (dst_reg + off) is writeable */
-			err = check_mem_access(env, env->insn_idx, insn->dst_reg,
-					       insn->off, BPF_SIZE(insn->code),
-					       BPF_WRITE, insn->src_reg, false, false);
-			if (err)
-				return err;
-
-			err = save_aux_ptr_type(env, dst_reg_type, false);
+			err = check_store_reg(env, insn, false);
 			if (err)
 				return err;
 		} else if (class == BPF_ST) {
-- 
2.48.1.711.g2feabab25a-goog


