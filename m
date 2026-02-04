Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FDEE95392
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sPXImA7DEGl/Yls/PeLeuHlZNf9Mc7dZ3M998acnXs=; b=axcKlA0DG4nYsQLv2Oksnc++CV
	2vPOpPvmagE0EMror+WFyoaE3Ff37/VBQ1a95zEtcSEneVXzRVYMYPHzRpAP+qd4Pdq+/24g3kebu
	TZ7xOdRM4QlDLvKjBHLxxTBOz+14VBWycXUWZsgPhedt9Ye19L7uPwxoYoo8B7pWrd/LoOLGrms5G
	0TtnpvRo4br2EdJdcQ9PS3vIOrxA8zn+qnrfHpUO1AbKg03b38j2ygLcZ9P6y48kKUr4d5ji+rnmE
	tGaVvUvmMcbIA/S2mbMKevEXxoRNORPtLHFUiKQ7hzAO+LYYM5GS/elhWJr7Pn9lo6riXupSJX2Jd
	yGlfeczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncSt-00000008THu-0oUX;
	Wed, 04 Feb 2026 12:58:39 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncSq-00000008THY-47hi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:58:38 +0000
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-948a374845fso2609339241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 04:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770209915; x=1770814715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sPXImA7DEGl/Yls/PeLeuHlZNf9Mc7dZ3M998acnXs=;
        b=D+QU8d4RCAxe72C1MeLvVKwce8SWLeFEqDxAyVXUOakRhrLVgcdUKg/P2UO6NuNZpR
         BV0yiwzU+Ak1/BKnZ2Y2RyKyS1FWe40FPKV6FAnNYzoTS2CHf9P37l+6fJblcRziagQl
         qeSk+ro3ugKdL6Igc9fbW+uXopr94xXuss5ywG2CsD5AoG/AP/PjMl24l53lCJQKeLbg
         efuas0NeCiBNJ4J+CAbAB9HYk2nf66q7/Hqi+Zxzvr6HrNlqPex7Uj9GX7MyqdNN5EXn
         GH2laCPS85Maw7GgvvHfkzKN+9UQ+dwlG8j8jUpY0NkfcYgq4vcMvWoS3Bb8goh167Xj
         TApQ==
X-Forwarded-Encrypted: i=1; AJvYcCULxeJGiZWS5CqAEBKcvzpUwVPQIaABNJOEHuYAO3IKVdoFMiTZSi9ssCQ9RyBxwWEftn0fkn5xOgoG9E9qGbLl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywag1w3rSx+wsSIsG+YMo+6MfyWArxMWKgevYTwoPLAd22+TO0G
	eDyKVdDR8DaSIlY9xXs4U/r5KMUICpK8+36MwinZwmArgRPVOilxef//1tGy9QBH
X-Gm-Gg: AZuq6aKZfdqRyojtWfjcpjsBrhs6QYnQt1SkJaYYrKi+IGW2WMvY0aj7DOEmJn3+mye
	fgGYtq9B82iq1y1N5ikna38ciH/Ob7HSNP6e/hyv3qZzFFIKS6uotvEadthQkL95hlUTiHuKQ85
	FWQmEmuapdICIp7uCtpV8PC6fLfgqKlP77pLh1/VJr+HPClR+km7GR0g4VPNuKg7/OAlhENUcWA
	CQzG0pYAuf7hU8a+TMsnTgEtgBnPelTWXikMjfKpfbKE7rJUSBMjLA80VdE6CcrDdsEHxsix7/5
	sjBj01gW/49NZi1i7B9hDIs9YRkIwdTBk2XrieoA0NsJTKHZb3Lic+HObNLwdybiLBO0r/Q9CGn
	3ovndtW33+bE85ItUeRzWTkh0Ad4/HZHBxNV7i4fJkm4rOr+Afkl+U5KZCPmuKKIJpIA7OmpKXY
	ZPrNlEBCxRuZXqagtrnrhAe4kiL321A63tH3gjmFK9RshBwY8H
X-Received: by 2002:a05:6102:ccd:b0:5f1:7aad:7c04 with SMTP id ada2fe7eead31-5f939611d17mr1022400137.41.1770209915346;
        Wed, 04 Feb 2026 04:58:35 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f93aa2ce09sm823867137.11.2026.02.04.04.58.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:58:34 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5f535ff78abso4523811137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 04:58:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTYOKtKsX6HK6pbUFlM7D3/tGPOuE1asP0tbQbqhwqWytd8Hf70bbcKSGTFz+lpy7FiLiXtYA054GtX+zQYpFd@lists.infradead.org
X-Received: by 2002:a05:6102:cc6:b0:5f8:e2eb:43d with SMTP id
 ada2fe7eead31-5f9394cd30amr961084137.10.1770209913314; Wed, 04 Feb 2026
 04:58:33 -0800 (PST)
MIME-Version: 1.0
References: <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk> <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
 <aYCDOio-YdUJAf2v@shell.armlinux.org.uk> <CA+_ehUx=3Ci2hN0YYkLxBNwOu_NTHFe_ZKkw9TH+bU-4PwTD-A@mail.gmail.com>
 <86v7gf9z92.wl-maz@kernel.org> <CAD++jLkgtgi1obmiuon=1XhOmT5cwtsMmBE37-wkzE_W55ZV2Q@mail.gmail.com>
 <aYKgaDtb7Ba09Paf@shell.armlinux.org.uk> <CAMuHMdX99kB5oDoxy8=yk_D8g=bCwwUON-uMkT7zSPq0=DASVA@mail.gmail.com>
 <aYMzk9cIgD-XDujY@shell.armlinux.org.uk> <aYNAAsD6dlMi-35Q@shell.armlinux.org.uk>
In-Reply-To: <aYNAAsD6dlMi-35Q@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Feb 2026 13:58:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxA5Uq2m5sfiG8=WzqKiEmXA0sp4fYGWOvQwhzubDUXg@mail.gmail.com>
X-Gm-Features: AZwV_QiDUMlqUgxgUOGS5PB89T4dxlI-Bjh1smVIc3uluI8H-5RCBK5Dg5SMbNE
Message-ID: <CAMuHMdWxA5Uq2m5sfiG8=WzqKiEmXA0sp4fYGWOvQwhzubDUXg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260204_045837_060689_FDD80069 
X-CRM114-Status: GOOD (  60.66  )
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

On Wed, 4 Feb 2026 at 13:48, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Wed, Feb 04, 2026 at 11:54:59AM +0000, Russell King (Oracle) wrote:
> > On Wed, Feb 04, 2026 at 11:53:30AM +0100, Geert Uytterhoeven wrote:
> > > On Wed, 4 Feb 2026 at 02:27, Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > > On Wed, Feb 04, 2026 at 01:36:29AM +0100, Linus Walleij wrote:
> > > > > However, I think it is a thick requirement to put on hobbyist
> > > > > contributors to go and write entite boot loaders from scratch,
> > > > > I think it's a fine requirement to put on Qualcomm or Renesas
> > > > > paid maintainers.
> > > >
> > > > If we're talking about older boards, then why have they only recently
> > > > became a problem, when, presumably, they've been working fine for a
> > > > decade or so?
> > >
> > > These boards may have been working fine, given the right "legacy"
> > > kernel config options were used.  However, some of these option make
> > > the resulting kernel limited to that platform or even to a specific
> > > board (e.g. when CONFIG_CMDLINE needs to be used).
> >
> > The 32-git ARM kernel has had a way to pass the command line to the
> > kernel from the boot loader since day one.
> >
> >       First it was the struct param_struct.
> >       Then it was the ATAGs that was introduced pre-git.
> >       Now it is DT.
> >
> > The kernel retains code to parse all three methods of passing data
> > from the boot loader to the kernel. The decompressor has support
> > for merging the ATAGs into the appended DTB, which includes merging
> > the command line into the DTB.
> >
> > Without an appended DTB, the pointer to one of the above will be
> > passed to the kernel, the kernel will figure out what it has and
> > parse one of the three ways, and use the command line there.
> >
> > The only case where CONFIG_CMDLINE should be used is when there is
> > no command line passed, no way to change it, etc. At that point
> > there are two options:
> >
> > 1. Augment the kernel's generated FDT with the command line node
> >    and load that modified FDT or append it to the compressed image.
> >
> > 2. Use CONFIG_CMDLINE, which means that the kernel _will_ become
> >    specific to the platform that needs those arguments. No getting
> >    away from that in this case.
> >
> > Maybe you haven't explained the problem very well, but I don't see
> > any issue with this.
> >
> > > The KZM-A9-GT I "need" this for never had upstream U-Boot (I don't
> > > think I ever had any U-Boot sources).  I can boot a shmobile_defconfig
> > > multi-platform kernel[*] fine, iff the first patch is applied.
> >
> > So, what have you been doing for the last 14 years to boot this
> > platform (merged in 2012) without this patch?
> >
> > Please explain:
> >
> > - how it worked before - I want to know how the DTB is passed to the
> >   kernel, what information is provided from the boot loader, whether
> >   that gets merged into the DTB, etc. All the fine nitty gritty of
> >   how it worked and what doesn't work, what the problems were etc.
> >
> > - what changed (it sounds like you want extra features)
> >
> > - why (in detail) it doesn't work now.
>
> I want to know:
>
> - Where RAM is located.
> - Where the kernel is being loaded.

tftp 0x43000000 kzm9g/zImage.dtb
bootz

> - Whether the platform reserves any RAM that may overlap with the kernel
>   or where the kernel wants to locate itself in RAM.
>
> From what I can see from arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts,
> memory is at 0x4000000..0x5fffffff - 512MiB.

Correct.

> So, provided you load and execute the compressed kernel image within
> the first 128Mi of memory (0x40000000 - 0x48000000), then it will select
> 0x40008000 to decompress itself. I can find no mention of any reserved
> memory regions in the DT file, so this should be fine.
>
> If you're loading the compressed kernel at some wildly different
> address, then yes, it probably won't work.

It also works when loaded at e.g. 0x42000000 or 0x44000000,
but not at 0x41000000 (all with [PATCH 1/2] applied).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

