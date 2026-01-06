Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A7CEFD0C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TV2WRsatUGScTT5wRm1AbQhvqUeZU8Yk5dVGjwGAag=; b=dmw4IeJM2HTGpn7Bw8bmHlUxNw
	912UwRNTP7GhRFD+gFMSEfsfBH+qvjVwlSY/DCN48H5S6vhifee9MnRKNWZTy0L/St0Y9LBsIqbGI
	imuF7ugTjLorAryXwIvqyWIHqgYu4dutEh/eK3d44+STBbUqEWgHxLlf8UCO789EWXHiisetNsxyW
	Z50gfv7MpJTXy0EoZXhJTAiNmYo/BucUKe2XLi10wjf2Qj0cP6MkUwYkAhzx44eepT8AWeE3gAoPL
	D16zmmbmsNBeXbyn/nE9uaw/ERQmytubPfkuMEqsS8FGNTnBFVo64pOU/A3DNWgVNDoDjs79LyYlS
	4uSnmANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEQL-0000000Dr2R-1tU2;
	Tue, 06 Jan 2026 21:17:05 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEQI-0000000Dr23-2U6s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 21:17:03 +0000
Received: by mail-qk1-x741.google.com with SMTP id af79cd13be357-8b25ed53fcbso181565585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 13:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767734221; x=1768339021; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7TV2WRsatUGScTT5wRm1AbQhvqUeZU8Yk5dVGjwGAag=;
        b=aEDP9tdP+EM+0teqcFjDFkzi8jtoCcV7v6LiEuz+zt+cvzWFXbeS3CbuRTzv/sqMAf
         1MyGhje+tfR21VLVgTVilk169IJgrhNm3Al+Ll6pt+bFOWIhYgVPQDcdxt6SILzSh5Ek
         VGQ9Ti/ApnKGuRpmkEspaUYlnf90khSrBhPZVWL8VICceHJxGJCaioBQeg/b2SuoopCP
         npmtEB8cPe2pwiDRQFUFaQzmZZfkCzLK0YmSQelaWSpuGLeGPuKc/VuU5WIfpQLFhaY1
         ujThFgZ2LhY0FXBTkWSVZ/8dcdeka8N8KXDuDF6FAHu0eI+36KVe/YVwRLrNKVv5J1s3
         FooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767734221; x=1768339021;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TV2WRsatUGScTT5wRm1AbQhvqUeZU8Yk5dVGjwGAag=;
        b=F9WPrGhm+38NqaviLiWuOZbLaLgtqaGGaNI8mcwwZ2scEjltm9cup8sRygUkvIGNQR
         EQyvRKTkEU4jTrxwQnEceHXW8dINLf4byw7D3iCBKgHqk/JEK6lCtrtQ+POgQlBE/OwY
         2chRYD1KcwKgRdxNvPCt/FiwuXSgRYdO2GxVDuXhvmGf+EShSFEuqgLuny4/GLV1GsDe
         cHXHqkJEuZKUOUe5tGo/uIIbuf8q1rNHtikis3xDcHvPnV92Hbah+DIyGOK7S/hKlB8g
         aWiSxc/Rr84tznp5A9BL2vmvvvXKkkxphqJqL9d9f4RUH3Y1eVA9cUIN7vpP+uXmtLHQ
         6Kyg==
X-Forwarded-Encrypted: i=1; AJvYcCVOy2IJ+SNHv5gKIpWx0cD4VTj4cH8pThqXzn63FJ0siYuy2SBJc7y/sD/0ihiVKjxDq6VYMsKJSyoxhhEaQ20O@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5wgCnwRz0oQ1iyAqKBbFGD0va+JAKoFmTi5dpE5zAZwZvUhHb
	YZ1NfarVIZFAsD2HR7iq0JCIkTKe8/vIIbBY8Nf+k9r0C3jIGzDErnAQfu+5l85BACEn4m4E5h7
	IpVJ4Ufc=
X-Gm-Gg: AY/fxX6afJnnnPKTNpnZIrdRlcL3oOsC5YEexm0XN4zNqkKSSmwxaKdz0HAOtQxm4ex
	ii89zUT2RJcu8t6JXvBvweOYCJ7a2v0CDwl0oadOEDtzBeNHK+ksVwepSzlOySpsjUWg5jBBQkc
	4hPB0mzerKUr7VfEK6KL+8Bz1iJJds3u7ig5g6UkHyBbNgVY/tC8v0122xx5vwCWWpzJRPStZWK
	q9HbucJYxQLessrg3oW8NBtrm0hn43WMkGHCE8aqINFer/fz40dHFWrrioJdZ+UOJkK+xDRoL2o
	WDgjHkARZcKdauNqENeL+lxamUwGm7mNBHLjT9quhPZco+p0qZIpMYPdNboa8LCYzm+bt2Dg8lH
	tGZ3gk0NoGVkf8a3AG7xrsetOeCJpMpveHCNXAet1JJei5stGDo/FdD0l8fFdrtU3bz9g+VE7pT
	deKk+70WKLKmX0GUxf
X-Google-Smtp-Source: AGHT+IEDtBcDNf5d5I+gsrvmMoXJBR0rE9MDwk2UybQnSIliOc1+CIFRNYrlBfOAksp85cLAttnjyw==
X-Received: by 2002:a05:620a:1a19:b0:8a3:cd9e:e3fd with SMTP id af79cd13be357-8c389379de1mr33587185a.9.1767734220893;
        Tue, 06 Jan 2026 13:17:00 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f5438f6sm235814385a.53.2026.01.06.13.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 13:17:00 -0800 (PST)
Message-ID: <71b286c20cd7806d9788043d11958b4eeeaa819b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Drop min_queued_buffers assignment
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 06 Jan 2026 16:16:58 -0500
In-Reply-To: <20251223062754.836-1-ming.qian@oss.nxp.com>
References: <20251223062754.836-1-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-bX9K4x8lN/AiWznT4ldN"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_131702_814244_51C77ED2 
X-CRM114-Status: GOOD (  15.08  )
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


--=-bX9K4x8lN/AiWznT4ldN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 23 d=C3=A9cembre 2025 =C3=A0 14:27 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> The min_queued_buffers field controls when start_streaming() is called
> by the vb2 core (it delays the callback until at least N buffers are
> queued). Setting it to 1 affects the timing of start_streaming(), which
> breaks the seek flow in decoder scenarios and causes test failures.
>=20
> The current driver implementation does not rely on this minimum buffer
> requirement and handles streaming start correctly with the default
> value of 0, so remove these assignments.
>=20
> Fixes: 3cd084519c6f ("media: amphion: add vpu v4l2 m2m support")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: stable@vger.kernel.org

> ---
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c
> b/drivers/media/platform/amphion/vpu_v4l2.c
> index 47dff9a35bb4..1fb887b9098c 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -670,7 +670,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_=
queue
> *src_vq, struct vb2_q
> =C2=A0		src_vq->mem_ops =3D &vb2_vmalloc_memops;
> =C2=A0	src_vq->drv_priv =3D inst;
> =C2=A0	src_vq->buf_struct_size =3D sizeof(struct vpu_vb2_buffer);
> -	src_vq->min_queued_buffers =3D 1;
> =C2=A0	src_vq->dev =3D inst->vpu->dev;
> =C2=A0	src_vq->lock =3D &inst->lock;
> =C2=A0	ret =3D vb2_queue_init(src_vq);
> @@ -687,7 +686,6 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_=
queue
> *src_vq, struct vb2_q
> =C2=A0		dst_vq->mem_ops =3D &vb2_vmalloc_memops;
> =C2=A0	dst_vq->drv_priv =3D inst;
> =C2=A0	dst_vq->buf_struct_size =3D sizeof(struct vpu_vb2_buffer);
> -	dst_vq->min_queued_buffers =3D 1;
> =C2=A0	dst_vq->dev =3D inst->vpu->dev;
> =C2=A0	dst_vq->lock =3D &inst->lock;
> =C2=A0	ret =3D vb2_queue_init(dst_vq);

--=-bX9K4x8lN/AiWznT4ldN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV17ywAKCRDZQZRRKWBy
9AJvAQCOUqkKAoFddF4SylaesLlyIFIg1BJfhSG9YtxlQRDd0QEAx2tLbQPMsfkV
5Q0sfD2HPdhP0VQqRwP28tOY0jXrQgo=
=Wyl7
-----END PGP SIGNATURE-----

--=-bX9K4x8lN/AiWznT4ldN--

