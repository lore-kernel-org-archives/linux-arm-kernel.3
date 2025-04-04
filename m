Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704F0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmIk4Bf8JYic5jKt2h6PG9WM5KVS12ByqS/whgCHN2s=; b=5F7br+5RCcgM6QcoDATI9xw8Eb
	8hmgzIYaqCKynmoPHRB4hkFqychol8PhS+zcClzmIGVJ/p1JCuVeSbQwxf0U4UFEy4w02Tar0L/gu
	fMvn7NXvNetktzzAeQw7yF8Agjkjxztc56azaw3P5UVHK0WYdH7E+f3eQLO5nc4T5k5VKCzx1kogK
	PwRnOK1H/+7d8O9u9lxy7xkVFOUOU3oJpGvGDKb1uIn1cpa5EWRELPMMYrfLVpJxXAFdHLFfjwCGr
	p95RulFWhKISPTdcS7vnJF2JxF+bqy3jAIT8RxIU7iyuyivS0mRsUC1mJ98Zfe1AxFmqYzbOOioU3
	nXsofCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kES-0000000CKTM-2Nj5;
	Fri, 04 Apr 2025 16:49:28 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kC2-0000000CKBs-1JAV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 16:46:59 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so4303140a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 09:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743785216; x=1744390016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmIk4Bf8JYic5jKt2h6PG9WM5KVS12ByqS/whgCHN2s=;
        b=zFVo8ear5/toa+29ufuH2OShf26ls3gd4h5n3NHmLl+T6V6VI9Yw6Hv2sSpT3Zdm/k
         T6X0Lz+CtkKRS0Tro3tuDoUfUIFe75kBylP8TyQs8N2aVk9Ti4AZsJqa9B11vccxHNNY
         j8YxGK9bcJRNYuxg+NI47B+QpHhUOggbl5D9ge00HzxyZuHul15/SyBh/OGDnxvXv+6t
         j5cg7Kg0NsF4D7+T9HoIj6OL1bKTyw76HAgw9Tn6g2ViQsVaQZzE7pY1bZfETQv2+j4N
         YbPAk7I4/BNlt9TDRmJ+BmIAuhtkLI/l6Ja3DxWg5TmelRNdD2Fjg3NE+lQT6h7K/v1t
         Uz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743785216; x=1744390016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmIk4Bf8JYic5jKt2h6PG9WM5KVS12ByqS/whgCHN2s=;
        b=VkraKtUtbM1lncepaYhRM/cVxKd1R5iGQvdN4vPun3xxR+jo7vFrQHAYIHSDiZgHyd
         yR6BpGLl5pWZQS0qZjGoJgtN1OD/+6WJXHKEJHTAMF0TRVgtP9771YJylqQWcCx3rHX6
         0uauVXawmqEOXBXs7Z6u+IoZ7EfXX5Lr+i0X6QZ5F3IiX5lmkad0+r85whOp2ok0HPs0
         3O+2UgRFDCvceMZmEW+Ku1EBRQ/GsbTpHorRI1jSGxrkKwIxa63QRbGqgWI3wNmqroOX
         VAmfseWY8n60xDsnKphzHjU8gJLkInAR5kVgilgeQavp7I/8hRayztO6NTBV0RSQgLf4
         PyVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgWPyk+xIexhTDzY+t+8IZUp5/5tOiQZM0Fjc3V1VMt70Cj8j8H2Zo5u7vsEbFgJCFcWiYnYmeYpryq6/oxKQ9@lists.infradead.org
X-Gm-Message-State: AOJu0YwMhdt2SvlA4AemZq9XZpnbvhMbL9Woxlv+QdzNKSGG2uxrAFTa
	WVU040zZjHb9ahOzpuanQyrkEoxQk256suT74M+VkXfg88T+AvD8trwwmizB5mxmpNytuRrlpT1
	HNzQqBtQtZcXfoqQME9LmPPDyFlWA0+WwNFd9OdHL0VV/8u7GkjqyRWQ=
X-Gm-Gg: ASbGncux7xwGZn9md5tK/ebfj3DdbPrbvzMdoHPPzQctyhQ4RguWjLllVKwSLH35n0G
	EjrCCO0VniTjcs/f7UQDG9F0VxU4HWK9JXUBNrX7+q4i8BbOh/GokCTRFYi1NACcFqWo26AwFLy
	9GCGwlJ1ONCjiMdGH/tsFoO7NAxb8x
X-Google-Smtp-Source: AGHT+IGZvJrBZhWim227+KHyeF5pHjecYkebdfC/oO+T1+f76z1K2lWjW4Sj9M1gPKhICcaBLgKlmCPR2Qri8rGuiyw=
X-Received: by 2002:a05:6402:501a:b0:5ec:7909:1a with SMTP id
 4fb4d7f45d1cf-5f0b3b90213mr3475628a12.12.1743785215689; Fri, 04 Apr 2025
 09:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250403183638.3386628-1-korneld@google.com> <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
In-Reply-To: <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Fri, 4 Apr 2025 09:46:43 -0700
X-Gm-Features: ATxdqUECnVZpTf68QOEHrUaEwF1cbhB2o9BXMstyQIh2XA_NCs4lPmpJHqpR2eQ
Message-ID: <CACF_fqnevOo9NSRwDAh7KVQZTHTkP0pc2NKEXrWFapMYLf0Wkw@mail.gmail.com>
Subject: Re: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steve Capper <steve.capper@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ssradjacoumar@google.com, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_094658_367372_21FE44FF 
X-CRM114-Status: GOOD (  26.41  )
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

On Thu, Apr 3, 2025 at 11:46=E2=80=AFPM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 4/4/25 00:06, Kornel Dul=C4=99ba wrote:
> > When the 52-bit virtual addressing was enabled the select like
> > ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> > Because of that the rnd max bits would be set to the default value of
> > 18 when ARM64_VA_BITS=3D52.
> > Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
> > be used if 48-bit addressing was used. That's because the 52-bit
> > addressing is used only if the caller provides a hint to mmap, with a
> > fallback to 48-bit addressing.
>
> Why should ARCH_MMAP_RND_BITS_MAX value be same for both 48 bits and 52
> bits VA in case the user does request for 52 bit VA via mmap() hint and
> the HW supports it ?

Two reasons really.
1. The whole behavior is controlled through a global knob -
/proc/sys/vm/mmap_rnd_bits. ARCH_MMAP_RND_BITS_MAX is used as an upper
bound for the value that can be set to that knob.
So we have a single setting for all processes. Some might want 52 bit
addressing, others will stick with 48.
2. Quoting the documentation for this knob:

"""
mmap_rnd_bits
This value can be used to select the number of bits to use to
determine the random offset to the base address of vma regions
resulting from mmap allocations on architectures which support tuning
address space randomization. This value will be bounded by the
architecture=E2=80=99s minimum and maximum supported values.
"""

I suppose that it's legal for some calls to mmap from the same process
to request a 52 bit VA, while other calls will want only 48 bits.
Because of that the random offset can't be larger than what would work
for the 48 bit case.

>
> >
> > Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
> > Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
> > ---
> >  arch/arm64/Kconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 748c34dc953c..38e0bac567f5 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
> >       default 24 if ARM64_VA_BITS=3D39
> >       default 27 if ARM64_VA_BITS=3D42
> >       default 30 if ARM64_VA_BITS=3D47
> > -     default 29 if ARM64_VA_BITS=3D48 && ARM64_64K_PAGES
> > -     default 31 if ARM64_VA_BITS=3D48 && ARM64_16K_PAGES
> > -     default 33 if ARM64_VA_BITS=3D48
> > +     default 29 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM64=
_64K_PAGES
> > +     default 31 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM64=
_16K_PAGES
> > +     default 33 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52)
> >       default 14 if ARM64_64K_PAGES
> >       default 16 if ARM64_16K_PAGES
> >       default 18

