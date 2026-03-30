Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A1D1061B15
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 16:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eIVlMOLfUTIXhO4sr51C8ur+IibSbxiOjG5R1nKRWVU=; b=4NQ70BVh3EI/ctPe7g4hGJh5WX
	ZbQUujinbagkLcZWEoFX5s0+p787R+rh1GeEELdPyCbtVsvxy6RWJKXluHrKaQtQOsaa9W3ZRDe/0
	n8qj5u+YhxeaDu15zHsrwP0SpketwxgzmkzPbVjOOyenlz+tHgR69ek85pS5gmafeKgqubdHne4eh
	qZZgd2oTgkkwqO0puXZWypmf7+OOWkrUCfVv8lPgu6PsOZdeDerucHwI7mhpd5zGbbQOq0hjf7+pJ
	j1VqYK8dGBtKsDHWXsjuW73jHnqOuqj6ZqqFfiaf0K6OhEpLe+8CtAXhhOwvbbjq+nlgvjxIt0ofZ
	n54qXTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Fv2-0000000Bfd4-2Ja6;
	Mon, 30 Mar 2026 16:56:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Fuz-0000000Bfcd-1OZ1;
	Mon, 30 Mar 2026 16:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=eIVlMOLfUTIXhO4sr51C8ur+IibSbxiOjG5R1nKRWVU=; b=pua4SOdsREReib0okvpC6/J0jl
	hB/BBcaYva5wUZXTqHds6KCWMBEh5CmBeLRFqD9rIvms3Osox1qNEuqpCytBPwWwvOq9039VOriMw
	p5mmXmKbONgkXkD4Jb03gQXVUIshLmFczO27ODU64cQXfnFY0PrFtcKwoUVKzqBGDAPC4WOFvW2JH
	bMQ3H9UPdYHJaTAj6x5LpYgjRYIaXAJNQZ+VT5c/A8/vNNNIdMyd9I4d/ROTk4CryoNuOpwugync1
	+YG1XHWPizHf5ny4qTvYI6TyqMlDsq2aQMUEQSNQi+np5ueBcKVkNTxZwF7YK8/TFJoAgQg1wZSHn
	KXMTE9oQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH RESEND v4 4/4] drm/rockchip: dw_hdmi_qp: Do not send HPD events
 for all connectors
Date: Mon, 30 Mar 2026 18:56:15 +0200
Message-ID: <47972235.fMDQidcC6G@phil>
In-Reply-To: <20260323-dw-hdmi-qp-scramb-v4-4-1d99df84883e@collabora.com>
References: <20260323-dw-hdmi-qp-scramb-v4-0-1d99df84883e@collabora.com>
 <20260323-dw-hdmi-qp-scramb-v4-4-1d99df84883e@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_095649_411759_DDBF736B 
X-CRM114-Status: GOOD (  22.33  )
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

Am Montag, 23. M=C3=A4rz 2026, 18:45:30 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Cristian Ciocaltea:
> In order to optimize the HPD event handling and run the detect cycle on
> the affected connector only, make use of
> drm_connector_helper_hpd_irq_event() instead of
> drm_helper_hpd_irq_event().
>=20
> Additionally, move devm_request_threaded_irq() after bridge connector
> initialization.

nit: Using "and", "additionally", etc in commit messages, is a strong
indicator, things should be separate commits.

Especially as the sentence above just explains the "what" but not the
why (interrupt firing, before the device is actually there probably).

If there are no other changes requested, they can stay together though,
the "why" is somewhat obvious here.


Both changes themself look fine, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Tested-by: Maud Spierings <maud_spierings@hotmail.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 44 ++++++++++++--------=
=2D-----
>  1 file changed, 20 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 1a09bcc96c3e..65dfaee15178 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -92,6 +92,7 @@ struct rockchip_hdmi_qp {
>  	struct regmap *regmap;
>  	struct regmap *vo_regmap;
>  	struct rockchip_encoder encoder;
> +	struct drm_connector *connector;
>  	struct dw_hdmi_qp *hdmi;
>  	struct phy *phy;
>  	struct gpio_desc *frl_enable_gpio;
> @@ -251,14 +252,10 @@ static void dw_hdmi_qp_rk3588_hpd_work(struct work_=
struct *work)
>  	struct rockchip_hdmi_qp *hdmi =3D container_of(work,
>  						     struct rockchip_hdmi_qp,
>  						     hpd_work.work);
> -	struct drm_device *drm =3D hdmi->encoder.encoder.dev;
> -	bool changed;
> +	bool changed =3D drm_connector_helper_hpd_irq_event(hdmi->connector);
> =20
> -	if (drm) {
> -		changed =3D drm_helper_hpd_irq_event(drm);
> -		if (changed)
> -			dev_dbg(hdmi->dev, "connector status changed\n");
> -	}
> +	if (changed)
> +		dev_dbg(hdmi->dev, "connector status changed\n");
>  }
> =20
>  static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
> @@ -466,13 +463,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>  	struct dw_hdmi_qp_plat_data plat_data =3D {};
>  	const struct rockchip_hdmi_qp_cfg *cfg;
>  	struct drm_device *drm =3D data;
> -	struct drm_connector *connector;
>  	struct drm_encoder *encoder;
>  	struct rockchip_hdmi_qp *hdmi;
>  	struct resource *res;
>  	struct clk_bulk_data *clks;
>  	struct clk *ref_clk;
> -	int ret, irq, i;
> +	int ret, hpd_irq, i;
> =20
>  	if (!pdev->dev.of_node)
>  		return -ENODEV;
> @@ -573,17 +569,9 @@ static int dw_hdmi_qp_rockchip_bind(struct device *d=
ev, struct device *master,
>  	if (plat_data.cec_irq < 0)
>  		return plat_data.cec_irq;
> =20
> -	irq =3D platform_get_irq_byname(pdev, "hpd");
> -	if (irq < 0)
> -		return irq;
> -
> -	ret =3D devm_request_threaded_irq(hdmi->dev, irq,
> -					cfg->ctrl_ops->hardirq_callback,
> -					cfg->ctrl_ops->irq_callback,
> -					IRQF_SHARED, "dw-hdmi-qp-hpd",
> -					hdmi);
> -	if (ret)
> -		return ret;
> +	hpd_irq =3D platform_get_irq_byname(pdev, "hpd");
> +	if (hpd_irq < 0)
> +		return hpd_irq;
> =20
>  	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_fun=
cs);
>  	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> @@ -597,12 +585,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device *=
dev, struct device *master,
>  				     "Failed to bind dw-hdmi-qp");
>  	}
> =20
> -	connector =3D drm_bridge_connector_init(drm, encoder);
> -	if (IS_ERR(connector))
> -		return dev_err_probe(hdmi->dev, PTR_ERR(connector),
> +	hdmi->connector =3D drm_bridge_connector_init(drm, encoder);
> +	if (IS_ERR(hdmi->connector))
> +		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->connector),
>  				     "Failed to init bridge connector\n");
> =20
> -	return drm_connector_attach_encoder(connector, encoder);
> +	ret =3D drm_connector_attach_encoder(hdmi->connector, encoder);
> +	if (ret)
> +		return ret;
> +
> +	return devm_request_threaded_irq(hdmi->dev, hpd_irq,
> +					 cfg->ctrl_ops->hardirq_callback,
> +					 cfg->ctrl_ops->irq_callback,
> +					 IRQF_SHARED, "dw-hdmi-qp-hpd",
> +					 hdmi);
>  }
> =20
>  static void dw_hdmi_qp_rockchip_unbind(struct device *dev,
>=20
>=20





