Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54380CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IPN7cSeBDmLbPswg8U4gMRTv7jzrlU78cVvrGOecvk=; b=j+G3ILSJYmI4EKSiP/TVIlFg97
	eqMunSv6TjDJd+sgq6FoPVy0+A92kiNASeK8crfMebsP7z0SRWArobihvfD8HtHQ1eyvO4NDQX5vE
	rfYTtEgfTfBBdFY7eaGFr0rz1S7iopz+ItYdggsbEmmAUvJXALTMvczBovQvgTmmchb3m4gJ3zyW6
	BaYPmWCz1BvGvA0/b87sKtRBAt8FoVvY0Y6ZltM1kTrt3WYBCc6+mboABFyPnzFSFxgHhZkjIayL6
	uBaAeZebZpMHB6Zr4OFLXbMb6flbXyr1DbL+DDfkP3IGS2E+R24XOjghmW8BXTFUbAq+nRpA+lpiY
	EC2zoF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIspP-00000007aLJ-27f5;
	Fri, 01 May 2026 18:43:07 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIspM-00000007aKe-4BUu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 18:43:06 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-506a747448dso14185711cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 11:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777660983; x=1778265783; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6IPN7cSeBDmLbPswg8U4gMRTv7jzrlU78cVvrGOecvk=;
        b=Zwfp6AYSIdcxKwqDUMbfXouncK2qlfVJo64M5ffnKIVxUR0YNd9Lp39vSVHNjD8UQ7
         SzakN/rV0BVPT2VAvuKU862bTO9mf/hu/D8gYFdYuXraZfy9mIKMj/dS3JA1UjrC2qnG
         RQ2/uM+O3TDw90gLX0FIusJK8xqQqXrNegOYbkpE95nmp3Xu4GyUw7PqW56W6cIfP++G
         LfVumXFOQ4eVKx0is4YM2IrqaR/vHf2/p6GIZzj7AqHdqh6oDuzfW21tDiLLuMMpzw5M
         3ZPy69Osc2AknX362uvKp+SpvTXRWOVuSq0XECJtuE+dT+aSbTbpi55aNWjKraG0kRQ8
         z94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777660983; x=1778265783;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IPN7cSeBDmLbPswg8U4gMRTv7jzrlU78cVvrGOecvk=;
        b=EgS5OspYCzJYCr5XwACOk59jceriM7eYlqOZgeSZVHBimDQxOspOdFQrMhu/yA/Cya
         HU3zkOvYpayWx0scMzpwIDsyE002KWCxYivwwhMMaxmMAhOzY0K8RY3s33XvX9TWWS1T
         6Ep6AHOvtd2AcoqmD54rrqgwnwxdeH53nGQA+zxuPxoyElvVxbvH1dhkxIBWHMTG+eYL
         RFtzepVNNnqpnU96mnlI6/hrFD84B3cDJ7DspTDzd9xnjPmGdsKUijfX+JJuaXhytwx4
         gXW/nbZf4pFNyWKBiMOueeuTerRb9hcKhXggGCC4t8Kc+LhVgeC3AoUuxpVytI5XxvA3
         kkQw==
X-Forwarded-Encrypted: i=1; AFNElJ9Cacd2thBdoJOKDRMEQIKgFNBCqG09jQpBPkVyDIW4Z50Qkq17RtuA5iPfvUC5QRR7UpN79pD0XxDvq2vm0X8k@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw0G9ogKmK7R3wnt3DMyFQkhaem+e3aJvyx8V64Qv8rVy/TEzZ
	kAv/VxR3CYZ8SLCeDvvhPtFMomBFOSqi4L9ER7/oKp3L+TXMnjOvavQR0+oDRCruD+LThS9JFch
	V56kzgrs=
X-Gm-Gg: AeBDievfblJ8mi99fI0CBrLVvgW3HIQTE4vuTnLs6jO3QNKG59J6ReIqAnKiEgyVWf1
	lX2oSZa0MUm07lIQyz3XfOcj/2J07xxKN7rtHI3ANTI47HZ19LcUvDWH6ZaDAJAUZ+ZCrI25TOt
	RtZB1I8RUGZ82r4KWOJei4Az9xof15YA6l837xLpJDgEs0frWZWKH14Pw3S9lmBwH3CVwKfidfW
	1lrbTn3EcuaTyCc3FzcfySaiOGXvpUpGPt9Ud/qbBMyuuBYK0SRMW0XeyatnMiyBglEAAYMEvKq
	Zb/3xgM5Y3qoBPLe7fflzrDqXCxI7Bd47Uwuc6Z9oFP3kaL41DN1IlrT623ILKwc/TlqKsvLtwk
	H26CuuFDOD0Z/OiWTAEel7j28xCAomMX7N28sMRx6sjNj6ln8qp+JWuUP0zgDFE1n+i12/lg0el
	2UuK4PRgWtsjcbVbUG2YrGUHv/vL6GRQFfP6ieIgIbamWZ4zl9ayF54VNeiflBqZGR
X-Received: by 2002:a05:622a:480e:b0:50b:445a:4139 with SMTP id d75a77b69052e-5104bfcc501mr5650901cf.54.1777660982833;
        Fri, 01 May 2026 11:43:02 -0700 (PDT)
Received: from [192.168.42.160] (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51043c1b8fdsm17375141cf.6.2026.05.01.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:43:01 -0700 (PDT)
Message-ID: <8ac864747a72c2a02db277438c7ed441b38aa5db.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mediatek: vcodec: free working buf on error
 path in vdec_vp9_slice_setup_lat()
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
Date: Fri, 01 May 2026 14:43:00 -0400
In-Reply-To: <20260429065221.175159-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260429065221.175159-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-yncNRVXEvUL82zIfX7FS"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_114305_317845_21768ACD 
X-CRM114-Status: GOOD (  16.67  )
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


--=-yncNRVXEvUL82zIfX7FS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 29 avril 2026 =C3=A0 14:52 +0800, Haoxiang Li a =C3=A9crit=C2=
=A0:
> Add an error path label in vdec_vp9_slice_setup_lat()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer to prevent potential memory leak.
>=20
> Fixes: 5d418351ca8f ("media: mediatek: vcodec: support stateless VP9 deco=
ding")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
> Changes in v2:
> =C2=A0- Remove two functions' return value check and error
> =C2=A0=C2=A0 code, since these never fails. Thanks, Nicolas!
> ---
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 12 +++++-------
> =C2=A01 file changed, 5 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index cd1935014d76..5a424d738fed 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1166,24 +1166,22 @@ static int vdec_vp9_slice_setup_lat(struct vdec_v=
p9_slice_instance *instance,
> =C2=A0	if (ret)
> =C2=A0		goto err;
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
> -	if (ret)
> -		goto err;
> +	vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);

You forgot one essential step, which is to remove the return 0 and fix the
signature of vdec_vp9_slice_setup_lat_buffer(). Otherwise someone somewhere
these days will add it back base on static analyzes.

Nicolas

> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
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
> -		goto err;
> +		goto alloc_err;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +alloc_err:
> +	vdec_vp9_slice_free_working_buffer(instance);
> =C2=A0err:
> =C2=A0	return ret;
> =C2=A0}

--=-yncNRVXEvUL82zIfX7FS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafT0NAAKCRDZQZRRKWBy
9AkeAQC/nCc//1RNy8QZAEKkoAfSlPNlsSTvZa319kmNYUGXLQD48bQPV2/ZQqpv
raeVmn5f4p0Z4LwV12HpdtM/hgcdAw==
=ogX7
-----END PGP SIGNATURE-----

--=-yncNRVXEvUL82zIfX7FS--

