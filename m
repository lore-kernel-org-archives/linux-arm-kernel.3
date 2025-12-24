Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1C8E77364
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 14:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kv8uVhQiYXeEfFC22LTWeYBZIiji9JQILeQzDCWhcvk=; b=jqB7DEv3vwWNHFj06RvG+Lq3Gm
	c8x8OGYsXvKjWtMLqJQLHk99+UFKQFomMI1qfiUVAeBTVeCXF7Fg2AZYrBmG10odjhUm++urLQn3U
	gdUdr5L7tl6UryKEeFeTrRwVkIZgoRY8Je36IFss7rY/VBM4BrOrII7AgVHw0CcPW0Ywg5q9gx4Fw
	JvR5hdiJ/XdCGeKdv26akhGPH3PDg14nOiRvuEImgxz8qzcyUcI/jKMRpeo1sNfWo433DR07HKJOT
	8pNexE9vOOFkEByLREj5E/eRYIoKzEIvEWPnG4zAO4kLVT84j8V2Eq2LA0Q3z5yrYApRi3pMLJ9c+
	ZbnnoHdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQAn-0000000H1Yo-3tnw;
	Wed, 24 Dec 2025 14:49:10 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQAI-0000000H1UR-1Vf1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 14:48:56 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-88fdac49a85so23112006d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 06:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766587717; x=1767192517; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kv8uVhQiYXeEfFC22LTWeYBZIiji9JQILeQzDCWhcvk=;
        b=xrFB0+qRqWP7RX5kMF1m7LoeT0PjLTKn+F7QzKgFDWTPYlV79ho9sAE/ajAPVVMdCN
         WDTkv1OqYGb+jjLVhFmcsJxynsI32dHZc3lMMsPZ+rWxf/hVsCeGeoASTU/9LU4Tad7B
         kZVsleX1CVdD5dazXjm+nvGK9con9rhOauBkywEFD/qgOSlPDYeGgj8J2AHOurMbIW67
         ygJtfBW1jE0896cP1g27lhgb5VJaj9bnjhBB2tFej5QvL/uLBRQM2ggdXySonyAJcVyK
         QGd0u5w7imNsgXL4bRc85CQpFbt2/hiy2+KIPXHllWvEfw9Nx7ZcJwpfqae+75CImMBG
         aBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766587717; x=1767192517;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kv8uVhQiYXeEfFC22LTWeYBZIiji9JQILeQzDCWhcvk=;
        b=TrLAqNTl03FsgXv711onkm+shOcEH3HZFQL1Ro1ocZTLR0NRh/Mn4Q2gpULqf/lYOb
         H/2Lza91W0YeLV/7+vr8w29f8s2y5uodt+yFzZ3CctGlhzzrhKrm0aPFzKRKueWdtYfV
         WTIQQOI1D4zQVIJYistgw0Bk6H1QqmoyrIv3HZtSjPszfLrK319LuHOqGEHD476qU79M
         cEwkPabjdrd3fWGEZ1K06dPkjCgvkD4Y1+zonbn8w1P/P6D2dQK0aDolTwSVyjfaJw2g
         FeJA9/fm9bh7lNtSSIcLUK6fgiarvZ5JPJKxG6aiy13cPP5WaxWbg/y4YJWSvrOhnFIV
         Rmlw==
X-Forwarded-Encrypted: i=1; AJvYcCVtPz9QJn6N7+GldAuyPNja7yohzDleBD5evJbL6RpM7ydMJWDIEq9c8ovhdj2xPmTj8KubX8iEKEzSsgqePrf8@lists.infradead.org
X-Gm-Message-State: AOJu0YzM4xsTYipLYCP59o7WzOGo+S4KVhr+oHTFa2Z7PuZyCvqlPVSr
	wXDS8xR9r8hSbvBPVDg+LnzhFZg7nvyk8UNOjHPV6PfVwFx1cS7xq8OI3ZBjqzbKPEjpSbcqM1b
	5grA4ecs=
X-Gm-Gg: AY/fxX6E1ciUDKPkDp20/75GZK80HDbPOJSqTPrG/auShjzivDk635NGQbcv0juK2/g
	5WBGCOYvNq0bi58BhyNXobjkfM3SuRKGgs4R1loY7vrWLDHL/vIdTrWXiDScd8B9QaEF1T7aP2F
	kzojyx9XfbgBEvQ/SpxZW2uIyzIIuN/MUgl8qS2HA8Yx2GhDkF375O643EXHZ+hpqdAKEHJjitX
	TdU8YnQqoJ++3BuDvtEvtACsti2+13B4fchJARileRilPpY5pvEtNlTUigk3Exhw+n40l5psUm4
	azu+Djmywz9I55xLmMxf/07uBtprmcH/PhdX3JMLpWSgzNT+gvkOjiu+6Jw43HFX1aUh+5Vaa5r
	IeIxPfv93/kb2AFRj1fnbwlhbtLEAhZfxT4I6uThXr+wq5taujmS3EdCTU5cDwyrhzRz5Z4Whgy
	gvFbWs1AFMm67NPTT/
X-Google-Smtp-Source: AGHT+IHUw306Ut7ymeV0kJIFuDFhQmJhzVDxJ8eqcQqn6KuZn3cQi9qGKe1+/PE9xQtkQkAuW1Wvfg==
X-Received: by 2002:a05:6214:5013:b0:880:5851:3c49 with SMTP id 6a1803df08f44-88d82621f22mr305922536d6.0.1766587717216;
        Wed, 24 Dec 2025 06:48:37 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d969fed73sm128870776d6.15.2025.12.24.06.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:48:36 -0800 (PST)
Message-ID: <43caf038367d00217d11237e54c82240c3caea5a.camel@ndufresne.ca>
Subject: Re: [PATCH v2 04/22] media: rockchip: rga: use clk_bulk api
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Wed, 24 Dec 2025 09:48:35 -0500
In-Reply-To: <20251203-spu-rga3-v2-4-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
	 <20251203-spu-rga3-v2-4-989a67947f71@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-5GfWg0gYb1YIqmTgJN+W"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_064843_495502_621B7847 
X-CRM114-Status: GOOD (  18.34  )
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


--=-5GfWg0gYb1YIqmTgJN+W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 03 d=C3=A9cembre 2025 =C3=A0 16:52 +0100, Sven P=C3=BCschel a =
=C3=A9crit=C2=A0:
> Use the clk_bulk API to avoid code duplication for each of the three
> clocks.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 64 ++++----------------=
-----------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h |=C2=A0 5 +--
> =C2=A02 files changed, 9 insertions(+), 60 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 43f6a8d993811..ef568b3758380 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -698,48 +698,10 @@ static const struct video_device rga_videodev =3D {
> =C2=A0	.device_caps =3D V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING,
> =C2=A0};
> =C2=A0
> -static int rga_enable_clocks(struct rockchip_rga *rga)
> -{
> -	int ret;
> -
> -	ret =3D clk_prepare_enable(rga->sclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga sclk: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret =3D clk_prepare_enable(rga->aclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga aclk: %d\n", ret);
> -		goto err_disable_sclk;
> -	}
> -
> -	ret =3D clk_prepare_enable(rga->hclk);
> -	if (ret) {
> -		dev_err(rga->dev, "Cannot enable rga hclk: %d\n", ret);
> -		goto err_disable_aclk;
> -	}
> -
> -	return 0;
> -
> -err_disable_aclk:
> -	clk_disable_unprepare(rga->aclk);
> -err_disable_sclk:
> -	clk_disable_unprepare(rga->sclk);
> -
> -	return ret;
> -}
> -
> -static void rga_disable_clocks(struct rockchip_rga *rga)
> -{
> -	clk_disable_unprepare(rga->sclk);
> -	clk_disable_unprepare(rga->hclk);
> -	clk_disable_unprepare(rga->aclk);
> -}
> -
> =C2=A0static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0{
> =C2=A0	struct reset_control *core_rst, *axi_rst, *ahb_rst;
> +	int ret;
> =C2=A0
> =C2=A0	core_rst =3D devm_reset_control_get(rga->dev, "core");
> =C2=A0	if (IS_ERR(core_rst)) {
> @@ -771,22 +733,10 @@ static int rga_parse_dt(struct rockchip_rga *rga)
> =C2=A0	udelay(1);
> =C2=A0	reset_control_deassert(ahb_rst);
> =C2=A0
> -	rga->sclk =3D devm_clk_get(rga->dev, "sclk");
> -	if (IS_ERR(rga->sclk)) {
> -		dev_err(rga->dev, "failed to get sclk clock\n");
> -		return PTR_ERR(rga->sclk);
> -	}
> -
> -	rga->aclk =3D devm_clk_get(rga->dev, "aclk");
> -	if (IS_ERR(rga->aclk)) {
> -		dev_err(rga->dev, "failed to get aclk clock\n");
> -		return PTR_ERR(rga->aclk);
> -	}
> -
> -	rga->hclk =3D devm_clk_get(rga->dev, "hclk");
> -	if (IS_ERR(rga->hclk)) {
> -		dev_err(rga->dev, "failed to get hclk clock\n");
> -		return PTR_ERR(rga->hclk);
> +	ret =3D devm_clk_bulk_get(rga->dev, ARRAY_SIZE(rga->clks), rga->clks);
> +	if (ret) {
> +		dev_err(rga->dev, "failed to get clocks\n");
> +		return ret;
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -935,7 +885,7 @@ static int __maybe_unused rga_runtime_suspend(struct =
device *dev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =C2=A0
> -	rga_disable_clocks(rga);
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(rga->clks), rga->clks);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -944,7 +894,7 @@ static int __maybe_unused rga_runtime_resume(struct d=
evice *dev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =C2=A0
> -	return rga_enable_clocks(rga);
> +	return clk_bulk_prepare_enable(ARRAY_SIZE(rga->clks), rga->clks);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct dev_pm_ops rga_pm =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 72a28b120fabf..a922fac0c01a3 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -6,6 +6,7 @@
> =C2=A0#ifndef __RGA_H__
> =C2=A0#define __RGA_H__
> =C2=A0
> +#include <linux/clk.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0#include <media/v4l2-ctrls.h>
> @@ -81,9 +82,7 @@ struct rockchip_rga {
> =C2=A0	struct device *dev;
> =C2=A0	struct regmap *grf;
> =C2=A0	void __iomem *regs;
> -	struct clk *sclk;
> -	struct clk *aclk;
> -	struct clk *hclk;
> +	struct clk_bulk_data clks[3];
> =C2=A0	struct rockchip_rga_version version;
> =C2=A0
> =C2=A0	/* vfd lock */

--=-5GfWg0gYb1YIqmTgJN+W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUv9QwAKCRDZQZRRKWBy
9PD/AP4tic+jV60iRFkPYzejPFAmtdDlWpNwzUiuwJZwW678VwEAnEx6nok/9TcX
lGjkyKo77ZGxsPzeclf3xOMh+37c4QA=
=g61U
-----END PGP SIGNATURE-----

--=-5GfWg0gYb1YIqmTgJN+W--

