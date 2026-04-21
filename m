Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0039F5A8D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 01:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9VCnm4L5RrHFLm9mWiN30aH7pXEysokH9gscuZA1LE=; b=Hsv+fT/FKQVRiCVDgvZ7QaU8Pn
	QYdJTdecFLEqYMH3FfA/VonrFhNJZqYyN8spQpIgn6Uy2emLf+ZBINZ1GbuXD9lusheGE4nHn1O2x
	MWiNZNSzlbUorkTpxT5Io2SX9FVeT+Lg9AH2tcG+3TVeyPrCFNCuanuP4964l9s/SW8PsDvtE2CjS
	yBnPsrLsL+1kgAcBzXa+t6lyiYl5mdik0DY3npK/qRCbmNL1TP1U3iyDpGZRdY+GhJ6ew6xVjXXwj
	rNuICO+sTUAy2eJKPmlcKz14oC/6MU4kGY+z6R4aRJ1S6BaLnl99VzjR6b9hQXv0CN2S42aN4b/x3
	QdrmcqhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEzvs-00000007tmU-2TRD;
	Tue, 21 Apr 2026 01:29:44 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEzvq-00000007tm6-1f5V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 01:29:44 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso2140380241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 18:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776734981; cv=none;
        d=google.com; s=arc-20240605;
        b=j3NNh5ELMO7uAM22e1ZR8WkckRfKIUbcnF2E6A3tkOXcaVp3c7ewUdH3W8ORL+IuGv
         IlTfIUozPcsWBUs98V68qQpBPQKU6Mfa91PCuB+f9mTtS4cFkw1E97Os2iD+K6KDNPST
         9gz+ruAe0zMi2gVZYivrFmHAzE8LNMG41rTR5YN3nDs8Kr7bdR7O4pZcwEfH3eIJ4LzE
         0DOjLdBH/fN0AHTF44TiyQo4+r9978ybF+2fTZZ+Jew+jOywOUody6Jn7NLFk5VjR/i6
         ZVxBgLmEGEsFEuz2JyaxaX8dh0IVede/HLBlqBsri/lFfjUz4swYsTmArK5sPQliu3rm
         3H3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b9VCnm4L5RrHFLm9mWiN30aH7pXEysokH9gscuZA1LE=;
        fh=0EIGYRO9nWt8hQsHfPT/4NlbZ3M7cDS2szMvzqyvzMM=;
        b=hahru6gc5njSbsWv4hkZqPJIeaBmU7TCdN8uLPCojtpHUou3ipvXy5YzpHQSxuXf7n
         Q7ysrELi1zA/ExSmNxaEEHm7u1oFY6YaM7LUN2RDIyShoRUsbdkPTq9GcBPzDvZLRcA9
         I1np1lYdD9sA+mmEhe7sxmbKh8eA64HN3E6bvpKWfkD2rsmuH6TTLYTr7eKyNtrNe3Rx
         crwdgzP96khx/QLwWyunDS+miKxyt7QjFK8INg70Lndjn0c+8zBYjupSR2F824AQ7vgN
         WH2knHm6wfJdOwhIYB8cW8oAlvOzMaYtst/lDLW3bbaGPu7PF1jBpE23I0nEAMBQUVfy
         +5GA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776734981; x=1777339781; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9VCnm4L5RrHFLm9mWiN30aH7pXEysokH9gscuZA1LE=;
        b=VPfnTO4IE6VkFDhVL8mlDQBt+H8xNYM5UcQxPsFI7jzc9EjKQzNHB7PU2SzwW7OgfK
         7mznyW3pJFwiXL2hWLGrsWHNpxGgJuwhl8PnBam/8/OXdm+/e2rksAdOEPUqomzk8py2
         kzYICG7YMhyzf42m8cyDwesGLJ8gSiP1vXqrDWeZZE3VX/BfBUSjFlDh1Jxg472UMqsM
         FRwDSTXni0esV3XJULD0LTXR0XvMbxxrFDI4zzZqu11R9AoI1mBSYHbTB2628jQsTzx2
         Vz7dRIhllGO+KaldxxP4KRFCynNZik9hfwYnxcAeFJUGCAfZeTmns3gm8gRDZzmhXop0
         Ho8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776734981; x=1777339781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b9VCnm4L5RrHFLm9mWiN30aH7pXEysokH9gscuZA1LE=;
        b=XnhVY0TfwLuFkK1NzXiGRcKXuScrUT16MZHn4hii9rFq90oVBD6wvoW5tziD6x50mq
         m71xCyIqHWSTc0sp9F1ce0aA4qLBBm/NyUlrsFhzP+RiGcioOVZzUAqm8Fo2ToGC8DP9
         RgmhOMBl/5JZFnwzK545JGODyCakhr8DqD/wCi82GpLMseS9ablQx70qKZs4WOwetCHW
         YX+c/gVchkspCejwTMRLTNzI7rkda6op2OJ3NMxLdhsTFbN7QWD7D+/MUD2gJ0stK6Vt
         mW6VVoB8RFBof+q6iyVaN1cwf1JRpQSBc5BVTy6uxkS9DZ+/WFtZza8tsQ2URB96cr+W
         rGbg==
X-Forwarded-Encrypted: i=1; AFNElJ8cfWLSCYt6YdgOAbB3QTt6Ze31cvUbml9xEABgP7oa8+HOr2PMkPdYPB1YDUylb5JEk1hwtlkYPOSNo5F7DtbZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz03Bt560yT9xMGlk5V8fTnv6N+AhODFMAtbdktDC6PONp7Eabe
	BxJIA7ZZZ7xz5ZqWnNkYoaGXhi7EIufed0Hipg56jnwbf064VdFUeXhAMvc1YKy4sy2NxjWoPYs
	a5b21tATd6cwYY+gDbjrP2sq4/ZfEUxmwb2gsuGFQ
X-Gm-Gg: AeBDievROZa6lm5Mgth9Tn3WeeW9OfMNB8I0a0XXHOKyq0COAjlI7evCQL2AGshPWMG
	IRUCaX2PFcSlMtZv3oHEHKH9q0yWQMvLANf3GKzIA4cv8cxcacI92l5N5UXy2coVkoigns1fn6V
	raUHzrCMdzAhNkXWhUSx/98tjWYFjcOBYwGbGshJZGIcNhVRXrOK9PIR7nsxhXzKB0aIxqjNJnP
	i+WzU6aFuGMzCn7SHqC3fY5ZmmHgqfIFtC0wkzyWLTv6ipEU2Lef+KQ5y/e9/QkkQWO2CdDGbpy
	XHw3eXhECPYjOlrSj32MvSbSUNOf
X-Received: by 2002:a05:6102:5094:b0:608:94e3:bd8a with SMTP id
 ada2fe7eead31-616f4f77861mr7269981137.8.1776734980393; Mon, 20 Apr 2026
 18:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260406185000.1378082-1-dylanbhatch@google.com>
 <20260406185000.1378082-8-dylanbhatch@google.com> <de7bd273-3650-4378-8fd8-a51217e7284b@linux.ibm.com>
 <CADBMgpzbEGTm-sZ71a5hvFOHbu5VgSR406F3NsMLF1+oDWbO6A@mail.gmail.com> <dde1daa9-724c-4186-aaf6-caff6b47c5a9@linux.ibm.com>
In-Reply-To: <dde1daa9-724c-4186-aaf6-caff6b47c5a9@linux.ibm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 20 Apr 2026 18:29:29 -0700
X-Gm-Features: AQROBzD4sxXSCszJZ2N3Wrx6Xjh99aneu1LnlBIufFgIxKIHOKABwtCT5Jq0AHs
Message-ID: <CADBMgpzBvKTvRKHmLbEF301S_DnCg6SRETkMh6jPo-1hOEEZVw@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] sframe: Introduce in-kernel SFRAME_VALIDATION.
To: Jens Remus <jremus@linux.ibm.com>
Cc: Indu Bhagat <ibhagatgnu@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_182942_495246_86709234 
X-CRM114-Status: GOOD (  50.13  )
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

On Mon, Apr 20, 2026 at 5:31=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
> On 4/20/2026 7:02 AM, Dylan Hatch wrote:
> > On Thu, Apr 16, 2026 at 8:04=E2=80=AFAM Jens Remus <jremus@linux.ibm.co=
m> wrote:
> >> On 4/6/2026 8:49 PM, Dylan Hatch wrote:
>
> >>> Generalize the __safe* helpers to support a non-user-access code path=
.
> >>> Allow for kernel FDE read failures due to the presence of .rodata.tex=
t.
> >>> This section contains code that can't be executed by the kernel
> >>> direclty, and thus lies ouside the normal kernel-text bounds.
> >>
> >> Nits: s/direclty/directly/ s/ouside/outside/
> >>
> >> Could you please explain the issue?  How/why does .sframe for
> >> .rodata.text pose an issue for .sframe verification?
> >
> > __read_fde checks that the fde_addr it extracts is within the bounds
> > of sec->text_start and sec->text_end. In the case of the vmlinux
>
> Looking at the existing check in __read_fde(), do you agree that it is
> wrong, as sec->text_end IIUC points behind .text and thus the check
> should be:
>
>         if (func_addr < sec->text_start || func_addr >=3D sec->text_end)
>                 return -EINVAL;

I agree this is correct. Is this a fix that would be folded into your
previous patch series?

>
> > .sframe section, this is _stext and _etext. However on arm64, there is
> > an .rodata.text section that lies outside this range. From
> > arch/arm64/kernel/vmlinux.lds.S:
> >
> >         /* code sections that are never executed via the kernel mapping=
 */
> >         .rodata.text : {
> >                 TRAMP_TEXT
> >                 HIBERNATE_TEXT
> >                 KEXEC_TEXT
> >                 IDMAP_TEXT
> >                 . =3D ALIGN(PAGE_SIZE);
> >         }
> >
> > So __read_fde fails for functions in this section. Under normal SFrame
> > usage for unwinding, we should never need to look up a PC value in
> > these functions because they will never be executed by the kernel.
> > However, we still hit this error when validating all FDEs.
>
> Thanks for the explanation!  Could you please improve the commit
> message, for instance as follows:
>
> __read_fde() checks that the extracted FDE function start address is
> within the bounds of the .text section start and end.  In case of
> vmlinux this is _stext and _etext.  However on arm64, .rodata.text
> resides outside this range, causing __read_fde() to fail.
>
> > I think ideally we might prevent sframe data from being generated for
> > this code (maybe from the linker script somehow?), but I don't know of
> > a simple way to do this.
>
> I dont't know of any way to exclude a single function or a whole section
> from .sframe generation.  The GNU linker would discard SFrame FDEs and
> its FREs for discarded functions.  But in this case the function itself
> is not discarded.  As .sframe is not generated separately per section it
> is also not possible to discard e.g. .sframe.rodata.
>
> > Alternatively, we can check for FDEs located
> > in .rodata.text during validation, but this seems to only be present
> > in arm64, so maybe we would need an arch-specific hook to do this? I'm
> > open to suggestions.
>
> Maybe that is better than ignoring __read_fde() failures?  I first
> thought this would get nasty, but maybe it would not be too bad.
> Following is what I came up with (note tabs replaced by spaces due to
> copy&paste from terminal):

Thanks for the suggestion! I'll look into incorporating this.

>
> diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/s=
ections.h
> @@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_en=
d[];
>  extern char __mmuoff_data_start[], __mmuoff_data_end[];
>  extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
>  extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
> +extern char _srodatatext[], _erodatatext[];
>
>  static inline size_t entry_tramp_text_size(void)
>  {
> diff --git a/arch/arm64/include/asm/unwind_sframe.h b/arch/arm64/include/=
asm/unwind_sframe.h
> @@ -2,11 +2,28 @@
>  #ifndef _ASM_ARM64_UNWIND_SFRAME_H
>  #define _ASM_ARM64_UNWIND_SFRAME_H
>
> +#include <linux/sframe.h>
> +
>  #ifdef CONFIG_ARM64
>
>  #define SFRAME_REG_SP  31
>  #define SFRAME_REG_FP  29
>
> +static inline bool sframe_func_start_addr_valid(struct sframe_section *s=
ec,
> +                                               unsigned long func_addr)
> +{
> +       return (sec->text_start >=3D func_addr && func_addr < sec->text_e=
nd) ||
> +              (sec->rodatatext_start >=3D func_addr && func_addr < sec->=
rodatatext_end);
> +}
> +#define sframe_func_start_addr_valid sframe_func_start_addr_valid
> +
> +static void arch_init_sframe_table(struct sframe_section *kernel_sfsec)
> +{
> +       kernel_sfsec->rodatatext_start  =3D (unsigned long)_srodatatext;
> +       kernel_sfsec->rodatatext_end    =3D (unsigned long)_erodatatext;
> +}
> +#define arch_init_sframe_table arch_init_sframe_table
> +
>  #endif
>
>  #endif /* _ASM_ARM64_UNWIND_SFRAME_H */
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.=
lds.S
> @@ -213,12 +213,14 @@ SECTIONS
>
>         /* code sections that are never executed via the kernel mapping *=
/
>         .rodata.text : {
> +               _srodatatext =3D .;
>                 TRAMP_TEXT
>                 HIBERNATE_TEXT
>                 KEXEC_TEXT
>                 IDMAP_TEXT
>                 . =3D ALIGN(PAGE_SIZE);
>         }
> +       _erodatatext =3D .;
>
>         idmap_pg_dir =3D .;
>         . +=3D PAGE_SIZE;
> diff --git a/include/linux/sframe.h b/include/linux/sframe.h
> @@ -63,6 +63,10 @@ struct sframe_section {
>         unsigned long           sframe_end;
>         unsigned long           text_start;
>         unsigned long           text_end;
> +#if defined(CONFIG_SFRAME_UNWINDER) && defined(CONFIG_ARM64)
> +       unsigned long           rodatatext_start;
> +       unsigned long           rodatatext_end;
> +#endif

It looks to me like .rodata.text only exists for vmlinux. I wonder if
in sframe_func_start_addr_valid we can just use the global
_srodatatext and _erodatatext after identifying if an sframe_section
corresponds to vmlinux (kernel_sfsec)? That way we don't need to add
these extra fields.

>
>         bool                    fdes_sorted;
>         unsigned long           fdes_start;
> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
> @@ -20,11 +20,23 @@
>  #include "sframe.h"
>  #include "sframe_debug.h"
>
> +#ifndef sframe_func_start_addr_valid
> +static inline bool sframe_func_start_addr_valid(struct sframe_section *s=
ec,
> +                                                unsigned long func_addr)
> +{
> +       return (sec->text_start <=3D func_addr && func_addr < sec->text_e=
nd);
> +}
> +#endif
> +
>  #ifdef CONFIG_SFRAME_UNWINDER
>
>  static bool sframe_init __ro_after_init;
>  static struct sframe_section kernel_sfsec __ro_after_init;
>
> +#ifndef arch_init_sframe_table
> +static void arch_init_sframe_table(struct sframe_section *kernel_sfsec) =
{}
> +#endif
> +
>  #endif /* CONFIG_SFRAME_UNWINDER */
>
>  struct sframe_fde_internal {
> @@ -152,7 +164,7 @@ static __always_inline int __read_fde(struct sframe_s=
ection *sec,
>                   sizeof(struct sframe_fde_v3), Efault);
>
>         func_addr =3D fde_addr + _fde.func_start_off;
> -       if (func_addr < sec->text_start || func_addr > sec->text_end)
> +       if (!sframe_func_start_addr_valid(sec, func_addr))
>                 return -EINVAL;
>
>         fda_addr =3D sec->fres_start + _fde.fres_off;
> @@ -696,13 +708,6 @@ static int sframe_validate_section(struct sframe_sec=
tion *sec)
>                 int ret;
>
>                 ret =3D safe_read_fde(sec, i, &fde);
> -               /*
> -                * Code in .rodata.text is not considered part of normal =
kernel
> -                * text, but there is no easy way to prevent sframe data =
from
> -                * being generated for it.
> -                */
> -               if (ret && sec->sec_type =3D=3D SFRAME_KERNEL)
> -                       continue;
>                 if (ret)
>                         return ret;
>
> @@ -1031,6 +1036,8 @@ void __init init_sframe_table(void)
>         if (WARN_ON(sframe_validate_section(&kernel_sfsec)))
>                 return;
>
> +       arch_init_sframe_table(&kernel_sfsec);
> +
>         sframe_init =3D true;
>  }
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

Thanks,
Dylan

