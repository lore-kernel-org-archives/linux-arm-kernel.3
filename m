Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70936FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UW2ziu0vYi5bpD6WFhH5Pn3wPP3OyNm/8gp9tgp+Csk=; b=PaSdTUNCNqq0FBc3qF8zVsc+Q6
	I6WHDDFE8kyUYthy5eEPFpzi6XGencgGsMlHHapyrS/P2N1lHfZeIvqwRssem/pE9WY1JRo/3geF5
	igS94qMRJfW99noc0NMEH7p4QdhV/c+ZNY7oItH5oYaPBTNSahU4pZgDvhXSC70UHdvVoCgN8sec4
	sclfExQzFJtjjRvTsjMGJZKUQLaECwRZBJSzrGoUMYAup3EFL2/IzKGEgt2fCrDVINC3qN1cnGSDd
	Y3M34WOPNnq2uMNCMqrz7/GwE2eznkWg1z0LIE7MRBRrlrHO41C9+wR0qmCm6LoSmW/J/M5Th32jc
	hY+gVB9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHORW-0000000HGaz-2iOO;
	Mon, 27 Apr 2026 16:04:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHORU-0000000HGa6-2FtR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:04:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5BA444060;
	Mon, 27 Apr 2026 16:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE58C19425;
	Mon, 27 Apr 2026 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777305855;
	bh=UW2ziu0vYi5bpD6WFhH5Pn3wPP3OyNm/8gp9tgp+Csk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANS0RD56V9xO7muEwlXC19L7PVGslrxc8Unt6bLywkbL/6ktX+fA3CVNmVSw5ME0w
	 hHaHUAuppJxESPCR9N3xldV3rFpIXius4tc96mHRm/yntMRnQu5mJfWzgnV53K2BaI
	 +JOymfjjgNoe9tj+vIfhRtRNqFVIFVuJ+TxabdFGuo6B2Hy7FWpA0uGqayPQA0Bxdx
	 7QUbI8JBvOF4fH+Onr5mXyFMn4LdrR7t8BngJOACF9ngxr3VSQjiLEzCeyUvQeDh1Q
	 uxjTIeUmecSjAFN4dOIjMrrcdncXgOTLjqjeoq9qToILdDbSiEq40Cc2k33kx6y42i
	 ydNNto3wWQTJg==
Date: Mon, 27 Apr 2026 17:04:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	Frank Li <frank.li@nxp.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
Message-ID: <20260427-mandate-crucial-47bd161ecd73@spud>
References: <20260424025735.1490772-1-hongxing.zhu@nxp.com>
 <20260424025735.1490772-2-hongxing.zhu@nxp.com>
 <20260424-sinless-unfiled-d1087a894da5@spud>
 <AM0PR04MB522051DF5CA446158839C2BD8C362@AM0PR04MB5220.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qkvg/+lyFeMVn9Cn"
Content-Disposition: inline
In-Reply-To: <AM0PR04MB522051DF5CA446158839C2BD8C362@AM0PR04MB5220.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_090416_615369_5CC4AF9C 
X-CRM114-Status: GOOD (  15.78  )
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


--qkvg/+lyFeMVn9Cn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 03:17:12AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: Saturday, April 25, 2026 1:06 AM
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > bhelgaas@google.com; Frank Li <frank.li@nxp.com>; l.stach@pengutronix.d=
e;
> > lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; linu=
x-
> > pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-kernel@vger.kern=
el.org
> > Subject: Re: [PATCH v1 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer=
 and pme
> > interrupts
> >=20
> > On Fri, Apr 24, 2026 at 10:57:33AM +0800, Richard Zhu wrote:
> > > Add optional 'intr', 'aer', and 'pme' interrupt entries to the i.MX6Q
> > > PCIe binding to support PCIe event-based interrupts for general
> > > controller events, Advanced Error Reporting, and Power Management
> > > Events respectively.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > ---
> >=20
> > This binding supports lots of devices. Do they all have these additiona=
l interrupts?
> Currently, only i.MX95 PCIe has these dedicated SPI interrupts. The earli=
er
> SoCs in this binding (i.MX6Q/6SX/7D/8MQ/8MM/8MP, etc.) do not expose thes=
e as
> separate interrupt lines.
>=20
> I can constrain these three interrupt entries to be valid only for the i.=
MX95
> variant using conditional schemas. Would that be acceptable?

Please

--qkvg/+lyFeMVn9Cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCae+I+QAKCRB4tDGHoIJi
0qZkAP0VeBYH09JW4VBXLCbVfTkp6AJcYotAdzH9DNBySmjUwgEArxXLiGeMs/b7
yRxmf+g2s6n2tJ8PXHvaTMjIJac0FwM=
=ppW6
-----END PGP SIGNATURE-----

--qkvg/+lyFeMVn9Cn--

