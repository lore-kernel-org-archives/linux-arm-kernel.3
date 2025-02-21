Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33D8C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 23:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RL4zE6TnAeAm2EGG06zVw62XGOta0fzkkKj9kIbkW0=; b=SRX8qX3GTkFBu9yoZErrQZmNk4
	gyVCn0tgNKasVHqCREYoT0b36kQVS7lFohcYPh8eoFlxWcNfYzllzyETG+FPLXXhpZsCb7B1YHOoe
	TAAliwwlBES0ypvRXWuu5DQN0eEIY7x0DV7P+gV1+p/Ulpv5TUBXHBT0qOdbP1dCvGWFOQKxbpFPA
	ghMYqthIn//XlJfRWc6uQ/AEHu/7fepmWipaRSdFvbssafluFNDUnuBVEVbMF6YAzEMprPLC/9qn0
	IPlOuQSsv9C/Q40Z4ymov0V0dKLU+tVqk0bWjZXQiio/FyC0Y9Pm0jDM481/N6oXk3MD2NjPuARSy
	sIGSvt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcL2-000000078B9-3XkB;
	Fri, 21 Feb 2025 23:21:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcIM-000000077ys-2Ka1;
	Fri, 21 Feb 2025 23:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52DD15C6E33;
	Fri, 21 Feb 2025 23:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAAFC4CED6;
	Fri, 21 Feb 2025 23:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740179935;
	bh=bh8MK+CIx4qSkdZpY0HJlhJNS5esuf77OVKu5WUvHuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+u+7RU9a0icTCmI0SZc7EVHIeD1fpkft5BFO35JBXIHy7/91y2cX9lMr8JRft8ZQ
	 GQ4TGaMhaRKlYo6cmKFUZoKQffJGjNYute5/KweKyYHXQ2J7/AbMEj3pT1AR/lm6/I
	 0OWpTUoS2A9uJAds4htiS6Mzr6iIRINF1GRVeSH594Sjv0ndDbZDDKKPa3FRRafarz
	 StI2Qt6QjA4DMm57clg6MoVQDUx8rZ+wR5qe53Kjq/ZJfnkfhUn2E5cRZvrB5v/F65
	 0wPg6meOtdfdD+TFPN5WWZlookkaLs87u8RZ+YO+ZSHwzDurxdD860pO64tpiy6JZQ
	 fNpeyWYSIaeGg==
Date: Sat, 22 Feb 2025 00:18:52 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hui Ma =?utf-8?B?KOmprOaFpyk=?= <Hui.Ma@airoha.com>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Frank Li <Frank.li@nxp.com>, upstream <upstream@airoha.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjIgMi8y?= =?utf-8?Q?=5D_PCI?=
 =?utf-8?Q?=3A?= mediatek-gen3: Configure PBUS_CSR registers for EN7581 SoC
Message-ID: <Z7kJ3Ejd4Mi_Lj0b@lore-desk>
References: <SG2PR03MB6341ACD4DADDB280A8ACAA29FFC72@SG2PR03MB6341.apcprd03.prod.outlook.com>
 <20250221183131.GA353053@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hp33MBzSzf7qlCOL"
Content-Disposition: inline
In-Reply-To: <20250221183131.GA353053@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_151858_683282_EAC55E74 
X-CRM114-Status: GOOD (  20.47  )
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


--hp33MBzSzf7qlCOL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]

> >
> > 	Pbus-csr (base and mask) is used to determine the address
> > 	range can be access by PCIe bus.
> >=20
> > 1FBE3400 PCIE0_MEM_BASE 32 PCIE0 base address
> > 1FBE3404 PCIE0_MEM_MASK 32 PCIE0 base address mask
> > 1FBE3408 PCIE1_MEM_BASE 32 PCIE1 base address
> > 1FBE340C PCIE1_MEM_MASK 32 PCIE1 base address mask
> > 1FBE3410 PCIE2_MEM_BASE 32 PCIE2 base address
> > 1FBE3414 PCIE2_MEM_MASK 32 PCIE2 base address mask
>=20
> "Can be accessed by PCIe bus" sounds like DMA.  Is that what you mean?
>=20
> I doubt it, because if you have multiple host bridges, I assume they
> would all be able to handle DMA to all of system memory.
>=20
> It would make more sense if this is some sort of description of host
> bridge apertures, e.g., something like this to allow CPU MMIO accesses
> to reach the first 2GB of PCI memory space below any of the pcie0,
> pcie1, pcie2 host bridges:
>=20
>   pcie0 0000:00: root bus resource [mem 0x84000000000-0x8407fffffff] (bus=
 address [0x00000000-0x7fffffff])
>   pcie1 0001:00: root bus resource [mem 0x84100000000-0x8417fffffff] (bus=
 address [0x00000000-0x7fffffff])
>   pcie2 0002:00: root bus resource [mem 0x84200000000-0x8427fffffff] (bus=
 address [0x00000000-0x7fffffff])
>=20
> But I think this would be described via 'ranges' properties.  And I
> think it would make sense if the driver had to learn this address map
> from devicetree and program it into the hardware, so maybe that's
> what Pbus-csr is for?  Total speculation on my part.

I agree we should provide these info to the driver via the dts.

Do you agree to pass the register offsets, base address and base mask values
in the 'mediatek,pbus-csr' phandle array? Something like:

pcie0: pcie@1fc00000 {
	...
	mediatek,pbus-csr =3D <&pbus_csr 0x0 0x20000000 0x4 0xfc000000>;
	...
}

where:
- reg offset for base address:	0x0
- base address value:		0x20000000
- reg offset for base mask:	0x4
- base mask value:		0xfc000000

Or do you prefer to just pass register offsets in mediatek,pbus-csr phandle
array and get base address values reading ranges property? Something like:

pcie0: pcie@1fc00000 {
	...
	ranges =3D <0x02000000 0 0x20000000 0x0 0x20000000 0 0x4000000>;
	...
	mediatek,pbus-csr =3D <&pbus_csr 0x0 0x4>;
	...
}

Considering the latter, even if it is not a real problem for EN7581 since we
have just a single range, what if we have multiple ranges?

Regards,
Lorenzo

>=20
> Bjorn

--hp33MBzSzf7qlCOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7kJ3AAKCRA6cBh0uS2t
rEKAAQDNYeXQYGRzd9+9wAO0ybTsoTJ2fnuWrjzrVO6+sUE+LwD/QJLaQ4gD9o+V
fBwmUiVyD2DtiPqn6pxkbb3L2+XrbQI=
=bd+w
-----END PGP SIGNATURE-----

--hp33MBzSzf7qlCOL--

