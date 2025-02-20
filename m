Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB88CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUnHgSEounregn05uHGT75nqn32OY7tna6KiTBpIBWU=; b=YERebwH3tsmOvdCNh5tICwJQ8v
	xvotABKF97kyVOWbmnfxpQ8epzY1QyhZUrd46lpvFrJWdIw5Y8UmG+3tliSbJaQuON7yK0uaquMuP
	7Fqyi3MRSZl+nfgoBFgKkb7Qmjpl+Q3BPd7mQDxHqDTbOQwMeWIZtUca6QIkkWhjNkGWBm5sOzspD
	nn8n3Ik98u9sYqiqJDwRnAtdvteWSRwOxt9jOoQXWqZJXlHwhgZiG/ZyYKAEly5wd1FFdGC4bQj0g
	nK9loYG7gMa2xJRgKJr2FJKNh9tJ9dPnTCS1/e785uDCX/EUb5ngEIkLzCQYGJodKFegmkJSU9Mjp
	n3buDirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvH2-0000000G5Ub-45Pe;
	Thu, 20 Feb 2025 01:22:44 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvEM-0000000G4eg-1c04
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:19:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-220e1593b85so7231065ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740014397; x=1740619197; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LUnHgSEounregn05uHGT75nqn32OY7tna6KiTBpIBWU=;
        b=eS9pKDnHqUBc8j+jhVw/HpTtcjVKPlp7kbqhVtcfxQnp6xHJTs9s5eyhtmG/1ld7B8
         ynyxw7fWxsFt2/q6A4nQVHsN1Y/ROYe08FRyU+4WhB2QX52wqRTBG12hR3Yi9bcb/yL0
         5P0teqIhKelKO3AySfzqlvw4SO3I07uiF0qXfEDwFC4XKy/GtC0x1wYQJqEjwo7C4j3f
         9lap/DxDuguhJSM/J6kb0XAEDgdAQkse0WiC/y+XHB6IoGJEb7U58gIeb5ywO84ARrS/
         oKMkf0tIYtMGx7ojdP4f2MIMcLCqgvoTi6HetLwaRqzkxL0v5uGwFyqfhxFCkMjZuhsE
         FUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740014397; x=1740619197;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUnHgSEounregn05uHGT75nqn32OY7tna6KiTBpIBWU=;
        b=Iw5aLSrGTMuktCZthp6hm5FZgwMSdvpU8Namhl7X1vfxC8cPB9zSQHHp8PgOgVmpLG
         PcGJ5xU3v3tOr5ymZXpVVyLF9ljQoS+y3nAi5Gm3Ufi4TmRfYE5hojJaxW84AYugN+Nm
         W++5HOaieJRGVkQRC74vYSBdFAJdePnrkEl1y2KyhxN/carihby1bEM15yf/rhhU+jKw
         mOFuoULWVotEFLmBRKPmjnyjIO8VcfMTUkdmp48y4Ty8TlP3bthI11TBYq36flKKFU9/
         MhfZS4EU1wbbEjl/KWa7N7Y/Szuekxh7DLdD5k8acxTHCxYushH3MkQtcNv9712jinXt
         dVxw==
X-Forwarded-Encrypted: i=1; AJvYcCXAoZ0U9NSaJDb2Wsq5+iqodtJuskUiA6CVqFFifzu2uY3cO8IA1IJaTBR6G9ein9RulB9PAPXhJgULYuK6RfsX@lists.infradead.org
X-Gm-Message-State: AOJu0YzsAm22TRxfYlnFMAP0l8Og/TqKFr89EExC1B7whavbWKjCZvmd
	pO7PmGBfKMjdEA7E/d7rSGJNgmlQfGc5zrHom3P+haa7JgjUvu23/cDQf6MTMwy5106k5tUJt62
	azGM6qCt9qw==
X-Google-Smtp-Source: AGHT+IGMFdx8KCQOyowQ5w7kdzLzapH1OG1g0TKzCE06XDnQiClJ/IBLT/uScVtfAiDmrUICsMmVFXpFWBIDzA==
X-Received: from plky4.prod.google.com ([2002:a17:902:7004:b0:220:d272:cfbe])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ec89:b0:215:6b4c:89fa with SMTP id d9443c01a7336-221040137ffmr260028595ad.8.1740014397157;
 Wed, 19 Feb 2025 17:19:57 -0800 (PST)
Date: Thu, 20 Feb 2025 01:19:53 +0000
In-Reply-To: <cover.1740009184.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740009184.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <58c5d8d587948922f257ca4735b4eb9518a191cd.1740009184.git.yepeilin@google.com>
Subject: [PATCH bpf-next v3 1/9] bpf/verifier: Factor out atomic_ptr_type_ok()
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
X-CRM114-CacheID: sfid-20250219_171958_420744_F89A8953 
X-CRM114-Status: GOOD (  13.37  )
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
index e57b7c949860..21658bd5e6d8 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -6194,6 +6194,26 @@ static bool is_arena_reg(struct bpf_verifier_env *env, int regno)
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
@@ -7651,11 +7671,7 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
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
2.48.1.601.g30ceb7b040-goog


