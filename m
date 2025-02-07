Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4C3C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQntqM+rLZWQ3ApAwlHMCjvEA5GNUgj+7EI4yYRHGrA=; b=TEafRaWKeLxOfwzjt/p5hM/jTf
	CuQGSt88W9RCwH34JEUKjl+Rot3xAfsnCYlb+SQmwMH4YxeyCBne3Z5zkQ+hTP+EKxdZE1TN/I/uO
	QVgIIbW8ryAyTrqqyQ+t/dr8aM0bvwp9qSXr0Vk7ZW/QK6fpWX7GFVqYauipx4AH5QV9BNJq1MmRJ
	D6b2uzJJFXmVGXL2qAe8PDLYNeLvJVqsxOwWgwRDPVWJFY9d4K2DAgz0TKMCudQwj8lBJ+yEpmueA
	1Z0nzNos5m/m7YkBxwmfhuDpa7rI+deQwQIcym5+86ztNSZZIShQq/gN0DKK/Lezml7osXP+L5ZeX
	jjmGv7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDmb-0000000823V-12s6;
	Fri, 07 Feb 2025 02:07:53 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDk5-000000081NO-39F9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:05:18 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2f550d28f7dso3247425a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893916; x=1739498716; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eQntqM+rLZWQ3ApAwlHMCjvEA5GNUgj+7EI4yYRHGrA=;
        b=ExXInPuRacJhyT8lOhkR4jfC61nufn/u2LezvLYPsKCHprsieD/8wazbRZELjyn42G
         Q9Hso6aJu11sIxz91a/H+DNeKILVLIHNZpjcrSDQDzKlRB+VmKjtifKmylL2pzBywoDH
         ckja/IAYRDGK393mnP9P+R55MsiPPQrqaQMOk2CT1qSaM3lUK9tuACIjwjQKRoG4bVZ8
         gNnjuLfkNrZO9IoEGvA1IXfY/1/fauMe/Br0hhL6Ay21NNkU4tE1rtqpC/Ai8gWfBfsD
         W+xTPRCOVxq2O2a4Nk7aPmEla5EHoCYmrQSdgFaLOCjypf/o5+Wn5lPz0/lfCXAdsMZS
         q9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893916; x=1739498716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQntqM+rLZWQ3ApAwlHMCjvEA5GNUgj+7EI4yYRHGrA=;
        b=OJdXrhnq76ZomqQmRnKjhLiNcbSuZJv7IRXU0YCWIsVK0juognahOrgieaAYN8ITxX
         DRHzkBRVQBtbzMkyinQd0XLzc7QLXFCLIBWzWN2hUfmpOM6EbmxuQVSY0fs1Jk9X2GJh
         jO2q5PkFHRFUK9Kwh0bGN2GpmT6cTFiM5lWbCY1HgITBDffzduiaNfxtK3Ge3EEYmuGU
         PZcEDsd3e76RMMe7KdTviIkbZ6Gld7CyAG8FblyEjY8dgNCeZd8bZGA12xeixeDRvra3
         yMB5pVhEHLTUgZaBXRhy8DiD0hmPIYvpFJhitu0bfDXB748VyeyMIiIdcJjvx8r30aUv
         b/YA==
X-Forwarded-Encrypted: i=1; AJvYcCXYt+iNJbxQCLyczs80ndI/Esiv7h+E2d317JXR6+DpNDeijmxWQIIlQKHPHBNMdS8tJYTZfD7EoBk71nkRWi6p@lists.infradead.org
X-Gm-Message-State: AOJu0YwMFH4W83nCIZlUMBnaJ6ZwNYJE95y9yji81w0W16kAzSt2kjiG
	pGSE8EpG7zhkY2OHqo7wIuJyhvL6iLEjNp4vTDxPHAvqv83dnBVV5YqpSOxtltPDdgPZmcj0yNP
	/dTWEOIzX+g==
X-Google-Smtp-Source: AGHT+IG8RnoKYzqmdlNq/GNWt0Bfp60toUuFc3O205+7HMgGDaEyEjHnEEWL3iMa82zSQ8qscCoeONeApNS1Lw==
X-Received: from pjg15.prod.google.com ([2002:a17:90b:3f4f:b0:2fa:1fac:2695])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4cd1:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-2fa23f5ebb1mr2348726a91.7.1738893916574;
 Thu, 06 Feb 2025 18:05:16 -0800 (PST)
Date: Fri,  7 Feb 2025 02:05:13 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <56a8a44753b6e12abcb61163ba97159615ca8114.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 1/9] bpf/verifier: Factor out atomic_ptr_type_ok()
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
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
X-CRM114-CacheID: sfid-20250206_180517_797557_27A2BC6B 
X-CRM114-Status: GOOD (  12.81  )
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

Factor out atomic_ptr_type_ok() as a helper function to be used later.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 kernel/bpf/verifier.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 9971c03adfd5..0935b72fe716 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -6116,6 +6116,26 @@ static bool is_arena_reg(struct bpf_verifier_env *env, int regno)
 	return reg->type == PTR_TO_ARENA;
 }
 
+/* Return false if @regno contains a pointer whose type isn't supported for
+ * atomic instruction @insn.
+ */
+static bool atomic_ptr_type_ok(struct bpf_verifier_env *env, int regno,
+			       struct bpf_insn *insn)
+{
+	if (is_ctx_reg(env, regno))
+		return false;
+	if (is_pkt_reg(env, regno))
+		return false;
+	if (is_flow_key_reg(env, regno))
+		return false;
+	if (is_sk_reg(env, regno))
+		return false;
+	if (is_arena_reg(env, regno))
+		return bpf_jit_supports_insn(insn, true);
+
+	return true;
+}
+
 static u32 *reg2btf_ids[__BPF_REG_TYPE_MAX] = {
 #ifdef CONFIG_NET
 	[PTR_TO_SOCKET] = &btf_sock_ids[BTF_SOCK_TYPE_SOCK],
@@ -7572,11 +7592,7 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
 		return -EACCES;
 	}
 
-	if (is_ctx_reg(env, insn->dst_reg) ||
-	    is_pkt_reg(env, insn->dst_reg) ||
-	    is_flow_key_reg(env, insn->dst_reg) ||
-	    is_sk_reg(env, insn->dst_reg) ||
-	    (is_arena_reg(env, insn->dst_reg) && !bpf_jit_supports_insn(insn, true))) {
+	if (!atomic_ptr_type_ok(env, insn->dst_reg, insn)) {
 		verbose(env, "BPF_ATOMIC stores into R%d %s is not allowed\n",
 			insn->dst_reg,
 			reg_type_str(env, reg_state(env, insn->dst_reg)->type));
-- 
2.48.1.502.g6dc24dfdaf-goog


