Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1F3C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHZFdSSzEiuF7lehEB6m8VbOMkuSLfFX5QUFV4y4OvU=; b=zzScNJSsccYlVul1SWSpzjMqI9
	mPrTUO93cMIfWkQPfM9uPn2l7F7qUfIShFpxMzNseB7XqZ6JbXgaSjjgMq0SJ+CSj/Ltso/hUa5Rt
	2RxfnhWvB1rabadC4vFF5OytyV7Hx8nwZEgRPc/GskxXGHvS0ZBGUNpACwRhAm+NLcyoeFT1haBDA
	lA1bNdeGLnRcwBX/ZJNCe2sEzTR4n+snUPePtb4RPFupxa2N0P+CTxdU/9LI5P9DWqnl5XyFcr6Cz
	xFb44vt2Djwigl3DNuTFd/5hiFLsCRr+tMnBF8W65iMxZy3BlysXinVsb2miGFjCDSpzoMRrdIdoA
	xJYgVh1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi7m-0000000En85-31Lu;
	Fri, 04 Jul 2025 15:14:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi0y-0000000EldY-3eYQ;
	Fri, 04 Jul 2025 15:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rHZFdSSzEiuF7lehEB6m8VbOMkuSLfFX5QUFV4y4OvU=; b=QwOyQ8KtbBVWK3GnwzXU2PT/s9
	DU0e3ZMNAQM5b+Nfi9/nEtLWMmIY3UgYr4aYjkK8g2c4ge+uxUipFV77P/NBFDrQi2f00EE7e3vfh
	Dfhlz5zTn9Wg4c0IzPGlg4l1hWz+YtWP5HYBagBoQLS19qcSR+liOoz03JjuP/GVWdp9KHMwuN/4u
	RRDiF85xuUVqrfs5Iyc0LkSZoicp9PNoO1oxonahC3tKiFzI5hmnnlGtATgNguJWylHHF+DAwwpwY
	g5zdNkRYwKQheQkjCZuL9yBhMyVhl/oMYrrLlZ3CDEKYlLK7qLJYodFYtP88m8RXkYUbnBAlC7xl/
	LgwipyuQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi0v-000000081B8-3OdK;
	Fri, 04 Jul 2025 15:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6D046A53C59;
	Fri,  4 Jul 2025 15:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF17AC4CEE3;
	Fri,  4 Jul 2025 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751641661;
	bh=xY/yriO6tBXfy5srN553QPb2aXYA16dzeg1QniS6sGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S3C1949LJUYLkuDiWGT3TQF97d10CRTILMNnFMrDU8BasTdu+D1z7NslqV7Mwnt3B
	 tWZRqRWBjDuwqGAR3WJ2iR8T4mAsTVoNSRZJjD4iKOCdC6rZFfZ/PlFoOAn4BShq3S
	 lwXdMu4kaA+UXlgPSnpAnObWhmg5qWwIu5gtbggwCK5b7l8vf//Mez1ov5ym16rWKv
	 BPagAflTusNu+6uh+4hlgIIyrTvaA6aVFEy0aplzhe1zC4p6QDqNyqB/BCFigTxdzH
	 RBY3HIKxJhdpcRNbX8zhCy3JDBoRkyxXONeZohARzWT/qAe2dfU6DW58jbHLS7sg29
	 QUVPtYv+5JXDg==
Date: Fri, 4 Jul 2025 17:07:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in
 dw_hdmi_qp_plat_data
Message-ID: <20250704-granite-piculet-of-elevation-f01e08@houat>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-3-2bd8de8700cd@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="oszopqzjak6ldkji"
Content-Disposition: inline
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-3-2bd8de8700cd@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_160746_098148_FE8B120C 
X-CRM114-Status: GOOD (  21.64  )
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


--oszopqzjak6ldkji
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in
 dw_hdmi_qp_plat_data
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 05:23:24PM +0300, Cristian Ciocaltea wrote:
> In order to support correct initialization of the timer base in the HDMI
> QP IP block, extend the platform data to provide the necessary reference
> clock rate.
>=20
> While at it, ensure plat_data is zero-initialized in
> dw_hdmi_qp_rockchip_bind().
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 ++++++++++++-
>  include/drm/bridge/dw_hdmi_qp.h                |  1 +
>  2 files changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 126e556025961e8645f3567b4d7a1c73cc2f2e7f..8c1185490009c5f1bc658998a=
868f8b18dc479a3 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -431,8 +431,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *de=
v, struct device *master,
>  				    void *data)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct dw_hdmi_qp_plat_data plat_data =3D {};
>  	const struct rockchip_hdmi_qp_cfg *cfg;
> -	struct dw_hdmi_qp_plat_data plat_data;
>  	struct drm_device *drm =3D data;
>  	struct drm_connector *connector;
>  	struct drm_encoder *encoder;
> @@ -515,6 +515,17 @@ static int dw_hdmi_qp_rockchip_bind(struct device *d=
ev, struct device *master,
>  		return ret;
>  	}
> =20
> +	for (i =3D 0; i < ret; i++) {
> +		if (!strcmp(clks[i].id, "ref")) {
> +			plat_data.ref_clk_rate =3D clk_get_rate(clks[i].clk);
> +			break;
> +		}
> +	}
> +	if (!plat_data.ref_clk_rate) {
> +		dev_err(hdmi->dev, "Missing ref clock\n");
> +		return -EINVAL;
> +	}
> +

You'd be better off not using clk_bulk, or calling an additional clk_get
for the ref clock only.

Maxime

--oszopqzjak6ldkji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaGfuNQAKCRAnX84Zoj2+
dpLOAX9Fn+AyL0zuC8EJRGUMhLDwcaUmA/NnkN/yj+RvnyGSEiCcN475EqSfs8Ar
XN9rlt8BgIP56Bw6kg86quaBe4oPgxNoKon98/DCRRHYCKPCWZeNss8Bcb7pDsas
Q/Kd1zxghA==
=fwlI
-----END PGP SIGNATURE-----

--oszopqzjak6ldkji--

