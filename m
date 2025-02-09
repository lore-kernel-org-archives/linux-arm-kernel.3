Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DA1C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 03:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9QGCEe4s4f07RDG6bDFRWUa5WupjjYHN4Gq0S0QTJU=; b=dZRR7Xu6MCzQ8aIb5g7IQJdIjI
	lMfaIXs+4lGwJGSaVOp9yQjFwFDqFNELNOMSYaHVw5pbLqQAXUDugCubc97zvdqPWjxnCNgzzg+Fa
	L3ayOvbN5dei3I23deumBjs3dh6qoW3ByriJ5eaao9OQJ3O78f9GJ/RVrYfuyD42xDVjAz7FIimdv
	dV5odFuDi7WS4I0Ok+ZV/ACNsMfN7fKJvpjcQGEFCaHv4tTgM/RI7t2zqzAuWf/uR7EDx69m28QT6
	y4xwRDF+jBpMGGOKk4a7HGCQuOb9teYvJm6sjAVuiRnRngutmr608r170RTnHcV9RYIzJVznviagv
	HuXQgolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyJ8-0000000E08x-44V0;
	Sun, 09 Feb 2025 03:48:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgyHk-0000000DzvB-1Mr0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 03:47:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dc660b56cso2270686f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 19:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739072826; x=1739677626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9QGCEe4s4f07RDG6bDFRWUa5WupjjYHN4Gq0S0QTJU=;
        b=JyOPlT71xAoT2ePy4ZsCfYNSob0cy0DHdOIxdW1McrKNvg3jjpqJ8CND0Kvbo5nTKw
         HUjzg+bNaVjc2viCbiIN7FKkGFuwmVFSkLI82veRmyAlwuIcEol8fdpVwdynRDAUxihI
         OX9jDOIeccPCJJRHcRGKJ70yPo5daMVRlKqGSlEhJXi1QPMQrcuhNz4r9xHCaTaFVzvQ
         kkZtcDJeTYjYrh1VahVa0urYGGGvvixZclmBrC0E+f5Qz8JCNwt7JNAq+8n1Bp1wtTlJ
         YQWNDklDZX/a5Z0n9UHNsHtrT9G3jCErNjnMMAksmxRODQZNknpp6dXl4M9TnyOagCIM
         GRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739072826; x=1739677626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9QGCEe4s4f07RDG6bDFRWUa5WupjjYHN4Gq0S0QTJU=;
        b=VazrPRu4s2orvwU79rnPEF9caOgtOf0YJ3HccHcCg8ECoKWgiN7LFUoqnBXilW9LcY
         SrcuhyQ/vtCkXTOs63ljWK0opM9I29kdsVkoPlzDa18tq+badd2YWA2XjOTls68Nqejs
         DTf1o51+j6lugy6OEPk/d0+97WPuR0WuXBxCfXYeOYKGrrU/q7yJMesaIysDzUH3iTVm
         4Jhjh54WqFyEpVe9JRWV6bsHYyLyHLYKfwlADts01qMC1TOJSlkgea1wBnvk46Fo1G0V
         xmX0ROJv8KXyzgyr9HUASTmN2kWq2O4itc14ujvFeQPAJnVfw1zZfdTp2fOWGHicflpM
         6oig==
X-Forwarded-Encrypted: i=1; AJvYcCW0AkkIhoQSLbKtGhIyNwT15qz04GGTvc4yx6CdTe7vx2lRnbrlhHq+5mGLzuE/lyjulnUgUv42FJtbCcqGHqCg@lists.infradead.org
X-Gm-Message-State: AOJu0YyGItSoI0nDTPV39tS1vb/uW2DyQSmtMWcFvZpRXRkqmyTJ2kDp
	hbaNuROOy5806aPVgOzhJ6PVrpcXVneXdfA+z/mw1qQSvR/rvj3HOMMJ08gWrfm0Hb0InsGSeyd
	DOO+0dypxgw5nOZFkOle8Kiyo5w0=
X-Gm-Gg: ASbGncszC/e/e3PxO+XOsvIXRmeNkb+GwCE27IgQt7kCuHKytr290pBz+FKkNLihVn5
	9HXTQjdUlslocepfIn6w+MfUcAEOWWhQXAjVflpPor6ccS3NEGjWRHnZLfkD/4TURN+ga3XNqkb
	TABRFrMPHW9ygGD0AME4tzBM+SxbIg
X-Google-Smtp-Source: AGHT+IF8qpP7A+++uJooWGB2HYk2iXUbQzNwWZlU1Ir/ZBmmG/NjHXNgAp0R6jE703cBXGA5ZDTGWW24Bz9vvqWovbY=
X-Received: by 2002:a05:6000:2c2:b0:385:ee3f:5cbf with SMTP id
 ffacd0b85a97d-38dc8ddc464mr7061834f8f.20.1739072825622; Sat, 08 Feb 2025
 19:47:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com> <d03d8c3305e311c6cb29924119b5eecae8370bbc.1738888641.git.yepeilin@google.com>
 <CAADnVQ+L0h8qXfYkC3+ORyQkXFJ2MgO8FDHr_Ha0QMAtS_ujag@mail.gmail.com> <Z6gRHDLfA7cjnlSn@google.com>
In-Reply-To: <Z6gRHDLfA7cjnlSn@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 8 Feb 2025 19:46:54 -0800
X-Gm-Features: AWEUYZmrws4n9Tklxz5TlDMfaZkKg_EoOGMe8Vohc-FDZY-WZlDb1JfHtCemc_I
Message-ID: <CAADnVQLkHA9LGv99k2TZOJEGUU=dw=q6nVurJ=aoh0v6cFS6zQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/9] bpf: Introduce load-acquire and
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
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_194708_396575_985FF3F8 
X-CRM114-Status: GOOD (  27.95  )
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

On Sat, Feb 8, 2025 at 6:21=E2=80=AFPM Peilin Ye <yepeilin@google.com> wrot=
e:
>
> Hi Alexei,
>
> On Sat, Feb 08, 2025 at 01:30:46PM -0800, Alexei Starovoitov wrote:
> > > Introduce BPF instructions with load-acquire and store-release
> > > semantics, as discussed in [1].  The following new flags are defined:
> > >
> > >   BPF_ATOMIC_LOAD         0x10
> > >   BPF_ATOMIC_STORE        0x20
> > >   BPF_ATOMIC_TYPE(imm)    ((imm) & 0xf0)
> > >
> > >   BPF_RELAXED        0x0
> > >   BPF_ACQUIRE        0x1
> > >   BPF_RELEASE        0x2
> > >   BPF_ACQ_REL        0x3
> > >   BPF_SEQ_CST        0x4
> >
> > I still don't like this.
> >
> > Earlier you said:
> >
> > > If yes, I think we either:
> > >
> > >  (a) add more flags to imm<4-7>: maybe LOAD_SEQ_CST (0x3) and
> > >      STORE_SEQ_CST (0x6); need to skip OR (0x4) and AND (0x5) used by
> > >      RMW atomics
> > >  (b) specify memorder in imm<0-3>
> > >
> > > I chose (b) for fewer "What would be a good numerical value so that R=
MW
> > > atomics won't need to use it in imm<4-7>?" questions to answer.
> > >
> > > If we're having dedicated fields for memorder, I think it's better to
> > > define all possible values once and for all, just so that e.g. 0x2 wi=
ll
> > > always mean RELEASE in a memorder field.  Initially I defined all six=
 of
> > > them [2], then Yonghong suggested dropping CONSUME [3].
> >
> > I don't think we should be defining "all possible values",
> > since these are the values that llvm and C model supports,
> > but do we have any plans to support anything bug ld_acq/st_rel ?
> > I haven't heard anything.
> > What even the meaning of BPF_ATOMIC_LOAD | BPF_ACQ_REL ?
> >
> > What does the verifier suppose to do? reject for now? and then what?
> > Map to what insn?
> >
> > These values might imply that bpf infra is supposed to map all the valu=
es
> > to cpu instructions, but that's not what we're doing here.
> > We're only dealing with two specific instructions.
> > We're not defining a memory model for all future new instructions.
>
> Got it!  In v3, I'll change it back to:
>
>   #define BPF_LOAD_ACQ   0x10
>   #define BPF_STORE_REL  0x20

why not 1 and 2 ?
All other bits are reserved and the verifier will make sure they're zero,
so when/if we need to extend it then it wouldn't matter whether
lower 4 bits are reserved or other bits.
Say, we decide to support cmpwait_relaxed as a new insn.
It can take the value 3 and arm64 JIT will map it to ldxr+wfe+...

Then with this new load_acq and cmpwait_relaxed we can efficiently
implement both smp_cond_load_relaxed and smp_cond_load_acquire.

