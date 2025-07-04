Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3298C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpqvI8aigKp1KLyHhO2hfOZECoifhbc86pqy6YCw2lQ=; b=m8Ihu8GVlnc/Vj/yzEX7uMOlU5
	tuvROyea8Xhzx+WF/msdhj+KO9JyZoKE36kBBtKoEW8XU4I97JQmJqm97Jd5/8iV6MBAXlItHACnN
	VP5wPvtnVHkFZG2X4JbaS0oh0Inhi4Rf3l8iUtmtEUc1NbVd/LAkT4pfxzZV+4/zKmXDL7CYQpV3l
	JmLI6trcLrmyStDEuhT5KwCHRFOwrHEdUwfT72+SV6aFIpps4A8rtlYHctrecVGydu0obIeLrHCIK
	zwvs3x9nEaWD9UPeaJ7NjA+jenY2n2PVpZ7TV13v7ssJ/qAeDGPOpnYYx0isq6xVU76hdQjrW7N9D
	PoBBm0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhox-0000000EjXZ-0eV0;
	Fri, 04 Jul 2025 14:55:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhYf-0000000Egxk-2d5R;
	Fri, 04 Jul 2025 14:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LpqvI8aigKp1KLyHhO2hfOZECoifhbc86pqy6YCw2lQ=; b=2lfwxlto3SF5a3d7vDXVd1azEr
	+93Z5oQ4/69wdHjHFNUj1jBQrzMaWIdTVOx4TS1MT1G2z/iAviRg0XeaT56eDc+ap85tpgn98obyG
	reR+utLFCUeDMht4w7WyoSqLnZ0Ug9ZzDSHplMF/WwedHZMVWhDJk+ct3NRkFBv8VIowlze1/H588
	ZS65o9feEqQ1hzjqI/1NHCtQ2sg5iwcapWHMb+Rnf4pSf8PGD3n7MPFe3M98zvR69mIZ+dj0IZs/M
	wLvbRzeTwvt0bA42B+rUM3SXJtNloppdwgw+1in2J5IOwzgi4CSTQupuuVXVK9uRIBArsCM16udSu
	8MBqpjQw==;
Received: from i53875b79.versanet.de ([83.135.91.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uXhY2-0006HW-Qj; Fri, 04 Jul 2025 16:37:54 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in
 dw_hdmi_qp_plat_data
Date: Fri, 04 Jul 2025 16:37:53 +0200
Message-ID: <13504186.5MRjnR8RnV@diego>
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-1-2bd8de8700cd@collabora.com>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-1-2bd8de8700cd@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_073833_689920_7C73043F 
X-CRM114-Status: GOOD (  18.07  )
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

Hi Cristian,

Am Freitag, 4. Juli 2025, 16:23:22 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Cristian Ciocaltea:
> In preparation to support the CEC interface of the DesignWare HDMI QP IP
> block, extend the platform data to provide the required IRQ number.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
>  include/drm/bridge/dw_hdmi_qp.h                | 1 +
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu=
/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 7d531b6f4c098c6c548788dad487ce4613a2f32b..126e556025961e8645f3567b4=
d7a1c73cc2f2e7f 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -539,6 +539,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *d=
ev, struct device *master,
>  	if (plat_data.main_irq < 0)
>  		return plat_data.main_irq;
> =20
> +	plat_data.cec_irq =3D platform_get_irq_byname(pdev, "cec");
> +	if (plat_data.cec_irq < 0)
> +		return plat_data.cec_irq;
> +
>  	irq =3D platform_get_irq_byname(pdev, "hpd");
>  	if (irq < 0)
>  		return irq;
> diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi=
_qp.h
> index e9be6d507ad9cdc55f5c7d6d3ef37eba41f1ce74..b4a9b739734ec7b67013b683f=
e6017551aa19172 100644
> --- a/include/drm/bridge/dw_hdmi_qp.h
> +++ b/include/drm/bridge/dw_hdmi_qp.h
> @@ -23,6 +23,7 @@ struct dw_hdmi_qp_plat_data {
>  	const struct dw_hdmi_qp_phy_ops *phy_ops;
>  	void *phy_data;
>  	int main_irq;
> +	int cec_irq;
>  };

from a structure point-of-view, I'd expect the series to be something like:

(1) drm/bridge: dw-hdmi-qp: Add CEC support
    -> including adding the cec_irq to dw_hdmi_qp_plat_data
(2) drm/bridge: dw-hdmi-qp: Fixup timer base setup
    -> including adding the ref_clk_rate to dw_hdmi_qp_plat_data
(3) drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
(4) drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
(5) arm64: defconfig: Enable DW HDMI QP CEC support

The patches adding the generic functionality to the bridge should also
include the needed elements and not depend on platform-specific patches.


Heiko



