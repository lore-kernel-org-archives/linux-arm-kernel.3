Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0202FC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXmOU2mBSnJ1Q/G80oE+sQEi5M/NGyL+TQUbVq1jkto=; b=dFvPaAsoSQEVslS+NM01Zhw3DQ
	rENsj3z8FZpAa/tt+gp0ga3+BgX/tPPPNyPIyfV7nfvPgGPNm8p7QwS7CT0CftBkWQnKd3Qk2/nk3
	hpqF1vWDU1iredAvUQxZshFEz3qBWYhQqKoAnlVMiCfwjTomEkPjqWtytHJK6RO5Jy+7zUveitmed
	UB+vPvwLGpprtfXNPV0ja3HbzM3bsHgXrEGwcnM9QYjCAwJwt5JXpDUiKfuUdRFB0g9RWty9JT80x
	6ZsZeJ+h3swcUCh+TSiMOK+J5CJp9csia9Gknz1aNOGxN2HkggdMqBF0LuVQlRKx6Dz9KbIEWxlzk
	FUwYaP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EUW-00000000yfI-2dl5;
	Mon, 14 Apr 2025 07:44:28 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ESd-00000000yJH-3C8m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 07:42:33 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso7472741a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 00:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744616548; x=1745221348; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXmOU2mBSnJ1Q/G80oE+sQEi5M/NGyL+TQUbVq1jkto=;
        b=GGw3EZ8vx7ZNBKGAX9hXSt4fjtC54LT/FS5H2nlyMpqNyLmUsozeJVJPs5lZV3Kj7N
         QbBcGkWNj4NbRaKNa/5wJUPNE4cyI36qT8qwJnlTTy7b9ZQfwOTyJv0QiW5gocc3F2A7
         VSeIG3dhFdpdksgWmXRO5SvlnKiJVzaltRnx8Wl77Rq5EhvrZG5h2zGgom8TCoTj9pvp
         eiHNWwZHZGll9j5X9qLm+Fnp3kxenU1g0FyyfvnP/K888CFGd6R3Xu8urf3SrZ7fQ6MY
         jkNsOnG8Ih8HTyoN7Vq7y2Uy9Ofv5Q1ZA8lrHZjfB4vuv088pTRbvY5A2/LNPgB0dB93
         2JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616548; x=1745221348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXmOU2mBSnJ1Q/G80oE+sQEi5M/NGyL+TQUbVq1jkto=;
        b=e+BTyAR5CtfZJX3P578X+fSP78ir6srztjaCYjBC8PDTwK/+YYXWAugehWvH12GNj7
         3fGV5PzvSE8V+pEaYsQLQZO10h/ux0ZmYNC7e1DrmTn1Ocu+nUaV3GkZv/BjIyM0eGf7
         Fha8XO0RvH9iSUvcPbmhwsBg8vutEED+XcaZhfJwDQo31HAXDKRKxI00ttH48sduK2bg
         TOoqr4uv42wy26oMDIpMdrfrZ6g+kRCGLw4wWzItuOaDKC/Te6rRGi1lWLQNT7I+XY4H
         0B8fQK7dGb/dlELH0/jlgA6n+QRGTB+r2avjCSN22LfpkvTIh1MrDEwuehsGSqPAWZqf
         f6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4/vyKXxtfmk0ASE3rZpwBGBGt9x/dmLqmkLSCOhdTngwm4Gq0YmERvxA8De2LlQHgyKFLJjZ21mwOICskkABc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1H/OEYAw2RrMdiF3aSDTeNh/H3iSaqhCluc+7+3xgDhenIFME
	e/Umg9m9YVIXJCx7I+OrhRs85tmQwkd2VjMLf0Fi4/G5KdxupZd3CBchA/7iyw1bunktRXH0eRB
	/oeKYxLeBlpzLk0H2flDd4sm8hqNfZGCazx0K
X-Gm-Gg: ASbGncvgmZWWgbCbKllI0Gy6sifi1q76DyhuHr/2D9Yz1JZ/clE3L3VWjq/BwgrTyrV
	rr+xFlPbuQLaEE8tqAdxOBTJLv6IyfzEpMYGf70tkdVpVZptBh78CSf50cnjzDosM1jzUVoIalz
	jNcK00HxjSd4PJ2mjfta+Ne3A3SUrTywuRU3KYS+3xU7RSMBPL
X-Google-Smtp-Source: AGHT+IH09efJ8Do6RKQnRVYr9V5LLKXMMFfz2m0gjC+zCWdS733LZPt7VwiJ8EFz/qGyl/AVQsVsgaoO2y2QWrRxPjs=
X-Received: by 2002:a05:6402:5110:b0:5e7:8827:2c33 with SMTP id
 4fb4d7f45d1cf-5f36fb8e0femr10232874a12.11.1744616548318; Mon, 14 Apr 2025
 00:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250403183638.3386628-1-korneld@google.com> <38049b58-a504-4223-9f6d-537609931fb4@arm.com>
 <CACF_fqnevOo9NSRwDAh7KVQZTHTkP0pc2NKEXrWFapMYLf0Wkw@mail.gmail.com>
In-Reply-To: <CACF_fqnevOo9NSRwDAh7KVQZTHTkP0pc2NKEXrWFapMYLf0Wkw@mail.gmail.com>
From: =?UTF-8?Q?Kornel_Dul=C4=99ba?= <korneld@google.com>
Date: Mon, 14 Apr 2025 09:42:16 +0200
X-Gm-Features: ATxdqUG4qM2qSi7P61VxUS_DpHbalmw0jUa2CR-GhJDUE8W1x3Gplsn-A1ToMew
Message-ID: <CACF_fqmzULKuq0C3FQe5enmu4A2UQYUeC5rrznM54uiQDCrsHg@mail.gmail.com>
Subject: Re: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steve Capper <steve.capper@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ssradjacoumar@google.com, 
	chromeos-krk-upstreaming@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_004231_822959_FE9DBAEF 
X-CRM114-Status: GOOD (  32.87  )
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

On Fri, Apr 4, 2025 at 6:46=E2=80=AFPM Kornel Dul=C4=99ba <korneld@google.c=
om> wrote:
>
> On Thu, Apr 3, 2025 at 11:46=E2=80=AFPM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> >
> >
> >
> > On 4/4/25 00:06, Kornel Dul=C4=99ba wrote:
> > > When the 52-bit virtual addressing was enabled the select like
> > > ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
> > > Because of that the rnd max bits would be set to the default value of
> > > 18 when ARM64_VA_BITS=3D52.
> > > Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that wou=
ld
> > > be used if 48-bit addressing was used. That's because the 52-bit
> > > addressing is used only if the caller provides a hint to mmap, with a
> > > fallback to 48-bit addressing.
> >
> > Why should ARCH_MMAP_RND_BITS_MAX value be same for both 48 bits and 52
> > bits VA in case the user does request for 52 bit VA via mmap() hint and
> > the HW supports it ?
>
> Two reasons really.
> 1. The whole behavior is controlled through a global knob -
> /proc/sys/vm/mmap_rnd_bits. ARCH_MMAP_RND_BITS_MAX is used as an upper
> bound for the value that can be set to that knob.
> So we have a single setting for all processes. Some might want 52 bit
> addressing, others will stick with 48.
> 2. Quoting the documentation for this knob:
>
> """
> mmap_rnd_bits
> This value can be used to select the number of bits to use to
> determine the random offset to the base address of vma regions
> resulting from mmap allocations on architectures which support tuning
> address space randomization. This value will be bounded by the
> architecture=E2=80=99s minimum and maximum supported values.
> """
>
> I suppose that it's legal for some calls to mmap from the same process
> to request a 52 bit VA, while other calls will want only 48 bits.
> Because of that the random offset can't be larger than what would work
> for the 48 bit case.

Hi,

Do you have any further comments?

Regards
Kornel
> >
> > >
> > > Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
> > > Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
> > > ---
> > >  arch/arm64/Kconfig | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index 748c34dc953c..38e0bac567f5 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
> > >       default 24 if ARM64_VA_BITS=3D39
> > >       default 27 if ARM64_VA_BITS=3D42
> > >       default 30 if ARM64_VA_BITS=3D47
> > > -     default 29 if ARM64_VA_BITS=3D48 && ARM64_64K_PAGES
> > > -     default 31 if ARM64_VA_BITS=3D48 && ARM64_16K_PAGES
> > > -     default 33 if ARM64_VA_BITS=3D48
> > > +     default 29 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM=
64_64K_PAGES
> > > +     default 31 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM=
64_16K_PAGES
> > > +     default 33 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52)
> > >       default 14 if ARM64_64K_PAGES
> > >       default 16 if ARM64_16K_PAGES
> > >       default 18

