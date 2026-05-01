Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2B6CD3423
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 18:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulsFcfU93D70Sa+J1hAyL4OPSDEMDmywDdF1UctN/Y4=; b=XOht+ixlH3/UA5Ri6w4QoeuHKx
	UfrF9XxG0Puq1qVmg5dpHRbkxkEvQ5E7xCO0IdG38C1qEblfQFix4u6QapyNLZmNpTNz8X5iceEwj
	hYVhzG7/8Ya2UX08a74gW2DHyt7axR2SZVuuCxpcIEDx/1/AFURZhogATEQh9f0BfYTWgep6ou2pd
	PicftQrQW8qG7RVZjowH6/GEmhrxPVglMW8wFj7jrreHGYBXjGjSUw6OocwrPMqT1JgKIVvdZ6eWo
	gzcgtvMcX6e64I1e9PN+FXY+5bbWvjm3I+IEbsefSSM6sOcUUfa2jko7nN4U18YFNCIwBk0CkQZwd
	0N6rL6DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsq5-00000007aTx-1MyJ;
	Fri, 01 May 2026 18:43:49 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIsq1-00000007aSW-44xu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 18:43:47 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-506aa685d62so10633071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1777661025; x=1778265825; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ulsFcfU93D70Sa+J1hAyL4OPSDEMDmywDdF1UctN/Y4=;
        b=u9T7bIwyBwvmDU0K/zxZly6QByV5xm3Ot3CggVYpzfJTFSembhsIUI2U0ExqXcpyEu
         2nLuxLy9FansHEoOQx7GT1sJ38oQvyJfDpwTJCkUBvZL8MHQJMWTy3p8xjCo08rs9l8s
         KX7a6nyoj3gqLMjtbhrjW54n+5jteOsSxvcjOF7DItE9NuJhNQaC+kUZUz0gUW5lgwDr
         3pkR3i2FQs1SJEfwb4fd0dwOmJeYRSiMkl6gfGIwMosURkYvpSEdfHowTinFDb/luAHd
         KAscQro8q8lmm0xEEDubmALa2P8faRth+XQMbaRBpHeai/SWSrwLGlyU5Jpt3ypPJ6dW
         1K/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777661025; x=1778265825;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulsFcfU93D70Sa+J1hAyL4OPSDEMDmywDdF1UctN/Y4=;
        b=MA4NFG/ShDV7LEyfB/IXVroR4LvJNr8j6KQt9Vpg9AsC9Pbd9oPcQ4Fr1ql2PrXfB4
         VOSdpDLPset53Qct/tL2ZYOJpPp9hMHPn5GY6NSddyatQAR/iSIhYbNkfzm5anJGFQiK
         iz16gLERTr/BIpTbWLajnc/ZyhoV7fuxnwvP5R7UDHORUL2WUVomCsHtwCTnAQ+L5O0q
         wMWe44tYcQV+KYQde40lWrDu/OOGFNc/GRQy2ptuqhKWFWlgjD85WGIdgvYBiGEFykGx
         WhwTUNUV869G0fuVl1RvOvzG+iuPLt/tJWYqraG2j6bLzdnCO9GKQVOU3clSA/k0cXbs
         nyOQ==
X-Forwarded-Encrypted: i=1; AFNElJ80ANBqDTlV+7eWZEyHziDoPI+J6e94mZb5cS6ator7t/l7AKl4DkxzGLI2o0jtAD5sy0Gtv2sgDmz7LuxVmQ8L@lists.infradead.org
X-Gm-Message-State: AOJu0YwT/0RAaTK8IYfzIxjBFdJRV33RHK4we+IMHkGHHWVz+HBNEA3B
	ga2Ocyd984FP4UOjMY8qIR49NBtr1MaESdWwRBE/90EGExODGjVSY6MD6WOtAD5kxWI=
X-Gm-Gg: AeBDieuaEc/bLT1qlluwIbXqtx5XuZk52O0Yr0h3xcuEQZdtmVpfZzX4n1DX4xf2eDa
	IbmbzvQWsWKI1xhseJqE3FibDMaesavzrHbqOf3auFZWlndfIolA1m+5OxRNSiChuJTmQh6E7I+
	IGh+/13ZMCsoO+RqjC7CHPCP+uwBBK8gdjj+XpjcQ8pPOaEae7bG2kvYCn+YI2/zPmtTLjJz+m4
	5FEKZZMc0PdrzbsUCZWOoHZXMgHlksgSz1lP2x9iu6n2/SrV1DEzFTXCmGV6Nyo9PgkWZ8SQpkc
	ixHw8CY42iDHqNQFP/k5HeMmcI4mWcZzQV4nL79OkK0RWv/mwFdTled/RhhKZ7cPdFMN129US61
	Yp/nfk+0rca56ZFFjtDflX96+kYkGyuZnyo8wMcvJxFsEurzPOZWuLwdbqGia6tXmMTvQa0D+5J
	zQ8tiAV08BBdy9kJVWCfxhefuxtkLZjuKmdjJLSS7S9ZOOG0Hsf6opYA==
X-Received: by 2002:a05:622a:4805:b0:50e:5ffd:dec2 with SMTP id d75a77b69052e-5104be45024mr6935901cf.1.1777661024659;
        Fri, 01 May 2026 11:43:44 -0700 (PDT)
Received: from [192.168.42.160] (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51041ddb598sm18992271cf.13.2026.05.01.11.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 11:43:43 -0700 (PDT)
Message-ID: <fae38f0f4ab8e8176cb6c5a37246e7aa5b5409d8.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mediatek: vcodec: free working buf in
 vdec_vp9_slice_setup_single()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	laurent.pinchart@ideasonboard.com, hverkuil+cisco@kernel.org, 
	p.zabel@pengutronix.de, benjamin.gaignard@collabora.com, 
	xiaoyong.lu@mediatek.com, mingjia.zhang@mediatek.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Fri, 01 May 2026 14:43:42 -0400
In-Reply-To: <20260429070119.181876-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260429070119.181876-1-lihaoxiang@isrc.iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-aMrOnipeNucjfzPvuk1Q"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_114346_017021_47E00F14 
X-CRM114-Status: GOOD (  15.89  )
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


--=-aMrOnipeNucjfzPvuk1Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 29 avril 2026 =C3=A0 15:01 +0800, Haoxiang Li a =C3=A9crit=C2=
=A0:
> Add an error path label in vdec_vp9_slice_setup_single()
> and call vdec_vp9_slice_free_working_buffer() to free
> working buffer.
>=20
> Fixes: b0f407c19648 ("media: mediatek: vcodec: add vp9 decoder driver for
> mt8186")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
> Changes in v2:
> =C2=A0- Remove vdec_vp9_slice_setup_prob_buffer()'s return
> =C2=A0=C2=A0 value, since it never fails. Thanks, Nicolas!
> ---
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0 =
| 9 ++++-----
> =C2=A01 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> index cd1935014d76..d034d84ad7f1 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if=
.c
> @@ -1808,17 +1808,16 @@ static int vdec_vp9_slice_setup_single(struct
> vdec_vp9_slice_instance *instance,
> =C2=A0
> =C2=A0	vdec_vp9_slice_setup_single_buffer(instance, pfc, vsi, bs, fb);
> =C2=A0	vdec_vp9_slice_setup_seg_buffer(instance, vsi, &instance->seg[0]);
> -
> -	ret =3D vdec_vp9_slice_setup_prob_buffer(instance, vsi);

Same as previous patch.

regards,
Nicolas

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

--=-aMrOnipeNucjfzPvuk1Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCafT0XwAKCRDZQZRRKWBy
9DtqAQC1Dg6Zdwpp1TbLyQpoV3dfXpp0ZnEkO20SH8pEBubrUgD+MoWNudTp/uFM
Wq9Gi27dGGRSf9vDASBpXnzMdkgrVQQ=
=o8rD
-----END PGP SIGNATURE-----

--=-aMrOnipeNucjfzPvuk1Q--

