Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8DCE6ADE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yxuxCJ4ORNbtsm4zJioUuknHgM7iBN9/8p1tWclHpQ=; b=hur/ekqDdBSmKZoLQEwX4m2TeE
	KNjy+gb/9LXODd5ccdgKEFvxx91BO2VdCZj2KYGKbOVe5wIGERr2P5R2uC49yGog+0adO5Ea6xxfw
	GtjPjJWnbKLRklbkaT2UcBkbhP8eBZ5muGOZGAjj1hzJ+NnoJV674tZ/Mf640j9IG8dd37F7nd63N
	D20YHnv4Tzl7AemcS1DRYoIKDcMB6zOOBH4GxG8wQViXakhSO6PiMlhlgt+CaSydPXJitlhsoPT7D
	dzlBtkY1H1ycTupTMSvywrxZEdng2FdNLny2BKoIlDt7B45rgJVoZ39LO3zS0CJNf1gTES18GOUSD
	AU/iRevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tErK6-00000004Seh-0RXh;
	Sat, 23 Nov 2024 14:41:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tErJ9-00000004SZw-0MgD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 14:40:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F0B25C26F2;
	Sat, 23 Nov 2024 14:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FB6C4CECD;
	Sat, 23 Nov 2024 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732372821;
	bh=pzNGUf+6z/1XgHhq8qeQF67X0+VudCkDC0u/GMsWE/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NatNFwUuhkd8QXIVCUMLkkgfZGT0pXlHMRq7Z1IgGtHoNA3YbFJuwWNJ27WDlIdlL
	 jrmXxEnatm1TjpnPl47ryyMpQcJwpYFqL9oDz/i2HNkYLKNgLohHdFIjNp4PL36hme
	 BVj8Kpl4FXh9hCqgO75Df3RIf6lmbYPgTsvrjD43B5UFOaTKKr29/x/qhi+jH9MATQ
	 gpox1EzJx7Nt+LkQki80jOrxZ70ZDkg4wuHwakOPFbqjNgm/sD27xkvxj8J2i4ftdR
	 pD5wYd7Qf+ek6k3bdYglrb8P1iMSuhkecL8H12m767ULYpVh+dcHovQjPpJlYwOWmY
	 Xie2/AQD89Kjg==
Date: Sat, 23 Nov 2024 14:40:10 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Aren <aren@peacevolution.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Kaustabh Chakraborty <kauschluss@disroot.org>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>, Ondrej Jirman
 <megi@xff.cz>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dragan Simic <dsimic@manjaro.org>,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] iio: light: stk3310: use dev_err_probe where
 possible
Message-ID: <20241123144010.38871d3c@jic23-huawei>
In-Reply-To: <6jwurbs27slfpsredvpxfgwjkurkqvfmzccaxnfgtuh4aks3c6@ciapprv3wsex>
References: <20241102195037.3013934-3-aren@peacevolution.org>
	<20241102195037.3013934-11-aren@peacevolution.org>
	<ZyiIcDaANjxwtCz-@smile.fi.intel.com>
	<m7x526sv5krgt4t2whn5ykyktoz5u7ihsxv3qa5yue3ucbk6lb@37spwsmlcylm>
	<ZzEPACoblmcQD9yu@surfacebook.localdomain>
	<xubjmxig4luag27ifnmqmv3x3bvzhwczwvw34kw6tssaa2d24t@ysnqh5e3g7sz>
	<ZzHSE9Nrf4YySJrq@smile.fi.intel.com>
	<4ibd5tgpt3uzbmouqdiiv5pvfxebo5qsmgn3xh6rlb73qevatv@cajznxqnlca3>
	<6jwurbs27slfpsredvpxfgwjkurkqvfmzccaxnfgtuh4aks3c6@ciapprv3wsex>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_064023_217919_7DB84837 
X-CRM114-Status: GOOD (  39.96  )
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

On Tue, 12 Nov 2024 18:11:37 -0500
Aren <aren@peacevolution.org> wrote:

> On Tue, Nov 12, 2024 at 11:15:54AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > Hello Andy, hello Aren,
> >=20
> > On Mon, Nov 11, 2024 at 11:44:51AM +0200, Andy Shevchenko wrote: =20
> > > On Sun, Nov 10, 2024 at 04:34:30PM -0500, Aren wrote: =20
> > > > On Sun, Nov 10, 2024 at 09:52:32PM +0200, Andy Shevchenko wrote: =20
> > > > > Sun, Nov 10, 2024 at 02:14:24PM -0500, Aren kirjoitti: =20
> > >=20
> > > You can do it differently
> > >=20
> > > #define STK3310_REGFIELD(name)							\
> > > do {										\
> > > 	data->reg_##name =3D							\
> > > 		devm_regmap_field_alloc(dev, regmap, stk3310_reg_field_##name);	\
> > > 	if (IS_ERR(data->reg_##name))						\
> > > 		return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
> > > 				     "reg field alloc failed.\n");		\
> > > } while (0)
> > >  =20
> > > > #define STK3310_REGFIELD(name) ({						\
> > > > 	data->reg_##name =3D devm_regmap_field_alloc(dev, regmap,			\
> > > > 						   stk3310_reg_field_##name);   \
> > > > 	if (IS_ERR(data->reg_##name))						\
> > > > 		return dev_err_probe(dev, PTR_ERR(data->reg_##name),		\
> > > > 				     "reg field alloc failed\n");		\
> > > > }) =20
> > >=20
> > > I am against unneeded use of GNU extensions.
> > >  =20
> > > > > > replacing "do { } while (0)" with "({ })" and deindenting could=
 make
> > > > > > enough room to clean this up the formatting of this macro thoug=
h. =20
> > > > >=20
> > > > > do {} while (0) is C standard, ({}) is not. =20
> > > >=20
> > > > ({ }) is used throughout the kernel, and is documented as such[1]. I
> > > > don't see a reason to avoid it, if it helps readability. =20
> > >=20
> > > I don't see how it makes things better here, and not everybody is fam=
iliar with
> > > the concept even if it's used in the kernel here and there. Also if a=
 tool is
> > > being used in one case it doesn't mean it's suitable for another. =20
> >=20
> > Just to throw in my subjective view here: I don't expect anyone with
> > some base level knowledge of C will have doubts about the semantics of
> > ({ ... }) and compared to that I find do { ... } while (0) less optimal,
> > because it's more verbose and when spotting the "do {" part, the
> > semantic only gets clear when you also see the "while (0)". Having said
> > that I also dislike the "do" starting on column 0, IMHO the RHS of the
> > #define should be intended. =20
>=20
> Thank you, this sums up my opinion on this better than I could have (and
> some bits I hadn't considered).
>=20
> > So if you ask me, this is not an unneeded use of an extension. The
> > extension is used to improve readabilty and I blame the C standard to
> > not support this syntax.
> >=20
> > While I'm in critics mode: I consider hiding a return in a macro bad
> > style. =20
>=20
> Yeah... probably worse than any of the formatting options here. I guess
> the proper way would be to use devm_regmap_field_bulk_alloc, but that's
> well outside the scope of this series. Perhaps it would make sense to
> move the macro definition to just before the function it's used in so
> it's at least a little easier to spot?

It's only used 8 times.  I'd just get rid of the macro - which now
has even less advantage as the change here reduces the length of the
macro.

Normally I'd argue it should be a precursor patch, but here I think it is
fine to just do it in this patch to avoid a lot of churn.

No macro, no disagreement on formatting ;)

I'm not really sure why I let this macro in to begin with. I normally
push back on this sort of thing. Must have been a low caffeine day :(

Jonathan


>=20
>  - Aren


