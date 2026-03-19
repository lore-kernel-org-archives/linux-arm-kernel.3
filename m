Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0401091910
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhWNc1Vjc+LamDy9uWXZKku/PYKqtLuRD4QgrfI4wXc=; b=K+X5Iwgd8WrYqYWWlEfqji+Y8y
	fMWfL9vAvWNGIvP3wYwfFGh4Qp6/wDzpQ6pHO0DB6mDVCDLNfDH1sYUVr+4nyfTjoJgp+uzoafhYl
	J/WKknz7FxcFqi1OqtaW2u9jn50s89dSQXZePfNM+2JCyPgJJvWbwalm1fPuQFp+nEBeLv37kNO8p
	p4MxIV894lvIcW4R3ayVtv7cueWo0GuzV7w89z0oV4bqy4Y3v1oK9DJgTjM+LnoUQa3ba7CYh7Kdt
	V5qZe39bnThODme2hdTI+ejQz3Vdfb5O6ujKydogRpj6gbBFCp3AkRqiP4V46yWFUentoDUGv6RB9
	CJcWA2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JRD-0000000BUDf-2jQc;
	Thu, 19 Mar 2026 19:53:47 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JRA-0000000BUB4-3bdv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:53:46 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8cd8d97aa2eso180330985a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1773950023; x=1774554823; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YhWNc1Vjc+LamDy9uWXZKku/PYKqtLuRD4QgrfI4wXc=;
        b=hpG71e2UZaPfnCOuWHWZUIUiyeNLtI34rWSZaontO7X4yzyicvb0QEDMhquY3eJFVv
         NZPucB8rnIIKzalU76ZBPcHePARvAdokFcTsNUwSy3CuLuPSVQI1E/P/jWtUhvo00yMW
         +1fXEy8Ivnxo6fbRqyWRkyzfIeKlf4jvGAmQkiUi/TnTGo/3F6sNKEw1nu0+tqH2wGVM
         2BkTdS1D06+aqDJUz0AOyg195OaQJzI+0O9/SmwOJGWq/a4pCktt1oMkWfUNWAQNJGC2
         JmHrruQp53zVMVn2xVEce8PX7vNwiqXi4QG8E+V2104vRbF8eWwxH3FETYA4YWJ3Oi3X
         RIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773950023; x=1774554823;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhWNc1Vjc+LamDy9uWXZKku/PYKqtLuRD4QgrfI4wXc=;
        b=oAnBm2HOJ/vTB4MXfDJglo42UaPIsRE5gIfOIz/CqjBMZSUlMbf9nMO9+7WCojXAS+
         rbfPaQdbum0XT/X/wL/ALGiXzqoRSY1eafL9LSfV+ZMBfVg/zS3qyR3zFgjAS27Yp4LV
         ms6XzmsxQSlCBKjBw/QoZfNEOCX8zpjrzxTfxKzcqEXW9oPBaqsL9mRMZnJSjHpHe777
         nJau8OIHq0ncxC+Epj87z1uBZngXQk3pKwLVHEnstaC7VQGMUtWUy0p3YuR2dMwd9slC
         o3izbiU77I4Lobx1ffePacHl5J3NaEhIBmmzyCxiYc9VW9fCcXxBMUW7Ww+NcskElCqA
         2cMw==
X-Forwarded-Encrypted: i=1; AJvYcCWar7qA9kOsNvKm/CCzn+tdmVa9hns9egP8bLGV2Wv4KJSXnvSmv91MNF6bKlMe1tuOsKZ0BMh4WS19ca4RRSdQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzgLzK030ZnXoo341UxzY8onZPsk6xBspsVRVlcWWRe/Nsm/80j
	3E4Ea2quG7vpxR0MEvkQL8KMW1w/jMkxUxQWsM5MZ4V4KPCiLAlbhOctIeI8mEqk6nA=
X-Gm-Gg: ATEYQzwDCT6IC2sr5nlCqfU8wcQnmi/xKaNXeMCyJZWWJslnx2SqRDkf8Y245KkHIWY
	3ZGk2jGB1c/eC3ZIfuFqYF/uSpfuQnpwVpF2P/9GUqG4t/lEVgFrx3pxY+r+hiL4XoNEKi5ewxy
	cMlqfUmgt5Aqhfn4JQvkSK/SBt4+cMrzQMO1vbUHdKk8QbUsjY+HulDeNyEvZ+PiQv4TmSYyDq1
	d2XmDZrSeFCGojIl4XcXwXNeiNTXWMLKo+Ylz0GwUi3SDt5b5Xn4uH8EdJ9I2rSaprBKJ3a3Gh6
	vncZaW9m3SkEDFpqmdRERi4CakuoCPVAhyA5ispyeRYxmcFThAietjNpkqCljLYrNI5V4j3MZA5
	9RypUOEX42S9qCqZCXZioU+TqUfLPWHMQr42PJIrAyGR8LloIHcftO1dYVPWWxXTfFr1JqQoVr8
	yqyOBawH4oGWi6xf7+Hx5XWGGjGhYy
X-Received: by 2002:a05:620a:708e:b0:8cd:c050:7db6 with SMTP id af79cd13be357-8cfc7f6a470mr74114185a.49.1773950023287;
        Thu, 19 Mar 2026 12:53:43 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90bb1c7sm3480885a.35.2026.03.19.12.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 12:53:42 -0700 (PDT)
Message-ID: <24867f578a64b1dd6ea55eea47fe7c4a854e5a58.camel@ndufresne.ca>
Subject: Re: [PATCH v4 2/4] media: imx-jpeg: Use devm_pm_runtime_enable()
 helper
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
 linux-imx@nxp.com, 	Frank.li@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Mar 2026 15:53:40 -0400
In-Reply-To: <20260203082349.1082-3-ming.qian@oss.nxp.com>
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
	 <20260203082349.1082-3-ming.qian@oss.nxp.com>
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
	protocol="application/pgp-signature"; boundary="=-8ILH7WDBQi0ijJCZzATq"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_125345_155792_ACE8A635 
X-CRM114-Status: GOOD (  16.55  )
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


--=-8ILH7WDBQi0ijJCZzATq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 03 f=C3=A9vrier 2026 =C3=A0 16:23 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Use devm_pm_runtime_enable() to simplify probe and exit paths.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 15 ++++++++++++---
> =C2=A01 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 39022c1bf36d..877e6c4f7406 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2971,12 +2971,22 @@ static int mxc_jpeg_probe(struct platform_device =
*pdev)
> =C2=A0			=C2=A0 jpeg->dec_vdev->minor);
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, jpeg);
> -	pm_runtime_enable(dev);
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable runtime PM: %d\n", ret);
> +		goto err_pm;
> +	}
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_pm:
> +	video_unregister_device(jpeg->dec_vdev);
> +	/* set NULL to prevent double-free */
> +	jpeg->dec_vdev =3D NULL;
> =C2=A0err_vdev_register:
> -	video_device_release(jpeg->dec_vdev);
> +	/* Only release if allocation succeeded but registration failed */
> +	if (jpeg->dec_vdev)
> +		video_device_release(jpeg->dec_vdev);
> =C2=A0
> =C2=A0err_vdev_alloc:
> =C2=A0	v4l2_m2m_release(jpeg->m2m_dev);
> @@ -3047,7 +3057,6 @@ static void mxc_jpeg_remove(struct platform_device =
*pdev)
> =C2=A0
> =C2=A0	mxc_jpeg_free_slot_data(jpeg);
> =C2=A0
> -	pm_runtime_disable(&pdev->dev);
> =C2=A0	video_unregister_device(jpeg->dec_vdev);
> =C2=A0	v4l2_m2m_release(jpeg->m2m_dev);
> =C2=A0	v4l2_device_unregister(&jpeg->v4l2_dev);

--=-8ILH7WDBQi0ijJCZzATq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxURAAKCRDZQZRRKWBy
9HGOAP9x9uCXnIeQXoRzJWIGjr07Fij2NUuyHkDuiL5QrZD4tgD+K4d2XKoSsfpX
wea5NI21IVEx5NJdUp7XmXeNCPU7ngY=
=lQDp
-----END PGP SIGNATURE-----

--=-8ILH7WDBQi0ijJCZzATq--

