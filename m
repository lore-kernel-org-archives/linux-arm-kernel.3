Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA932606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hpBgMzvM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TmCJB6mn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+KYXN7aai6IX1x5SM7xizmV0HBq9zshAmdQbcwaB9mo=; b=hpBgMzvM6Xt+7/Xfvf3tEk81gT
	kpfW2tFyZ6NVVjg07U1benBQv51EWtBcmYfHuynCNo5hWMSQUmMIgHk9NONfF0CLAZZp6sgyqiFW9
	T1/z2vR9896W61fWwbZd0dZggVBqU8jFX9HSJUUttSZNtHWBU4tzAvwvsoZn3run2Kyd7VB6nAu1P
	xiYUcRLFFJeHBL1C6zwadZ0LQ1QRiIcMEX4K6t0SxNvVkqy2uVGVCqOkjFGTm7lSbbZd4F6odbSxz
	sAqV09qRpBMfmrotuv1Bm1xQlkHqkiJj1yTRxUhGYzQMfS/cmvjZA9heTfxKV1a64xb9S+WtHZ9kh
	JRzGLr2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKts-0000000Cegz-00XZ;
	Fri, 06 Nov 2026 14:26:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKtq-0000000Cegi-41I4;
	Fri, 06 Nov 2026 14:26:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5FBFA40146;
	Fri,  6 Nov 2026 14:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E751F0089F;
	Fri,  6 Nov 2026 14:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975198;
	bh=+KYXN7aai6IX1x5SM7xizmV0HBq9zshAmdQbcwaB9mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TmCJB6mnQ8WzGjBpzNOrtANc6+bY+KMqzHJFg2qc1E9+OtkJ1fZYWR9ZIu4yeLFXK
	 HwDvyReArqnyDG3QmALWbiL1UUAoHlZ1jK/ZNhu4rubc/zrBuAi4DMzhCTF1DLKLRp
	 xuN7JZL3hBmNMfjatE2r8jO3zUcSs9I4Bi4FufHBHsilAQiyHFpmc+e+H/ORp4tRkt
	 6cYigqJetm+vXP0Gj5Det55akl6h45cWKjSosDs+bG3zhkoPtiv3Rkxc5jXm4t06es
	 DoqXJat7+eqbmQdziODXhuruIj2c1Ezn3BX5guYcrgaeZ100NWd0yt9Q0wqog/BJJw
	 yKF6S3iPYGcHA==
Date: Fri, 6 Nov 2026 15:26:36 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH wireless 2/2] wifi: mt76: npu: read the rx slot count
 after the first slot is complete
Message-ID: <au3jnOD5ZOJR0mvb@lore-desk>
References: <cover.1793927986.git.fmaurer@disroot.org>
 <653d93b3c35975cd13dd6b33d76ea6517b55be91.1793927986.git.fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KtjQmKF3zC2utkqj"
Content-Disposition: inline
In-Reply-To: <653d93b3c35975cd13dd6b33d76ea6517b55be91.1793927986.git.fmaurer@disroot.org>
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

--KtjQmKF3zC2utkqj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> mt76_npu_dequeue() reads the slot count of a frame from the info word
> of its first descriptor before checking the done bit of that slot. If
> the NPU completes the slot in between, the count is still the 0 left
> by the refill, so a frame spanning two slots is taken as a single slot
> frame and its second slot is parsed as the start of the next frame.
> With mt7996 this shows up as bogus tx-free events, which hit the
> WARN_ON_ONCE() checks in mt7996_mac_tx_free(). From the code, such an
> event can also release tokens that are still in use.
>=20
> Check the done bit of the first slot before reading the slot count,
> and order the descriptor reads with dma_rmb().

Relying on the patch I shared for 1/2, I guess this is no more a problem si=
nce
we will just delay the skb allocation. Agree or am I missing something?

Regards,
Lorenzo

>=20
> Fixes: 7fb554b1b623 ("wifi: mt76: Introduce the NPU generic layer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Florian Maurer <fmaurer@disroot.org>
> ---
>  drivers/net/wireless/mediatek/mt76/npu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wirel=
ess/mediatek/mt76/npu.c
> index 6e503a4a890c..f00ae683a7eb 100644
> --- a/drivers/net/wireless/mediatek/mt76/npu.c
> +++ b/drivers/net/wireless/mediatek/mt76/npu.c
> @@ -72,18 +72,25 @@ static struct sk_buff *mt76_npu_dequeue(struct mt76_d=
ev *dev,
>  	int i, nframes, index =3D q->tail;
>  	struct sk_buff *skb =3D NULL;
> =20
> +	if (!q->queued ||
> +	    !FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[index].ctrl))
> +		return NULL;
> +
> +	/* The slot count is only valid once the first slot is complete */
> +	dma_rmb();
>  	nframes =3D FIELD_GET(NPU_RX_DMA_PKT_COUNT_MASK, desc[index].info);
>  	nframes =3D max_t(int, nframes, 1);
>  	if (nframes > q->queued)
>  		return NULL;
> =20
>  	/* Only take the frame once all of its slots are complete */
> -	for (i =3D 0; i < nframes; i++) {
> +	for (i =3D 1; i < nframes; i++) {
>  		int idx =3D (index + i) % q->ndesc;
> =20
>  		if (!FIELD_GET(NPU_RX_DMA_DESC_DONE_MASK, desc[idx].ctrl))
>  			return NULL;
>  	}
> +	dma_rmb();
> =20
>  	for (i =3D 0; i < nframes; i++) {
>  		struct mt76_queue_entry *e =3D &q->entry[index];
> --=20
> 2.47.3
>=20

--KtjQmKF3zC2utkqj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCau3jnAAKCRA6cBh0uS2t
rKxxAQCZ+WzNiOTB1+5eiTtdzP8G/JQKB+ravFT4xNbo4OIRTwEA61IME59No34X
i6GOyP7UthDtFp6rmgVGBPNWrHeuPgo=
=oeNY
-----END PGP SIGNATURE-----

--KtjQmKF3zC2utkqj--

