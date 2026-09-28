Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C31CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 19:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwTlmF74tysZPa3wLxs88tpebyN4z4d+xJbescqXPNk=; b=eYA4mCEbGulswkm1o5hsW1S+Mb
	X1je/AOaGwe+zbvWRYypcyTUYlRRIOq3OvX1qqupm1+/BmLdIJaCgUWRDoOpJUpECmqYzFBmxeUld
	xKvZnZHotU71FG29bTsjVciLu2IIuwkgMqXoYk++Rfr8URNAJ7fvDmTM8BISwagMhvO0hgopEAm3m
	g9uCNDz6wqtnFDnS2KUmAavQp/TengOM1/pX7i4wgLjslKHMmAKyDNQBflHqBRu2YliUOB4XFabcy
	EQrqOrlT6HN0jX6nPK83KpAQd+gEnTS94DlGZUYQXi3iJ6zRxorlBx7bSBIyRwG4Hmy2Kp1t/qtx9
	5Hwmw7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHSu-00000001WqN-2svX;
	Mon, 28 Sep 2026 19:56:44 +0000
Received: from mail-qk2-x0c.google.com ([2607:f8b0:4864:34::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHSs-00000001WpU-19Hl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:56:43 +0000
Received: by mail-qk2-x0c.google.com with SMTP id af79cd13be357-93c5a24e868so270557985a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790625401; x=1791230201; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qwTlmF74tysZPa3wLxs88tpebyN4z4d+xJbescqXPNk=;
        b=JycnetqawGAsOCdBFa0BjWU8WqT+wY7wLNxPOWNL59yjaBnuMb6QDN9bE/GFKkMsbT
         kFPL9UMQWYiNcANZp7SA7oFfC9wavy8T4A/iZwShZF6NF27wbzXsmZJJ+9K37fL8ARgc
         eZvNQ2zzCSsv0P1A5jFvOgXyvXvKY4OBgMYPQtAs2hFamoMbRF6VKiqxLdiPty5bkd7e
         qYxTJuIwY9qsx9AReHkppLJF3Y+Hn6hECfjDYm+VUvAH7zje2Jc0jU2Bault5JcVkq/f
         xRInbOAQcbbWIquA4Ya9LSzuDQ+FC6vJeIURiT/RWxS1NPpwnSZvzwtP7JTPdf06DATB
         wjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625401; x=1791230201;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwTlmF74tysZPa3wLxs88tpebyN4z4d+xJbescqXPNk=;
        b=Kx8YtvqlV+S6bUd3U0G8yvL6fsNpOgG+Iwhr7OmkVUcrCCFGbwmXmg3kTI7d4dLmBf
         VE06MVXaeqCwyLCdsDKoFRsUC6QJ4KzQ89G5BqxKNkcMdttg7lXhCNFRWUYbgOaFNO6o
         vjBQoIR0hBC9kE3cY8EAxrGjLOGNtvNnkDZjl3tZGgu4b24hpcqvEX6UfsLeM7IQNOuR
         R7iP0uxOTaVyqdYoWN5aGzE673tavDovTsZh26SXL422ZCy1tiTS6P5yLYpxIOQyHfWp
         j5NOzZUOLBJ74g67Bp2AtZLNm1QzfZj8+am6I8IcoqmMK2lo2mIT6wmcM/twzW/7pM+p
         99DA==
X-Forwarded-Encrypted: i=1; AKwUvBxULlHzutwChTYLF+cyq6fQsZZ3SS/NBp2pXey3PYKMAYmIHSp9ZC9mzU5ezzruKgn7tbryx+PrIcz19EpZLtu5@lists.infradead.org
X-Gm-Message-State: AFuF++kLQG9Lmfc8w0/xrCq80xrogUyHmUrbUM/3uwbwo/1KkpZCS08s
	gOcQh5UTDcTH+gdM69txWy/r2Vf/XcWkUqAhUqO7oVTyNGx51QhebWcSganTPZ8SW6g=
X-Gm-Gg: AYBFou15CIol7pJ6tIn/jpLlqz2Nm7oonU/EXryjw0etphvzfUdv/dFI2tsnSIfRTpN
	65xHs4AE0I7Ywqvsc4q004CYdCtEpk1prkRJ3fUrP35QPjVGyGMMnZtKULVTXPZ/yCYuLuNATDT
	dgDDtZAHlMZZx0CmYQhsHA5AxOHolvzrLcZmEBqBVEpMPFw+mngjJszQJM9umQ/nbJ0KOpisGiT
	KWf0ndE7ejI3OA7WgrDbNEVQ/Um8Bdx31oJ0u9vxwbYqOYdPSvF0HNqVOm4056CDHKXWc/ImkfV
	okb7ae7m0yYhJonz4KjvPF6ntGDvi1fhvaVG6aCka0jNMM2FfTYy30QwwFn1Ot0L9bA1W8XjIWM
	+G2iHsRrdZUzy3OXbHPpcdEed51oyvQ1IMMcGqS+3HekKCtG4RnSp66VPjwJZ2dR/Xtdy5qkV4e
	IfSIyIAdd+31I2Dkgfpf42s55ROwcisPsoz8B1ksVrSTh74oMu6+2f6KNOtqCeBZb8JeHJYdtw2
	J+jEs7or2/Kvw==
X-Received: by 2002:a05:620a:404c:b0:939:e735:c50e with SMTP id af79cd13be357-93c43cc2b53mr2141972085a.13.1790625400740;
        Mon, 28 Sep 2026 12:56:40 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a2bafsm87853036d6.7.2026.09.28.12.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:56:40 -0700 (PDT)
Message-ID: <038a8200d4491261d728874da2db82f00e10bd29.camel@ndufresne.ca>
Subject: Re: [PATCH v6 1/9] media: v4l2-common: Fix P010 format info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com, 
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com, 
	lafley.kim@chipsnmedia.com, marek.vasut@mailbox.org
Date: Mon, 28 Sep 2026 15:56:38 -0400
In-Reply-To: <20260624072043.238-2-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
	 <20260624072043.238-2-nas.chung@chipsnmedia.com>
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
	protocol="application/pgp-signature"; boundary="=-bMG5akiRB3PaSzMQ1vw4"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_125642_328186_13B302B9 
X-CRM114-Status: GOOD (  15.13  )
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


--=-bMG5akiRB3PaSzMQ1vw4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 juin 2026 =C3=A0 16:20 +0900, Nas Chung a =C3=A9crit=C2=A0:
> V4L2_PIX_FMT_P010 is a 10-bit 4:2:0 semi-planar format, but its
> v4l2_format_info() entry described a 4:2:2 layout with a half-width
> chroma plane. Correct bpp and vdiv to match P010's real layout,
> consistent with the other semi-planar formats.
>=20
> Fixes: 5374d8fb75f3 ("media: Add P010 video format")
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Also picked, ty

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 65db7340ad38..4de8aa3ef7d2 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -323,7 +323,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		{ .format =3D V4L2_PIX_FMT_NV20,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp_div =
=3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_NV24,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_NV42,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_P010,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_P010,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>  		{ .format =3D V4L2_PIX_FMT_P012,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =20
>  		{ .format =3D V4L2_PIX_FMT_YUV410,  .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },

--=-bMG5akiRB3PaSzMQ1vw4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrGdgAKCRDZQZRRKWBy
9GsIAQD157B5+yx05js7VShECkIRRKuZFpkaapJRCcZGE091YAEA7bUrfvGnymk8
65ItzDCQxEdR13vz+niUH1vG8TVs0g0=
=uMFh
-----END PGP SIGNATURE-----

--=-bMG5akiRB3PaSzMQ1vw4--

