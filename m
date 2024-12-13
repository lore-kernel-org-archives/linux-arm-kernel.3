Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CD3E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 07:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWx5Woizj4SuX5zdBNdSUv7wj+77jJcT9EoU/0DPYfw=; b=NkBVZQCH1odxoR55u6gNDBYn/e
	QghYq5od1S72RSe09L7pskTeNCqAuGHRB8grLYmIZxWgKpCXRQXmqOKRuHu3IgahhRp9UF2JZ/1L6
	9RuhNZhqTQvoHxUh/VJpiZlH+TIxCpfjQ3XCv+rA1lOdNj4kn5BV2A6ddXZ8ex3mjN1Jn+i01XU0l
	no3WLFwQYXbyRTJpK0rmBpxjM5uxxGvYMlii5Tj4iyHlZmuYv1jMyNDu8aiBuFADgn8cQitGkLbd0
	YVx/VpfZeYYS1x/NHo4Efu73XTH3JeyDtrCbTvhrUq7tr8m1VF0LizfHPXpHjhHFxRdN/ZykM4NPT
	XOuD5kkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM09n-00000002yRq-1LRp;
	Fri, 13 Dec 2024 07:32:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM08h-00000002y9Q-3mvz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 07:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3F57A42746
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 07:29:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FA6C4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 07:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734075066;
	bh=udmJv10fh2CLm5vULvFSSNcCm4a1l5ZQCzEqs4YICZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=phJ6FlsM+IaC34REExBEOUL242wFqNaeCY/mrBFMCY0YmRpEB2S1jRvH3BsbUcXFj
	 FShyPtKaiLwZZEZR7wJQJpHTBQH7YSZoaaUjRvj7S+Sfhr1L98WQh57BbpGs+VA83Q
	 1kyrVeNbXsv0R47xcd5chaxhyRfiHU0hsUO84nqOteauDx5X8RZY4gpjxvjwyA9jMc
	 LYZ8lZcLMMZ3hLOh3lAZg5eCMHCBVhEzJ2pP27/JHTgkOfuny0KK5qx5T3ZQJ8gEl1
	 vurVjkF+ZwO7t+4xceoq/39T4I7YuVfJcxxULFtIiG+olA/KyZ1a48j9Wh63q+WyLl
	 Kq8ti7VvuQXeg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3022484d4e4so15367691fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 23:31:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJB0qz/V5C7fAi5cawv+g433e5SS7pXBGGuMkDeoh/ZJMvq1jWJubqZv9UdmqH4akF9Tr9eT5FXqRu1Tn941hg@lists.infradead.org
X-Gm-Message-State: AOJu0YzKvLYfg1qhDAglCTGSMvPpc2K/50YDsbQPHNFfgpGK/VA+AF16
	C6IynpjMGM4RlBoaYgl3YCikZvrv8UV5lwwlHw0zWwvI+ZsNrcEXvmH51T4a+VCC/oMxrdIYD0Y
	sjiAogqerKBPG85FGCJ+FAp38RTo=
X-Google-Smtp-Source: AGHT+IGBs51p6Bepaag3aknYx0wW3tY5m4W/Acd5iLX/msn6Rdi9kX6VTipTRzd+zf4QYDRmuU5cV+2MTWapuGcBfnw=
X-Received: by 2002:a2e:b8d5:0:b0:302:1fce:3956 with SMTP id
 38308e7fff4ca-30254423248mr4605551fa.4.1734075064542; Thu, 12 Dec 2024
 23:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20241212082426.4110-2-shijie@os.amperecomputing.com> <20241213053049.7592-1-shijie@os.amperecomputing.com>
In-Reply-To: <20241213053049.7592-1-shijie@os.amperecomputing.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 13 Dec 2024 08:30:53 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF=1Hr9G4ZjnEVzJ1snn0V4L-=+bMU4bn=m0UbYLyBqGA@mail.gmail.com>
Message-ID: <CAMj1kXF=1Hr9G4ZjnEVzJ1snn0V4L-=+bMU4bn=m0UbYLyBqGA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2 fix] arm64: refactor the rodata=xxx
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com, 
	corbet@lwn.net, patches@amperecomputing.com, cl@linux.com, 
	akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org, 
	xiongwei.song@windriver.com, inux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_233108_074152_A9CB93BB 
X-CRM114-Status: GOOD (  24.12  )
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

Hello Huang Shije,

On Fri, 13 Dec 2024 at 06:32, Huang Shijie
<shijie@os.amperecomputing.com> wrote:
>
> As per admin guide documentation, "rodata=on" should be the default on
> platforms. Documentation/admin-guide/kernel-parameters.txt describes
> these options as
>
>    rodata=         [KNL,EARLY]
>            on      Mark read-only kernel memory as read-only (default).
>            off     Leave read-only kernel memory writable for debugging.
>            full    Mark read-only kernel memory and aliases as read-only
>                    [arm64]
>
> But on arm64 platform, "rodata=full" is the default instead. This patch
> implements the following changes.
>
>  - Make "rodata=on" behaviour same as the original "rodata=full"
>  - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
>  - Drop the original "rodata=full"
>  - Add comment for arch_parse_debug_rodata()
>  - Update kernel-parameters.txt as required
>
> After this patch, the "rodata=on" will be the default on arm64 platform
> as well.
>
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
> Add more descriptions for "noalias":
>   It is not a security feature yet.

Why did you add that?

How do you envisage 'noalias' becoming a security feature? The point
of 'full' rodata was to harden the read-only regions in the vmalloc
space against inadvertent modification via the writeable linear alias,
so 'noalias' is less secure than rodata=full, and should be documented
as such.

> ---
>  .../admin-guide/kernel-parameters.txt         |  3 ++-
>  arch/arm64/include/asm/setup.h                | 27 +++++++++++++++++--
>  2 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a22b7e621007..f5db01eecbd3 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -5901,7 +5901,8 @@
>         rodata=         [KNL,EARLY]
>                 on      Mark read-only kernel memory as read-only (default).
>                 off     Leave read-only kernel memory writable for debugging.
> -               full    Mark read-only kernel memory and aliases as read-only
> +               noalias Use more block mappings,may have better performance.
> +                       But this is not a security feature.
>                         [arm64]
>
>         rockchip.usb_uart
> diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
> index ba269a7a3201..0ef57d19fc2a 100644
> --- a/arch/arm64/include/asm/setup.h
> +++ b/arch/arm64/include/asm/setup.h
> @@ -13,6 +13,29 @@
>  extern phys_addr_t __fdt_pointer __initdata;
>  extern u64 __cacheline_aligned boot_args[4];
>
> +/*
> + * rodata=on (default)
> + *
> + *    This applies read-only attributes to VM areas and to the linear
> + *    alias of the backing pages as well. This prevents code or read-
> + *    only data from being modified (inadvertently or intentionally),
> + *    via another mapping for the same memory page.
> + *
> + *    But this might cause linear map region to be mapped down to base
> + *    pages, which may adversely affect performance in some cases.
> + *
> + * rodata=off
> + *
> + *    This provides more block mappings and contiguous hints for linear
> + *    map region which would minimize TLB footprint. This also leaves
> + *    read-only kernel memory writable for debugging.
> + *
> + * rodata=noalias
> + *
> + *    This provides more block mappings and contiguous hints for linear
> + *    map region which would minimize TLB footprint. This is not a
> + *    security feature yet.

Better replace the last sentence with

"This leaves the linear alias of read-only mappings in the vmalloc
space writeable, making them susceptible to inadvertent modification
by software."

