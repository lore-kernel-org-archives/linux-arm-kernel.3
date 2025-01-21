Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5BBC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng2eqMTupTjCREprNu9cZAhMySruixVX+cl35uEUB4U=; b=aR7AhHu+zbv3383peqU5wb435W
	61cbApcrV/af9CktPyWF+YuKHeoQYqxLlAGy7uFOH2QIMaYB3czZl3J4oAJm2SG3DoynQUq/AgZCZ
	IggKoN6ykinqlLwpeYLyDoWZPuj70ZU+OHLkCNsRw5R0n7Ek+dxFHOWDLQIz9H0ERW1IOL8pvpbA4
	l4rTRWmsMCC8uG71ztsaFQTt9C90DupZYogYWEvuA69u358+JwqMhoQM/oN7zS+HjiBRt4AJpJM/w
	9kswCo/U5x9HamI8zlv25fPzCxkPrzH5fE0KAafcuwXUOQrslrApw7gdF2LChHW1XJqX0GLVlWNNu
	+WDl47LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taIG8-00000008VdX-3NDt;
	Tue, 21 Jan 2025 17:41:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taIDM-00000008VC0-4APY;
	Tue, 21 Jan 2025 17:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77C60A41E83;
	Tue, 21 Jan 2025 17:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F280C4CEE0;
	Tue, 21 Jan 2025 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737481139;
	bh=t1rkrWpngB8qu0qIipVwW9LLPcWHKJVK6COBi/J1BpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ajfIfNQBvTue6CtD5VhVhF9/E2qk9jDjJhV0NzExcP2VkUx2aLsxcK11UR6pvlP0H
	 olSn3FNnAN5QhBbvmrZ5pv6E+g7+a4dn9oacfDi6HGdT4S+Pz465IlabRPZzfAcr7m
	 qsGjvYwD2qgU01EskQgB7xLgQzliLJEQaxRcBPhzrmaI9Er1z7M0zCEoZwLX0OGrT4
	 QvCItcV3iN9LCLnrJ4CpMGluKkBd9Pc1VNM2PDVY2QVnZjjb0aH+sayIqrrxEsSZNN
	 T/3MGzsyw+zHg9V3egoPLxPyR821zp63YIGFy422sATrTQznzlmwmEgVk9J0K1Tf5T
	 amnyGMfni45hw==
Date: Tue, 21 Jan 2025 17:38:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to
 common code
Message-ID: <20250121-cheddar-kissing-bea27c6f2726@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-hula-unwashed-1c4ddbadbec2@spud>
 <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org>
 <1jwmiqsks3.fsf@starbuckisacylon.baylibre.com>
 <20241003-tacking-ladylike-dfe2b633e647@spud>
 <20241106-freefall-slider-db379b05821e@spud>
 <430bde3b35382e640843e32a9f351326.sboyd@kernel.org>
 <20241128-monstrous-embargo-a665d921410d@wendy>
 <e53adbf9fdf6e3f142083b0d40d074ca.sboyd@kernel.org>
 <20241206-threaten-showing-1214491f3899@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0nzZXl//t82IHPg6"
Content-Disposition: inline
In-Reply-To: <20241206-threaten-showing-1214491f3899@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_093901_156282_007284B5 
X-CRM114-Status: GOOD (  38.15  )
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


--0nzZXl//t82IHPg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Stephen,

Any thoughts on the example I gave below?

On Fri, Dec 06, 2024 at 01:56:08PM +0000, Conor Dooley wrote:
> On Tue, Dec 03, 2024 at 02:50:31PM -0800, Stephen Boyd wrote:
> > Quoting Conor Dooley (2024-11-28 02:36:16)
> > > On Thu, Nov 14, 2024 at 05:29:54PM -0800, Stephen Boyd wrote:
> > > > Quoting Conor Dooley (2024-11-06 04:56:25)
> > > > > My use case doesn't
> > > > > actually need the registration code changes either as, currently,=
 only reg
> > > > > gets set at runtime, but leaving that out is a level of incomplet=
e I'd not
> > > > > let myself away with.
> > > > > Obviously shoving the extra members into the clk structs has the =
downside
> > > > > of taking up a pointer and a offset worth of memory for each cloc=
k of
> > > > > that type registered, but it is substantially easier to support d=
evices
> > > > > with multiple regmaps that way. Probably moot though since the ap=
proach you
> > > > > suggested in the thread linked above that implements a clk_hw_get=
_regmap()
> > > > > has to store a pointer to the regmap's identifier which would tak=
e up an
> > > > > identical amount of memory.
> > > >=20
> > > > We don't need to store the regmap identifier in the struct clk. We =
can
> > > > store it in the 'struct clk_init_data' with some new field, and onl=
y do
> > > > that when/if we actually need to. We would need to pass the init da=
ta to
> > > > the clk_ops::init() callback though. We currently knock that out du=
ring
> > > > registration so that clk_hw->init is NULL. Probably we can just set=
 that
> > > > to NULL after the init routine runs in __clk_core_init().
> > > >=20
> > > > Long story short, don't add something to 'struct clk_core', 'struct
> > > > clk', or 'struct clk_hw' for these details. We can have a 'struct
> > > > clk_regmap_hw' that everyone else can build upon:
> > > >=20
> > > >   struct clk_regmap_hw {
> > > >         struct regmap *regmap;
> > > >         struct clk_hw hw;
> > > >   };
> > >=20
> > > What's the point of this? I don't understand why you want to do this =
over
> > > what clk_divider et al already do, where clk_hw and the iomem pointer
> > > are in the struct itself.
> >=20
> > Can you give an example? I don't understand what you're suggesting. I
> > prefer a struct clk_regmap_hw like above so that the existing struct
> > clk_hw in the kernel aren't increased by a pointer. SoC drivers can use
> > the same struct as a replacement for their struct clk_hw member today.
>=20
> Best example I guess is to link what I did? This one is the core
> changes:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dsyscon-rework-2&id=3D35904222355e971c24b3eb9b9fad3dd0c38d1393
> clk-gate has my original hack that I did while trying to figure out
> what you wanted, clk-divider-regmap is a 99% copy of clk-divider with
> the types, function names and readl()/writel() implementations modified.
> Before your last set of comments I was doing something identical to the
> clk-gate change for clk-divider also.
> Here's the changes required to my driver to make it work with the
> updated:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dsyscon-rework-2&id=3Dea40211fe20f8bc6ef0320b93e1baa5b3f244601
> It's pretty much a drop in replacement, other than the additional
> complexity in probe.
>=20
> Hopefully that either gets my point across or lets you spot why I don't
> understand the benefit of a wrapper around clk_hw.
>=20
> Cheers,
> Conor.



--0nzZXl//t82IHPg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/brQAKCRB4tDGHoIJi
0nEMAP9cytqQKQB1hDGGUuuWB8kfRUG6ZyWTRYsNGzXuc2Ue7gEA8dAE6AfxgRC9
ekDfb4tyAyN/mrt6sVTLQWKZX1CKqwg=
=UWpp
-----END PGP SIGNATURE-----

--0nzZXl//t82IHPg6--

