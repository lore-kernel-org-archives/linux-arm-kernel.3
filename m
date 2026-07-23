Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18361C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMKSwtZHtjgdlF9Y2LNT13qUbh7U8eJLngFZngp7Gpg=; b=VG+BD/eWKVQxbbnRhfl9hrYS/E
	GM7b4d3i37oPLL1OKnyiYvSVnsv3NXL4HirTuTdiadl35UtbCXv3NVTZJlQFdRO/dsXXuMS3rE4ji
	1MtKECeUobDrPIG394g9KUnXqsnjPt1rKQdNhBOOkBF1iGsyOCc20vtXDUsnqin9eaKrpJNRyEDew
	y9KmJ5v+paCXgywUzrEfM8HDuHpR78AuiLkc8xi7l0ymRQJOSGsdjrkEtxTmMlDi+99+tpwV51gJG
	5xcfODZq0nQzgQ6lTQEqyC9csnYuDiQavfuq+RHtD+6Q43xnTYgXdv1+/y6e7mXigSxLUB5tDSEny
	FhffTj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwnf-0000000ElCA-1Puc;
	Thu, 23 Jul 2026 17:01:35 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwnc-0000000ElBU-0WCA;
	Thu, 23 Jul 2026 17:01:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784826042; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=doS9sUPk+xpDWSk8tCrzWBa+aaPxn1Jb+AA0lPlS3//cL+6+Dlr3R6UIBq1LBXs5WJeBKRj5RDAK7xlTahbemgSo/xTIhGhOnjwHvkargsQoxr5y8A2SeXEcxfPnTb5uhhryTB+nUaP1QRVJ8CGImSTUxamGMM6coFS3RXPV9Ug=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784826042; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rMKSwtZHtjgdlF9Y2LNT13qUbh7U8eJLngFZngp7Gpg=; 
	b=YFQfjKEi0XTVS+E1Q7qXhMxuxhb5gXIjxwniYiu2T+mCFxsg/jJbLhBN5lqGWr64CMBnNvjVIU/EgjHvmljStijdK8ZnfMoj2WicqCrEe5oQe/0Uprd4TYZeSpKZQ+WC9C0veBRvcnfVLvyS11H638SgbhCW9mJ/j8/T+LKQh+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784826042;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=rMKSwtZHtjgdlF9Y2LNT13qUbh7U8eJLngFZngp7Gpg=;
	b=Dl0kJ+qgOiIYFbVvHNu4IwgO8vb8YneY5/bpzX6VCYTCGqXv7iB74202ozSCxoXV
	8k6eJR2j/nN7DnWuRFph9tzFIZo5EoKkI+CfosRHErnYcAgQYbxlTHhOlVrl1RiF6TX
	zR0RjsU98kQ2lEATtqBR/hKXCDfndYFt+hZ8E5dg=
Received: by mx.zohomail.com with SMTPS id 1784826038872548.0819904631492;
	Thu, 23 Jul 2026 10:00:38 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id C4FB31808C6; Thu, 23 Jul 2026 19:00:31 +0200 (CEST)
Date: Thu, 23 Jul 2026 19:00:31 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Alexey Charkov <alchark@flipper.net>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 09/10] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Message-ID: <amJE9v5OHDBWzRwD@venus>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-9-f0f4a4ede712@collabora.com>
 <20260722-enchanted-mandrill-of-refinement-adc7b3@quoll>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="24edahvaidyqhl6v"
Content-Disposition: inline
In-Reply-To: <20260722-enchanted-mandrill-of-refinement-adc7b3@quoll>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/284.802.37
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100132_225266_3179B83D 
X-CRM114-Status: GOOD (  22.99  )
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


--24edahvaidyqhl6v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 09/10] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
MIME-Version: 1.0

Hi,

On Wed, Jul 22, 2026 at 09:22:03AM +0200, Krzysztof Kozlowski wrote:
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchi=
p,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,=
dw-dp.yaml
> > index 2b0d9e23e943..c4f8959dd65d 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp=
=2Eyaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp=
=2Eyaml
> > @@ -25,7 +25,7 @@ description: |
> >    * Supports up to 8/10 bits per color component
> >    * Supports RBG, YCbCr4:4:4, YCbCr4:2:2, YCbCr4:2:0
> >    * Pixel clock up to 594MHz
> > -  * I2S, SPDIF audio interface
> > +  * I2S, S/PDIF audio interface
> > =20
> >  properties:
> >    compatible:
> > @@ -46,7 +46,7 @@ properties:
> >        - description: DisplayPort AUX clock
> >        - description: HDCP clock
> >        - description: I2S interface clock
> > -      - description: SPDIF interfce clock
> > +      - description: S/PDIF interfce clock
> > =20
> >    clock-names:
> >      minItems: 3
> > @@ -83,7 +83,8 @@ properties:
> >      maxItems: 1
> > =20
> >    "#sound-dai-cells":
> > -    const: 0
> > +    const: 1
> > +    description: 0 for I2S, 1 for S/PDIF
>=20
> This is ABI change, which might be backwards compatible or not, but
> commit msg should explain that. I can easily imagine drivers where
> written that way that they will fail with an old DTB.

It sure is an ABI break on paper, but I don't think it makes sense
to have an enum allowing 0 or 1.

mainline kernel:
At the moment mainline RK3576 dtsi does not have any
#sound-dai-cells in its DP node and RK3588 has it set to <0>
(Which will complain after this change. I have a fix for that
updating it to <1>). But the mainline kernel has absolutely no
driver support for audio and doesn't use the property at all.
Not having the cell means the driver would have to assume that
either I2S or S/PDIF is meant implicitly. But that is also not
documented.

vendor kernel:
The only other driver for the DP controller that I am aware of is
=66rom the vendor kernel tree. That does have #sound-dai-cells =3D 1 on
RK3588 and uses subnodes for RK3576 (and thus no #sound-dai-cells at
all).

Thus I argue this is a theoretical ABI break, which affects nothing.
I will look into adding this info to the commit message after
dropping the other ideas for <2> and the subnodes.

Greetings,

-- Sebastian

--24edahvaidyqhl6v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmpiSKkACgkQ2O7X88g7
+poM0RAApP2rNA3K/01XsRMbbhbADGMBv3BNt+uco66/KnZMQp6/l4t14Aev8Jcj
nSgeSHh7TQwORQc5LFT+pNWNXBkLSYfY9hKQ91TNG8i51JyxLsUEZw2LUFXlL8TH
PemKZCoaUikZqp/bKTxaULuTYW7Q8i7FkFytohTnnyQx6sxppTSj9mE6CeJC6Wif
ljJRqhvTd+wLw2yab7L+fGMttwtLmo/ad3oO4GUIjh43YKExs4ee7+3U4COkuFX3
VY6sDFbxQE2g3b4YBqCuYqHxljMl300P4/8N1PRoYvo3IEPYEuqTPinkuviSbPjQ
wakqJARxmE3WyVHvE3qFqdg5U/jkn1Pp52Knr6p69Z96wKZdDOMJjF3C+/cKS8Mg
cgQIY+E6PXtaSVcVozKGAc72ohBNtGm721M6dckJ1u9Ch+A7QdK3jlHPPzgpNKVO
rE7PgzD57uxjgc6+S0tja9QAQpyO0SVGzBb9Iyi3d4g8hp2Sxa5WDiiPoO/cGH6k
JkpgOFjS9ttdGjvlGUgdnfRv7t+zhZpgNPZPdVEhq11HNxU2zuPLHkP9gTMe7pVf
xCXwbb0BzrNf0KZuQWSTZVB1QTx9Fa9U4TyjvsTs5iYidmhAKmhi5XDcb8RYLPyO
oIAtQHge6m+uVo29D2LjcG6JKvJgNs9rgOdl8Z/tlan150EYVqU=
=mgtU
-----END PGP SIGNATURE-----

--24edahvaidyqhl6v--

