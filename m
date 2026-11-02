Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1149B606D804
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gLckukn5;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=NAR7jFb0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DIPqP7gi47CnCUVbaUeSaa4AKRfzLYhpSnAXGZmxHTE=; b=gLckukn5L819unwxVbf0oCjFYt
	GYmPkFM0F1T03i/tx4V7cSPtW0eXG9GS5qeE3fkk6KqwbezMyuVfbE9TcEtFodlN1BRiiqP0VhhAF
	0p1LUTCOuVy2fUbKrrIUttkXejYWCTXd7wIk36nb9Zgl5uNsD+jfUkZx5kNwi83hhj6HGmJEneDGd
	lWEQ/mmEm8wWAHQdp3GOBUoIJHZwk4whdOMKKzNMzGwS/TsNxKEc9tEC4famnT5+BKhaq5ai+8uee
	xHM4cSCjEQNHpnorznRDFY3Io8YlmJerjlaWaxwqU1cW4vJpqykbBRP9Ty4oVlgsNjI9Ol86ZECr8
	6YlUCNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxVN-000000004nH-2D6b;
	Mon, 02 Nov 2026 19:15:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxVK-000000004lq-2WaB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 19:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793646936;
	bh=Nbbszuc4cqTH/2OVCKA2NFWpdZdIw/mf+sQeosPEgAg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NAR7jFb0YSYZB3cRjXDhpxMO1Q2KD/+YsrtGxk/8lKcWYbYESKuPGuCpYe0fUBPxt
	 gdSC9Mp74jAp0pb5tGFBkmaMD3DhwCpHdlN75ZLQrq+9lL4vTGYbfzTXFL+L2Ystq7
	 SYxKYD1hShaNNcjR0iQJlZjSj/MTk1VI2qzo3J/g4lyalFdrWVl4/idLW4gSsvdaxi
	 3ds7OeZhMZ8DssMy+OvpL+oR7Jm7p9yTMpb/wHtYatjO85fLSEXlsIWoS/UkmPH0kK
	 EoVEmpBDO3xcUj6w7QYjP/vESDKt+HjxUOX2kS/Nvp5LRfWANkOSbrQxze6AV6BoO7
	 IazNtMY6BV9XQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CD33E17E003A;
	Mon, 02 Nov 2026 20:15:34 +0100 (CET)
Message-ID: <a52aacb2e0475d5d4a248acb0d385e8d7f5ef019.camel@collabora.com>
Subject: Re: [PATCH 10/10] staging: media: cedrus: vp8: support frames wider
 than 2048 pixels
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski
 <paulk@sys-base.io>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Mon, 02 Nov 2026 14:15:33 -0500
In-Reply-To: <20261102170303.1973892-11-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
	 <20261102170303.1973892-11-jernej.skrabec@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-al3UBxtaGnl/gweWbDkj"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_111539_298618_2442E611 
X-CRM114-Status: GOOD (  18.71  )
X-Spam-Score: -2.1 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-al3UBxtaGnl/gweWbDkj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 02 novembre 2026 =C3=A0 18:03 +0100, Jernej Skrabec a =C3=A9crit=
=C2=A0:
> Above 2048 pixels, the deblocking and intra prediction row buffers don't
> fit into the internal SRAM anymore. Put them into DRAM like H.264 does.
> The vendor library sizes the deblocking buffer as 24 bytes per column.
>=20
> Tested on H616 with 2560x1440 and 3840x2160 libvpx streams, which are
> bit-exact with the FFmpeg software decoder.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  7 ++
>  .../staging/media/sunxi/cedrus/cedrus_vp8.c   | 64 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.h
> index d28fe91562d1..ca4efa9302fc 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -156,6 +156,13 @@ struct cedrus_ctx {
> =20
>  			u8		*entropy_probs_buf;
>  			dma_addr_t	entropy_probs_buf_dma;
> +
> +			void		*deblk_buf;
> +			dma_addr_t	deblk_buf_dma;
> +			ssize_t		deblk_buf_size;
> +			void		*intra_pred_buf;
> +			dma_addr_t	intra_pred_buf_dma;
> +			ssize_t		intra_pred_buf_size;
>  		} vp8;
>  	} codec;
>  };
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/st=
aging/media/sunxi/cedrus/cedrus_vp8.c
> index 6b00efa77c22..954c0ceb98ed 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
> @@ -666,6 +666,20 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, =
struct cedrus_run *run)
> =20
>  	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
> =20
> +	if (ctx->codec.vp8.deblk_buf_size) {
> +		cedrus_write(dev, VE_BUF_CTRL,
> +			     VE_BUF_CTRL_INTRAPRED_MIXED_RAM |
> +			     VE_BUF_CTRL_DBLK_MIXED_RAM);
> +		cedrus_write(dev, VE_DBLK_DRAM_BUF_ADDR,
> +			     ctx->codec.vp8.deblk_buf_dma);
> +		cedrus_write(dev, VE_INTRAPRED_DRAM_BUF_ADDR,
> +			     ctx->codec.vp8.intra_pred_buf_dma);
> +	} else {
> +		cedrus_write(dev, VE_BUF_CTRL,
> +			     VE_BUF_CTRL_INTRAPRED_INT_SRAM |
> +			     VE_BUF_CTRL_DBLK_INT_SRAM);
> +	}
> +
>  	cedrus_vp8_update_probs(slice, ctx->codec.vp8.entropy_probs_buf);
> =20
>  	reg =3D slice->first_part_size * 8;
> @@ -849,7 +863,44 @@ static int cedrus_vp8_start(struct cedrus_ctx *ctx)
>  	memcpy(&ctx->codec.vp8.entropy_probs_buf[2048],
>  	       prob_table_init, sizeof(prob_table_init));
> =20
> +	/*
> +	 * Above 2048 pixels the deblocking and intra prediction row buffers
> +	 * no longer fit into the internal SRAM. The vendor library sizes the
> +	 * deblocking buffer as 24 bytes per (32 aligned) column.
> +	 */
> +	if (ctx->src_fmt.width > 2048) {
> +		ctx->codec.vp8.deblk_buf_size =3D
> +			ALIGN(ctx->src_fmt.width, 32) * 24;
> +		ctx->codec.vp8.deblk_buf =3D
> +			dma_alloc_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
> +					&ctx->codec.vp8.deblk_buf_dma,
> +					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
> +		if (!ctx->codec.vp8.deblk_buf)
> +			goto err_probs;
> +
> +		ctx->codec.vp8.intra_pred_buf_size =3D
> +			ALIGN(ctx->src_fmt.width, 64) * 5 * 2;
> +		ctx->codec.vp8.intra_pred_buf =3D
> +			dma_alloc_attrs(dev->dev,
> +					ctx->codec.vp8.intra_pred_buf_size,
> +					&ctx->codec.vp8.intra_pred_buf_dma,
> +					GFP_KERNEL, DMA_ATTR_NO_KERNEL_MAPPING);
> +		if (!ctx->codec.vp8.intra_pred_buf)
> +			goto err_deblk;
> +	}
> +
>  	return 0;
> +
> +err_deblk:
> +	dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
> +		       ctx->codec.vp8.deblk_buf, ctx->codec.vp8.deblk_buf_dma,
> +		       DMA_ATTR_NO_KERNEL_MAPPING);
> +	ctx->codec.vp8.deblk_buf_size =3D 0;
> +err_probs:
> +	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
> +			  ctx->codec.vp8.entropy_probs_buf,
> +			  ctx->codec.vp8.entropy_probs_buf_dma);
> +	return -ENOMEM;
>  }
> =20
>  static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
> @@ -861,6 +912,19 @@ static void cedrus_vp8_stop(struct cedrus_ctx *ctx)
>  	dma_free_coherent(dev->dev, CEDRUS_ENTROPY_PROBS_SIZE,
>  			  ctx->codec.vp8.entropy_probs_buf,
>  			  ctx->codec.vp8.entropy_probs_buf_dma);
> +
> +	if (ctx->codec.vp8.deblk_buf_size) {
> +		dma_free_attrs(dev->dev, ctx->codec.vp8.deblk_buf_size,
> +			       ctx->codec.vp8.deblk_buf,
> +			       ctx->codec.vp8.deblk_buf_dma,
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
> +		dma_free_attrs(dev->dev, ctx->codec.vp8.intra_pred_buf_size,
> +			       ctx->codec.vp8.intra_pred_buf,
> +			       ctx->codec.vp8.intra_pred_buf_dma,
> +			       DMA_ATTR_NO_KERNEL_MAPPING);
> +		ctx->codec.vp8.deblk_buf_size =3D 0;
> +		ctx->codec.vp8.intra_pred_buf_size =3D 0;
> +	}
>  }
> =20
>  static void cedrus_vp8_trigger(struct cedrus_ctx *ctx)

--=-al3UBxtaGnl/gweWbDkj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaujhVQAKCRDZQZRRKWBy
9KdyAQDZU0e4+bmf99HvWpWSNByerV75EjcL3AWAST8ccZA4JwD7B9t/sUhUPZM7
rf9dHqLu6L2gtkyaySdnQ7Cn2ljdzwc=
=fR3M
-----END PGP SIGNATURE-----

--=-al3UBxtaGnl/gweWbDkj--

