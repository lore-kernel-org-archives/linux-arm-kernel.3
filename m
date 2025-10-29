Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3439FCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAwvktvyjepMes4w+5BG/zR8TBl6ZpLhYfjwq6pbDcI=; b=1Lijv4Zb69yjcDToDnSewn3Mao
	gijVZcTk0sGE5oGoWXOmXUUzoPTFTMFHTa1UxEpf72LKSwGGnZj1cxZtgh/AbNmi5bT1cB8rarxgG
	WZJBJN4T0ls0hPxJ9UrEPFBgsoX/CA5FKHrFz9RY44IGXjFsQPyyJeZ5Vi5A2wey+GoKfDKQ1a1XO
	dkd6E0dAqyLeCGH+YuGBD4CkC+59ksfz/Y5rF13g6BlTMQIfllvynx3WebPBgVSCihlpc04nzatFr
	2fhu3dbb50QkdwwE8hgjymHGilHvqPCOLJXD1TrraPf/DQy6nHE1nvtYqCENl3cUirqqCJFKw0MeT
	aPQFK5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEANv-00000002HsF-3NSF;
	Wed, 29 Oct 2025 17:54:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEANu-00000002Hrk-1cVt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 17:54:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12B0160503;
	Wed, 29 Oct 2025 17:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99C8C4CEF7;
	Wed, 29 Oct 2025 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761760496;
	bh=bCXLipd8jw4UWfF/s5HKsZqILEHRwryjypVy7tkLUjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2tj5JN387EOqfUzqfbcncN6EFYT4OwAISQxnGTNRwt+7QYfTddUa14wSsM/M0eA/
	 lY+4h6ETkKg7o3jpW85ZU0y2lae7avMVcvFP7v/SEFsbARyqbD0oNiAiLvpe1CYzaT
	 IuuzqvjzurbH11uNGwmCPkUZ546lWRVfgAUGPFrvFYOTckwvUFggfO++KsGCS+GWm1
	 /xbtIUCkwcQ31tp67OcF3lTVc55SJPPSso6hov6boz113Vahc+Jifr4Q5NNedVELLK
	 jLA5Jby4dX9uSizqMTZpb9knFrinWRP79P6aK0nswAcv++PSsewUjwlZK90MSo9Nlt
	 NG/j0vZNGZQHQ==
Date: Wed, 29 Oct 2025 17:54:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
Message-ID: <20251029-fading-expulsion-f0911c28d23d@spud>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-2-inochiama@gmail.com>
 <20251028-parka-proud-265e5b342b8e@spud>
 <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xiR9j6m1veV/qNYv"
Content-Disposition: inline
In-Reply-To: <rclupbdjyk67fee2lgf74k6tkf7mnjcxzwcjvyk2bohgpetqt5@toxvy3m5orm2>
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


--xiR9j6m1veV/qNYv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 08:56:09AM +0800, Inochi Amaoto wrote:
> On Tue, Oct 28, 2025 at 07:22:37PM +0000, Conor Dooley wrote:
> > On Tue, Oct 28, 2025 at 08:38:56AM +0800, Inochi Amaoto wrote:
> > > As the ethernet controller of SG2044 and SG2042 only supports
> > > RGMII phy. Add phy-mode property to restrict the value.
> > >=20
> > > Also, since SG2042 has internal rx delay in its mac, make
> > > only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> >=20
> > Should this have a fixes tag?
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
>=20
> Although I add a fixes tag to the driver, I am not sure whether the
> binding requires it. But if it is required, I think it should be

Kinda depends for bindings, amending a binding for completeness probably
doesn't need one but amending it to actually permit a functional
configuration does. This is somewhere in-between I suppose. If a driver
change is coming along with it which is likely to be backported, that'd
be a vote in favour of a fixes tag here too, so that the binding and
driver match in stable.

>=20
> Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support =
for Sophgo SG2042 dwmac")
>=20
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++=
++
> > >  1 file changed, 20 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwma=
c.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > index ce21979a2d9a..916ef8f4838a 100644
> > > --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > > @@ -70,6 +70,26 @@ required:
> > > =20
> > >  allOf:
> > >    - $ref: snps,dwmac.yaml#
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: sophgo,sg2042-dwmac
> > > +    then:
> > > +      properties:
> > > +        phy-mode:
> > > +          enum:
> > > +            - rgmii-txid
> > > +            - rgmii-id
> > > +    else:
> > > +      properties:
> > > +        phy-mode:
> > > +          enum:
> > > +            - rgmii
> > > +            - rgmii-rxid
> > > +            - rgmii-txid
> > > +            - rgmii-id
> > > +
> > > =20
> > >  unevaluatedProperties: false
> > > =20
> > > --=20
> > > 2.51.1
> > >=20
>=20
>=20

--xiR9j6m1veV/qNYv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJU6QAKCRB4tDGHoIJi
0r18AP9YHrFoYXPV2dEPqru+c49A0QRQ0TNcKAkMQ1H/ppaEYgD9FQ3HpD0h2vUk
e+BRSTPq5uaZbxl+044FWdyYYKRVCQE=
=moFb
-----END PGP SIGNATURE-----

--xiR9j6m1veV/qNYv--

