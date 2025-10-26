Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49A4CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 22:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9/i6w6SqygSYRvRt9N5PMQr6o7gtXkDUXRt4kUGZ1M=; b=JH9I8luc2iqXItFQU72uc3dMOZ
	m7GmyJhSLzLgkqT2S5tws1YR+emTBuDMbO12roFeMHSCvL4a38DgfOOmvUvGZ05GucRrZY8/wY7LL
	DqX+x4Ovd/fJD7plQtbQ2aDnJVjfrwv8BHRZaNEWPzi6/LLqn1Rk3RkvNE+z8UEGmGid0e4W+iEiQ
	+jRZY5t9U2TBNO4ei1MyS2/AMy2NwklRdrAKHUQ3UTsSThOTEtkGQENjOc0lQCUS3dpTvLlgIq9lC
	WdizSUguvFPfiOrgh5QQ8XOC5SdG4g7MGF5R2d38SWlVt4vhz8i3AMs0f5Ly56Bpmh/PufcOmGaQJ
	A989Gqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9BR-0000000CoUB-41W8;
	Sun, 26 Oct 2025 22:25:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD9BR-0000000CoTx-1LyE;
	Sun, 26 Oct 2025 22:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B0DA60330;
	Sun, 26 Oct 2025 22:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49624C4CEE7;
	Sun, 26 Oct 2025 22:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761517552;
	bh=YcfVCtLK/W1LvoMvGvygXNzNh0vRWUm1hNpESZXkvZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X55sznBAWggJ/HDGIZ6dcBSXLmlm8wZtp4v11We2/RanthjNuuSqrLXxB3D6+dJjG
	 KWLdA/u217zShuCi99Na37WPbV+mGEk3vLOm7l2lwkobjD01Ue0VTeVaSkehFWCkFY
	 VIsVUB+J5nn8qynVBOGW4T94+24+ocYVV67OfpVpp8MZvBE9yBuq90LCEBwr8dCLPS
	 54mHUndnVBWYO4DsnbhAUNwGBuMydDoQLLoD/wxo//W+p4+51f+YoNswBdb0VumVAz
	 faYPxFUmixtcIAAjpcJMrs7xJr5oYeDft/J4naku8wTQTYHiSwYYy3gBXnRTXFElR6
	 3f/UL93sKp2tQ==
Date: Sun, 26 Oct 2025 22:25:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 03/24] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
Message-ID: <20251026-these-wise-9b5e63c78907@spud>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
 <20251023-mt8196-ufs-v3-3-0f04b4a795ff@collabora.com>
 <20251024-thrash-amid-d5af186c4319@spud>
 <5617400.31r3eYUQgx@workhorse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LhPY1uIXOXYzwQC0"
Content-Disposition: inline
In-Reply-To: <5617400.31r3eYUQgx@workhorse>
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


--LhPY1uIXOXYzwQC0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 07:51:11PM +0200, Nicolas Frattaroli wrote:
> On Friday, 24 October 2025 19:13:36 Central European Summer Time Conor Do=
oley wrote:
> > On Thu, Oct 23, 2025 at 09:49:21PM +0200, Nicolas Frattaroli wrote:
> >=20
> > >      };
> > > +  - |
> > > +    #include <dt-bindings/reset/mediatek,mt8196-resets.h>
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    ufshci@16810000 {
> > > +        compatible =3D "mediatek,mt8196-ufshci";
> > > +        reg =3D <0x16810000 0x2a00>;
> > > +        interrupts =3D <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
> > > +
> > > +        clocks =3D <&ufs_ao_clk 6>,
> > > +                 <&ufs_ao_clk 7>,
> > > +                 <&clk26m>,
> > > +                 <&ufs_ao_clk 3>,
> > > +                 <&clk26m>,
> > > +                 <&ufs_ao_clk 4>,
> > > +                 <&ufs_ao_clk 0>,
> > > +                 <&topckgen 7>,
> > > +                 <&topckgen 41>,
> > > +                 <&topckgen 105>,
> > > +                 <&topckgen 83>,
> > > +                 <&ufs_ao_clk 1>,
> > > +                 <&ufs_ao_clk 2>,
> > > +                 <&topckgen 42>,
> > > +                 <&topckgen 84>,
> > > +                 <&topckgen 102>;
> >=20
> > This is absolutely a nitpick thing, but if you end up resubmitting, can
> > you pick a consistent format between the two examples your series adds
> > for the clocks/clock names?
>=20
> No problem, will do. IIRC I kept them as a list like this so I could
> easily reorder things, but now that I'm fairly sure this order is the
> correct one, it's probably best to make this more compact.
>=20
> Also sorry for the numbers as clock IDs, but MediaTek clock headers
> have conflicting symbols and the dt schema example extractor dumps
> all examples into one dts file. :(

Numbers is fine, dw about that.

> Since this has bugged me in the past, and many schemas may rely on
> the concat behaviour now: would a patch in the distant future that
> prefixes all MediaTek clock binding headers with the SoC name be
> acceptable if it keeps the old names intact as aliases to them with
> a #ifndef guard?

Honestly, I don't think it's that big of a deal to use the numbers,
they're only examples after all (even if for soc-peripherals they're
almost always exactly what is used in reality).

What you do with aliases is really up to the mediatek platform
maintainers, but I think if it were my platform I would just not bother.

> I should also think about some way we can avoid similar bindings
> symbol naming mishaps in the future.
>=20
> Thank you for pointing me in the right direction with regards to
> the binding!
>=20
> Kind regards,
> Nicolas Frattaroli
>=20
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable

--LhPY1uIXOXYzwQC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaP6f6AAKCRB4tDGHoIJi
0lVoAQDVEcmFlZDGe0sLSSI/vhJc1fCDdip8vWj9q3rZ4BUI+gEAyI4wOcjukunf
BlHSEe6kYAuozj/qCFBWrR+C47CjOwk=
=xrOe
-----END PGP SIGNATURE-----

--LhPY1uIXOXYzwQC0--

