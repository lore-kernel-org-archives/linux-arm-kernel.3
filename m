Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA79C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxdz0YLgNRAPMZuUe/+vKOP2Bxuas+m1TRI6FyIdGao=; b=W0CGzYUesO/GPiD7EQpZWT4S9L
	OS/fCTk0mnZmlA80mGFd+OdPgxmficEnI3HiOtGuxt08ElYvu9QJRW3KON8qWMaTqAQadNS1vmEsq
	j7dhh2cfv4VzBQy06/JaczPCnuxt2TJJXpYZicjEwmg2i+detK2/+AuhG6Y8aPyGUTgt3OzKZBqNv
	t/9f0HtyaoDu3j0UJ30xD87fQiPEk44K8tIlvJtrpP2oE8h95NY6rjnXFiG7CLACpYGhpUGCg7KOY
	x40GEvePJtVjYLieRBfToQoiTbXAWQ9pnHCN7CnAW6JeRz6wnhsySvcQwhCBI56eREkp0O4AuOZdL
	P/XQRxLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTol-0000000A7qO-2wnb;
	Thu, 13 Feb 2025 07:39:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTnK-0000000A7dN-1y2g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C23EA41EAC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 07:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B90DC4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 07:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739432277;
	bh=ac/bcOZbWbtdspcakhbcX4BAflMcQ4DC4KBda2XPhJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jpt3COTj5XIqRj8J7FxBblUc9kDMm4lJbL4O4GCl5+ohj4pqjv/UN731yoBqwchw7
	 JuIfqTeNDybpFBi9Ata79PsjgswsSXElAXlkfAVq+uRdXJcDMVZBmnmJYKqj1wFjt3
	 KcApdUI1oQWh5Mck2srm6DlSQXRMYRXSNkxJSk3TBHUd24cBxVOfoTa2Y+18hD5xu9
	 4V9OmKWKZLJSzV90XWw8tNnu74Fpd9WSUGiw68sHyh7m/GYz21QaDcDk3o+FW1FMBh
	 jtXacZmwOzWiQKBfMPi7saO1i8UH1ql5joM4OQlJ1HiFlTM5V82q9HpjVIVhumWov+
	 gFL8JA/VJyslg==
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3cfc8772469so1762455ab.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 23:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2FL2eHBUisTnmoe7psXh8C8Vo3WqTT1ZdhFQX9dtZLrM3sjjNdj0nbOp+S7GzLUhsZjtgRluH4dCocUPawR1u@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4zjg+CISvbznSlE84ldGuUO99eBD3zidOE6WZ/3XEuwyKIbmG
	8yHgJ4rlwn/SffjCEzovWa6kAz5MGMX0luvb7vEPuu4qUGlYlR5z0mBlYnxpIg/TGxRqdnuXRo9
	YNsGnjNezCvWvzs1gZlfSKIKb1ck=
X-Google-Smtp-Source: AGHT+IHsfPIAl5hWCRvJ1RKIS5xF1B4fT6O5wPSPAgwQ1k7iv1KYLuzpzwKngS9b2X7ne3vqVq5fZ0x4mohFd5XnnGk=
X-Received: by 2002:a05:6e02:12cf:b0:3d0:24c0:bd4d with SMTP id
 e9e14a558f8ab-3d17bff94f9mr64954095ab.18.1739432276328; Wed, 12 Feb 2025
 23:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com> <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org>
In-Reply-To: <mb61p1pw21f0v.fsf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 12 Feb 2025 23:37:45 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
X-Gm-Features: AWEUYZk1153uVA612siWVvTvz5oIJTx1LSxyHmzFbrXM3DQ11Kv4ihFu9Sq_1wM
Message-ID: <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250212_233758_624741_794E2E38 
X-CRM114-Status: GOOD (  30.67  )
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

On Wed, Feb 12, 2025 at 11:26=E2=80=AFPM Puranjay Mohan <puranjay@kernel.or=
g> wrote:
>
> Song Liu <song@kernel.org> writes:
>
> > On Wed, Feb 12, 2025 at 4:10=E2=80=AFPM Indu Bhagat <indu.bhagat@oracle=
.com> wrote:
> >>
> >> On 2/12/25 3:32 PM, Song Liu wrote:
> >> > I run some tests with this set and my RFC set [1]. Most of
> >> > the test is done with kpatch-build. I tested both Puranjay's
> >> > version [3] and my version [4].
> >> >
> >> > For gcc 14.2.1, I have seen the following issue with this
> >> > test [2]. This happens with both upstream and 6.13.2.
> >> > The livepatch loaded fine, but the system spilled out the
> >> > following warning quickly.
> >> >
> >>
> >> In presence of the issue
> >> https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666, I'd expect ba=
d
> >> data in SFrame section.  Which may be causing this symptom?
> >>
> >> To be clear, the issue affects loaded kernel modules.  I cannot tell f=
or
> >> certain - is there module loading involved in your test ?
> >
> > The KLP is a module, I guess that is also affected?
> >
> > During kpatch-build, we added some logic to drop the .sframe section.
> > I guess this is wrong, as we need the .sframe section when we apply
> > the next KLP. However, I don't think the issue is caused by missing
> > .sframe section.
>
> Hi, I did the same testing and did not get the Warning.
>
> I am testing on the 6.12.11 kernel with GCC 11.4.1.

Could you please also try kernel 6.13.2?

> Just to verify, the patch we are testing is:

Yes, this is the test patch.
>
> --- >8 ---
[...]
> --- 8< ---
>
> P.S. - I have a downstream patch for create-diff-object to generate .sfra=
me sections for
> livepatch module, will add it to the PR after some cleanups.

Yeah, I think the .sframe section is still needed.

Thanks,
Song

