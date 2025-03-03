Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1DAC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 05:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+JbDsy67cUYL40rbVjYYPAZCoJAbJK+Bgpj1Q0SZXU=; b=KJ81q0jbHOcqSkXl1A/x/zmwbb
	0nlkHbeULWn0KZYXFgMBgTP+qFlJnxW2/uFa9O/lHSLBpeLTEPCdKSOuM5yo6V3XYd85Mv1+1Wj7V
	aPmUf7mZDQoa6WikOOYwmY9Y1/LZMKPZ6/6YZR/rJntZXU0Q4rYQQBWws6kYoD9lEiMcxNmSTGA/Z
	1oClvf8uixdDJJZuz/RYXpDlCufSh2kowSKaEIILpe66rQLJwraW1hwRl4k8jA19zWNAr0FQP+Pvw
	4b+yuDWDEnIPC5ztPkh7PxXFBn11GH9M9zGAK8dF1CiXNYiu/PfwzyTaOktbz+jy+BgkDoiN1oOx4
	zHaIae/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toyYk-0000000HGyl-47VI;
	Mon, 03 Mar 2025 05:41:46 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toyUW-0000000HGJP-2GBo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 05:37:25 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-729ff9b1a06so134727a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 21:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740980242; x=1741585042; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t+JbDsy67cUYL40rbVjYYPAZCoJAbJK+Bgpj1Q0SZXU=;
        b=3CAM5gH1WiN+Dq9U2gwgEbpO0XUqwYQbsFkPzS2v/2LgszAnYNgMz2K3cbohobbtFs
         9H8jWN5EchqapgB40M6x2BWXq2KWJK9b8SFx/TONzO9oh4fWNBsJy/ZYQU1UlemK2Kk3
         Bdn+fQwLgLNcCKK0sywTUmJPvhEgmxRHoHo7ITTlfXyFw7/3TAqlxBgI30HPcXMAW9N3
         9QxJO3n9sDO+kR+wImYCLunvax9+YEFpCiV6egEdfhKrH756R0wAafAxGdaDglNEM1NV
         P4FstWWn0rUEp435620bUcLyqSpBm9gFM95eYDtHuF/sgihwqHyFrvz27hsxQqOEHSBf
         K0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980242; x=1741585042;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+JbDsy67cUYL40rbVjYYPAZCoJAbJK+Bgpj1Q0SZXU=;
        b=P7vJbzhoI6cM4goVT+tb+jTlo+Kgk3wlnmv+QZclCm/YCRArESnyI+XsuofEK4S7I5
         RpxCVFgy7SkqlNjzUKA62uN23pPPiEvEXOV5hhL9IGQ2YESBZ8K5R3hx9Hn/nUVrZs82
         A3/482Ly/mo9bCtW2tXJO8qBxFObSpc3a/UXOzvwBMXfmjNBdUz9R8S5kvV0G/jUARrQ
         SrpNmlsfDLEm7+cUDV6osfmTdGyq0JNnX8VHK1xYzkuGT/H6jfZqwuTBQQbw26k6OkE0
         qpV90IwFOgkXiSXkrF/zwnx8xabIwVT9GLaUsqzBUYKNLQNZdqtz19gTI1vzoQalfsQq
         iF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyNxPmKZNrpXyor7rRDRKgZuWyH3VXDuRUuUBuCUfOqBm1MRwAyZwzaRkFSRfTcLFf0yVBZIZwkPj6XAM8NV6X@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3hahUZhz1GlWdmmqL82pHdMBw901ZJ0lUtknjEGyeCgZsQNZ9
	47vLyih/KCgdjDLe1Zfbwzi5GFKMgew65tvO2LWbnqUJvMhNObSd/aScUJFVHaTAVfYmYIWluJr
	oSLwqkrtcVg==
X-Google-Smtp-Source: AGHT+IFuLGBKXj1TfcM+fxYVw/tUg0+xPiDUPHUfaif0a8hS8bsHY09Qvrucsh1Gl+blURS/FrX7hRSfk4jONw==
X-Received: from oaclu2.prod.google.com ([2002:a05:6871:3142:b0:2bc:6ad3:5671])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:af08:b0:29e:7603:be65 with SMTP id 586e51a60fabf-2c178337712mr6365626fac.1.1740980242647;
 Sun, 02 Mar 2025 21:37:22 -0800 (PST)
Date: Mon,  3 Mar 2025 05:37:19 +0000
In-Reply-To: <cover.1740978603.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740978603.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <6323ac8e73a10a1c8ee547c77ed68cf8eb6b90e1.1740978603.git.yepeilin@google.com>
Subject: [PATCH bpf-next v4 02/10] bpf/verifier: Factor out check_atomic_rmw()
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
X-CRM114-CacheID: sfid-20250302_213724_580165_C67DD2FB 
X-CRM114-Status: GOOD (  15.59  )
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
index 66b19fa4be48..e3991ac72029 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7616,28 +7616,12 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
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
@@ -7699,12 +7683,12 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
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
 
@@ -7714,13 +7698,34 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
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
@@ -19224,7 +19229,7 @@ static int do_check(struct bpf_verifier_env *env)
 			enum bpf_reg_type dst_reg_type;
 
 			if (BPF_MODE(insn->code) == BPF_ATOMIC) {
-				err = check_atomic(env, env->insn_idx, insn);
+				err = check_atomic(env, insn);
 				if (err)
 					return err;
 				env->insn_idx++;
-- 
2.48.1.711.g2feabab25a-goog


