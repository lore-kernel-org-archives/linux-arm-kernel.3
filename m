Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460861099B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 17:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mE8NlS736LAnmHsA7HRF+Ujb5voPxn/yIC8kZohqvE=; b=v1YceIaKxXPbTWiify8s2Uwn/J
	yjZfDLqWm8BsTuA96h/FAJ7ymxH82CHDYAy/YC8YY7e9+QU+B1jOlimK31HdthOrzgRe9OARLhMz1
	CNsi14CLWwqkiiA1PvPZ1BJzOhW3WU+o2VxPWveFxazcub+d3UJxW6yYIa9YmiLifHjJQ3DNcK0ru
	YhKSstqCwb8510mnMsLOXBO8/7bR+hEO9GpgzXTtHnKl8oSYTkrcjZhQ+M7yUlKdL6DZVXqtoDPjY
	KZ5a3trgdYPZPPymgm1xdkhrYk8OCF+KbytWEEtxRU/AViPbsCVPalm0RTtgo/vs8JtzHd7tBbwFz
	JjK2//kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3di7-0000000DGbp-3cW8;
	Fri, 20 Mar 2026 17:32:35 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3di5-0000000DGas-0nL9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 17:32:34 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8cb3bae8d3eso194363185a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 10:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774027951; x=1774632751; darn=lists.infradead.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4mE8NlS736LAnmHsA7HRF+Ujb5voPxn/yIC8kZohqvE=;
        b=g8i1QRwPxPJ6ffClWUmRF1ZtqRDh0lVlN/jJxNMyA2K/f5okaijyHMfO70vWDVaEnc
         a8+K0KEa1oYa6fz22XLsmaYULpGdxZ0aoF1hDGQ9okSlpH4jzCwjixs/6Pk4Zqf7mstt
         IPW/XKOdo8BQg8Hjs+DHepf9O6hbPbphP7zo1w8DJ02lcOZfOd01Ikr+RWc3jcvpSSX2
         iZhrdf1yPiF7xWSiJD8CIMPkFuO2GRvdXsWo8GX53ZUk62idlrOSoSn6omuKR23ZXluB
         FIEHrfNGc6YIweRdei0/tBKpr/JMq+laloMYqQDFbpleUCj6EwcdR6jlGyRHh/z2eAue
         Iqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027951; x=1774632751;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mE8NlS736LAnmHsA7HRF+Ujb5voPxn/yIC8kZohqvE=;
        b=GEj0rHXmUKHDnimLxTuZ0CoUXDTO5F2VbBU+wv7T+jjeHwFyyO9jskO757GR24CRzr
         odQyVi0rffaHt9rQ9IIGJ+d6NHWmp4lEa9k6TgBLOeELDw7SV7Tdylo+30Fns2ivRIL9
         NM/SEHb4hM/xUR3ltqkkzTxWa8wKi6vqXb7s+FFE0K2sSolf/BkE9u2giIt+vGAgPc4i
         KDJY/z5lpjy8T69nDQgTkUdnSKGztK7CZ5/Y/JJeqH3QBHP6OsNNBt5u8BKQlhSGmoc0
         T1x6vE+9F7rOTRaGOjj1mQGOfTTrwoA5ey8mgDafPv+Y6CYzh43ocKuDWd3Yqopk0TFT
         05gA==
X-Forwarded-Encrypted: i=1; AJvYcCVQQwoFrdoxPCTs6Uq1r+fuFbzUJNkSPwbK9jknTIc3kqDPmu/kfOrstHUQKUWhUlHpexO7ISdjhoY9TcqrTw5o@lists.infradead.org
X-Gm-Message-State: AOJu0YxD4ModGD3bp7J4dA7xSTteM3Fa7afxh9W0I7/2H/7rImsPinat
	NMHX7gYbNlecWqxH8FOJo1Y3/I9uzlvzKfn9DsKNCNLflHq0DwV5eJmui4pkr0vSEjY=
X-Gm-Gg: ATEYQzw9GWm52Le5YacUCJexlCudvuE9HMrAG4TqfE+lhowNIJhmAF9F4ZqfWYDkKOL
	Vixte/uffa8aJ0AmSTsM+g6xf6PTU7gSUxeD2HWvMzGrHwURJiNoCb7A73szcPTdM8ikiy2L2bV
	9CulMGKCrnbLwtSbbjZZ40nEsMPG15u8K090DS7pxITJ0m2Bx6MFWXSraT311wjrDEQ8PwuVqWd
	R/9gdh0jTGNHwdFLTLdBzCG66JXRB7EYxrw/Vg7nKzxE+Hx6+G2F4AODZQSUS/PF1GA3OnMxUFP
	q11owIbkKOyyHbjX7Pjfhco43vfdy8GORGZ30/QbrWeDDEKhhqR93QZGUCFOqHIL7/Knp7cXn6N
	DlofpTC0caC5Xz9dci7jFgTJuRKpYkVOd59lPASgL6uDiijP1TQD3sDnOii1zpNLjFbJKGpT2sg
	0DJiYevs5beWyPfyKQ+zDCZRQH6q/x
X-Received: by 2002:a05:620a:410c:b0:8cd:b2e9:7f6f with SMTP id af79cd13be357-8cfc7e9ac06mr548041285a.33.1774027951312;
        Fri, 20 Mar 2026 10:32:31 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90bab92sm197788685a.34.2026.03.20.10.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:32:30 -0700 (PDT)
Message-ID: <16c4272b4e98834b849a608b42d97376088b1e38.camel@ndufresne.ca>
Subject: Re: [PATCH v3 06/27] media: rockchip: rga: use clk_bulk api
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
Date: Fri, 20 Mar 2026 13:32:27 -0400
In-Reply-To: <20260127-spu-rga3-v3-6-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-6-77b273067beb@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-f4gZIQHtUJQiIuCqlS+k"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_103233_318532_D7AFD655 
X-CRM114-Status: GOOD (  19.26  )
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


--=-f4gZIQHtUJQiIuCqlS+k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Use the clk_bulk API to avoid code duplication for each of the three
> clocks.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 65 ++++----------------=
-----------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h |=C2=A0 6 +--
> =C2=A02 files changed, 11 insertions(+), 60 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 43f6a8d993811..338c7796490bc 100644
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
> @@ -771,23 +733,12 @@ static int rga_parse_dt(struct rockchip_rga *rga)
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
> +	ret =3D devm_clk_bulk_get_all(rga->dev, &rga->clks);
> +	if (ret < 0) {
> +		dev_err(rga->dev, "failed to get clocks\n");
> +		return ret;
> =C2=A0	}
> +	rga->num_clks =3D ret;
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -935,7 +886,7 @@ static int __maybe_unused rga_runtime_suspend(struct =
device *dev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =C2=A0
> -	rga_disable_clocks(rga);
> +	clk_bulk_disable_unprepare(rga->num_clks, rga->clks);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -944,7 +895,7 @@ static int __maybe_unused rga_runtime_resume(struct d=
evice *dev)
> =C2=A0{
> =C2=A0	struct rockchip_rga *rga =3D dev_get_drvdata(dev);
> =C2=A0
> -	return rga_enable_clocks(rga);
> +	return clk_bulk_prepare_enable(rga->num_clks, rga->clks);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct dev_pm_ops rga_pm =3D {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 72a28b120fabf..2db10acecb405 100644
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
> @@ -81,9 +82,8 @@ struct rockchip_rga {
> =C2=A0	struct device *dev;
> =C2=A0	struct regmap *grf;
> =C2=A0	void __iomem *regs;
> -	struct clk *sclk;
> -	struct clk *aclk;
> -	struct clk *hclk;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> =C2=A0	struct rockchip_rga_version version;
> =C2=A0
> =C2=A0	/* vfd lock */

--=-f4gZIQHtUJQiIuCqlS+k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2ErAAKCRDZQZRRKWBy
9GE9AQCgBUj875ITC+Fh9R3nimzg6ES5s9aFNWES+vnYmz1/SAEAvf9VeCAR7znW
NKKwZUUf9wwcdkI2fRNjY/aPz3jvRQA=
=DP+6
-----END PGP SIGNATURE-----

--=-f4gZIQHtUJQiIuCqlS+k--

