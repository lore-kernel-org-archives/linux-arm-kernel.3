Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB98E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9hkvI8MulT+25W8PbfwkNAdDN4qGUOYOcilt0If854=; b=k/oan0iTKGUrryQ3UrldBw1oBZ
	tRzy5t0OxK9t9JMF0zTKq5jPwrsTzRsvJ8bNbVUIzlm0Q+QGPEu3qA69/7ZSvcqf8ML3aAUKyz7Jk
	9ezAg1sppwU7+HjUauH2wXyqESL2Wi7KGGMQa70rW3xPwpyuVJoqmfoMkOePHW+aBmpGlXy65cDB6
	iwURfLksgtxNCIfJ+leKCXdGgfhFK/GxD1NpwQDPop511xsFFThacLHPWxgC9slI85JBZrDmaKaRh
	IY2aDofRfCv/dCwgKUZUc5ZQWXXghXti+cUc0hyZxd53pUlDaN+mzU0yYVo/wZ7oBGBdYkVtONR5a
	qLwcs8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6vv-00000009TSF-1ewt;
	Mon, 16 Dec 2024 08:58:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sh-00000009Siw-43zY;
	Mon, 16 Dec 2024 08:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y9hkvI8MulT+25W8PbfwkNAdDN4qGUOYOcilt0If854=; b=I8nWXVEZrLh0RoxkjUeQTMHX8X
	05aRJm5vgasW900IOAKhU1jFOtdCeoIXpBVB0ULBT2+fMtmIduPetLQZgPuD+wGH2+Z4lx1PMrVS4
	dqK2OS7CiBEzH0FxMmuR8mlYAhHM1EN6p0Dx9yLUolhcXsyxgnUXPfhGaDdLmSqRbgta6THbH1eU5
	Kd1N0T1I3C6p7FziwG+NnEg9gHVNBQFe3JVg6FWsSxDxsK+kmOdgk1CKniWlNan9F1TujTo2ItPWX
	V1i1nnyi1i5vVb7st0GhrqAizlRNEcy/etrzejuPcA3he3nOsgNMQoSUFarLohbKHoE0JDVfUExLo
	HgB722+w==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sX-00000004o8f-3y1o;
	Mon, 16 Dec 2024 08:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A7E37A40D95;
	Mon, 16 Dec 2024 08:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3697C4CEDD;
	Mon, 16 Dec 2024 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734339297;
	bh=ueAx4MDUx4QGJFCZ9Ssjl5PSZd44B1p3Fmtj8vR19uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NeSLAR0ZbC9ioITrynkKXWeHpqr79aMbctHhZepc4Km9fVPn/4SkbLGMWlLZKlEak
	 VMcDIE8819AUbBVa8Jqv+3TqTkJkQmIiTWf4Vqat3PH8ogenT0z7HY68LiyOuAU0sk
	 EB+GwYHqRT2sCAIIMFnXLa4rANRXaptNIim9QC+XkjG3AHpcxz63umOIIyRxoSBnFJ
	 Ez3nu6sYvNBRcpqUmo5StAHuj+4rmDQ5STHfQYl2DoaNPkPeTFlp8dibmTIMceBSXA
	 xc5KRI4lzRUeA0R3G93hd32npBREHmRV7QW5gPgOY4LVu4YksrMFe83KpZF1OEbIHI
	 QDT4/askROUAA==
Date: Mon, 16 Dec 2024 09:54:54 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Fix error patch in airoha_probe()
Message-ID: <Z1_q3tnwtRBq-fQE@lore-desk>
References: <20241215-airoha_probe-error-path-fix-v1-1-dd299122d343@kernel.org>
 <Z1/Tng80hii4dBQU@mev-dev.igk.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k9cFlZGy+0zOzppE"
Content-Disposition: inline
In-Reply-To: <Z1/Tng80hii4dBQU@mev-dev.igk.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_085502_343417_5E1065FF 
X-CRM114-Status: GOOD (  22.68  )
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


--k9cFlZGy+0zOzppE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sun, Dec 15, 2024 at 06:36:35PM +0100, Lorenzo Bianconi wrote:
> > Do not run napi_disable if airoha_hw_init() fails since Tx/Rx napi
> > has not been started yet. In order to fix the issue, introduce
> > airoha_qdma_disable_napi routine and remove napi_disable in
> > airoha_hw_cleanup().
> >=20
> > Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN758=
1 SoC")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  drivers/net/ethernet/mediatek/airoha_eth.c | 33 ++++++++++++++++++++++=
--------
> >  1 file changed, 25 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/e=
thernet/mediatek/airoha_eth.c
> > index 6c683a12d5aa52dd9d966df123509075a989c0b3..5bbf5fee2802135ff608323=
3d0bda78f2ba5606a 100644
> > --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> > +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> > @@ -2138,17 +2138,14 @@ static void airoha_hw_cleanup(struct airoha_qdm=
a *qdma)
> >  		if (!qdma->q_rx[i].ndesc)
> >  			continue;
> > =20
> > -		napi_disable(&qdma->q_rx[i].napi);
> >  		netif_napi_del(&qdma->q_rx[i].napi);
> >  		airoha_qdma_cleanup_rx_queue(&qdma->q_rx[i]);
> >  		if (qdma->q_rx[i].page_pool)
> >  			page_pool_destroy(qdma->q_rx[i].page_pool);
> >  	}
> > =20
> > -	for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++) {
> > -		napi_disable(&qdma->q_tx_irq[i].napi);
> > +	for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
> >  		netif_napi_del(&qdma->q_tx_irq[i].napi);
> > -	}
> > =20
> >  	for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx); i++) {
> >  		if (!qdma->q_tx[i].ndesc)
> > @@ -2173,6 +2170,21 @@ static void airoha_qdma_start_napi(struct airoha=
_qdma *qdma)
> >  	}
> >  }
> > =20
> > +static void airoha_qdma_disable_napi(struct airoha_qdma *qdma)
> Nit: similar function for enabling napi is named airoha_qdma_start_napi()
> maybe stop here or enable there to be consistent.
>=20
> Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
>=20
> Thanks

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(qdma->q_tx_irq); i++)
> > +		napi_disable(&qdma->q_tx_irq[i].napi);
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
> > +		if (!qdma->q_rx[i].ndesc)
> > +			continue;
> > +
> > +		napi_disable(&qdma->q_rx[i].napi);
> > +	}
> > +}
> > +
>=20
> [...]

--k9cFlZGy+0zOzppE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ1/q3gAKCRA6cBh0uS2t
rHdwAQDkwNoKHlLv4DFuRV0cVVaUQgmWSouorR++rrQv8srd6gD9HvF8JFxX6Vh9
SWqgKwUuQpaP0ZYYs5VsyOYuzgVTPgw=
=tfqU
-----END PGP SIGNATURE-----

--k9cFlZGy+0zOzppE--

