Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488E3D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 20:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGbF8FHcXTa261idx0HtRtlzf/0YVJn/zIYd9Xc1j6M=; b=UY15iCP4rhThZ2ByLdhqHiP+8f
	YwPxK5XhpvbKPGbh9Yww4SscOdFdNCPGp7dkjsSOJ4tEaD6dmLKIpyX1LTbCjc47Opb/aFmHXR3jP
	v9FfY+wrTo0iBqodEE98j/NChyVujSkzpb1n9YdvpZ6fJ9bg1i2HYmm/UOLbzInzKA4qqsk7hUqMD
	7RnjLyIDiLQqJQ+6X4BywQk1N9arHLXFi2F3PUnIXiDlVB1D0pM+GfnWmbK3X1qH5fNLrFAWWBE8S
	f4N4jnN836bpMhNQMCXqzaRifxory4xuxAfrQM6W/nyjuNA2NnCG9i1ONEsAU4ioiICickeIVu2XO
	xnZJVemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4sq-00000000soV-3RrO;
	Fri, 28 Nov 2025 20:16:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4sp-00000000so1-0Im4;
	Fri, 28 Nov 2025 20:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764360956;
	bh=tijqk1SwZ5bxvn8qH8T9pHBsKGq5sQEuXYqOwAKy5oI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GRq+hkO8SPGQvXv9PRernt7jaxsGpZHLnxNtWzQZZXHmbfxrqMGu/wi9KPYKuhOti
	 nQQ/b0L+d19sjnXNeIDI9aTcvRoyDvkgEWzo5JkL/DqZi7Fa4SXz+/51G3JsIs0cwy
	 vuztcF805Q3fdocbP5JIgOuLb2SKvGmOVG8hpeDG03iAPkNf2rKgMgl5Vr++3M5cyH
	 oR7XteCVS2eDt6R5F7P7Kb3h2XPAzIxkBslVhznBw3b5rQ9Ap3wedy8zBTh14A+CDp
	 bCvjsKv8jmhvfHS9umKm3HmxJl3zf0bJ1h2w1YsTyZ/BUQgdxeUQhCiAVjt141VLgS
	 kz7tIy8c1eNGA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E113717E10F2;
	Fri, 28 Nov 2025 21:15:54 +0100 (CET)
Message-ID: <c9448af6b22e95df1393203a8f3973dcaf1e4105.camel@collabora.com>
Subject: Re: [PATCH v2 09/14] media: mediatek: vcodec: support 36bit iova
 address
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Hans Verkuil	 <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard	 <benjamin.gaignard@collabora.com>, Nathan Hebert
 <nhebert@chromium.org>,  Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 28 Nov 2025 15:15:54 -0500
In-Reply-To: <20250815085232.30240-10-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-10-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-thBz/iwZlQW4U2Ltb8Ko"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_121559_277435_60E56262 
X-CRM114-Status: GOOD (  13.69  )
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


--=-thBz/iwZlQW4U2Ltb8Ko
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> Need to set dma mask to support 36bit iova address for decoder
> hardware can use 36bit address to decode for mt8196.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0 | 7=
 +++++++
> =C2=A01 file changed, 7 insertions(+)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index 5e312f86e652..fabf969bc8a9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -388,6 +388,13 @@ static int mtk_vcodec_probe(struct platform_device *=
pdev)
> =C2=A0		return -ENODEV;
> =C2=A0	}
> =C2=A0	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> +	if (dev->chip_name =3D=3D MTK_VDEC_MT8196) {
> +		ret =3D dma_set_mask_and_coherent(&pdev->dev,
> DMA_BIT_MASK(36));
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to enable 36-bit DMA:
> %d\n", ret);
> +			return ret;
> +		}
> +	}
> =C2=A0
> =C2=A0	dev->fw_handler =3D mtk_vcodec_fw_select(dev, fw_type, DECODER);
> =C2=A0	if (IS_ERR(dev->fw_handler))

--=-thBz/iwZlQW4U2Ltb8Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoC+gAKCRDZQZRRKWBy
9MWeAP9bms+OEuXx0/zByWXdLoqIcrAg52K7Bkxw4ELtyazPgAD/Q/SMeE46e+5k
deihZkXdITQz+uU235vgPhd7WpH8kA8=
=mp0X
-----END PGP SIGNATURE-----

--=-thBz/iwZlQW4U2Ltb8Ko--

