Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3100C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlZJ9Oq0iUmfLZTq+2Yt0wQMB3kH+WdcRcJz7YsThu8=; b=khy5seQ29dNQ/lpk8q8mh1+sim
	R3dk/W8sqhiXJq/IFjtNg134v72GHlingxcfkPHwRIqp8C3gMLZGxkw5hJxO9HqG+GHv2Rrbi81kG
	DqddwZCEVQy4So2Trz7o0sk3XzykUeLAUGHO+c5TzN3XPzzhamYNwgMRhcwl2+7mCCP7iMdiybGRZ
	g/WOKwo9LKnBh9ZhelMnhm4bCARTtwPIqJU2OVSlm4c15vHiui2zKtZwUSt1L3WrSGnL6hzAIuv66
	ysJPSbXZHDcLJtKJm1qWbykLYfS+WjxkDMIYq8Ci6LmHbOJBUHPL5YqnDlr/jBymg+wPaBifAJtIv
	Ro30FucQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Bl-0000000Fxbb-0VQW;
	Wed, 15 Jul 2026 21:30:45 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7Bi-0000000FxaT-36W2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 21:30:43 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-51c1805b8a7so60400391cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784151041; x=1784755841; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlZJ9Oq0iUmfLZTq+2Yt0wQMB3kH+WdcRcJz7YsThu8=;
        b=Up4dZaljlkNkY0V00fDdEpeYy9CrY0zClb1G/ELqm+sJntmfwNmh6Mw4z4klZmiMzV
         jy4x/RlwTiZoMAYLVLC8U9G2uhJ8nYCS6WkeHjpXJhhORaA0e7+zkPMISpZjSsr3hvV7
         DRms5/voK5eXUBd7anqqckbb5XZKDUzpKrQhYbYfD9khdCG+ohXNJKkzcQ5SXSNvpT/P
         PP94LmkHtl7wfAOmfxA1YR415/PBX5R4wHRSwFK4az4Pzv7hKPklXvVjQgJ/ZEZz/qjK
         BnthZyjpLKcw/LmqRlBqpdQBfWtAS5S2zd6yApUKi3W1BGU+snK2GiEpWt68GwYD4Qhq
         kFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151041; x=1784755841;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlZJ9Oq0iUmfLZTq+2Yt0wQMB3kH+WdcRcJz7YsThu8=;
        b=V72zi5m0YQMjWIw1JuD6vL9PjxWS3U2tcUH0AwPdzhWXneyb044xXk7jPnWbUb6vdu
         5r1Jqep2YCZCl71e1l0aQtCQW6Gx3hWneRKYYmtP6TN4wdFHcslDFzqC17DLYk/i23pQ
         o7DOIO0xsH5Y53YTU/J1KzsPtqimamM13HPs6EATrKq4wIF8VhLxiuqydkYn2OeiEA9B
         /qbmAgi6vpqi3xgH597w0B/jDu38AI+ZtcKZUf58/R8LKElhK9L/WFupvO2V8lAF42em
         aopRVZhQ+2lg9dUwaGfRtg0aGoorLCGWIAv5S1ccxVMStgjg5tEhI7ei+InufMiM+r9J
         lK9g==
X-Forwarded-Encrypted: i=1; AHgh+RoLFtEZivMK+qOE65Pv2oWQy+o3kLO0fkjIuk2h4OrE+/HSjDtrp756065cvnENaF8bqMVTfQJPN5/URCZXqJl7@lists.infradead.org
X-Gm-Message-State: AOJu0YyY0mboMvkiXq89cs2CpLb/N/oZPA9aiEcMtKoUj7TSTnY1skfH
	OR+hyFlWk+n7QL3ct9Ci0OSVxPIGpCXqyJi+XEXnVFAa8JRm1kwbSv7LZQOSjbBYYXU=
X-Gm-Gg: AfdE7cmDeKjD3WH8DpFja8PzYjrg4LHNHjrBrMfGKpzkk420V1UvSdbr4d7q5JiQY0s
	B21d2rEFhzg6beBGq/RWKWtWmKfSBVeNsvt7wZIRpcM8o6GQ3kFGuy8pmsxOuOLmn+XYw16Db7I
	T7k1vUPiX86TBpbx+qpFw56/gXoH2x8JHB8NAgGzQ522sxbbHdk3ciRbobqS77vsMmRUAnTlg6Z
	Y9/owsBFmVAlSXGwlAUpofYhTqNzEnU3jim5DRymnVaCYsEkK4uZFC0UmFAy/eHZBWsWqNI9PJ+
	ms9Vh+g+IzKwFphkA4KaQUik6TUL/SCLpJEqT1tABrySfsfY4mMy1dCGjTQtKt8X7Gfb/FNydJU
	Wvw41TRrUBQSy3HdAjDEYt0DOyAQSv0EdR7Hm1Nwweuh1BsHWsmFJpDeJT+0Liz9daHsRGIV23v
	bRBMNPzgI=
X-Received: by 2002:a05:622a:2610:b0:519:f884:b587 with SMTP id d75a77b69052e-51e4eff37b5mr46908081cf.27.1784151041296;
        Wed, 15 Jul 2026 14:30:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd492sm224622526d6.34.2026.07.15.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:30:40 -0700 (PDT)
Message-ID: <84fb82b5f765c98d1e22af9e60658df2d42ba016.camel@ndufresne.ca>
Subject: Re: [PATCH 2/4] media: mediatek: vcodec: remove redundant return
 value of vdec_vp9_slice_setup_prob_buffer()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Wed, 15 Jul 2026 17:30:37 -0400
In-Reply-To: <20260506084203.202882-3-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
	 <20260506084203.202882-3-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-uijvWZFgWMICyZhGcasg"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_143042_789183_2FC33AFF 
X-CRM114-Status: GOOD (  15.84  )
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


--=-uijvWZFgWMICyZhGcasg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> vdec_vp9_slice_setup_prob_buffer() never fails, remove 'return 0' from
> vdec_vp9_slice_setup_prob_buffer() and modify its signature.
> Also, remove the return value check in vdec_vp9_slice_setup_single()
> and vdec_vp9_slice_setup_lat().
>=20
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 13 +++----------
> =C2=A01 file changed, 3 insertions(+), 10 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index 092fd34e21d2..0f47b2671353 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -1013,7 +1013,7 @@ static void vdec_vp9_slice_setup_lat_buffer(struct
> vdec_vp9_slice_instance *inst
> =C2=A0	vsi->row_info.size =3D 0;
> =C2=A0}
> =C2=A0
> -static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_instan=
ce
> *instance,
> +static void vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_insta=
nce
> *instance,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct vdec_vp9_slice_vsi *vsi)
> =C2=A0{
> =C2=A0	struct vdec_vp9_slice_frame_ctx *frame_ctx;
> @@ -1030,8 +1030,6 @@ static int vdec_vp9_slice_setup_prob_buffer(struct
> vdec_vp9_slice_instance *inst
> =C2=A0	else
> =C2=A0		frame_ctx =3D vdec_vp9_slice_default_frame_ctx;
> =C2=A0	memcpy(instance->prob.va, frame_ctx, sizeof(*frame_ctx));
> -
> -	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static void vdec_vp9_slice_setup_seg_buffer(struct vdec_vp9_slice_i=
nstance
> *instance,
> @@ -1170,9 +1168,7 @@ static int vdec_vp9_slice_setup_lat(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0
> =C2=A0	/* setup prob/tile buffers for LAT */
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> -	if (ret)
> -		goto err;
> +	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> @@ -1804,10 +1800,7 @@ static int vdec_vp9_slice_setup_single(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_single_buffer(instance, pfc, vsi, bs, fb);
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> -
> -	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> -	if (ret)
> -		goto err;
> +	vdec_vp9_slice_setup_prob_buffer(instance, vsi);
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)

--=-uijvWZFgWMICyZhGcasg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf7/gAKCRDZQZRRKWBy
9AuhAP45kkmqN6KDRPau8KsNlbh+VehZLSyD0vR1d0SaUrC9YwEA6rBKC53JzIa4
e3mkBO2afGzRaiVa1ujr4Kj+OTnn9Qw=
=FGyY
-----END PGP SIGNATURE-----

--=-uijvWZFgWMICyZhGcasg--

