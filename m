Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685A8FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaIfLAokMdpz1ds5EXxIXoKOS9Wl/EtwVtRKaiR6GHI=; b=Za8xI0WrVV7oIc08i12OBKerzh
	bTmM8b9ACPiY3bic6grsKU6XKmfbC75R651PHYj0DZAtpkpEWd8gMMM+PQPtfQk/b48Lmhudcn4Fa
	KNDkstmIc5gs/xu9ypntZ/FmI49P/SpnknurN5ixUB37XOQGV68HQUyfHuzv2eYNO4eyDlEuyNzOV
	I/HcCmjgECXqXqVL85tlw0Ti/rDbP9drHpiZl2pSxIpN0ZlWaq5jGvfv7SnXzrVxYIzyCZ0TEr9tp
	brHGiegZi06HifbRMSJqOz7MnVmi2fDIEBCYB0nC3kpkE9eyXNFyRCHpuCHT4i6m5ECzWNTLBS6eh
	gaEsNmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp9V-00000002SyM-42nZ;
	Tue, 28 Apr 2026 20:35:29 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHp9S-00000002Swq-1Zni
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:35:27 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-50e63771eb0so106864511cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 13:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777408524; x=1778013324; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AaIfLAokMdpz1ds5EXxIXoKOS9Wl/EtwVtRKaiR6GHI=;
        b=CGHWVWSQI3RIyRV0jSd6Dp0H0KHHEXVsZsccBgVwT54jE/3rcS2bCaSMPrWHghlFNr
         aCSs0/ISjxqfJOnHeqqjMSf7GvNxPEj8VAQWrhvHKhsJnC8QmPn7BQHWeDJgn/RNkJDn
         9hXW1cL9fz02S9Azi+OG/XsVI20BA3hYR9I5dbyH0dXVOiM8dtDBaSS7JtUy38sxpqwo
         sjrJWbZqyqs13vGShhL3tMSZjoEZnEbLTy75K/tWu9Crrc7J7QXgSnPfExF2JoRUtnA9
         StGvmyXa0yIpmD1ESA0cgmxSnkczjhMwaR16+LNeUdhSlKG+j16rqE9DxVHuvF6bUxvC
         2bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408524; x=1778013324;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaIfLAokMdpz1ds5EXxIXoKOS9Wl/EtwVtRKaiR6GHI=;
        b=R9HLwpE9icSEHZHqDp1e50Rm3XpT/UDKEMwxgXSdI/5TUNEpS53yN+j7fdn4RpqZNV
         2I3Vd7LbN1vzmY4TWeB+UMeLIpqwus21yHvKjN1Pk6GhE7FKB/Odop/v0ZMiLMMpl3y1
         utpgHYXIUpkFpMSsmw6tk40+BaX+cnrONAuidrU05xZ4YUCU4ZeKdTD//WEbp6bW3+NB
         6WM7EaAdGf/x+LvbHMnba0jaq2US+Pl7hvdE0mT8cWCtvigxn576FOCDRFUjqZG8W7Nd
         yhtsWoMkbdUjOJ8u4k9UXTWG+4MaDx5Ca4hajngFuQ9sdpPVfnUS3R87Z6cl6NK4c3G6
         c1kg==
X-Forwarded-Encrypted: i=1; AFNElJ/58N1ECFfblVPVmhnI1Edl/1hPtIlRR3p2qdO9nffzJRbcigiu4wmnm9N4uWql3mvr+a6EICIlXIaQDjMzkL9r@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw6w6DLIFsweQgYluIybhX64Jzdu7qlETDweTV8iSbzBSEqG7z
	+G4rROKV0Kxq81BX9bdZTdf6kHyL3QHYGISYpcPg5jkjMNeFZF2KIwjqGXX/oqWpoxE=
X-Gm-Gg: AeBDies/XdqIIWusWdXPN3N7QwpWl+A64e7O2mqJEH4+K3YyDeeylNRdXjz/iZ800sw
	tbNipp3KqlRfEXI2t3ztV/DI4Bfuwd9eR52DfIE8JOV7YL03QUjsFtoJn6mpvE0B8C21xOkDwnj
	CVo0kQ30f9/Q/ecPn6Ya3zcHRfHKDfbcFvlqEtABSS8zZ8UEBySlBal/LfH1t1HVqcYbuYnce1O
	pnJxzfOBRFdM/VNjsxLr9oEYIlRUyvEhiaQg89gDM5/q3oOvRcVG6kw8sLcut1wncGlf6eX2jqp
	XeA3yqRhnYgAVe7aSX+MeAGSd8S3qJALJtEM3NrAK0f8TbaRniSyelsLC1PPbBxNkXdxkRvRWRM
	H5wQZDr8pppezwDiRmj/8U5JHVE6nne0AzSFbr8tDyJ43a+xmEBtaO/3viG6LNWOsrHeSTe3Ta6
	mT//eBOt1VqUp/cNl+j5fXMws1Iz2nyoCnFZ3wigc=
X-Received: by 2002:a05:622a:347:b0:50e:60d7:b272 with SMTP id d75a77b69052e-51018a79483mr17709131cf.41.1777408523633;
        Tue, 28 Apr 2026 13:35:23 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100dbaa48asm24893241cf.29.2026.04.28.13.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:35:22 -0700 (PDT)
Message-ID: <48ec46cc064fb5d367be6336bfafd888586f7857.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: free working buf on error path
 in vdec_vp9_slice_setup_lat()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org, 
	benjamin.gaignard@collabora.com, p.zabel@pengutronix.de,
 george.sun@mediatek.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Tue, 28 Apr 2026 16:35:20 -0400
In-Reply-To: <20260330020224.2729252-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260330020224.2729252-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-rldXSCr7JE/S7Fo4lx/T"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_133526_438997_EBFEE3AB 
X-CRM114-Status: GOOD (  15.74  )
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


--=-rldXSCr7JE/S7Fo4lx/T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 30 mars 2026 =C3=A0 10:02 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> Add an error path label in vdec_vp9_slice_setup_lat()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer to prevent potential memory leak.
>=20
> Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9 deco=
ding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0 | 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index cd1935014d76..3dadb5cc8876 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1168,7 +1168,7 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9=
_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf=
);

This function never fails, please remove its return value and remove the er=
ror
code below instead.

> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> =C2=A0
> @@ -1176,14 +1176,16 @@ static int vdec_vp9_slice_setup_lat(struct vdec_v=
p9_slice_instance *instance,
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);

Same issue, that function should not have had a return value.

> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	ret =3D vdec_vp9_slice_setup_tile_buffer(instance, vsi, bs);
> =C2=A0	if (ret)
> -		goto err;
> +		goto alloc_err;

Ack for this one.

> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +alloc_err:
> +	vdec_vp9_slice_free_working_buffer(instance);
> =C2=A0err:
> =C2=A0	return ret;
> =C2=A0}


cheers,
Nicolas

--=-rldXSCr7JE/S7Fo4lx/T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafEaCQAKCRDZQZRRKWBy
9I7mAQCKtYOYjxEZtyyws6YnoZefw8GOxDT6CrR4VAMH4mJxOAD9HYVii/B6UZO/
0E2YLN5lf+OdoZWjC16cj/8Y7uLZaAE=
=+BZO
-----END PGP SIGNATURE-----

--=-rldXSCr7JE/S7Fo4lx/T--

