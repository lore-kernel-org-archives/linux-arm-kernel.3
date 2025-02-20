Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DF8C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 19:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOvzWY6ABadvT5xa259YuvIxGBGE+Y6Hz8GLo7hq+lg=; b=NhYPzM9w6BDBrYjzxDCjKKMncg
	rhADYyd7izneNJYYlgNOxyzQT7OSCEFdsBoL5PWLZXePstynOT7odJdpTTF26tpf2gn4EShsjrYee
	9Pju87un3U95JrAWPXFi8r6wTcnoqkQOJLhdv6nPT7Wpcj4ca/nxv+ir5ksnGtkDplRyRg0LHWrVQ
	4RRw0d39wGyYmWw/udkfwT0ziSkZyO3SVQD4wpfcW6hQvWo/av1p1oQtCRorfL0JQm/TwMriiwgW5
	fh3ESraZktGhj/eyou4P8YWCQBGx23nFxOtqW3T6WLNjo6WMfkGbesHQCdaceg9iaCnGnfC5KG9lq
	kmJGJdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlCe6-00000002gk9-2B7a;
	Thu, 20 Feb 2025 19:55:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlCcc-00000002gY1-2F9p;
	Thu, 20 Feb 2025 19:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4458F682FD;
	Thu, 20 Feb 2025 19:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D37C4CED1;
	Thu, 20 Feb 2025 19:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740081249;
	bh=a9vt04KA1MDS4IICjnNI7NCM4qTVHSnqdKEThe5pCWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MQg7iSG9gDofeH2db6FMxQ4jnpVbPFEcDl8ph5EUlpJO8G63JdIlDLObGPuKS5pMI
	 lk17YCoLTggN4zVHaZMNBM9CzEwry5dgb7VzyXza5dkMOeU/bhoRLTjw68HqrLmGyv
	 IBn6xG2Krt+uxu94rpTlrt8P8q9vBgGpSPXM1l0Kj2rM/X22wJaLSEOEY1Z8XebjUL
	 wv3WIjR6/54P8pi0qBaEnYTl8t9Uk45zyKl3saOXo4/EjXONd7EQp+Pnw4PAVSVDKu
	 yT6799UpILNO0RMUvOkUGbRBMUxxdfe89QZ9RGOg8A6KDbfu/zYWQ52HY4JcvcjF94
	 vXffU5owGoIzQ==
Date: Thu, 20 Feb 2025 20:54:06 +0100
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
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
Message-ID: <Z7eIXsupArd8xH7_@lore-desk>
References: <20250202-en7581-pcie-pbus-csr-v2-2-65dcb201c9a9@kernel.org>
 <20250220182046.GA304343@bhelgaas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r7/KtajXtvVLSXMm"
Content-Disposition: inline
In-Reply-To: <20250220182046.GA304343@bhelgaas>
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


--r7/KtajXtvVLSXMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 20, Bjorn Helgaas wrote:
> On Sun, Feb 02, 2025 at 08:34:24PM +0100, Lorenzo Bianconi wrote:
> > Configure PBus base address and address mask to allow the hw
> > to detect if a given address is on PCIE0, PCIE1 or PCIE2.
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 30 +++++++++++++++++++++=
+++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/=
controller/pcie-mediatek-gen3.c
> > index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..9c2a592cae959de8fbe9ca5=
c5c2253f8eadf2c76 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/irqchip/chained_irq.h>
> >  #include <linux/irqdomain.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/msi.h>
> >  #include <linux/of_device.h>
> > @@ -24,6 +25,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> >  #include <linux/reset.h>
> > =20
> >  #include "../pci.h"
> > @@ -127,6 +129,13 @@
> > =20
> >  #define PCIE_MTK_RESET_TIME_US		10
> > =20
> > +#define PCIE_EN7581_PBUS_ADDR(_n)	(0x00 + ((_n) << 3))
> > +#define PCIE_EN7581_PBUS_ADDR_MASK(_n)	(0x04 + ((_n) << 3))
> > +#define PCIE_EN7581_PBUS_BASE_ADDR(_n)	\
> > +	((_n) =3D=3D 2 ? 0x28000000 :	\
> > +	 (_n) =3D=3D 1 ? 0x24000000 : 0x20000000)
>=20
> Are these addresses something that should be expressed in devicetree?

Do you have any example/pointer for it?

> It seems unusual to encode addresses directly in a driver.

AFAIK they are fixed for EN7581 SoC.

Regards,
Lorenzo

>=20
> Bjorn

--r7/KtajXtvVLSXMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7eIXgAKCRA6cBh0uS2t
rODVAQCdAljwq2vNJmbULwgMrd2Aor9AHVtCJcbBL3l5en3JtwD+Iruof33D+sne
2PSsZLFo/2Gaai40Zvly4mtcqRcDGAs=
=lTq/
-----END PGP SIGNATURE-----

--r7/KtajXtvVLSXMm--

