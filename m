Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9778C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 22:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P41QYUawBpw997GdJNy/1K0xsnyRvnuZyY09o56WpN8=; b=JYJq/IrvQCbW1iyRPVOpemrIaS
	/ZeSD3jLHHioe7W+1fLX7ow8GDjHRXnXbXsFit3XYimPVZPxWIiwqMxPS6fnHNWYJMuxVCl52mRd9
	Mu6VyPs5Iqdz572UlZS0mPCWoEurld92+pRFkj0h//1biuMx9rxqXm+WDLDzdwLLF7CrVsQjXZQvB
	X+/l0KNfL16Ai4S7kLH0nCgPoi2ks9T8dPPIY3Y/54fCTm0m8avaFca5Uuu6QTIUTlRbXxyzdc+g5
	4lte59p7V73EphJMpUhJUpbFAmteU3u9ZsL1PinxpfNH5m1xRT/ow0wpuEPnENNg5JMRGFs0oz0A5
	T3qjwDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3xM-0000000GMeL-1yVZ;
	Fri, 14 Feb 2025 22:14:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3nS-0000000GL8p-3fBf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 22:04:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C81C55C5DA5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 22:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5942C4CEEC
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 22:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739570669;
	bh=8tx0cT67YSI1VPWBaLCgbv3IPwa8Ok1vayoF+KkWQtI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uLHVRHFS26xxsnGrAv0qqSL+eQvw3BD89SEWx3gGRYKyABEdZwtczWKALmyPcnktM
	 YVZAh6qTRU/1M6JnTGy3tq2Ijwg7k9bUumfrrTVQ8GUj0VBgGLKk6EU8jOC9dmajce
	 dVxMac/mKAfvX+RI450cNQu1kZBEpyhjDbJQd+aZH9D3vf/zMbx2gtpyhIXe6daWtB
	 uJj99Ee2rmka68jrI92rBe4vGBAnPjz2FL2cicKUCUJxdPelNWjH6KLC1qekJKlGeo
	 PuK/ld8z4MlK3ooaNQO0R2GHj8Ar0kMyEzOVJHY0Y2vkQRY/G6z+eAaP2S9evcjfsE
	 ckmJF1LYrNEpg==
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d1a428471fso6747855ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 14:04:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXmauDN49PFSYPMIrmqhqNa0cbJWSqUzjq0rmRv3co6ocUnnIQ8hNm9I/EnFkhF0kXw28xHJJ8AjCk44B+fS3qK@lists.infradead.org
X-Gm-Message-State: AOJu0YwskyR3wmRngUbtGAHjtW6SqmiC5tizPEmhJ3iJAzbMoeAWjuR8
	k2QZEVx1FC5Vw2XvKhlBAF+4LPnkZWmUZG46RscCrk7tJyzOI5eXjRBd2uu8UlixYtiir9RZJmT
	90rXPRJ8N1ga1fAZydTEgZqKrOfU=
X-Google-Smtp-Source: AGHT+IGm2i4EXICEpW9bgwkPPolWAFKP9xL/quKy8NddqTVnLPh4rbcjf52ksHT5lD1Rnl/XKRrm4e1eyWcKs15JiNU=
X-Received: by 2002:a92:c24d:0:b0:3cf:bb6e:3065 with SMTP id
 e9e14a558f8ab-3d279694a2emr9486645ab.0.1739570668959; Fri, 14 Feb 2025
 14:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe> <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe> <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <mb61py0yaz3qq.fsf@kernel.org> <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
 <20250214080848.5xpi2y2omk4vxyoj@jpoimboe> <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe>
In-Reply-To: <20250214193400.j4hp45jlufihv5eh@jpoimboe>
From: Song Liu <song@kernel.org>
Date: Fri, 14 Feb 2025 14:04:17 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
X-Gm-Features: AWEUYZmS9RgABXm_Z225NGGKzm18Fgmh_MxPC45lJBV_7EfAVM8AuVs83nd2IRc
Message-ID: <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>, Weinan Liu <wnliu@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Indu Bhagat <indu.bhagat@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_140430_998583_2D8F4622 
X-CRM114-Status: GOOD (  20.27  )
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

Hi Josh,

On Fri, Feb 14, 2025 at 11:34=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
>
> On Fri, Feb 14, 2025 at 09:51:41AM -0800, Song Liu wrote:
> > > Ignorant arm64 question: is the module's text further away from slab
> > > memory than vmlinux text, thus requiring a different instruction (or
> > > GOT/TOC) to access memory further away in the address space?
> >
> > It appears to me the module text is very close to vmlinux text:
> >
> > vmlinux: ffff8000800b4b68 T copy_process
> > module: ffff80007b0f06d0 t copy_process [livepatch_always_inline_specia=
l_static]
>
> Hm... the only other thing I can think of is that the klp relas might be
> wrong somewhere.  If you share patched.o and .ko files from the same
> build I could take a look.

A tarball with these files is available here:

https://drive.google.com/file/d/1ONB1tC9oK-Z5ShmSXneqWLTjJgC5Xq-C/view?usp=
=3Ddrive_link

> BTW, I realized the wrong function size shown in the WARNING stack trace
> is probably just due to a kallsyms quirk.  It calculates a symbol's size
> by subtracting its start address from the next symbol's start address.
> It doesn't actually use the ELF symbol size.  So the next symbol after
> copy_process() in the loaded module's address space might just be far
> away.

Yeah, I also think kallsyms logic was the issue here. So it is not the same
as the gdb-disassembly issue.

> That kallsyms issue has caused other headaches.  It really needs to be
> fixed to use the actual ELF symbol size.

Maybe we should have a "module_text_end" symbol?

Thanks,
Song

