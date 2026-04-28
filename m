Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9496FFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LyvFUNpVpPtERUYyLw1pAadsXQTRCYkfiN9yTor4u0=; b=EpL2eYgMWD5I/NsFAz29oOP4Jg
	eGsNJucnXsVJ+/3xyvb9ItLQ/Hyr3Ne1xO0hEu3R2EwsuhCwkVRhgVO57YVZb0s0/DBVA+YyUOBgn
	ssxHZD11COO4oEEvdvuUONn68OqP4+s0G/2Gy2XqKj53DbjTnc8vqZxjmdk+HhqsWHg2Z7v3JaS6s
	llfQJoTKzyyAkFKkQCgP2cCzZ/3xc5AINKjLaDiA1ucE5ax1qckN3F8Xx2Vppain0RvYC2MMRzl1k
	1xQR2eZlaf+asXtkcnk7vK3oejgWGLIRmlrpTTa2Gj9qyKFwlTWdb2s5hP5SDyp2chQG1z4svHU6d
	Iii4yfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpBe-00000002T9p-3ZrO;
	Tue, 28 Apr 2026 20:37:42 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHpBc-00000002T97-3it8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:37:42 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-464bc03efd8so7004794b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777408659; x=1778013459; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4LyvFUNpVpPtERUYyLw1pAadsXQTRCYkfiN9yTor4u0=;
        b=d6mnQPLx6usO01DgxOBsqIbjOjKDjK/rs9AQ4QtC3x9g9HGNBn0aTRPK9Vy1DVmTns
         R2bl+SIxYq+8gZ3PWphtFrnM/SR+xKKohgYH4Grl5Z+Y4M/dqt49C9bWFTRosf/SsUat
         muUfe1zRkPM9HdB82fLuYeWI4HCQXmi924uLSD7por4YYRpjdVyyPEB3aO+Y9vLioiiP
         pkNkUWS4/BEQw6IqFwRrc1ew3IYA2CXNduFdh0YCEWPoBas2MwgHl79ZrTz92nvBOplv
         Q5ax44cK8e52hcob1c5L42u2GIydIguK9UoZsuI8qZSfClZk+iWh/u+OplhW4ke4uVR1
         zwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408659; x=1778013459;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LyvFUNpVpPtERUYyLw1pAadsXQTRCYkfiN9yTor4u0=;
        b=Gthvy+bsW3zTAoRvauPJ5CGHxevLrWRC/2Abw/YiF0DIf/ZJK/Ba3DXET7oJkBqYgd
         McLMcw3iFbQBi6/gqLWRnaheQNXDVnTKrZ1AretzW/8JWmW7ZSele3J3ABhQSCzLocjF
         6tabsp4udPZvv114EvMmP0LfA84YFAEbSe3+s8pH9NPFp7ZF4Q4bYJFV8hONwkq7qpR5
         clHG/Zr9kumwC1TIV/2e4X8zzvmAQj2q1zyMUMdBfkdeiPDsR1YS61RhX+iH75C51bCy
         pbuhn5DVyVrCkztM3aejIeNTyqlnxTQUxJzEVe4mXcWtqmqrK8Vfd9a9443GuVLH0S3L
         X6wQ==
X-Forwarded-Encrypted: i=1; AFNElJ/W1VGwT68Vl6YyWQIU9+JYBsnXPneQ5V1+W2Gcu6E4RJQNnbMqAMGlgunXh/so5t6bzqZdlb/5h11mN3bK3keV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm1+Jk2vWDYxrodDEJjgfIx5PaxsWaQJDov1YVMpZUtL0V5wed
	e92oftE1OBVIQurUzZ+SpfMnwKeLQgPLdsqMS/nRAJNdjJUZfkYtpHAMj5RnDT7e8cU=
X-Gm-Gg: AeBDievprgW3/1x6PmccZ0n5LscfBzjUYNtLTQOZkdCugAWXbpKJTLpvVUuFU1ub+Fd
	K4hpsWVcWpSvILkqAArcOUy3ZP7dPkJfLAJCoB4HK2M6a1TJgu55l9tzZOQbI1cZJh0jkiiM65O
	noYL2VZrWXVAj2/c1+ksq2vGP9ZZvhifptjQ9oZkRRTJl1wcNicmzrz4k5UXmXA3Aq2hp1Y4+/v
	AeC55qo19utobU5FlVy7ixrSa5hiyyDPQT/BBPJ1Zc8X7QSDmrXajwCYGJLfe+cL/5dhFtM4BSe
	7mNmgsVzZoRAhOLiQJoR3iMW4LNeeKA8IEC6QIZ/bbq5cKD+YMhVPr1FqjZs0hiS+xU473yF63Z
	2SPUgzPue8EY1erjzjyIwm8L1RuhVOz+5T2V7PUDSkjhubt6XFcBG/f8Y8+bVT2nLT4FTDOzcLt
	SYVE2uqUgqDunsZbK6i+cOZattGQuWr09HRzckaF8=
X-Received: by 2002:a05:6808:159b:b0:475:be6f:aa with SMTP id 5614622812f47-47c3d9992b7mr647616b6e.19.1777408659317;
        Tue, 28 Apr 2026 13:37:39 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c426fdc44sm37590b6e.3.2026.04.28.13.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:37:37 -0700 (PDT)
Message-ID: <2db848c23398c1995f16e24be9e86dd399a04f4d.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: free working buf in
 vdec_vp9_slice_setup_single()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com, 
	xiaoyong.lu@mediatek.com, mingjia.zhang@mediatek.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Tue, 28 Apr 2026 16:37:35 -0400
In-Reply-To: <20260330021110.2733458-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260330021110.2733458-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-Ia1WDRCY1/M1Q8YAdi4l"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_133740_957915_D55C1112 
X-CRM114-Status: GOOD (  14.62  )
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


--=-Ia1WDRCY1/M1Q8YAdi4l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 30 mars 2026 =C3=A0 10:11 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Add an error path label in vdec_vp9_slice_setup_single()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer.
>=20
> Fixes: b0f407c19648 ("media: mediatek: vcodec: add vp9 decoder driver for=
 mt8186")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 6 ++++--
> =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index cd1935014d76..b3ecb94bebb3 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1811,14 +1811,16 @@ static int vdec_vp9_slice_setup_single(struct vde=
c_vp9_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);

This function never fails, remove its return value and remove the error cod=
e
below.

> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;

Ack.

cheers,
Nicolas

> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +alloc_err:
> +	vdec_vp9_slice_free_working_buffer(instance);
> =C2=A0err:
> =C2=A0	return ret;
> =C2=A0}

--=-Ia1WDRCY1/M1Q8YAdi4l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEajwAKCRDZQZRRKWBy
9E2/AQD/nW836XRN6DAd6ZzBlINp0cYn4Gay0RQSq8mQWp4LCwEAwr6VfThlqpT4
WvmFwT4qjEPeQdKleVFr7EXeFiwJUAs=
=cisg
-----END PGP SIGNATURE-----

--=-Ia1WDRCY1/M1Q8YAdi4l--

