Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1CAD6B6AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ohhnavrPr5+YUgso4iG8u5sjXey4qTkemT4mrkrez4=; b=s0CCItnW3Sz1onKd3rN//PmANi
	TIowS7Nsa7L2QB8wCnmRL4KyDDNtkkGuUfpDE/lwKXWJ8afIi/nC82QMJ9Pfq4uTBzshFQrOrC5+6
	g9nsUJgVDE4mu14D8jHqb8qntKFiQDGLZqFd3xOhBKO8iXzDC9+V232VvLTxv6kXBHo9YYeHHG3z8
	oc/cmXQ0F5AbdPypqAzTb0jlnzIbBgoI3iuNPqLOU5rWw0GQDiAMi563a0vS2vqGmBCRvX/VhZet1
	Oa/tdlgvqdRxwEFs6Li8VSDwsIK1/c5KKRmWHSwPcWap5FoxSFfbjmm34KStVbKyYpJk7aKjwKZq3
	8SBLHi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Bi2-0000000169i-3KUy;
	Wed, 30 Oct 2024 16:38:14 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BgO-000000015vD-2S8N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:36:33 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-460a8d1a9b7so338551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 09:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730306191; x=1730910991; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ohhnavrPr5+YUgso4iG8u5sjXey4qTkemT4mrkrez4=;
        b=Z+2qMKzt9eZlFiX6oohEf74uzSGlHFoCuRfytYlH3U1gzMurdFdb/DOqqBq+DC+Nnx
         iL9wKKXo9eBTfW5lKUcvVsypZHUpg9TM5+wH6KNx4EiF4gAOcK+Q/y8F3ADfymgtz6Gv
         Mkyg+6jop98LeGupOq6VI3opid0Pw92eJYou5WCRynY45EElWiHu17rMVmMB7ja/WOsp
         0FY5IHBnE0RB0nRkSyydEtyF6jG1vx8TQelinFLOeMzt8ZSwjCwIdllqLwDxfWAw1nOl
         bEvFvW7hb0Shcz2/VE+xzHYsRA2dtK/XNLZr/4iB7rSNXn2JREoSDfW7ra6fKHCTqrkS
         yfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730306191; x=1730910991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ohhnavrPr5+YUgso4iG8u5sjXey4qTkemT4mrkrez4=;
        b=EN9pGbSpjlNev/IMGLlKAuMeWl44Bb7gmYwkEeFkMRQwhdhQQxqLUGgQzygynfs/VJ
         zIptch04MfP/Zos/6LNCB9FFVJoM2t9tJy30nsXivJRARXLFazDU5C/ArrRrkpz5tJ3r
         n5GD3V6iT6kcF68Y+p6T3JE3L6pFfanSeR+0bCtOzg2hHrn+1hty8aDnI/BNRsRU0H2o
         Qkqg2PWgjvbDgKyM99z9blH8k/xzMkb0l0Ifud4RKCw4HaqHoxBY5OGgTv2eS8YqUy6Q
         mqg5wzKZqKILVBTsJv1N/yhoEwacq7yOhQy69I8+XByNDtVwBcu3tXOpmasQ3UpOWYII
         5sRA==
X-Forwarded-Encrypted: i=1; AJvYcCWiz/acTfHA75O9CQrPOALeeoWV9AGBjqLNzYmTkIOeZobDCsmXzK3kFQAY+qK39dWqpDAURha/6N55M8b+7jl5@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ/P5Vtz1wNGhrHWo4svpOu1WyG1MILzQUIuYDuUMn9znnv4qe
	QU8l6o995RKNShreHFpvts57u8FbO+wom2/m0FHXg0vCeePBZ7KbnIqpF9QKL+PnecR8H3Uo3Mx
	HfEQ47taWka6Hn8GZOMitkOvkZQrRwMBcvpaO
X-Gm-Gg: ASbGncvrMQFW03jVi8oWAQ8LkS4jOYoDJ+Ix990Bp1mZfapjhNxzMEWUyCAHLIAZ7dj
	XOuzovsNbZW+gAm3FXX+/+EFEmL5WELPHmCBtT4QL1a7xJ/SFRU0PPdh7ygHEpA==
X-Google-Smtp-Source: AGHT+IFBqNAhnZpINWYimOajsOUR5Hu7mWheBmruaCmzYI1pEkwMAvJVmKH+JkRRcQ8aMk7aGSnF9I1hvN2lZQ7/bOk=
X-Received: by 2002:a05:622a:cb:b0:461:3083:dbac with SMTP id
 d75a77b69052e-46166cf428fmr8624631cf.5.1730306190820; Wed, 30 Oct 2024
 09:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20241028234533.942542-1-rananta@google.com> <868qu63mdo.wl-maz@kernel.org>
 <CAJHc60x3sGdi2_mg_9uxecPYwZMBR11m1oEKPEH4RTYaF8eHdQ@mail.gmail.com>
 <865xpa3fwe.wl-maz@kernel.org> <CAJHc60xQNeTwSBuPhrKO_JBuikqZ7R=BM5rkWht3YwieVXwkHg@mail.gmail.com>
 <87iktat2y8.wl-maz@kernel.org>
In-Reply-To: <87iktat2y8.wl-maz@kernel.org>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Wed, 30 Oct 2024 09:36:19 -0700
Message-ID: <CAJHc60w7edpTSG2VA52m96BP6Eayg2jEc=9nt_b_kJFnOoQxfw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Get rid of userspace_irqchip_in_use
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, syzbot <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_093632_648289_E42854DD 
X-CRM114-Status: GOOD (  28.31  )
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

On Wed, Oct 30, 2024 at 1:22=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Wed, 30 Oct 2024 00:16:48 +0000,
> Raghavendra Rao Ananta <rananta@google.com> wrote:
> >
> > On Tue, Oct 29, 2024 at 11:47=E2=80=AFAM Marc Zyngier <maz@kernel.org> =
wrote:
> > >
> > > On Tue, 29 Oct 2024 17:06:09 +0000,
> > > Raghavendra Rao Ananta <rananta@google.com> wrote:
> > > >
> > > > On Tue, Oct 29, 2024 at 9:27=E2=80=AFAM Marc Zyngier <maz@kernel.or=
g> wrote:
> > > > >
> > > > > On Mon, 28 Oct 2024 23:45:33 +0000,
> > > > > Raghavendra Rao Ananta <rananta@google.com> wrote:
> > > > > >
> > > > > Did you have a chance to check whether this had any negative impa=
ct on
> > > > > actual workloads? Since the entry/exit code is a bit of a hot spo=
t,
> > > > > I'd like to make sure we're not penalising the common case (I onl=
y
> > > > > wrote this patch while waiting in an airport, and didn't test it =
at
> > > > > all).
> > > > >
> > > > I ran the kvm selftests, kvm-unit-tests and booted a linux guest to
> > > > test the change and noticed no failures.
> > > > Any specific test you want to try out?
> > >
> > > My question is not about failures (I didn't expect any), but
> > > specifically about *performance*, and whether checking the flag
> > > without a static key can lead to any performance drop on the hot path=
.
> > >
> > > Can you please run an exit-heavy workload (such as hackbench, for
> > > example), and report any significant delta you could measure?
> >
> > Oh, I see. I ran hackbench and micro-bench from kvm-unit-tests (which
> > also causes a lot of entry/exits), on Ampere Altra with kernel at
> > v6.12-rc1, and see no significant difference in perf.
>
> Thanks for running this stuff.
>
> > timer_10ms                          231040.0                          9=
02.0
> > timer_10ms                         234120.0                            =
914.0
>
> This seems to be the only case were we are adversely affected by this
> change.
Hmm, I'm not sure how much we want to trust this comparison. For
instance, I just ran micro-bench again a few more times and here are
the outcomes of timer_10ms for each try with the patch:

Tries                                             total ns
               avg ns
---------------------------------------------------------------------------=
--------
1_timer_10ms                             231840.0                          =
905.0
2_timer_10ms                             234560.0                          =
916.0
3_timer_10ms                             227440.0                          =
888.0
4_timer_10ms                             236640.0                          =
924.0
5_timer_10ms                             231200.0                          =
903.0

Here's a few on the baseline:

Tries                                             total ns
               avg ns
---------------------------------------------------------------------------=
--------
1_timer_10ms                             231080.0                          =
902.0
2_timer_10ms                             238040.0                          =
929.0
3_timer_10ms                             231680.0                          =
905.0
4_timer_10ms                             229280.0                          =
895.0
5_timer_10ms                             228520.0                          =
892.0


> In the grand scheme of thins, that's noise. But this gives us
> a clear line of sight for the removal of the in-kernel interrupts back
> to userspace.
Sorry, I didn't follow you completely on this part.

Thank you.
Raghavendra

