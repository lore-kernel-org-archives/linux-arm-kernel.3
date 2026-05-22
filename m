Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9BDCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7S7Wjm3IOoL9czL1XtCn3REIbVKzl9yPoLS/UOC9eY=; b=tim8lfIC+kJmKGFIFDCehKGmSn
	Vuz5kie9O4l71ozSGyUYz92LoC/xa+46SSjlTit6eVsy4hg+IeTW+LT980zDefInUKkxxwUfP7fRQ
	5WvHsre7zmYBVZlVb0lGU7NcWNmmrhvobdTdwy7fNUO0bKUzJ5JbSr7bgRZuLdUsXMuat5SxhXS5O
	UZF7GwOSitxTynGUsWd885Q1F9Hjlbmqu8y+Y2bs0iMrBCc8NgFut4y7PhMFiXWyZMA9N1Uj1IHTM
	qWHNuX7GaJPAlmZ3AkLk7NomqbR8g1pl21NLtWIE9Lry5GLiODQ9RzOc4p/PwHMv3hHox0mEe3uL2
	Yn8Rk82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUYM-0000000BfcR-15xK;
	Fri, 22 May 2026 18:24:58 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQUYJ-0000000BfbV-10EC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 18:24:56 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-63133de7abcso2484789137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 11:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779474294; cv=none;
        d=google.com; s=arc-20240605;
        b=AtppdRUYPAVws/0KmY5gQJk/Xa/IwenGOklw83dktN/6vk1sfGcz0buPXUEdGXhfuv
         d1TS5vs9DFZ8iCk+4PXfMJasyQbllnvnOZhFgRVQDAj3RHMw2OSY7qiSeG8DCO7cVQNY
         8wQUNSIplq5fgsvEiJtIy9QGxL+j00MbKbhB3iwVhiFcCoxD+plq71BLAf/Njp+/uzjC
         PesY98wI02wazUFGT/0ZDG9dqNqLw2LU7yuHRa+kyAL+0meb3a4Jhfq7UbFIqY6UD8Vl
         1Ofvnf0DrLkPD+l00C6uZY21LQicMvlEg/eedJyykEWCA58WgdxJLBTc5uQMPaausAz/
         nk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7S7Wjm3IOoL9czL1XtCn3REIbVKzl9yPoLS/UOC9eY=;
        fh=+epnj6XWmwF7KUqT8sKzXm4LDvw+fMq3FyRSHaBc6rs=;
        b=DLHvq4A1WMGWQ/0Ry62Itv6/EsNWSdv1kI3ljzRfAx5AU9nYHJVGG3lmv6EbHC4+hx
         CtsHcEpUfEdPD91JiUa0wusgQ8ICZyRruQ5H+g+WsbxnYHJZtK9v0gflD3hUA/mC4+3u
         ZQTU2+H/CeHiY31Eh1JaLECeEh758b3kJ38fGSmztGlPJX233U3hVrHy6GvZNUShGGYb
         Xwlux7JkooUaQb0zbXJigwZ6c9j4v+6IGmHNerTLH6j7XbX5fnkkhCLGfYDZM7YjDimi
         B7CZ6vgnsLAdOxAkXZS/XQZzwwV+jos30lrgPBPKGr1kL2Uok1hSwEwrK2gxz4U7pyn7
         LwYg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779474294; x=1780079094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7S7Wjm3IOoL9czL1XtCn3REIbVKzl9yPoLS/UOC9eY=;
        b=Zuqbjvbc4GjOKIvIuZSZgrHa8lFbIZ7o+3iko8f2od9TPfU9q+CZa48ys+d5FfBsWn
         sZKWUnuUVR22THxrgRVBjyO9XxCRPOI4XI1WnAzflup7QtuLpk/uZF2VP3JppQ/q0lCU
         meiQEDqLSekGS7aXjbKt1z7TII2ORGg2TBfb5s+zfyuXYUldQNCZMeYpJOAhnOVTH6gu
         CGUR2cWUSl5qUaP13ZGJoZal5oscaX/cX1S/XPo2SQKgKWk4wpxKLBDd7IBCpdTbt4Ig
         m9MM4TbKmuKxR02lZ2xVp6x61qi+fuU3dnqwcyPFCiJiubDUnZ8+HV2d0LOHFWOC/hA5
         Psvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779474294; x=1780079094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a7S7Wjm3IOoL9czL1XtCn3REIbVKzl9yPoLS/UOC9eY=;
        b=apgk17mypHI3M1KKR8N9KXiQtnfdNH58o1dYFcwI8LkDL66UeAJKNrKxvIyI2AP8qW
         LbtHLvsaIihvooec5j7pzBJsAzNRja52qud0Re/wc6wezox1dG3t7Zy7XOgvoUM8chNs
         bKxqNxEs/eMq9udWbfWph14rCxhZpV27jlVrFADHKoAbGSnm2LephcwU9YLkvYDdrZEZ
         xO7WAws1La5WV8+Tavu0ntMqCwMBKB0VvXMig8666tdZjFvWeNZ3aAVLEz35q8dpMOVF
         Vdm9jC9XkmUPh4F8zBYFQKcuxE0VYMvWLPzolaBJcf96Ntb7t1WVM13o6IElbs/NahHw
         jskQ==
X-Forwarded-Encrypted: i=1; AFNElJ+a2Xm3femVhCcj9DIIAHB7S5tRntAwse6+ljplMOhU7yN1dqe+mYUWz5jx5lAD6yJbRPR2bcg47fpuKeihYvKw@lists.infradead.org
X-Gm-Message-State: AOJu0YydlyMZUsG8eXeg/lrBb7LHl9zaGKLBpCG+nPHyIyslraypo7+A
	cC3KTH5kWQEZbMlAztdNT8LTXHQDUTj3NQfHsbcEeQ+MTPwqgK6TX1m8RkKB7HYko/uRKWmT03A
	c2y4elocDp8/MgeHL3c1AVglNWkgIq7MM88Q/JyBf
X-Gm-Gg: Acq92OGp6mDc1UTK1lcLd2rO1RK9FLNcNeus5/WVevRti3oCy4FPWMt4SLw5IV/nQo0
	W5B5jMlXjgSUay9Vrhx7LA5KJxCo5N3dXm1X+K+SxBuxG5lDbhCQX5l47LetCqJapEC5+HBKvUf
	nDX4PLJbV/acU1jbLVmBDCFDuuWibKC+BIugXDYLrSP9q/UxBp89J/8/l6lhsb6/cLqX9JgauvQ
	lmUMsOauOnWsose7/DXST5qRTzFoWb0sYVOSOVRUo0hvwfYMMS1GiPSsPFv8cSimZpQFWqy2AGc
	zRrnmAWQBegWLDn5ng==
X-Received: by 2002:a05:6102:5ccb:b0:634:5339:33bf with SMTP id
 ada2fe7eead31-67c7d977844mr2840802137.18.1779474293296; Fri, 22 May 2026
 11:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260417150827.1183376-1-jremus@linux.ibm.com>
 <20260417150827.1183376-4-jremus@linux.ibm.com> <CADBMgpwCuYCYPSOCvcm0-rXS=cvFZ-GsP5V1GJFEhghF5JMUDg@mail.gmail.com>
 <48871045-9ec8-4e62-a2c5-809e3070d671@linux.ibm.com>
In-Reply-To: <48871045-9ec8-4e62-a2c5-809e3070d671@linux.ibm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Fri, 22 May 2026 11:24:42 -0700
X-Gm-Features: AVHnY4IdV7C4avVCvo9u-U9RjZ4tbH6VJMmGmD1tX0nzwUmsJYVsmMSnKKpNE-8
Message-ID: <CADBMgpw9o0SJDhyFoPB_=6Uf+7sjaThXJ0Ayz6LYU6qQ_4F6oQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64/vdso: Enable SFrame generation in vDSO
To: Jens Remus <jremus@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steven Rostedt <rostedt@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Weinan Liu <wnliu@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_112455_300337_732A4314 
X-CRM114-Status: GOOD (  36.93  )
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

On Fri, May 22, 2026 at 1:51=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
> Hello Dylan,
>
> thank you for the feedback!
>
> On 5/22/2026 3:31 AM, Dylan Hatch wrote:
> > On Fri, Apr 17, 2026 at 8:08=E2=80=AFAM Jens Remus <jremus@linux.ibm.co=
m> wrote:
> >>
> >> This replicates Josh's x86 patch "x86/vdso: Enable sframe generation
> >> in VDSO" [1] for arm64.
> >>
> >> Enable .sframe generation in the vDSO library so kernel and user space
> >> can unwind through it.  Keep all function symbols in the vDSO .symtab
> >> for stack trace purposes.  This enables perf to lookup these function
> >> symbols in addition to those already exported in vDSO .dynsym.
> >>
> >> Starting with binutils 2.46 both GNU assembler and GNU linker
> >> exclusively support generating and merging .sframe in SFrame V3 format=
.
> >> For vDSO, only if supported by the assembler, generate .sframe, collec=
t
> >> it, mark it as KEEP, and generate a GNU_SFRAME program table entry.
> >> Otherwise explicitly discard any .sframe.
> >>
> >> [1]: x86/vdso: Enable sframe generation in VDSO,
> >>      https://lore.kernel.org/all/20260211141357.271402-7-jremus@linux.=
ibm.com/
> >>
> >> Signed-off-by: Jens Remus <jremus@linux.ibm.com>
> >> ---
> >>
> >> Notes (jremus):
> >>     @Dylan:  Adding -Wa,--gsframe-3 to the VDSO CC_FLAGS_ADD_VDSO (and
> >>     AS_FLAGS_ADD_VDSO) may clash with your patch [1] that adds likewis=
e
> >>     to the CC_FLAGS_REMOVE_VDSO.  Any idea how to resolve?
> >>
> >>     [1]: [PATCH v3 2/8] arm64, unwind: build kernel with sframe V3 inf=
o,
> >>          https://lore.kernel.org/all/20260406185000.1378082-3-dylanbha=
tch@google.com/
> >
> > In a kernel tree with both your patch and my [1] patch merged, I
> > believe we'd want to hold two invariants true:
> >
> > 1. If HAVE_UNWIND_KERNEL_SFRAME=3Dn, we must not build the kernel with =
.sframe.
> > 2. If AS_SFRAME3=3Dy, we must build vDSO with .sframe.
> >
> > Since HAVE_UNWIND_KERNEL_SFRAME=3Dy implies AS_SFRAME3=3Dy, I wonder if=
 we
> > should be able to drop CC_FLAGS_SFRAME from CC_FLAGS_REMOVE_VDSO and
> > move some definitions:
> >
> > diff --git a/Makefile b/Makefile
> > index 227fda16deb1..ef059bccb8c1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1147,12 +1147,15 @@ endif
> >  # Ensure compilers do not transform certain loops into calls to wcslen=
()
> >  KBUILD_CFLAGS +=3D -fno-builtin-wcslen
> >
> > +ifeq ($(CONFIG_AS_SFRAME3),y)
> > +CC_FLAGS_SFRAME :=3D -Wa,--gsframe-3
> > +export CC_FLAGS_SFRAME
> > +endif
> > +
> >  # build with sframe table
> >  ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
> > -CC_FLAGS_SFRAME :=3D -Wa,--gsframe-3
> >  KBUILD_CFLAGS  +=3D $(CC_FLAGS_SFRAME)
> >  KBUILD_AFLAGS  +=3D $(CC_FLAGS_SFRAME)
> > -export CC_FLAGS_SFRAME
> >  endif
> >
> >  # change __FILE__ to the relative path to the source directory
> > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/M=
akefile
> > index e90427a8d0f6..f03cac27857c 100644
> > --- a/arch/arm64/kernel/vdso/Makefile
> > +++ b/arch/arm64/kernel/vdso/Makefile
> > @@ -15,10 +15,6 @@ obj-vdso :=3D vgettimeofday.o note.o sigreturn.o
> > vgetrandom.o vgetrandom-chacha.o
> >  targets :=3D $(obj-vdso) vdso.so vdso.so.dbg
> >  obj-vdso :=3D $(addprefix $(obj)/, $(obj-vdso))
> >
> > -ifeq ($(CONFIG_AS_SFRAME3),y)
> > -  SFRAME_CFLAGS :=3D -Wa,--gsframe-3
> > -endif
> > -
> >  btildflags-$(CONFIG_ARM64_BTI_KERNEL) +=3D -z force-bti
> >
> >  # -Bsymbolic has been added for consistency with arm, the compat vDSO =
and
> > @@ -42,12 +38,12 @@ ccflags-y +=3D -DDISABLE_BRANCH_PROFILING -DBUILD_V=
DSO
> >  CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
> >                         $(RANDSTRUCT_CFLAGS) $(KSTACK_ERASE_CFLAGS) \
> >                         $(GCC_PLUGINS_CFLAGS) \
> > -                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRA=
ME) \
> > +                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
> >                         -Wmissing-prototypes -Wmissing-declarations
> >
> > -CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-table=
s
> > $(SFRAME_CFLAGS)
> > +CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-table=
s
> > $(CC_FLAGS_SFRAME)
> >
> > -AS_FLAGS_ADD_VDSO :=3D $(SFRAME_CFLAGS)
> > +AS_FLAGS_ADD_VDSO :=3D $(CC_FLAGS_SFRAME)
> >
> >  CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_REMOVE_VDSO)
> >  CFLAGS_REMOVE_vgetrandom.o =3D $(CC_FLAGS_REMOVE_VDSO)
> >
> >
> > If done this way I think we will add the -Wa,--gsframe-3 twice when
> > HAVE_UNWIND_KERNEL_SFRAME=3Dy, but maybe that's not a problem? This
> > could probably be folded into either this patch or mine [1], depending
> > which is applied first. I'm happy to rebase my unwind-for-kernel
> > patches onto this series, or we can do the other way around if that
> > works better.
> >
> > What do you think?
>
> I like that approach.  Go ahead.

Do you have an updated version you can send? I noticed some of these
patches don't apply cleanly on Steven's current sframe branch. If you
can't get to it before you leave then no worries, have a good vacation
:)

