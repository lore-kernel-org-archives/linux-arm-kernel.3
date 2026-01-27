Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2537D2D8F7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EBUZmVPsnsB8ixDUCZllJVpzBsiagbE8Q+WzxcyOsI=; b=F7U0Y3YuGxJGO+J2VsDiVV1k+w
	mR6f4pu7XydipOA3vflQZ5vgxcUO48DyJRkC/Ev3/RrglXo85ZKn8PE7VHe32vDm+7LMBgkhSAbsa
	099JsOidnLNPRmXwUMPHwmlf49LYjuXmiUrSzZGl/TeDviXk8uqiEu10vb554M4CDlmCwRYyyu8HV
	/k6nuAtZoDxQyAE3yGFYT9TFf5b4QwLuJgr7CFEgy8DvjEsCPq6stOald6Bwya2qRDopiMcTxwny4
	dQdgv2QvcCbSX0TYVQYaqDh+8FywhIjuQqdXpUbipZTUXRTIWH6rAPalq13QaAUGWjmWtDgvLVmH3
	cXo7o2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgf4-0000000E63r-3AyV;
	Tue, 27 Jan 2026 10:51:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgf2-0000000E63L-0Dhz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:51:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A63441858
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4FBC2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769511063;
	bh=LjgsQOJovIj6KZEeW7i2qRMeYJMGaije8moXkQ/PYcw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=a5475+VghIiuZPfyL4qa8VEXp5Ctve9VCrBl0ynvHPa9Soe8QHdgbJDBjvvOd9fPV
	 FWoFKPHDIba4gYnqgqjgjnsc7KI2ajUkOuBt0eLQaqb7M7aHBDZjg6rSqHQofHt2TW
	 VHGfJvgGGNlEEZLF3avHx2TsbknHS29mhuX+L5y/Q0YGMYtcVStxk9OrXBHFqvdklV
	 bm/E4KbCxg8ORLC0ex/nPTdTJv6QC/faaTYvDfvx9BOf/XWXD539jwxrUzudsPcJ7T
	 p1R+rfWwERfhfTJ5wZfPfBebJARd7btoM+OE4XqP7DpssUHFBPenWQ53xoWoI/wstJ
	 zgUfDHldee6Tw==
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3532aa9a77eso2535512a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:51:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwio3i5Rua4n86kFbnEi8Rn8i8xHPtYI8/7Bz8+kFfeuNTFU09lx8QMT3dm0BBSLKEjmgg5gjC3GWZ/sqIx1Yj@lists.infradead.org
X-Gm-Message-State: AOJu0YwHNMUwnxrAoWdNfGL4b+NXBGNrKLvDZT0FXGT/OwwXuBoNTuAr
	3FqTKSJBKeVMKUfkBviyPx8KgqpILFq3du/5IuADfbKoSB3IteRaCIaEGcB+kVjwF8ozUUcxod9
	BfL+QVMoumxHmIzMtnWzZ8sFS0riK4Wg=
X-Received: by 2002:a17:90a:f950:b0:340:f05a:3ed3 with SMTP id
 98e67ed59e1d1-353fed75832mr1836496a91.17.1769511062886; Tue, 27 Jan 2026
 02:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-13-ardb+git@google.com> <3d59a8d9-a382-48d8-b79c-f5c23e86c1b7@arm.com>
 <CAMj1kXF4k9EstLkxdNje_rwTehdu2MYvyh7n+4GoMWNcjcHYcA@mail.gmail.com> <427d39c1-ab02-4a66-a0ba-d4fb98ab72d6@arm.com>
In-Reply-To: <427d39c1-ab02-4a66-a0ba-d4fb98ab72d6@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 27 Jan 2026 11:50:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGJYXhvt6WUR1ApyVO2NHb9tgNPUX+3+S9nKGmwKPE3rg@mail.gmail.com>
X-Gm-Features: AZwV_QgG2vC9viPMpZzzM08HnseaBerBb4x2QliQhq0LkVgd_A_JAHiwyi_srWA
Message-ID: <CAMj1kXGJYXhvt6WUR1ApyVO2NHb9tgNPUX+3+S9nKGmwKPE3rg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] arm64: Move the zero page to rodata
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	catalin.marinas@arm.com, mark.rutland@arm.com, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_025104_129995_A4A97424 
X-CRM114-Status: GOOD (  21.94  )
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

On Tue, 27 Jan 2026 at 11:04, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 27/01/2026 09:49, Ard Biesheuvel wrote:
> > On Tue, 27 Jan 2026 at 10:34, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 26/01/2026 09:26, Ard Biesheuvel wrote:
> >>> From: Ard Biesheuvel <ardb@kernel.org>
> >>>
> >>> The zero page should contain only zero bytes, and so mapping it
> >>> read-write is unnecessary. Combine it with reserved_pg_dir, which lives
> >>> in the read-only region of the kernel, and already serves a similar
> >>> purpose.
> >>>
> >>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >>> ---
> >>>  arch/arm64/kernel/vmlinux.lds.S | 1 +
> >>>  arch/arm64/mm/mmu.c             | 3 +--
> >>>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> >>> index ad6133b89e7a..b2a093f5b3fc 100644
> >>> --- a/arch/arm64/kernel/vmlinux.lds.S
> >>> +++ b/arch/arm64/kernel/vmlinux.lds.S
> >>> @@ -229,6 +229,7 @@ SECTIONS
> >>>  #endif
> >>>
> >>>       reserved_pg_dir = .;
> >>> +     empty_zero_page = .;
> >>>       . += PAGE_SIZE;
> >>>
> >>>       swapper_pg_dir = .;
> >>
> >> Isn't there a magic macro for getting from swapper to reserved? That will need
> >> updating?
> >>
> >
> > Why? This just adds an alias to refer to the same allocation.
>
> Oh yes, sorry I completely missed that. And you've even stated it in the commit
> log...
>
> I'm struggling to see where this gets zeroed though? I assume it must be zeroed
> before the old empty_zero_page would have been so everything works fine?
>

It is statically zero initialized in the image.

> Assuming yes, then:
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>

Thanks!

