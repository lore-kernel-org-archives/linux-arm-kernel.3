Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2916AC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 03:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2h6VqPwvBVdpdP0LT4AllXhem4WjK7tkni7E0ZVamc=; b=EIZsGitBFERamzQUHxTnQVa1cd
	CGCfT4T3AdJOOJ5B+Byn4/Qe3bEGK5g+ms7S7ORPhHfjrcGLaNTyPNX+pZ2BHzGA1ibXDY/tiLusO
	AuVQ6Zwwn/G/LgBioV01Em2oFkOKPtcfN/hYLH2YU8LyAeI5yxWmzDmS2We5XGNz1pKVWfGbNUZGW
	R2U+zWZqpUAzAFvcGkd7iWVYZvvaeoRQ44cgOlUQSCYSwd/LouzfhXpbEMWtiFdLuNF+1MfblU/Tj
	BohP9mJvmLU7UDH7rNXUFZwrzhc8Xg053EXk0xkD93qJrLtOtig0JhACNDu63xYIp0EDTbBoR4ZEw
	hvcSuiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdLPZ-000000088Et-3mAd;
	Thu, 30 Jan 2025 03:40:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdLOD-0000000889Q-0yC0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 03:38:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2163affd184so47675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 19:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738208328; x=1738813128; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g2h6VqPwvBVdpdP0LT4AllXhem4WjK7tkni7E0ZVamc=;
        b=fH/lF76BT6bxx3K7/QqIILhTmhsW/LYK9GNgHIwEtEXdzOzh6YhM0Flqh1RsXKxulh
         IOSb4drDfagjkP6mwjbk8AvfEpEzc/eVOMTJqLwt5XPr1qvoN/55f0UNMO0yKRmKX7WL
         hznA86HT4wY8P5iyMWENEh0lnsMzoikfWMxH3NSI9o5793cgRbWo6AIpajEs8H4SMUFF
         iPJaDgSjS3xTtdL6L3N7+x5/U7R9rFUDudRTkrN4Ilfo2CgNEeUMn474p0ERGMkwTtTb
         3wRQ+sUBKS87oDN7qDqg4l7bVHtARR3aISNitfQ56cCb0i03MW6rgINIww3dYrFdzPGC
         bR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738208328; x=1738813128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2h6VqPwvBVdpdP0LT4AllXhem4WjK7tkni7E0ZVamc=;
        b=mpMFRA0L7a/DjEpcGtobHeM0x5KTqd8x1XUiyMHDBDblmcvKXJYJKGf1h9KaNMdGJv
         U+JFIhLoRa6cMjroi4f/Cb9S7qJysrydxPVfTUyAD5uMVTwP0t+BzmZ5rSFbvp2aZM4l
         BXjQ0neBawKRtyw9RANL+7P0Ns+TwvQwxzhFOw2xNm6DIgG30pp13UmMlnrQ53+o2iwk
         rWBM6atT4K9vNFGFpk4/hNz1tWYNFSluvyzLV9nkq51OB8z5Bd9oFKM2lfOi0Xwo03tq
         CpYoFQ/XqB2VohkT7fkAD1YiTkIt9w4xYlUH/sQnM4iNYQNbn2wts7PJixF+tnnN9DvG
         vL5w==
X-Forwarded-Encrypted: i=1; AJvYcCUK+pwe5zZtjwgzs8B69MntBB3m0pIMSMOpM+vDHtWmER9f1AkWpfm/pawnE3AB5DvYTocth5UfNc7Z8k+10nyN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywft2cJPoHvx6KhNo7WXknk8JBzcLzbpuWyUWTnpMTi+AxGTqmT
	rMrcIMnWXQzAouy/fJN8GCbwd0oyhfA8Nqa10+rslZtDZKIQg7SLuevyg7VkPQ==
X-Gm-Gg: ASbGncsW5lEMGgjyJJPRf6ybBELNdp1jj8E2YEy+t5/K5NuA9mHr7O5N0wOGALApZ76
	h9s63wuYxL6x8MFCqQdGlW/PHG3RhNoXIdRZMYbUtnYbY2q96RyDzt8gP79YQ/MdqcjntVNsrkl
	m12G6od9a+2gNmo7iB0icT5+tGgjMyzPEDPkZVyGTiTm05oQA6Da2ceAYCEZhY7oXff8q0ovEl2
	iiWigJ/JbgcnASDw74RX8DNsYCy1/I6J8wLGIuJstkcFAdvUGyOdBafz7XLreii4IJv0YAtIu7P
	YEDMrs7po2W/UjjxGvi8B15rd4eDe3ISk4MEL0FJ0P/FLQ2ZhbA=
X-Google-Smtp-Source: AGHT+IHf+GQ922YV6u5BNC7Ftbuq76Fd/ay4ZcRcje5lxIC7r0ijg+0L68jiiIT8FOmQyUwd54xnLw==
X-Received: by 2002:a17:903:298f:b0:216:6ecd:8950 with SMTP id d9443c01a7336-21de36cdb21mr885165ad.19.1738208328087;
        Wed, 29 Jan 2025 19:38:48 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04796d6sm302970a12.55.2025.01.29.19.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 19:38:47 -0800 (PST)
Date: Thu, 30 Jan 2025 03:38:43 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1 3/8] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z5r0Q-JXYPb3mCL-@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <e52e4ab7bea5b29475d70e164c4b07992afd6033.1737763916.git.yepeilin@google.com>
 <CAADnVQ+5Ybu+rMBz5D-0GcZWemTwrzxy7vUfEiWpQ2CKugwwOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQ+5Ybu+rMBz5D-0GcZWemTwrzxy7vUfEiWpQ2CKugwwOA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_193849_294162_6525C143 
X-CRM114-Status: GOOD (  15.39  )
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

Hi Alexei,

On Wed, Jan 29, 2025 at 04:41:31PM -0800, Alexei Starovoitov wrote:
> > diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> > index da729cbbaeb9..ab082ab9d535 100644
> > --- a/kernel/bpf/core.c
> > +++ b/kernel/bpf/core.c
> > @@ -1663,14 +1663,17 @@ EXPORT_SYMBOL_GPL(__bpf_call_base);
> >         INSN_3(JMP, JSET, K),                   \
> >         INSN_2(JMP, JA),                        \
> >         INSN_2(JMP32, JA),                      \
> > +       /* Atomic operations. */                \
> > +       INSN_3(STX, ATOMIC, B),                 \
> > +       INSN_3(STX, ATOMIC, H),                 \
> > +       INSN_3(STX, ATOMIC, W),                 \
> > +       INSN_3(STX, ATOMIC, DW),                \
> >         /* Store instructions. */               \
> >         /*   Register based. */                 \
> >         INSN_3(STX, MEM,  B),                   \
> >         INSN_3(STX, MEM,  H),                   \
> >         INSN_3(STX, MEM,  W),                   \
> >         INSN_3(STX, MEM,  DW),                  \
> > -       INSN_3(STX, ATOMIC, W),                 \
> > -       INSN_3(STX, ATOMIC, DW),                \
> >         /*   Immediate based. */                \
> >         INSN_3(ST, MEM, B),                     \
> >         INSN_3(ST, MEM, H),                     \
> > @@ -2169,6 +2172,8 @@ static u64 ___bpf_prog_run(u64 *regs, const struct bpf_insn *insn)
> >
> >         STX_ATOMIC_DW:
> >         STX_ATOMIC_W:
> > +       STX_ATOMIC_H:
> > +       STX_ATOMIC_B:
> >                 switch (IMM) {
> >                 ATOMIC_ALU_OP(BPF_ADD, add)
> >                 ATOMIC_ALU_OP(BPF_AND, and)
> 
> STX_ATOMI_[BH] looks wrong.
> It will do atomic64_*() ops in wrong size.
> BPF_INSN_MAP() applies to bpf_opcode_in_insntable()
> and the verifier will allow such new insns.

We still have this check in check_atomic():

  if (BPF_SIZE(insn->code) != BPF_W && BPF_SIZE(insn->code) != BPF_DW) {
          verbose(env, "invalid atomic operand size\n");
          return -EINVAL;
  }

(moved to check_atomic_rmw() in PATCH 2/8)

Looks like it cannot be triggered before this patch, since
STX_ATOMIC_[BH] would've already been rejected by that
bpf_opcode_in_insntable() check before reaching check_atomic().

I agree that the interpreter code handling RMW atomics might now look a
bit confusing though.  In v2 I'll refactor that part and/or add comments
to make it clearer in the code that:

  * only W and DW are allowed for atomic RMW
  * all of B, H, W and DW are allowed for atomic load/store

Thanks,
Peilin Ye


