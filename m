Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D53D5E362
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 09:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4W830OhttQ5QbtQwlkJgjLQhZkRqn3VjKZqINiqwryI=; b=JmP1QvVaiG0iCP8OUxH+FN2JVg
	g4mU9LcvS6MdPEuz8GADKLOMxaF6z2mew9Y/YTZXxC9xdVNpu7OhRf9baO5KpTX0iLQA94+p5oiJ4
	bVklTAhZD43ykr2CF6QOdBTI3bU0I5/etDUHj0renMJN8oMzZPzH7cPxDnlrlcL0OOXoaptixkCG/
	moVj/ZyGJJFt14EglxLtEdYH/2c8M1qp6XX5jk2dv38UXnTCe7h1cHprU+RAGCNPBCwpKz9UHVYf3
	uW+AxCBXA01A00KLnI/x7jTQeEgOVE5P1LJqSMVirDOlEHJg4WoRsmkwUYyBNNABxEKxzVr4LpX4g
	FcoGdYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hz3-0000000D0Lz-261E;
	Sat, 09 Nov 2024 09:42:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9hxI-0000000D0Fh-1C26;
	Sat, 09 Nov 2024 09:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C827A402AC;
	Sat,  9 Nov 2024 09:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2956FC4CECE;
	Sat,  9 Nov 2024 09:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731145230;
	bh=dyTZjDdOBaIQ7x51M83rk2Ykuy6fmA0mfnutGBFNsfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kpCcJGx7GqPO/4XgYTy/ulQkWPtv8cg9OHs6ZtQBjflHvuk3/kv7jOjitMJ8K5CHT
	 yWhBNopMG1B/UXlDMGgScaMrq6nXb75AqwoMoUwhgEL7/g5CLeutnZEqh6nTeSDxVb
	 6U0pxsVCwHAe9+6aNCYUAnsnKZ/tNPtTyPf+rpCYUu8dM58GDB/gfgWp+dSG6409Xm
	 bYE+gYXO4ZQb0xE2bdf9t2R/ttP1Ihn4j05mWlrsU9MQ+2IgEtZE1MnfPhkWOntoqa
	 Ai7pPqFajxLppttOH36PhBBIs59ez7zXDkgO5GaXT958HjzBiqMeMy7yWPR4z84xXV
	 o2vot7d89rqgA==
Date: Sat, 9 Nov 2024 10:40:28 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Hui Ma =?utf-8?B?KOmprOaFpyk=?= <Hui.Ma@airoha.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"lorenzo.bianconi83@gmail.com" <lorenzo.bianconi83@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"nbd@nbd.name" <nbd@nbd.name>, "dd@embedd.com" <dd@embedd.com>,
	upstream <upstream@airoha.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= v4 4/4] PCI:
 mediatek-gen3: Add Airoha EN7581 support
Message-ID: <Zy8uDDUWSkLVXa5G@lore-desk>
References: <KL1PR03MB6350EF22DE289B293D34FD6FFF5D2@KL1PR03MB6350.apcprd03.prod.outlook.com>
 <20241108163338.GA1663274@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5mFSINU0YQaTn1qc"
Content-Disposition: inline
In-Reply-To: <20241108163338.GA1663274@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_014032_482366_736B90B0 
X-CRM114-Status: GOOD (  50.06  )
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


--5mFSINU0YQaTn1qc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Nov 08, 2024 at 01:23:35AM +0000, Hui Ma (=E9=A9=AC=E6=85=A7) wro=
te:
> > > On Thu, Nov 07, 2024 at 05:21:45PM +0100, Lorenzo Bianconi wrote:
> > > > On Nov 07, Bjorn Helgaas wrote:
> > > > > On Thu, Nov 07, 2024 at 08:39:43AM +0100, Lorenzo Bianconi wrote:
> > > > > > > On Wed, Nov 06, 2024 at 11:40:28PM +0100, Lorenzo Bianconi wr=
ote:
> > > > > > > > > On Wed, Jul 03, 2024 at 06:12:44PM +0200, Lorenzo Biancon=
i wrote:
> > > > > > > > > > Introduce support for Airoha EN7581 PCIe controller to=
=20
> > > > > > > > > > mediatek-gen3 PCIe controller driver.
> > > > > > > > > > ...
> > > > >=20
> > > > > > > > > Is this where PERST# is asserted?  If so, a comment to=20
> > > > > > > > > that effect would be helpful.  Where is PERST# deasserted=
? =20
> > > > > > > > > Where are the required delays before deassert done?
> > > > > > > >=20
> > > > > > > > I can add a comment in en7581_pci_enable() describing the=
=20
> > > > > > > > PERST issue for EN7581. Please note we have a 250ms delay i=
n=20
> > > > > > > > en7581_pci_enable() after configuring REG_PCI_CONTROL regis=
ter.
> > > > > > > >=20
> > > > > > > > https://github.com/torvalds/linux/blob/master/drivers/clk/cl
> > > > > > > > k-en7523.c#L396
> > > > > > >=20
> > > > > > > Does that 250ms delay correspond to a PCIe mandatory delay,=
=20
> > > > > > > e.g., something like PCIE_T_PVPERL_MS?  I think it would be=
=20
> > > > > > > nice to have the required PCI delays in this driver if=20
> > > > > > > possible so it's easy to verify that they are all covered.
> > > > > >=20
> > > > > > IIRC I just used the delay value used in the vendor sdk. I
> > > > > > do not have a strong opinion about it but I guess if we move
> > > > > > it in the pcie-mediatek-gen3 driver, we will need to add it
> > > > > > in each driver where this clock is used. What do you think?
> > > > >=20
> > > > > I don't know what the 250ms delay is for.  If it is for a require=
d=20
> > > > > PCI delay, we should use the relevant standard #define for it, an=
d=20
> > > > > it should be in the PCI controller driver.  Otherwise it's=20
> > > > > impossible to verify that all the drivers are doing the correct d=
elays.
> > > >=20
> > > > ack, fine to me. Do you prefer to keep 250ms after=20
> > > > clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up() or just use=
 PCIE_T_PVPERL_MS (100)?
> > > > I can check if 100ms works properly.
> > >=20
> > > It's not clear to me where the relevant events are for these chips.
> > >=20
> > > Do you have access to the PCIe CEM spec?  The diagram in r6.0, sec=20
> > > 2.2.1, is helpful.  It shows the required timings for Power Stable,=
=20
> > > REFCLK Stable, PERST# deassert, etc.
> > >=20
> > > Per sec 2.11.2, PERST# must be asserted for at least 100us (T_PERST),=
=20
> > > PERST# must be asserted for at least 100ms after Power Stable=20
> > > (T_PVPERL), and PERST# must be asserted for at least 100us after=20
> > > REFCLK Stable.
> > >=20
> > > It would be helpful if we could tell by reading the source where some=
=20
> > > of these critical events happen, and that the relevant delays are=20
> > > there.  For example, if PERST# is asserted/deasserted by=20
> > > "clk_enable()" or similar, it's not at all obvious from the code, so=
=20
> > > we should have a comment to that effect.
> >=20
> > >I reviewed the vendor sdk and it just do something like in clk_enable(=
):
> > >
> > >	...
> > >	val =3D readl(0x88);
> > >	writel(val | BIT(16) | BIT(29) | BIT(26), 0x88);
> > >	/*wait link up*/
> > >	mdelay(1000);
> > >	...
> > >
> > >@Hui.Ma: is it fine use msleep(100) (so PCIE_T_PVPERL_MS) instead
> > >of msleep(1000) (so PCIE_LINK_RETRAIN_TIMEOUT_MS)?
> >
> > 	I think msleep(1000) will be safer, because some device won't
> > 	link up with msleep(100).
>=20
> Do you have details about this?  I guess it only hurts mediatek, but
> increasing the minimum time to bring up a PCI hierarchy by almost an
> entire second is a pretty big deal.
>=20
> If this delay corresponds to the required T_PVPERL delay and 100ms
> isn't enough for some endpoints, those endpoints should fail with many
> host controllers, not just mediatek, so I would suspect the mediatek
> controller or a certain platform, not the endpoint itself.
>=20
> If this corresponds to T_PVPERL and mediatek needs longer, I would
> document that by using "PCIE_T_PVPERL_MS * 10" and adding a comment
> about why (affected platform/device, hardware erratum, etc).
>=20
> Bottom line, I don't really care what the value is, but I *would* like
> to be able to read pcie-mediatek-gen3.c and see the point where PCI
> power is stable, a delay of at least T_PVPERL, and where PERST# is
> deasserted because that's the main timing requirement on software.

I run some testes using 100ms delay (PCIE_T_PVPERL_MS) after
clk_bulk_prepare_enable() in mtk_pcie_en7581_power_up() and it works fine f=
or
me (I tested with a MT7915 WiFi PCIe nic connected to the PCIe sock).
Moreover, we already poll PCIE_LINK_STATUS_REG register to check the link
status in mtk_pcie_startup_port(), right? I guess we can proceed with 100ms
delay in mtk_pcie_en7581_power_up().

Regards,
Lorenzo

>=20
> Bjorn

--5mFSINU0YQaTn1qc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZy8uDAAKCRA6cBh0uS2t
rImAAQDkwMD9KOG5xJJaYQvOj38pagWGxM0rSokJuHuju4oOMwEAi6RHWWvSjIT2
9FuxYsFYkf/mlv1U4N4g6VUGCJWqSg0=
=dduS
-----END PGP SIGNATURE-----

--5mFSINU0YQaTn1qc--

