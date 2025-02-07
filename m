Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22969C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnyfeyX5KsaoejFCT4Pvz88fBme+Wvr3R6AqYNdoRSY=; b=Qxf+8AibBBjxHnAyYGj5OGK1ru
	FMUZ36Ad691nDtPjBawYsLCEoRHjqnQBw1y9q2IgI9O7VGXIFP0i3sbbI9daLOVRY7WpC/xCIZhbN
	izqW8+5giIr0a8zSs6ol8eRDoxJ2Gluq3U6HWfNkYIIYSV/+PZHGetfARSr+MHtJcc5ll4XxCcLWC
	MgEMsPxjtXxsHoE3vqa374blGM+rH231mEFkIsafPRnW0WQefC8N6gPDAHL1g8RG/1W9trSMhF4bl
	XMggCUQX1whVA3bSGQrwVtLcj4da/ttirrxZTtrkCzYCB7IyPFs+iyybdIzl0zcqG82Iv21pLh3fY
	Rln1w0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDnv-000000082Cu-3r7i;
	Fri, 07 Feb 2025 02:09:15 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDkJ-000000081QE-1Azj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:05:32 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f9f42d98e3so3285097a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893930; x=1739498730; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rnyfeyX5KsaoejFCT4Pvz88fBme+Wvr3R6AqYNdoRSY=;
        b=M6YC06d6uxJwOO5L27+4qmQQwWvYDL5WmiPHmM2cVrLH41Zcr0kytjjTXlKaKjBCgU
         JebpQTU8oBb98zhfar6E8POILs3g/30ous5taAw50YDQ9YBYvrwH6pU+Q31KWBy3ddVW
         EMe2bg2J8TjWC+Ik9Q3+luVv5OvKHUkkMFYYCoxEvqL1eGc3pI8BWD1Cguv6Ayq4kyzk
         +j4MSJ8ANvVe3tM3jxnhiurYiZEtKDK54E3a6fJtJXas1fUlPZMFtfcARtjVP9AWamun
         kcb5Gzxo1b9KNCFoo7FwukuXoTxgy0vhSRvANLbWCQJjRmsck9Cl5iclhejb1+/oYU2Z
         dsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893930; x=1739498730;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnyfeyX5KsaoejFCT4Pvz88fBme+Wvr3R6AqYNdoRSY=;
        b=PuqeVtrFaoktxyrxVV5IloT28VEWmIOoxt4BXkz4aM6qD1ffap+U5jZn7V4DGOmgSh
         td1yzmzXiJP7y00M9xbg0yl93ye98jFUqtWi0GjMu28+L/v8zIhcFwPxC/cqoM4oHt8t
         AEB84nh838+rauiBzGz/P62ih2/ZEksNaqvItTVDjG1qyR7CD8wXq3qnOpzr3VRp5daM
         5G7WMF+dyc54v0FYBG6Q6kY/2FLxicgkeH4MO0+taqA+1Wi8ZUf2uOmBY5GCAiPU0AsU
         +/UbROZSNdsJU3o0135HZSAFQMaNTNo6ChHTeSjlsci1j7heIQj0WQVIdSn0tZ06bFs0
         AvWA==
X-Forwarded-Encrypted: i=1; AJvYcCW1kQevlrbeQjrxQhwaxs/a+Gcd7PzZcLAeNbSa6b3MmC9xY6FvsYY6wKWboM0Q/8QiON3K7DbFHnZY+O5ucnjw@lists.infradead.org
X-Gm-Message-State: AOJu0YyeRwQY3Ndw2Xoge/etbnrC0ots4A0ZqSSuxM0qx/sLSRfqncIm
	77v4Md9JirTzTDMkLwGGPzRbZyLCLt+/nXsAd8GEothfN++9f/JY5B8apOJOYZ0FLOzs0qyP3mS
	bInLf+guoJg==
X-Google-Smtp-Source: AGHT+IF7v6kmdiGCxp2a0C++c/LlhPUZNvA/P6MK7nWPEghpqss2oNpv+9B3PTntoS5TGpQxBNw7FSCUTIfdEw==
X-Received: from pjbsl12.prod.google.com ([2002:a17:90b:2e0c:b0:2e2:44f2:9175])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4cd1:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-2fa23f5ebb1mr2349911a91.7.1738893930308;
 Thu, 06 Feb 2025 18:05:30 -0800 (PST)
Date: Fri,  7 Feb 2025 02:05:23 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <a9eddb6ce44a44bd9c9ea4fb14282b25fcd8c882.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 2/9] bpf/verifier: Factor out check_atomic_rmw()
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
X-CRM114-CacheID: sfid-20250206_180531_318918_5DC8F279 
X-CRM114-Status: GOOD (  15.43  )
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

Currently, check_atomic() only handles atomic read-modify-write (RMW)
instructions.  Since we are planning to introduce other types of atomic
instructions (i.e., atomic load/store), extract the existing RMW
handling logic into its own function named check_atomic_rmw().

Remove the @insn_idx parameter as it is not really necessary.  Use
'env->insn_idx' instead, as in other places in verifier.c.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 kernel/bpf/verifier.c | 53 +++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 0935b72fe716..39eb990ec003 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7536,28 +7536,12 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 static int save_aux_ptr_type(struct bpf_verifier_env *env, enum bpf_reg_type type,
 			     bool allow_trust_mismatch);
 
-static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_insn *insn)
+static int check_atomic_rmw(struct bpf_verifier_env *env,
+			    struct bpf_insn *insn)
 {
 	int load_reg;
 	int err;
 
-	switch (insn->imm) {
-	case BPF_ADD:
-	case BPF_ADD | BPF_FETCH:
-	case BPF_AND:
-	case BPF_AND | BPF_FETCH:
-	case BPF_OR:
-	case BPF_OR | BPF_FETCH:
-	case BPF_XOR:
-	case BPF_XOR | BPF_FETCH:
-	case BPF_XCHG:
-	case BPF_CMPXCHG:
-		break;
-	default:
-		verbose(env, "BPF_ATOMIC uses invalid atomic opcode %02x\n", insn->imm);
-		return -EINVAL;
-	}
-
 	if (BPF_SIZE(insn->code) != BPF_W && BPF_SIZE(insn->code) != BPF_DW) {
 		verbose(env, "invalid atomic operand size\n");
 		return -EINVAL;
@@ -7619,12 +7603,12 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
 	/* Check whether we can read the memory, with second call for fetch
 	 * case to simulate the register fill.
 	 */
-	err = check_mem_access(env, insn_idx, insn->dst_reg, insn->off,
+	err = check_mem_access(env, env->insn_idx, insn->dst_reg, insn->off,
 			       BPF_SIZE(insn->code), BPF_READ, -1, true, false);
 	if (!err && load_reg >= 0)
-		err = check_mem_access(env, insn_idx, insn->dst_reg, insn->off,
-				       BPF_SIZE(insn->code), BPF_READ, load_reg,
-				       true, false);
+		err = check_mem_access(env, env->insn_idx, insn->dst_reg,
+				       insn->off, BPF_SIZE(insn->code),
+				       BPF_READ, load_reg, true, false);
 	if (err)
 		return err;
 
@@ -7634,13 +7618,34 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
 			return err;
 	}
 	/* Check whether we can write into the same memory. */
-	err = check_mem_access(env, insn_idx, insn->dst_reg, insn->off,
+	err = check_mem_access(env, env->insn_idx, insn->dst_reg, insn->off,
 			       BPF_SIZE(insn->code), BPF_WRITE, -1, true, false);
 	if (err)
 		return err;
 	return 0;
 }
 
+static int check_atomic(struct bpf_verifier_env *env, struct bpf_insn *insn)
+{
+	switch (insn->imm) {
+	case BPF_ADD:
+	case BPF_ADD | BPF_FETCH:
+	case BPF_AND:
+	case BPF_AND | BPF_FETCH:
+	case BPF_OR:
+	case BPF_OR | BPF_FETCH:
+	case BPF_XOR:
+	case BPF_XOR | BPF_FETCH:
+	case BPF_XCHG:
+	case BPF_CMPXCHG:
+		return check_atomic_rmw(env, insn);
+	default:
+		verbose(env, "BPF_ATOMIC uses invalid atomic opcode %02x\n",
+			insn->imm);
+		return -EINVAL;
+	}
+}
+
 /* When register 'regno' is used to read the stack (either directly or through
  * a helper function) make sure that it's within stack boundary and, depending
  * on the access type and privileges, that all elements of the stack are
@@ -19076,7 +19081,7 @@ static int do_check(struct bpf_verifier_env *env)
 			enum bpf_reg_type dst_reg_type;
 
 			if (BPF_MODE(insn->code) == BPF_ATOMIC) {
-				err = check_atomic(env, env->insn_idx, insn);
+				err = check_atomic(env, insn);
 				if (err)
 					return err;
 				env->insn_idx++;
-- 
2.48.1.502.g6dc24dfdaf-goog


