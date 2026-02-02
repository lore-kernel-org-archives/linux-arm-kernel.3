Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036A6E7314E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QC00Lmrsw+W8qHwno561fKYSCBQRLVdVZ9yYw4Hvbs=; b=jEU1t5eSx6ZS/XHl2E7ur1AWiH
	Lg3kAlMFHoP6JJk3YpJJ/VkUEkMCNcEYDH7f75Sk7zClZdK6fGgpG8pyKpGoJnyOlW4jcCZw7hSIY
	gOHNFSilqO2etU37ufbjsulhGmdRZWLrY2E7Ry94UN5yORKO+6sw0Fq3tbgwQUF6S0ki0NdCcMZ9+
	V9X0IlP8dm8s6Na/BwhNCCaMCn9Ja+Etry8Ew1GJqfMbvNz/gDI3tshXV7mbNl+ha8kiC4yM3+pjf
	W2D1J2zwvH5S6Els9bVL48tWOZoJJeDXMuD4Gon2kL/hgvxj2I84elp8SS8yl7BIDSQdQViLYpOQS
	GKF/7gWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrTF-00000004qxy-1Q0r;
	Mon, 02 Feb 2026 10:47:53 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmrTC-00000004qwc-3FtU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:47:52 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8c07bc2ad13so320146785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 02:47:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770029269; cv=none;
        d=google.com; s=arc-20240605;
        b=iusXFscwHB8zOnCPlHyOn13JtafgSGLSTQW6nmiMDAEQ+2aspYxxw9Ubd7mnRGraQR
         +KSmn8Dpatnndr1o6dshrXaToxxZDfODSTa20vW67pty1zc6XRCl2LEFe8sORFkuYu8H
         mTSAEPB49qYLmdoe38ugsJ+SyJ+MqI2hpVrVSitTo9ABUfAikazXbb7nZQ1dm7SgNt3O
         Si03XBm8KrWj5L7P3DmG5XLkI1ZCwTdRB1jizhBe/LnKEWGPbv205mJ/ALbCxdWYVFzz
         pvdl32PK3kAF7TDSK1FuG31t+lBoIzcJa0p+SKZrDecHeyUbS6DBOkreN4KQuFILDJGA
         okxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QC00Lmrsw+W8qHwno561fKYSCBQRLVdVZ9yYw4Hvbs=;
        fh=gOeMF56LOUkB2xWyrEhUdMUTXXcw7vXS4TlzdKNsjKo=;
        b=DzLicQ4S2AnejV444VAhQMOy3n3/vyALPxxKGPRi/50a3FJ6U/JyvFPfMEvi6w/4+N
         MpXjq4T0zOVqJ3LNKdYRyAgLoQb+d4BWVElZRIt46pbfkOvQByLuu+Ivm4fiYjHMGtw1
         I8p9ARD+WEwMXpIqTEKpcD4RFH/BJEusubDzIJ8fSQhjJMK+tDPdpq8mIYv1udmYoaVr
         Tambdj6mTIZ7dKnhhwZD/1PoOLVhCSzFScyxwMWUcdJ4+FUwzK9JZb673RS9KlKw+LzE
         Cc3elnRHdusKbrcuhztHGgYNOCRwTD7p4fbAZWsbAnL7JeTxi/hAovlw2MFWhs+BEeHQ
         SmEQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770029269; x=1770634069; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QC00Lmrsw+W8qHwno561fKYSCBQRLVdVZ9yYw4Hvbs=;
        b=gF7udg2w0x2KMB71ZaXN7B3o/OevUkSJgBFZrjJazTrJTtM/33Z1cim71Fdi7FJlLR
         Kh6L1tZWZlLNCmpyXENlr9HmYkuUfJneKX3TdJ9gJoW6EG6w30TW5dpwNCSsaDK+X54H
         UAJ7vA53MZebNHqY6mFuetnqjtJ+oZUjUnaJJyoh9fErBciGSFRsrTfPKjHdjLlx0cus
         titgcTYDQm7PDW2q+hW13evvL8A1L/gZrnfJ+MjE6qfjeXaRtqraBCgw9Aw+zurSwWoA
         XCtBQWdFrfwCnlXYBJ05zZ3LKqASJjne8XcDmpctc1/2CXwacjOcfWlnmb7gRHtcaqtI
         CcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029269; x=1770634069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/QC00Lmrsw+W8qHwno561fKYSCBQRLVdVZ9yYw4Hvbs=;
        b=R8ng9CNppMuSbTfbmSx8mDjTNKtOkPApJY9wyHyHQhQAS9lC5fuVTkUeIffLQwCQqS
         AizW6MHIqpmxWLfYwhRsEAMv/SFiv92aFRQg3Vci+AaE9ZxACUc2DL5gXJqsJAcDwXRL
         FuvbVxoxcWMe5330S/gOs/Jd1vwE7BlUnhQ1BMaeRNTJrNu5KspqGCvpmKhxXMVyHvwW
         UwWh5NykqBUQDVO04qGB6hlU65jDXgA+G1sHJD1VRoe3n0XqueEuov+2B40zeu5t7i9u
         Npdij7jSjlDlDdHIhBuUtwjGUN3AWPCZgekZPjjVkuAlF0JbDDQU6JdU0ARDjtS9yYhs
         p1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVjF1DmXCBrXLSBIGnxN7lSMhFidW72VFliZq9XMfJzIpxjUwIPy81BJ9MEbcnSxyYzQJHDS3S3+fGOt8EA1meV@lists.infradead.org
X-Gm-Message-State: AOJu0YxTP2w+pJkjkDrAKkGY4oXQltuFEmwZmb5zsLD4BbdYuvD2GqnV
	8ZaPBfV5dvCFRuSbo8e0ch/NxuX+S48dY7VUbxp8yPtmR+iRCJImgmi8dPruTF3erltTfc6P4gF
	Z/qFxIj+Jt2wWC0Isnm4ny7mQ1mJhqQU=
X-Gm-Gg: AZuq6aLyITme0uMUOkJCJ4N4OOi5Vfg4bLNaY1Nru7Hn9ie0x4vcdmhbI+PugqjRILP
	w45x+TjCl8OtHL8wymYpqhci9wMBo8OwxvR2Z3X6pE4jRvTl+lWUSWk6HnhsGwse27WKLCnJEXh
	LEXRbw7AfhuE0ncWN5EsjLNSGnL4H+/f9ItgmAkIiMUuBxinCwA8atsUBJ31awT3NcXktv4vaTZ
	TRQtEPSgo3r2MLNjJszOI6Ki8KTQKWWyTcx/krMdb0vw3/ETKTTH8IsGDZZEOmmRxLtE8U=
X-Received: by 2002:a05:620a:f02:b0:8a2:e1db:f442 with SMTP id
 af79cd13be357-8c9eb275ca3mr1379105185a.30.1770029268865; Mon, 02 Feb 2026
 02:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20240121203009.9257-1-ansuelsmth@gmail.com> <65d62b60.050a0220.c7b96.614e@mx.google.com>
 <666ad6e0.df0a0220.f8b16.4a5e@mx.google.com> <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk> <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
 <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
In-Reply-To: <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 2 Feb 2026 11:47:35 +0100
X-Gm-Features: AZwV_Qh1X1b6iCsc_jm_0SGoNSQn7pD8D6yUwA77GCKMYwimCwkJKveu6J0DT-M
Message-ID: <CA+_ehUwK=2ruQ8VfM88dtpXRx9mUKth1gfO8CHMyd3ZUkOyepg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Eric DeVolder <eric.devolder@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_024750_838484_1BA615DE 
X-CRM114-Status: GOOD (  60.76  )
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

Il giorno lun 2 feb 2026 alle ore 11:27 Geert Uytterhoeven
<geert@linux-m68k.org> ha scritto:
>
> Hi Christian,
>
> Trying to revive this thread...
>
> On Thu, 13 Jun 2024 at 18:51, Christian Marangi <ansuelsmth@gmail.com> wr=
ote:
> > On Thu, Jun 13, 2024 at 04:59:49PM +0100, Russell King (Oracle) wrote:
> > > On Thu, Jun 13, 2024 at 03:50:58PM +0200, Linus Walleij wrote:
> > > > On Thu, Jun 13, 2024 at 1:24=E2=80=AFPM Christian Marangi <ansuelsm=
th@gmail.com> wrote:
> > > >
> > > > > Sorry for asking again... but any news for this?
> > > > >
> > > > > I have also added the 2 patch here [1] [2].
> > > > >
> > > > > Been in incoming from a long time and I have seen other patch get=
ting
> > > > > accepted. Did I do something wrong in submitting the 2 patch?
> > > >
> > > > Hm Russell must have had some concerns, Russell?
> > >
> > > I've been snowed under for about the last six weeks - with only the
> > > occasional day that isn't silly. It's that kind of frustrating snowed
> > > under where each problem is a bit like a brick wall placed every 1m
> > > and you're supposed to be doing a 100m sprint race - you can't see
> > > the next brick wall until you've climbed over the first.
> > >
> > > Whether I have time to read the mailing lists or not depends entirely
> > > on what is happening on any particular day.
> > >
> > > > If for nothing else I think some Tested-by:s would be appreciated,
> > > > do we have some people who use this that can provide Tested-by
> > > > tags?
> > >
> > > Yes, tested-by's would be a really good idea, because my gut feeling
> > > is that this change has moderate risk of causing regressions. I'm
> > > not talking about "it works for me on the setup it's intended for"
> > > I'm talking about other platforms.
> > >
> > > I'm also wondering about distros, and what they're supposed to do
> > > with the config option with their "universal" kernel that's
> > > supposed to boot across as many platforms as possible, what they
> > > should set the config option to, and what impact it has when enabled
> > > on platforms that it isn't originally intended for.
> > >
> > > I haven't really read much of the patch because I've been so busy,
> > > so I may be being overly cautious. Given that I am quite busy, I
> > > would appreciate a summary of the situation rather than being fed
> > > with lots of results! In other words, the tested-bys, and "it works
> > > on all the xyz platforms that we've testsed, nothing appears to have
> > > regressed" would be ideal.
> >
> > The current patch are used downstream on the OpenWrt ipq806x target tha=
t
> > is a mix of legacy (what this affects) and non legacy targets. (old
> > bootloader support loading DTB from the image and older ones require it
> > to be appended)
> >
> > I think I need some help from the community to test this.
> >
> > I can also move these patches to our "generic" target on OpenWrt so tha=
t
> > they will be enabled by every arm target we support.
> >
> > Anyway thanks for the feedback, my only concern was that I messed
> > submitting the patch on the tracking system. Hope community can help
> > with this since it's a big feature for legacy devices that was broken
> > from a looong time (and only solution currently is to hardcode the PHY
> > offset values)
>
> FTR, I did provide my Tested-by for the first patch in [1].
> I still have this series in my local tree, which I test regularly on
> a variety of Renesas ARM32 platforms and on BeagleBone Black.
>
> In fact, I had completely forgotten about this series, to the point
> that I bisected a failure in booting mainline on one of my boards
> using my current .config to the absence of the first patch ;-)
> Apparently during the past years, I had modified my .config to make it
> more generic, and make better use of the DTB (incl. chosen/bootargs),
> which has a dependency on the first patch...
>

I mean we also use this patch from a long time on ipq806x on OpenWrt.
Would really love to have this merged as it does fix a big problem
and would permit full upstream support on all kind of """""legacy""""""
devices.

We just need more wide testing. Any clue how we can achieve this?

> The second patch is a different story (I don't need it ;-), and enabling
> the option may indeed not be suitable for distro kernels.
>

Yes the second patch is so minor it's both harmless and can also be
ignored. But it's really a 3 line change so can't see why it should be
problematic.

> Thank you!
>
> [1] https://lore.kernel.org/CAMuHMdX0dpQdZSCJGuOM0MgM3N-8OA29skARvXEkm87e=
OPEWBA@mail.gmail.com
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

