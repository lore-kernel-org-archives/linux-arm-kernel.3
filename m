Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82C9CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRNuvtDEs2CIycsK4maQdP6MUdFSI0xchkkpiQAZH7Y=; b=B0noaMejlp0dpbvAgIQCNVFOjK
	EjxJ+ulAaMMx6n73ptl4iXBcZDa/1YjHjBSmJ9nJrc7rmyJ28V6e+WkcN6VhuLzU+Z/UebD5U75YQ
	0Xg3gMhAZ040Xy7F5ewaN3ePDFbRM12UqGWkHMutrJlHFoNmqlCw2zw8Dkosoq2tUgqrIBM0hqHOQ
	K0Six3cc3fsSjZ8LNENB9lYkuZ9ZASnuH9lCZNrBwkk2kpOUTFHvLRVQew30DzUDtlmwI2KspnE1o
	6mRjy8JjaKtZg7hCRahH33oZVp7dIQleGT79kWwe4biPlv23ca2Qi21wE1kfPleiO/WOBQEZER+mI
	KSjpGTbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlUs-00000006D8N-1pHQ;
	Wed, 03 Sep 2025 11:17:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkbu-000000065Fq-28Jw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 10:21:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D0121688;
	Wed,  3 Sep 2025 03:20:53 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 088923F6A8;
	Wed,  3 Sep 2025 03:20:59 -0700 (PDT)
Date: Wed, 3 Sep 2025 11:20:54 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift
 register
Message-ID: <20250903112054.173fe7b8@donnerap>
In-Reply-To: <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
References: <20250903000910.4860-1-andre.przywara@arm.com>
	<20250903000910.4860-4-andre.przywara@arm.com>
	<CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_032102_625716_CF25DD96 
X-CRM114-Status: GOOD (  27.97  )
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

On Wed, 3 Sep 2025 12:20:55 +0800
Chen-Yu Tsai <wens@csie.org> wrote:

> On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > The "mp" clock models a mod clock with divider and a shift field. At
> > least one clock in the Allwinner A523 features just a power-of-2 divider
> > field, so support an initialisation of the clock without providing an
> > actual divider field.
> >
> > Add a check whether the "width" field is 0, and skip the divider
> > handling in this case, as the GENMASK macro will not work with a zero
> > length.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > --- =20
>=20
> In my series I have a patch that adds this to the divider clocks,
> thus adding a P-clock type to the M-clock bits.

Yeah, I saw that, but wasn't convinced this would be better. Hence wanted
to post my version as an alternative.

> Maybe use that instead? I prefer we use actual matching types instead
> of disabling one part of a complex clock type.

Good that you bring up that topic: when looking for matching clocks I saw
we have a lot of them, though often one is just a subset of some others,
with some code duplication. And we use the pattern of "use type A, but
without feature X" already, for instance for "NKMP without the K".

So I was wondering if we should revisit this and clean this up. IIUC those
clocks were all modelled after the H3 and earlier generation, and the
clocks have changed since then. For instance I don't see PLLs with two
multipliers (NK) after the A64 anymore.

So what about we consolidate the various types into just a few distinct
ones, like NKMP for all PLLs, for instance, and provides macros that
disable fields as needed? This could ideally be done under the hood,
leaving the per-SoC drivers mostly alone, hopefully.

What do people think about that?

Cheers,
Andre

> >  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_m=
p.c
> > index 354c981943b6f..a03dac294d048 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mp.c
> > +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> > @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, unsi=
gned long rate,
> >         spin_lock_irqsave(cmp->common.lock, flags);
> >
> >         reg =3D readl(cmp->common.base + cmp->common.reg);
> > -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shift=
);
> > +       if (cmp->m.width)
> > +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp-=
>m.shift);
> >         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shift=
);
> > -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> > +       if (cmp->m.width)
> > +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> >         if (shift)
> >                 reg |=3D ilog2(p) << cmp->p.shift;
> >         else
> > --
> > 2.46.3
> > =20


