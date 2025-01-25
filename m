Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D0AC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 02:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAhOVvwp95DURlQLkWceP8oOZonYxW56RQWdJ+tqdYo=; b=LrNOJ3YVQ9mZFaZTAsadVLLRan
	ZfcRW7JzWvuxssJYwEnlzUlUBWGk8jgJMeWHuQ3KySPC136hv4FzOyf5tKeaXEyqjuU+qQGfiKBiE
	ngKoLQDcIP1xROmzPeuIGKRknQZOdv5CgsNZvvPbSXcsG+Ko3NduZcJK5Hn1YzVpufhUSQG9+YZRV
	il8Ovv3WotJITHHeAwFy1JoSZ8feuojfUOUhsTC6XrjnNhzEZsJKLTQxEjOR/ldSLvw7lAK6wkQ9f
	YCh9yCczJqqolzU7IXoZyUmJOJF1+bS6fts9CTM82zc+US5LKW8KSLMiTFUhd8Wa2zICGAJiw0n8F
	OyJQH1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVmH-0000000FuF8-1h0s;
	Sat, 25 Jan 2025 02:20:05 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVkP-0000000Ftrd-0UM0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 02:18:10 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef80d30df1so5030593a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 18:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737771487; x=1738376287; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SAhOVvwp95DURlQLkWceP8oOZonYxW56RQWdJ+tqdYo=;
        b=BoW85YMS1nBjYbjUlB3JR4hkVBD/gdZKmNJlPoeB6KlSD7ftoVWIXEbDYw55jwfCB0
         F1/IMxwIsLCeFV4wMCy6AshV46w9ud/sb04ed7+HAgyOsy+M6HfNjG1Sg4XbOJxHfwmP
         0KrHkm/uJuAAWLpL2opPJVCn8KdIiTjbJIMo5Sy5lYVo2uEw6ZbjFoGcmved9N0N7rTk
         v90fXl52MzVtlPWdfvLXQjuWhqsXmBWAUa2ow9rIV7FDYrRSikgQ1FP1AAsta31pLtpa
         tJaH6Qi6Hnm2un9SC5rUSgYwM/+7ZBFuoDPhmTbI+nzfGidUGFySZ5Mv+wMhL3t6AWH9
         rZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737771487; x=1738376287;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAhOVvwp95DURlQLkWceP8oOZonYxW56RQWdJ+tqdYo=;
        b=PORxVIujZTNKsTBAPMBnibYtcBuNh3mVzAnKzzUZJqsOx7vwmtif6zE3nsmstnDn5D
         dBPwZLN8hf4u9p9e81h1dJbhDcge4BCCjvGawGoHKbKAemBVp7EdDCKQQYQpFH0VDfA8
         8Ze1x4cTzTIrHtpJv1JCLzdBe6u3LddqRDKXI/OpR6O5jmqPkD7Ekze4WKkNkVahjDX9
         7x8mob5AQIZYXsrYy/w3eg1pVRmWvJw/8L6cC/oZP2jsapbZaG2tw3rW1AOtuhkQiZrP
         uGE3l1VhheFOvdWYHTjyr8rITZaDksPPftYUXOA1eNiJ5xQESM3tyrJ+jixMTcQxn8Wq
         MwQA==
X-Forwarded-Encrypted: i=1; AJvYcCV6m4claEzqaMwcrCZzXLjag95U6TCQsVO9fKkNB4ssLLvyM1FRvhNDUwpJiz46Da3zVpGXp+FzaoxyxTYFw2as@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+RG2QKMbp9+O2Z3fCudo1r6aOnn9hi778ZWx7whPnUu8GjdgC
	n4TJmWWYFWyLqxQaD5oifShvJqARt2NQCXWTcP8Lmmm/4J7XiKT1EWuS6vv43GvhZJXC/+kUvwy
	BpQnEmZXYAA==
X-Google-Smtp-Source: AGHT+IH+1cbrPKWyykDgl/vF7cElMEjsc9SSUcFXj1Np6Z8pLDvoFHDe47yUm55K1xK5bhBJYeqphCuyAJpw0w==
X-Received: from pfbbx20.prod.google.com ([2002:a05:6a00:4294:b0:729:14f9:2f50])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2e24:b0:728:8c17:127d with SMTP id d2e1a72fcca58-72daf948568mr52769436b3a.8.1737771487369;
 Fri, 24 Jan 2025 18:18:07 -0800 (PST)
Date: Sat, 25 Jan 2025 02:17:50 +0000
In-Reply-To: <cover.1737763916.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1737763916.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <a47770869cfb984a148d6ded8ed8f4e43b8359e3.1737763916.git.yepeilin@google.com>
Subject: [PATCH bpf-next v1 1/8] bpf/verifier: Factor out atomic_ptr_type_ok()
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
X-CRM114-CacheID: sfid-20250124_181809_155411_322B30BC 
X-CRM114-Status: GOOD (  12.75  )
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
2.48.1.262.g85cc9f2d1e-goog


