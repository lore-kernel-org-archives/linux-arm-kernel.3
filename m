Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B51C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgsxSDVRpZGvjo2BS9oLL5G7oXXUw5NpzFkZtx0bmgI=; b=Wwu2iL8IYlw/TZcmRxob9MJBwu
	QafQyffLjBOMjspYxN7XIKNwFZZOkwVNUAsRU8U4eNhZ2D8wM25JYWsDs7VJJEzISaTldPZr9aWIb
	OBFeZzKsHE6bExQGxmaHxkIexE8rkT03LAu2KX8Cg2BmEWU6omMZAot+9N9S2qBbpy8HtGivsc4fI
	gKjIbjeAIgnP2L0P7pKmCRukapxDKXbaKngl1RaSUzXieAflDfrLJPDUXx5OnGTlNvPM0itxPJqEj
	uyTgly3zyHxf9cvH2AeR1Isz5THnVAfbYUuUt9S7641mja+1MrLB90EZhBg6kEaNZqaeeAq52N63Q
	VLZ+r45g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifCT-0000000CSEc-06dg;
	Thu, 13 Feb 2025 19:48:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tif6Z-0000000CRaP-0Otc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 19:42:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E5DCA5C57FB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 19:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E92C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 19:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739475754;
	bh=zhca3lHw3HGHPYdbqXqIVn9+d+GeoxPMDbYAYuwBREU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=F58sqAOPUzD1iqPKvsUuTHv9lybwmwlvsyOcWe6mQh+HPB9WgVvuJiWFy+FFtKADI
	 A8lbwZSdi6q/iSISINI0+HyOKB0zkUw85NUFFcOD2F2+QYHdTXPDjSlNz+e2sCUlpa
	 gBYbH3R1qumoytxHxsKkKADtqQqCf5jq3W6bWEFxgwnplaNFd1FLrEaEsRyxHOPqH4
	 PuYkJjF8y9e2t/AZ8qO3cTNaeT/S7NX7poN6uCTbo5xMSAQWy1/g/r5mKzYTn7vUPv
	 U3VLlwsGCyKISxGIsDghahpMGxukWq3Y+wXyKqVSFDcNo8OytXyL9YMpmYkzoIrBnE
	 gGfU2I0TyG9jA==
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3ce76b8d5bcso10400395ab.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 11:42:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCqw4nmseYo45HHNvwEe88hkfAkqnJxyeXQNvfZ2NQVhhv+r8hs782jarBOJ9F1xWR1pAbh75Q0rim9QTxWcE/@lists.infradead.org
X-Gm-Message-State: AOJu0YwoATSG5sUSYMk2jT30WpeVS9zrSLg+5EqKqkVaES3/+jQxXXag
	8lwGUozH3hUlpTw8lIVngmcxCrvWdsKdft2ZOpHgSbWCxFJloi9G8tPeB+FLWtjlOGjTHx0d26z
	cFBqFfnQQK7sINoeeHTQr+KJrnrw=
X-Google-Smtp-Source: AGHT+IHIbENSDq5CQfP65nDFBkOkSbpX1IICiXpHBzu8dGuTeZ21sZHkLP/NkVnz62zNuV6m+CoRpUcWrEyLrDSzEik=
X-Received: by 2002:a05:6e02:1a4d:b0:3d0:2477:83ec with SMTP id
 e9e14a558f8ab-3d17bfde009mr71824235ab.14.1739475753535; Thu, 13 Feb 2025
 11:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com> <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <00fa304d-84bf-4fca-9b9a-f3b56cd97424@oracle.com> <CAPhsuW4ct6W_4B0LFEjLePH1pAeNm4h8ePuQ3HcSoknXhQWN0w@mail.gmail.com>
 <mb61p1pw21f0v.fsf@kernel.org> <CAPhsuW5VCmuPLd8wwzBp_Divnu=uaZQcrRLsjsEOJ9GmA0TR5A@mail.gmail.com>
 <mb61pv7tez3ew.fsf@kernel.org>
In-Reply-To: <mb61pv7tez3ew.fsf@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 13 Feb 2025 11:42:22 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6pivqMnuudyqMy3XG4waiQHGt=LzvJfUZtJ2xbennN4A@mail.gmail.com>
X-Gm-Features: AWEUYZkZU3DHZIHWjT3TEVWQVY-TSsGUvKIT-xBdS_Hi3qdY8ySN3-kwjSp89jE
Message-ID: <CAPhsuW6pivqMnuudyqMy3XG4waiQHGt=LzvJfUZtJ2xbennN4A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250213_114235_243627_D73479A5 
X-CRM114-Status: GOOD (  35.64  )
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

On Wed, Feb 12, 2025 at 11:53=E2=80=AFPM Puranjay Mohan <puranjay@kernel.or=
g> wrote:
>
> Song Liu <song@kernel.org> writes:
>
> > On Wed, Feb 12, 2025 at 11:26=E2=80=AFPM Puranjay Mohan <puranjay@kerne=
l.org> wrote:
> >>
> >> Song Liu <song@kernel.org> writes:
> >>
> >> > On Wed, Feb 12, 2025 at 4:10=E2=80=AFPM Indu Bhagat <indu.bhagat@ora=
cle.com> wrote:
> >> >>
> >> >> On 2/12/25 3:32 PM, Song Liu wrote:
> >> >> > I run some tests with this set and my RFC set [1]. Most of
> >> >> > the test is done with kpatch-build. I tested both Puranjay's
> >> >> > version [3] and my version [4].
> >> >> >
> >> >> > For gcc 14.2.1, I have seen the following issue with this
> >> >> > test [2]. This happens with both upstream and 6.13.2.
> >> >> > The livepatch loaded fine, but the system spilled out the
> >> >> > following warning quickly.
> >> >> >
> >> >>
> >> >> In presence of the issue
> >> >> https://sourceware.org/bugzilla/show_bug.cgi?id=3D32666, I'd expect=
 bad
> >> >> data in SFrame section.  Which may be causing this symptom?
> >> >>
> >> >> To be clear, the issue affects loaded kernel modules.  I cannot tel=
l for
> >> >> certain - is there module loading involved in your test ?
> >> >
> >> > The KLP is a module, I guess that is also affected?
> >> >
> >> > During kpatch-build, we added some logic to drop the .sframe section=
.
> >> > I guess this is wrong, as we need the .sframe section when we apply
> >> > the next KLP. However, I don't think the issue is caused by missing
> >> > .sframe section.
> >>
> >> Hi, I did the same testing and did not get the Warning.
> >>
> >> I am testing on the 6.12.11 kernel with GCC 11.4.1.
> >
> > Could you please also try kernel 6.13.2?
> >
> >> Just to verify, the patch we are testing is:
> >
> > Yes, this is the test patch.
> >>
> >> --- >8 ---
> > [...]
> >> --- 8< ---
> >>
> >> P.S. - I have a downstream patch for create-diff-object to generate .s=
frame sections for
> >> livepatch module, will add it to the PR after some cleanups.
> >
> > Yeah, I think the .sframe section is still needed.
> >
>
> Hi Song,
>
> Can you try with this:
> https://github.com/puranjaymohan/kpatch/tree/arm64_wip
>
> This has the .sframe logic patch, but it looks as if I wrote that code
> in a 30 minute leetcode interview. I need to refactor it before I send
> it for review with the main PR.
>
> Can you test with this branch with your setup?

This branch has the same issue as the other branch.

Song

