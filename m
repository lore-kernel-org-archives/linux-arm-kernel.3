Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA611606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=twj6UJSE;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eznWUqSh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iW7H3WHMn25bkmXFoYE2d48O2EiUJdBfmMFknEr+2HA=; b=twj6UJSEAyuZeAS+GBDBVFtkbg
	sts3D6q2nLH3u7Pq9mBH1B0mh8Dhp/ovRmGhyKz9mKS1SHtAtVvtpYdj5Kw0d+eIAEQzqJH2vJFmw
	+ayYCsgLZ18OHnbaOud6MsW7vRkJmbE4/IuDIAsc4Hn1OjSty0ee+a26mZzLDfo3W+UqG9fCAgFMl
	GmnCXHgGIxsSrHwXERMeHhScYFjvsXBisU9V030RfVHR2MsxGeVpmCWidfmBzLaC19Z6bX4DWl1QM
	o5/dlD4NBMhvc6rxMQrf1fvu6EcWj+NBL/DvJSioWZ0tGLgFph+Rf6+X5zPFtHMZ9NNQvCBkZpx3o
	h4K7kEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsuu-00000008Adr-48Kf;
	Thu, 05 Nov 2026 08:33:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsuu-00000008Ada-1FIZ;
	Thu, 05 Nov 2026 08:33:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3FEE43825;
	Thu,  5 Nov 2026 08:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7B61F00919;
	Thu,  5 Nov 2026 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867631;
	bh=iW7H3WHMn25bkmXFoYE2d48O2EiUJdBfmMFknEr+2HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eznWUqShYl/NC16Y8GIGt3uUMyGUZavnSVc+I4kvjO1zwQF63uuZnfhbQ9aZ3brt9
	 nprDMllmfL+c+6x8bI4fLaPqO9MPMHFKUXJxjW59zuaMFysEo4FT8x4/a5+RIkE5wX
	 1GC2f9JV3iBvOyExlE6nnMiwZNBNOLU5qTXvLB8d007ktDTtExxRPehzL7CsYRdUsd
	 dtiqouD7ZHZPctVjjg7xhGiac1eIfvHYEKHCmQ+IuLira1Vzr1ocFgIQ2nVEgVq6OI
	 d9a+ZYnrF3OHa9THimvg9EuWlrM456K+sfrFWA9Ro+LT5C9N3544vB+F/VoZn58b4L
	 tX7WwfqYoCIoA==
Date: Thu, 5 Nov 2026 09:33:49 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Zhi-Jun You <hujy652@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: mtk_wed: fix double free in
 mtk_wed_rx_reset
Message-ID: <auw_bbGdPSe14ScB@lore-desk>
References: <20261104-double-free-v1-1-efa52326702f@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fvGPRbACKxrQqlPK"
Content-Disposition: inline
In-Reply-To: <20261104-double-free-v1-1-efa52326702f@gmail.com>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--fvGPRbACKxrQqlPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mtk_wed_free_rx_buffer already calls mtk_wed_hwrro_free_buffer but
> mtk_wed_rx_reset calls both subsequently. This would cause double free
> because dma_free_coherent doesn't set freed desc to NULL.
>=20
> Fix this by removing the mtk_wed_hwrro_free_buffer in mtk_wed_rx_reset.
>=20
> Compile tested only because I don't own v3 hardware.
>=20
> Fixes: 1543b8ff02f0 ("net: ethernet: mtk_wed: add wed 3.0 reset support")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/map/216156
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhi-Jun You <hujy652@gmail.com>

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/mediatek/mtk_wed.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethern=
et/mediatek/mtk_wed.c
> index f40ac5794341..5e9674c9e63a 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -1723,7 +1723,6 @@ mtk_wed_rx_reset(struct mtk_wed_device *dev)
>  				   false);
>  	}
>  	mtk_wed_free_rx_buffer(dev);
> -	mtk_wed_hwrro_free_buffer(dev);
> =20
>  	return 0;
>  }
>=20
> ---
> base-commit: 11140c51df12e594d6bf2c8d2af5dec63b0219ac
> change-id: 20261104-double-free-b6b95c2539c6
>=20
> Best regards,
> -- =20
> Zhi-Jun You <hujy652@gmail.com>
>=20

--fvGPRbACKxrQqlPK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauw/bQAKCRA6cBh0uS2t
rCrlAQC7U08r6yWH2MyECLvdMu6gbWP7XteyGKL+5WSDBvEOqgEAsqz7Oi41Rjcu
KLPvD2yd6ku7X4ocmaGpG91W/jrixAI=
=1yhj
-----END PGP SIGNATURE-----

--fvGPRbACKxrQqlPK--

