Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80F1C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 13:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkiIQbCYuJxvPIEx8w0K/33uiKeZt+fjfi4aaY1D3Rw=; b=cpzE1tfyAJK16M1Tw59MB54Vbf
	QnCtzWjNoq6F5viThLsfcbUzMrVWwvPZ1eRPOsLslk+eYVn2awhBlYnF6dox3P6wFgc89X+g9J8u0
	yfz/JtXAiBGaiKEVSp2y/gJJA/kC/i1DbswlHQpJo06NqznzrVRlez+m91YkduoQuT8qSWDSoh5AO
	u/OLphoBc6ephVPqQCipRHdIZboZmUu6GKrw2LJb8Vn6DC554nYImb70iRZA08NJSHnJAIpTRWD0s
	CFnxYbsZeVCZE/GZqtPh3diLnsKyiYcExnwDsS/phPXAzlbMO9vxW9+03Tnp3K3f1Z5TgGyJf3Z43
	4p2erZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNwT-00000008Nb8-3gqm;
	Tue, 18 Feb 2025 13:47:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkNv0-00000008NKi-3Yem;
	Tue, 18 Feb 2025 13:45:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 747C45C57BB;
	Tue, 18 Feb 2025 13:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85FFC4CEE6;
	Tue, 18 Feb 2025 13:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739886344;
	bh=NGVf+P6KvHNTb1CcTFmAMfl9hGQIGIue5R+BMUnA0bk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMtz+lIUo5lJA/yhcSPVdzxocKt3ncQeer0uUJhqtEaSVQw4aCu4SDtNRMQt0WS4d
	 kX0ec66X2rAvJGMh/28M8li2Q3cNSfYfmFU4zPfOgSwMPl4+cclCkudB2SNnaTRxqA
	 7OZq9wiIwS668tKQ3ntagl25dodHmPY3HPucf5OXJ0q7YB5k3xT6nlez5axGKQcCV0
	 5OWeWKG/HlsD1CcwFQgU2JBlQDT1LbNFSEekqkwUDzbEApRkOvwxD2skK3OOmI56vF
	 JVVQwzKX+if8AohHa/q2s8S7rN+NBdI+OslrEvT5kXJHLz3PT4pIJQL+G0jEfGZJ76
	 4ouz70a8E6rTw==
Date: Tue, 18 Feb 2025 14:45:41 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v4 13/16] net: airoha: Introduce Airoha NPU
 support
Message-ID: <Z7SPBfzzKt1nhYFo@lore-desk>
References: <20250213-airoha-en7581-flowtable-offload-v4-0-b69ca16d74db@kernel.org>
 <20250213-airoha-en7581-flowtable-offload-v4-13-b69ca16d74db@kernel.org>
 <20250217183854.GP1615191@kernel.org>
 <Z7OMv-7UBVtKaEFb@lore-desk>
 <20250218132756.GU1615191@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bN7niAAw7M/hEpBR"
Content-Disposition: inline
In-Reply-To: <20250218132756.GU1615191@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_054546_975157_9BC870EC 
X-CRM114-Status: GOOD (  21.22  )
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


--bN7niAAw7M/hEpBR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 18, Simon Horman wrote:
> On Mon, Feb 17, 2025 at 08:23:43PM +0100, Lorenzo Bianconi wrote:
>=20
> ...
>=20
> > > > +	err =3D devm_request_irq(dev, irq, airoha_npu_mbox_handler,
> > > > +			       IRQF_SHARED, "airoha-npu-mbox", npu);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > +	for (i =3D 0; i < ARRAY_SIZE(npu->cores); i++) {
> > > > +		struct airoha_npu_core *core =3D &npu->cores[i];
> > > > +
> > > > +		spin_lock_init(&core->lock);
> > > > +		core->npu =3D npu;
> > > > +
> > > > +		irq =3D platform_get_irq(pdev, i + 1);
> > > > +		if (irq < 0)
> > > > +			return err;
>=20
> ...
>=20
> > > Should this return irq rather than err?
> >=20
> > are you referring to devm_request_irq()?
> >=20
> > https://elixir.bootlin.com/linux/v6.13.2/source/include/linux/interrupt=
=2Eh#L215
> > https://elixir.bootlin.com/linux/v6.13.2/source/kernel/irq/devres.c#L52
> >=20
> > I guess it returns 0 on success and a negative value in case of error.
>=20
> Hi Lorenzo,

Hi Simon,

>=20
> Sorry, somehow I completely messed-up trimming context and managed to make
> things utterly confusing.
>=20
> I've trimmed things again, and it is the platform_get_irq() call
> not far above this line that I'm referring to. It assigns the
> return value of a function to irq, tests irq, but returns err.

ack, right. I will fix it in v6.

Regards,
Lorenzo

>=20
> It is one of (at least) two calls to platform_get_irq() in airoha_npu_pro=
be().
>=20

--bN7niAAw7M/hEpBR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7SPBQAKCRA6cBh0uS2t
rKsQAP9QYUVrqGhw3N4HoThHMo6upM1fVYEMznrrOpbmN0z4iwEApdOkmd6OHAnI
qAhZUPJpZNB70oO/k90a0TMOLcqBfAg=
=AafE
-----END PGP SIGNATURE-----

--bN7niAAw7M/hEpBR--

