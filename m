Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B85E83F1C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjQ6qUG2HLYgzsYnXuZnUfhc6ZoDRghKpOikRD3m81Y=; b=Sn3q35EVfmaLM2vx+vTNC8bR+J
	VE0TAvn7QzbOHO4zScf5YzBXORaUcwdVJJT56slMSnUDsycSW8pOiXBNlcQJAqh4KAsV4MFaLbbxx
	hjuXibeVJXFaLTyq8hTsLnQVYju+EdOXQvsJYLMHHf04VqkV3itetsLR/PmbqUOhyWruJogNSkhhG
	RTpfr15pH8vmYNL/obb2edNfRqBITop8DYY3kcIatA3NyL9/HiLzdnuER1YpBT51OK+w1XWPZ6Y82
	yuv+9iqojC4Rtxbp4W4fTHN0TxhO7tTthSz9V+ehkOVttED7W1MKL0+4r0n3SWN88IRGIT2UT0838
	PB7JyD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndPb-00000008YYt-17DB;
	Wed, 04 Feb 2026 13:59:19 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndPX-00000008YYU-2cmZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:59:17 +0000
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so5366522a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 05:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770213554; x=1770818354;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjQ6qUG2HLYgzsYnXuZnUfhc6ZoDRghKpOikRD3m81Y=;
        b=PKR86x5pfwz7QOCYQAFJYkynEsvSM0bqTG3VdapNZzdyM/3MZuraxo84TVEpVoeaRN
         9CnDMCUfP55XyHdz8Fb5FD/DCkrR8MM+Cyexrb0SAoRuzG/02+sR01E5tgvjDJNtrV3+
         UT07rH+x714s0NaN84i0vY4I9NC2WdBhP6I4uIh4My85rY4w1qJUdrnIyLMeAcMVklPq
         OELTh+BZEMxp3ffY1uHmefHdXJUL24DugWkt+YfkaI0iIbjnx5VCZMftsgq2Zu+FZ6+F
         1+s7KLc/KL5U139ov3SdXObODqmFjhKGk25wO+uLZ85r4M1/XcPJFCQBQEkgGtHjWddX
         iCtw==
X-Forwarded-Encrypted: i=1; AJvYcCWafBb77ra4Oe0Uht6q4YgzjgEvpOne+5BuZenOSaEVpVwIMH6cuOZKLNWNlJ88a1PBHhfNPxaID7AKaeI+AkNw@lists.infradead.org
X-Gm-Message-State: AOJu0YzVp9Muv/V2Fpp5yiE9yhDyFKVZKZBHXZFuSxGjyWFcSBIBmccj
	nO1aJhlVsLaLcF9M7MKtrkM2pZONl8efxtspkRrn2JYOeYYQ4p2Kuc4iklra4mm/
X-Gm-Gg: AZuq6aISMTQqHwJlRhxT9STrcTR1ZEuGg2IiXiy5POCABnXKvpiqI8HQaQN+Obe4RXi
	Qg42RRwKUsHrHdDr/zOm5bAHfPBWTx17yMya0Gg/7Mm0l8J/o2mHDQLeNHE80uprJqIzYkMp5Ur
	hn08Tw+sBJYpnjz8SVqc/n0UeJlPboBhdG4m88lxSxjYMdxVzYJK+XhqlIM7/l/O5VfKAd0uBz0
	RBU5uR9FHiaDgh17KLmv8Zuikzbv++x5yNjQeKSf9AMVHYs1E2EQ2nsyWMusOXrEHlMcpvAzoaj
	Y0shUE4PNU9PUkaORn5F3ND6lKsNXoW1WiVteC1tnKsKRSOBLKvE86Z4P1mr+R4UsgbsaOjPKI4
	OYsS0N8Q7jjCzU9RrRgJrGTBAFdoXFpZMU5Qq6CbzOTVQzQwwjs3+LbJeF5Xqu9Wseh8Z8zM6Sv
	twszYBaY2OQEVaBEJHXrUEJD34rCDA/2WApAsTGVV6tPmXVJkRbqZuoOiy+dxQOSU=
X-Received: by 2002:a17:90b:3015:b0:343:5f43:933e with SMTP id 98e67ed59e1d1-354871938f1mr1882676a91.19.1770213554102;
        Wed, 04 Feb 2026 05:59:14 -0800 (PST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com. [209.85.210.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354872beb69sm1443838a91.1.2026.02.04.05.59.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:59:13 -0800 (PST)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81e93c5961cso5657041b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 05:59:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDisjxpC6K1n9IMqTI0zKTJK0b92T8Qu7eRifbvUQ6zASn6fVXScLxKvDmk1v+sX2oTYeQGe+hcr/6IZYlGAvh@lists.infradead.org
X-Received: by 2002:a05:6102:5092:b0:5f5:5857:35c0 with SMTP id
 ada2fe7eead31-5f9394de26emr865883137.13.1770213145469; Wed, 04 Feb 2026
 05:52:25 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk> <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org> <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
 <aYKgaDtb7Ba09Paf@shell.armlinux.org.uk> <CAMuHMdX99kB5oDoxy8=yk_D8g=bCwwUON-uMkT7zSPq0=DASVA@mail.gmail.com>
 <aYMzk9cIgD-XDujY@shell.armlinux.org.uk> <aYNAAsD6dlMi-35Q@shell.armlinux.org.uk>
 <CAMuHMdWxA5Uq2m5sfiG8=WzqKiEmXA0sp4fYGWOvQwhzubDUXg@mail.gmail.com> <aYNJzbSxfpRza4no@shell.armlinux.org.uk>
In-Reply-To: <aYNJzbSxfpRza4no@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Feb 2026 14:52:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX3eO2P=vGEe2LmPgVa90ZSxP8fxqmW+J-cLPQqwgW0pA@mail.gmail.com>
X-Gm-Features: AZwV_QjvQAenbz8M6GyIuU3AA1rYHVlHp80RpCsN_vKYNyL9vHaPjvqPcHo9OuY
Message-ID: <CAMuHMdX3eO2P=vGEe2LmPgVa90ZSxP8fxqmW+J-cLPQqwgW0pA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260204_055915_692921_02150541 
X-CRM114-Status: GOOD (  74.04  )
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

On Wed, 4 Feb 2026 at 14:29, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 04, 2026 at 01:58:21PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 4 Feb 2026 at 13:48, Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > > On Wed, Feb 04, 2026 at 11:54:59AM +0000, Russell King (Oracle) wrote:
> > > > On Wed, Feb 04, 2026 at 11:53:30AM +0100, Geert Uytterhoeven wrote:
> > > > > On Wed, 4 Feb 2026 at 02:27, Russell King (Oracle)
> > > > > <linux@armlinux.org.uk> wrote:
> > > > > > On Wed, Feb 04, 2026 at 01:36:29AM +0100, Linus Walleij wrote:
> > > > > > > However, I think it is a thick requirement to put on hobbyist
> > > > > > > contributors to go and write entite boot loaders from scratch,
> > > > > > > I think it's a fine requirement to put on Qualcomm or Renesas
> > > > > > > paid maintainers.
> > > > > >
> > > > > > If we're talking about older boards, then why have they only recently
> > > > > > became a problem, when, presumably, they've been working fine for a
> > > > > > decade or so?
> > > > >
> > > > > These boards may have been working fine, given the right "legacy"
> > > > > kernel config options were used.  However, some of these option make
> > > > > the resulting kernel limited to that platform or even to a specific
> > > > > board (e.g. when CONFIG_CMDLINE needs to be used).
> > > >
> > > > The 32-git ARM kernel has had a way to pass the command line to the
> > > > kernel from the boot loader since day one.
> > > >
> > > >       First it was the struct param_struct.
> > > >       Then it was the ATAGs that was introduced pre-git.
> > > >       Now it is DT.
> > > >
> > > > The kernel retains code to parse all three methods of passing data
> > > > from the boot loader to the kernel. The decompressor has support
> > > > for merging the ATAGs into the appended DTB, which includes merging
> > > > the command line into the DTB.
> > > >
> > > > Without an appended DTB, the pointer to one of the above will be
> > > > passed to the kernel, the kernel will figure out what it has and
> > > > parse one of the three ways, and use the command line there.
> > > >
> > > > The only case where CONFIG_CMDLINE should be used is when there is
> > > > no command line passed, no way to change it, etc. At that point
> > > > there are two options:
> > > >
> > > > 1. Augment the kernel's generated FDT with the command line node
> > > >    and load that modified FDT or append it to the compressed image.
> > > >
> > > > 2. Use CONFIG_CMDLINE, which means that the kernel _will_ become
> > > >    specific to the platform that needs those arguments. No getting
> > > >    away from that in this case.
> > > >
> > > > Maybe you haven't explained the problem very well, but I don't see
> > > > any issue with this.
> > > >
> > > > > The KZM-A9-GT I "need" this for never had upstream U-Boot (I don't
> > > > > think I ever had any U-Boot sources).  I can boot a shmobile_defconfig
> > > > > multi-platform kernel[*] fine, iff the first patch is applied.
> > > >
> > > > So, what have you been doing for the last 14 years to boot this
> > > > platform (merged in 2012) without this patch?
> > > >
> > > > Please explain:
> > > >
> > > > - how it worked before - I want to know how the DTB is passed to the
> > > >   kernel, what information is provided from the boot loader, whether
> > > >   that gets merged into the DTB, etc. All the fine nitty gritty of
> > > >   how it worked and what doesn't work, what the problems were etc.
> > > >
> > > > - what changed (it sounds like you want extra features)
> > > >
> > > > - why (in detail) it doesn't work now.
> > >
> > > I want to know:
> > >
> > > - Where RAM is located.
> > > - Where the kernel is being loaded.
> >
> > tftp 0x43000000 kzm9g/zImage.dtb
> > bootz
> >
> > > - Whether the platform reserves any RAM that may overlap with the kernel
> > >   or where the kernel wants to locate itself in RAM.
> > >
> > > From what I can see from arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts,
> > > memory is at 0x4000000..0x5fffffff - 512MiB.
> >
> > Correct.
> >
> > > So, provided you load and execute the compressed kernel image within
> > > the first 128Mi of memory (0x40000000 - 0x48000000), then it will select
> > > 0x40008000 to decompress itself. I can find no mention of any reserved
> > > memory regions in the DT file, so this should be fine.
> > >
> > > If you're loading the compressed kernel at some wildly different
> > > address, then yes, it probably won't work.
> >
> > It also works when loaded at e.g. 0x42000000 or 0x44000000,
> > but not at 0x41000000 (all with [PATCH 1/2] applied).
>
> So let's assume the kernel is loaded at 0x43000000.
>
>                 mov     r0, pc
>                 and     r0, r0, #0xf8000000
>
> This will result in r0 being 0x40000000. This becomes the mem_start
> argument in fdt_check_mem_start().
>
> We look for an appended DTB, and skip the validation that
> fdt_check_mem_start() does. If this were to go ahead, then this would
> find that 0x40000000 is within the memory@40000000 node, and thus this
> would return "mem_start".
>
> Then:
>
>                 /* Determine final kernel image address. */
>                 add     r4, r0, #TEXT_OFFSET
>
> will place the decompressed kernel at 0x40008000.
>
> However, as placing the kernel at 0x41000000 doesn't boot, that
> suggests some memory is being removed from the kernel. If adding a
> call to fdt_check_mem_start() after the ATAG-to-FDT parsing has
> been performed fixes this, it suggests the ATAGs change this.
>
> So, with a booted kernel, what does:
>
> $ hexdump -e '"%8.8_ax  " 8/4 "%08x " "\n"' /sys/firmware/devicetree/base/memory\@40000000/reg
>
> say? Has this been modified from 00000040 00000020 ? I think it
> will be.

Thank you. Output is:

    00000000  00000041 0000001f

So the first 16 MiB was indeed removed.

> That means there's a simple fix: as there is likely reserved memory
> at the start of RAM, reflecting that in this platform's .dts would
> fix this issue without needing to change the decompressor.

Unfortunately that does not seem to work.

> If you don't want to change the reg in the memory@ node, then there's
> /chosen/linux,usable-memory-range which can be used to specify the
> usable memory base and size (same format as reg).

Neither does this...

> Another option would be to add linux,usable-memory to the memory@
> node that specifies the range of usable memory while still specifying
> the full memory range in the reg property.

... or this.

Don't all of these methods rely on fdt_check_mem_start() operating on
the appended DTB, i.e. on what [PATCH v2 1/2] does?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

