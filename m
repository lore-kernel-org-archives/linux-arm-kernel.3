Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15046C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcTbBDmPuXAkneoxzG7APyhlttHMdDVjsF9iXGMU9/s=; b=U3sOZw4x5KuFEEa23nI0GQpUwF
	uM2iy4wk1ng6jbH4KPf4yDd/W9/Emq0Ckw5Ol9wO8SGkAibmfQOcF7+DpXKLLcxxgRjx6Vc9IirCl
	mm5hAGpuOvZJ8l0CORYvGymWQbLNBU3QL2PHh4qxkED+rtbIGwEBGuUv5pi+71ca622PctmctK1le
	f01UDN8VzDE6GZlSm0cQKnQxmYF1zZtgWWRjY+2gulT+kfpSw5Y6yJStefrVnnVCYxm760JPs9QzD
	FdvkWmOPPkCMaAS06tHvoCU2NCOqWMUUWjYyjV0PjugY7Z6/WnYhsS1/yh0XatgaTOTxDsd2d/chy
	KjUBieyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXdC-0000000Atyg-0G6D;
	Thu, 13 Feb 2025 11:43:46 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXaw-0000000Atcz-1wnq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 11:41:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-219f6ca9a81so80455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 03:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739446885; x=1740051685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vcTbBDmPuXAkneoxzG7APyhlttHMdDVjsF9iXGMU9/s=;
        b=g34mR+c8sD2ZgFJORP/xk83/+AN8FKK1Lhkf1FinxbSilazGsqFtZQdpCOVnCIDPaB
         mXTkWbyUaOC+DWimEzBtRv3WRZGo9S5kfbnl7+QeBm00OJYcs/UDI8nk3aEXqNpTyddz
         7EINkvij6WqgUqhjWeDUHbZktNzWVpijFsfnXDG9NRkpxDL3pGip8n6SW7cmwFspk3/+
         edSLCtqBG6zOwZclrqFmcLVQzRsLqTob4fPxfEJEZsQmLHOM+gfVhroXMAPO23/sosfM
         FKNfqLgGM7F2/YvHYF/A3NXY//OlDfxBQB7F3GlYrGGm82/g0gHvWwopxBGll/XBi2Ag
         3UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739446885; x=1740051685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcTbBDmPuXAkneoxzG7APyhlttHMdDVjsF9iXGMU9/s=;
        b=MZ67UBsT9PliaSgDQ8Ob6h11T4hNc7NzsXScgatvrcHNxn5rLR2MLq5iGjTdOhrRi+
         74o47q08PY4/ouivl37hX9W9XShKUgwqNxn/mHf+zJVNqQt7uZFASdtNY8j4cKAAlSed
         kT8ynCFlX0tlI5hBSjmBrOo25H8Aop8bTeIueDOnU/EgVPmfJhAO8/N+m//bY8CdKYVX
         w8X2SY/4GakzvtvYiI9OLWwFLDedRwBRx+Cs0HbKsJnYMlvdpJEffhftEpElmk2RoSNY
         GTRzuouZp8wEcLPAzDXPC0Ez+BjiOeUdSi1ZtBHZu2KnROUuc0RCpg+tjsmmJebSv+QR
         PNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGB48oh7Lid+Wf1WcYMUhgNlP8I/+BxqaXLcmv8Q5c+ab1HCwTFQUVpr8UEF9pYUJEbym7njqLASQbbSxl3DWk@lists.infradead.org
X-Gm-Message-State: AOJu0YyyYH79GxNE8rQCSWkJtYeO8PoHh7IMptLmhcxr2OKmqRjWtkSU
	0D4M2LpVgHc5vvqe2PZZWt8roiXs0Ri0G5YSj0cJRSBDvTXmufnLskMU5bhQ7w==
X-Gm-Gg: ASbGncv+xrpmPrSlvDIXgweJkJXkcVXrA41PfOag5WwJuToDHlr4IV/GuDzH0ZDeauj
	dR//17bJmiRvbLNKrdN1TrxSE79k9noOZ90aDfypbYwuP1r9rh89OfT0jHIK2/Xch/dk9xSp1qI
	kmvr1vYwEGiR2cyQkUTDRVXvVzeC9NSXM2LO/aJ0zgEH9L+C9/O++QX3glorVvSwnH+RHbEk0pD
	FzWWNxmlR6qxqJJptEMxL8vVZzAKFUCv5t7AYtoZZ0faHZ+EnubB417fnkT/n5yInPVv04iKQN5
	3q7bq0dk2EuGRl4ghOcK5eKxSL7mhK8EN6TvQ6wVOMBoWWx2pTZ20A==
X-Google-Smtp-Source: AGHT+IFhMwP5lG09eUiy8MoGZ1rExMjc2AZS5qrzOF9s8D16MP3iao/73UkXEF2N1awGUq3vIppn4w==
X-Received: by 2002:a17:902:c40b:b0:216:21cb:2e06 with SMTP id d9443c01a7336-220d55bf74cmr1995625ad.19.1739446885219;
        Thu, 13 Feb 2025 03:41:25 -0800 (PST)
Received: from google.com (147.141.16.34.bc.googleusercontent.com. [34.16.141.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5364351sm10758605ad.76.2025.02.13.03.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 03:41:24 -0800 (PST)
Date: Thu, 13 Feb 2025 11:41:19 +0000
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
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Yingchi Long <longyingchi24s@ict.ac.cn>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 4/9] bpf: Introduce load-acquire and
 store-release instructions
Message-ID: <Z63aX0Tv_zdw8LOQ@google.com>
References: <cover.1738888641.git.yepeilin@google.com>
 <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com>
 <Z6gRHDLfA7cjnlSn@google.com>
 <CAADnVQLkHA9LGv99k2TZOJEGUU=dw=q6nVurJ=aoh0v6cFS6zQ@mail.gmail.com>
 <Z6qC303CzfUMN8nV@google.com>
 <Z60dO2sV6VIVNE6t@google.com>
 <CAADnVQ+OyoBPOJk6dcUFozTt0RD-o-hHdR4Dgy+dK2r0uHyC7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQ+OyoBPOJk6dcUFozTt0RD-o-hHdR4Dgy+dK2r0uHyC7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_034126_535726_26E76188 
X-CRM114-Status: GOOD (  38.10  )
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

On Wed, Feb 12, 2025 at 09:55:43PM -0800, Alexei Starovoitov wrote:
> > > > >   #define BPF_LOAD_ACQ   0x10
> > > > >   #define BPF_STORE_REL  0x20
> 
> so that was broken then,
> since BPF_SUB 0x10 ?
> 
> And original thing was also completely broken for
> BPF_ATOMIC_LOAD | BPF_RELAXED == 0x10 == BPF_SUB ?
> 
> so much for "lets define relaxed, acquire,
> release, acq_rel for completeness".
> :(
> 
> > > > why not 1 and 2 ?
> > >
> > > I just realized

To clarify, by "just realized" I meant I forgot BPF_ADD equals 0x00
until (I had coffee on) Monday :-)

I wouldn't call it completely broken though.  For full context,
initially I picked [1] 0x1 and 0xb in imm<4-7> because:

  * 0x1 is BPF_SUB in BPFArithOp<>, and atomic SUB is implemented using
    NEG + ADD, quoting a comment in LLVM source:

    // atomic_load_sub can be represented as a neg followed
    // by an atomic_load_add.

    Though admittedly atomic SUB _could_ have its own insn.

  * 0xb is BPF_MOV, which is not applicable for atomic (memory)
    operations, as already discussed

After discussing [2] this with Yonghong, I changed it to 0x1 and 0x2,
because 0x2 is BPF_MUL and we are unlikely to support atomic
multiplication.  Then, following your suggestion to discuss the encoding
on-list, I left this as an open topic in RFC v1 cover letter (then
documented it in PATCH v1 8/8 and v2 9/9).

TL;DR: I wasn't aware that you were against having "aliases" (I do still
believe it's safe to pick 0xb).

> > > that we can't do 1 and 2 because BPF_ADD | BPF_FETCH also equals
> > > 1.
> > >
> > > > All other bits are reserved and the verifier will make sure they're zero
> > >
> > > IOW, we can't tell if imm<4-7> is reserved or BPF_ADD (0x00).  What
> > > would you suggest?  Maybe:
> > >
> > >   #define BPF_ATOMIC_LD_ST 0x10
> > >
> > >   #define BPF_LOAD_ACQ      0x1
> > >   #define BPF_STORE_REL     0x2
> 
> This is also broken, since
> BPF_ATOMIC_LD_ST | BPF_LOAD_ACQ == 0x11 == BPF_SUB | BPF_FETCH.
> 
> BPF_SUB | BPF_FETCH is invalid at the moment,
> but such aliasing is bad.
> 
> > > ?
> >
> > Or, how about reusing 0xb in imm<4-7>:
> >
> >   #define BPF_ATOMIC_LD_ST 0xb0
> >
> >   #define BPF_LOAD_ACQ      0x1
> >   #define BPF_STORE_REL     0x2
> >
> > 0xb is BPF_MOV in BPFArithOp<>, and we'll never need it for BPF_ATOMIC.
> > Instead of moving values between registers, we now "move" values from/to
> > the memory - if I can think of it that way.
> 
> and BPF_ATOMIC_LD_ST | BPF_LOAD_ACQ would == BPF_MOV | BPF_FETCH ?
> 
> Not pretty and confusing.
> 
> BPF_FETCH modifier means that "do whatever opcode says to do,
> like add in memory, but also return the value into insn->src_reg"
> 
> Which doesn't fit this BPF_ATOMIC_LD_ST | BPF_LOAD_ACQ semantics
> which loads into _dst_reg_.

I think we can have different imm<0-3> "namespace"s depending on
different imm<4-7> values?  So that 0x1 in imm<0-3> means BPF_FETCH for
existing RMW operations, and BPF_LOAD_ACQ for loads/stores.

Just like (browsing instruction-set.rst) for "64-bit immediate
instructions", the imm field means different things depending on the
value in src_reg?

If I change PATCH v2 9/9 to say the following in instruction-set.rst:

  ```
  These operations are categorized based on the second lowest nibble
  (bits 4-7) of the 'imm' field:

  * ``ATOMIC_LD_ST`` indicates an atomic load or store operation (see
    `Atomic load and store operations`_).

  * All other defined values indicate an atomic read-modify-write
    operation, as described in the following section.
  ```

The section for loads/stores will have its own table explaining what
imm<0-3> means.

> How about:
> #define BPF_LOAD_ACQ 2
> #define BPF_STORE_REL 3
> 
> and only use them with BPF_MOV like
> 
> imm = BPF_MOV | BPF_LOAD_ACQ - is actual load acquire
> imm = BPF_MOV | BPF_STORE_REL - release
> 
> Thought 2 stands on its own,
> it's also equal to BPF_ADD | BPF_LOAD_ACQ
> which is kinda ugly,

> so I don't like to use 2 alone.

Totally agree - if we use 2 and 3 alone, zero in imm<4-7> would mean
"reserved" for load_acq/store_rel, and "BPF_ADD" for add/fetch_add.

> > Or, do we want to start to use the remaining bits of the imm field (i.e.
> > imm<8-31>) ?
> 
> Maybe.
> Sort-of.
> Since #define BPF_CMPXCHG     (0xf0 | BPF_FETCH)
> another option would be:
> 
> #define BPF_LOAD_ACQ 0x100
> #define BPF_STORE_REL 0x110
> 
> essentially extending op type to:
> BPF_ATOMIC_TYPE(imm)    ((imm) & 0x1f0)

Why, it sounds like a great idea!  If we extend the op_type field from
imm<4-7> to imm<4-11>, 256 numbers is more than we'll ever need?

After all we'd still need to worry about e.g. cmpwait_relaxed you
mentioned earlier.  I am guessing that we'll want to put it under
BPF_ATOMIC as well, since XCHG and CMPXCHG are here.  If we take your
approach, cmpwait_relaxed can be easily defined as e.g.:

  #define BPF_CMPWAIT_RELAXED   0x120

(FWIW, I was imagining a subtype/subclass flag in maybe imm<8-11> or
 imm<28-31> (or make it 8 bits for 256 subtypes/subclasses), so that 0x0
 means read-modify-write subclass, then 0x1 means maybe load/store
 subclass" etc.)

> All options are not great.
> I feel we need to step back.
> Is there an architecture that has sign extending load acquire ?

IIUC, if I grep the LLVM source like:

  $ git grep -B 100 -A 100 getExtendForAtomicOps -- llvm/lib/Target/ \
	| grep ISD::SIGN_EXTEND
  llvm/lib/Target/LoongArch/LoongArchISelLowering.h-    return ISD::SIGN_EXTEND;
  llvm/lib/Target/Mips/MipsISelLowering.h-      return ISD::SIGN_EXTEND;
  llvm/lib/Target/RISCV/RISCVISelLowering.h-    return ISD::SIGN_EXTEND;

So LoongArch, Mips and RISCV it seems?

Semi-related, but it would be non-trivial (if not infeasible) to support
both zext and sext load-acquire for LLVM BPF backend, because LLVM core
expects each arch to pick from SIGN_EXTEND, ZERO_EXTEND and ANY_EXTEND
for its atomic ops.  See my earlier investigation:

  https://github.com/llvm/llvm-project/pull/108636#issuecomment-2433844760

> Looks like arm doesn't, and I couldn't find any arch that does.
> Then maybe we should reconsider BPF_LDX/STX and use BPF_MODE
> to distinguish from normal ldx/stx
> 
> #define BPF_ACQ_REL 0xe0
> 
> BPF_LDX | BPF_ACQ_REL | BPF_W
> BPF_STX | BPF_ACQ_REL | BPF_W
> 
> ?

[1] https://github.com/llvm/llvm-project/pull/108636#issuecomment-2398916882
[2] https://github.com/llvm/llvm-project/pull/108636#discussion_r1815927568

Thanks,
Peilin Ye


