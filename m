Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF51CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 21:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WFXVZDT0yfhcBTuFPg21aJm8jhlblvZ+mRIY0J9dPY=; b=Ij2UpANedyiPuHKbxFLrT332Gl
	WOSuufHbkyhcZowVUww8rGyXt3hpRgFqdq5IyTQhrnlBh/gp5A1cj0iP401oFgoqohKTqc0e+cOlS
	037leD1SIVyUC+rBnO0ON2C/WWsu07e3MrTvz1XzltbLsgly0QJLGgKiHsKUmkeZtp5i6JPGtcgru
	esAJlR7pLBwc7zoVC7iOnVVTUhxk5OswyfnB9KAmUToD1QHRwVRCtXZnBIVMMKuxfEp5KE7Uyqgkm
	1H1Nj23DlcXMwtUDlAW5+1iU4spL1sdRYF7KCN9/SnCPp2B60tlUh3IQp3FnllfGSy6ijhnREmrYJ
	XlsoGxCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBewh-00000004Yk2-0XPE;
	Tue, 29 Sep 2026 21:01:03 +0000
Received: from mail-vs2-x15.google.com ([2a00:1450:4864:3a::15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBewd-00000004Yhh-3bSb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 21:01:02 +0000
Received: by mail-vs2-x15.google.com with SMTP id 71dfb90a1353d-5cd13e9ec34so1958381e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 14:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790715658; x=1791320458; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WFXVZDT0yfhcBTuFPg21aJm8jhlblvZ+mRIY0J9dPY=;
        b=zLvXnnYs+0SLrTirRysnKctcWs/zX3mGoij3ZrEd05uZPCJPFCR/VKycQLhdjuNMq2
         tDHLJBhpzu4W8YnVfnsRIvC8eYvJRw8sK3Eyx+K73F2r/E1CHzF9h95rZB+cskX9583J
         kB+TyDr0T0RzzjLA7ujmvxz+8OIbGaS2gON+YYCd+1AOYZHims1HKPaTPBMqqzH8h3UQ
         XeBMid417qhL+ueNMZnZJGzBZxfwas8AvfyGhMYWFU6/DYH/MD90hrKAMr2G6oGUicZb
         kbWOjNeaHm6cXbE6fM7+G80tILhEK6J+7/jKWBOyyDXpt3R37sV3M2tVDkyBHjpAqPy3
         bv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715658; x=1791320458;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WFXVZDT0yfhcBTuFPg21aJm8jhlblvZ+mRIY0J9dPY=;
        b=HCPGlON3Y3nFH9hhoSjhxk8Zdqr9jBuCa8qHYhJJdWlq3SLai8+2abb8o8gg0aZmmC
         aNlSR3OOWiGtWzmAV6tMMgP7TGOH4d011GiZsD2c1Q4cI3RGy/boKTNawQ+NE1L03rL7
         bLv9pe1e+rqwmhAEdFhWCAUsYNxqLfX9b1jcpBb+JdQGeHbRKSciMx1hz4Hs/i9oAPno
         mUvrTL30a9ZrL0LMJJR/xHFWHswhBTzFgVYfP2t+vQWwAFpCDhBrKTPp3UrKd/9S+YFJ
         pVcs/o1pycJ+MSKfJ1ILMMFpz/KYXwHY3ok0/D47oWyxpvbQZDRsyPmEeAy2zFtzIfpE
         1DZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMaqp6PHaQeMEVOJxUiKwZFUlJXoAJpVNq2tfjtqzWwFqirfYBnx85NGn1llh3lacaXlm4A+vuMjg+CNnilxXF@lists.infradead.org
X-Gm-Message-State: AFq9FYKJo1wqr/5oZcBiVBYuQFx4XlvPfXFrqONmM0CvK8sb1l11v8uJ
	COF1Rwf/A7c4+67LtNPPEUpUxii0wh36GgDmxRHrQw/+jjVfrsg87hshF0K2/MW5Zik=
X-Gm-Gg: AYBFou34d3RA/91zhzVelXWdFGOALlGZUt+gq1RfnnMsMj/A4LvIguqXAhXyTCjup5J
	TiR3179LEtWUH6RAZxbbaieiAxZOuiNOv9wn6FLL7GKcibx4TGXqj9tcGOkDWSzwgDyTXqsm7wy
	eDR6BFwzP7JEVZu8BU7eE+dkJJm1Tvwb+ohETsVi50vpz9+5vyKD8PhJJ86tc0t/cdeCCG+fmsU
	47g9u5n0auy3WPXghLKT8MTxgDqFsrlE+/KghMdIE/hSIhvqYY3VtkcygoqJyAWQ3Pgb1Nhv/qY
	x3AvEcw7qzRjB+Pnn9cRCHAnpoaCis1T2G+6/XwGgZRppfgQgAAKheUscvQjcRdc5CsMX43mzNA
	NdZE/OHE8FTFMXcJNocvxZya5XCC/UN7Z+xubhF3wiH3zbOwpTNBKatvNRbiTVIXAfNFfjoVLfe
	Ux6yayI6Ktj4xSjqjRBsd8GAYkQTXfoMB/y4uea9qe+NFYlY4C+2RA9fNNVhcr+LcC3SdgGz7js
	8zjHJv8JXC7dg==
X-Received: by 2002:a05:6102:2d02:b0:7aa:1b48:ca3f with SMTP id ada2fe7eead31-7bc39333beamr267682137.3.1790715658269;
        Tue, 29 Sep 2026 14:00:58 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4e778bf23sm1128224e0c.3.2026.09.29.14.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:00:55 -0700 (PDT)
Message-ID: <2e3c6c4eb72d79ef8b995d6ae62a6424685ec281.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-jpeg: Fix runtime PM leak in
 mtk_jpegdec_worker()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Wentao Liang <vulab@iscas.ac.cn>, angelogioacchino.delregno@collabora.com
Cc: bin.liu@mediatek.com, hverkuil@kernel.org, irui.wang@mediatek.com, 
	kyrie.wu@mediatek.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mchehab@kernel.org, 	stable@vger.kernel.org
Date: Tue, 29 Sep 2026 17:00:54 -0400
In-Reply-To: <20260917100247.2145872-1-vulab@iscas.ac.cn>
References: <20260917100247.2145872-1-vulab@iscas.ac.cn>
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
	protocol="application/pgp-signature"; boundary="=-LdOO8KXcg0f7Ano5ixCQ"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_140100_170373_C683BD29 
X-CRM114-Status: GOOD (  16.68  )
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


--=-LdOO8KXcg0f7Ano5ixCQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 17 septembre 2026 =C3=A0 10:02 +0000, Wentao Liang a =C3=A9crit=C2=
=A0:
> pm_runtime_get_sync() leaves the device's runtime PM usage count
> incremented even when it fails.  mtk_jpegdec_worker() jumps to
> dec_end on that failure, which does not call pm_runtime_put(), so
> the reference taken by the failed resume is leaked.
>=20
> Use pm_runtime_resume_and_get() instead, which drops the reference
> again when resuming the device fails.
>=20
> Fixes: dedc21500334 ("media: mtk-jpegdec: add jpeg decode worker interfac=
e")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drive=
rs/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 8c684756d5fc..ed1d5858c942 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1732,7 +1732,7 @@ static void mtk_jpegdec_worker(struct work_struct *=
work)
>  	jpeg_dst_buf->frame_num =3D ctx->total_frame_num;
> =20
>  	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
> -	ret =3D pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
> +	ret =3D pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
>  	if (ret < 0) {
>  		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
>  			__func__, __LINE__);

--=-LdOO8KXcg0f7Ano5ixCQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwnBgAKCRDZQZRRKWBy
9JxRAQCaqpvPcMxkU8M6x7Jg8iRFYx/F7tQzZ4yTAJ0dpC4WDAEAkMVIPHkUqYox
NeqJq4h74JpK7UjBvsNaj7x4tjst7QM=
=Fvo3
-----END PGP SIGNATURE-----

--=-LdOO8KXcg0f7Ano5ixCQ--

