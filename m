Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5D1C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNLfBripyGCcRpodlSQDvf0KC5poyX1fpkm5nakZ/Is=; b=Y/5pvMI5fpw/PT1J1sjruIRkkw
	PayAmFuIfDO8Md4E14hYLBF1sb9fr6fv8dkTsy/IQ3/kbYP4S2QrwtDeGEYmpqitntvNWAUIb6TiF
	8Evfrdeh2vqLOVvbiNjDMzWgjPDh0GeHj80x5B57NU/H1553Y95CPHi2PjxlLUgQSZqvi/deAv7E4
	P42rZjvjGi0T+ETrqMnMJnuS2ZPBlxZ9s4svpLSpZ+fWY+WAF29qeqB8fQ1glr62tkVSMnUCv1bK6
	SamXYD1w8h/jj60d8FD5/6j1oer2n2tC+k6vrRcdnjgynJXYPgUzuOv7TDTQTPGnmEsSQelJl+b1n
	D9tUiFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQMX-00000005CHc-3ehi;
	Fri, 21 Feb 2025 10:34:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQ9W-000000059uh-1WWb;
	Fri, 21 Feb 2025 10:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CFC76119B;
	Fri, 21 Feb 2025 10:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BFCC4CEE6;
	Fri, 21 Feb 2025 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740133261;
	bh=fUVaLTqcC5c+bm4iIiTWH4PyCaBTZWkrdFfnT7KKx9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdaAdtItOplD992wbpZNI3he2hf6xVYugM2PYF5rEGymF/G5YrQns0JZopipOO9MM
	 BoNF1OqMpjKsgq8VvcxReJithgND9W34P13mPh5P4EwMGhY6+NE1F2lakfBcXct+zx
	 VenyyKva/dTsHfQ9823wnEpvA+rUYgRZyyT21q3eb5CXVCpGLLCDEiKBu7aX1Hlzvq
	 bA3jWyMQU0fuqalK/8WChGN9CJ+VQsqQDYySlWlNJBkbe7Jnu0v8cQQGTodqdafr/Q
	 ef4u4VHGdwvWGcdRx7GFsIolkSZeJQsRok04div7TK/9JCvm+rvcfF5FzbkB0bFWeV
	 2FOQ9nNoMGgew==
Date: Fri, 21 Feb 2025 11:20:58 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
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
Subject: Re: [PATCH net-next v5 05/15] net: airoha: Move DSA tag in DMA
 descriptor
Message-ID: <Z7hTilouR44BUuHb@lore-desk>
References: <20250217-airoha-en7581-flowtable-offload-v5-0-28be901cb735@kernel.org>
 <20250217-airoha-en7581-flowtable-offload-v5-5-28be901cb735@kernel.org>
 <20250220142535.584b0423@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5YB+kcl4xBIiQadY"
Content-Disposition: inline
In-Reply-To: <20250220142535.584b0423@kernel.org>
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


--5YB+kcl4xBIiQadY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 17 Feb 2025 14:01:09 +0100 Lorenzo Bianconi wrote:
> > +static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *=
dev)
> > +{
> > +#if IS_ENABLED(CONFIG_NET_DSA)
> > +	struct ethhdr *ehdr;
> > +	struct dsa_port *dp;
> > +	u8 xmit_tpid;
> > +	u16 tag;
> > +
> > +	if (!netdev_uses_dsa(dev))
> > +		return 0;
> > +
> > +	dp =3D dev->dsa_ptr;
> > +	if (IS_ERR(dp))
> > +		return 0;
> > +
> > +	if (dp->tag_ops->proto !=3D DSA_TAG_PROTO_MTK)
> > +		return 0;
> > +
> > +	if (skb_ensure_writable(skb, ETH_HLEN))
> > +		return 0;
>=20
> skb_cow_head() is a lot cheaper (for TCP)

ack, I will fix it in v6

>=20
> > +	ehdr =3D (struct ethhdr *)skb->data;
> > +	tag =3D be16_to_cpu(ehdr->h_proto);
> > +	xmit_tpid =3D tag >> 8;
>=20
> > @@ -2390,8 +2498,10 @@ static int airoha_probe(struct platform_device *=
pdev)
> >  	for (i =3D 0; i < ARRAY_SIZE(eth->ports); i++) {
> >  		struct airoha_gdm_port *port =3D eth->ports[i];
> > =20
> > -		if (port && port->dev->reg_state =3D=3D NETREG_REGISTERED)
> > +		if (port && port->dev->reg_state =3D=3D NETREG_REGISTERED) {
> > +			airoha_metadata_dst_free(port);
> >  			unregister_netdev(port->dev);
>=20
> Looks a tiny bit reversed, isn't it?
> First unregister the netdev, then free its metadata.

ack, I will fix it in v6

>=20
> > +		}
> >  	}
> >  	free_netdev(eth->napi_dev);
> >  	platform_set_drvdata(pdev, NULL);
> > @@ -2416,6 +2526,7 @@ static void airoha_remove(struct platform_device =
*pdev)
> >  			continue;
> > =20
> >  		airoha_dev_stop(port->dev);
> > +		airoha_metadata_dst_free(port);
> >  		unregister_netdev(port->dev);
>=20
> same here

ack, I will fix it in v6

Regards,
Lorenzo

>=20
> >  	}
> >  	free_netdev(eth->napi_dev);

--5YB+kcl4xBIiQadY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7hTigAKCRA6cBh0uS2t
rCeUAQCB/2t2Wdyb4IQv5rKQRZKe1GYUM3uFFfEksdbnFdyb0gD/ZY1D+76DwjUj
DnnmpDydOAQ+1nCYsY5EaOgWAq9p5Qg=
=cQbl
-----END PGP SIGNATURE-----

--5YB+kcl4xBIiQadY--

