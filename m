Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9470F9EDF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 15:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnN3kffexEQ3erD83gZV8XS71NssMlwPJVCJhAvXMVg=; b=Cf9hF343LqTTEK9lRXARR0RXBd
	vZ16RyHHf5hDHan5xpwrZxIA7ffe23ie9/vDxudTlx24GuXz3kkCbeVO+WmCI/8yEpreeP5/yo1e4
	83si3NzvfnkJ6iNFkBCnGAIWulaGB/JmJl8rW5/3OwhrP0nK4QEu5vXcVRL8KlfBGr+t/eVcf+Twe
	HTeKlkEZf+nobvrAqV5KC1qzNe1+5CwUy3QsY/Nq4zIwLPBjLItxbe4lBhewjunwvUMf63dij6J1G
	5WtIBAAbmv6jBpRgxSpzUsXLSj7sm20UBFK9IK7tauC53swyy9a0Hb+JRVX3wS5oxiNyz3txmMkID
	YmopTuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZIY-0000000APuT-2T7z;
	Wed, 22 Apr 2026 15:15:30 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZIP-0000000APte-45yQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 15:15:29 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-6108228a851so1902889137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 08:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776870919; cv=none;
        d=google.com; s=arc-20240605;
        b=lIOtFu0aw/wVyZdQCutX0zoM/vdSSOlTXSH/IooqO+8tlzS8lbzVHo2g3B/bstOBMb
         lPtkHhJAoWro8Pve/acAc3AynsqxZqrphz9dTKTPCQoL3qxscjtQHli9Di8zFxHesWDi
         yXZQzJFxHvB5mOm0gPHS2Rig3l0HcJGiQIluIaNXiVJZx4wCf2oDDraM+tksNMA0nk3d
         Tq9Wpk2dc9Rep7dwxzqPkncjHvZ73TECTebZZZWzK0cgv/Skyiiu1TYBDl4kau4sSpU4
         Tu7/4MGSRwMin5E0GTAMyqHwdFNhv7S8aI/PbYCkz8GKAXWf4VfPMcldO/Ff6A4VaN6r
         CNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MnN3kffexEQ3erD83gZV8XS71NssMlwPJVCJhAvXMVg=;
        fh=NUaPznilbB7zu9nB0DcLCkaasuYc5kE/fJBzETMFkAQ=;
        b=XIrIW1oM023QImdYQ2NuXr/Dk82CLDnsV//RrLH26H+yPdIftMP0DbgcyBvhdr9+kW
         SeZf0Yf60qtbqO4X23k6uF9fGDrlYvtzWfQsWYg/EBjz2xYEuCzLLbQt/3i4zaHvbi3L
         RtvcAIiQqN2V++lfRsmNYCdHVbvQL+hBXUJ/sxnJr4LOwznZa9QrcTRTXhuY0lG70AU5
         vqCYP5z3eIjq1M4DPZoK1l5+8h1Ismba23VkuRETxnw8qJedF9RDEo65a13T20L0fvew
         OXmCwidGtGT7QhhHSxCw/ZQtpKjqcQFdzT6BfElyEViucmLDAL0AeaKcXDZsGufuyVov
         FEkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776870919; x=1777475719; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnN3kffexEQ3erD83gZV8XS71NssMlwPJVCJhAvXMVg=;
        b=gsRzWI6LDGwPfQuxclVqUVp9Z80qw8Tmhxly1oHlvro7AkjRPeRDO4ViXd9F59pr4a
         NYHaEcgiG872eSE4fRKMaoFjvz2bE3UQAY0fAjCsRiASSE155nhk2R5sszqVI07dTn1b
         zmvX724OFbF+uGXgHloV+Hu1Rhx0wgR+0hTKM2KtDAD0NWwGmg8LZ0hKHCbWz/k8Qhva
         XQzNRXh/tEkwJISTgpHVZk+Uqvr9g/AR4JDJfNDi5fac/47F8cNaHl8rg/JLCtS2co70
         98tNnTH8YgKhKDJiE47woczmJ9CZDHVU7WRkdlo7+ZoriNsOSy+2qDJh+piASrGr2PnC
         16rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776870919; x=1777475719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnN3kffexEQ3erD83gZV8XS71NssMlwPJVCJhAvXMVg=;
        b=Fawokb2n8jY/VZXlVXCsAKGubcj5saXHTs57yE2em7yrdqU+FZAGEbuUI02zsnZupm
         K/+tXDccUZAnKARFqTVnafanNfY45n0q4709EQxrYDwV7tUM2knzSIYw/5JD1lODU32C
         zZ96N16b4J35Hho6MNDB1RXAorZc5ryVF7MbbZAYv4ROiOFjYnsLtOOUqEUHO5i2WVTu
         dhDxRY7jcwzmRjXVafOvUzJzcQlU8n7hdZEQjKlolpS7IL0ITNsu2I5KQtWqdRL4izbK
         VzDfW22ZEd5HbAAsOn4wBVb3C+Tp42ebU3vByFYtGgxmISMoFAr3++o9Ks8b0Kt9fFtx
         meVA==
X-Forwarded-Encrypted: i=1; AFNElJ8loqApNwwK4G5L2tdVd5PrDlNz4DHYtLwWnUZgL8wpVnH4bHjaybD2ZEnfBvvjxjqjrjJy/Jfmp/4d96uFjqKk@lists.infradead.org
X-Gm-Message-State: AOJu0YyRVTBl0e2E7gr30Ew1NQyehDkIhD3FHou21SyijOkHr/E/wWl7
	RFHgdcuchN9w6ZAQnuEL2ZIyOjFg2APz0Fvkr4E0tm10NjJu2n7mPlnwEQ/Yr0z+SWornCIw8BQ
	5oc49IxY0rioi9TBkREWR37vE6PFtK4td5tCoxiCX
X-Gm-Gg: AeBDievkQFybJbj8dZCJrd4qiCF9LKi6Bt9Wn74jzgTXo8lUKDp7Kedo1buQkDO8lw5
	k9Nf6RKu/jVvoSgQP9bLiPc2C7IL9s4uCDNLobHM4ogqiRz+Jp5nRmxkycEJGrDJsvw8txoUlfB
	L/K7DM4rynAo36wrnJWDTIdRYDomTDY+rQ6o9KmhPKq8dBHCk9g9d190TSzy1QzXNi0F7H0d/+O
	S78a+MMKt4hnktu0QVTlnzYHYrbW1RM6QEk8+LOaf5mlxtewYGIH1wx6vs1RL3a3MkB9Nu5F+Ko
	buKfLj4Qs2yAuTvTjAFiI+gRFhx+
X-Received: by 2002:a67:e111:0:b0:60c:fe65:7dbd with SMTP id
 ada2fe7eead31-616f4741f51mr10349005137.5.1776870918247; Wed, 22 Apr 2026
 08:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260421225200.1198447-1-dylanbhatch@google.com>
 <20260421225200.1198447-2-dylanbhatch@google.com> <38c9d976-6205-409c-8874-4c9757b25fd6@linux.ibm.com>
In-Reply-To: <38c9d976-6205-409c-8874-4c9757b25fd6@linux.ibm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Wed, 22 Apr 2026 08:15:07 -0700
X-Gm-Features: AQROBzCbPdFeYboP_oqMqLK5MAIPqTpd2YwkEakew5i23pus5XMPNY5ADgj5vpw
Message-ID: <CADBMgpy+HG1ksdZM=5pR1myyRzds6OZys_gpH6vJ=ZHOWb3mKQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] sframe: Allow kernelspace sframe sections
To: Jens Remus <jremus@linux.ibm.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>, 
	Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_081522_992994_E64747AD 
X-CRM114-Status: GOOD (  37.31  )
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

On Wed, Apr 22, 2026 at 7:08=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
> On 4/22/2026 12:51 AM, Dylan Hatch wrote:
> > Generalize the sframe lookup code to support kernelspace sections. This
> > is done by defining a SFRAME_LOOKUP option that can be activated
> > separate from HAVE_UNWIND_USER_SFRAME, as there will be other client to
> > this library than just userspace unwind.
> >
> > Sframe section location is now tracked in a separate sec_type field to
> > determine whether user-access functions are necessary to read the sfram=
e
> > data. Relevant type delarations are moved and renamed to reflect the
> > non-user sframe support.
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
>
> With return -EFAULT changed to goto label in DATA_COPY() and DATA_GET():
>
> Reviewed-by: Jens Remus <jremus@linux.ibm.com>
>
> > ---
> >  MAINTAINERS                                   |   2 +-
> >  arch/Kconfig                                  |   4 +
> >  .../{unwind_user_sframe.h =3D> unwind_sframe.h} |   6 +-
> >  arch/x86/include/asm/unwind_user.h            |  12 +-
> >  include/linux/sframe.h                        |  48 ++--
> >  include/linux/unwind_types.h                  |  46 +++
> >  include/linux/unwind_user_types.h             |  41 ---
> >  kernel/unwind/Makefile                        |   2 +-
> >  kernel/unwind/sframe.c                        | 270 ++++++++++++------
> >  kernel/unwind/user.c                          |  41 +--
> >  10 files changed, 293 insertions(+), 179 deletions(-)
> >  rename arch/x86/include/asm/{unwind_user_sframe.h =3D> unwind_sframe.h=
} (50%)
> >  create mode 100644 include/linux/unwind_types.h
>
> > diff --git a/include/linux/sframe.h b/include/linux/sframe.h
>
> > +enum sframe_sec_type {
> > +     SFRAME_KERNEL,
> > +     SFRAME_USER,
> > +};
>
> >  struct sframe_section {
> > -     struct rcu_head rcu;
> > +     struct rcu_head  rcu;
> >  #ifdef CONFIG_DYNAMIC_DEBUG
> > -     const char      *filename;
> > +     const char              *filename;
> >  #endif
> > -     unsigned long   sframe_start;
> > -     unsigned long   sframe_end;
> > -     unsigned long   text_start;
> > -     unsigned long   text_end;
> > -
> > -     unsigned long   fdes_start;
> > -     unsigned long   fres_start;
> > -     unsigned long   fres_end;
> > -     unsigned int    num_fdes;
> > -
> > -     signed char     ra_off;
> > -     signed char     fp_off;
> > +     enum sframe_sec_type    sec_type;
> > +     unsigned long           sframe_start;
> > +     unsigned long           sframe_end;
> > +     unsigned long           text_start;
> > +     unsigned long           text_end;
> > +
> > +     unsigned long           fdes_start;
> > +     unsigned long           fres_start;
> > +     unsigned long           fres_end;
> > +     unsigned int            num_fdes;
> > +
> > +     signed char             ra_off;
> > +     signed char             fp_off;
> >  };
>
> > diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
>
> > +#define DATA_COPY(sec, to, from, size, label)                        \
> > +({                                                           \
> > +     switch (sec->sec_type) {                                \
> > +     case SFRAME_KERNEL:                                     \
> > +             KERNEL_COPY(to, from, size, label);             \
> > +             break;                                          \
> > +     case SFRAME_USER:                                       \
> > +             UNSAFE_USER_COPY(to, from, size, label);        \
> > +             break;                                          \
>
> I wonder whether it would be worthwhile to come up with an approach
> where this would get evaluated at compile time instead at run time?
> Or is this overengineering?  Of course such improvement could be
> made later on, so no need to solve that now.

I had a similar thought when I was writing this patch, but I ended up
deciding to avoid premature optimization before getting feedback. I'd
definitely be interested in improving upon this later on.

>
> Options that came into my mind:
> A) Introduce and pass through a "bool user" parameter, whose value is
>    specified in sframe_find_user() and sframe_find_kernel().  Due to
>    inlining I would expect that to get any conditions based on that
>    to get evaluated at compile time.  See below.  Downside is the
>    ugly additional parameter.
>
> B) Introduce lightweight .c wrappers, e.g. sframe_kernel.c and
>    sframe_user.c, that define DATA_GET() and DATA_COPY() and include
>    sframe.c.  All HAVE_UNWIND_KERNEL_SFRAME code would be moved into
>    sframe_kernel.c and likewise all HAVE_UNWIND_USER_SFRAME code into
>    sframe_user.c.

(A) definitely sounds simpler to implement. For (B) it seems uncommon
for .c files to include one another. Style-wise, is this something
that is typically allowed (e.g. by checkpatch.pl)?

>
> > +     default:                                                \
> > +             return -EFAULT;                                 \
>
>                 goto label;                                     \
>
> Users of DATA_COPY() do expect the macro to branch to the label in case
> of an error and therefore do not evaluate any return value.  The
> wrapping then needs also be changed from "({ .. })" to
> "do { ... } while (0)".
>
> > +     }                                                       \
> > +})
> > +
> > +#define DATA_GET(sec, to, from, type, label)                 \
> > +({                                                           \
> > +     switch (sec->sec_type) {                                \
> > +     case SFRAME_KERNEL:                                     \
> > +             KERNEL_GET(to, from, type, label);              \
> > +             break;                                          \
> > +     case SFRAME_USER:                                       \
> > +             UNSAFE_USER_GET(to, from, type, label);         \
> > +             break;                                          \
> > +     default:                                                \
> > +             return -EFAULT;                                 \
>
> Likewise.
>
> > +     }                                                       \
> > +})
>
> > +#ifdef CONFIG_HAVE_UNWIND_USER_SFRAME
> > +
> > +int sframe_find_user(unsigned long ip, struct unwind_frame *frame)
> > +{
> > +     struct mm_struct *mm =3D current->mm;
> > +     struct sframe_section *sec;
> > +     int ret;
> > +
> > +     if (!mm)
> > +             return -EINVAL;
> > +
> > +     guard(srcu)(&sframe_srcu);
> > +
> > +     sec =3D mtree_load(&mm->sframe_mt, ip);
> > +     if (!sec)
> > +             return -EINVAL;
> > +
> > +     if (!user_read_access_begin((void __user *)sec->sframe_start,
> > +                                 sec->sframe_end - sec->sframe_start))
> > +             return -EFAULT;
> > +
> > +     ret =3D __sframe_find(sec, ip, frame);
>
> In sframe_find_user() sec->sec_type must be SFRAME_USER.  Likewise in
> sframe_find_kernel() it must be SFRAME_KERNEL.  So instead of
> introducing sec_type, we could add a parameter
> __sframe_find(..., bool user) and do:
>
>         ret =3D __sframe_find(sec, ip, frame, true);
>
> The downside is that this then requires to pass that flag through
> everywhere... (see below).
>
> > +
> > +     user_read_access_end();
> > +
> > +     if (ret =3D=3D -EFAULT) {
> > +             dbg_sec("removing bad .sframe section\n");
> > +             WARN_ON_ONCE(sframe_remove_section(sec->sframe_start));
> > +     }
> > +
> > +     return ret;
> > +}
> Regards,
> Jens
> --
> Jens Remus
> Linux on Z Development (D3303)
> jremus@de.ibm.com / jremus@linux.ibm.com
>
> IBM Deutschland Research & Development GmbH; Vorsitzender des Aufsichtsra=
ts: Wolfgang Wendt; Gesch=C3=A4ftsf=C3=BChrung: David Faller; Sitz der Gese=
llschaft: Ehningen; Registergericht: Amtsgericht Stuttgart, HRB 243294
> IBM Data Privacy Statement: https://www.ibm.com/privacy/
>

