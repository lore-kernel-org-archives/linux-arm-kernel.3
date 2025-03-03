Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CB5C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 05:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11XVZ4zj75vGzfRxwzqc/xjgcajBZqFGyuNELSq3ePM=; b=3M983I+1GgirHegcWfrugeSsJh
	yDEJn5ryvW+dKMox5a1enDsyVR7NQ2xKXdex7RgyLeBsr3J6LPd4Z2TbByQMOsqT0d/PY07U9ofkt
	0ZGavSWqtAwbq9/iE9/yFEaydE6yM1afxRwnCNu/2Vij27aTEBobbE27X6mAMvIcARYu0ivZBXO2s
	7e1JPyGrJ3ZpOiHPC+EcxY0Uw4ybxaiy/Fi9VFsccq2cCe6f9fJXWSeAl1CtMgLMvu9jDbw33tCY6
	G35CrbAiVLWoTVFd+yZaAiYhy5neyJqaPjghqlzUcpMoHzSMq4o0HxTwBkXZrzMPtOU30kP4ayINo
	1kCg61iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toyXC-0000000HGqg-1M2b;
	Mon, 03 Mar 2025 05:40:10 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toyUO-0000000HGIa-0hrC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 05:37:17 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-2c14aae048bso6165850fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 21:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740980235; x=1741585035; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=11XVZ4zj75vGzfRxwzqc/xjgcajBZqFGyuNELSq3ePM=;
        b=pIe26oapykUSv8mG9HqH6htOXGbKH4stwG6BTgbdiUPeb+SiGaLL1HoiL3xNjYpIby
         h0mNPyDO2tLwe2lmv/8rNBkMUXPkfzpMMxTIGdYwvvkow7OlGlDAgIzl43ITXUIEAiAK
         ZpMBwP1sCwNyjK9I74nu4TZxbIyR7v7mutSDtPAUXewsHXs2qZX1EMQxtC1rFco2lzri
         jMuQFUhjYJnzaFhWd9G6ipurIHy5eGbQwpWdZRqYXTxd1J/TCFJbza9EGPsyn2znTO1Y
         dp5TfNwIUKuEdmJx3S63PNKH7Tjt5+FNSfEHkt4da9b5lX4Whkr87eWo6zdquXYhBcOd
         4BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980235; x=1741585035;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=11XVZ4zj75vGzfRxwzqc/xjgcajBZqFGyuNELSq3ePM=;
        b=WDbVWCbNPevDyFgNDJnKF2zpQnVn7NiN+260gISH/bBx4OVRJH90FCns4ZEHoTyudN
         Tk1dBGE+FUWJ9AM147iF/bGnh1E2KxPVYKh+kUWG/8pTXDXMkdXtQ1wMlx0++bJDw89g
         Ygigzj0kAiOrBWlc0LiDDzEbJnMiRpp/rEh2535nYbId1QRB6adseR/VXIE5rhQ/GdOy
         zi2XqlY6SViMd9ubstGhPgZB4no6jZ45wFapSnz2Y4KIod5/HV1pWkeoSCULbImt9aGK
         +IYhUCnEf3LHYB57vavg00JpAJ33HEB37LLcyVcE3PiemOjdcIuTGRnLWVf20PScT9ox
         8B4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX95Hyox5Hq8RTiR+sqWh5Ib4oRwEX7rvLGU6d7AjRir9jfsHWo/CBx1Teur12jDuNfcZfKeWzcvfkZxNki5obQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyxUs6oiAO5/H8brKCGjs2rtQQkMnP9kFUOFoXeXJEu/lEdu4f0
	Gh+LqtZyyATcPkHNS1I1GJJrm4cSxiMYdyIVbXMpTyClHql2K9Zy/W/u0Rb+KRslr3eoTiBgw1k
	bIqmADhuwjw==
X-Google-Smtp-Source: AGHT+IHCMcja7O5nHvC3arJ2BfVxXnE0ShNgQeyCXpt5rqYUWe3LnL8pz4yrPXjuWabnQEE7N86n3GCAwOPQKA==
X-Received: from oablh23.prod.google.com ([2002:a05:6870:b17:b0:2ba:487b:683e])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:332b:b0:2c1:7289:d62a with SMTP id 586e51a60fabf-2c1786d0bdamr7852051fac.36.1740980234887;
 Sun, 02 Mar 2025 21:37:14 -0800 (PST)
Date: Mon,  3 Mar 2025 05:37:07 +0000
In-Reply-To: <cover.1740978603.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1740978603.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <e5ef8b3116f3fffce78117a14060ddce05eba52a.1740978603.git.yepeilin@google.com>
Subject: [PATCH bpf-next v4 01/10] bpf/verifier: Factor out atomic_ptr_type_ok()
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
X-CRM114-CacheID: sfid-20250302_213716_208969_12441A53 
X-CRM114-Status: GOOD (  12.86  )
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
index eb1624f6e743..66b19fa4be48 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -6195,6 +6195,26 @@ static bool is_arena_reg(struct bpf_verifier_env *env, int regno)
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
@@ -7652,11 +7672,7 @@ static int check_atomic(struct bpf_verifier_env *env, int insn_idx, struct bpf_i
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
2.48.1.711.g2feabab25a-goog


