Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A377D637AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 21:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebwgGAkNx1wNoLhOAOZ/UY0M0Mpf4583EjnHoCJDQNs=; b=WJ4lM/R4kTgAUx1PWD45AvCWKh
	x2jqcBqPxlQHHLi/nGF4DRK0BuQbmnYsbahFISQDszJpHsclxljZdwRkvIekEsRrW7VGjiwFpK/e9
	hKw7Dyv+Dc4vYQ0qEdlGDPOAyvBcsYDppn47Q6YBSfj8spY65bhlyRw0pShNtzsR1fRsXVz94hS1E
	FDnKUdwFfidQTlqEQjs/nLHYmfIbvlD9GU/MuqIBi38bQePZ7F8zapdFgNqsuetEeyKA870Fs5fMt
	/HiJqUtonYPNkMauzYf6NbueZ13TWEUKqzyVRIlnmcqh/onp06imT34O7ZC53sdzXUa5CXi6SZf1W
	JdXCUYzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcOe-00000005pbs-3qtw;
	Tue, 16 Dec 2025 21:15:52 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVcOZ-00000005pax-3v9M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 21:15:50 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ee2293e6a2so42199681cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 13:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1765919746; x=1766524546; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ebwgGAkNx1wNoLhOAOZ/UY0M0Mpf4583EjnHoCJDQNs=;
        b=W/QD/aO9pxqfXj403fP4jzeI+bc9+NODn3hT1o2xYQh2TmXWPWZEqC/Pz+PJGh6sV3
         uVACLrS8I+cQFmAxnmv9Ej/CURiH+j6+MRLYbTL29rg2A+epgiyfMCEtFtCmoIDyPWdr
         UQ9YdkNfh8JpMJTmrs6IF90J1lBJZ1v0NRyvffyISxaJqGlVdrr+sUw4rUdmVnK+Ywat
         V3y/WndWu8hxHXwD3zMSDjoROdCzDcaabaMJvIxAQwX5djqsg32LfOqMkwYOrsowIRqd
         iX8TE6sduL/hWjPOKQcIzXKjuUmCs+UxB6V2c2cs+dc913hSyVKH9/tcwwMeN9HWT0wd
         otog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765919746; x=1766524546;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebwgGAkNx1wNoLhOAOZ/UY0M0Mpf4583EjnHoCJDQNs=;
        b=dA0O82Nm+9gjllDHi4IGhbeFEdjmh3XolWXu25x0GZppiRZwKCI8lyA8AqEMKbYTC5
         ummk73F38Ri5xEv+myCWaYUtWpDtxCVDkAFwgeV7MWrtVsndfxtv5OVpaJh7HnGVOuq6
         eeBeLD8f79C7BueM+dqebVLhFACkfwO5xtlVy2zAt2Db1RFZ9ogCCa5UvQnN4LIp5UEk
         wtMbw9RLBAD9OGtub20pannRC0VqjrovY4m38VbPtLfI57MqBLzENyOroitg3hEfR4gJ
         +YddnfRJ80v618VFAeIU059wqkKmxLuuIXUW5WYRM7ff3Z75fbyNfOTBFlMo7yfEb4Qg
         NfYg==
X-Forwarded-Encrypted: i=1; AJvYcCVsmxDuk/Vnz949SM15IF9M1kUbIQHj0FcAf5zaSMbSOJ8qDA6Yh0Y8xmLzKXEf82C1cIKTii/lkRSgvrY/r278@lists.infradead.org
X-Gm-Message-State: AOJu0Yyon6VTN/DeQvA32PfyCYIKkQ9BCKa+ZRMfNHCrvOfRBOZxh+6l
	jk7LmUMB+n5j6wNi7qG/YqM7FTFasA6fpdXF9OyEIFFZtGxnmaRgF2hRimbzkk8Lszk=
X-Gm-Gg: AY/fxX6WL19TynKiOhwn+WCW0F1c3ZHznS+HnnuTu5tMvnPBPwmVlOrhjBD2l3X85Vz
	N2plOQIqdfWinirT8+at3GwkqDbzRCeCxyXz552gBzezODLUa+sVHicwp8G29KUC2j7CQqP3NHh
	gs8/Opn9cZAHw9Dp4JXG/GHsay3qj/SqnDXo0zKdd7SX+gsjAzvNSzutn5+a1BmLiVIPGhAcCLX
	JKjBjnh+GuXERTnJu1d83vnYHeARomztPqXJS6ulWIdkZkDMMbA2K7cYlDV0L0bUNufSe+bKtF+
	Raf4j1iWYtOqRuB51mzE/6X/sprkASNmDXmCzc1RWUkS48uPAhAba0jWw2KoTQ2UiCqTkYaYk5w
	vFtOlpFTGqBEeKEvApXu08p0VvrO2lnZDcBI+jk4iAEU1s5wI9722sO6lMu70Ti+gFSggbhdgLV
	IAo6FMOX6+ZgdkckDIvSBH1nAjRxI=
X-Google-Smtp-Source: AGHT+IH9ieEzITl/25GTBr1twC9xFLUuMn0MCssFBfn2TLe8Le8JQ2UJuWsc+eqTvu1swSD82saAFw==
X-Received: by 2002:a05:622a:4ac8:b0:4ee:1ed1:43c6 with SMTP id d75a77b69052e-4f1d049f56amr195093861cf.10.1765919746405;
        Tue, 16 Dec 2025 13:15:46 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-889a860bd0bsm86012026d6.54.2025.12.16.13.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 13:15:45 -0800 (PST)
Message-ID: <36268d4980a1cd6d976bdf5de148f1c2668a92e4.camel@ndufresne.ca>
Subject: Re: [PATCH v11 02/12] media: mediatek: jpeg: fix jpeg buffer
 payload setting
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 16 Dec 2025 16:15:43 -0500
In-Reply-To: <20251202094800.6140-3-kyrie.wu@mediatek.com>
References: <20251202094800.6140-1-kyrie.wu@mediatek.com>
	 <20251202094800.6140-3-kyrie.wu@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
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
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-DXnq4KBLzU3zHo31WhpX"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_131548_495311_B015EFDD 
X-CRM114-Status: GOOD (  27.02  )
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


--=-DXnq4KBLzU3zHo31WhpX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 17:47 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> For multi-core jpegdec, if one of hws gets the event of resolution
> changing, the payload size, representing the size of Y/C data,

-> "gets the resolution change event, ..."

> needed to change. But others hws are decoding at the same time and

needed -> needs,               hws -> cores ?

It this specific to decoders or any type of cores ?

> it can not be changed immediately, which results that the payload

                                                    in the playload

> size is not equal to the real buffer length of the hw's, which occurred

size to not match the real buffer lenght for the ... hw ?

> resolution changing and a warnning call trace will print.

Can't parse. You can probably split that large sentence, and it needs to be
rework.

> So the setting of payload size must less than the real buffer length
> to remove the warnning logs.
>=20
> Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware"=
)
>=20

Don't add blank line in tags please.

> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 19 +=
+++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 6a7e01130f1c..0cf3dc5407e4 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -709,6 +709,7 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb=
)
> =C2=A0	struct mtk_jpeg_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> =C2=A0	struct mtk_jpeg_q_data *q_data =3D NULL;
> =C2=A0	struct v4l2_plane_pix_format plane_fmt =3D {};
> +	unsigned long max_size;

size_t ?

> =C2=A0	int i;
> =C2=A0
> =C2=A0	q_data =3D mtk_jpeg_get_q_data(ctx, vb->vb2_queue->type);
> @@ -717,12 +718,20 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *=
vb)
> =C2=A0
> =C2=A0	for (i =3D 0; i < q_data->fmt->colplanes; i++) {
> =C2=A0		plane_fmt =3D q_data->pix_mp.plane_fmt[i];
> +		max_size =3D plane_fmt.sizeimage;
> +
> =C2=A0		if (ctx->enable_exif &&
> -		=C2=A0=C2=A0=C2=A0 q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> -			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MTK_JPEG_MAX_EXIF_SIZE);
> -		else
> -			vb2_set_plane_payload(vb, i,=C2=A0 plane_fmt.sizeimage);
> +			q_data->fmt->fourcc =3D=3D V4L2_PIX_FMT_JPEG) {
> +			max_size +=3D MTK_JPEG_MAX_EXIF_SIZE;
> +
> +			vb2_set_plane_payload(vb, i,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MIN(vb->planes[i].length,
> +						=C2=A0 max_size));

This is still not quite right. sizeimage, straight from s_fmt should alread=
y
account for the EXIF headers. If enable_exif is unknown at the moment, then=
 you
should just always include that space. This way, the buffer length will onl=
y be
bigger if userspace asked for more at allocation time, and wil never be sma=
ller
then this.

The point of sizeimage it to allow userspace allocate externally the right =
size,
this driver failed at that task it seems.

Stepping back a little, I don't even understand why you set the payload siz=
e
like this here. Why isn't the true payload size written once, when the buff=
er is
encoded ? Are you using bytesused to tell the HW how much space can be writ=
ten
too ? Just give it the full space, wich is the allocated size (length).

Nicolas


> +		} else {
> +			vb2_set_plane_payload(vb, i,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MIN(plane_fmt.sizeimage,
> +						=C2=A0 vb->planes[i].length));
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;

--=-DXnq4KBLzU3zHo31WhpX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUHMAAAKCRDZQZRRKWBy
9LqrAQDXLmz8aa7r5neaZh7xka6kqpE8h8U1FhjrhrVnGKv4zAD+NUWeHnhgbVbv
dhs9VoCxfbieBWTj3WDJe6eQSQhghQk=
=UJW7
-----END PGP SIGNATURE-----

--=-DXnq4KBLzU3zHo31WhpX--

