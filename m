Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3986CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 13:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Putus+UwVhlUqdhHwPkYEZx6fL5F98W9wMajETR4L8=; b=aKsl05VarIM7/AIOKdT+I8EqSr
	mHpy2o4Aep5y5KJpOOz/C5nFqO3WPecW0g+ZkN14aHpZp86jSWxkS4MOs/1Imk86uTQWw6v2m/fVD
	zk5K31exxly4zUaBiBBBK5rNVlL7t69o/TbYFU6UfBxmX7zNc+tehgqAO10gNgngSV8VSzUZGZNFj
	ArXpsZ+eIGPtbD1x0B8g15YU5dpS+YTf0xXeZMh3XQ+6in38KlhSCp0mOdGT4jFxkeJqocMFU06F7
	U+MeXP2AJ3LAJ9yuSeyj4hcNgL42PSBy2jZK9NDB6G5xN9ZqNxJYu0+ZjuGn7mzQg5OJLz2isdxo7
	Ume5jIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6U4p-00000003vOo-26t9;
	Wed, 08 Oct 2025 13:19:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6U4o-00000003vOd-1XiX;
	Wed, 08 Oct 2025 13:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C56E161FE6;
	Wed,  8 Oct 2025 13:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3AEC4CEF4;
	Wed,  8 Oct 2025 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759929569;
	bh=uD0fsM6U3se/luO9t3897ROnhJ9ki+QjdE7VMtEm1oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ujgc4VgxNm8/Q48WW9Y3hj+4AWBmhOjhQrmFHnROwG9xtX/hscnPhK2zyXNw0M4un
	 8XZb8D2yUX72xcvqEBx60J3KCqNDbco4ANCpBKyTrd3VD0luf0rylj6rQ6quynAHNZ
	 3ZAFIlkDmZNmNusckGQ0q/6p0cpjX1VDX1VoBH8z9f8lXAE3Sp64An4Zq1WpC2WQ4d
	 51y8kGWVWFqolA4MmqoUHKLMZwl9hAPfwtq2lZX+OjHbP23n8mxIabnE5m5MKST3fT
	 3WLQC7nBvBUsyIRO/9TAfwGPyBqRVStD4XCJa9Q7nVbl3XrI8Q/7T4FiwXZQUOggBr
	 QCl0ohwZtkT8w==
Date: Wed, 8 Oct 2025 15:19:27 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Rex Lu <rex.lu@mediatek.com>,
	Daniel Pawlik <pawlik.dan@gmail.com>,
	Matteo Croce <teknoraver@meta.com>
Subject: Re: [PATCH net] net: mtk: wed: add dma mask limitation and GFP_DMA32
 for device with more than 4GB DRAM
Message-ID: <aOZk35XuJmLwCvZY@lore-desk>
References: <20251008-wed-4g-ram-limitation-v1-1-16fe55e1d042@kernel.org>
 <20251008123731.GR3060232@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xv+5q7pi86ls0BfX"
Content-Disposition: inline
In-Reply-To: <20251008123731.GR3060232@horms.kernel.org>
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


--xv+5q7pi86ls0BfX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, Oct 08, 2025 at 12:48:05PM +0200, Lorenzo Bianconi wrote:
> > From: Rex Lu <rex.lu@mediatek.com>
> >=20
> > Limit tx/rx buffer address to 32-bit address space for board with more
> > than 4GB DRAM.
> >=20
>=20
> Hi Lorenzo, Rex, all,

Hi Simon,

>=20
> As a fix for net a Fixes tag should probably go here.
> > Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
> > Tested-by: Matteo Croce <teknoraver@meta.com>
> > Signed-off-by: Rex Lu <rex.lu@mediatek.com>
> > Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> ...
>=20
> > @@ -2426,6 +2426,10 @@ mtk_wed_attach(struct mtk_wed_device *dev)
> >  	dev->version =3D hw->version;
> >  	dev->hw->pcie_base =3D mtk_wed_get_pcie_base(dev);
> > =20
> > +	ret =3D dma_set_mask_and_coherent(hw->dev, DMA_BIT_MASK(32));
> > +	if (ret)
> > +		return ret;
>=20
> I think 'goto out' is needed here to avoid leaking hw_lock.

right, I will fix it in v2.

Regards,
Lorenzo

>=20
> > +
> >  	if (hw->eth->dma_dev =3D=3D hw->eth->dev &&
> >  	    of_dma_is_coherent(hw->eth->dev->of_node))
> >  		mtk_eth_set_dma_device(hw->eth, hw->dev);
> >=20
>=20
> --=20
> pw-bot: changes-requested

--xv+5q7pi86ls0BfX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaOZk3gAKCRA6cBh0uS2t
rOnvAP0fwQEDHk1NkJRLOBUd4bCOkD1SsS4bO/focUB/2eArjAD+LYJXD5hGGb8J
Wo+bKo/93KpLDi+VEbwbSzyiyMI8agk=
=jr+9
-----END PGP SIGNATURE-----

--xv+5q7pi86ls0BfX--

