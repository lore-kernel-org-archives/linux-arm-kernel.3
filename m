Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9F5CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 01:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2L2S9MvUFFvpzZ7zF7cqwq66hTG1YCAiCG+LuOM55o=; b=01leZqMb+f+kZcwtk+91Bcd/qf
	o9rxl1xusvXwWoT8KZFzyDnS3EanRQWz5ZqVSJb6E2phzafp8kKTueo8bI2YaU4EN1lGoOtsDTEoR
	HKpDXNHuVnNAhpV77cS57F4FZ2ky1kNLdz1GEV5GcKs6uE1Yqc5xi2XzHknrluh+s0rM+xuV5L6hh
	3X9Bm42kEMbagZSglLPs8N7abLc++KQOaATCBIvkH1rfkwSbj9XAmj8zaszCzAZWjK5UKt8H65a7f
	IVHOnKgVEa4k7yiAx75rb8LEo6lYNtH7PyReUyIHAneD6Yi2UlSjoVGbL+rl7p0NC3L2ZpNv1SoDQ
	EFbSztQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbe0-0000000F9EA-2IOV;
	Tue, 12 May 2026 01:10:44 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbdx-0000000F9DY-18wD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 01:10:43 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5673804da95so1674865e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 18:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778548239; cv=none;
        d=google.com; s=arc-20240605;
        b=i5YCdceltX1GYBl5ag+LtTQX6/UZD6D85GODsyc4KqoFBfYvitmdWroQovyOJyUoFb
         uNiaRM+pre4WdIQgAQLna03dY8lgSPoKTY1ulxY74fK7wSvoj/Sb6+5NHV106aBbxU5s
         DjLVosEl0zKGRJnM9SHCBEexRqYQMtlXRPIV0QkBw5eFGppN9laEgwO5VHvDyv7xJD7c
         OeAKmxpEjaBPOOtmRsDhmG8lpdWisnSVWy0RmV2ipkHKxeADxtuFS0PFU2PwiZkXcLgo
         eM/tmGZPLfqaF5Q33Bk1eqDmZ2bVW2UYmVwdG3GVsVv7gLn0bLEGqAyuVpX3/YSe0xRI
         v4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d2L2S9MvUFFvpzZ7zF7cqwq66hTG1YCAiCG+LuOM55o=;
        fh=tsF/cagm8irbjqBKxysApfyvG5KmBLTm2JuQN3LzJgA=;
        b=ZRc+LokBxN1L7WfsJriK5OFs7SIQTEHGhGbSBBpZ942xREylvczvrAcvRRU2CuOWdw
         kUPAL2UW8MQX2g096vw8iptynp4UVZBUnjzpXd2EUciF+w3Vn88/2PsAzxtrv/1qZOMm
         4Eg1FbgA/Zior0lAEDEUSbwlXrqRWT5KtTC2y6yCVsuWnJFdyB/CVs8RW0mIXTfJP4VC
         NBHJ3aXbOISktqphbWy7Pzc6dincebZQO36rwoQm1rEuCQThs6wqxjIuVLP2vHYPrffL
         BDGBBULU1haLLkSXoNrOZk4pNEQLaA/7THTgcIYCRRYRrbjikaWBz78FieahGEpEMJr3
         eLgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778548239; x=1779153039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2L2S9MvUFFvpzZ7zF7cqwq66hTG1YCAiCG+LuOM55o=;
        b=WWIurJb4UZ3+FMtJQmQ7K4iTaijQylk42G7T/SiqnfE2OQeLYpVHiA9shaAFmdDflc
         u7NchxfIX3a9ZSBxRPZ8SYLVbFtmwoLvnP4KPIR6zsmpTz796zV58A01i46TIPXOsT7g
         +tRsDTIc9s9TPFduvM2/f3f0qg0hbEuwbMaSVR+a+BrElXSQUhczPI5rVX9KUnMayW5i
         /fr4ejutktacGsA4+/OqfdK/uphZiy7+FomuxcZVMuiOmXVMHfkegZop/H+6QJbtQKHx
         cyW+xi3jFiqVWn5Kzz2a3f0y9Lzl9bzK7MQJlGHsfhWyszqysqfcYD5eKVURlD7RN835
         UwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778548239; x=1779153039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d2L2S9MvUFFvpzZ7zF7cqwq66hTG1YCAiCG+LuOM55o=;
        b=HmwtnTWbAM9RxsJQ4FEWShQZIO21kjiT5Kky5anr6sCf28HxdR9Y4+evMAyJspAZZh
         IvzN7Zm0q4jx8oS9ffCC3pFTJJohf0+hyq57SeqTgOwqyn6rcnla1/06RMhgHLglM9iU
         h4MXUv5a8CgzkVP/2nR2nJrju82UvFRRPIgKIPdDhZn9gy24tVIsK1bbbItkLF6MgeoA
         XZw21pG0vUfSTyY7b06+wr76y4fFGs2Is85o3UtvaJzUAZIsQa2oBzp8WH6QEK/yY1xV
         BSfF9nhUiJTnSdsymsHGh01vQ7Ktr66zNrptmGxmiNKsD7FSrXR7dWE1Q8FYtXlKVRgu
         ZkoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+CUXF19afocunGOnTrxp/MPYtZCFLCaHXSD2tYQ0OO6C3TpBH52SpmQe2LaJNyjgJPo1Bh3XFtM5/LcXbJ3Wgp@lists.infradead.org
X-Gm-Message-State: AOJu0YxUF5LNAFABH4W2km8LIbBnaiLT+4N9paqv2ZEQccQ1Fr1Zb2Js
	mqvLIgnb3Iyj/7dc4yfrXnc0cZiXdAf2cVx3P9LmKWOUz46ExjqBk8aKuyei/hmG8t2KkeC38kc
	ClyBpq/g1368K53jo2PsuFYm9GhoBVMbX8hjugLji
X-Gm-Gg: Acq92OF9fnqo/SbgQqRVFKDvhofmfr9U0Ho/q1N+iKkuTiR/1IuDDDBhmsVbZ/n1fsR
	eL0KI09uazqowLylUhycY7UweeDNWz0V76paoCotKHhCNaT8pIznSO+hAMURnCLIjnG+xKpssd1
	gMjD5cN3owtdGcTsDyQ1ga5zAwdQvsR2cRcWsKhsq94auTPPfECE0fA2Paz6AgQPo3ukpfTgcGi
	CFgYAOhoMT6UDqQ8goWWs4WVCRqRz+0rDLnj7GPwJ+L/qi564KgzEPFNtaA0igMJ01ccJ8NLdVr
	AFR95CJ1tpdVLdhLbQ==
X-Received: by 2002:a05:6102:2ad6:b0:611:6fef:90d with SMTP id
 ada2fe7eead31-630f92a41a6mr12795859137.31.1778548238405; Mon, 11 May 2026
 18:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com> <549d10b6-ba2b-4ae9-86ef-6157e13b6ee3@linux.ibm.com>
In-Reply-To: <549d10b6-ba2b-4ae9-86ef-6157e13b6ee3@linux.ibm.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 11 May 2026 18:10:26 -0700
X-Gm-Features: AVHnY4K1Ilc6ZNSFBH-MtrSxiuvTeFABP2FASi4Xr4ffzUnpNsS3RxypEz1ND1s
Message-ID: <CADBMgpwDzrQU289fRXCRvSiCo3noOTy6=q8C58sLPrT_KO+=UQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] unwind, arm64: add sframe unwinder for kernel
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_181041_359698_B6C9E568 
X-CRM114-Status: GOOD (  24.28  )
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

On Thu, Apr 30, 2026 at 3:11=E2=80=AFAM Jens Remus <jremus@linux.ibm.com> w=
rote:
>
> On 4/28/2026 8:36 PM, Dylan Hatch wrote:
> > Implement a generic kernel sframe-based [1] unwinder. The main goal is
> > to improve reliable stacktrace on arm64 by unwinding across exception
> > boundaries.
>
> Please add support to initialize the optional sframe unwinder debug
> information.  Either in the appropriate patches in this series or as a
> separate patch.

Sounds good, I'll add this in as a separate patch in the next version.

>
> Note that for the module case I wonder whether it would be preferable
> to somehow indicate that it is a module name in the string, e.g.
> "(<module-name>)" or "<module-name> (module)"?

I don't have a strong preference, though I agree it makes sense to
indicate that the section is from a module. For now I'll add the
parentheses "(<module-name>)".

>
> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
> --- a/kernel/unwind/sframe.c
> +++ b/kernel/unwind/sframe.c
> @@ -1028,6 +1028,8 @@ void __init init_sframe_table(void)
>         kernel_sfsec.text_start         =3D (unsigned long)_stext;
>         kernel_sfsec.text_end           =3D (unsigned long)_etext;
>
> +       dbg_init(&kernel_sfsec);
> +
>         if (WARN_ON(sframe_read_header(&kernel_sfsec)))
>                 return;
>         if (WARN_ON(sframe_validate_section(&kernel_sfsec)))
> @@ -1047,6 +1049,8 @@ void sframe_module_init(struct module *mod, void *s=
frame, size_t sframe_size,
>         sec->text_start   =3D (unsigned long)text;
>         sec->text_end     =3D (unsigned long)text + text_size;
>
> +       dbg_init(sec);
> +
>         if (WARN_ON(sframe_read_header(sec)))
>                 return;
>         if (WARN_ON(sframe_validate_section(sec)))
> diff --git a/kernel/unwind/sframe_debug.h b/kernel/unwind/sframe_debug.h
> --- a/kernel/unwind/sframe_debug.h
> +++ b/kernel/unwind/sframe_debug.h
> @@ -32,6 +32,18 @@ static inline void dbg_init(struct sframe_section *sec=
)
>         struct mm_struct *mm =3D current->mm;
>         struct vm_area_struct *vma;
>
> +       if (sec->sec_type =3D=3D SFRAME_KERNEL) {
> +               if (sec =3D=3D &kernel_sfsec) {
> +                       sec->filename =3D kstrdup("(vmlinux)", GFP_KERNEL=
);
> +               } else {
> +                       struct module *mod =3D container_of(sec, struct m=
odule,
> +                                                         arch.sframe_sec=
);
> +                       sec->filename =3D kstrdup(mod->name, GFP_KERNEL);
> +               }
> +
> +               return;
> +       }
> +
>         guard(mmap_read_lock)(mm);
>         vma =3D vma_lookup(mm, sec->sframe_start);
>         if (!vma)
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

Thanks for the suggestion,
Dylan

