Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0A3CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiwtqZphJSml0R4L9uG6YdUip66h9uGgkQ6b6jASY4c=; b=gvC/METHbFAW7e6OuhCbCtYwrA
	EsgQb9StUkXQxbnrcjj0I3iAsGNnXFGxyCkxltaHTOPucYZMm3ODwMGuqIF08yp8cjPsCbQ2H6y/L
	/JTBXhzyO7Bx32X8PtA6vGBKLz1sQGDbVeQqmF6LmK5oAV8TfTHDM326xYuGNNowpd8PACTK5udFx
	Ba4tfj0EBaGHO6kXlOz8kIQdz5w1QK40lBq4JHi0gN22QJG3Anm4OBNd+lFSVXFbU1HX1NDzQBQOU
	Lsg0R6GRs/pNOa24Gdh8nZl7ds+XkXNA3pKv6s+F6N98DpNdEGGamOJKF3qGYB4hXIvAT8JtjpqV/
	//gLCM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBegf-00000004WUL-3UAK;
	Tue, 29 Sep 2026 20:44:29 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBegc-00000004WTJ-45oH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 20:44:28 +0000
Received: by mail-qk2-x10.google.com with SMTP id d75a77b69052e-530de452c33so43228211cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 13:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790714665; x=1791319465; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiwtqZphJSml0R4L9uG6YdUip66h9uGgkQ6b6jASY4c=;
        b=mrG8xRJwaxUZstZ5ZoxJ5qRC9o7cnECWvO/lT6Cx0tK8b6pqFNL6xFtfoH0prvSb7Z
         O6ajqVrg+vWsSEwLQO7/A1Ed3BdQtpu2MRX4xAXQdENXBsQmA/tBIGDRpAy9NKO5eFuk
         JOmv+Pa/pqCvJtZ8xplyTOf+3XuX+BZryUiA93Gj5xRgbYT2M5ZG1DuUZ4QhAPnmdkvP
         Jh5dWvYed/YokzR1L3FAcBJzkyE2ZbuZ9RSZFb0aZS+zpSSgceqIZnidkjpmx6vsi9TM
         e8JeXFApjhQh6A/SIr5uZCR56NLcMjINUQDtSzKYvqGqFcxujXQ5inhoCEbJg6N7m4fd
         DN+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790714665; x=1791319465;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiwtqZphJSml0R4L9uG6YdUip66h9uGgkQ6b6jASY4c=;
        b=POc8jvN9JWmkU8y/Drh9aJM1QEJLqjb7pQgBYPe+P+Ey5o2/1Eoba4kSPcrrY1plDL
         UZYwBUvKraxvKxSdgEln57MlcC9ULo//Ro6ihR7YTnvpu0NUdZyMYs2p0saOkxo2XkiJ
         ahcnRXmhcdbrw4+BLGnGduydJlWz6qK+1tv/+Dg52kI43M09VZTL7g19cSHwS5kHIRCJ
         1u7MeSV7cJUsuhsqh4a57+sWbWryUJ/D1Gi+CW4NAoD0q5ZAUvE/v52sdFF59JFjIgju
         ZA1gD8IeZIlhezeTBNk5FoOp6GKvLoDkb9ROph/gXj3guLYR2FyjSIaPZ8WyBrLyoYMw
         tIxw==
X-Forwarded-Encrypted: i=1; AKwUvBwPqRVnp4+9yo1phEByMFZ6/UBSukIzdCF/YFp4onoE1N2uECHykdHPfOJlT70oJoMDwNWhvwMBpdmYYKuotY6u@lists.infradead.org
X-Gm-Message-State: AFuF++ne1GkkgGO2hPRJXX+EGw1TRq+wbxhYkJ7pssAX3JaTXLLtOj9h
	xeFPGSu1Rbp96kHk2SuImgwTFyei9UwCQT11rOjbNMi2uHwMtBrPdJKjc/1wxCpB87Q=
X-Gm-Gg: AYBFou2nNMUE6rAy6lRdT8Iic4ujv0B3L9v1PtYBC9LyWun1k4RiNlsDHudI2j5/NNs
	GtEHyqznm/es/BnM3oDtl+2NawLhtR95Cg+Dob8v/qjgVjodnmctuCrmvLmSs9Y9eSyc1TLdLlk
	qTpvTnNAdBUb1cZTKR0Fi3Cr/f1yeD8LO5QMlM3JN6WTyfL7KXNHUiHx4juxhynMMYsYN4nnhCa
	//5MKNXajqlls6+tfBWo32ea/+Uac5jCfavWY9KxurzJ1/xQAOD6y40qxvJtjgpAKSeUhTKbffF
	9vztn8GlZIk2SD9cZNj58O7ZI8I3YUY/50ALwJ4PjECiEXgQcaFVs/BMHQTbd07gNyut52Ps2SG
	c2VBXL5HchyPHm9VyqGUoEEhfURk/rTu+JG4StIimQqSuIwqM/PXAJoH3jzIP27I68I9L6gCrQT
	rY5ArjXMKM6I1V2Ll/2GhuCmsEydhcmYl1eOrIG1lp3F3ONqOorxqzqkVsYY+Qtt2B81K82089B
	ZlDLhjqr6JRT43+ynzEu5vX
X-Received: by 2002:a05:622a:229d:b0:530:e429:ea81 with SMTP id d75a77b69052e-5336a4fedd4mr9984921cf.11.1790714665420;
        Tue, 29 Sep 2026 13:44:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917987e1439sm3860516d6.21.2026.09.29.13.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:44:24 -0700 (PDT)
Message-ID: <b2430afd1f224f12d5b74349399892ad774874c3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: platform: mtk-mdp3: Fix device reference leak in
 mdp_comp_init()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com
Cc: hverkuil@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mchehab@kernel.org, 	moudy.ho@mediatek.com, stable@vger.kernel.org
Date: Tue, 29 Sep 2026 16:44:22 -0400
In-Reply-To: <20260917100721.2146044-1-vulab@iscas.ac.cn>
References: <20260917100721.2146044-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-fdXlNmHJpaX9m6SU1Zhk"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_134427_054934_CD33603A 
X-CRM114-Status: GOOD (  20.51  )
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


--=-fdXlNmHJpaX9m6SU1Zhk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2026 =C3=A0 10:07 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> mdp_comp_init() takes a reference to the component platform device
> with of_find_device_by_node(), but the error path taken when the
> clock array cannot be allocated and the one taken for a component
> without a GCE EOF event return without dropping it.  The caller
> frees the mdp_comp in those cases, so the reference is leaked.
>=20
> Release the reference on both error paths.
>=20
> Fixes: c4320f9721fd ("media: platform: mtk-mdp3: dynamically allocate com=
ponent clocks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drive=
rs/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index 7fcb2fbdd64e..acb2758a7b42 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -1730,6 +1730,7 @@ static int mdp_comp_init(struct mdp_dev *mdp, struc=
t device_node *node,
>  	struct device *dev =3D &mdp->pdev->dev;
>  	struct platform_device *pdev_c;
>  	int clk_ofst;
> +	int ret;
>  	int i;
>  	s32 event;
> =20
> @@ -1756,8 +1757,10 @@ static int mdp_comp_init(struct mdp_dev *mdp, stru=
ct device_node *node,
>  	comp->clk_num =3D mdp->mdp_data->comp_data[id].info.clk_num;
>  	comp->clks =3D devm_kzalloc(dev, sizeof(struct clk *) * comp->clk_num,
>  				  GFP_KERNEL);
> -	if (!comp->clks)
> -		return -ENOMEM;
> +	if (!comp->clks) {
> +		ret =3D -ENOMEM;
> +		goto err_put_device;
> +	}
> =20
>  	clk_ofst =3D mdp->mdp_data->comp_data[id].info.clk_ofst;
> =20
> @@ -1782,7 +1785,8 @@ static int mdp_comp_init(struct mdp_dev *mdp, struc=
t device_node *node,
>  		if (of_property_read_u32_index(node, "mediatek,gce-events",
>  					       MDP_GCE_EVENT_EOF, &event)) {
>  			dev_err(dev, "Component id %d has no EOF\n", id);
> -			return -EINVAL;
> +			ret =3D -EINVAL;
> +			goto err_put_device;
>  		}
>  	} else {
>  		event =3D MDP_GCE_NO_EVENT;
> @@ -1791,6 +1795,10 @@ static int mdp_comp_init(struct mdp_dev *mdp, stru=
ct device_node *node,
>  	comp->gce_event[MDP_GCE_EVENT_EOF] =3D event;
> =20
>  	return 0;
> +
> +err_put_device:
> +	put_device(&pdev_c->dev);
> +	return ret;
>  }
> =20
>  static void mdp_comp_deinit(struct mdp_comp *comp)

--=-fdXlNmHJpaX9m6SU1Zhk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwjJgAKCRDZQZRRKWBy
9AzTAP9evVQ/rK1EdzWFKFNoZe85mZQymiN/AnmFnzuCNe0UMAEA2miyExzscQrC
QApgG4LckhviwoffkCjd3tbgtsQ2eAU=
=kfwh
-----END PGP SIGNATURE-----

--=-fdXlNmHJpaX9m6SU1Zhk--

