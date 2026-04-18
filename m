Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27899F99C6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Apr 2026 00:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jG0p0yq8quIKGtqOiuFn9k0lGMjmC+bQB/Uy9ctLaug=; b=NkxPTKOSTr2GoCH0F8XKOqB8ei
	1JSsFL58Jz7NCELlOULW8YBQeFok6S0EjwvI56v48gncGS76H4eAxk/+rHE56L6Mf/MGUx39bYEJ5
	/xDDWFxyOiWMti8m6no/pLjpNBLSel3YNMHT6V21Fv8H0q/eeCpkhAW7nfyujGY4+PTxcKaMc5KYW
	Pk5TeoVEvt7oA9NxNsTCbWewMDxypSDNmE4y3aF5aLIeEEZ9J4KCmhjc6yH0KytGg9EjR6WutbYva
	C47tErgKQ/og2grrg4Y3QlSdiLDz57HImCHAlPMaKIEoDTObkTwbJIF3fDzQHAGh6bKxMR9H9yvKF
	Xw22MInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtQo-00000004aOj-2ylH;
	Sat, 18 Apr 2026 00:21:06 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDtQk-00000004aLn-1jid
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Apr 2026 00:21:04 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-94aaa5d3bfcso739240241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 17:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776471660; cv=none;
        d=google.com; s=arc-20240605;
        b=ZsCzQX/ABqzu9YRXB2V8RvWUQdS/PPUxm/abWXVJCbUGTpHQrrx/vj+eZPr/mdSk4l
         zOcvhIjHbxAfqsgGvwhvndPqPFfscEnxjzPOPLec8FdyYjLkgjk0sIimhfwX1piid4HM
         n0zhKTDaBIduatOrnOJyqZXMRYr7zXpfdFjmDS+/vSPDgb5vT19rZZ8ly2D155/P+71c
         AkeMHtManpU1TYaUO+JTM7Rv72yLxGpb7B5jlB7UjG0keQMqkeL2A6xEZX0YNtf5r2I6
         A3GzMLFENrjYJUEF4ujcr1Eb95SxEmbNuboHsHLhYZTfeBsiWLNhQNbpQRIEMTaR1s+M
         mHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jG0p0yq8quIKGtqOiuFn9k0lGMjmC+bQB/Uy9ctLaug=;
        fh=QR1+zLZYlUO65rJdZ28Lf//imdWXo4/fGPJZuuCk8jA=;
        b=MWfl60q5UZwwBnmYGavtSfRhe5tSW+Q2Bf+qctAPNiC98L1GVSqcYjJWRKqMnxN0nD
         EYBM1jkM5pOqMuqQrKVXjuR2k6KFFCui+xVDoNJYH3l3kkoV80l9In9TD57Cceu7syKt
         7sdzRpBRDu+ygqwTbv97+/hCrEGAfboLDyOLlQT/ORTVF00SlUWEe7lkO1XhuILkZdPo
         x/OGYgnFq7WloT8axXax3vPl+5gg535ST9T4ehfChXZs0mqdpScBBimu+6kccEfCgred
         SDm7Eag4mYXAh2kIhUDvNW0X1Iga10SfQgHExtTvM/fQgvZFFlA/vDqrTq9ae9dvnZwb
         RkDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776471660; x=1777076460; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG0p0yq8quIKGtqOiuFn9k0lGMjmC+bQB/Uy9ctLaug=;
        b=PakPlAM6YcPE2rravxM0HmbV88Q+lOJauz8mar8DuVu7wr6QaePEngqb25lyaLn/M6
         YQLj/MFct2YK17yeaJYM2OtN+OmeYlb7xuq/60T/0beP/WmtGq0GyW/0GzoHhM6CE2YP
         MIzhWIYm7/CHIAPJ2BeCquG+WXKfnJYZc1cs39EAtS+n3nnGT1ZTVaJwS2hfzFbzLwkd
         r18tWrJiIKCEWJ8h/RmaYQJHb7WaFxi2cBo8fD0y5ijPktbipahkGjoZW6GDVQ2I4mnn
         f5LChyHABu1WXsVEQUWLagLYXkuBqbpVzxO56lOSBihR/1BAy9/1ZOtqjBLxXZQaTNzg
         B0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776471660; x=1777076460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jG0p0yq8quIKGtqOiuFn9k0lGMjmC+bQB/Uy9ctLaug=;
        b=fd42lRbthiuEcMjNh9SGzrZpCHJa3lgH7Adqw+LWe6P1k0Wx9eyV6MpYgzd8zsv4jm
         siVHK9fmxDAjaR6HwTiEBV1ibO+2uSl0k9jQ90LAiNSbIUy36PdCVqmxtrybC+K5cwgd
         jpRf4zAPBP8/QYnC0p/+0pFpLwrS3+Qvt0oDgJ80ih2+AaEM+GWwUJZP6lwUbsYK0jtc
         0SqGjMxuP39zY091rQXSowm+YfQYm9MHaOeNOjDIVY6hZ3BLywK7/QI4Z41jla2CecQ4
         CGSuf3cEmR8f2sPS3Q/xdQFTzYOCgZCoSJxLY9qgY/Dc28iuSC/anphvBjZ68tfhAmCU
         iiDw==
X-Forwarded-Encrypted: i=1; AFNElJ9Mj3JDblQK3HJ2777/xFk3/enLlJewTd/u6sN4I+VzWq1PMLkg5Hh4EkTW0TYUoSn1se+w9/khhf8ILclm/IFN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc2EDYpS47lpAKtJO/QS+BGZxeU1BNmARgIUkSVxcoxyFRfgDS
	DoBEObywy2Xc/lsUINhPArJaKxAjS97Fz1taeY6RXfE2OIdCA96wSLiEf2TQJhaIUhHQ2tOSkTJ
	Mf6+YojR7CIloi0U8dZqwgFZX0fSzteO2Zsokx49W
X-Gm-Gg: AeBDievMy5iW54CMFMqI34qCeWMAG7L2ory8dOBDlv1t5OhHjjZMuJOT/W4DO9FfeAI
	hrRpgxvjsz4suy7pWGC7YZR2JTU5R35zxFz5iXF95CyCKQBFPWLX4Ro7/w14eu/LP/vCr3UVYKy
	Pbvog5MZyBXnekN4FzAADQ8q+7eb8FLUtCm35ou5goYQy3zWb6ld83Zxx9GRUlpMhzWjK7NejsP
	HfV7waRss4X95eKqrKNpSi8w0227D0cGJKDuVEgP/1HYwcrRzx8gOUF/E8pkOr6lOWZN6Uyj0Wf
	sEA0347Ry7BhB/+QpE3X17Lsb/sHJJk5YrPCzY0=
X-Received: by 2002:a05:6102:604b:b0:605:1070:231d with SMTP id
 ada2fe7eead31-616f69cf882mr2387773137.17.1776471659198; Fri, 17 Apr 2026
 17:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-3-dylanbhatch@google.com> <cc7f741c-41a0-4620-b5d5-3428aaa7648f@linux.ibm.com>
In-Reply-To: <cc7f741c-41a0-4620-b5d5-3428aaa7648f@linux.ibm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Fri, 17 Apr 2026 17:20:48 -0700
X-Gm-Features: AQROBzDJREPHzvzsRYQqEASREPSDUbQGxoXWvTmDMaigTLPH3oGDcoCo6QgsWe0
Message-ID: <CADBMgpyFd=id0M0Q+nZouBt9Ph6T=0PfP9xWuKOFWoLQd7zvng@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] arm64, unwind: build kernel with sframe V3 info
To: Jens Remus <jremus@linux.ibm.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_172102_514076_C134CBBB 
X-CRM114-Status: GOOD (  37.69  )
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

On Tue, Apr 14, 2026 at 5:43=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
>
> Good catch!  Should we rather add the following in the series you are
> basing on, as there are already arch-specific unwind_user.h and
> unwind_user_sframe.h?
>
> F:      arch/*/include/asm/unwind*.h

Thanks for the suggestion, this works for me.

>
> On the other hand I wonder whether the arch-specific headers should
> remain maintained by the respective arch maintainers?  How is that
> handled in general?

I had the same question. My scan of MAINTAINERS shows both patterns
are present, so I defer to those who know more about this kind of
maintainership configuration.

>
> > diff --git a/arch/Kconfig b/arch/Kconfig
>
> > @@ -520,6 +520,13 @@ config SFRAME_VALIDATION
> >
> >         If unsure, say N.
> >
> > +config ARCH_SUPPORTS_SFRAME_UNWINDER
> > +     bool
> > +     help
> > +       An architecture can select this if it  enables the sframe (Simp=
le
> > +       Frame) unwinder for unwinding kernel stack traces. It uses unwi=
nd
> > +       table that is directly generatedby toolchain based on DWARF CFI=
 information.
>
> Nit: s/sframe/SFrame/
>
> > +
> >  config HAVE_PERF_REGS
> >       bool
> >       help
>
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>
> > @@ -112,6 +112,7 @@ config ARM64
> >       select ARCH_SUPPORTS_SCHED_SMT
> >       select ARCH_SUPPORTS_SCHED_CLUSTER
> >       select ARCH_SUPPORTS_SCHED_MC
> > +     select ARCH_SUPPORTS_SFRAME_UNWINDER
> >       select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> >       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> >       select ARCH_WANT_DEFAULT_BPF_JIT
>
> > diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
>
> > @@ -20,4 +20,17 @@ config ARM64_RELOC_TEST
> >       depends on m
> >       tristate "Relocation testing module"
> >
> > +config SFRAME_UNWINDER
>
> Why do you introduce this for arm64 (and debug) only?  If s390 were to
> add support (as replacement for s390 backchain), this would have to be
> moved or duplicated.  It would not suffice to enable
> ARCH_SUPPORTS_SFRAME_UNWINDER to also enable SFRAME_UNWINDER.

Makes sense, I'll look into introducing this as arch-generic.

>
> As mentioned in my feedback on the previous patch in this series:
> Would it make sense to align the naming to the existing
> HAVE_UNWIND_USER_SFRAME, for instance:
>
>   HAVE_UNWIND_KERNEL_SFRAME
>
> > +     bool "Sframe unwinder"
> > +     depends on AS_SFRAME3
> > +     depends on 64BIT
> > +     depends on ARCH_SUPPORTS_SFRAME_UNWINDER
> > +     select SFRAME_LOOKUP
> > +     help
> > +       This option enables the sframe (Simple Frame) unwinder for unwi=
nding
> > +       kernel stack traces. It uses unwind table that is directly gene=
rated
> > +       by toolchain based on DWARF CFI information. In, practice this =
can
> > +       provide more reliable stacktrace results than unwinding with fr=
ame
> > +       pointers alone.
>
> Nit: s/sframe/SFrame/
>
> > +
> >  source "drivers/hwtracing/coresight/Kconfig"
>
> You are introducing two new Kconfig options (SFRAME_UNWINDER and
> ARCH_SUPPORTS_SFRAME_UNWINDER).  I wonder whether they could somehow be
> combined into a single new option.  Although I am not sure how an option
> can be both selectable and depending at the same time, so that the ARM64
> config could select it, but it would also depend on the above.

I don't think this is recommended, since the behavior of 'select'
appears to override a 'depends' requirement.

From Documentation/kbuild/kconfig-language.rst: "select should be used
with care. select will force a symbol to a value without visiting the
dependencies. By abusing select you are able to select a symbol FOO
even if FOO depends on BAR that is not set. In general use select only
for non-visible symbols (no prompts anywhere) and for symbols with no
dependencies. That will limit the usefulness but on the other hand
avoid the illegal configurations all over."

>
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vm=
linux.lds.h
>
> > @@ -491,6 +491,8 @@
> >               *(.rodata1)                                             \
> >       }                                                               \
> >                                                                       \
> > +     SFRAME                                                          \
> > +                                                                     \
> >       /* PCI quirks */                                                \
> >       .pci_fixup        : AT(ADDR(.pci_fixup) - LOAD_OFFSET) {        \
> >               BOUNDED_SECTION_PRE_LABEL(.pci_fixup_early,  _pci_fixups_=
early,  __start, __end) \
> > @@ -911,6 +913,19 @@
> >  #define TRACEDATA
> >  #endif
> >
> > +#ifdef CONFIG_SFRAME_UNWINDER
> > +#define SFRAME                                                       \
> > +     /* sframe */                                            \
> > +     .sframe : AT(ADDR(.sframe) - LOAD_OFFSET) {             \
> > +             __start_sframe_header =3D .;                      \
>
>                 __start_sframe[_section] =3D .;
>
> > +             KEEP(*(.sframe))                                \
> > +             KEEP(*(.init.sframe))                           \
> > +             __stop_sframe_header =3D .;                       \
>
>                 __stop_sframe[_section] =3D .;
>
> Unless I am missing something both are not the start/stop of the .sframe
> header (in the .sframe section) but the .sframe section itself (see also
> your subsequent "[PATCH v3 4/8] sframe: Provide PC lookup for vmlinux
> .sframe section." where you assign both to kernel_sfsec.sframe_start
> and kernel_sfsec.sframe_end.
>
> > +     }
> > +#else
> > +#define SFRAME
> > +#endif
> > +
> >  #ifdef CONFIG_PRINTK_INDEX
> >  #define PRINTK_INDEX                                                 \
> >       .printk_index : AT(ADDR(.printk_index) - LOAD_OFFSET) {         \
>
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

I'm working on a new version that I'm hoping to be able to send
sometime next week, which should address your other comments.

Thanks,
Dylan

