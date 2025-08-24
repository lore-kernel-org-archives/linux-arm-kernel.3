Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59431CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 06:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mupk3r2Lw9myiPKOhZiMD7z8z8WBSkZnpSNn80gsJsU=; b=Xz6fMX9SuDtHOVJMVFY5evc6kh
	qQDNyosepEIRqUSp7elOjSBeJWC9n0GDvecLoE/JupKnFD6TCsEZ0YLgd8md+e6vMzY9Y+sb9jYv7
	LtHLt6xQ1CLjbvOkLclJEkfGDv3awtRvghfVBSysywfxdWXDM6EKg3GP0ZaHp+5qTCH95cKfrMQ8+
	bhsdbr5ZpHkvdW74r49JMHRqNj8d4bfzYqZbuirT/vqebERddlbxAROKUsNeQO10SmLAGeBE3HiR3
	WUOraEyQ2JL64PaDeUyRZpQzF1VfW9OydYFOmi9k3ALjbAgYBMrf0lcq9D7udi16X4Km8p65aONwX
	D8RRzh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq3wx-00000005kx0-1172;
	Sun, 24 Aug 2025 06:11:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq3uJ-00000005kpo-2or7;
	Sun, 24 Aug 2025 06:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Mupk3r2Lw9myiPKOhZiMD7z8z8WBSkZnpSNn80gsJsU=; b=SnvMnWFlWedvFlVdM3jJtWJvvp
	xQvs0SfuvsN5dN1g6ELZeTWjhkw+gfxSzltwvoPW3LkvJ/8x4HqN6cOeKyZ6C+qIBVMMIvdqR2geL
	BI1q50N9DBiJXvsR3PjCSDO6Y2GcllQVwP1NS0IrbWI1/FDnkCinYe3YTUg+imOZ/kilPjjTXVdl5
	Z073+7BEfhkKi4frUPOWRLK+MvWEmqBJeWqFXg8HKxFeU6rXxVgSRkC+mYCMc2XW/whK1hvMz3FOm
	u4/HslXR2RYSXmkx9CZEnW/NeyeQhISe8gqh2FZWKFRACJ7isb0KD8wnFra8a2cDJ6haF1JsI8RL4
	OA8Y681Q==;
Received: from [212.111.254.164] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uq3tt-0003EY-IB; Sun, 24 Aug 2025 08:08:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andy.yan@rock-chips.com, hjc@rock-chips.com,
 Damon Ding <damon.ding@rock-chips.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v1] drm/rockchip: analogix_dp: Apply devm_clk_get_optional() for
 &rockchip_dp_device.grfclk
Date: Sun, 24 Aug 2025 08:08:19 +0200
Message-ID: <7656195.LvFx2qVVIh@phil>
In-Reply-To: <20250824031932.3204920-1-damon.ding@rock-chips.com>
References: <20250824031932.3204920-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_230847_734093_19751070 
X-CRM114-Status: GOOD (  17.10  )
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

Hi Damon,

Am Sonntag, 24. August 2025, 05:19:32 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Damon Ding:
> The "grf" clock is optional for Rockchip eDP controller(RK3399 needs
> while RK3288 and RK3588 do not).
>=20
> It can make the code more consice to use devm_clk_get_optional()
> instead of devm_clk_get() with extra checks.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index d30f0983a53a..d0f78ab9faa6 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -335,12 +335,8 @@ static int rockchip_dp_of_probe(struct rockchip_dp_d=
evice *dp)
>  		return PTR_ERR(dp->grf);
>  	}
> =20
> -	dp->grfclk =3D devm_clk_get(dev, "grf");
> -	if (PTR_ERR(dp->grfclk) =3D=3D -ENOENT) {
> -		dp->grfclk =3D NULL;
> -	} else if (PTR_ERR(dp->grfclk) =3D=3D -EPROBE_DEFER) {
> -		return -EPROBE_DEFER;
> -	} else if (IS_ERR(dp->grfclk)) {
> +	dp->grfclk =3D devm_clk_get_optional(dev, "grf");
> +	if (IS_ERR(dp->grfclk)) {
>  		DRM_DEV_ERROR(dev, "failed to get grf clock\n");
>  		return PTR_ERR(dp->grfclk);

generall I definitly I agree, but you're loosing the
"don't print anything for EPROBE_DEFER" handling.

Additionally DRM_DEV_ERROR says in the code
"this is deprecated in favor of drm_err() or dev_err()." .

Also this in the probe-path, so to catch both issues, I'd sugest
using dev_err_probe() for the message, which handles EPROBE_DEFER
automatically.

Heiko



