Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72590FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 19:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysVs+tGOn7Mjhq3uiCYR8hMiyn+nHB8HC49fRVE07mw=; b=was6sUceH7Vq6V43vXe+xv6S5d
	SGyMkAYMywxXCYCl9DprQPl4zBhST6NvBF97PcAC74L8vgqACR1yIppLnAN1SHk2VncORR0Xtmt6h
	4sxwZSFmZ/UfzGYfUoWQGBS2afHpTf5fGztdE12ebPvP589ExnVKTB6+nlQFfePAb6VyaUTNL5+0U
	xABgmbFz/PeQJawW9UmO080zUidIDhp55jZePYPjkJtotoungRJ6AiANuYfFJs5TBuZVqI64uUEWz
	DzopCYu95eWwq1/wqZQ3ujwEE9psen1NuyEFYivujIKW2hMeK37tu0p+F9ZZ61v+JeB/22byAVqQ5
	93AKOpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAGX-000000047ft-2RxZ;
	Wed, 29 Apr 2026 19:08:09 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAGU-000000047fS-1m5j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 19:08:08 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50e5c7eb565so447621cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 12:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777489685; x=1778094485; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ysVs+tGOn7Mjhq3uiCYR8hMiyn+nHB8HC49fRVE07mw=;
        b=oe8Jp+/0hUhVdxmd7wYEJ78FR6Zc1kBPETm1Zf0ndUwWz/x3BhL93pv14qNRmPKlDz
         tkf31VgVTyFoCCa6oro/32nitLptPKNM7jC7gBPW+A3SzDS19MXjdcwDREy5ylz2bm9f
         MOSk6p4kXV9jkb+yTw8DrxRrq/3ZFrtwkWUyUhvfoaydUTmoVCfOlwniOeWW0hrP0wZA
         3mFBYJyAyNLcyLBXQxNglXUQYHu53fA4ZTRhNImfsVkVtJ8XuURShnJJsREjalKjsf1x
         7UJATgzvOe7BjC5hseJ9mApZxDYiGjEdhjUkCKvmNWqCEEpWNndzE02P0hyTG1lcL295
         TK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489685; x=1778094485;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysVs+tGOn7Mjhq3uiCYR8hMiyn+nHB8HC49fRVE07mw=;
        b=NBeB8zoS5b8QYXxb2DL4HBapPb4xkhfN43LXM1vqeigbUth1HUmbUHczDkyaepFOsg
         0pdnx9xbycgIMXNRP1KBAbBUfjzvKda481dKzUzdPOjE6LYAtGHtX/YbLwkIspkbxRLE
         +KDA7TGYpoVaFHBSG5igNmP/FOsBc6ulOGTERxuK9ZH1DPGF13jDJ6S5E75Te4K9It96
         oKegCWYXPwH8Z9Ud+aMknB1O0/NtkNowZaxSvdEoRdzGqo2rHlJKY/Fw2zdjse6cEnsq
         uSp5BBCOZllfyoAAnB4pHPb+PmMgLC4umIZbasTD4bjBHWT/F5Yyzp9qsTincfLRav3V
         7WRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hOAB/Eo7HOcETlzao5buAmCXDT4SzNpzHYJC2lgYU873Tio7qFz48dKzw03n99Bw1BYXUVVn20yv1mELO5Ia3@lists.infradead.org
X-Gm-Message-State: AOJu0YwTF/ho8PJtWenoHpE/u3ElT9d9OYZPuTAg06SW5bq/aBZKczoM
	KChuT6ovGzDqfgkMoyjH7p1QGTPp9dRq426qOIUZRbM5GZhB67gqtxp2wIIWaFWytSI=
X-Gm-Gg: AeBDietwKrQ5DkReUSJHWqLvwynDW19/fg6zRJPp/l2j/tjVtHyGQkEYVIYJ6hEx0g2
	S+PIGPGvo9yCvCbf4eejlWGSTolajT7hBwGqGG5L5FbyO6dRwUdbQRNeupYmkjQi/XvuMGtPFnr
	aJ6fcofmzF5Vqx+xBL+5F0FjKR6skqcANofeMF4AfULkvIo2nL+4qNZXzMnMq3/LYfyvHRXWLfd
	xxh+pMWERQ5qYz3LlkscKi93t7fYX81oEhn502/7FdatZSfUj/LFeU7mPxVybNNz2xJgQ7g2mV6
	HmRP6VocQjkOnbGQ6BgoAJKBIYYUgmGQ6fs6NIscZx7PBkTsn56Y/a8AeYLNt+QeZljTtzRguFb
	SWf4gTUbMOhrLyaduUL5znE9cDNz0UTyXwXzogWvDdNe5Vw6QIZb3Ms00aKZClIviMhtcq4DLHa
	gTynR73BJZpj64fr2qjHl3FcYYsEy28sbW8zMD3etmV+61UZBFmQ==
X-Received: by 2002:ac8:7d51:0:b0:50d:6ee0:3822 with SMTP id d75a77b69052e-5100e0f4ed9mr120711691cf.4.1777489684869;
        Wed, 29 Apr 2026 12:08:04 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101ae657d7sm23790771cf.21.2026.04.29.12.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:08:03 -0700 (PDT)
Message-ID: <6b9544538177a833c7de635782c67f3fae0beef5.camel@ndufresne.ca>
Subject: Re: [PATCH] media: cedrus: clean up media device on probe failure
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: =?UTF-8?Q?=EB=B0=95=EB=AA=85=ED=9B=88?= <mhun512@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, Mauro
 Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	 <samuel@sholland.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ijae Kim
 <ae878000@gmail.com>
Date: Wed, 29 Apr 2026 15:08:02 -0400
In-Reply-To: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
References: <20260427100049.29034-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
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
	protocol="application/pgp-signature"; boundary="=-ArOwzQZ1bmZyT5qFP9QG"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_120806_757117_A02F6051 
X-CRM114-Status: GOOD (  18.84  )
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


--=-ArOwzQZ1bmZyT5qFP9QG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 27 avril 2026 =C3=A0 19:00 +0900, =EB=B0=95=EB=AA=85=ED=9B=88 a =
=C3=A9crit=C2=A0:
> From: Myeonghun Pak <mhun512@gmail.com>
>=20
> cedrus_probe() initializes the media device before registering the video
> device, the media controller, and the media device. If any of those later
> steps fails, probe returns without calling media_device_cleanup(), so the
> media device internals initialized by media_device_init() are left behind=
.
>=20
> Add a media-device cleanup label to the probe unwind path and route video
> registration failures through it as well.
>=20
> Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> =C2=A0drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff..2c25654640 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
> =C2=A0	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, 0);
> =C2=A0	if (ret) {
> =C2=A0		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> -		goto err_m2m;
> +		goto err_media_cleanup;
> =C2=A0	}
> =C2=A0
> =C2=A0	v4l2_info(&dev->v4l2_dev,
> @@ -533,6 +533,8 @@ static int cedrus_probe(struct platform_device *pdev)
> =C2=A0	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
> =C2=A0err_video:
> =C2=A0	video_unregister_device(&dev->vfd);
> +err_media_cleanup:
> +	media_device_cleanup(&dev->mdev);
> =C2=A0err_m2m:

This label is left unused. Can you fix this warning please.

Nicolas

> =C2=A0	v4l2_m2m_release(dev->m2m_dev);
> =C2=A0err_v4l2:

--=-ArOwzQZ1bmZyT5qFP9QG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafJXEgAKCRDZQZRRKWBy
9Jb5AP0W2NO3lfYARP66qlgaOk81oBVFPzJbTkbCjtmBnCuWbQEAqCvyLm4BXXjp
0DRDRSToJuHjR05VHYK2ozXTCeXXgQw=
=JKEn
-----END PGP SIGNATURE-----

--=-ArOwzQZ1bmZyT5qFP9QG--

