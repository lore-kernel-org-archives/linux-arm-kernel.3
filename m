Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563C8CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 18:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6r2RBO+STvQR3+eBbxUpqh9dd/cEiproLZUw+wcfZ8=; b=iBBSq2qzw4HptCZKAuTwVq8P+i
	dpMITxdJK7nG4kRPA6SrjpbCkVHQ6aclR/Bx+XgtmY+2HB1lD9xp4+bUkWMpPwc/nszEPXNZ9Bay8
	4RXttotBtJ5kHgBOvjpAzwAUMeX1qK6oSLpkUkSJp3rWHINuCho1F/FXV9U/MUr08NmD6iuZL2gkc
	4LJxq6B/IZcQROJLQh3OkxuNPzoiVa3781qqvOiIVc16AFtovI7UkSKsZT3XMNPZuinBzKDwNVErk
	1ydxm+NeuDqI3kQIOEE4bOEJEsdQut6xS4C7CstpKZkmv3wsWnjeM+iud3VFTepWh+XMBq4pFVZps
	Ti1sQePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fYP-000000061M1-3CHM;
	Tue, 30 Sep 2025 18:58:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fYN-000000061Lq-3qSw;
	Tue, 30 Sep 2025 18:58:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1170611D8;
	Tue, 30 Sep 2025 18:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5835C4CEF0;
	Tue, 30 Sep 2025 18:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759258702;
	bh=ftQwGWLKK1s5Gh7SLQ8fWSKuz7Q2521DX+kCSsNK2TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PLuiSbIWeUPuyaB2cIR6Hva0pJrqWgWKi2/sn6DMebDOKbo2K/1thjS5iF2U0h2JN
	 Cez0uXzPvBOcDq6giu0Tg0y+q3Mkr7SQlXJjhBIpgfanco4oaWjrvDZujkaB0AKPGE
	 GmMIFW2sVuDr+jQgYh1wlbefJovOhuJnogvui0fctqU8cFlJ9hPXw5xkMI2HzB1296
	 uzTnDYxxhxcNWhe7Idupcodh0a6myEzn3JGZNBLIecr8wSYtPSLX6cyvE7Ei/CxTOW
	 i/MbbNCYqEs6SpR9DTysteH7ULMELtZgXR2Y+4QzcgQXSha+DIzEKcq4xKGqA6gegg
	 KG94pAdBE4uag==
Date: Tue, 30 Sep 2025 19:58:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Phil Elwell <phil@raspberrypi.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 1/4] dt-bindings: Add Raspberry Pi's RP1 ADC
Message-ID: <20250930-overlord-scion-d60cff2ef1f5@spud>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-2-svarbanov@suse.de>
 <20250925-outlying-causal-015d8ba33c53@spud>
 <89dd04b9-e261-4bdd-83ab-499e46fc9c01@roeck-us.net>
 <88bd67f2-de8c-407b-ba98-08663eee2d7e@suse.de>
 <CAMEGJJ0KqPX462iigbMP+fwoyZgZ1J1PqaWt82MrNTW1VMwbpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7ME1twZYxASzgwyN"
Content-Disposition: inline
In-Reply-To: <CAMEGJJ0KqPX462iigbMP+fwoyZgZ1J1PqaWt82MrNTW1VMwbpQ@mail.gmail.com>
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


--7ME1twZYxASzgwyN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 11:47:58AM +0100, Phil Elwell wrote:
> Hi Stanimir, Guenter,
>=20
> On Tue, 30 Sept 2025 at 11:21, Stanimir Varbanov <svarbanov@suse.de> wrot=
e:
> >
> > Hi,
> >
> > On 9/25/25 11:37 PM, Guenter Roeck wrote:
> > > On Thu, Sep 25, 2025 at 08:40:54PM +0100, Conor Dooley wrote:
> > >> On Thu, Sep 25, 2025 at 03:04:13AM +0300, Stanimir Varbanov wrote:
> > >>> Document dt-bindings for Raspberry Pi's RP1 ADC.
> > >>>
> > >>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > >>> ---
> > >>>  .../bindings/hwmon/raspberrypi,rp1-adc.yaml   | 46 +++++++++++++++=
++++
> > >>>  1 file changed, 46 insertions(+)
> > >>>  create mode 100644 Documentation/devicetree/bindings/hwmon/raspber=
rypi,rp1-adc.yaml
> > >>>
> > >>> diff --git a/Documentation/devicetree/bindings/hwmon/raspberrypi,rp=
1-adc.yaml b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.ya=
ml
> > >>> new file mode 100644
> > >>> index 000000000000..5266b253fd2b
> > >>> --- /dev/null
> > >>> +++ b/Documentation/devicetree/bindings/hwmon/raspberrypi,rp1-adc.y=
aml
> > >>> @@ -0,0 +1,46 @@
> > >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >>> +%YAML 1.2
> > >>> +---
> > >>> +$id: http://devicetree.org/schemas/hwmon/raspberrypi,rp1-adc.yaml#
> > >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>> +
> > >>> +title: Rasberry Pi RP1 ADC device
> > >>> +
> > >>> +maintainers:
> > >>> +  - Stanimir Varbanov <svarbanov@suse.de>
> > >>> +
> > >>> +description: |
> > >>> +  The RP1 ADC is a five input successive-approximation ADC with 12=
-bit
> > >>> +  resolution (ENOB 9.5-bit) at 500kSPS. It has four external inputs
> > >>> +  and one internal temperature sensor.
> > >>> +
> > >>> +properties:
> > >>> +  compatible:
> > >>> +    const: raspberrypi,rp1-adc
> > >>> +
> > >>> +  reg:
> > >>> +    maxItems: 1
> > >>> +
> > >>> +  clocks:
> > >>> +    maxItems: 1
> > >>> +
> > >>> +  vref-supply:
> > >>> +    description:
> > >>> +      Reference voltage regulator 3.3V.
> > >>
> > >> Looks like you're missing the io-channels-cells property that allows
> > >> this device to be a provider of adc channels to other devices.
> > >>
> > > Only makes sense if the driver is implemented as iio driver.
> > > Which would be fine with me, assuming this is a generic ADC.
> > > The iio -> hwmon bridge can then be used to instantiate a
> > > hwmon device if needed.
> > >
> >
> > According to the RP1 peripheral document the information about ADC is
> > limited and I cannot be 100% sure that this is generic ADC, but it looks
> > like it is. On RPi5 board the ADC inputs are not configurable, but that
> > could change on another board.
> >
> > I personally don't have objections to implement it as IIO driver.
> >
> > Phil, are you fine with implementing the driver as IIO?
>=20
> The problem with adding unused functionality, apart from the effort
> involved, is that testing it is harder. Will the IIO driver be
> inherently better/simpler because some of the hwmon support gets
> picked up by the generic IIO/HWMON bridge?
>=20
> Ultimately we'll make whatever changes are considered necessary in
> order to get this simple driver accepted, but it would be nice to feel
> there was some real world benefit now for the work, not on Pi 6/7/etc.

tbh, I don't care how the driver side of things is done, I would just
like for the binding documentation to be complete. If there's no usecase
at all where the device provides io channels, then omit the property.

--7ME1twZYxASzgwyN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNwoSAAKCRB4tDGHoIJi
0sgKAPwPyHVOPL3+vGEY13Q+XNBtSaCSUTqKSTF8wzaH2E54/gD9HS1r/CHIxVmU
pM/olI54HwZAmhzTQDkVGvN9sY8T8wI=
=fHEy
-----END PGP SIGNATURE-----

--7ME1twZYxASzgwyN--

