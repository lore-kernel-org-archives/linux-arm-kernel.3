Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56815C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWCQDP2EonbsQohXGWFkMdBMmQidjDCqEH8ibMsVIyk=; b=FUC/kXQa0fe0J0K3ueXaA0tD9i
	qM1cfT0pGa/sOPiVHBUxiM1l2D95cQkA1AEOhWlXsJq9XQHTUnugkcyObPiweA2fNZQVfsmA7zHoh
	7eygzUwla9W8Wb2o0N+8vLZJCp641GqTPN/aKSdL9tQILOe1sr6QWYqCqG/PkVAZcnAVZ4GP62sgI
	sCIXYWjWuQfnLxMcb84iSTb46oDoQWcqF0y5WIJQ6gd73MMeuoHU1IDDs6HiM+wUASQ/g0PR0jSq+
	ps6v1KIVyufKcs/zoDOH6hP608maOpMfcZqaFfpz9VTEyuRXC4YwJZqQDALZ/PH0aA/IvVpL9jo6d
	hTuID8pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPFE-00000004uTR-3Wpj;
	Fri, 21 Feb 2025 09:22:52 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPCW-00000004tpg-44r1;
	Fri, 21 Feb 2025 09:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B26861182;
	Fri, 21 Feb 2025 09:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD1CC4CED6;
	Fri, 21 Feb 2025 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740129603;
	bh=S7u7a+YlaIRiD5gDT6Ek/uMJbGdPwGFC/i5GuTzW1MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDFCvYF7oXIAP8YXtkRwlcHSnczi1ouLSAX88JkId7RAAOUIOpLUIY3/OdOZZKVIZ
	 OPynsTSYi/5a0bSXNAU4XsV9Beg7LUshDPS4rbI/kHHsZw+FdVlBen8gR9fEs730e1
	 9S+pYJ4l5w2vkUBdShCSwoeF8Dz1bkAbEy/iQfxfPGDZ9jXykr61ZhemUw09/WNdOy
	 r1NouH3u9XG7xwHQ0qf8Ehx4J0iSE9ZONgPguD0F3NSUSmxkvAfdkOgs8yF16FpXWY
	 22l6htKoxIb1/8qpZuQoZM6BQ87Gq7Q8fanJqH0K0AJPT/vWyjFIAc6Z15EdtTCQbJ
	 AQTDTCiQTrzcw==
Date: Fri, 21 Feb 2025 10:20:01 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.li@nxp.com>, Hui.Ma@airoha.com, upstream@airoha.com
Subject: Re: [PATCH v2 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
Message-ID: <Z7hFQXIrpMpH_72T@lore-desk>
References: <Z7eIXsupArd8xH7_@lore-desk>
 <20250220235607.GA320302@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xQ/Sp2/8xd3sTCxm"
Content-Disposition: inline
In-Reply-To: <20250220235607.GA320302@bhelgaas>
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


--xQ/Sp2/8xd3sTCxm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> [+cc Frank, who asked the same question about DT]
>=20
> On Thu, Feb 20, 2025 at 08:54:06PM +0100, Lorenzo Bianconi wrote:
> > On Feb 20, Bjorn Helgaas wrote:
> > > On Sun, Feb 02, 2025 at 08:34:24PM +0100, Lorenzo Bianconi wrote:
> > > > Configure PBus base address and address mask to allow the hw
> > > > to detect if a given address is on PCIE0, PCIE1 or PCIE2.
>=20
> > > > +#define PCIE_EN7581_PBUS_ADDR(_n)	(0x00 + ((_n) << 3))
> > > > +#define PCIE_EN7581_PBUS_ADDR_MASK(_n)	(0x04 + ((_n) << 3))
> > > > +#define PCIE_EN7581_PBUS_BASE_ADDR(_n)	\
> > > > +	((_n) =3D=3D 2 ? 0x28000000 :	\
> > > > +	 (_n) =3D=3D 1 ? 0x24000000 : 0x20000000)
> > >=20
> > > Are these addresses something that should be expressed in devicetree?
> >=20
> > Do you have any example/pointer for it?
> >=20
> > > It seems unusual to encode addresses directly in a driver.
> >=20
> > AFAIK they are fixed for EN7581 SoC.
>=20
> So this is used to detect if a given address is on PCIE0, PCIE1 or
> PCIE2.  What does that mean?  There are no other mentions of PCIE0 etc
> in the driver, but maybe they match up to "pcie0/1/2" in
> arch/arm64/boot/dts/mediatek/mt7988a.dtsi?
>=20
> It looks like you use PCIE_EN7581_PBUS_ADDR(slot), where "slot" came
> from of_get_pci_domain_nr(), which suggests that these might be three
> separate Root Ports?

I was using pci_domain to detect the specific PCIe controller
(something similar to what is done here [0]) but I agree with Frank, it does
not seem completely correct.

[0] https://github.com/torvalds/linux/blob/master/drivers/pci/controller/pc=
ie-mediatek.c#L1048

>=20
> Are we talking about an MMIO address that an endpoint driver uses for
> readw() etc, and this code configures the hardware apertures through
> the host bridge?  Seems like that would be related to the "ranges"
> properties in DT.

I guess so, but I do not have any documentation about pbus-csr (adding Hui =
in
the loop).

As pointed out by Frank, do you agree to add these info in the dts? Somethi=
ng
like:

pcie0: pcie@1fc00000 {
	....
	mediatek,pbus-csr =3D <&pbus_csr 0x0 0x20000000 0x4 0xfc000000>;
	....
};

pcie1: pcie@1fc20000 {
	....
	mediatek,pbus-csr =3D <&pbus_csr 0x8 0x24000000 0xc 0xfc000000>;
	....
};

@Hui: can you please provide a better explanation about pbus-csr usage?

Regards,
Lorenzo

>=20
> Bjorn

--xQ/Sp2/8xd3sTCxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7hFQQAKCRA6cBh0uS2t
rMgvAP0cRVYb+GGLw9gCGcDYMXSqkWGyssZSlcc3BpNd32BPpwEA74q7lbggDL1Q
OnXA7DoPO1K0+hSFJkVPfJhFysDHAgI=
=ViXQ
-----END PGP SIGNATURE-----

--xQ/Sp2/8xd3sTCxm--

