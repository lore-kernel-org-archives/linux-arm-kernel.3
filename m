Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBBFC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwCTpCXh9rcScl0BR+msQzZZgOaQLIyE12sHaz6kHFY=; b=KMrKj/kMPWcCBwi7UG0fdh/JdS
	RRgqG0cx4mWXJ6LQTugwHa2hIneQrO/7nJ+E0aljQyVP1y/wnbn0ykoGdFgQ/LAOAzzc4QCUbjdQ/
	9TZNiXTKh505gS7bZtGYhVXO7y0otIngS6suvLJpyUO9i7DoBx72fiff1lDHn2AJxWoHvOd3DyViL
	BU7J4AX7XjDXdBVOSePejt3pMO4oa9D4qJ/QA2tBynefoNOLnBqXmYh830pU+/ZmqYQ1e//DRwGjm
	9whs62fttpdU4qwBioyMe/sp3d8+1m6unRR5GiEEl/0gh85Kw89xze410i5sSHkLYnb8EhVodi3bh
	2AvcgGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIuV-0000000HBNW-06b0;
	Thu, 13 Aug 2026 00:03:03 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuIuS-0000000HBMy-0kN1;
	Thu, 13 Aug 2026 00:03:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786579367; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mE3WnUoLG3PUyof3yAn4yRvDiIrO4wbFpZ5Ud92qrGj9XTtKGSa6tSlrA7R303WjqU26tuU0tyz7jDpZaOh0fOtogp4MN5CqiqY4yfQ9ANQb4CrFe9MA2Ue48RzMu5aN0KYbtzZpi9hF2v0F0/U/H+BsVg1fQ+0jXO+uCgbnSFA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786579367; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GwCTpCXh9rcScl0BR+msQzZZgOaQLIyE12sHaz6kHFY=; 
	b=ORJ/bNkhDm2UONTIxn3MZ0yL7MMfKYIt8+e8BY3FnlcHaDIHrsMMZcSBffinQCYWsn+N47d3a7iePjYpIsGuLP8lNidJqlhQqs80gLdAIAXXxLsv11Auqw5ykW/mn424uUV1Esz8M+e6/37Vwc2c+ACm6C9q1JwzHs/Iz2c77tk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786579367;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=GwCTpCXh9rcScl0BR+msQzZZgOaQLIyE12sHaz6kHFY=;
	b=hpIspdneOTXlzv3nDG+Xon+wLKRBuMicjfpQglMZOWyYeHtal3rudHDv+pagWEPq
	ScfCMYxDfDXByWgGdIdW2W8BrktQYqrgjd9cdxXIEJVy0I3JjC+wrePejalVGThQZuC
	BogdP3Lfalu7LOXLIM9h5OaVut02sx9zWcubYmok=
Received: by mx.zohomail.com with SMTPS id 1786579364116535.4259576810091;
	Wed, 12 Aug 2026 17:02:44 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id B01EC18057D; Thu, 13 Aug 2026 02:02:38 +0200 (CEST)
Date: Thu, 13 Aug 2026 02:02:38 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: =?utf-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
Message-ID: <an0FMnDSWbud8hPc@venus>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
 <20260810-dcphy-rx-v1-v3-1-a2d25c29adfc@gmail.com>
 <20260812-refreshing-rampant-gecko-b38ef9@quoll>
 <CAPwA33KM-sWkPVrP1h+swLinvrCZHzxPeS7h25KEO87Q_6WZuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvsrere4zmtnxm4a"
Content-Disposition: inline
In-Reply-To: <CAPwA33KM-sWkPVrP1h+swLinvrCZHzxPeS7h25KEO87Q_6WZuA@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/286.560.97
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_170300_256871_32FC6362 
X-CRM114-Status: GOOD (  39.02  )
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


--kvsrere4zmtnxm4a
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add PHY_TYPE_DSI and
 PHY_TYPE_CSI definitions
MIME-Version: 1.0

Hi,

On Wed, Aug 12, 2026 at 08:24:11PM +0800, =E6=A5=8A=E6=99=BA=E6=88=90 wrote:
> Thanks for the review.
>=20
> > I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> > Isn't DPHY implying it is DSI?
>=20
> I see your point, and I did not explain this clearly enough in the previo=
us
> version.
>=20
> D-PHY only describes the electrical layer, and both MIPI DSI and MIPI CSI=
-2
> can run on top of it. A CSI-2 receiver's PHY is a D-PHY just as much as a
> DSI transmitter's is, so PHY_TYPE_DPHY alone does not tell us which one t=
he
> consumer is asking for.
>=20
> That is the problem here. The RK3588 DC-PHY exposes both a transmitter and
> a receiver from a single PHY block, which can be used by two independent
> consumers at the same time. This is not a theoretical concern: on this
> board a DSI panel is scanning out while the same PHY receives CSI-2 frames
> from a camera. With only the electrical layer to identify the PHY, both
> consumers would end up with the same phandle cell:
>=20
> dsi@fde20000 {
> phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the TX */
> };
>=20
> csi2@fdd10000 {
> phys =3D <&mipidcphy0 PHY_TYPE_DPHY>; /* wants the RX */
> };
>=20
> There is then nothing in .of_xlate() to distinguish the two requests.
>=20
> I will make this clearer in the v4 commit message and include the example
> above so that the reasoning is easier to follow.
>=20
> For context, v2 described the direction with a Rockchip-private
> RK_DCPHY_DIR_* enum. Michael Riesch suggested using generic constants
> instead [1], and Vinod agreed [2].
>=20
> [1] https://lore.kernel.org/r/82da3622-9c3a-454c-87bc-fb4ec7adb68d@collab=
ora.com
> [2] https://lore.kernel.org/r/anSuxfeitSqmSHNr@vaman

Your new binding is lacking too. If you select <&mipidcphy0 PHY_TYPE_CSI>
you defined the direction of the PHY, but will it operate in C-PHY or in
D-PHY mode?

Greetings,

-- Sebastian

> > Your tag goes the last.
>=20
> Sure, I will fix this in v4. The Signed-off-by tag will come last, and I
> will check the whole series again.
>=20
> > Two simple defines needed Claude.
>=20
> Yes, I agree that these two defines themselves are simple and do not real=
ly
> need AI assistance.
>=20
> I added the Assisted-by tag because I used AI during the development of t=
he
> series as a whole, including cross-checking the code, writing additional
> test cases, and looking up the relevant sections of the TRM. (I checked t=
he
> corresponding sections in the TRM myself, reviewed the test cases, and
> re-ran them on the hardware before sending the series.)
>=20
> I also checked the current mainline guidance in
> Documentation/process/submitting-patches.rst and
> Documentation/process/coding-assistants.rst. Since I was not sure how much
> AI involvement should warrant tagging individual patches, I chose to mark
> the whole series consistently.
>=20
> That said, I am happy to drop the tag from this patch in v4 if you prefer=
 -
> I wrote these two lines myself.
>=20
> Thanks,
> Jason
>=20
>=20
> Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2026=E5=B9=B48=E6=9C=8812=
=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:51=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > On Mon, Aug 10, 2026 at 08:10:09PM +0800, Jason Yang wrote:
> > > MIPI D-PHY and C-PHY blocks are increasingly direction-agnostic: the
> > > same PHY IP can drive a MIPI DSI display or receive from a MIPI CSI-2
> > > camera, and combo blocks like the Samsung IP on RK3588 expose both
> > > directions to independent consumers at the same time. A binding that
> > > needs to tell the two consumers apart has nothing generic to reach
> > > for: most constants in this header name a protocol (PHY_TYPE_USB3,
> > > PHY_TYPE_DP, ...), while the MIPI entries name only the electrical
> > > layer.
> > >
> > > Add PHY_TYPE_DSI and PHY_TYPE_CSI to select a PHY by the MIPI
> > > protocol it speaks, which also implies the direction. They do not
> > > replace PHY_TYPE_DPHY/PHY_TYPE_CPHY, which remain the right choice
> > > where the cell selects the electrical layer. First user is the
> > > Rockchip RK3588 MIPI DC-PHY binding.
> >
> > I read above, but still do not get why TYPE_DPHY/CPHY is not enough.
> > Isn't DPHY implying it is DSI?
> >
> > >
> > > Suggested-by: Michael Riesch <michael.riesch@collabora.com>
> > > Signed-off-by: Jason Yang <jason98166@gmail.com>
> >
> > Your tag goes the last.
> >
> > > Assisted-by: Claude:claude-fable-5
> >
> > Two simple defines needed Claude. Great, that probably makes AI
> > conglomerates very happy that we do not type even two lines anymore and
> > need their resource-hungry data centers to do that for us.
> >
> > Best regards,
> > Krzysztof
> >
>=20

--kvsrere4zmtnxm4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmp9CZsACgkQ2O7X88g7
+poMdA/+ICtBJCzEX7PKeAy7Yv55VjRVuT2TXm2zXEzL51T3bDJexKUirtRbfMe8
MVsbhgPXfK0DqnsEqb3nRuKmW7ZFM73jfdVwkBHNHbbT9B8X6EjTqxWWKhJ1I7Rq
wRx0Ibvgibz+Cua/l19VI15cVzD2/qSiOQVGgQ1ZJMB7bFRhUR5mFycUFnDpqeSZ
Z6zPjsLlr9akUUFD0DM9uhLWPEdGbcfbOFDZMDmiby8QMuaL8Tiu/EEwIU/8CZyr
2LUUB7m9bZlIU+sWiSs8O8Lt3sRApYLcHOhEL6fVbeK14hjtKCTUDRu/aQVRMftM
p5pUwddJbbaoOYo8JAj1bj1M9HtAB0RhClp6zZ8hNsj9JWNaszbwi9K9T7TXW29E
gAxx6+S5K4fQW/G74cRGdPfu76njGl38OMYd5zzKmq612AL2r0fDDQL6Be8FCCb3
+amOu/h5bmtgq70/RtQvHC+gqvFU34KnOqkK1hZdOJR4cNZbdId4ZmdQvERrYozu
CCCs9odN81VkRfdoWGEt5/eOyBSIdmY//4fjQlnwS9xaTnUdc2nXNTpMvtksbdAO
G7rjixC0wzTL9nm+0ApIRPyOf9eE1B4uQU1a7HRhO5uK+IbXqpIbFe73ffGPL28b
bga6qoBymYm693W+bXUAyLRQuNNIYNp4/FMCx6z3hKHDrv5lLa8=
=EA91
-----END PGP SIGNATURE-----

--kvsrere4zmtnxm4a--

