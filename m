Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E056C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 00:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rInosp2NVM5wnXWfAnMbQV1Gw6ky5vVb+6V2AW92kzo=; b=0t6Thke5X5+RVqluGJfjym1ZC2
	BTnWQZu4s+sA3Ixk6b9OvDLK/LAnO73hzgaU2hpSagYOHnZBmnqeCQ0tTGD7noRPMHuKWGnKKQAiX
	Ne/cc4giLxjrOOR9Vv/hUi/kprQ7QEcLMVwDVzqDC2cpfm1YL6kWOwY3WmsbYicIM3sO+xNdU2NkD
	Yvg65IK4BcHy7yB/pbKbiUUrD+dPf6j8AA6bUZkWeKF8306tcwWTxcgZpX92wR0ldKEMIzOUmjndl
	PD3GiwMD35J9wSMeA7PQ9As3UF06V4bTemy8+vnXWpKwaRq8OCEC0n2LSWZm/yryBoqBiJ277Zb3g
	cXsRCdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdIeC-000000080cM-1QLd;
	Thu, 30 Jan 2025 00:43:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdIcq-000000080XA-3OPX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 00:41:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361815b96cso1132575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 16:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738197702; x=1738802502; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rInosp2NVM5wnXWfAnMbQV1Gw6ky5vVb+6V2AW92kzo=;
        b=A1w0Ws/ryl5RVmxNSRnPcAwsu1LYMasXZzpc/p2hfqiKZyJ8yJJM6FQW6QhXBd7gXx
         qQyaFp6UtnqKShxDWWKhTAdr4DRr0fNnzegbJ9BwuVQS2dFFJoBp3UG7qYk0+3ez+lB6
         Qulkj7FwhoTMy9qmxy4QCQNOdGkM4WizueEunOUryG277bw/w8mSxxh64cGqJoc8X3EK
         jsCXw7M/9otuDcxdDftk2bUHx1GNiTNP2g7AzrapdqnkjN3yp2VafqGGoC4tKFLM6eIs
         ZHk89fZt/atZNeZTNA7Mg2sX5GV2+llQBaA6CZl63w8hGUrk3Qel+YL7WvpfklLNtl2N
         6WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738197702; x=1738802502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rInosp2NVM5wnXWfAnMbQV1Gw6ky5vVb+6V2AW92kzo=;
        b=r5BInWTXvS7LufwOhayr71NUYQObDGXRlu+0a7mwXzyWPAjBwCZRhfeA5oRtcVAXEh
         IGqY3FV/iDWXmxNaQdI3Y6YwEGyYzUofcX9DO4zR157dOkfQJXmToy+5Go+GIxUxiSa9
         HmNCnj3TWRrgqNKYY12+O1MbkD5FEEeToabxKIxvW+tL/HbKSBlb+41QCmEetkpvEARi
         iBhuDamj4fPapuBP/ZYjGyGYepf6i6bDv7xUQVz92E+ZuWDjpwrmWfrbwnCr/8gXc20G
         /v2nnMHRYUhYa2jMjIrqfPAAJzDC9mVXDWa3LGJRQO8zu3oZGSMaQHyMUYM3yvGycr2q
         RaEw==
X-Forwarded-Encrypted: i=1; AJvYcCX4qkTIkjgHdZ3Gr74V54oaGVtIe5ba7geHubRf9AZNUMpQv0P4EdZo8FAp5Kwli97QOweSRIwAdgnBWlU7S5xI@lists.infradead.org
X-Gm-Message-State: AOJu0YxBfiC3wiA9fZkZbTBwACkplU9ZnZaYR9wxNDXl4CM6VaU6r0bP
	rEkMqOxUb/SNk6NxNF4ySKQqqsxXTsyrOPq8NNexIzR4sWzQR8k7NfojtC8RBxYHYxETneF+aQc
	nUoMFRhNOiaQcfRokq89QHwa8xS3M3iMu
X-Gm-Gg: ASbGncvQWDPuDjk71Eh06qKSX20sOSTUBW5SRE1iH856YQlbXgqPezy7nbRLWBEHSvy
	di4jSZJdlIt418uZiZLzV+4GclXEvQGa61bZKsF6I3zJRo7Nf29XWCPg9o+kRMqi8OCJxLiLvS/
	3OAq+lrBiTwDtMwlj4+8LG0RbGUEds
X-Google-Smtp-Source: AGHT+IFakXta0YUrPDaoAW39HXBtsSp792yT66oSE7DR1bgM8bLHLmF/Kpc4oac1rRkIqDnqCE70855yNkg5wHqD9m8=
X-Received: by 2002:a05:600c:4704:b0:431:54d9:da57 with SMTP id
 5b1f17b1804b1-438dc42a445mr48469715e9.30.1738197702373; Wed, 29 Jan 2025
 16:41:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737763916.git.yepeilin@google.com> <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
In-Reply-To: <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 29 Jan 2025 16:41:31 -0800
X-Gm-Features: AWEUYZnR1O34tW7s8Yp2f6hF-U05leRN407sB4GTvv3wxYUwU5sTTWv_OdxPe28
Message-ID: <CAADnVQ+5Ybu+rMBz5D-0GcZWemTwrzxy7vUfEiWpQ2CKugwwOA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Introduce load-acquire and
 store-release instructions
To: Peilin Ye <yepeilin@google.com>
Cc: bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf@ietf.org, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	David Vernet <void@manifault.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_164144_866107_0FBB7060 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index da729cbbaeb9..ab082ab9d535 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -1663,14 +1663,17 @@ EXPORT_SYMBOL_GPL(__bpf_call_base);
>         INSN_3(JMP, JSET, K),                   \
>         INSN_2(JMP, JA),                        \
>         INSN_2(JMP32, JA),                      \
> +       /* Atomic operations. */                \
> +       INSN_3(STX, ATOMIC, B),                 \
> +       INSN_3(STX, ATOMIC, H),                 \
> +       INSN_3(STX, ATOMIC, W),                 \
> +       INSN_3(STX, ATOMIC, DW),                \
>         /* Store instructions. */               \
>         /*   Register based. */                 \
>         INSN_3(STX, MEM,  B),                   \
>         INSN_3(STX, MEM,  H),                   \
>         INSN_3(STX, MEM,  W),                   \
>         INSN_3(STX, MEM,  DW),                  \
> -       INSN_3(STX, ATOMIC, W),                 \
> -       INSN_3(STX, ATOMIC, DW),                \
>         /*   Immediate based. */                \
>         INSN_3(ST, MEM, B),                     \
>         INSN_3(ST, MEM, H),                     \
> @@ -2169,6 +2172,8 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
>
>         STX_ATOMIC_DW:
>         STX_ATOMIC_W:
> +       STX_ATOMIC_H:
> +       STX_ATOMIC_B:
>                 switch (IMM) {
>                 ATOMIC_ALU_OP(BPF_ADD, add)
>                 ATOMIC_ALU_OP(BPF_AND, and)

STX_ATOMI_[BH] looks wrong.
It will do atomic64_*() ops in wrong size.
BPF_INSN_MAP() applies to bpf_opcode_in_insntable()
and the verifier will allow such new insns.

