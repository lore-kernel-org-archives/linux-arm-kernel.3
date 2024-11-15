Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD90D6A225
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 01:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6dvhNBSufXPQX8lQzQ2TuJiuPyCv94Nnf2S5EFYyzM=; b=2hrndhwW3xBbzKy6/21zGS1Hga
	g27XhSu4MKq5eqWtxyYTY08K3I+cvTmQRRoQO/T1aY+FdHG0ESegVRA81nK7IlvkkcnGJo9EG7eP+
	2GDFrpI8mwnDtZEDeiaItEFuxodVLhmAjE0tp6T4XQLX+C2vM6agDFZLlNAa8UPQGPvqUw+3s1b3Y
	zSqeaNjwgOku0Vki8zJewEgv5AKD4BHh6j30IQ3zZn07izLjM1PjLsEfdUMUkVjW7EyqI78B07EqM
	PdcXBuNmOA/W/xdIxg705HrCZPXlFD8Mb6jALg/W6bIvxC2e+Qu7QyM433ruqCT3gB6hoYWxQxjL1
	yfxCS7Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBlAm-00000001JL5-0uF7;
	Fri, 15 Nov 2024 01:30:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBl9p-00000001JCO-3tlV;
	Fri, 15 Nov 2024 01:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1150BA41D43;
	Fri, 15 Nov 2024 01:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946C1C4CECD;
	Fri, 15 Nov 2024 01:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731634196;
	bh=F7vjyos0o0cMAhq/QgY+/gErSw+KDdiVVSrnj53mNpI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U3jc+NoYqih9t4XYPl8bBhd15QLfcgEeksTy//Rp2d2nGRctt9Dcp23AQ8BO4mQwM
	 xNRvSiTJEENI7Ju7D5OuVF+l31xIJM1E5r29OiugiXvikQNAqDS7UUq+yPYcgfsx85
	 sfwpG/xQ9zYmXw3vWRxe6AmxJZTgHS1j6kAbOhkkV6xVzWsyWNyCcDH4U78ZNXf3lN
	 y8RjonQ9d0H14CuP2XgNuiRZWUcrcLPx9HlNl1fG4DbnjXx917CI3E3FJIN3PrvfVf
	 V1JJGpMDtUg2Gs+F2KhYqNKwtm+VLet5xVzlMoyAmqXSvyX3g8pOLnVm1cYWz99pVo
	 DOCosyyQ6rDag==
Message-ID: <430bde3b35382e640843e32a9f351326.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241106-freefall-slider-db379b05821e@spud>
References: <20241002-private-unequal-33cfa6101338@spud> <20241002-hula-unwashed-1c4ddbadbec2@spud> <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org> <1jwmiqsks3.fsf@starbuckisacylon.baylibre.com> <20241003-tacking-ladylike-dfe2b633e647@spud> <20241106-freefall-slider-db379b05821e@spud>
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to common code
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Conor Dooley <conor@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 14 Nov 2024 17:29:54 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_172958_192211_6B1BCD13 
X-CRM114-Status: GOOD (  47.54  )
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

Quoting Conor Dooley (2024-11-06 04:56:25)
> On Thu, Oct 03, 2024 at 12:33:40PM +0100, Conor Dooley wrote:
> > > IIRC, Stephen's idea was more the bring regmap support in clk-gate.c,
> > > clk-mux, etc ... I'm not quite sure how make iomem and regmap co-exist
> > > in a manageable/maintainable way within those drivers (without adding=
 yet
> > > another level of abstraction I mean) ? Silently creating a regmap may=
be
> > > ? but that's probably a bit heavy. I did not really had time to dig m=
ore
> > > on this, I guess no one did.
> >=20
> > I guess I have some motivation to looking into it at the moment. I had
> > my reservations about the Meson approach too, liking it more than
> > Qualcomm's didn't mean I completely liked it.
> > It was already my intention to implement point b of your mail, had the
> > general idea here been acceptable, cos that's a divergence from how the
> > generic clock types (that the driver in question currently uses) work.
> > And on that note, I just noticed I left the mild-annoyance variable name
> > "sigh" in the submitted driver changes, which I had used for the
> > clk_regmap struct that your point b in the link relates to.
> >=20
> > > I don't really have a preference one way or the other but if it is go=
ing
> > > to be exposed in 'include/linux', we need to be sure that's how we wa=
nt
> > > to do it. With clocks poping in many driver subsystems, it will
> > > difficult to change afterward.=20
> >=20
> > Yeah, I agree. I didn't expect this to go in right away, and I also
> > didn't want to surge ahead on some rework of the clock types, were
> > people to hate even the reuse.
>=20
> Hmm, so how (in-)complete of a regmap implementation can I get away
> with? I only need clk-gate and clk-divider for this patchset...
>=20
> Shoving the regmap into the clk structs makes things pretty trivial as I
> don't need to do anything special in any function other than
> clk_*_readl()/clk_*_writel() and the registration code. A flag isn't
> even needed to determine if a clock is a regmap one I don't think, since
> you can just check if the regmap pointer is non-NULL.

For the basic clk types I think it would be good to leave the old stuff
alone. We have already split the logic out into helpers, so I wonder if
we can do this better by making kernel modules for the different basic
regmap clk types and exposing registration APIs. If we force drivers
that use the basic regmap types to 'select' the module then we'll make
it so that we don't include code that isn't used anywhere. That's one of
the problems with the basic clk types, it's always built. It also lets
us avoid making regmap a dependency for the clk framework at large.

Doing that would also let us avoid the flag because it will be explicit
in any registration API, clk_register_divider() vs.
clk_register_regmap_divider(). Yes we duplicate some boiler plate logic
around read-only and registration paths, but this is alright as long as
we can share most of the code and gain the advantage of removing the
code entirely when it isn't used.

I wonder if we can even make a regmap on the fly for the iomem pointers
so that clk_divider_readl() can always use the regmap API to access the
hardware. Sounds wasteful but maybe it would work.

> My use case doesn't
> actually need the registration code changes either as, currently, only reg
> gets set at runtime, but leaving that out is a level of incomplete I'd not
> let myself away with.
> Obviously shoving the extra members into the clk structs has the downside
> of taking up a pointer and a offset worth of memory for each clock of
> that type registered, but it is substantially easier to support devices
> with multiple regmaps that way. Probably moot though since the approach y=
ou
> suggested in the thread linked above that implements a clk_hw_get_regmap()
> has to store a pointer to the regmap's identifier which would take up an
> identical amount of memory.

We don't need to store the regmap identifier in the struct clk. We can
store it in the 'struct clk_init_data' with some new field, and only do
that when/if we actually need to. We would need to pass the init data to
the clk_ops::init() callback though. We currently knock that out during
registration so that clk_hw->init is NULL. Probably we can just set that
to NULL after the init routine runs in __clk_core_init().

Long story short, don't add something to 'struct clk_core', 'struct
clk', or 'struct clk_hw' for these details. We can have a 'struct
clk_regmap_hw' that everyone else can build upon:

  struct clk_regmap_hw {
        struct regmap *regmap;
        struct clk_hw hw;
  };

and then set the regmap pointer during registration in
clk_hw_init_regmap().

int clk_hw_init_regmap(struct clk_hw *hw)
{
	struct device *dev;
	struct regmap *regmap;
	struct clk_regmap_hw *rhw;

	rhw =3D clk_hw_to_clk_regmap_hw(hw);

	dev =3D clk_hw_get_dev(hw);
	if (!dev)
		return -EINVAL;

	regmap =3D dev_get_regmap(dev, hw->init->regmap_name);
	if (!regmap)
		return -EINVAL; // Print helpful message
	rhw->regmap =3D regmap;

	return 0;
}

or we can even make it so that there's clk_hw_init_regmap() and
clk_hw_init_regmap_name() so that drivers can have multiple functions if
the clks need different regmaps.

int my_init_regmap(struct clk_hw *hw)
{
	int ret;

	ret =3D clk_hw_init_regmap_name(hw, "my_name");
	...
}

If you don't need the multiple regmap support then it's fine to punt
here until later.

>=20
> I don't really care which way you want it done, both are pretty easy to
> implement if I can get away with just doing so for the two standard
> clock types that I am using - is it okay to just do those two?
>=20

Of course, doing only what is minimally required is better than changing
everything if you're not sure the approach is going to land.

