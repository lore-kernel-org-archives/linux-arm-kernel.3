Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B79CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 17:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRWobckzeW61/um9iWV6bMFpw8+SVVVfvtQLyFDktwE=; b=mK6VI8+LwAhfelbOuRKIMga+pH
	i6Co/80MxY2fqZ4e2rCvlaXpoc/302N/8bsjS8uOQ3thiEJ3d+GwsaIbu7/q/fw7cvaNPIwI+deUX
	K0VZKxU9vXQ/D2TEhO/CwLqinX7IVFGQQGFd89BA39vDVcsse95yYqFJLdGHfBfsvjOP1RmE2qJkV
	EcgD9uSp0ouNcbv9vvApZe/sbV5/NGWjxOzw+NQhN03zOm1uua8tKxfHlE/o04eTrDUhAS56coy5e
	HjwJvZclkyGXjKX3TV/VYaFgUL9aQl1vwvO7xa1JvfIYX1qHkSmrFXzkIuOVqgrXHp6d2kxaP3z2H
	GhHau22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2C2-0000000GRwD-2koU;
	Mon, 18 May 2026 17:55:54 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2C0-0000000GRvE-0rWU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 17:55:53 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-6314c3818baso2087492137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779126950; cv=none;
        d=google.com; s=arc-20240605;
        b=eXbFLo9kuat59hjW83bvfk0ZuOyjGk+U6s30UHQmRwpO0xZXgkRseMtwb0jX03fBs0
         dpEOSye3TbIg6Jcvbgt/VzP9Mh3CYR2ruDcOengvATIPjv5Cz0FxHfChix3PEzcpzMaP
         Ppv+QEeqT6x4v2eaYalVgG8cMz5hs0ujNCaKk2SxOR+HqmX4lqw1Y43Lj2XkPIef4dwg
         wXO07D7ye4lqb18htyZm+5S5C4BW2vgikU/qYWtQwtf6fhyQW6LreyQEwSyFQg8jFuon
         fhhiFpIhlUGTTrBRkExsy5dpL8lhUjhfv3p1GuomByGxLpNuDfXP2cvJrAgExoiSzfeZ
         Fw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uRWobckzeW61/um9iWV6bMFpw8+SVVVfvtQLyFDktwE=;
        fh=eARnpsFP25SO7f5FMx61uJ6HkH35TUs+XJhu+QmuSXU=;
        b=jgm73aJAKBk5maXVtq01k7PuvNYycPgLuKl/zYrnjmT8L6C11Zw64A5RO3OcssOOes
         M8axMJf7f9rFj4qaCi6cvz4JWYcZ5L50f6ucGDVZ27xUqkkR6NmskQUu9lVCwR8PB/LX
         rnsnnm34JpNlI9TsEILbqfofHTXTfr/RMQK/kdofwZ26Xx1UyYmgiHhGYifMkAlVRnfc
         rO0coL5hOHZk0PhrWz0bFTcKPGIUNfGY9ZWpDITAppLyKBE5h5fUHuJAv9pWtx9wneHy
         5g7yoeE8uw+1++ITQG2lQX83dfPPTU0aSkD77scrHrecNe64kgrgofXN8AoZqZeS8Ces
         2U2A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779126950; x=1779731750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRWobckzeW61/um9iWV6bMFpw8+SVVVfvtQLyFDktwE=;
        b=Mghk98bH1a8JylzfCDstjQNNHgu1rU4awDXVqO0QQO1ZT6gE7i/Ob3irEkAeEgIFXu
         3eaQJBwwPvyCZEVcDviqR2OLfXhdKmj726HVfkJxOLSvLv0UYRlmDOUWZrAVuQv/LByv
         sRe188twXSB8e7/8NR09WFYH7YV2dhyj2WH8okWGCkFYPH1JXWZ/QKh95NoTM63/bOEo
         nltMwNnpZPW22QhXDANPWFIoeKJWCYwLOE5qPGY7QiJAy/MRprcwsoKxci36YV0dOM8z
         9GfuuqfvB7NarPKrLxYzccUQ+DVL+qnASGl8X861EErgZjXT9ZNL5f+I5NZadkp6gM00
         BlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779126950; x=1779731750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRWobckzeW61/um9iWV6bMFpw8+SVVVfvtQLyFDktwE=;
        b=ZcAjzAbN6hLMlTKXcsTt9xvsUaGaEspKxNbjKLavJqCvlezbd/9oc36N3eSzVmv+lw
         vXFhxUxo5SdLkf12sfim6hjaS3Tsyu2jgmjtSx3Nv423oSl+XSmx3gt9ervvFaYImkoy
         pReRD7fba+dJwX8wujLkJz7JVo9tnmZRyrl72ZRoYpt0U1KR9v6q1Phqk6AvsKYSPhV+
         A8wTyLyxBZaAOKHRDEhL+SQTafhnqzzsx75MBvR+g+4STKWkkmK/6g7FgvVsQAq6/dET
         6zfCMOop76Qplse1KmXZGnizn7jNyprcvlCjB+LeSsY0feJQnRydU/zS6AkYkBYPlj8t
         jyxA==
X-Forwarded-Encrypted: i=1; AFNElJ/ELsynDpf6spbuF7Pz8wDwDJhQrGtz39GXv+NabUaT6dUJvVk6qigbNgtDd9uJOYlaSmgcdrpcWTXAuN3g4RBn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw87c5ih56bhTT88aHI+UnqROt9y1yP7JviOggSp58j2ud+gR1D
	TkhrUUDqmdLq9/Td9nkwWB4+EyhE1cOEWPISYWxXmwxEH/rBOOhBgV+PO1OdD6bUtR+sAApUfJJ
	csua4vCAAyoJvHEA8tE1uqkw2sHlymRk88cdeVFLa
X-Gm-Gg: Acq92OH80hw1CdGKQ7rf422ykdPEHefNBOXDPUBiNbjP745QgkIZNk09BwU9NwRqBRn
	/AgFPMVu3XM6v/mT2ecQ6HxEBvhWUL7F5UJ8nTS2zPFnL3IVcs8NxjkRAGaIqWNSAMd6EUklubl
	ycHw6bSD5reAR4pHsoGtqHX2jgjHoXYIxq+lyNlxx3QO7CdZFiNRkKuXzGpeaDGSNikh8FO8z5Y
	bpuyEVyk5EIjMc/KK5BiWfEi/Pw7K1dcR+OiExXXBXqBNKDYya73T3cM9SvxN/4hW9jYPguk02T
	CqWJVhdI73PsTiTw7oR/IFsR4fpOtt7fWeROqS25fvhyABAp
X-Received: by 2002:a05:6102:5493:b0:631:37cb:1e64 with SMTP id
 ada2fe7eead31-63a3cd147f1mr8765580137.4.1779126949351; Mon, 18 May 2026
 10:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com> <agcEMEl-QR0g6DgF@google.com>
In-Reply-To: <agcEMEl-QR0g6DgF@google.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 18 May 2026 10:55:37 -0700
X-Gm-Features: AVHnY4KAVyVG3MIthAgIvuYFRo0zgnpM4Osagc0xDbfXJPvO4gKarvsASmJ8hSE
Message-ID: <CADBMgpx38SUUuYYCm612STqh01jqv817WnJeeXYTD7Uc1r-fug@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] unwind, arm64: add sframe unwinder for kernel
To: Mostafa Saleh <smostafa@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105552_295239_A822D481 
X-CRM114-Status: GOOD (  31.34  )
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

Hi Mostafa,

On Fri, May 15, 2026 at 4:32=E2=80=AFAM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Tue, Apr 28, 2026 at 06:36:35PM +0000, Dylan Hatch wrote:
> > Implement a generic kernel sframe-based [1] unwinder. The main goal is
> > to improve reliable stacktrace on arm64 by unwinding across exception
> > boundaries.
> >
> > On x86, the ORC unwinder provides reliable stacktrace through similar
> > methodology, but arm64 lacks the necessary support from objtool to
> > create ORC unwind tables.
> >
> > Currently, there's already a sframe unwinder proposed for userspace: [2=
].
> > To maintain common definitions and algorithms for sframe lookup, a
> > substantial portion of this patch series aims to refactor the sframe
> > lookup code to support both kernel and userspace sframe sections.
> >
> > Currently, only GNU Binutils support sframe. This series relies on the
> > Sframe V3 format, which is supported in binutils 2.46.
> >
> > These patches are based on Steven Rostedt's sframe/core branch [3],
> > which is and aggregation of existing work done for x86 sframe userspace
> > unwind, and contains [2]. This branch is, in turn, based on Linux
> > v7.0-rc3. This full series (applied to the sframe/core branch) is
> > available on github: [4].
> >
>
> Not sure if related, but after updating my toolchain
> (aarch64-linux-gnu-gcc (Debian 15.2.0-4) 15.2.0), I hit link errors:
> ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.sframe) is being =
placed in '.sframe'
> ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.sframe) is being pla=
ced in '.sframe`

Previously when developing against the SFrame V2 format, I had fixed
these warnings with the VDSO Makefile change currently in this series:

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makef=
ile
index 7dec05dd33b7..c60ef921956f 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -38,7 +38,7 @@ ccflags-y +=3D -DDISABLE_BRANCH_PROFILING -DBUILD_VDSO
 CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS) \
                        $(RANDSTRUCT_CFLAGS) $(KSTACK_ERASE_CFLAGS) \
                        $(GCC_PLUGINS_CFLAGS) \
-                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
+                       $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRAME) =
\
                        -Wmissing-prototypes -Wmissing-declarations

 CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables

But the warnings seem to have returned after upgrading my toolchain,
possibly due to SFrame V3 or some confounding change in GCC. The
--gsframe in the assembler should be set to 'no' by default, so
perhaps GCC is providing an override --gsframe internally?

>
> I applied this series hoping that fix it, but it doesn't, so far I
> have this hack :
> diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/v=
dso.lds.S
> index 52314be29191..53bdf757ee44 100644
> --- a/arch/arm64/kernel/vdso/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso/vdso.lds.S
> @@ -77,7 +77,7 @@ SECTIONS
>         /DISCARD/       : {
>                 *(.data .data.* .gnu.linkonce.d.* .sdata*)
>                 *(.bss .sbss .dynbss .dynsbss)
> -               *(.eh_frame .eh_frame_hdr)
> +               *(.eh_frame .eh_frame_hdr .sframe)
>         }
>  }
>
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmli=
nux.lds.h
> index 60c8c22fd3e4..759903acd6fc 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -1064,6 +1064,7 @@
>         /* ld.bfd warns about .gnu.version* even when not emitted */    \
>         *(.gnu.version*)                                                \
>         *(__tracepoint_check)                                           \
> +       *(.sframe)                                                      \
>
>  #define DISCARDS                                                       \
>         /DISCARD/ : {                                                   \

Since this series only handles kernel stacktrace, I believe it's
better to omit the .sframe section entirely in the case where only
ARCH_SUPPORTS_UNWIND_KERNEL_SFRAME is enabled. I think this hack may
work better for this purpose:

diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makef=
ile
index c60ef921956f..29f802bfedb1 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os
$(CC_FLAGS_SCS) \
                        $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) $(CC_FLAGS_SFRAME) =
\
                        -Wmissing-prototypes -Wmissing-declarations

-CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables
+CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables
-Wa,--gsframe=3Dno

 CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_vgetrandom.o =3D $(CC_FLAGS_REMOVE_VDSO)

Though, I don't understand why it is necessary to provide --gsframe=3Dno
explicitly. If this approach seems ok to other folks/maintainers, I
can fold this into my series.

On the topic of SFrame for VDSO, Jens has a patch adding support for
this as part of a series to support userspace SFrame unwinding for
arm64:

https://lore.kernel.org/lkml/20260417150827.1183376-4-jremus@linux.ibm.com/

>
>
> Thanks,
> Mostafa
>

Thanks,
Dylan

