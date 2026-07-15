Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCAAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 21:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1DyBt4E5F6Qr9zum6Mdb8tt7jO9CILZSVeKqdjI/1I=; b=v41gumgxfDdYlQS3lyCeaqUzo8
	YgjwHW1IBu9eniIxXJF3COLKL/i9LnNZmxvHpNvpHhe8XzgzOvYTwJP2EpU/tlb4P7Y3cG8pAHy9v
	8POj1QpbSxlCG3RqkFisSwb+HSG+myYoGC1+41Uu6D6nYSEEgBtm9bYdGOuiLoaY979ggpUvtydTP
	qKbfrMsVPj5t5DOs3yIZ3qTfbvH6JF3aUIQDs+MAtv2dH5HWDN5DmfWqQsGUiaVTfj5xYaawHdxz0
	5ETT/FVPjH7YGHYsuXsigfOqHBWTTTy5EICu8xqDLHqjyl8ZgU1oP00/0PvvdQN31pnPANBMPpv3Z
	B4KnEY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7B4-0000000FxQC-3G5e;
	Wed, 15 Jul 2026 21:30:02 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk7B1-0000000FxNq-0yRA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 21:30:00 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-51c167c58f2so42442261cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784150997; x=1784755797; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1DyBt4E5F6Qr9zum6Mdb8tt7jO9CILZSVeKqdjI/1I=;
        b=y5nO76LyPmiyAv692glzPHc8q4425LGnznktVfUE1lgsgsbFjj4EifPzbWrZFsRdIw
         H5NkWjJ0S2014IOgdtyFRF3NAUBSMhpnuuKjdKwYehKyTz20cP/+ESlLuoxlXO7kd8CH
         4EH0vhaFpb8BrefbwWs86S+xPxe17xBzOxwshRaIDR8nbLobb6Ws2N2dOGiIQ5uLHPuf
         Sd1rx3U6XiPIm5He9OVIwEvYXTaqHNDc1iiMe+o3K5aHU4Py6RMAd+BWKk/9dv2CeWql
         Cym/HuP03226xKHhZ254ifJVsfZsp/AvOpCq6lxOwUqOpgEgLBNUbchHAJi3B2iXrpRM
         X28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784150997; x=1784755797;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1DyBt4E5F6Qr9zum6Mdb8tt7jO9CILZSVeKqdjI/1I=;
        b=ZUPTEb5KNtAQ4odmL9zjYJw9uiCZpkLIUkcpypWiNmIEqTaHiscrUAzRV9FXvEIw74
         JUb0IfRKa1vQEANRqwbeS8AxRmVmYiRDKNw8Iy+rm4yGSAmAy7sUQr0Guwg8Nj/FAtxr
         IFp2sfMLjiQB/ARPVKC/La9bf1TREyFgaDIw5rbFeHGA037QIzrkVPGMDE/T7OdgJBcD
         hJomwr9mlqPa/BOzhs0pT5QIOYmhA05aEUT1H+saagiZAf5GJO41LkYAqNgMwR4cT1ay
         340SOdfQG0N3RQPrWFwL08RgAwnKO9epBOpDJJiCBJmDNcrJEQ05/KMe9l8c+QIPyJqe
         1/LA==
X-Forwarded-Encrypted: i=1; AHgh+Ro59EgdXiJnEc0sprhQCAWQKEmqy/FCeOPK3+b4qVDVu5vFOno/kjEY5jBqnS7Km0fDSZwUW7rwLREZyonKTu6h@lists.infradead.org
X-Gm-Message-State: AOJu0YybqKQCt7VdLt7oLXEz0NhBEGHfvREFAMQewlCDQlLGCeMM8fur
	10Ugu018Q4AZUlo8bya2Y5pX9swyhDR0bDEuksrEkiBwywAlCMS8MyykaJaKQCrp/ts=
X-Gm-Gg: AfdE7cnlBlpdrcVEQILku6vTqIpUP580s59NgVAo7aUuPxPQEUDSrawSivx7YMrF3a1
	vF1UDMfybBNvkvfqw0fBvhGmwCCLyPaTkF6r33oo8BBc7IJ0CYoyvXkrlfcBxjhNMqYhDqiQvT+
	czaZJrt9T+pJEJ8lnnwXsiLPBax5ohYbIx0IEaGeJB5tv/6wh8jkyE1COhz+h1MS9Ie/sGF/w+s
	/csKrwgUx0+BrJev2TgC3o4584gqtKdYVlqGwIo23YdnINyZZusnC0E7AK0NEdSNNb2pZPvzUII
	CHy22geaxUIcX5M+nUZYXjl6JcJx8tsrPiA7U1DU56coQNu49FSJlJmZrQe10TKagdLHsfV85rl
	c+7/Pxmh0XxDzJ8Y0ZEHUfE6bY3Y/pdrDhWbJJuE07PpesgemB9Z1vn4cYKMHH4JBVfkxpZ3ctE
	6ViibVHx0=
X-Received: by 2002:a05:622a:1b8b:b0:517:8e65:68ea with SMTP id d75a77b69052e-51e424540a8mr81974211cf.54.1784150997358;
        Wed, 15 Jul 2026 14:29:57 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::5ac? ([2606:6d00:15:e06b::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51f2bf8ff21sm9929581cf.26.2026.07.15.14.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:29:55 -0700 (PDT)
Message-ID: <c4e010c0e461e0e13d575cf73deb5625ca341efe.camel@ndufresne.ca>
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: remove redundant return
 value of vdec_vp9_slice_setup_lat_buffer()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Wed, 15 Jul 2026 17:29:53 -0400
In-Reply-To: <20260506084203.202882-2-lihaoxiang@isrc.iscas.ac.cn>
References: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
	 <20260506084203.202882-2-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-XmXqUoEqy30RMP6H+In+"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_142959_539427_FF423C47 
X-CRM114-Status: GOOD (  14.61  )
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


--=-XmXqUoEqy30RMP6H+In+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 06 mai 2026 =C3=A0 16:42 +0800, Haoxiang Li a =C3=A9crit=C2=A0:
> vdec_vp9_slice_setup_lat_buffer() never fails, remove the 'return 0' from
> vdec_vp9_slice_setup_lat_buffer() and modify its signature.
> Also, remove the return value check in vdec_vp9_slice_setup_lat().
>=20
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=
=C2=A0 | 8 ++------
> =C2=A01 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index cd1935014d76..092fd34e21d2 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -974,7 +974,7 @@ static int vdec_vp9_slice_setup_pfc(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int vdec_vp9_slice_setup_lat_buffer(struct vdec_vp9_slice_instanc=
e
> *instance,
> +static void vdec_vp9_slice_setup_lat_buffer(struct vdec_vp9_slice_instan=
ce
> *instance,
> =C2=A0					=C2=A0=C2=A0 struct vdec_vp9_slice_vsi *vsi,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_mem *bs,
> =C2=A0					=C2=A0=C2=A0 struct vdec_lat_buf *lat_buf)
> @@ -1011,8 +1011,6 @@ static int vdec_vp9_slice_setup_lat_buffer(struct
> vdec_vp9_slice_instance *insta
> =C2=A0
> =C2=A0	vsi->row_info.buf =3D 0;
> =C2=A0	vsi->row_info.size =3D 0;
> -
> -	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int vdec_vp9_slice_setup_prob_buffer(struct vdec_vp9_slice_i=
nstance
> *instance,
> @@ -1166,9 +1164,7 @@ static int vdec_vp9_slice_setup_lat(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0	if (ret)
> =C2=A0		goto err;
> =C2=A0
> -	ret =3D vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
> -	if (ret)
> -		goto err;
> +	vdec_vp9_slice_setup_lat_buffer(instance, vsi, bs, lat_buf);
> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> =C2=A0

--=-XmXqUoEqy30RMP6H+In+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCalf70QAKCRDZQZRRKWBy
9DGXAP9XuBSksrSCep8Jlzxh2/aCF/lg0KJV9tdVNOO2SzsquQD/aSMxVkIV9DZS
7PTlTWKvvXl2/wTLJ8nGU2kyGMMlLAk=
=V/ns
-----END PGP SIGNATURE-----

--=-XmXqUoEqy30RMP6H+In+--

