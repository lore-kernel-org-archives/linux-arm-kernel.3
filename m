Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8029BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtHyIUQ7PPZmcAeyFR/vgm01NmNP155YBbbcOUPlqcw=; b=e+2nKSrOVUVAYvdY6nOKdqnI2+
	l/o1v2qXp1D6z6Sw7cXRKDk9ab1CaRT/E85cGVNipXplbDN2HO+IaG185Z5AY0WgedqDw6TcNVnbr
	CxnruuG61Rzaq1rOtFP9TbEBirTDVsrMfF/OITRDz3kr7x4oPbjCF/8vv7p3D99NkA0lquzX3TMJ0
	isfPxnpgSf6fj6mNED+Sb5tuosMxzBI0wSXi0jHD5tKT3QehnERVG3zqpaJpU5cAByNLvvSagwqGF
	NV758My2UFydqy/wtowj5PwoZyVVfzzGv29pH3ekPwTmoB/ZvlwjWq1gKnqtCm6+trKJ/SNzmbuz1
	e/md3hCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KLz-0000000CEgw-0kDW;
	Thu, 17 Apr 2025 08:12:11 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KIc-0000000CE0e-0xoQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:08:43 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac345bd8e13so75576166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 01:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744877319; x=1745482119; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtHyIUQ7PPZmcAeyFR/vgm01NmNP155YBbbcOUPlqcw=;
        b=aKjVgE7okvH8kSMeUwaAp+kz1UZ/95DATZ7BW3AjJWVQM1FomDD1rtHsX9zYr7GEWy
         ii3UdN9prJzpETutgxFgR57h7uC2OlHQUnvlxkagWKNvd+pGLLnSpD0gtLxsB91baBSE
         h6i5Cja5cySWltePZ4CqKdDPDnJh0Nzpqe0YVXUU9tGxgfCNkJSC+DC3qcTeeyv+AEEX
         TY1Md32Y+eFqKy5Tuh4v5T/Fc3l0hyZYy0a2dwk/xT2J6HY20mmmcYf3zG1X27SKgVDW
         txv/Jqju94GDxasigKZOGKymByB3/9InKsfzTRBZ11rHbtT7wqG9WYIoH2bw+OaU7D75
         3mDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877319; x=1745482119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtHyIUQ7PPZmcAeyFR/vgm01NmNP155YBbbcOUPlqcw=;
        b=hPxTHtyLHerKIuOD/rF2pwIUtbA6u7jaaywQD82qY6YK0S1DY9GhBY3E8Levy5TgcP
         l7l/dEI8dCok7PMfeHP+yi9kJ9oxjtMuP9SCsb6DazG+jc8QfuhWZoZLa+JATBq1zWsV
         ubfP+YLaWDq/OyCWdy6iJGSeIAYJeFBObVTl52eRx/ABASCInBnZ71yFcKzo2EM6X9Y/
         23IzmhAzOTcXzv9LgJPjDQg14s9ag70yWaLdcxv6u05Ce6M7u2ayAGZjyhAnGkIdQuY/
         6xpmTpYzB++3upTSG/lGujlL4tqZ5k2uxrPYAwMzKT95ZNSFQJWf2kcZ1Mli2C8hzueo
         D3hg==
X-Forwarded-Encrypted: i=1; AJvYcCWVsiLwV6lC++DLmYVP8soznUlRPoD4+e5jEdL8eqWFKFy6N7eKFLPrhcRjuLtyx3vsjb0540EQ5mTvyuSj6qOa@lists.infradead.org
X-Gm-Message-State: AOJu0YxOKyJdi3oUh6eIXzm4XlioZPEZXOToZnFpFay7Z4zdv2dQsmtr
	bl9BrB4+XWmkoORJLtZtfIJG+0y1bVMJIdIjAvBK4lUV8erTacY3dmsx8y1iGuKYU9wLMxMA1rL
	Ul+iBqR+SDH320+ciuq7Nk9/HTk6XhuJm6VNx
X-Gm-Gg: ASbGncvKNXsMVzV5Vej7dPbg4uzixBSRR9GEay4pp9MywQ3QZeuZd+o9e/9p6pkRdz3
	cODT4IDnZcof56a8QePqb1N5SXhugY4ciI7MzbiSntvZHDvKexMpSO67x2b3/Ty8TrSxMaN/VR9
	Cg7hxMTS9lws8Z7H1KyHWR+p9ucy+pZPNdDmDiUVJVwX4xzZYH
X-Google-Smtp-Source: AGHT+IGpESoslQHTK0ogEW6yQ7GTAZkJZOLnAr+AoJwj8UFQjOudRmdKb0q0bSeFruID8VwGWPn9BWN2wlym/51A+Ok=
X-Received: by 2002:a17:906:9f91:b0:ac2:9683:ad25 with SMTP id
 a640c23a62f3a-acb429f1deamr444633566b.34.1744877319462; Thu, 17 Apr 2025
 01:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250403183638.3386628-1-korneld@google.com> <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
 <CACF_fqnevOo9NSRwDAh7KVQZTHTkP0pc2NKEXrWFapMYLf0Wkw@mail.gmail.com> <6f1af7bf-a354-4b90-bf82-edc8cc6e71fe@arm.com>
In-Reply-To: <6f1af7bf-a354-4b90-bf82-edc8cc6e71fe@arm.com>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Thu, 17 Apr 2025 10:08:27 +0200
X-Gm-Features: ATxdqUHWXjxt6FKkLeRswNUzasHECz8dNyCr3yjMNkHFGcVaT-gsxFCFilKbj7I
Message-ID: <CACF_fq=yFLUO2P0qrZFizUJe8J2FGYUK7w3DykKL3x7_R87UQA@mail.gmail.com>
Subject: Re: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steve Capper <steve.capper@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ssradjacoumar@google.com, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_010842_285681_D70134F5 
X-CRM114-Status: GOOD (  35.13  )
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

On Thu, Apr 17, 2025 at 7:15=E2=80=AFAM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 4/4/25 22:16, Kornel Dul=C4=99ba wrote:
> > On Thu, Apr 3, 2025 at 11:46=E2=80=AFPM Anshuman Khandual
> > <anshuman.khandual@arm.com> wrote:
> >>
> >>
> >>
> >> On 4/4/25 00:06, Kornel Dul=C4=99ba wrote:
> >>> When the 52-bit virtual addressing was enabled the select like
> >>> ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> >>> Because of that the rnd max bits would be set to the default value of
> >>> 18 when ARM64_VA_BITS=3D52.
> >>> Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that wou=
ld
> >>> be used if 48-bit addressing was used. That's because the 52-bit
> >>> addressing is used only if the caller provides a hint to mmap, with a
> >>> fallback to 48-bit addressing.
> >>
> >> Why should ARCH_MMAP_RND_BITS_MAX value be same for both 48 bits and 5=
2
> >> bits VA in case the user does request for 52 bit VA via mmap() hint an=
d
> >> the HW supports it ?
> >
> > Two reasons really.
> > 1. The whole behavior is controlled through a global knob -
> > /proc/sys/vm/mmap_rnd_bits. ARCH_MMAP_RND_BITS_MAX is used as an upper
> > bound for the value that can be set to that knob.
> > So we have a single setting for all processes. Some might want 52 bit
> > addressing, others will stick with 48.
> > 2. Quoting the documentation for this knob:
> >
> > """
> > mmap_rnd_bits
> > This value can be used to select the number of bits to use to
> > determine the random offset to the base address of vma regions
> > resulting from mmap allocations on architectures which support tuning
> > address space randomization. This value will be bounded by the
> > architecture=E2=80=99s minimum and maximum supported values.
> > """
> >
> > I suppose that it's legal for some calls to mmap from the same process
> > to request a 52 bit VA, while other calls will want only 48 bits.
> > Because of that the random offset can't be larger than what would work
> > for the 48 bit case.
>
> Agreed but should not this rationale also be added in the commit
> message as well ?

Sure, I will update this in v2.
>
>
> >
> >>
> >>>
> >>> Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
>
> Correct commit to be attributed for this fix.

What commit would you like me to point at? I selected b6d00d47e81a,
because it introduced "ARM64_VA_BITS=3D52".
Looking at git blame, ARCH_MMAP_RND_BITS_MAX logic was introduced back
in 2016 in 8f0d3aa9de57 ("arm64: mm: support ARCH_MMAP_RND_BITS"),
which is before "ARM64_VA_BITS=3D52" was a thing.
I suppose that there's also 3cb7e662a930 ("arm64: Kconfig: Fix
indentation and add comments"), but that's just some whitespace
adjustments.

>
>
> >>> Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
> >>> ---
> >>>  arch/arm64/Kconfig | 6 +++---
> >>>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >>> index 748c34dc953c..38e0bac567f5 100644
> >>> --- a/arch/arm64/Kconfig
> >>> +++ b/arch/arm64/Kconfig
> >>> @@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
> >>>       default 24 if ARM64_VA_BITS=3D39
> >>>       default 27 if ARM64_VA_BITS=3D42
> >>>       default 30 if ARM64_VA_BITS=3D47
> >>> -     default 29 if ARM64_VA_BITS=3D48 && ARM64_64K_PAGES
> >>> -     default 31 if ARM64_VA_BITS=3D48 && ARM64_16K_PAGES
> >>> -     default 33 if ARM64_VA_BITS=3D48
> >>> +     default 29 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM=
64_64K_PAGES
> >>> +     default 31 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM=
64_16K_PAGES
> >>> +     default 33 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52)
> >>>       default 14 if ARM64_64K_PAGES
> >>>       default 16 if ARM64_16K_PAGES
> >>>       default 18
>
> Otherwise LGTM.
>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

