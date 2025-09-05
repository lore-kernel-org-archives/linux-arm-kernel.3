Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A54CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 19:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5/sbDeLCN8sGZKJUJchdW8cdcO9Qc2yUc2hm0kfcb4=; b=XvbQHBGqePVYv9
	0bfglwQjwjBttGHeys3Md7LrVRvhN1KPHecrVkAXW0Z/n3Hh4/rxGGy3s82xJl4dO3LzDb6JsFvoL
	724NTjF+VGUes5Pzr26F/OAPTPCPFcjfIl7Ym9G4q/adBAR2dvfN35rmAZHhxp9IaV8tVLA4moiZT
	RYVOJBVPR2u6qmHf13UEhEWQWryzoOAQlo0T9glW6Oxo9QsB8W4zS81nIDp3MG7LCnUsOzrBlpNiN
	m4h5s2fx0uCBpDzCPt8MVZatVG7R4FZb899+kNo34xYgeuOhDo0ibEouek1ZPnSWcnzZtfoOuXU+8
	VEzgEjTf7piLsIQ2UpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc5g-000000047os-1qGB;
	Fri, 05 Sep 2025 19:27:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYBz-00000002gKY-2ork
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 15:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1358D60291
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 15:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5DCC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Fri,  5 Sep 2025 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757085454;
	bh=dr+T2rwp5B5VrM1rUBLT6viu/Q1Jhzb6unLFntNx2/o=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ogeoxe37ksPcj8h2cL77V8KZpT6J9875/nOiZH8QepCfGPkYjNt4/oEh+JrcY9A7z
	 N8GUmBWx/xFZ7LADTDAO5JNKmlzxSn+KnCpRDfdgT0T3OitF2zcX1sG3gl2zeo+6Ac
	 UjySxmwlZ+kb8C4NrmUhr3oVsV/nngOC+NTZNgyGJs1Y9rW6b+whoMLEvD5y4DfnTB
	 Zx3gi2SljRWd78NWlgL6BzJNH7EUwe3eaMG8HXLH/2zElwL0K0nfFojueWpIuh4u24
	 714E5DefpgOSSuvuJpI+fsSLn6UDl4zcleFT2LH1YdVqjOhmNj7dafCIE/85utTudH
	 z6t6IugrwJkfg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336c86796c0so18788981fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 08:17:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmnB4X/sUrBKp8bhBYvtadREshEvqI7KYw5aMM5aPEtZVPYo+I241rpZpZHd7tMvoeBSMEIqHC2NUIAJ948bdK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn2C2son7uwZGKStY9g+5jNcjrSXkBjTMAzcXWqxYbrHVGhmzL
	5AXt+4LoLESEqzF9ebQftdnm9AVEagaRA3OzUFjK9+q+kxNipRsluaXPS/H2O10PsMblabt3Fu5
	mF5we/uLPQp1+Lz6Tcn24o1azlCrQIXw=
X-Google-Smtp-Source: AGHT+IHuctgvaReJVM5L6lLElO1ujTh+IJ3xit6qqIlU8KTDuhaXRGGAdYM2dar503Kj7x8VhbLVORGMlP0Lcie3F3I=
X-Received: by 2002:a05:651c:b23:b0:337:e410:cb1d with SMTP id
 38308e7fff4ca-337e410ccf5mr52525011fa.43.1757085453105; Fri, 05 Sep 2025
 08:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250830170901.1996227-1-wens@kernel.org> <20250830170901.1996227-4-wens@kernel.org>
 <20250905161236.51b6ecee@donnerap>
In-Reply-To: <20250905161236.51b6ecee@donnerap>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 5 Sep 2025 23:17:19 +0800
X-Gmail-Original-Message-ID: <CAGb2v65utA6PsoAS-wLPskYy9GGXfESvtiwOBC4qSdi1XvLeKQ@mail.gmail.com>
X-Gm-Features: Ac12FXx524PiYu7fy0CjI9wjWYIIgWKZl0OQuhFEwY-L-xvtcN5IjLcA6m5m72w
Message-ID: <CAGb2v65utA6PsoAS-wLPskYy9GGXfESvtiwOBC4qSdi1XvLeKQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: sunxi-ng: mp: Fix dual-divider clock rate readback
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 5, 2025 at 11:12=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Sun, 31 Aug 2025 01:08:56 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > When dual-divider clock support was introduced, the P divider offset wa=
s
> > left out of the .recalc_rate readback function. This causes the clock
> > rate to become bogus or even zero (possibly due to the P divider being
> > 1, leading to a divide-by-zero).
>
> Ah, a nice catch, thanks for that! Just curious, how did you find this?
> The MMC clocks use the dual divider type as well, but I didn't observe
> them being wrong?

I was looking at clk_summary in debugfs and kept seeing some of the audio
clocks returning 0 and dumped the register to get the actual value. I then
did a printk trace of the .determine_rate callback and saw that one of the
dividers was always 1. I guessed that the .recalc_rate callback was to blam=
e.

> Regardless:
>
> > Fix this by incorporating the P divider offset into the calculation.
> >
> > Fixes: 45717804b75e ("clk: sunxi-ng: mp: introduce dual-divider clock")
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!


> Thanks,
> Andre
>
> > ---
> >  drivers/clk/sunxi-ng/ccu_mp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_m=
p.c
> > index 354c981943b6..4221b1888b38 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mp.c
> > +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> > @@ -185,7 +185,7 @@ static unsigned long ccu_mp_recalc_rate(struct clk_=
hw *hw,
> >       p &=3D (1 << cmp->p.width) - 1;
> >
> >       if (cmp->common.features & CCU_FEATURE_DUAL_DIV)
> > -             rate =3D (parent_rate / p) / m;
> > +             rate =3D (parent_rate / (p + cmp->p.offset)) / m;
> >       else
> >               rate =3D (parent_rate >> p) / m;
> >
>

