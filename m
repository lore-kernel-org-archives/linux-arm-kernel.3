Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147C3D78779
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 14:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKfc6WK70Ujcv4qyYOGzHtW3+I+/alF7xv4s8D+Od9A=; b=uQckWYmokh7sL9HOm8RlQklC2V
	aLKarh0AL7z4yE/yiE53yYjQDuOsb3gUHB/NG2g+3O1JBuzjgDp3HgNAHubKawx+HGF8laeEAA56c
	UeJbolvzqV2/zDHUvFbfleMTE15IHkTAmimtTPCbnjs71QlDqOfRm8Kqa2WZvIy3JAHWANET++6KQ
	N1KDS7mNSv8mnSGL9JMFfCeCxoGd5lqvPZmMhSbHIjo5yBu4zAPr4cqzr42e6EvJbW3kjPuUE9P2N
	33IFFaQESrjZhxstjCh93zxumka42ejGv5O+RrBTz8/9YVfCwJlvglqWaw8wYHGtwi2gM4vFBpmuV
	HpcUOYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8QD-00000000Ead-1Slc;
	Thu, 21 Nov 2024 14:44:41 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8PF-00000000EMW-3qnS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 14:43:43 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ea68cd5780so855366a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 06:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732200221; x=1732805021; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKfc6WK70Ujcv4qyYOGzHtW3+I+/alF7xv4s8D+Od9A=;
        b=MRJOPccxX28ZHIaEjqzMpfQwWoMRRILFtjXcjihLwClj0XePlG53jUmna0E5J6jiL9
         zfDqlfoXTldg1F/Hk5yLZgE/djrOL30U7z4PB6t5IIHeUrTPiTZ/HdEolLq/UVPqWGGE
         MMiy4nGUSwUH8v6qf7LN06t8imoX4GBqWvS6J/wnSqybDL9k5j+c23kKeKgqEIABiEHj
         iE4L3bf6ISJb/RpszsDfxhBKDUpHgMrqVTK89lziITwSqhLaLThJsH5HNllFsaEgpbZz
         QyVO2fYYg67ve7PeY944zCTpdP8x3/eT/RyOSMcwOd+oiMA9O+pMw8Zyhiy6h5yOiHg2
         rNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732200221; x=1732805021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKfc6WK70Ujcv4qyYOGzHtW3+I+/alF7xv4s8D+Od9A=;
        b=vA1JNc12wCPrCGD7uKyLPfn1cvu7W8VdrkfUAIVjvlEClR4B4xXpbU2LHXciRS9pEX
         DR//5vMEWhWlmUDq164mBD9peTsSzvEqOS/Q+2w2j/xSWILrdhp0EujPRRccOf4YaQ39
         edRVvlCX5NdINUK2bxSCHrMA6Apj+iSQVw7N3ijRjWEDuk4Wclh6ngdt9yM1eBalgm22
         pxFWGxy3y3eWA7I8OFugqe8jplaZyjL+w5WvnYm/DtSiT5MWItzF+vdL/qt97SI8xXln
         ypPGsBGU9su0kGOZcOhm+0oKaqNe1Wsg95O+3G9ZLuVGPAkS9YIM4iIHtjagyQ9PVXY1
         +smw==
X-Forwarded-Encrypted: i=1; AJvYcCULI3dRvHc/DYnD+r97FEiBQCwqT4KnqMPOHkyXQNfSAT9k/VqSkKuzqSrf9UlZ7TJhnUAZpySWLeJM73ZV3du8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl6v9qZyfTYXbUDmqntzrGioheB7E1zGh6Tak0qaOx5Y9XCF5X
	D//HumVbWRmkBwyFXq83QC16pA5hyxnJG2CQ6lTi3jNOZNf2+Ax6ZG3N0LHor1qv+HAJZEeGnoU
	3iOuFTi5Pg2Ll5b475e8ZbYLZthk=
X-Gm-Gg: ASbGncttaaNr5xC1+ubjU9iC/Ae8APNP8GC30yMWpDJM09deR6tmJqOfjZMv++/0bCY
	5mCPtosmyT/zaP0g5dqLgzzQqt/lfkDsdbsAh3w7P0qqpV58=
X-Google-Smtp-Source: AGHT+IHI1sNYh8TGwsXDad2aw7zBPtwV39Yiz8NDiu1l/E1ipvCw/26XGQRMk0sEM8UETmQ5TWxeG9UsU+oCg/GqQQg=
X-Received: by 2002:a17:90b:4a51:b0:2ea:525e:14a7 with SMTP id
 98e67ed59e1d1-2eaca7c675bmr8652406a91.29.1732200220751; Thu, 21 Nov 2024
 06:43:40 -0800 (PST)
MIME-Version: 1.0
References: <20241028010818.2487581-1-andrii@kernel.org> <CAEf4BzYPajbgyvcvm7z1EiPgkee1D1r=a8gaqxzd7k13gh9Uzw@mail.gmail.com>
 <CAEf4Bza=pwrZvd+3dz-a7eiAQMk9rwBDO1Kk_iwXSCM70CAARw@mail.gmail.com>
 <CAEf4BzbiZT5mZrQp3EDY688PzAnLV5DrqGQdx6Pzo6oGZ2KCXQ@mail.gmail.com>
 <20241120154323.GA24774@noisy.programming.kicks-ass.net> <Zz4IQaF9CCfjS28S@gmail.com>
 <CAEf4BzYR44BgfAjKAvppmyG_hjojBL7XZe75C0qBTPoE7WXzHg@mail.gmail.com> <Zz7-bXrFsC8zJwu3@gmail.com>
In-Reply-To: <Zz7-bXrFsC8zJwu3@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 21 Nov 2024 06:43:28 -0800
Message-ID: <CAEf4BzYV109EfUupJ_DaUrLSkng=pevdd+67Y=ifw-ZjsG2nJg@mail.gmail.com>
Subject: Re: [PATCH v4 tip/perf/core 0/4] uprobes,mm: speculative lockless
 VMA-to-uprobe lookup
To: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, oleg@redhat.com, rostedt@goodmis.org, 
	mhiramat@kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jolsa@kernel.org, paulmck@kernel.org, willy@infradead.org, surenb@google.com, 
	mjguzik@gmail.com, brauner@kernel.org, jannh@google.com, mhocko@kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>, vbabka@suse.cz, shakeel.butt@linux.dev, 
	hannes@cmpxchg.org, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david@redhat.com, arnd@arndb.de, richard.weiyang@gmail.com, 
	zhangpeng.00@bytedance.com, linmiaohe@huawei.com, viro@zeniv.linux.org.uk, 
	hca@linux.ibm.com, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kernel Team <kernel-team@meta.com>, 
	Liao Chang <liaochang1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_064341_959784_305AE83C 
X-CRM114-Status: GOOD (  41.35  )
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

cc'ing Liao for awareness (should have done it earlier, sorry)

On Thu, Nov 21, 2024 at 1:33=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:
>
> > Is this about Liao's siglock patch set? We are at v4 (!) already (see
> > [0]) with Oleg's Acked-by added.
>
> AFAICS you didn't Cc: me to -v3 and -v4 - and while I'll generally see
> those patches too, eventually, there's a delay.

Ok, I think we are now switching to my patch set here ([0]), because
Liao's v4 ([1]) does have mingo@redhat.com in CC. So, on Liao's
behalf, there wasn't really anything specific pointed out that would
explain a month's delay.

But let's switch to my patch set. Yes, my bad, I didn't CC you
directly, that wasn't in any way intentional, and that's my bad and I
will make sure to CC you on every patch for uprobes subsystem, even
though you are not explicitly listed in UPROBES section of MAINTAINERS
([2]), and Peter was the one who was handling all the uprobe-related
stuff since before this summer.

But let's please not randomly jump between discussing two separate
patch sets here, it's confusing.

>
> > > Andrii did get some other uprobes scalability work merged in v6.13:
> > >
> > >     - Switch to RCU Tasks Trace flavor for better performance
> > >     (Andrii Nakryiko)
> > >
> > >     - Massively increase uretprobe SMP scalability by
> > >       SRCU-protecting the uretprobe lifetime (Andrii Nakryiko)
> > >
> > > So we've certainly not been ignoring his patches, to the contrary
> > > ...
> >
> > Yes, and as I mentioned, this one is a) ready, reviewed, tested and
> > b) complements the other work you mention.
>
> Sorry, but patchsets that didn't even build a few weeks before the
> development window closed are generally pushed further down the
> backlog. Think of this as rate-limiting the risk of potentially broken
> code entering the kernel. You can avoid this problem by doing more
> testing, or by accepting that sometimes one more cycle is needed to get
> your patchsets merged.

Those build failures were happening in stub implementations, which
were used only on !CONFIG_PER_VMA_LOCK configuration, which I'm not
even sure if possible to get on x86-64. When I tried to reproduce this
locally I couldn't even get such configuration. Thankfully we have a
kernel test robot that would test multiple architectures and
configurations and it did catch it on i386 and loongarch64. And was
fixed quickly.

It doesn't seem fair or reasonable to penalize patch sets for *weeks*,
silently and without any notice just for this, IMO.

The patch set was very thoroughly tested, actually. Not just building,
but also running various unit tests (BPF selftests in particular). But
even more so, I built an entire uprobe stress-testing tool just to
test all my uprobe-related. I deployed custom kernels and ran these
stress tests on all uprobe patch sets and their revisions, over many
hours.

Sure, my main platform is x86-64, so that's where all the testing was
done. But you can't accuse me of negligence.

>
> > [...] It removes mmap_lock which limits scalability of the rest of
> > the work. Is there some rule that I get to land only two patch sets
> > in a single release?
>
> Your facetous question and the hostile tone of your emails is not
> appreciated.

I'm sticking to the facts in these emails. And when I get a response
in the style of "you got two patch sets in, why are you complaining",
that's not exactly friendly and fair. I put a lot of effort and time
not just into producing and testing all those patches, but also into
the logistics of it, coordinating with other people working within
uprobes subsystem.

And instead of accusations, I'd like to get an understanding of
expectations I can have in terms of handling patches. Being ignored
for many weeks is not OK. If you don't like something about what I do
or how, procedurally or technically, please call it out and I'll try
to fix whatever the problem might be. Silent treatment is not
productive.

But while on the topic. Those two patch sets you mentioned didn't go
in smoothly and quickly either. "Switch to RCU Tasks Trace flavor for
better performance" in particular should have gone in with the
original patch set one release earlier. But instead that patch was
dropped from the tree after applying it. Silently. I was not notified
at all (5 days that passed before I asked would be plenty of time to
mention this, IMO). It's good I noticed this, inquired with an email
reply (after making sure it's not some transient patch handling
issue), and only after that I got a reply that there was a build
failure I had to fix. You can see the thread at [4].

>
> Me pointing out that two other patchsets of yours got integrated simply
> demonstrates how your original complaint of an 'ignore list' is not
> just unprofessional on its face, but also demonstrably unfair:
>
> > > > > I'm not sure what's going on here, this patch set seems to be
> > > > > in some sort of "ignore list" on Peter's side with no
> > > > > indication on its destiny.

My "ignore list" complaint is specifically about this patch set, which
I explicitly stated above in the quote you provided. So yes, it's a
professional, and demonstrably fair statement, and I provided the
timeline and supporting links.

>
> Trying to pressure maintainers over a patchset that recently had build
> failures isn't going to get your patches applied faster.
>

I'm not asking to apply my patches blindly without critical review or
anything like that. I'm not expecting reviews or even just email
replies within a few days of posting. I *do* expect some sort of
reaction, though, and not after many weeks of inactivity and pinging
from my side, yes. And note, I got replies only after sending an email
straight to Linus.

I'm not pressuring anyone into anything. But as a maintainer myself, I
do think that being a maintainer is not just about having rights, it's
also about responsibilities.

Let's please stop with the excuses and instead discuss constructive solutio=
ns.

> Thanks,
>
>         Ingo

[0] https://lore.kernel.org/linux-trace-kernel/20241028010818.2487581-1-and=
rii@kernel.org/
[1] https://lore.kernel.org/linux-trace-kernel/20241022073141.3291245-1-lia=
ochang1@huawei.com/
[2] https://lore.kernel.org/all/172074397710.247544.17045299807723238107.st=
git@devnote2/
[3] https://github.com/libbpf/libbpf-bootstrap/commit/2f88cef90f9728ec8c7be=
e7bd48fdbcf197806c3
[4] https://lore.kernel.org/all/CAEf4BzZihPPiReE3anhrVOzjoZW5v4vFVouK_Arm8v=
JexCTT4g@mail.gmail.com/

