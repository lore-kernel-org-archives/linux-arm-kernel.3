Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33773C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVw9FAeQI7lCZwFZLEeeKDcfx7NZFxNIup/gnaKUq1Q=; b=j+QMQwt0Mt/34pd1uN1USRgEYp
	j+c1OuD0WG4ztMhp3W3/qMaQncZEbb4XNnxOBISjTDLeriJqeGwmElUR6erp8RtO2UegDdxv9ZvY7
	PVBe/GXuBRKUNerlFjs0PiHvJmXWxo9uNJh8FOo6UvOeQYvAMwiLoRb/mKZssLsAdG/DMWyOTEGCh
	eP4MWPeuz80T/1iI9FzVMEO3UWzGkJpLeY6PaeeKZ/7q1rXK4DGKFqxWTAIyjqxCB615dGZWI1lLZ
	a2ciH+g0O5OoaoT9CyZHYPCHaGl3JVBdfiEDyZB5aHD3u2aRvrc5n0DWKlxZIHvUl7V59WaWXETQC
	o/oLsU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvIU-0000000G5vm-2oOr;
	Thu, 20 Feb 2025 01:24:14 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvFE-0000000G4t6-0svj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:20:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2210121ac27so7301735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740014451; x=1740619251; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AVw9FAeQI7lCZwFZLEeeKDcfx7NZFxNIup/gnaKUq1Q=;
        b=nY41MOv1zGfsgkLEsUAfThtQIsHfsa8aVfkNmX+ru0xzOjYGVnM2O+v17C55t4NhTc
         R/Ie2pB2072MWZCT86TpYhLj80KyXy47AgHr1B9kuZyzpjF4hxjgS2Uo85wELr3XIn+L
         eslt2ASJj1daLYZc0bJaR0m4OpcGwBEnQ9SzMhuJa28HBblgW7uyvpimML4ibgFUjjga
         IvbVTeTN/Rt+NTlnkUvRiHnHFTA1AJ4fD1zQYq85R9Ngs+8rw7c544/HaRw8AhMPE7np
         Fssip4N9tK4tlrEPnv4yRtkxqvwPQRTy+dhdJWn6sySwfMybRt2uqaRp80qvqEUJce/5
         YvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740014451; x=1740619251;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVw9FAeQI7lCZwFZLEeeKDcfx7NZFxNIup/gnaKUq1Q=;
        b=kBGZ6GknoQlyfxtS/q0xgmGRpB2h8cBtmDi9aAahqPr/z75ecPDi+rX3D/lnkqERMw
         6lw5uNOXHWgZyltc0PI3l5xY+Apbe2OjgnIuWqK2qasicGbF7WIkgoCzxTasJE1MSKLz
         md1bT5D+Rz0DXa8pRD5kkKBHHmKFRI9SZD4gFFV6t6ttHqeogFUOGddioDxCTdRATi+U
         yNsUEGzXtO/kQVHUBsdzShnIgRYzqCjXeqkglNrKQwLMkJhA7l+3poby8fbXvkG0F2HR
         5x8bDAlOmzQssQ8ievej5BZK5IOPllK6/gjapMYnSpVK2GvJSGAGSHlUSUZkzZhvTl53
         VEHw==
X-Forwarded-Encrypted: i=1; AJvYcCWZvRQHSAF/R08w+SlqpC4Ob5yeGM7jUW1nYbzfi4KeipXuz3r8KIoEA7HdG87hbyPOxNN4pPPFf8BfchSKzzsV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu5zxqgOe0Ms7LTYugMfTT6xn/AjM5+8QaVS2yBnMJO9zN4HHW
	/NWkZ4/7KXsb/pFc5LVlzEHGblSxeL0j7/MdKIL2z0wA0xKEZ5A8JUj4zRlSie9Sw2OyO/GadZg
	yW/Nkb4Y5Wg==
X-Google-Smtp-Source: AGHT+IELkZhp3dnu1j1hrZyZSNzylf6/SsN58EX3cCnB9zawb1C1aTd09ns9uhXgPWFn3IcwfNEV46XMOLhkTw==
X-Received: from plbbj7.prod.google.com ([2002:a17:902:8507:b0:221:7c80:aeff])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:41c3:b0:220:ef79:aca9 with SMTP id d9443c01a7336-221711c8dd8mr102260065ad.53.1740014451316;
 Wed, 19 Feb 2025 17:20:51 -0800 (PST)
Date: Thu, 20 Feb 2025 01:20:41 +0000
In-Reply-To: <cover.1740009184.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740009184.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <91e99076cf23e75e4831c75b38f8cfa84d7da34b.1740009184.git.yepeilin@google.com>
Subject: [PATCH bpf-next v3 2/9] bpf/verifier: Factor out check_atomic_rmw()
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
X-CRM114-CacheID: sfid-20250219_172052_252946_96B6FE0C 
X-CRM114-Status: GOOD (  15.99  )
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
index 21658bd5e6d8..63d810bbc26e 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7615,28 +7615,12 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
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
@@ -7698,12 +7682,12 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
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
 
@@ -7713,13 +7697,34 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
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
@@ -19187,7 +19192,7 @@ static int do_check(struct bpf_verifier_env *env)
 			enum bpf_reg_type dst_reg_type;
 
 			if (BPF_MODE(insn->code) == BPF_ATOMIC) {
-				err = check_atomic(env, env->insn_idx, insn);
+				err = check_atomic(env, insn);
 				if (err)
 					return err;
 				env->insn_idx++;
-- 
2.48.1.601.g30ceb7b040-goog


