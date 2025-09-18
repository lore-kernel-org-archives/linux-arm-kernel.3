Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3883FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaOX8CjoyUG9qn0msiW+iW7M7a9L/kr5yJ/0TVBEDbs=; b=kT7jVcN+dgopQThHi2JcVxeyS9
	ndtadqPGnyEgk1F2o1n882kOByZcbqXDq5gV6iCBZs1XV0nvw0dFVrhPqSq+JFJAspnbjwAziv8VC
	BbxvpRH2R5vGA6z2qxWu2l16ovIEHph7S5wKuzPns8UBWnepUe817db2Y2Z/zF1AWBXVt/5U2Ls6s
	hpxcxUwJ8aq4MHfEHwYzyWUPzOMov1D8/uiNWPUSfURYhwQ3wF4Ytx1LgIkjbJ+o+cKpiCpfnB3ER
	3aAA8d1AHjd4xp4b4qkshRHJkhMl6xuKt+TPQTCkwkX1BydmVuimZfAduatdDp69g32ff3sgSBm0k
	CcWaj2lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGP5-00000000Kob-2NBT;
	Thu, 18 Sep 2025 15:18:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGP3-00000000Kn6-1GG6;
	Thu, 18 Sep 2025 15:18:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0EAC40414;
	Thu, 18 Sep 2025 15:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAE5C4CEE7;
	Thu, 18 Sep 2025 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208712;
	bh=T4wS9mTXcpSpv5NeMblAj4UwyO9r3doA7Bdhw2LH3VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uLi4AGnfRF6V6De0JAQgyez9xlUDmOFx461zVUm3XCG3sP4T0+DSxdMQyyFkuOUhV
	 +Vh0+IHpwVsE1AZMdCz4UjHMuDlwhMrk39tlWhDcGgoEsf0H6LULv5ssc1b5PCpbhd
	 JdIa4NK88xzdm/0CBrNg88tIE/Fx13gh/UUhVDeR2zvkFOqfwIosu0udNELsXGdBkl
	 Js0qFWwQZgoA63M3jyhl2eCC8j64ckbBPtWR2RrV6aeDGgTIOkwrsNNEzkg2vc6zCf
	 TfonVsjS25GolhGQGXBUZ0rgcw0cK/3wgOdylL6W6s1718xsH2XOddKjhMSuq6sr/2
	 Gdq9xsJAzr/NA==
Date: Thu, 18 Sep 2025 16:18:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 05/25] dt-bindings: rtc: Add RDA Micro RDA8810PL RTC
Message-ID: <20250918-unharmed-bloating-8b573513fce6@spud>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
 <20250917-rda8810pl-drivers-v1-5-74866def1fe3@mainlining.org>
 <20250917-contort-sassy-df07fd7515a0@spud>
 <c905fb3ace281280f1ac11c7fbe8e0aa@mainlining.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qnPPSzmWE/KqIUbp"
Content-Disposition: inline
In-Reply-To: <c905fb3ace281280f1ac11c7fbe8e0aa@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_081833_383063_455BEA12 
X-CRM114-Status: GOOD (  23.33  )
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


--qnPPSzmWE/KqIUbp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 11:11:10AM +0700, Dang Huynh wrote:
> On 2025-09-18 03:46, Conor Dooley wrote:
> > On Wed, Sep 17, 2025 at 03:07:22AM +0700, Dang Huynh wrote:
> > > Add documentation describing the RTC found in RDA8810PL SoC.
> > >=20
> > > Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> > > ---
> > >  .../devicetree/bindings/rtc/rda,8810pl-rtc.yaml    | 30
> > > ++++++++++++++++++++++
> > >  1 file changed, 30 insertions(+)
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
> > > b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..3ceae294921cc3211cd77=
5d9b3890393196faf82
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
> > > @@ -0,0 +1,30 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/rtc/rda,8810pl-rtc.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: RDA Micro RDA8810PL Real Time Clock
> > > +
> > > +maintainers:
> > > +  - Dang Huynh <dang.huynh@mainlining.org>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: rda,8810pl-rtc
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> >=20
> > Your driver implements functions that turn on an alarm irq, but there is
> > none mentioned here. What's going on there?
> The RTC doesn't seem to have an AP IRQ associated. I can't find any
> reference to it on downstream kernel and the docs.
>=20
> >=20
> > Additionally, there's no clocks property? For an onboard RTC I'd have
> > expected there to be a clock sourced outside of the block.

What about the clock?

> >=20
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    rtc@1a06000 {
> > > +      compatible =3D "rda,8810pl-rtc";
> > > +      reg =3D <0x1a06000 0x1000>;
> > > +    };
> > >=20
> > > --
> > > 2.51.0

--qnPPSzmWE/KqIUbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMwiwQAKCRB4tDGHoIJi
0mfkAP9yS2bi4VD6hutTCOIeT3qJB84qFVZONJYP1wnhQwLGeAD8CFxZvCN6Jv4e
UC/tOu6vHervFswpc7sqlf9k4hh+qQs=
=wDJV
-----END PGP SIGNATURE-----

--qnPPSzmWE/KqIUbp--

