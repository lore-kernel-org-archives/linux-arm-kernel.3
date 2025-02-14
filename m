Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310DEC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUMZSKVcmIltNr3VXbfq4WfgaaFyglULE1Gaj6TYz+4=; b=t1WRmLQ/z5DHjCRvHvPk4SJmKL
	PD6Xzizj7bOqy4Eb20CoL17nl1B/oxI8k1kjETI11PnwwbiPLcbQ6nClOSsRbtsPayD5Q7EIGAvdS
	Yq9pbCQGX1CycR4xf+MW6SG04pP2+uDP6KHeN4Ipc4QKr4UX7aywJ1dLhucyvkfCnlQoC0vxXaHZ+
	vGnCZ67Bkbf7pKWg6i9GhD63XZULXNfhrfDW0p0wq6TBF05PWyUKlRmlBJZaIrf5AJhsqXkUw1ESm
	dLl72Jg1+mGR5CtPnwqYr8z8gb217HDf43JH0KRMJLMD3zgy3Gzcs1H/+dtfAIjv7Z1B0z/tEmQ8c
	UvfiNHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1til0H-0000000DExm-0zkx;
	Fri, 14 Feb 2025 02:00:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tikyp-0000000DEls-1DHM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 01:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39F6A5C5D13
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 01:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A575C4CEE5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 01:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498338;
	bh=AtX4TcfqYpcyFBoqwkZl/9Tr2hyNSYfyQ73TsT0oaxY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jIrX+yVYWf1RwTCwUJj45RkaeiCeljgDw36fV1NgqYFjAkzl4tA844QxIw5V5h/8v
	 2vMo389vb32CV0lTnK0lke6FeQOMPajW64imBOxkDerHs+CcZi+/TmETRwZhfut9yX
	 GQEbgyQLD2hwF3WQmwJWpfE0I+EO0SOkySN2hIMRL9M5ytO2P5BVxxIHhXECx8zPTl
	 L0O1ys9thxERhTMz0P1BVXn/aiyl2f2JO9389OYuLZNgsPcrLczEFu7MMJopqnFasm
	 HKY8MVmp6bvwuJu4g9BfGmbZMM3eh7jQwg6B2PHm6RCxQBvlby5KOw5COjmqJ7vhEp
	 ByCaRaveCOMhg==
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d1988be53dso1629655ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 17:58:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEHWYO6EOmEKSOWQuD8mFJT+bKo53lbGeWFK2vMq9gaPdKTuT+86ojJZ0PrirfV9eq7SpFcdy8W/nKERmWuYiz@lists.infradead.org
X-Gm-Message-State: AOJu0YwZH3aKrDmjnaqVk61fhG6Dv4b+4/3Z/tiesZix0ntIgqJrnejy
	ywzvqJFSdRWrZc2p0QHBMz42oMHKJ//ucQPEsB/S3v8+KKfSFnEK75gxqP/AvnEHi+N+xxR8gjH
	QedfJKuHnbj1rOe2155cYtHHifZs=
X-Google-Smtp-Source: AGHT+IEqPgzO3lIvmSnLrOqQOZvaJ4xeAqJ3kVghhzVWZb4fCDChRFA3LLGruPGAyM1QQHijD9esbVZGX8Xo8nR1bnE=
X-Received: by 2002:a05:6e02:184b:b0:3cf:cd3c:bdfd with SMTP id
 e9e14a558f8ab-3d18c23caa4mr42155035ab.12.1739498337729; Thu, 13 Feb 2025
 17:58:57 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com> <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org> <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
 <mb61pseoiz1cq.fsf@kernel.org> <CAPhsuW7bo4efVYb8uPkQ1v9TE95_CQ6+G3q4kVyt-8g-3JD6Cw@mail.gmail.com>
 <mb61pr0411o57.fsf@kernel.org>
In-Reply-To: <mb61pr0411o57.fsf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 13 Feb 2025 17:58:46 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7fBkZaKQzLvBqsrxTvpJsfJfUBfco4i=-=C_on+GdpKg@mail.gmail.com>
X-Gm-Features: AWEUYZkpF5BMZbHzv8MzSiy1Gtx3WEyGX_vqexyd5VIB8KHI8VbVKVkNRfn3dfk
Message-ID: <CAPhsuW7fBkZaKQzLvBqsrxTvpJsfJfUBfco4i=-=C_on+GdpKg@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Indu Bhagat <indu.bhagat@oracle.com>, Weinan Liu <wnliu@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_175859_437971_963517A9 
X-CRM114-Status: GOOD (  23.83  )
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

On Thu, Feb 13, 2025 at 2:22=E2=80=AFPM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> Song Liu <song@kernel.org> writes:
>
> > On Thu, Feb 13, 2025 at 12:38=E2=80=AFAM Puranjay Mohan <puranjay@kerne=
l.org> wrote:
> > [...]
> >>
> >> P.S. - The livepatch doesn't have copy_process() but only copy_signal(=
),
> >> yours had copy_process() somehow.
> >
> > In my build, copy_signal is inlined to copy_process, unless I add noinl=
ine.
> > If I do add noinline, the issue will not reproduce.
> >
> > I tried more combinations. The issue doesn't reproduce if I either
> > 1) add noinline to copy_signal, so we are not patching the whole
> >    copy_process function;
> > or
> > 2) Switch compiler from gcc 14.2.1 to gcc 11.5.0.
> >
> > So it appears something in gcc 14.2.1 is causing live patch to fail
> > for copy_process().
>
> So, can you test your RFC set (without SFRAME) with gcc 14.2.1, so we
> can be sure that it is not a sframe problem?
>
> And about having the .sframe section in the livepatch module, I realised
> that this set doesn't include support for reading/using sframe data from
> any module(livepatches included), so the patch I added for generating
> .sframe in kpatch is irrelevant because it is a no-op with the current se=
tup.

Puranjay,

Could you please try the following?

1. Use gcc 11.4.1;
2. Add __always_inline to copy_signal();
3. Build kernel, and livepatch with the same test (we need to
    add __always_inline to the .patch file).
4. Run gdb livepatch-xxx.ko
5. In gdb do disassemble copy_process.

In my tests, both gcc-14.2.1 and gcc-11.5.0 generated a .ko file
that looks weird in gdb-disassemble. Specifically, readels shows
copy_process is about 5.5kB, but gdb-disassemble only shows
140 bytes or so for copy_process. clang doesn't seem to have
this problem.

I am really curious whether you have the same problem in your
setup.

Thanks,
Song

