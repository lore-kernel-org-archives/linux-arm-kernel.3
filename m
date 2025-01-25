Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72889C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 02:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIRUjVUPGvvoC/G+tLqvrHi6mwo3DeIvXXHsctD0qOI=; b=dFvYZkXl88QhSc6mfTJHx/5HsV
	PtwKOlGVVzMjsdOdtgdGY9AnsQFuoPNFm3+i9u1QT/q4z6hZw152OVYvgn9IMp8ezCAcisxIX5srj
	aqqbk7eUoKbMHKKC2BQP+2XK8nB9tIHDcVrD93B0+fGmE5noDIb/MMVxTj6h79iGvtP9tt6NCIxmn
	T2jVyeY6Eg7gsP+A2MdKKxdNF4WkEEajuMXSfcMVk7fZPZgSLzRCzJtcjG2xv/9WVYz33+qgw8TG9
	7tck/PENU4+Gp0qVpQG4JvaSiyeAS741Wrj9mbuUCP3+ESnMT6LmzlMM1TQlvJT+jgVQZl1mWkcPl
	5W3ojvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVnX-0000000FuNV-0Hf4;
	Sat, 25 Jan 2025 02:21:23 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVke-0000000FttX-13xD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 02:18:26 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2162f80040aso47775365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 18:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737771502; x=1738376302; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GIRUjVUPGvvoC/G+tLqvrHi6mwo3DeIvXXHsctD0qOI=;
        b=I9uahkWoam6CLaTtjXCqpvmEiV4DTKBfqFPk7ME/aOV+6wElkj5aT/GFYhK+j4XJo3
         ZNw21cLJ6XB1Og1auS4rerrynyMOeSJR640QC/XdBHSrwHPJxJsoJbLCDgC1ofgL1Jul
         xfZlDLCDAZy07wQw+LfS/2+9nFkTdrLwzPWF0+aMnHU0KYnD4qYNSBcsW8246dXfEMtR
         p/jB3bBkfvacGPCVUz16Nsahy3wXJ5jpZ/G0mnT3SYy7mxflrsIVDW8zbDeqF73sFMJ9
         zAKB0w1lZPz12+f/sWYO/jWHiYjBmAdwDLaXCPgZY4GDPaGQU6UQH2lyNyHbAXVnyh+s
         Usew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737771502; x=1738376302;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIRUjVUPGvvoC/G+tLqvrHi6mwo3DeIvXXHsctD0qOI=;
        b=pn1psA7NsPxROvtcOjNGnleNFfFwhIei+jZXsmZXwW5pyAU4YopVkWYg8/0U68oNku
         jQFxyKukV4cpVKJRxohBCUGkPhGh5m+nmeTFYsOFG5C3ysbUXu4ZhNmcDeEDIou4cgMq
         NhUyCcPnbSnWkAvyjDSbVlG2LCnu0p6hj5bsnXOm407LNOPfDFjWls5bL5Nu5TDmjqxO
         jPoH+ADw3rXBHeoFGPS12IKa4ut/cy50gbI+7YTUj0eBE2aEtCxN4pe6VZa/XqNdjjUc
         eRisYoPSZtBJZsviMmEX+7R+esYCGRlhHvaPSTH8m9sHLInWWdvf4lvW31OXv81i/DLO
         c5pw==
X-Forwarded-Encrypted: i=1; AJvYcCVhKRr+fcdw2/pwDDovdA4VlThATMLZtOGt703fGqT8Gc0fpb2h0lAGOtpfyJKhmgYiTZlnntcUQvBvCof0Fccv@lists.infradead.org
X-Gm-Message-State: AOJu0Yww0b/tHy9SPJ9HgAzRqlkkjTzuVVZCBbLFa5dxhxkrKkbM8Vwd
	sR7UaqptiYC0CjW79xxMs0b/p4u7/nx6yfDe04jmwbsOPZ+yZgKaVjWMjEfWi6WHOJgN00guhtb
	F2huEi1LYjw==
X-Google-Smtp-Source: AGHT+IHg0VQQH90pQuEfyGGIfiVpVl5OiI/iOGIaKUaWYcp8ziT8hehv5mLQYN4xTkvy2RPykSchBVyc1gr7cw==
X-Received: from plxd18.prod.google.com ([2002:a17:902:ef12:b0:216:5566:3c11])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e751:b0:215:9d29:9724 with SMTP id d9443c01a7336-21c355c6146mr550619555ad.38.1737771502432;
 Fri, 24 Jan 2025 18:18:22 -0800 (PST)
Date: Sat, 25 Jan 2025 02:18:17 +0000
In-Reply-To: <cover.1737763916.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1737763916.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <4831a11659532873c20f0c693c248e5cefaddcbf.1737763916.git.yepeilin@google.com>
Subject: [PATCH bpf-next v1 2/8] bpf/verifier: Factor out check_atomic_rmw()
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
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_181824_293927_7310C04D 
X-CRM114-Status: GOOD (  12.67  )
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

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 kernel/bpf/verifier.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 0935b72fe716..2b3caa7549af 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7536,28 +7536,12 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 static int save_aux_ptr_type(struct bpf_verifier_env *env, enum bpf_reg_type type,
 			     bool allow_trust_mismatch);
 
-static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_insn *insn)
+static int check_atomic_rmw(struct bpf_verifier_env *env, int insn_idx,
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
@@ -7641,6 +7625,26 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
 	return 0;
 }
 
+static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_insn *insn)
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
+		return check_atomic_rmw(env, insn_idx, insn);
+	default:
+		verbose(env, "BPF_ATOMIC uses invalid atomic opcode %02x\n", insn->imm);
+		return -EINVAL;
+	}
+}
+
 /* When register 'regno' is used to read the stack (either directly or through
  * a helper function) make sure that it's within stack boundary and, depending
  * on the access type and privileges, that all elements of the stack are
-- 
2.48.1.262.g85cc9f2d1e-goog


