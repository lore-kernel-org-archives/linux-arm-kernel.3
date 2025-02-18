Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70473C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRrjcZxc+54Ne+xv52EsQ+AaDzL2OFY0UPYTP80MshA=; b=K6U4S3XF6ie4L6Sf4PeuWeuXyy
	4VeufVEX+5iAKNMYQMSrpKsJQfPwxXf2ZCH2+XFa/qbd4BbIi2uEfxwwH7esGD/Mr5LOpkh443gOO
	Ap0kggtsrza+OKivo9FI+SmtPiFGZRzuvSLWzKbxAOAHH3fyNrawpRofq93BfMjbw/xc7bZZ0oSwn
	0bo4urqb4SUw+wb90hAatOQCnRUboTgb5frs4gxSyhbkx/DTd8R5UVqE8j0wVn5ktE4QmYo0TNEog
	IgNDhB28wUp6W2+sWt11uGFNB1k4reRV5X5ahKEPKnZoiyB90tJr9o/MsiNhFA8hw/5Q8e5fXwoxk
	ZQ2jUuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSEF-00000009K7v-2get;
	Tue, 18 Feb 2025 18:21:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSCl-00000009Jjm-36tR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:20:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13CF0A41493
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 18:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D94EC4CEEE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 18:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739902822;
	bh=i7uUtXNMjRRNoE/sjgLWfCiLhOArRyzd5/y7ZwlSfj4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KgGuMCdmekrrFynqBUDp1X5Q9NtJeSK02ZZNNDaJdCAbFbHAkoj0sPqbKLttEmOOp
	 s8XKsQbwT11tCFcQWPMKqvou9HudFfgK7xJR9zufjeiRnt+Xo2QdchF4tIhAD8uICm
	 0AV36YNFydtvK4lGWt4a0FB9qGc1YatXESm1W/aEbq28paLxFGcy6CKs9WCCiKpqVF
	 6+HuMeN3wsbpNaQ7RGsxZiDR/caGUnrTsiB95ZDqAF9J2wWbzHD4xXyqMTgKegMBt2
	 kh+6d5SeCfrgIBjvQlNHtwrvgH2w9jWPqY+mT1L3IPclBt19w1sdOQeX2IJrEPcdYD
	 y8Y44dkXsRARw==
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d19e40a891so13013495ab.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 10:20:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5ChpSCLhAMzvfKa9UVifOvKYTIj9wHJ18f2kx7DcrAcmbe51jwe945gGicvgRQoSNDkLfE16qQtSZm3dIAWDx@lists.infradead.org
X-Gm-Message-State: AOJu0YxpOL7XMAZlvzvCVtQoYx8PYZNLLCXKraWSJO472raPxteAqKUF
	GAI1KQFls3qFfPqz2Jq5gKYGDod2N6qNSvRpUEf9gTgTjo85GEgrA86SSqWJtQSwug/HIVTmkba
	YCJQ3oefNvv3/qpl6G3f+Zj1QKnc=
X-Google-Smtp-Source: AGHT+IG4FlnOX9Ql40omkJN+vWGOP3w/LrBrVI6Sr0U3JqnUmjReG7wWo0B7SUJhaMSh92+XkCiuQ91zPpqQH/rpcXM=
X-Received: by 2002:a05:6e02:2408:b0:3d0:4e2b:9bbb with SMTP id
 e9e14a558f8ab-3d2809580eemr158857095ab.21.1739902821943; Tue, 18 Feb 2025
 10:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20250213024507.mvjkalvyqsxihp54@jpoimboe> <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <mb61py0yaz3qq.fsf@kernel.org> <CAPhsuW7dV7UR3PsGVx_DLBH5-95DAmLMGTPuY0NfUwWLZMSTrQ@mail.gmail.com>
 <20250214080848.5xpi2y2omk4vxyoj@jpoimboe> <CAPhsuW6dxPtgqZaHrZEVhQXwm2+sETreZnGybZXVKYKfG9H6tg@mail.gmail.com>
 <20250214193400.j4hp45jlufihv5eh@jpoimboe> <CAPhsuW6q+yhn0pGQb0K+RhXHYDkjEgomZ2pu3P_MEeX+xNRe0g@mail.gmail.com>
 <20250214232342.5m3hveygqb2qafpp@jpoimboe> <CAPhsuW48h11yLuU7uHuPgYNCzwaxVKG+TaGOZeT7fR60+brTwA@mail.gmail.com>
 <20250218063702.e2qrpjk4ylhnk5s7@jpoimboe>
In-Reply-To: <20250218063702.e2qrpjk4ylhnk5s7@jpoimboe>
From: Song Liu <song@kernel.org>
Date: Tue, 18 Feb 2025 10:20:10 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5ZauBrSz11cvVtG5qQBfNmbcwPgMf=BScHtyZfHvK4FQ@mail.gmail.com>
X-Gm-Features: AWEUYZnvvDqTb1fovYfGDRE0ySlLJoOtPvngjhwXWpFfc6v9eHqvdMBDZzElWF0
Message-ID: <CAPhsuW5ZauBrSz11cvVtG5qQBfNmbcwPgMf=BScHtyZfHvK4FQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250218_102023_899796_4A9FBDA0 
X-CRM114-Status: GOOD (  17.76  )
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

On Mon, Feb 17, 2025 at 10:37=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.or=
g> wrote:
>
> On Mon, Feb 17, 2025 at 08:38:22PM -0800, Song Liu wrote:
> > On Fri, Feb 14, 2025 at 3:23=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel=
.org> wrote:
> > > Poking around the arm64 module code, arch/arm64/kernel/module-plts.c
> > > is looking at all the relocations in order to set up the PLT.  That a=
lso
> > > needs to be done for klp relas, or are your patches already doing tha=
t?
> >
> > I don't think either version (this set and my RFC) added logic for PLT.
> > There is some rela logic on the kpatch-build side. But I am not sure
> > whether it is sufficient.
>
> The klp relas looked ok.  I didn't see any signs of kpatch-build doing
> anything wrong.  AFAICT the problem is that module-plts.c creates PLT
> entries for regular relas but not klp relas.

In my tests (with printk) module-plts.c processes the .
klp.rela.vmlinux..text.copy_process section just like any other .rela.*
sections. Do we need special handling of the klp.rela.* sections?

Thanks,
Song

