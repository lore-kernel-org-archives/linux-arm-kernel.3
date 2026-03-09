Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B33EFCD6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNiLR6YNrMRtTldTWTQRiLTdnMm5k8O8M4DvpvHP74I=; b=sGUtg6Qmolj1UJW4XBc+8rpzJ0
	//zsXbZJkzDTEFRWF4vr4j8Ne8mSojpPwcOdLhR4VxDYn5ssMeeHs85LlANU/TDWNQYo0AvCPsmJy
	fLmCDojamvP/FMKzjudkgD6YPk7VLjnoFk/ABmDu45++eT01nudjBuW17ZaarOL6wCxwOtz74iq6k
	dSfLc9P0DqKMHiOvEuUq2p1yXMsKCqwH26mkXcyvmKhfhxUHzCzKWgmD+FOcuo+k7UwCzT4yC2SPF
	c30X47LTbQlIIpyRm4grAkqLWzZiIB3WXYHFoVd5ZQxbT3C4hSDz+TpThQwSy9GbW47+hnmnGuvWz
	+ro1HnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWlX-00000006xE4-1fY9;
	Mon, 09 Mar 2026 09:19:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWlS-00000006xB0-16K3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:19:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so4924160f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773047940; x=1773652740; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kNiLR6YNrMRtTldTWTQRiLTdnMm5k8O8M4DvpvHP74I=;
        b=OeoimyfhGyCEPhz/f/T7GVP0+x0lQSO2xUcbi6R6/S+cgxqAKAYmRmFRcyyGDWgqmy
         GO5kJlGrsHfj3Rumw9tulmFf9Jokd5J8wqLOVZWc9yeR9fsco7LDSURBb47RlzDyhDg1
         GNEZOItDyE0UPKPlYvGSc2oN2Ija96UwF0qGV1e8zP667X0uaijeeZy9yTs2ph6XtePA
         7+I4WzXE+lfk0Bp+SzHnztkEM8doWI7hMSTWNlfeBqE+xn81McqTBAMHDhPUQFBaNgPk
         GY3oCU/CVSmdgFuuofYXyhKgSGjTwe6wYXN3oeIu/TLnVinODE456hffHmtyCWq3X1lb
         Zeqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773047940; x=1773652740;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNiLR6YNrMRtTldTWTQRiLTdnMm5k8O8M4DvpvHP74I=;
        b=uZ5tK+68SLU7sHkA8gxwJbCyzul97uBCmCMQYRpsXgAOpGMPPUCW4h/Z3F5Ng/JSHv
         1yFsF+5xj615+dmqVnbvQ8oAqHjS+N/4H1oQZNl0kCiP7YwZ+wnIQTnUFSSSyxAIfHiO
         qfDJdcdnbsLrFz0dwtDapOlzOjHRGwYP/+K43F7z1s+V3VmIniLp/mIuftHo9ZXo0fb6
         T6pvFnJokJgCxLuKlxQ0/wiAZanRp8qnjGURuYNPblfoJZD80OPBrN6s8fW+aPxGChoO
         Urpvx//fg9UHrQuK7WyBMN0BFIpjMqwjdRbxFLctD6tOzTPvPRXRB1UFwNfKv9c0HzYQ
         ZYCA==
X-Forwarded-Encrypted: i=1; AJvYcCWkpY9weGdo2xEIyIEevDEuLiR87UkYmGAjDiLINffLUMcSxXsKKJaMRPfxvYY1502R43xsX8/SjYz52HbPrIKt@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ7knn0U+/IG/62M4OEfXbFSaUJgHFGe2UHCTkTg9JiKCjFo4q
	vAIbKLC5CmhFN2HysN4cCcZbDgh85BFkRcyYi7DSxwWApBqKTeK7RhbWaz/qCfbCNPE=
X-Gm-Gg: ATEYQzzEJzAyMLMrRAS8/LbAb3NQ/sxxKriRH3JHVLbpCCQhsQhsT/ThgwJ/z6wpm7k
	1PIHQ6p6F3PiVP82eauDZZICn2KvKHQ1yv9XJLfizKwLTA8UJSxEo0L6KnihnTY5n7/CiBoDsPS
	lTvFXMprA+z59jJjKKtEthXbTwnYJS2qWXPdVFAmxw2G9p7zk1CIDPHkO2MtNbE3diMMxvhn4KQ
	AEQVd47dzTHn9s8F6Dd+eu4YGyXWfG+uoYl6AiH8+TPhgP5k1F2ykeUU6Zy2XCbSOfEq5UfhZbT
	MQsMI3FWFCIanuqZZ1Lazs9y2CW3ZIt71T/dicJjNBO7lkHF3GE9dy+qWvJUOT8MmoqlyVIr6f3
	leUjicBG/jKQ0z4YzmCBAUNqZfCIARext4N/wepez5QMTQv6j5yu2088m0ns5ULv8L1ABdpJD2B
	uRJh4y0XmSLW1WXO8=
X-Received: by 2002:a05:6000:603:b0:439:909f:c5a3 with SMTP id ffacd0b85a97d-439da3277d9mr17145973f8f.4.1773047939930;
        Mon, 09 Mar 2026 02:18:59 -0700 (PDT)
Received: from localhost ([195.52.25.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm23029936f8f.14.2026.03.09.02.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:18:59 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=840703edd9f3f1e1e79a02bb78a8d4f69f696b0531524c2c45c8075436e0;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Mar 2026 10:18:50 +0100
Message-Id: <DGY51AQLSNAD.3LE77TJER4LGF@baylibre.com>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-can@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-ide@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-sunxi@lists.linux.dev>,
 <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <netdev@vger.kernel.org>, <spacemit@lists.linux.dev>,
 <UNGLinuxDriver@microchip.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Marc Kleine-Budde" <mkl@pengutronix.de>,
 "Vincent Mailhol" <mailhol@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Markus Schneider-Pargmann" <msp@baylibre.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>, "Magnus Damm"
 <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 phy-next 14/24] phy: introduce
 phy_get_max_link_rate() helper for consumers
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: <vladimir.oltean@nxp.com>, <linux-phy@lists.infradead.org>
X-Mailer: aerc 0.21.0
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
 <20260308114009.2546587-15-vladimir.oltean@nxp.com>
In-Reply-To: <20260308114009.2546587-15-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_021902_545294_9DA7DC44 
X-CRM114-Status: GOOD (  28.38  )
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

--840703edd9f3f1e1e79a02bb78a8d4f69f696b0531524c2c45c8075436e0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sun Mar 8, 2026 at 12:39 PM CET, vladimir.oltean wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get=
()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.

Thanks for adding this.

>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Vincent Mailhol <mailhol@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Cc: Markus Schneider-Pargmann <msp@baylibre.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Magnus Damm <magnus.damm@gmail.com>
>
> v1->v2: make phy_get_bus_width() NULL-tolerant to simplify CAN callers
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 4 ++--
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c             | 2 +-
>  drivers/net/can/at91_can.c                          | 3 +--
>  drivers/net/can/flexcan/flexcan-core.c              | 3 +--
>  drivers/net/can/m_can/m_can_platform.c              | 3 +--

For m_can:
Acked-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best
Markus

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--
>  drivers/phy/phy-core.c                              | 9 +++++++++
>  include/linux/phy/phy.h                             | 6 ++++++
>  8 files changed, 22 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index a8b6ae58cb0a..ed7ed82ddb64 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1300,7 +1300,7 @@ static u32 cdns_mhdp_get_training_interval_us(struc=
t cdns_mhdp_device *mhdp,
> =20
>  static void cdns_mhdp_fill_host_caps(struct cdns_mhdp_device *mhdp)
>  {
> -	unsigned int link_rate;
> +	u32 link_rate;
> =20
>  	/* Get source capabilities based on PHY attributes */
> =20
> @@ -1308,7 +1308,7 @@ static void cdns_mhdp_fill_host_caps(struct cdns_mh=
dp_device *mhdp)
>  	if (!mhdp->host.lanes_cnt)
>  		mhdp->host.lanes_cnt =3D 4;
> =20
> -	link_rate =3D mhdp->phy->attrs.max_link_rate;
> +	link_rate =3D phy_get_max_link_rate(mhdp->phy);
>  	if (!link_rate)
>  		link_rate =3D drm_dp_bw_code_to_link_rate(DP_LINK_BW_8_1);
>  	else
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 4ab6922dd79c..79c72ee8e263 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> @@ -536,7 +536,7 @@ static int dw_dp_link_parse(struct dw_dp *dp, struct =
drm_connector *connector)
> =20
>  	link->revision =3D link->dpcd[DP_DPCD_REV];
>  	link->rate =3D min_t(u32, min(dp->plat_data.max_link_rate,
> -				    dp->phy->attrs.max_link_rate * 100),
> +				    phy_get_max_link_rate(dp->phy) * 100),
>  			   drm_dp_max_link_rate(link->dpcd));
>  	link->lanes =3D min_t(u8, phy_get_bus_width(dp->phy),
>  			    drm_dp_max_lane_count(link->dpcd));
> diff --git a/drivers/net/can/at91_can.c b/drivers/net/can/at91_can.c
> index 58da323f14d7..7749da0a58f6 100644
> --- a/drivers/net/can/at91_can.c
> +++ b/drivers/net/can/at91_can.c
> @@ -1125,8 +1125,7 @@ static int at91_can_probe(struct platform_device *p=
dev)
> =20
>  	can_rx_offload_add_timestamp(dev, &priv->offload);
> =20
> -	if (transceiver)
> -		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +	priv->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
> =20
>  	if (at91_is_sam9263(priv))
>  		dev->sysfs_groups[0] =3D &at91_sysfs_attr_group;
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f5d22c61503f..093e48b8da58 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -2210,8 +2210,7 @@ static int flexcan_probe(struct platform_device *pd=
ev)
>  	priv->reg_xceiver =3D reg_xceiver;
>  	priv->transceiver =3D transceiver;
> =20
> -	if (transceiver)
> -		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +	priv->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
> =20
>  	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
>  		priv->irq_boff =3D platform_get_irq(pdev, 1);
> diff --git a/drivers/net/can/m_can/m_can_platform.c b/drivers/net/can/m_c=
an/m_can_platform.c
> index 56da411878af..2a0f163a683a 100644
> --- a/drivers/net/can/m_can/m_can_platform.c
> +++ b/drivers/net/can/m_can/m_can_platform.c
> @@ -131,8 +131,7 @@ static int m_can_plat_probe(struct platform_device *p=
dev)
>  		goto probe_fail;
>  	}
> =20
> -	if (transceiver)
> -		mcan_class->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +	mcan_class->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
> =20
>  	priv->base =3D addr;
>  	priv->mram_base =3D mram_addr;
> diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rca=
r_canfd.c
> index eaf8cac78038..9062db48d477 100644
> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -1884,8 +1884,7 @@ static int rcar_canfd_channel_probe(struct rcar_can=
fd_global *gpriv, u32 ch,
>  	priv->transceiver =3D transceiver;
>  	priv->channel =3D ch;
>  	priv->gpriv =3D gpriv;
> -	if (transceiver)
> -		priv->can.bitrate_max =3D transceiver->attrs.max_link_rate;
> +	priv->can.bitrate_max =3D phy_get_max_link_rate(transceiver);
>  	priv->can.clock.freq =3D fcan_freq;
>  	dev_info(dev, "can_clk rate is %u\n", priv->can.clock.freq);
> =20
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 0d0be494cfd7..737a760d97d1 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -647,6 +647,15 @@ void phy_set_bus_width(struct phy *phy, int bus_widt=
h)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
> =20
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +	if (!phy)
> +		return 0;
> +
> +	return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);
> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index a7e2432ca1ae..34b656084caf 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);
>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string=
)
>  {
> @@ -256,6 +257,11 @@ static inline int phy_get_bus_width(struct phy *phy)
>  static inline void phy_set_bus_width(struct phy *phy, int bus_width)
>  {
>  }
> +
> +static inline u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +	return 0;
> +}
>  #endif /* IS_ENABLED(CONFIG_GENERIC_PHY) */
> =20
>  #endif /* __PHY_CONSUMER_H */


--840703edd9f3f1e1e79a02bb78a8d4f69f696b0531524c2c45c8075436e0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaa6QehsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlO3
cwEAzFZFZ21Yi1E3bmSFVrYlzos6oRC2RIJXE4meDDVCTjUA/2INMu045NS1yRGm
V6PI/m62S0rUjMso1TupNVful6QE
=gdIq
-----END PGP SIGNATURE-----

--840703edd9f3f1e1e79a02bb78a8d4f69f696b0531524c2c45c8075436e0--

