Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C89FD6406B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjpzigGlEQDJ2CigPAkvVL/9wMtokixn1HfLhNuWprM=; b=q9HZ2aHiJWJmjNJp/mzUxVxURn
	1SWYXlCpt3IxwjNJk5p9vDT8uEWu9WZE+SlUW4m74Q7wbm9/y9Jl2kpbw+TtatUhKqZsalTCZMiGY
	1FeGeJiqSmLxJA1YUKcnSL7PWgOXquZWsubD1mxI8LAiNB6/GrN26TTCa39eLT9Hm0cGYwWP7vn6B
	7zdD96ULTLduscI0ALbdkiF00l81KW3Wu9cupZABu2mTeDldMgUGQROBF5lB+En/8oyzxo4AC6Laj
	bL/KX9BMz8HVPvzxTVoUYVvRht58ZePFQ0r/oxJAjFCxYDArVEPqmgpms2cfX76aUxaapDvP9VTyb
	iL/UcaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SdL-0000000BMv8-4BVx;
	Fri, 08 Nov 2024 17:18:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9SaY-0000000BMbe-1xcw;
	Fri, 08 Nov 2024 17:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 442275C5BEF;
	Fri,  8 Nov 2024 17:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4152FC4CECF;
	Fri,  8 Nov 2024 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731086161;
	bh=k0xll76MHqvxLaZR25USTSXDgvhxHc72FiFw4Fp/71A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDKJrTqY9lsU0wTCPUufm/SLE0KgoPrvYKHTcmvQeJesbathuWJAXlH81TBPfK6rt
	 sRs3q/tFTfK/OjSPDeKcMI4ekfFAmTsZoUtpNwTx+iYOOx4K3VYC/7tTlvILv/s6a5
	 YtT7IBC/eB/2EBrCtXluhRED/BTPA+LQ3PfIbfehODeAdw5g9jLYVargM2yRYzIS5o
	 s8ntQ4j+1Vfy16yK27X/iUcxDhm9wmTFb0n7q3smUg030tcJHMk0bZtwyoD+7JN8tn
	 9uc71RHlIAnM/5SlLo0h3PVCweaXSy8jQY7K3ulH88x0Bky+QmL2zRe3SdKFEJIjZd
	 wqG2FTiWdEHgg==
Date: Fri, 8 Nov 2024 18:15:59 +0100
From: "lorenzo@kernel.org" <lorenzo@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jianjun Wang =?utf-8?B?KOeOi+W7uuWGmyk=?= <Jianjun.Wang@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>, "kw@linux.com" <kw@linux.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Ryder Lee <Ryder.Lee@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <Zy5HT63apyjYWJ-6@lore-desk>
References: <547216d36f8eaa313690ff8b52407ae46b8e9c40.camel@mediatek.com>
 <20241108164817.GA1665283@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mP5VRDHikAF8nc1W"
Content-Disposition: inline
In-Reply-To: <20241108164817.GA1665283@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_091602_619811_DCEF7DFB 
X-CRM114-Status: GOOD (  21.49  )
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


--mP5VRDHikAF8nc1W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 08, Bjorn Helgaas wrote:
> On Fri, Nov 08, 2024 at 02:51:15AM +0000, Jianjun Wang (=E7=8E=8B=E5=BB=
=BA=E5=86=9B) wrote:
> > On Thu, 2024-11-07 at 10:21 -0600, Bjorn Helgaas wrote:
> > > On Thu, Nov 07, 2024 at 05:08:55PM +0100, Lorenzo Bianconi wrote:
> > > > > On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> > > > > > In order to make the code more readable, move phy and mac
> > > > > > reset lines assert/de-assert configuration in .power_up
> > > > > > callback (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
> > > >=20
> > > > ...
> > > > > Is there a requirement that the PHY and MAC reset ordering be
> > > > > different for EN7581 vs other chips?
> > > > >=20
> > > > > EN7581:
> > > > >=20
> > > > >   assert PHY reset
> > > > >   assert MAC reset
> > > > >   power on PHY
> > > > >   deassert PHY reset
> > > > >   deassert MAC reset
> > > > >=20
> > > > > others:
> > > > >=20
> > > > >   assert PHY reset
> > > > >   assert MAC reset
> > > > >   deassert PHY reset
> > > > >   power on PHY
> > > > >   deassert MAC reset
> > > > >=20
> > > > > Is there one order that would work for both?
> > > >=20
> > > > EN7581 requires to run phy_init()/phy_power_on() before deassert
> > > > PHY reset lines.
> > >=20
> > > And the other chips require the PHY power-on to be *after*
> > > deasserting PHY reset?
> >=20
> > For MediaTek's chips, the reset will clear all register values and
> > reset the hardware state. Therefore, we can only initialize and
> > power-on the MAC and PHY after deasserting their resets.
>=20
> OK, it sounds like you're saying the Airoha EN7581 is not a MediaTek
> chip and does require a different ordering of PHY reset deassert and
> PHY power-on:
>=20
>   - EN7581 requires PHY power-on before PHY reset deassert,
>=20
>   - other chips require PHY reset deassert before PHY power-on.
>=20
> That's fine and probably worth a short comment in
> mtk_pcie_en7581_power_up(), e.g., "Unlike the MediaTek controllers,
> the Airoha EN7581 requires PHY power-on before PHY reset deassert".
>=20
> Bjorn

ack, I will add it.

Regards,
Lorenzo

--mP5VRDHikAF8nc1W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZy5HTgAKCRA6cBh0uS2t
rMXUAPwKaa0k+wzeRsFnVFQl6FYhu8AAuAyB7EJEhAKPeWFLRgEAvNRquIoimvKX
1geNkZm6VWuYNkLa0MCU4Xkk/Y7xfw8=
=E6vM
-----END PGP SIGNATURE-----

--mP5VRDHikAF8nc1W--

