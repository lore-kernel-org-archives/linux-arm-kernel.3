Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F8AE9B258
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbOSkIjClswaPXtIytbexw0vVgDZPNWAAQu3v7t2FT0=; b=rZTsuVyfxPzzx9csWFutcgyp1t
	JoYpLA1ASe8deRJ7wC465h3ziptl0crEjMHyi0JvE9crkgjPZtpoWDfbxBfs2q8VOOdg5475g1hBk
	i5vUUm/YJn1u/l63CnAJm4BdPx1h8fEK9hY8v7cKKeXXzPiiHt/jgAipUy+erZ0/exD7of9u7XdjQ
	gk7ZXnBsvAQwtUVINirKsPtmwRAh9H4Ui4qTRBfWqgOfB92NTjHQR/27pOskBG8hTGpQRHTsuGz/E
	cYu3Fj8PNKIEig59d80ySECyQKyTbcuHa2Q7mPpwECbTWWrbPfmy1JndFwADJxmDSPmi1oFAuyP75
	bMnjEeOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurqE-000000025Iu-1HQH;
	Tue, 24 Feb 2026 12:48:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurqD-000000025Hx-1KDt;
	Tue, 24 Feb 2026 12:48:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5600A6111B;
	Tue, 24 Feb 2026 12:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53FFC116D0;
	Tue, 24 Feb 2026 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771937320;
	bh=NE+kk/QuY4v7944+aH1+qD4q77+1CSzALEv0f+0og4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBESL7E+Zs0Gxiat7NA52IJwqwX9UTl+sUtdsM93istQcGmDyU42b8wWUFoOXqSR3
	 uMTU6CQicOUGvblXr4EzyzzwDyfk0fFoHGwfT4KcAOojC0eHWDP3UYzbUpeOrxPIUK
	 iklwBVEOK2H0O5Tlp5Y0mI9FEFoppVK2vyolG+Eh5ghHp3mwWifTIUw+Icl+Y5pzML
	 bUWot/QqZP0L7k2Ku5bFG4cvRcXZOe/heIcchyAsZI43bM6uay22DDvETaOT0A65qN
	 i63RvyRAj5yNcz5zVL6D7OMFjaDMbHQplNzWY9GwvXpRs/8s9qlRV4EFzcp8Cj7kFL
	 xGyfkteOzy/Yg==
Date: Tue, 24 Feb 2026 12:48:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Wang =?utf-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>
Cc: "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>,
	"kishon@kernel.org" <kishon@kernel.org>,
	"James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Chaotian Jing =?utf-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"avri.altman@wdc.com" <avri.altman@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	"kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v7 10/23] scsi: ufs: mediatek: Handle misc host voltage
 regulators
Message-ID: <3f4920b2-4697-4897-bdca-65c9f02909d8@sirena.org.uk>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <20260216-mt8196-ufs-v7-10-b5f2907c6da7@collabora.com>
 <2c7c84a2df19624ba9f207fd3fee47a8bdd9d8dc.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1sApqFsS7KHCWKJU"
Content-Disposition: inline
In-Reply-To: <2c7c84a2df19624ba9f207fd3fee47a8bdd9d8dc.camel@mediatek.com>
X-Cookie: Obey all traffic laws.
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


--1sApqFsS7KHCWKJU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 12:38:50PM +0000, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=
=8F=8B) wrote:
> On Mon, 2026-02-16 at 14:37 +0100, Nicolas Frattaroli wrote:

> > +	if (data->num_reg_names) {
> > +		ret =3D devm_regulator_bulk_get_enable(dev, data-
> > >num_reg_names,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0 data-
> > >reg_names);

> If these regulators are only acquired and enabled once,
> why not just set regulator-always-on in the device tree?

Drivers should request and enable any regulators they require, they
should not rely on boards happening to enable a supply for them.
Similarly the board should only impose constraints that come from the
system design, it should not assume that drivers will continue to behave
as they do.

--1sApqFsS7KHCWKJU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmdnh8ACgkQJNaLcl1U
h9DiTgf/fv4WLvjpgOLLYMYODnOOXRHQd1h3dBm6KtelA8k6J759K498iOyzjgnx
A7YslxQK3ou66JhdMdWlrqY+7QykL6rXbwLBoot6l+R+wFGAEb/lqn8wF9GwrqHv
Di47ihAw78UzoJNYds6DZnYWbxmXg/AJTGBLMpT2SEDHkQP9RZTzM+/vrFooaWFd
D9icpI4Px4qj8dLhd2RbgPU/LuJNihS003UOXoPlxMCKwFZAedjtkvyIcDO4QEt/
l6h8S7R9wVG/PZNQZ8mSYL3rrkFfMU7SVdCsj/rql55fKHzbdixEN89Yyvwp1Cqw
tUY0UZW3V/fFE0ZigwUzfVZrpHJJEQ==
=9vEz
-----END PGP SIGNATURE-----

--1sApqFsS7KHCWKJU--

