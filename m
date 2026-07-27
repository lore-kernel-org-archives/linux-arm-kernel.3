Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B3DC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 15:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiklzXx8p5bBY0lwFSAP/eLHXWDp5ZhVdI0sClUc26c=; b=Y976+Tp2iRJ1T/XnFzEsh6wwBD
	a30g99iJP3ULjPLDM77iSqvzvT+e39QpEm5FAGtesYwLBDaSc1de7694nPaXumHmYtqQ5BHubdowj
	+ZVrb2lYLLVeeU8a2TfCt03IgBPPsRPvbMc5znI40zwEMIbLHKkidn7wqoV0JwqNP+PKxOCjO5QEW
	FB2akWAcUB7fm00tudjNBS7Vpxo/TiPf5y0La4sx2owxhMWgbhTM8tXM5XatH/F73ikiBWQSPuOmr
	ZVNyfAhc1vpAhtYmeDv8ulw+r7S+hYf85L3+HOKjzHuyNiNbCavZAA9gjVKlaA9V3LBCxO/UYXAkb
	rf6l64Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNQ2-00000003Cwn-29U4;
	Mon, 27 Jul 2026 15:39:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNQ1-00000003Cwb-3Pp6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 15:39:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 877E040016;
	Mon, 27 Jul 2026 15:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67ED1F000E9;
	Mon, 27 Jul 2026 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785166745;
	bh=OiklzXx8p5bBY0lwFSAP/eLHXWDp5ZhVdI0sClUc26c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VIuydFFkDbR7M6wzVg7E2NhUc4eI1TG9hrt9IcyouTAx+xh4che7OJQvgPQP0FBdt
	 rMfdAlEIRhluCTFT4SyRj6/szrxO73m+BayZtLpJkicU6sY4U2gNma1fWvOCFW+7fI
	 BDvoTb1H3ohwFfrMZerEWqOD7s7lO9upZXECHZWgGaqo220Sz89ZAikEMAjB3Siezz
	 8eaMU7HXu6Sjc5MJTflRVMGO4AY7hbbJWEtg8rYIGmB2HzlQvKB0RF+Ugd/6Y+IHDv
	 pkoPl5r0KpdQVr/QSDi4sBV+IWUgCw2a0jNAiq/GjUGCDY5rj23fvRvmha5f+YZRuR
	 Cd+VAJW+x0ScA==
Date: Mon, 27 Jul 2026 17:39:02 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
	Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>, 
	Manikanta Maddireddy <mmaddireddy@nvidia.com>
Subject: Re: [PATCH v8 4/6] PCI: tegra: Add Tegra264 support
Message-ID: <amd7fUUzD9ZLc-85@orome>
References: <20260716-tegra264-pcie-v8-4-23e51589229b@nvidia.com>
 <20260722164442.GA742885@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zk2gh5hl3rqyqvvg"
Content-Disposition: inline
In-Reply-To: <20260722164442.GA742885@bhelgaas>
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


--zk2gh5hl3rqyqvvg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 4/6] PCI: tegra: Add Tegra264 support
MIME-Version: 1.0

On Wed, Jul 22, 2026 at 11:44:42AM -0500, Bjorn Helgaas wrote:
> On Thu, Jul 16, 2026 at 07:07:15PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add a driver for the PCIe controller found on NVIDIA Tegra264 SoCs. The
> > driver is very small, with its main purpose being to set up the address
> > translation registers and then creating a standard PCI host using ECAM.
> > ...
>=20
> > + * The various memory regions used by the controller (I/O, memory, ECA=
M) are
> > + * set up during early boot and have hardware-level protections in pla=
ce. If
> > + * the DT ranges don't match what's been setup, the controller won't b=
e able
> > + * to write the address endpoints properly, so make sure to validate t=
hat DT
> > + * and firmware programming agree on these ranges.
> > + */
> > +static bool tegra264_pcie_check_ranges(struct platform_device *pdev)
>=20
> Drive-by comment: I have a bit of an aversion to boolean functions
> named "check" because "check" is not a predicate with a true/false or
> yes/no answer.
>=20
> "true" usually means success, which is the opposite of functions that
> return 0 for success.
>=20
> In this case, it looks like "if (tegra264_pcie_check_ranges())" means
> the DT ranges match the hardware configuration.  If it were named
> "tegra264_pcie_valid_ranges()" or similar, an "if" test like that
> would read better.

Indeed, "valid ranges" is superior in this case.

Thierry

--zk2gh5hl3rqyqvvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpne5YACgkQ3SOs138+
s6GQ+A//WeFzw3KoYVOzNsMrSzRoXie99HtTHVBPg/kBvr4ois0lZ3WQEHa+J2Ud
1l5V2hv3q760uHAfQ+kvsOkJByU04WCKNXR3DphG6dEhRap42EfFan16PUWV3GCv
eH3X+5ohtv4G+U8BPfcyvKu6rRLfHAIfCLUv4yOVr7tU6LbLTzrADExj70mQrhM7
AzHjzmAzc323jnPOHhFg+YXFRlK+Y6VPh5zT0+EgA0JwFnOjrEf7d5JEP5HPfPuT
AZMEf7CJnoICRMWS1SjXaNBPllgK61MVhx9EC79/6oMWi1I89+Glutlhz9GTwdVj
Iw61t+2+vQxJQtpRQVSSBwnLnV3lRBvBbKsJZ9DSrbT8xz1BXeG2eTOGdgROD97/
KnkgHIYzpKL68OWWeXeb2FV7uJJocRIHUpaX5MA73gIHBsArGzmkOMhp69XOAGzC
i4a313skcX7hcUjNyKu9H0wSxf05QG9PhnICVIJb8lsD0edb5Ax19h8dwDzxiUXt
h48iBjYNJyzDQXxyOZxhmZ7/0v55t59lMVeokZTI7NNBu9TnL7LPV1JYeGnsRsO2
ZUy+zHcVTSGurw5UGFzAxiYnQ30lIdg7E1EMoIaVyyQnIsbmt2at7SzGoU98dCUe
ln4VM83pPz0SXFzVEcQTVUO3YkBf2DZrjWVZ0lkDYKp429FD6Gs=
=9cZE
-----END PGP SIGNATURE-----

--zk2gh5hl3rqyqvvg--

