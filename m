Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE36CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 06:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uOQcDGbXZlb6q8u3GvJiWkXjn3EaSa5gllpC9TQbrU=; b=jYo9PUrsmlXQY5h+URhBdSfbrn
	Ahk4EmyNhzT5L8SbXFmyZOUpcrTAF2rtuX2JAv9G6VHl5V2LWKi93C7n9JArsr3K1CJ6SW5RNZgXI
	asdBMuniAidKpcGrolSpLIecH2jooEuOj2xsf7N/I4uuQiFucV7w01gKmI50kDMpuUyG8sS6caPXk
	T1eCtCO22jA+3vBuuCd6nv8Q13RBAlt/z6Fa5wqr5JOFIHL7PYS3ZkyGm+UHIZJ1/56S+cH6arFE/
	arpuMEDM8TG35FpKkJfcsVxXaUROzSHJaUA3dHCfIj8EBsZXRdrtjYZJcjgvt0tn9+Lek1eCaFsa1
	/9DNcxKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTc-00000005DGu-3npe;
	Thu, 28 May 2026 06:44:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSUTT-00000005DCQ-3IB0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 06:44:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 17565605DC;
	Thu, 28 May 2026 06:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B14A1F00A3A;
	Thu, 28 May 2026 06:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779950650;
	bh=8uOQcDGbXZlb6q8u3GvJiWkXjn3EaSa5gllpC9TQbrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DMf+bZHrQTcd9uXj5YaqJ2NMKllNWB6er4xNsT03rFDsQLoZ/iEIAYctOP1m4jqhp
	 Cp1mby8xWctFOfyvR/sLyQugVI1nbSEOPIYlnLcNqgnEos7+ymmVccpbPl75Mns///
	 9GVqaoiK5KY7cJy8ON7ZUGyJR47SQoRcIKt4GvDfy0cbfp/8jGRbyQz2GRGD7NCdms
	 Lu8UkXAG7SAVhN+ZHb2df7AjXVXzmgiPqKXeVjlCB9/ijtB9DtTLSB9XUdkKzL806h
	 1KVouHE54G5rUEvNLIAQ2vf8UyV7AuT3uX/km/qBCRdx3umAiCYj2ztZ0uiZJ2fRor
	 7TQu1CQzBGjKQ==
Date: Thu, 28 May 2026 08:44:07 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
	Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
Message-ID: <ahfj-uhNTlk-byvU@orome>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
 <ahV_r6NJWnmJptT2@wunner.de>
 <ahanoZgDwq3v6x8M@orome>
 <ahcob7HMbyGvFgxc@wunner.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uc3lgg4pj4krpin7"
Content-Disposition: inline
In-Reply-To: <ahcob7HMbyGvFgxc@wunner.de>
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


--uc3lgg4pj4krpin7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
MIME-Version: 1.0

On Wed, May 27, 2026 at 07:22:55PM +0200, Lukas Wunner wrote:
> On Wed, May 27, 2026 at 10:28:51AM +0200, Thierry Reding wrote:
> > On Tue, May 26, 2026 at 01:10:39PM +0200, Lukas Wunner wrote:
> > > On Tue, May 26, 2026 at 10:53:11AM +0200, Thierry Reding wrote:
> > > > Instead of defining the wait values for each driver, use common val=
ues
> > > > defined in the core pci.h header file. Note that most drivers don't=
 use
> > > > the millisecond waits, but rather usleep_range(), so add these comm=
only
> > > > used values to the header so that all drivers can use them.
> > >=20
> > > Hm, why not just replace usleep_range() with msleep() and use the exi=
sting
> > > macro instead of defining new ones?
> >=20
> > I'm trying to somewhat unify the implementations across drivers without
> > changing behaviour. I don't have a way of testing any of these drivers,
> > so keeping the existing implementation and just switching out the symbol
> > seemed like a good compromise.
>=20
> It looks like the code was copy-pasted from one driver to the next
> and I applaud every effort to deduplicate, unify and simplify things.
>=20
> I don't quite see how using msleep() instead of usleep_range()
> should result in breakage.  The drivers are just polling for
> link up for an amount of time and as long as you're not decreasing
> that amount, everything ought to be fine.  Moving to msleep()
> should never decrease the amount.
>=20
> > Then again, I count 2 drivers (in linux-next) that use the existing
> > PCIE_LINK_WAIT_SLEEP_MS, one of which multiplies by MILLI to get at the
> > US version (so it could easily be converted to the US_MIN version). Only
> > pcie-designware.c uses msleep() with PCIE_LINK_WAIT_SLEEP_MS, so it is
> > clearly the outlier.
>=20
> Konrad Dybcio went ahead and replaced usleep_range() with msleep()
> in that driver, kudos to him.  Cf. b262518262f5 ("PCI: dwc: Use msleep()
> in dw_pcie_wait_for_link()").  If you could just carry over that change
> to the other drivers that would be great.

Alright, I see you really don't like usleep_range(), so msleep() it'll
be.

Thierry

--uc3lgg4pj4krpin7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoX5DcACgkQ3SOs138+
s6H9qQ/9FvVWlaICBU/gs8tDIB7XU9zULjHm6whhbpBn3uuDB6PqFKfGbFmLL5ch
lDezqyqIUjvskd88UahBE3f5AnEFDrqK9AstxY2VQn8/Iu60WsLlU578H2vGxshG
nCDRQZW2pQ5d85TaWhYZwOnSM0rFCbmhlPeiI1EiSuGyPDp/7IpIi3p2LC/IERee
LCmtj4bW6zQMPU6kXjJI8SfGcD67YkJHmTKPmuhcqeG6ni27BPXEJ/kzz2BfQ+1c
OdCJElFdOUtLONNLUeK5gEetp9VV1SOeZ4urDMJLG12RkP8++ql3rs/jvl8wlkGK
RFbCzXsV91mi11beDpSR8MSNew80qXMZ+qZO+VTqGv5fcRCqmoKo2t4GzQ+AB1zj
nRxWk6QeB0+yzVUyetGjuSzMMo7pzgEOcBQ0UgJam58kk7Sgz9dej1VR2//8GLbR
bkZw5uvmRtdJ0MGsQyDxgnGpZUaFLqxvomlRt3rMF9d43fU+viuHUHe0qAMLV4O0
EXnwmEjVqZMOqi9gbEt38d8lk5AhgC9RilRlG8/gzQNF4agL6U1S4cD5WVzrLzjV
TTMydaK+xfTTcCrHsSrrq0c3AzQng0TR12M5DzPGNq1gENxVYL2VQ5W3zBPMKiSl
X06TvyKmS6rpAK8F7Bm+4BG44Bd7QrqbKbtixgWNN33xe45+td8=
=0mcj
-----END PGP SIGNATURE-----

--uc3lgg4pj4krpin7--

