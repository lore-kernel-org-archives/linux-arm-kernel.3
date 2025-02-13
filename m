Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B989DC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 23:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mDIj65M6G+Bdkr8aPo5/6cfAQ2CVlMcgej0DkLw4p3E=; b=b1F/BkpUzomERJDLQ2OvZVd/aw
	5r1lbpFlLSqtrkqb4e34F+KPDP1YaTwwFkWBLIw1Z7TTLFBefwmtcJH+zZYRZcmapEqC58gbKnKiv
	1QY9QAHybK4K48zJggBS1CifqDvT/8PY8MTXsI38m6JXmCIxVGx3P04QwW7FRAm+fm63r+VSaH0fX
	/4NUaryMTrHIR/uYQTcNoIlh3xLxxCuigPpueXHQAYIA0LgKLvtI1pxRUvOZiNiE7WxtZ1KoufPLF
	9YJuF0upO5P05XD5jbqb7/ZABYGUDFoYDe7cZnqSrOLh7d2Hp6/V7i4OUKR7B1icGRjD/6rNRdLyb
	hhaicOlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiikH-0000000Cy15-0A5N;
	Thu, 13 Feb 2025 23:35:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiiiq-0000000Cxmf-0Q3d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 23:34:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 626F3A42945
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A343C4CEE9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 23:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739489658;
	bh=N1peFMfD7vTD/DRcLqn0vJS+BR6mrfRHxFGLN+VrLow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MLvcnPJYwq2TuORYaw1/ML8+YCaWUgLgFCcZ7doHINjH4PxQSZgvT3c8s4ETClKPv
	 NAGTXBjLwXrrl2mPgwYjhtnWMUrLHmVqlEbjG0JTiFmJaGuXBfZZmTDZtrM6hIsDGr
	 vL28499mUY1S2ydy4iAKtiO0YGJYJJcHe8tGbZ82pgMy+iIJa0MRSSfNfPWCYIPn0M
	 Q4Oaul3kG5QInzMCdZ4u4OY8OYlAqs4DrEhf+PsiK0rslpAZ+ASavWBV6bl9Ouv3Z8
	 nPIB4UpyH/B9Rdc7aJIcNkryK/Tw49y8n/6UOH2X87M1iEi09uRH1a9fSyMjRzBz/Z
	 zomhVi+XKletg==
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-855418e04e7so47504739f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 15:34:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIIUQpQrcab6IQEurEvSd3L9Kq5/d8u/lBO8u56p3LPqLRISTDaKzmEXQftwVh6ZyQWoifxZzowrc8soVCjQoP@lists.infradead.org
X-Gm-Message-State: AOJu0YyUD/bGp5mxURoStaNYpAZOueWwBr51c40Z7JP6g2LJwLBLNh/y
	X3hF5ZCjRSTha3ZjH2h53WOawcahW8sAU8zhHiAsslDvAyJ7eUdX4Q1LVJ1gwWuGQPX0mQxK9a1
	/WNQGXtt+R7vuwkk5hAi3+oQNFF4=
X-Google-Smtp-Source: AGHT+IG1rQV0yKmTd4ign51tXVmFd/3I3khtaLBM2gfno63cBPOt8//ZZKniEPA4RSgy4RfCpeSumDMFlaJlHY9wbAw=
X-Received: by 2002:a05:6e02:1a61:b0:3a7:8720:9de5 with SMTP id
 e9e14a558f8ab-3d17bdff43fmr80793525ab.1.1739489657616; Thu, 13 Feb 2025
 15:34:17 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com> <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org> <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
 <mb61pseoiz1cq.fsf@kernel.org> <CAPhsuW7bo4efVYb8uPkQ1v9TE95_CQ6+G3q4kVyt-8g-3JD6Cw@mail.gmail.com>
 <mb61pr0411o57.fsf@kernel.org>
In-Reply-To: <mb61pr0411o57.fsf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 13 Feb 2025 15:34:06 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6C77if9-_j2sywHE4ZT3JUOAoDNiepiJPrRWCf8OAojA@mail.gmail.com>
X-Gm-Features: AWEUYZnvF8YgL5a3ClR7_9YRs3GII1KO5ROPdxeyhHjRsChKmRJielirplxSTbQ
Message-ID: <CAPhsuW6C77if9-_j2sywHE4ZT3JUOAoDNiepiJPrRWCf8OAojA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250213_153420_267410_CDDFC9D2 
X-CRM114-Status: GOOD (  22.69  )
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

My RFC set is the same. No issue with gcc 11.5.0; but hits the same
WARNING with gcc 14.2.1. My previous tests are all with clang. I didn't
see a similar issue there.

> And about having the .sframe section in the livepatch module, I realised
> that this set doesn't include support for reading/using sframe data from
> any module(livepatches included), so the patch I added for generating
> .sframe in kpatch is irrelevant because it is a no-op with the current se=
tup.

Agreed, this issue should be irrelevant to the .sframe section in the .ko f=
ile.

Thanks,
Song

