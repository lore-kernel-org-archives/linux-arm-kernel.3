Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B37E95392
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4Upu6y9qvUH3XLA76sEOnoii/Bz0yJPZDUENsX5xhg=; b=DFBP/CR6iK4kgfunCVrnlOstiL
	ydAH4eokGILDU29vqkf+oIPHs7vRasfXLRv/Xbcd7SkdWtDrndUDASxk3Hsk2PeauXi3JJqbXxJTQ
	2vn0irbI20XM9Iox7dDHhUrQ1VdJDsAKB2SXQpENZFaB0aM0IcXszDJZEjdYButnlp4B7kCpDp9Hp
	AaZ70l6v4+he9FjHQHDFrUxte5TQ5muOoAYg404E2LlxV7hVHFbd4WCIOl0noovZdxfqTMa815vMM
	Z8Z/H5z+a4nJxgSWk2BGlF/usXR6arqqCYBnj9rAmeKSylCB9gwSa1jobKvRlId0LPkKo8tMXBah8
	mmMezPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncN2-00000008T24-48nM;
	Wed, 04 Feb 2026 12:52:37 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncMz-00000008T1g-1xhy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:52:34 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-566360cab02so4953228e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 04:52:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209552; x=1770814352;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4Upu6y9qvUH3XLA76sEOnoii/Bz0yJPZDUENsX5xhg=;
        b=PxmVN68T3QwHtKu0DfbZFj6/Ho8SkQDSm2XK2S7PE1oKtFbwJsLiqRgyTB2pDWneV5
         cWQKbbqW9tuNNQjrGmJyC/L1gU4+VdPZ5Lr+yY66gUqphvyRMIv7onTYoHoy1ZyKNfcc
         pZ3M8btcEcpRRHe3UMTUbnoWhYsCRd/lsSsnucjsxQT9rBwhPhqvMJmIJ1/RpLbMxjYm
         wpfh0WUSjuHxT1F49AO9LbMYvx+YW6ZrHxSFlTufb6eyst0SJw12BgYAC7pYO+HmQ4FG
         RYgA4XLSHyUt4dFH5Wvb6D/9rilU8nrJQRb6tJ+iwAg5aYjmXAO3gX3z4i94O/Y9+W5v
         w+fA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Q39j5T7cn91lpxj0/GAXlmNiCY1mt1K/HqxSL+BJSIq9/FTtpkh9ItDoWj/q9x2KWivdzGzU1bfLAnUotyjY@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ+FqNNfFZIZrb+mkYY43yN3Mk9tr9RexXgUR0mM8nuTmW25PM
	7Y0ivD1ITa2zjuk1iVOX1jn+qaXciTJDZeTP7tYrcvoyPsRXyMeDiE/bd5ijtcZB
X-Gm-Gg: AZuq6aLs4DT8Hzr4Ghdk6ez4uNQH3iKvqmlQTT1TnbVbhw4++5Irj4nO8zst5Y6PJeG
	z+ymHOLd+/zdZrDIITumUOl39lip5+VkvWQQ0eLVPRyuOBgVWmnUTp7WbzCdSPxwjVopLXt6xYP
	6um4N2qrw2jJNVzucEerHgZdkVStyhWFLmQzIaEVaWpl84XwNqts5rPpj+qoYouI58gNZL5lQ4v
	leJ+mlaimAilnHuE9Fw+5B/hvQyfZFzvu2AGCn8kWKBh78L4OdlGG9SkZLOIXKsZdKarwzNdU7e
	gq2mLEez75/ZKwZprFeVrlOKnAc4Pf5+IGaJnBTgEaIrJuUkCv6sJ2FQFoXe38tSUGogCmUWywb
	/x8BcyHUyGqB/FRkZlIM0XY4vPJz0+P5+erwwaoZ2lxPZPa4B/qBme1GSUKbonG4D/OJUebZ+EW
	fjD7Y/PIs8S/9nD6KGn3Clv6UJ/F3imsE9txYqvDE6UxocdXIu
X-Received: by 2002:a05:6123:14f:b0:566:2568:df1c with SMTP id 71dfb90a1353d-566e800fd1amr905742e0c.7.1770209551653;
        Wed, 04 Feb 2026 04:52:31 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-566e80f4bffsm1021750e0c.6.2026.02.04.04.52.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:52:30 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-948aa4f524dso2186198241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 04:52:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWKFTwfMW/3skzaYo7BuHMtAad4IZyGkT0qKd98fZNwwxVew3x3+6zt/dkyS6ywTgbTuPEZpy2fs+HY3mojt27@lists.infradead.org
X-Received: by 2002:a05:6102:390b:b0:5ed:d33:a65d with SMTP id
 ada2fe7eead31-5f9395c400bmr1090817137.34.1770209550435; Wed, 04 Feb 2026
 04:52:30 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk> <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk> <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org> <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
 <aYKgaDtb7Ba09Paf@shell.armlinux.org.uk> <CAMuHMdX99kB5oDoxy8=yk_D8g=bCwwUON-uMkT7zSPq0=DASVA@mail.gmail.com>
 <aYMzk9cIgD-XDujY@shell.armlinux.org.uk>
In-Reply-To: <aYMzk9cIgD-XDujY@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Feb 2026 13:52:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW17KB4ru+YQ0U3+a481scMuM=Gvksw2crkp2PBfRDhzA@mail.gmail.com>
X-Gm-Features: AZwV_Qh3HhCCmTszwYH9EfGsO5meEpYrcbygMkHzZOyRgDs3cMtUnqo0qcnzYTA
Message-ID: <CAMuHMdW17KB4ru+YQ0U3+a481scMuM=Gvksw2crkp2PBfRDhzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Eric DeVolder <eric.devolder@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_045233_674242_D06D9674 
X-CRM114-Status: GOOD (  54.52  )
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

Hi Russell,

On Wed, 4 Feb 2026 at 12:55, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 04, 2026 at 11:53:30AM +0100, Geert Uytterhoeven wrote:
> > On Wed, 4 Feb 2026 at 02:27, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Wed, Feb 04, 2026 at 01:36:29AM +0100, Linus Walleij wrote:
> > > > However, I think it is a thick requirement to put on hobbyist
> > > > contributors to go and write entite boot loaders from scratch,
> > > > I think it's a fine requirement to put on Qualcomm or Renesas
> > > > paid maintainers.
> > >
> > > If we're talking about older boards, then why have they only recently
> > > became a problem, when, presumably, they've been working fine for a
> > > decade or so?
> >
> > These boards may have been working fine, given the right "legacy"
> > kernel config options were used.  However, some of these option make
> > the resulting kernel limited to that platform or even to a specific
> > board (e.g. when CONFIG_CMDLINE needs to be used).
>
> The 32-git ARM kernel has had a way to pass the command line to the
> kernel from the boot loader since day one.
>
>         First it was the struct param_struct.
>         Then it was the ATAGs that was introduced pre-git.
>         Now it is DT.
>
> The kernel retains code to parse all three methods of passing data
> from the boot loader to the kernel. The decompressor has support
> for merging the ATAGs into the appended DTB, which includes merging
> the command line into the DTB.
>
> Without an appended DTB, the pointer to one of the above will be
> passed to the kernel, the kernel will figure out what it has and
> parse one of the three ways, and use the command line there.
>
> The only case where CONFIG_CMDLINE should be used is when there is
> no command line passed, no way to change it, etc. At that point
> there are two options:
>
> 1. Augment the kernel's generated FDT with the command line node
>    and load that modified FDT or append it to the compressed image.
>
> 2. Use CONFIG_CMDLINE, which means that the kernel _will_ become
>    specific to the platform that needs those arguments. No getting
>    away from that in this case.
>
> Maybe you haven't explained the problem very well, but I don't see
> any issue with this.

I am fully aware I didn't explain it sufficiently, but I don't remember
all the details.  The important part is that I never got the kernel
commandline passing from U-Boot env to the kernel to work on KZM-A9-GT,
until after I had applied "[PATCH v2 1/2] ARM: decompressor: support
memory start validation for appended DTB".
And without that patch, my current .config no longer boots.

> > The KZM-A9-GT I "need" this for never had upstream U-Boot (I don't
> > think I ever had any U-Boot sources).  I can boot a shmobile_defconfig
> > multi-platform kernel[*] fine, iff the first patch is applied.
>
> So, what have you been doing for the last 14 years to boot this
> platform (merged in 2012) without this patch?
>
> Please explain:
>
> - how it worked before - I want to know how the DTB is passed to the
>   kernel, what information is provided from the boot loader, whether
>   that gets merged into the DTB, etc. All the fine nitty gritty of
>   how it worked and what doesn't work, what the problems were etc.
>
> - what changed (it sounds like you want extra features)
>
> - why (in detail) it doesn't work now.

I'll add this investigation to my (too long) list of TODOs (so I may
or may not get to it this decade ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

