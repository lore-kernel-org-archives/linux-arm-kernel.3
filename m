Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338EEC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 19:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJj+NdXkHIXBePnFJJA83VwGqHVwR2wqCNHnWezrofs=; b=u7CeTld18YL71EyEjM7tATeJD+
	nFj5vHnMi/gn2fXgvsO4rNjzyEYZg57YE3Bs3rde9ExRqto/3aQb46iPS+otw6YBSdnNeeCj1xMBr
	n/QYoDWhvc5657gw9Iio37gNGtGHYh8GJFn8InW971fFj/5dMC8OQrJXrhvpaTGW88tuCga1Kof1p
	5MkarfBtZCEZmfDV8/LyfEb8aTYN5Spei8fsq+gMdSA2WPiDfOlG2osMLy4tUdfZueiWfeKI5nwtg
	fXF7rsb72FQTcmUrX6YRC2DiV90cYNGxoV6rRKEuJO3lD01imnYfSCYE3qYpJgzqK0M+c0JSr9TQs
	5FVR8ARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuyuG-00000009wHj-3LEN;
	Wed, 19 Mar 2025 19:16:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuynC-00000009uwx-3eyf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 19:09:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA563682F6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 19:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9854AC4CEF2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742411369;
	bh=RBPLjNUl3VIgCUwL55Iwq9ZNU4VRiwiiacFlXXNL+W4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hrl4k9IiaQWTGXLYNzGsGpVTwiTprR2dpXOBSflWxjmlY5daYNpEp2lxZCnbKFk6+
	 ZzayEYLw74sTmo4+R9dFMWxnxK7hcPlTLxZwC9JwDAhXBj7owLhB2sHv6rLse3U7m1
	 UAnVW2Jfe3BqAsxAjVPhhcvoekd9AfL8TncAAchtMXRFMpFhylqEb/o0SW8b6C8ylR
	 XstlzHb0ZxXsLYJjR40rm+8mbLqKI+uL5wGu+NLuNUZmmJqvaMZp9lXXaWkhW4/qW6
	 LAkb6YXBVO8dY4KjlHP1NNkNpFdkJKCaJESNJvwqyhuefufYmSwXH1H79M5YyZlOgr
	 zhpTX1/krz0JQ==
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so9665ab.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 12:09:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJ3lmDvgWQdJiEp51zXa6ZcfnmuzjgbZhvsRC5unD+5NHp7NYtQhGJ8tkEYfr0IBBvcfuQFE7aQne9YSLnVzIg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7bEoK4yNHtrsaEdop5SKqr5K465UxPPbwcATEksK0vOhSwrSx
	KJu62KuodrlnQnRDfvWfKFm+iEDHJ0uSBVE4kJi6xmB+raX2WkNYWWL/rXe8eUayWYrh6olewjk
	LX5bwRhgL6h5yYEr1ZusJ6xmK7Og=
X-Google-Smtp-Source: AGHT+IFtVevrkFABOINXScOOgA9AGRqqqvUFyxFC0ELSxsLQH4NufJFrZAaqO6/fSKhNBd99jfQ6k4rNWb/XcuksXcE=
X-Received: by 2002:a05:6e02:330a:b0:3d4:4134:521a with SMTP id
 e9e14a558f8ab-3d586b4d53cmr48877015ab.12.1742411368864; Wed, 19 Mar 2025
 12:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <ifqn5txrr25ffky7lxtnjtb4b2gekq5jy4fmbiwtwfvofb4wgw@py7v7xpzaqxa> <20250319183757.404779-1-wnliu@google.com>
In-Reply-To: <20250319183757.404779-1-wnliu@google.com>
From: Song Liu <song@kernel.org>
Date: Wed, 19 Mar 2025 12:09:17 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7Zz9EaW3+gtp2Ut-8DVB4F=Dacr2btJ8gL0OA4T6bQzA@mail.gmail.com>
X-Gm-Features: AQ5f1JrvMc2DSMYvOGWV-yPMqfIA-IEZUbcWWmGIrNbqZw7eyyDT2c8uUkJ79Rc
Message-ID: <CAPhsuW7Zz9EaW3+gtp2Ut-8DVB4F=Dacr2btJ8gL0OA4T6bQzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
To: Weinan Liu <wnliu@google.com>
Cc: jpoimboe@kernel.org, indu.bhagat@oracle.com, irogers@google.com, 
	joe.lawrence@redhat.com, kernel-team@meta.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	mark.rutland@arm.com, peterz@infradead.org, puranjay@kernel.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 19, 2025 at 11:38=E2=80=AFAM Weinan Liu <wnliu@google.com> wrot=
e:
>
> On Tue, Mar 18, 2025 at 10:39=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.=
org> wrote:
> >
> > On Tue, Mar 18, 2025 at 08:58:52PM -0700, Song Liu wrote:
> > > On a closer look, I think we also need some logic in unwind_find_stac=
k()
> > > so that we can see when the unwinder hits the exception boundary. For
> > > this reason, we may still need unwind_state.unreliable. I will look i=
nto
> > > fixing this and send v2.
> >
> > Isn't that what FRAME_META_TYPE_PT_REGS is for?
> >
> > Maybe it can just tell kunwind_stack_walk() to set a bit in
> > kunwind_state which tells kunwind_next_frame_record_meta() to quit the
> > unwind early for the FRAME_META_TYPE_PT_REGS case.  That also has the
> > benefit of stopping the unwind as soon as the exception is encounterd.
> >
>
> After reviewing the code flow, it seems like we should treat all -EINVALI=
D
> cases or `FRAME_META_TYPE_PT_REGS` cases as unreliable unwinds.

Agreed with this: all -EINVALID cases or `FRAME_META_TYPE_PT_REGS`
should be unreliable, IIUC.

>
> Would a simplification like the one below work?
> Or we can return a special value for success cases in kunwind_next_regs_p=
c()
>
> ```
> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrac=
e.c
> index 69d0567a0c38..0eb69fa6161a 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
> @@ -296,7 +296,8 @@ do_kunwind(struct kunwind_state *state, kunwind_consu=
me_fn consume_state,
>                 if (!consume_state(state, cookie))
>                         break;
>                 ret =3D kunwind_next(state);
> -               if (ret < 0)
> +               if (ret < 0 || state->source =3D=3D KUNWIND_SOURCE_REGS_P=
C)
> +                       state->common.unreliable =3D true;

I am current leaning toward not using common.unreliable. It seems to add
unnecessary complexity here. But I may change my mind later on.

Thanks,
Song

>                         break;
>         }
>  }
> ```
>
> --
> Weinan

