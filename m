Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF416C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBiJ1+QCWS5L7SfLI3J26hRoymbqxHjfgh/WBSrZqwI=; b=kQ5XHcCAdVeeWUg3zumBiQzNJi
	3IwMAZuC6lVUm5V/oyEJfqHnakxSDfxJgMB1CEWq+9xF6zwyVcHoJUADIvJ8UuHwBSAOTjH77f0l2
	3Np4LAYVaqaqXAQ/bCe9W5+QvLwGyaTMAGs2uweOTv6z8eI8NDv1Xa1LsqFXtUF3e99YijsCXKRJV
	mfxPsmHOngLIXqtPU0ZtktJ8PbY80wKgMsH2AmVs4c1n9X2enf7Jm2/tIzZsMLSlIxu6h7GoPyyN/
	0FyQMMxFabODF3J4BQBMkI15lKQVXsweqpbLIWghZsb9/2zH4nAWUcJi7VytFepSuwFfNfCVlyuB1
	WojZKz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIpQ-0000000CEIv-2uFo;
	Tue, 06 May 2025 13:59:24 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGUC-0000000Bk4T-3C6I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:29:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A9411048C2EF;
	Tue,  6 May 2025 13:29:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1746530958; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=BBiJ1+QCWS5L7SfLI3J26hRoymbqxHjfgh/WBSrZqwI=;
	b=hurx8WBqW/XXpYxFxpUOwvu6RRiNWSAAJsDH1cSOQnQ6yEJQ4MLGC3DG0/u6rxLBkaBNpf
	Bf1mUsEt1d/e0nPXfkoi73VF1qcR+38Q1ZdgFqZLmbIMowU++Bx0VBJaHbsKSRQd0Lew0R
	xL1WK9LlvTAD4Aq3pWWe3yfr9FY8nblUb9w9icmMEBUU/W3UboZA8wozWy/iId53HP8uBV
	itRLGWVnnlZ5NRkmeR3SUaXB8izfTrKfk1CU0mhN7xco7Src88MEruS7iOzA36rQvFJTZG
	6lys/L1SM6IAxgKA0AT0Jqjw+CDEk4OrGUoz+3ICs9YjZElht7f0xQ0v5YbFxQ==
Date: Tue, 6 May 2025 13:29:14 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: Re: [net-next v11 4/7] net: mtip: The L2 switch driver for imx287
Message-ID: <20250506132914.794416cc@wsk>
In-Reply-To: <3e91e070-24a2-4dab-bca5-157fea921bf0@redhat.com>
References: <20250504145538.3881294-1-lukma@denx.de>
	<20250504145538.3881294-5-lukma@denx.de>
	<61ebe754-d895-47cb-a4b2-bb2650b9ff7b@redhat.com>
	<20250506130438.149c137e@wsk>
	<3e91e070-24a2-4dab-bca5-157fea921bf0@redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LEAL1RWHfMmtL2h5UAQq/+1";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_042921_105443_2BB662A9 
X-CRM114-Status: GOOD (  26.96  )
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

--Sig_/LEAL1RWHfMmtL2h5UAQq/+1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

> On 5/6/25 1:04 PM, Lukasz Majewski wrote:
> >> On 5/4/25 4:55 PM, Lukasz Majewski wrote: =20
> >>> +		/* This does 16 byte alignment, exactly what we
> >>> need.
> >>> +		 * The packet length includes FCS, but we don't
> >>> want to
> >>> +		 * include that when passing upstream as it
> >>> messes up
> >>> +		 * bridging applications.
> >>> +		 */
> >>> +		skb =3D netdev_alloc_skb(pndev, pkt_len +
> >>> NET_IP_ALIGN);
> >>> +		if (unlikely(!skb)) {
> >>> +			dev_dbg(&fep->pdev->dev,
> >>> +				"%s: Memory squeeze, dropping
> >>> packet.\n",
> >>> +				pndev->name);
> >>> +			pndev->stats.rx_dropped++;
> >>> +			goto err_mem;
> >>> +		} else {
> >>> +			skb_reserve(skb, NET_IP_ALIGN);
> >>> +			skb_put(skb, pkt_len);      /* Make room
> >>> */
> >>> +			skb_copy_to_linear_data(skb, data,
> >>> pkt_len);
> >>> +			skb->protocol =3D eth_type_trans(skb,
> >>> pndev);
> >>> +			napi_gro_receive(&fep->napi, skb);
> >>> +		}
> >>> +
> >>> +		bdp->cbd_bufaddr =3D
> >>> dma_map_single(&fep->pdev->dev, data,
> >>> +
> >>> bdp->cbd_datlen,
> >>> +
> >>> DMA_FROM_DEVICE);
> >>> +		if (unlikely(dma_mapping_error(&fep->pdev->dev,
> >>> +
> >>> bdp->cbd_bufaddr))) {
> >>> +			dev_err(&fep->pdev->dev,
> >>> +				"Failed to map descriptor rx
> >>> buffer\n");
> >>> +			pndev->stats.rx_errors++;
> >>> +			pndev->stats.rx_dropped++;
> >>> +			dev_kfree_skb_any(skb);
> >>> +			goto err_mem;
> >>> +		}   =20
> >>
> >> This is doing the mapping and ev. dropping the skb _after_ pushing
> >> the skb up the stack, you must attempt the mapping first.
> >> =20
> >>> +static void mtip_free_buffers(struct net_device *dev)
> >>> +{
> >>> +	struct mtip_ndev_priv *priv =3D netdev_priv(dev);
> >>> +	struct switch_enet_private *fep =3D priv->fep;
> >>> +	struct sk_buff *skb;
> >>> +	struct cbd_t *bdp;
> >>> +	int i;
> >>> +
> >>> +	bdp =3D fep->rx_bd_base;
> >>> +	for (i =3D 0; i < RX_RING_SIZE; i++) {
> >>> +		skb =3D fep->rx_skbuff[i];
> >>> +
> >>> +		if (bdp->cbd_bufaddr)
> >>> +			dma_unmap_single(&fep->pdev->dev,
> >>> bdp->cbd_bufaddr,
> >>> +					 MTIP_SWITCH_RX_FRSIZE,
> >>> +					 DMA_FROM_DEVICE);
> >>> +		if (skb)
> >>> +			dev_kfree_skb(skb);   =20
> >>
> >> I suspect that on error paths mtip_free_buffers() can be invoked
> >> multiple consecutive times with any successful allocation in
> >> between: skb will be freed twice. Likely you need to clear
> >> fep->rx_skbuff[i] here. =20
> >=20
> > I don't know what I shall say now.... really...  =20
>=20
> I suspect my email was not clear. AFAICS the current code contains at
> least 2 serious issues,

Yes, I'm now aware of them - thanks for pointing them out.

> possibly more not yet discovered due to the
> patch size.
> You need to submit (at least) a new revision coping with
> the provided feedback.

+1


>=20
> Thanks,
>=20
> Paolo
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/LEAL1RWHfMmtL2h5UAQq/+1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmgZ8ooACgkQAR8vZIA0
zr2tAQgA5Oa/FI5CP0dp8gtrzF6QxKFwfVdILQE2zYrz6dkRXmXfQA1Um8K2+VtR
uE3XbqDmvFtS6YsJHLhfeg9FUHZkvIn1HxBDDuzzg6dCU67S/3jt+qrjWhSjinMg
CV7A576tXJdZny51jmznNd2Y7rlcZFIfpQ8aAYrtW66Rhf0TICvCgwNw2ChUIAG1
GbxFjyQFE+JhO7zQerW+lv+kcaM9eh4zSMs96yCPf8svcCPsOFn1KZorvkI/Hpgc
stPRomsy+QshxpcwMdWLC0QOBy5OLa77S+NCNvTWEpYWl5RarwoENSOdFjwaoYYp
7B9Jpc2ZlPxAOcpKlnL4naqsHuxBoQ==
=5IfA
-----END PGP SIGNATURE-----

--Sig_/LEAL1RWHfMmtL2h5UAQq/+1--

