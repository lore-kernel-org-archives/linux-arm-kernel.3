Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A554B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 18:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lv4fQjgF;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYvOyYdK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ud7L2BHlOxXSkrDxIcOwnu6Rw0+dRUWE6yyL5rEtQsA=; b=Lv4fQjgF0nP4yHiVa0pDwG8akm
	6GH6aLpZfdyRv0PsCVxY0r3FdR/TAv8U83KL7rEYhB8jRebG0uJ/OzWA+OAktEUVMklcEw00GVHbv
	lFscywMqhjURiOF5+/oBev5BD4Txq9KL+Ni+efjJY+1DngzgBqUbMr68OIQjAAZzeDD2QGvjHhjUg
	AZs5HgUqQEwk03od2WHpT7Yuf2v0BZ7wN7vWUBChQq1gcNMEkPIU+b4dSHG3EqBNgyFnI42fdSkt3
	DRIZWp6e4jbLaV4ibwwaDPrUlOEQXTIP4QbcSRhGKVYFVLLqFWfGJKepfMbq0NSZu3geaT5cfHBE7
	bBTEVCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ9p-00000003PsR-2DgZ;
	Tue, 03 Nov 2026 18:22:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOJ9o-00000003Prq-1xDA;
	Tue, 03 Nov 2026 18:22:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3511601EF;
	Tue,  3 Nov 2026 18:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADFD1F000C1;
	Tue,  3 Nov 2026 18:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793730171;
	bh=Ud7L2BHlOxXSkrDxIcOwnu6Rw0+dRUWE6yyL5rEtQsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GYvOyYdKFWOLPI/K/HSlCcLL+bwttjCQ2Vpvy+j5EkBZjrcB8bFJysEgqd/LtOlEa
	 9+011rq6kzLcEGOZtTMcQ4r8XIelCD+Q8Pj6SFZstUaXwNk7Mpw9hDgVg/oajwW8eJ
	 /BMcpHPjN/+lQ5ueXSXl/lTjhapv6A+LbZYuiHzDRUg4tD+dX7pocVJe6yWk9om716
	 3PN4GVD+teUK9un1i6USvIXkYqVg+Hq284TyUy3SP531MgcHZp7pqh1x/crpSzehYU
	 OMHa3Cyvnwd9aoBjWrzYVyjmilq88QOmyvyH0wcp16YGRl12LcyEmmzfnyE68UvgUm
	 5HaXpj/lbAxJQ==
Date: Tue, 3 Nov 2026 18:22:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: dma: brcm,bcm2835-dma: Add BCM2711 and
 BCM2712
Message-ID: <20261103-fade-dweller-775b1ccbaf7b@spud>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
 <20261102090713.896324-2-pbrobinson@gmail.com>
 <20261102-email-target-d3191584d234@spud>
 <CALeDE9Ncz=6jo_1VxdCJgSVV+fCTgkUvci-=e4MQYFYo_O9M0Q@mail.gmail.com>
 <5bd67c8d-41ee-40e7-ab75-031e1520758f@gmail.com>
 <CALeDE9NhPa3V4jJ-Lc1sOujdrSAtkOuoeLW98NBxUai2qZFoLw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OYy0OWd0C8mSK/JA"
Content-Disposition: inline
In-Reply-To: <CALeDE9NhPa3V4jJ-Lc1sOujdrSAtkOuoeLW98NBxUai2qZFoLw@mail.gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--OYy0OWd0C8mSK/JA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026 at 09:35:48PM +0000, Peter Robinson wrote:
> On Mon, 2 Nov 2026 at 20:38, Florian Fainelli <f.fainelli@gmail.com> wrot=
e:
> >
> > On 11/2/26 12:18, Peter Robinson wrote:
> > > On Mon, 2 Nov 2026 at 19:39, Conor Dooley <conor@kernel.org> wrote:
> > >>
> > >> On Mon, Nov 02, 2026 at 09:06:51AM +0000, Peter Robinson wrote:
> > >>> Add compatibles for the BCM2711 40-bit DMA4 channels, which are
> > >>> described by a separate node covering channels 11-14, and for the
> > >>> BCM2712 DMA controllers. The register address of a node identifies =
its
> > >>> first channel, allowing a controller to be split across nodes.
> > >>>
> > >>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > >>> Cc: Rob Herring <robh@kernel.org>
> > >>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > >>> Cc: Conor Dooley <conor+dt@kernel.org>
> > >>>
> > >>> ---
> > >>>   .../bindings/dma/brcm,bcm2835-dma.yaml        | 31 ++++++++++++++=
+++--
> > >>>   1 file changed, 29 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma=
=2Eyaml b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > >>> index c9b9a5490826c..31d97a10a0ea9 100644
> > >>> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > >>> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.yaml
> > >>> @@ -9,18 +9,27 @@ title: BCM2835 DMA controller
> > >>>   maintainers:
> > >>>     - Nicolas Saenz Julienne <nsaenz@kernel.org>
> > >>>
> > >>> -description:
> > >>> +description: |
> > >>>     The BCM2835 DMA controller has 16 channels in total. Only the l=
ower
> > >>>     13 channels have an associated IRQ. Some arbitrary channels are=
 used by the
> > >>>     VideoCore firmware (1,3,6,7 in the current firmware version). T=
he channels
> > >>>     0, 2 and 3 have special functionality and should not be used by=
 the driver.
> > >>>
> > >>> +  BCM2711 channels 11 to 14 are 40-bit capable DMA4 channels, desc=
ribed by a
> > >>> +  separate brcm,bcm2711-dma node. BCM2712 has 40-bit addressing on=
 all
> > >>> +  channels, with channels 6 to 11 being DMA4 channels. A controlle=
r may be
> > >>> +  split across several nodes, the register address identifies the =
first
> > >>> +  channel of a node.
> > >>
> > >> Uh no, a device should not be split across different nodes. This sho=
uld
> > >> not be needed, why can't your driver handle the upper channels having
> > >> different capabilities?
> > >
> > > This is the way it's done in the downstream kernel, unfortunately
> > > Broadcom doesn't publish the HW details so either they'd need to
> > > contribute the support (which they've not done since the RPi4 was
> > > available) or I'm not sure what the other options would be. Open to
> > > suggestions.
> >
> > Neither here nor there, IMHO, yes it would be nice if documentation was
> > published (and a customer like Raspberry Pi is probably one of the few
> > that can get the needle to move there).
> >
> > You have the bcm2711 and bcm2712 compatible strings which should be
> > enough for you to know which channels are 40-bit capable and which are
> > not, yet keep the same Device Tree node.
>=20
> From reading the downstream commits though it reads like the different
> channels have different capabilities? Or am I reading that wrong and
> it's the different generations of the HW that have different
> capabilities?

That I cannot answer, but it should make no difference right? Can the
DMA core not cope with different channels having different capabilities?
If it can't, the correct thing to do is extend the DMA core, not make
two nodes.

Cheers,
Conor.

--OYy0OWd0C8mSK/JA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauomdgAKCRB4tDGHoIJi
0pGwAQDRU1UwJJQoJg1NDelCs/EW0G+wfNCTMkVRloenYHuQsgD/dEcCdXvNLxuf
gjn3c350LhclHq3pPf9RbJA9UdGWagw=
=s7oi
-----END PGP SIGNATURE-----

--OYy0OWd0C8mSK/JA--

