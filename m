Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7376BD690F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9L51cRc7okawjFbkzxHbz6i0P5taS99TOBMQf95eNs=; b=XJjQ25edyjECo/2CtjfFRFCWm1
	46ZeANc7zC08WihrSmeCBmaGYXEC+sIbvlbRLpumfyXa1vTIudRDwpWNcWVbhi5VtLs8NawngmgXk
	E5hj9heCnDD4XfiJOLdPcI3QxX0cKjccM+re+E1Z4lujGl/oIwYe/zy/d1eBJGDZ75O476v05uXGH
	zipheQs4hyyF6vCdmect47iviMPSejXKe71Jc6oBPpxk9wroIYHHiEWJyItOlflpspahAmfLja2De
	gGwiVEeDGwxUn2ihUODtPpcb0hvUs2/wUPYIdlrNKhvYy3RLFEPJ35t6xsrKXw2zH6TRaiAYLwBki
	krVrwBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbua-0000000FHAG-1Olf;
	Thu, 28 Nov 2024 10:38:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbta-0000000FGxu-2hge;
	Thu, 28 Nov 2024 10:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732790234; x=1764326234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X//+aLlv/ZUgHtxgxEk8ipshJKC/R6yilpLawZd/s4Q=;
  b=W/6L+ODKssqUfpTz8DaB/cOGXcxDduZw2TFFJIsyFLzsKbH6B15353nb
   e9EDwSkQtPRxww6gouUCLvm2QOAkC8pol96xNiWDRoiHgYnYv7GrKOUMe
   taCXwNdoUm4G2QY5aV1A7DH+S+j8+xjdcRUNWGoccO01kIym+rNkO1pdj
   HSNYTtXY0OtCMs/v349xAI5JzFXP5LHK3RKP83JabeTP9IhLAEK4ZkrAu
   Uhf7bWJEe0FzCkVUbl8uWqNa439jtuFw/2eyfbTqpc/sBEJcySi3ZjLlU
   VNCKLfMPZrISEJIQij8/8KqSha5qj5etKWlAWHFEMAfSlROuH7xrCdqk/
   w==;
X-CSE-ConnectionGUID: wSflfb+LS36CStD+2SM6ZQ==
X-CSE-MsgGUID: PIuDtMU8RDao3fADMTrbCA==
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="asc'?scan'208";a="35386534"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2024 03:37:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Nov 2024 03:36:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 28 Nov 2024 03:36:43 -0700
Date: Thu, 28 Nov 2024 10:36:16 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, <linux-kernel@vger.kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	<pierre-henry.moussay@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, Michael Turquette
	<mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones
	<lee@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to
 common code
Message-ID: <20241128-monstrous-embargo-a665d921410d@wendy>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-hula-unwashed-1c4ddbadbec2@spud>
 <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org>
 <1jwmiqsks3.fsf@starbuckisacylon.baylibre.com>
 <20241003-tacking-ladylike-dfe2b633e647@spud>
 <20241106-freefall-slider-db379b05821e@spud>
 <430bde3b35382e640843e32a9f351326.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jOw7oZ/dHujpxqRG"
Content-Disposition: inline
In-Reply-To: <430bde3b35382e640843e32a9f351326.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_023714_810292_3CB8B92D 
X-CRM114-Status: GOOD (  23.82  )
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

--jOw7oZ/dHujpxqRG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 05:29:54PM -0800, Stephen Boyd wrote:
> Quoting Conor Dooley (2024-11-06 04:56:25)
> > My use case doesn't
> > actually need the registration code changes either as, currently, only =
reg
> > gets set at runtime, but leaving that out is a level of incomplete I'd =
not
> > let myself away with.
> > Obviously shoving the extra members into the clk structs has the downsi=
de
> > of taking up a pointer and a offset worth of memory for each clock of
> > that type registered, but it is substantially easier to support devices
> > with multiple regmaps that way. Probably moot though since the approach=
 you
> > suggested in the thread linked above that implements a clk_hw_get_regma=
p()
> > has to store a pointer to the regmap's identifier which would take up an
> > identical amount of memory.
>=20
> We don't need to store the regmap identifier in the struct clk. We can
> store it in the 'struct clk_init_data' with some new field, and only do
> that when/if we actually need to. We would need to pass the init data to
> the clk_ops::init() callback though. We currently knock that out during
> registration so that clk_hw->init is NULL. Probably we can just set that
> to NULL after the init routine runs in __clk_core_init().
>=20
> Long story short, don't add something to 'struct clk_core', 'struct
> clk', or 'struct clk_hw' for these details. We can have a 'struct
> clk_regmap_hw' that everyone else can build upon:
>=20
>   struct clk_regmap_hw {
>         struct regmap *regmap;
>         struct clk_hw hw;
>   };

What's the point of this? I don't understand why you want to do this over
what clk_divider et al already do, where clk_hw and the iomem pointer
are in the struct itself.

>=20
> and then set the regmap pointer during registration in
> clk_hw_init_regmap().
>=20
> int clk_hw_init_regmap(struct clk_hw *hw)
> {
> 	struct device *dev;
> 	struct regmap *regmap;
> 	struct clk_regmap_hw *rhw;
>=20
> 	rhw =3D clk_hw_to_clk_regmap_hw(hw);
>=20
> 	dev =3D clk_hw_get_dev(hw);
> 	if (!dev)
> 		return -EINVAL;
>=20
> 	regmap =3D dev_get_regmap(dev, hw->init->regmap_name);
> 	if (!regmap)
> 		return -EINVAL; // Print helpful message
> 	rhw->regmap =3D regmap;
>=20
> 	return 0;
> }

--jOw7oZ/dHujpxqRG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0hHlQAKCRB4tDGHoIJi
0r+YAQDAe67NaDMRenGcDGtot2a/AgJVl48Api+arsoWqWN6QAD9GCn98CCFJZBY
gZMaI09bAeDcbhzSqAEHQ9GpSbRtMAg=
=CQKc
-----END PGP SIGNATURE-----

--jOw7oZ/dHujpxqRG--

