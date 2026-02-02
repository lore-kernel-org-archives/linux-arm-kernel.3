Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A57E73156
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8Za/cnk0Tj04XFouCLpaAuwYsRret9wb2o0txxDKMk=; b=PRjtIHuCO7mK1oGxqzUAYMxFqJ
	XUtDuZ+aCuYDhrNsrGQttQf6eHXhB4Cnf5QcofYVZLCQjug3AtYh9HmOvmTl+bLgAlwE97AN9i2mh
	18qNLJt2B7vTMkieIDdj2Sn2RIcl+VNVfeRzFRCkwYC5pNYJRsJuTOkHe5O6824OccHgiREdxkMEx
	bPp2MNayx2zqTSaAHpVdIqiphLlBxg1j4Hm9nInYdR9OAO1DKdrDr239AarQpw21JQAhrsn2scGdr
	lip71cnAj/jDAWfVCus2DmYhW1poB52Tqz3GtyPKH1rzwaU1xhjo7gCzf/MfZtfJmkGnr+N0YB+Ve
	ma9nm9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr9B-00000004oll-09y4;
	Mon, 02 Feb 2026 10:27:09 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr97-00000004okN-2hwS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:27:07 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5636274b338so3301088e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 02:27:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770028023; x=1770632823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F8Za/cnk0Tj04XFouCLpaAuwYsRret9wb2o0txxDKMk=;
        b=kKsk2empcF8DJrD4rINuYvncRZiujZc+4EwOdB0RGeSE/8HYBXuKfIveKIyS+Qp5Zm
         tZqYCyAzz9EwZWq8Zaq+6ZrJD2J2L3xrpnN5wMvz2Ddm/LxrIcOQhRa4JbkgJbaZkoVB
         RErIch5D00eNUuc5QMGqTlWCwdpYe8vTuZyt0ae0L41Dr9ZPYUL3ZBvuqWv5orY3oSQG
         Hdwt8VC76FJikebsskwqKUoVYg/SXDtton9mTQRaODfg7pTN5B9plzVVHEz45wcXz3x+
         vMJLZt16M/F6cgty+BcdFK0kG4O9ezHdIwbowRtsivIpUVB3zspv57+mnoXuIQrkE2aa
         i87Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxbFSKU1a4Wc+fH4X7l5ZWCOAbDMdOISJbxveFL0rbv8Mm0JO9SXmIcqTPGh3RgKEh+Oj++VrfSQiLERLPp5+s@lists.infradead.org
X-Gm-Message-State: AOJu0YwxxLnfvTvyBcNbZngf9pvLXDyn+6SyBKYRzBWG+RKD8U5SH/O8
	5G8z9e6zNL8JIrSVxrO1DJIhGywygWmUZLPfohl74zhHu12mMy4LO5yOEG0OWH7z
X-Gm-Gg: AZuq6aKHc4PsS6r9iQubcqYsJUJqK8YpTzzPGFhEpBSz85NuBRDxeZIebJtY1TOh/1L
	U9gjg2jgaiXK/FxDrpzw/IoxB5yXZNIkLsLlnKb6bfL6O6MIdXZAMujiIvi1lWsLanRJPy4b3FC
	R85QeJ3gR7Q4rT3gCZodyCwyA9RgMk1jv5Tis8Nz2tKjhBKbFUi2w5vuFIkgBnULKaMph8+f/8s
	aUYMjLhl/Qpk4W3wKLV9F44oKFuQ9sqKtmyABMcqau/ne1OkkrW8bkFVRWu2ciC/J2EqNjCo8aM
	npsHsPE502EK+uOgyOcBSaz7YuCWXvyqlbVmDZQHkp0dp/803APAlgHAOx+o/Uf17xNjBtJa3M/
	TARQposKrat6RbiE+R2eOd08yD+t1GElbUoY+FsowwmDI/J1UXUdUxg98on8PFEX/865rZBaeaz
	2kPm01yuOOXJf6yne4g+aZ/SWwxAl6T+QPvcqbS66zcWAMx3ZT
X-Received: by 2002:a05:6122:3192:b0:563:6544:9371 with SMTP id 71dfb90a1353d-56691cac6b9mr4179006e0c.0.1770028023309;
        Mon, 02 Feb 2026 02:27:03 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5668599df7asm5529451e0c.0.2026.02.02.02.27.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:27:01 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5f5418c40daso4460111137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 02:27:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXz9YEeFn3ujekx9JzaGD8AS92oXYGk9grvDkqlHxdNuhXaeFx6yM+xnqNv1BE7q/TJTjxuITNNCAvy9LcXZtME@lists.infradead.org
X-Received: by 2002:a05:6102:6d5:b0:5f5:3739:100d with SMTP id
 ada2fe7eead31-5f8cd8d7d71mr4616165137.0.1770028020841; Mon, 02 Feb 2026
 02:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20240121203009.9257-1-ansuelsmth@gmail.com> <65d62b60.050a0220.c7b96.614e@mx.google.com>
 <666ad6e0.df0a0220.f8b16.4a5e@mx.google.com> <CACRpkdYJoNRpciyQE_A6dkb8f6Jsy4+qwb4w9K3bss2mkZpp1A@mail.gmail.com>
 <ZmsXdWWidNjXdbSa@shell.armlinux.org.uk> <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
In-Reply-To: <666b2379.5d0a0220.c7eec.8b6f@mx.google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Feb 2026 11:26:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
X-Gm-Features: AZwV_Qi_VuPmR3_mt_A-4AUu2s_2dmmw3jY5fYOsETUg5k8PjeO7V_Mk-yv1edI
Message-ID: <CAMuHMdWnNzktSecsPX_anf=PCuLrZUT-6TO7KXGCHeQVTS974g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] ARM: decompressor: support AUTO_ZRELADDR and
 appended DTB
To: Christian Marangi <ansuelsmth@gmail.com>
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
X-CRM114-CacheID: sfid-20260202_022705_705524_E56671D4 
X-CRM114-Status: GOOD (  52.81  )
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

Hi Christian,

Trying to revive this thread...

On Thu, 13 Jun 2024 at 18:51, Christian Marangi <ansuelsmth@gmail.com> wrot=
e:
> On Thu, Jun 13, 2024 at 04:59:49PM +0100, Russell King (Oracle) wrote:
> > On Thu, Jun 13, 2024 at 03:50:58PM +0200, Linus Walleij wrote:
> > > On Thu, Jun 13, 2024 at 1:24=E2=80=AFPM Christian Marangi <ansuelsmth=
@gmail.com> wrote:
> > >
> > > > Sorry for asking again... but any news for this?
> > > >
> > > > I have also added the 2 patch here [1] [2].
> > > >
> > > > Been in incoming from a long time and I have seen other patch getti=
ng
> > > > accepted. Did I do something wrong in submitting the 2 patch?
> > >
> > > Hm Russell must have had some concerns, Russell?
> >
> > I've been snowed under for about the last six weeks - with only the
> > occasional day that isn't silly. It's that kind of frustrating snowed
> > under where each problem is a bit like a brick wall placed every 1m
> > and you're supposed to be doing a 100m sprint race - you can't see
> > the next brick wall until you've climbed over the first.
> >
> > Whether I have time to read the mailing lists or not depends entirely
> > on what is happening on any particular day.
> >
> > > If for nothing else I think some Tested-by:s would be appreciated,
> > > do we have some people who use this that can provide Tested-by
> > > tags?
> >
> > Yes, tested-by's would be a really good idea, because my gut feeling
> > is that this change has moderate risk of causing regressions. I'm
> > not talking about "it works for me on the setup it's intended for"
> > I'm talking about other platforms.
> >
> > I'm also wondering about distros, and what they're supposed to do
> > with the config option with their "universal" kernel that's
> > supposed to boot across as many platforms as possible, what they
> > should set the config option to, and what impact it has when enabled
> > on platforms that it isn't originally intended for.
> >
> > I haven't really read much of the patch because I've been so busy,
> > so I may be being overly cautious. Given that I am quite busy, I
> > would appreciate a summary of the situation rather than being fed
> > with lots of results! In other words, the tested-bys, and "it works
> > on all the xyz platforms that we've testsed, nothing appears to have
> > regressed" would be ideal.
>
> The current patch are used downstream on the OpenWrt ipq806x target that
> is a mix of legacy (what this affects) and non legacy targets. (old
> bootloader support loading DTB from the image and older ones require it
> to be appended)
>
> I think I need some help from the community to test this.
>
> I can also move these patches to our "generic" target on OpenWrt so that
> they will be enabled by every arm target we support.
>
> Anyway thanks for the feedback, my only concern was that I messed
> submitting the patch on the tracking system. Hope community can help
> with this since it's a big feature for legacy devices that was broken
> from a looong time (and only solution currently is to hardcode the PHY
> offset values)

FTR, I did provide my Tested-by for the first patch in [1].
I still have this series in my local tree, which I test regularly on
a variety of Renesas ARM32 platforms and on BeagleBone Black.

In fact, I had completely forgotten about this series, to the point
that I bisected a failure in booting mainline on one of my boards
using my current .config to the absence of the first patch ;-)
Apparently during the past years, I had modified my .config to make it
more generic, and make better use of the DTB (incl. chosen/bootargs),
which has a dependency on the first patch...

The second patch is a different story (I don't need it ;-), and enabling
the option may indeed not be suitable for distro kernels.

Thank you!

[1] https://lore.kernel.org/CAMuHMdX0dpQdZSCJGuOM0MgM3N-8OA29skARvXEkm87eOP=
EWBA@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

