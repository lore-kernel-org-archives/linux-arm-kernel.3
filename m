Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C503BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9waQFPkUXJUsfwE90tbtlsqX4D6x8wAx76HDuLM+Jt0=; b=TEaF1D2VB2hKKFOSRzvfad3qYa
	KtbaNArLKUMZ6nZXlGi4hJ/oDtaiNQsJpGHWAHBk9wdCHA+514Jv8bHljO0XZt7yrjp3rTJPOALhX
	H2BVY7Hf0+Y7LyXYYl+pyvE03Oq02acOl/o35sho1zCpJv1nZwPmJp4e7I3ny6GlrlRSR8w6RNmgm
	OIww99+9IvnAKKL7SskLQqRVOCP4xdtUzIKrGFzKOoNpNm/KzN4AG1U6gmQO4HEXVZolvBg6uQ7JV
	RPG7edzP6syBtBfR+d8XLr39cS0IPEfAElnR8W5UZlqx1qadVLHWElWiJ30J34cUC1IW4gfGhXGI9
	kaP/qHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tugXh-00000007QaA-3FRh;
	Tue, 18 Mar 2025 23:40:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tugW1-00000007QC1-0dLL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 23:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A177615B7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 23:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9979C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 23:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742341112;
	bh=0sQP/zy1cL6eeBuTAfDEdObSUHX4VZnFu6uuqYNdUys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lPqP93NexOCo/mjC1/g/fOcLQOVUb76koBw1Ka7hIA0/3JHOV890jSy/D3AZi1U/F
	 koO9S519NLnhqA2/IeE4tzt8xG4MX+Ix7Ic9dLC12U3S98BbN31+Z+sWOM0t0jKRto
	 foQ4UA3oht4OY55+u34YvsB5QA4BTvs4baT0zTruJ7em2WD2XgbNwO3VzFfle6ZuiB
	 z/MBe+sQArwn2XJrcMXN3xYl1yNF6OEmrPkpLrYKFcbJa+QftYA6sOAmXsw340PUHv
	 cPQTfNOkGmo3bSsPA/uqdB/N3j5BuLeisYuyQH7CQAhYeOUWJK9x2AeyGZ1TXZ2Ujo
	 C6oW3505FbwRA==
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3cf8e017abcso27666625ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 16:38:31 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxf0QNIFmdSuhof/T/Y4k4zlZl5LBQTbXnWH46KB2kUB/uPgnYN
	hAjcUTxAXjfGBKc1oKPQKBR9e13kI6Zy7nhRGCfCjmJ+X71JUiVWdrZnGvKQVJI8D74dccqxO6h
	2faFsH1AMzVxJ2WQ0qWTnIfTg9Sg=
X-Google-Smtp-Source: AGHT+IHS3zxaZCTk4uR7+SQt6Hjo61e5reTYmle1fxQ8GKm4FJb/GLNLIm9puqPCgCkzg8mO2W7H5OI9Xo6AifIFdRk=
X-Received: by 2002:a05:6e02:1d17:b0:3d3:ced4:db9b with SMTP id
 e9e14a558f8ab-3d586b22364mr6299555ab.5.1742341111256; Tue, 18 Mar 2025
 16:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250308012742.3208215-1-song@kernel.org> <20250308012742.3208215-2-song@kernel.org>
 <iajk7zuxy7fun7f7sv52ydhq7siqub3ec2lmguomdd3fhdw4s2@cwyfihj3gvpn>
 <CAPhsuW4A73c0AjpUwSRJ4o-4E6wpA9c5L0xWaxvHkJ3m+BLGVA@mail.gmail.com> <ox4c6flgu7mzkvyontbz2budummiu7e6icke7xl3msmuj2q2ii@xb5mvqcst2vg>
In-Reply-To: <ox4c6flgu7mzkvyontbz2budummiu7e6icke7xl3msmuj2q2ii@xb5mvqcst2vg>
From: Song Liu <song@kernel.org>
Date: Tue, 18 Mar 2025 16:38:20 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4BEDU=ZJavnofZtygGcQ9AJ5F2jJiuV6-nsnbZD+Gg-Q@mail.gmail.com>
X-Gm-Features: AQ5f1JrnxVeS0Z8vx1n1BCVHGIXjcVuS53wswCJJXs_3YpwJGWyuN8X5JtywC-A
Message-ID: <CAPhsuW4BEDU=ZJavnofZtygGcQ9AJ5F2jJiuV6-nsnbZD+Gg-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
	irogers@google.com, joe.lawrence@redhat.com, mark.rutland@arm.com, 
	peterz@infradead.org, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org, kernel-team@meta.com
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

On Tue, Mar 18, 2025 at 4:00=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Tue, Mar 18, 2025 at 01:14:40PM -0700, Song Liu wrote:
> > >
> > > See for example all the error conditions in the x86 version of
> > > arch_stack_walk_reliable() and in arch/x86/kernel/unwind_frame.c.
> >
> > I guess I missed this part:
> >
> > diff --git i/arch/arm64/kernel/stacktrace.c w/arch/arm64/kernel/stacktr=
ace.c
> > index 69d0567a0c38..3bb8e3ea4c4b 100644
> > --- i/arch/arm64/kernel/stacktrace.c
> > +++ w/arch/arm64/kernel/stacktrace.c
> > @@ -268,6 +268,8 @@ kunwind_next(struct kunwind_state *state)
> >         case KUNWIND_SOURCE_TASK:
> >         case KUNWIND_SOURCE_REGS_PC:
> >                 err =3D kunwind_next_frame_record(state);
> > +               if (err && err !=3D -ENOENT)
> > +                       state->common.unreliable =3D true;
> >                 break;
> >         default:
> >                 err =3D -EINVAL;
>
> I still see some issues:
>
>   - do_kunwind() -> kunwind_recover_return_address() can fail
>
>   - do_kunwind() -> consume_state() can fail

Great points! I have got the following:

diff --git i/arch/arm64/kernel/stacktrace.c w/arch/arm64/kernel/stacktrace.=
c
index 69d0567a0c38..852e4b322209 100644
--- i/arch/arm64/kernel/stacktrace.c
+++ w/arch/arm64/kernel/stacktrace.c
@@ -139,6 +139,7 @@ kunwind_recover_return_address(struct kunwind_state *st=
ate)
                                                (void *)state->common.fp);
                if (state->common.pc =3D=3D orig_pc) {
                        WARN_ON_ONCE(state->task =3D=3D current);
+                       state->common.unreliable =3D true;
                        return -EINVAL;
                }
                state->common.pc =3D orig_pc;
@@ -268,6 +269,8 @@ kunwind_next(struct kunwind_state *state)
        case KUNWIND_SOURCE_TASK:
        case KUNWIND_SOURCE_REGS_PC:
                err =3D kunwind_next_frame_record(state);
+               if (err && err !=3D -ENOENT)
+                       state->common.unreliable =3D true;
                break;
        default:
                err =3D -EINVAL;
@@ -404,12 +407,16 @@ static __always_inline bool
 arch_kunwind_reliable_consume_entry(const struct kunwind_state
*state, void *cookie)
 {
        struct kunwind_reliable_consume_entry_data *data =3D cookie;
+       bool ret;

        if (state->common.unreliable) {
                data->unreliable =3D true;
                return false;
        }
-       return data->consume_entry(data->cookie, state->common.pc);
+       ret =3D data->consume_entry(data->cookie, state->common.pc);
+       if (!ret)
+               data->unreliable =3D true;
+       return ret;
 }

 noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn
consume_entry,


>   - even in the -ENOENT case the unreliable bit has already been set
>     right before the call to kunwind_next_frame_record_meta().

For this one, do you mean we set state->common.unreliable, but
failed to propagate it to data.unreliable?

Thanks,
Song

