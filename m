Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D88C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 00:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcJSuZLlEiXXGQNoUX9py5aoN4tofONoEJKG7XFVq38=; b=lVHOTdXvyA29BYQ10CWZl0c5Yq
	9OISXHbEyDQBC4ZMj1u8YG452C+THdmL+XFQOKxe0CC4048Dzm7la4BxjQ19oQ0Ag5SAvfxbuxO87
	kOaFqPKQ+v+UOWUJ+HKKVE1PG9UMP94+a4LIoO4ubioafUhTFnhI6pQwfplRBvsTA93F8+2M0c/n3
	9+fvv7rclOe+mWKoUZYHdODA92k9VZ+lG8SZ9G0wFbuVeJqK+umaGq5ipyBALHFVCprKnUZ9pF8jc
	eMIfOEcKkLbh/15qtrLjRL4BiMeLnvEWtMdK0iejyQce1sZ7lBhoXpz5P/CUu3wzrM4BKIPiUc4kF
	vUXVCGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRSh-0000000EYCC-31WE;
	Thu, 29 May 2025 00:49:35 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKRQX-0000000EXjJ-4BfE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 00:47:23 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-86feb84877aso90832241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 17:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748479640; x=1749084440; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcJSuZLlEiXXGQNoUX9py5aoN4tofONoEJKG7XFVq38=;
        b=bY3lG3kWmJ5VvhG+Qpn8LggUzShy8bXTVNwVfILUwYcp70EnYF78uySmTNpi/wsPFW
         gIKHDcK1bpUQX+1HAMXsrKcJxbnKXZaE4tDXKtXgzM+1Cizq8aVPBlXZg9Ee2c6sZwkj
         C/glqHShYa5WqLmsdOnHdrUs2h0tK9hf0gP6aaGtWRgwZxhCZ8edgqjEKBRnbtmYevXh
         kZPP3afY1UtUyafjVwLAvgQyG2lC14/2yClKqbuC0QbLrAL/F99B3m4HJsxlHWc+gQzX
         nI8eyHzAY6vRb0r1MeRhC1VNblqJOAU9OIBXZ5oUY/bTeWDlyCLYZZvM4t45GhPAsIpk
         6L3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748479640; x=1749084440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcJSuZLlEiXXGQNoUX9py5aoN4tofONoEJKG7XFVq38=;
        b=PQCEqvnWkqnWdnMObSXL/+QKh8RLybhUZ3YDVwpBKnSb4ahbbWi04TR7UsNPgVcDSV
         LpzvPjsbCW8Sg2yYeT1tg+IdBVcFWYbFHblnEFGZ7t3/OGjtowz0gOJqq2H1PBkfai2h
         JLAyjWe6LzrDHIzqq9PoxXmTdlSxuA32PkRKIruQ5mdg5Pm6DlXylZ1PirnST80JCJfX
         X/PxmaAhOG/q3RgmSR63qgJusOJhZq84jyX8oNmBodsu+/YcGnbmGDPPseFNEgP4jRSe
         BiRCwX2GlAwk4xlb4ZM+qWH6/x524VZBUyaWaXdVPq1QJqQ/H/iQtG+5tXeQx2uBjm34
         krdg==
X-Forwarded-Encrypted: i=1; AJvYcCXPpDRFCgj5r8Wa7VQ0/gd8rTLvqjsBzeQvtXjlgGjscAoa2Tdlq3Na9KNvjcGaVBpMkNJ+VvhvgDVzG8+HO1OX@lists.infradead.org
X-Gm-Message-State: AOJu0YxNYrWVMy4rPV7eJ4tgDnsMyhREmi6QAc7fcm53KP9+39UIt3/G
	+8MuHfc0i/9uVXwwsos3ZtzWUIAedHLG6neseOzf/e5N6QXygDlPSZK5f0/irwrhUULTSQrws6B
	azvXiMMGTC2nn/vyfo61j4W1s2+6Sr0HKFZXWsckP
X-Gm-Gg: ASbGncugK/G7evvC9CWX6meAT4ap1joq+CVQqKZOglUtZjZicKWr3pX0S7xVjDpwHvh
	OPWHAgH9BhgchtyAaHtfcPKKQfV/pelCPEVg57EAqX8ZApgVUcWzCBo1dY5wnpeqOO9ezuIF8HC
	C015c5YseLBGq8K9CrNmTfreg1k30XSsxrpiVr5C1oMXk=
X-Google-Smtp-Source: AGHT+IEj9ymqfBXg6cFdB/Bj79VZBgVJSds2yTL3tVJMdz6WyDjPNGjPqLqwJ5g5XLlSN1N8famZpJNRS8BECNpItp4=
X-Received: by 2002:a05:6102:2c0f:b0:4e5:9628:9e39 with SMTP id
 ada2fe7eead31-4e59628a358mr6877728137.6.1748479639651; Wed, 28 May 2025
 17:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250522205205.3408764-1-dylanbhatch@google.com>
 <20250522205205.3408764-2-dylanbhatch@google.com> <aDXQYMcLle2E_b2d@pathway.suse.cz>
In-Reply-To: <aDXQYMcLle2E_b2d@pathway.suse.cz>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Wed, 28 May 2025 17:47:08 -0700
X-Gm-Features: AX0GCFst9YoNtP29t3lkS_hoyCgFJvPQXD1R7QrZslaZlG-dM0idmAI4vCWSU-M
Message-ID: <CADBMgpzO36dP=bXQAL46_WnWZJK0TmdO9ZR5z6OBdvtXsHn4_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] livepatch, x86/module: Generalize late module
 relocation locking.
To: Petr Mladek <pmladek@suse.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_174722_072837_C0C122AA 
X-CRM114-Status: GOOD (  44.93  )
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

Hi Petr,

On Tue, May 27, 2025 at 7:46=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> As this patch suggests, the "text_mutex" has been used to
> sychronize apply_relocate_add() only on x86_64 so far.
>
> s390x seems to rely on "s390_kernel_write_lock" taken by:
>
>   + apply_relocate_add()
>     + s390_kernel_write()
>       + __s390_kernel_write()
>
> And powerpc seems to rely on "pte" locking taken by
>
>   + apply_relocate_add()
>     + patch_instruction()
>       + patch_mem()
>         + __do_patch_mem_mm()
>           + get_locked_pte()
>

Reading through these implementations, I see that the serialization
happens only at the level of each individual write action. This is
equivalent to the patch_lock already used by aarch64_insn_copy() and
aarch64_insn_set(). I see now that this same serialization is achieved
by x86 using text_mutex, and that text_poke uses
'lockdep_assert_held(&text_mutex);' instead of grabbing the lock
itself, which is why only the x86 apply_relocate_add() currently takes
this mutex.

> I see two possibilities:
>
>   1. Either this change makes a false feeling that "text_mutex"
>      sychronizes apply_relocate_add() on all architextures.
>
>      This does not seems to be the case on, for example, s390
>      and powerpc.
>
>      =3D> The code is misleading and could lead to troubles.
>

My original intent with this change was to give the late relocations
on arm64 the correct synchronization with respect to other
text-patching code. From what you've shown above, it looks like the
[PATCH 2/2] should work fine without this change since the arm64
patching code already takes patch_lock.

>
>    2. Or it actually provides some sychronization on all
>       architectures, for example, against kprobe code.
>
>       In this case, it might actually fix an existing race.
>       It should be described in the commit message
>       and nominated for backporting to stable.
>

I hadn't really considered this. From what I can tell, kprobe is the
only non-arch-specific code that takes this mutex when touching kernel
text. Though my understanding of kprobe is very limited, I think there
could be a risk due to the late relocations for livepatch:

Suppose I apply a livepatch 'L' that touches some module 'M', but M
isn't currently loaded. Between check_kprobe_address_safe() and
__register_kprobe(), I don't see any check that would fail for a probe
'P' registered on a function inside L. So it seems to me that it's
possible for prepare_kprobe() on L to race with apply_relocate_add()
for L if P is registered while M is being loaded.

Perhaps more importantly, is it ever safe to kprobe an instruction
that hasn't yet received relocation? This would probably only be
possible in the case of late relocations for a livepatch, so maybe
this scenario was overlooked. I wonder if check_kprobe_address_safe()
can check for this case and cause the kprobe to fail, preventing the
above race condition from ever being possible.

In any case, synchronizing against kprobe wasn't the original intent
of this patch series, so in my opinion it makes sense to resend it as
a standalone patch (if it is to be resent at all).

>
> I am sorry if this has already been discussed. But I have been
> in Cc only for v3 and v4. And there is no changelog in
> the cover letter.
>

This patch was added to the series in v3, which is how you got added
to CC. Sorry about not adding a changelog, I'm still learning the best
practices for sending patches.

> > +
> > +     if (apply)
> > +             ret =3D apply_relocate_add(sechdrs, strtab, symndx, secnd=
x, pmod);
> > +     else
> > +             clear_relocate_add(sechdrs, strtab, symndx, secndx, pmod)=
;
> > +
> > +     if (!early)
> > +             mutex_unlock(&text_mutex);
> > +     return ret;
> >  }
>
> Best Regards,
> Petr

Thanks,
Dylan

On Tue, May 27, 2025 at 7:46=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrot=
e:
>
> On Thu 2025-05-22 20:52:04, Dylan Hatch wrote:
> > Late module relocations are an issue on any arch that supports
> > livepatch, so move the text_mutex locking to the livepatch core code.
> >
> > Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> > Acked-by: Song Liu <song@kernel.org>
> > ---
> >  arch/x86/kernel/module.c |  8 ++------
> >  kernel/livepatch/core.c  | 18 +++++++++++++-----
> >  2 files changed, 15 insertions(+), 11 deletions(-)
> >
> > --- a/arch/x86/kernel/module.c
> > +++ b/arch/x86/kernel/module.c
> > @@ -197,18 +197,14 @@ static int write_relocate_add(Elf64_Shdr *sechdrs=
,
> >       bool early =3D me->state =3D=3D MODULE_STATE_UNFORMED;
> >       void *(*write)(void *, const void *, size_t) =3D memcpy;
> >
> > -     if (!early) {
> > +     if (!early)
> >               write =3D text_poke;
> > -             mutex_lock(&text_mutex);
> > -     }
> >
> >       ret =3D __write_relocate_add(sechdrs, strtab, symindex, relsec, m=
e,
> >                                  write, apply);
> >
> > -     if (!early) {
> > +     if (!early)
> >               text_poke_sync();
> > -             mutex_unlock(&text_mutex);
> > -     }
> >
> >       return ret;
> >  }
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index 0e73fac55f8eb..9968441f73510 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> > @@ -319,12 +320,19 @@ static int klp_write_section_relocs(struct module=
 *pmod, Elf_Shdr *sechdrs,
> >                                         sec, sec_objname);
> >               if (ret)
> >                       return ret;
> > -
> > -             return apply_relocate_add(sechdrs, strtab, symndx, secndx=
, pmod);
> >       }
> >
> > -     clear_relocate_add(sechdrs, strtab, symndx, secndx, pmod);
> > -     return 0;
> > +     if (!early)
> > +             mutex_lock(&text_mutex);
>
> I understand why you do this but it opens some questions.
>
> As this patch suggests, the "text_mutex" has been used to
> sychronize apply_relocate_add() only on x86_64 so far.
>
> s390x seems to rely on "s390_kernel_write_lock" taken by:
>
>   + apply_relocate_add()
>     + s390_kernel_write()
>       + __s390_kernel_write()
>
> And powerpc seems to rely on "pte" locking taken by
>
>   + apply_relocate_add()
>     + patch_instruction()
>       + patch_mem()
>         + __do_patch_mem_mm()
>           + get_locked_pte()
>
> I see two possibilities:
>
>   1. Either this change makes a false feeling that "text_mutex"
>      sychronizes apply_relocate_add() on all architextures.
>
>      This does not seems to be the case on, for example, s390
>      and powerpc.
>
>      =3D> The code is misleading and could lead to troubles.
>
>
>    2. Or it actually provides some sychronization on all
>       architectures, for example, against kprobe code.
>
>       In this case, it might actually fix an existing race.
>       It should be described in the commit message
>       and nominated for backporting to stable.
>
>
> I am sorry if this has already been discussed. But I have been
> in Cc only for v3 and v4. And there is no changelog in
> the cover letter.
>
> > +
> > +     if (apply)
> > +             ret =3D apply_relocate_add(sechdrs, strtab, symndx, secnd=
x, pmod);
> > +     else
> > +             clear_relocate_add(sechdrs, strtab, symndx, secndx, pmod)=
;
> > +
> > +     if (!early)
> > +             mutex_unlock(&text_mutex);
> > +     return ret;
> >  }
>
> Best Regards,
> Petr

