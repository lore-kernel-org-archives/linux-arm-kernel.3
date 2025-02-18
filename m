Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D97FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 04:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vngQTep6fqZu5/AdyxR0LSN5ACH7A5JzogbUbGc209Y=; b=iTMC8zA5R126UmuLj7EPeuLBBX
	2iJn8kbgkZFd2eRjsSzZU65ri7ryII61QSnCYdygclAoONq9O9mgQrTahzi2+yVrZDXkd+wG2dGuG
	xLiYW5qqucNQoQUmSwih8kaKxszl7IwjAi2nTYEar44UlcJtUb0+fc0MEjlSX00po9os4tppblktF
	TjLyAepZ917P+DDwZEnScmuHD+oLgKwJxn6v8JYmQFPrIxAY7sAgZXX/ApiVNflqZzeljYX/0j6dz
	NjCpXSAwJFWKHX5SQWX1oao8Qv8X++OYCCd1UB8BQPLRhLvt4jG4cLgTX8fJJMfx16Kxw1KpGDDqk
	Ekv3UWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFOw-00000006luw-3cM6;
	Tue, 18 Feb 2025 04:40:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFNT-00000006lmd-2k2O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 04:38:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 75835A41D27
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 04:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055B8C4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 04:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739853514;
	bh=R5WL6l5L2lq8UY6+qmmUnEdnDls7MHkMUP7LdkFeDvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MDx/axSoG1prz9+kyo4nEpP9D55JWaxrotjmPAZnT8QuVLetWnvVjeI1lZDGZc7ZM
	 RlhIqVOcN4sqHRSTr4BZx8hHhdJcTGifYhhiaW5xx7t1PQrtyV7GsnrA3ymyteFo2J
	 Tv0cs6jLgJURZN6yiNHvdnLA15wSoZWbJB7qFQOpbIQlsERlvNUQWN0GDAYEwd5EPt
	 /s0IOpV7JmPdD8Ovn9vxN+CpNqSkwXUY2N0o/KzbbQSTJ3ukeiYL63p3aLHHFPC0Vj
	 7lh65v6iOOI4v5cwybsgjyqeIWktlyQWSXS1A2HaDwNU9Kxw9rtZ5Zls+jOSrvlq8Z
	 fmTcX7kPkF9pA==
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3cfc8772469so15900185ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 20:38:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0D9VSqWdsposy56kEK1pOWdUDeqK3x62f0oX+UNQoZYUQTkHRNwSly4x/O4i7Y1dutiFbtojzqZ8xYNclbWyO@lists.infradead.org
X-Gm-Message-State: AOJu0YxcnpePWR3AqMruYJObhpyeg6816pcP77g9K16gWdCnuyK9EF7A
	yUi61owY0xCFm+VezTTCED1RmbJdrvMKc2pKTVV+qDhsGLghbD84H/l7fP0QBE/tA8laM5MKUub
	8zptXcbVlnBzzZ3If6QhQMXp0tz0=
X-Google-Smtp-Source: AGHT+IHyz3t4mh/Ma9CY3+OXJVqMZPpzgMvEGuwkF3lUwUVVyhQca1X5UObepfUOFyqcM4yMYaf+CNnYaOFacvt5kYo=
X-Received: by 2002:a05:6e02:1c2d:b0:3d2:6768:c4fa with SMTP id
 e9e14a558f8ab-3d280981aa8mr106151405ab.21.1739853513240; Mon, 17 Feb 2025
 20:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20250212234946.yuskayyu4gx3ul7m@jpoimboe> <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe> <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <mb61py0yaz3qq.fsf@kernel.org> <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
 <20250214080848.5xpi2y2omk4vxyoj@jpoimboe> <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe> <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
 <20250214232342.5m3hveygqb2qafpp@jpoimboe>
In-Reply-To: <20250214232342.5m3hveygqb2qafpp@jpoimboe>
From: Song Liu <song@kernel.org>
Date: Mon, 17 Feb 2025 20:38:22 -0800
X-Gmail-Original-Message-ID: <CAPhsuW48h11yLuU7uHuPgYNCzwaxVKG+TaGOZeT7fR60+brTwA@mail.gmail.com>
X-Gm-Features: AWEUYZmWVnAjpZHf_IwjSwk5YFuj0m13-R4_dyEqp579CYDqISJuAOjL8_IVNKE
Message-ID: <CAPhsuW48h11yLuU7uHuPgYNCzwaxVKG+TaGOZeT7fR60+brTwA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250217_203835_824478_E417F20C 
X-CRM114-Status: GOOD (  20.30  )
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

On Fri, Feb 14, 2025 at 3:23=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Fri, Feb 14, 2025 at 02:04:17PM -0800, Song Liu wrote:
> > Hi Josh,
> >
> > On Fri, Feb 14, 2025 at 11:34=E2=80=AFAM Josh Poimboeuf <jpoimboe@kerne=
l.org> wrote:
> > >
> > > On Fri, Feb 14, 2025 at 09:51:41AM -0800, Song Liu wrote:
> > > > > Ignorant arm64 question: is the module's text further away from s=
lab
> > > > > memory than vmlinux text, thus requiring a different instruction =
(or
> > > > > GOT/TOC) to access memory further away in the address space?
> > > >
> > > > It appears to me the module text is very close to vmlinux text:
> > > >
> > > > vmlinux: ffff8000800b4b68 T copy_process
> > > > module: ffff80007b0f06d0 t copy_process [livepatch_always_inline_sp=
ecial_static]
> > >
> > > Hm... the only other thing I can think of is that the klp relas might=
 be
> > > wrong somewhere.  If you share patched.o and .ko files from the same
> > > build I could take a look.
> >
> > A tarball with these files is available here:
> >
> > https://drive.google.com/file/d/1ONB1tC9oK-Z5ShmSXneqWLTjJgC5Xq-C/view?=
usp=3Ddrive_link
>
> Poking around the arm64 module code, arch/arm64/kernel/module-plts.c
> is looking at all the relocations in order to set up the PLT.  That also
> needs to be done for klp relas, or are your patches already doing that?

I don't think either version (this set and my RFC) added logic for PLT.
There is some rela logic on the kpatch-build side. But I am not sure
whether it is sufficient.

Thanks,
Song

