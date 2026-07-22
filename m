Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2045AC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4aOAhCIGbQmkj8pfrFxHkKi8Xrm93t52GBvPKdZXrs=; b=d8w+eC6IbxJZoxihrppoyFDR9Z
	TE3AJam3QmRQlTB4FO1MP/iya+4hsa389tXwov15rDpgekEkO145/RK0AsnXYwQnOvJSNgMPMbSUc
	yZaVKo9UR3t0qIE0falc73pDBb/PtyloNoFbFESI3EH7ZZv4eebpiZMzBoMHcRW7yTMkeZkPKwI3E
	/SzzYuSP3oXktR0Lzv0NJBsNfbuzjUQ5YUWaO0gMuntmy9R6XnK3Uxn9ntmVXdnqQzcwqplDWM98t
	RGpTpYQoiHUbROdQopT39wyZf16boZeT/DGTCxl+95Wf1OtSuwcH5878Q7baSiyx+KL5F6WQIeArd
	f8Wkh3Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZjL-0000000CKKV-3nCt;
	Wed, 22 Jul 2026 16:23:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZjJ-0000000CKK2-34cW;
	Wed, 22 Jul 2026 16:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=X4aOAhCIGbQmkj8pfrFxHkKi8Xrm93t52GBvPKdZXrs=; b=vA6xfOIOdGbL7huGD/ih26/ABU
	Im2+evznOv+fllB1iqbxLTtiHmj/XMRijTT0QNbDDHxbwbQK1pxWm9dRJ+BwPpnV3FdvwqBudl1sK
	JCnDEZaJcQwmp1YEOJKYRyH06adXqR/RKbhDU5PpBDVw2jjslXKlH8DfOCLHfHe9L+EosVmBMuufV
	3jEIgfMR2661FMvcL4aq41d3Lz8/XRoelHQhEzwcD/mS2hThJ2KhlY6H/h12R76u1XMLq+geRkhaT
	A3z3wLKDRIlJpP6gTdkFlgQJV2jn/GewsULlvbYgVV6CVOGj10eo2XbJlfpTBoJLhSVUlBJL+jtrB
	+naTNsBQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Alexey Charkov <alchark@flipper.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Wyon Bi <bivvy.bi@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Fractional PLL coefficient on RK3588/RK3576 is
 two's complement
Date: Wed, 22 Jul 2026 18:23:10 +0200
Message-ID: <3482742.0oRPG1VZx4@diego>
In-Reply-To: <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
References: <20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net>
 <7f3924ab-52fc-4fb6-91b4-42a5e55d5c76@cherry.de>
 <CAKTNdwE=s6XG==4HvbaEV86DATWO6egVxLgNE4LpjFaXNQP7_g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_092333_831679_1A25A1F7 
X-CRM114-Status: GOOD (  28.42  )
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

Am Mittwoch, 22. Juli 2026, 13:00:47 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Alexey Charkov:
> Hi Quentin,
>=20
> On Wed, Jul 22, 2026 at 2:35=E2=80=AFPM Quentin Schulz <quentin.schulz@ch=
erry.de> wrote:
> >
> > Hi Alexey,
> >
> > On 7/21/26 9:17 PM, Alexey Charkov wrote:
> > > When the PLL rates table was first committed for RK3588 (and later re=
used
> > > for RK3576), the fractional PLL coefficient was defined as an unsigned
> > > value, while the TRM clearly states that it is a two's complement 16-=
bit
> > > value.
> > >
> > > Rockchip's downstream kernel later revised the fractional PLL code [1=
] to
> > > account for the two's complement nature of the coefficient, but that
> > > change wasn't upstreamed.
> > >
> > > Change the PLL table definition to use two's complement for the
> > > fractional coefficient and update its users accordingly.
> > >
> > > Note that a negative fractional coefficient is meant to be subtracted=
 from
> > > the next larger integer multiplier, so the _m values in the table are
> > > also adjusted accordingly for the two negative-k entries.
> > >
> > > While at it, fix the denominator of the fractional PLL calculation to=
 use
> > > 65536 instead of 65535, as per the TRM (RK3576 TRM Part 1 V1.2, Secti=
on
> > > 2.13.1.4 Setting Guide on P, M, S, and K):
> > >
> > > Fout =3D ((m + k/65536) * Fin) / (p * 2^s)
> > >
> > > Link: https://github.com/flipperdevices/rockchip-linux/commit/7a72bc0=
5dcc3a51e85ae531749e6270bf9b9212d [1]
> > > Fixes: f1c506d152ff ("clk: rockchip: add clock controller for the RK3=
588")
> > > Fixes: cc40f5baa91b ("clk: rockchip: Add clock controller for the RK3=
576")
> > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > > ---
> > > Not adding Cc stable, because while this fixes a real bug it's not a
> > > regression, as the issue was introduced in the same commit that added=
 the
> > > RK3576/RK3588 support.
> > >
> >
> > I don't think this is a valid reason :)
>=20
> I believe Linus frowns upon changes like "it never worked, but we've
> fixed it now" being submitted as fixes. It's been broken for years,
> and since nobody complained yet, going via the normal development path
> (i.e. -next) seems perfectly fine to me.

Personally, I also don't think this _needs_ a stable tag.
The whole if it ain't broke thing ....

If stable-maintainers do think it valuable on their own (without stable tag)
then by all means, but changing how the PLL rate stuff works has the
_ability_ to introduce other behaviour _somewhere_.


> > In any case, this patch is doing too many things at once. I see the
> > following things that would warrant individual patches:
> >
> > 1) fix the wrong denominator, stable candidate IMO,
>=20
> I could split this one out, but since it's a trivial one-liner, I'd
> like to hear what Heiko prefers.

yes please.
=2D Subject: Foo and Bar
=2D Commit message with "while at it"
are clear indicators that the change wants to get split ;-)

So please split out that "while at it" part. The rest can stay
together though.


Thanks
Heiko



