Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67ECFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 22:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7Qfm5r1jq12hZzcqmc0YcQyVun0DCNgd0NuHzqRQtU=; b=aLVUm9/AMSSR2EQ2C5EKzHDMXw
	9FDDZifjspbtQV14Cs1Q5WHVHvjhZy3VrmrNzQeHkY3gVoy10a1QE1hgC93qFtGGCSBXFCS3RjQZb
	GnMJDWf+v0XyymqQH81im/LuCvF/q0nc+6ih8pN9G/c1WJg2F3TR4pOJG1u+bAKW6SahKXuECvp9B
	3II7N+8B/u3kGmMGvXFYY96YIjegXN6pzkQtjUXo4citZCDLCuC7w2pJLTRurh/4vQgTLc+kn0pN/
	iUNf/O2kIGThbYfcw5krERtbR7YbDohl01BtjRZHrnonaHeEY/SeR2XUfvEBxTQZbqyB6LwZBOJJY
	tnCseXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3Lc-00000001gWA-15c0;
	Tue, 25 Feb 2025 22:24:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3K3-00000001g2P-30VA;
	Tue, 25 Feb 2025 22:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/7Qfm5r1jq12hZzcqmc0YcQyVun0DCNgd0NuHzqRQtU=; b=dif+GXen+YI/pNv93D8+O4d/sP
	YhVNcSTPfA1XF6pfaUTw1mbIGNLCHceicWknYH/ZCz1BotOsmJGvPHo1IV+v7rKResE//FAck9HlW
	+zljZjB0SBtg18MFbSa7+iPosNiL0RbMjX3JOBHc9Sjt/ouXttEIxGXzUjFMBqlD6USUCAgALP9eY
	cnt97DhfPaXAfGmJLTSTXB8O51MnM2O4+zp9+Nc25s7nlf9It7tga6dG1TWcPen6WGNivDKorJBDP
	xJkPrEFrZBF7fjZTQxO0nFWXH4ovmroKsfz7dtDfygxPCiaebcK0DZitP01KHB10cRU8E+XgIOdoE
	vpZOMJNg==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tn3Jy-0008Ll-D7; Tue, 25 Feb 2025 23:22:34 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: vkoul@kernel.org, kishon@kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, sebastian.reichel@collabora.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: Re: [PATCH 1/2] phy: rockchip: usbdp: move type-orientation-switch further
 down
Date: Tue, 25 Feb 2025 23:22:33 +0100
Message-ID: <2868016.XrmoMso0CX@diego>
In-Reply-To: <7a8e6b9f-2fa2-4794-bb4f-3abdb784fbc3@wanadoo.fr>
References: <20250225184519.3586926-1-heiko@sntech.de>
 <20250225184519.3586926-2-heiko@sntech.de>
 <7a8e6b9f-2fa2-4794-bb4f-3abdb784fbc3@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_142239_892800_CAE267AE 
X-CRM114-Status: GOOD (  23.46  )
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

Am Dienstag, 25. Februar 2025, 23:16:21 MEZ schrieb Christophe JAILLET:
> Le 25/02/2025 =C3=A0 19:45, Heiko Stuebner a =C3=A9crit :
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> >=20
> > Move the typec-orientation-switch functionality further down, next to
> > the typec-mux code. Not only brings this the typec-related functionality
> > closer together, but also the following change needs access to other
> > driver functions, that are below the current position.
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> > ---
> >   drivers/phy/rockchip/phy-rockchip-usbdp.c | 166 +++++++++++-----------
> >   1 file changed, 83 insertions(+), 83 deletions(-)
> >=20
> > diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/ro=
ckchip/phy-rockchip-usbdp.c
> > index 5b1e8a3806ed..7b17c82ebcfc 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> > @@ -616,89 +616,6 @@ static void rk_udphy_dp_hpd_event_trigger(struct r=
k_udphy *udphy, bool hpd)
> >   	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_tr=
igger, hpd);
> >   }
> >  =20
> > -static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
> > -{
> > -	if (udphy->flip) {
> > -		udphy->dp_lane_sel[0] =3D 0;
> > -		udphy->dp_lane_sel[1] =3D 1;
> > -		udphy->dp_lane_sel[2] =3D 3;
> > -		udphy->dp_lane_sel[3] =3D 2;
> > -		udphy->lane_mux_sel[0] =3D PHY_LANE_MUX_DP;
> > -		udphy->lane_mux_sel[1] =3D PHY_LANE_MUX_DP;
> > -		udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_USB;
> > -		udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_USB;
> > -		udphy->dp_aux_dout_sel =3D PHY_AUX_DP_DATA_POL_INVERT;
> > -		udphy->dp_aux_din_sel =3D PHY_AUX_DP_DATA_POL_INVERT;
> > -		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 1);
> > -		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> > -	} else {
> > -		udphy->dp_lane_sel[0] =3D 2;
> > -		udphy->dp_lane_sel[1] =3D 3;
> > -		udphy->dp_lane_sel[2] =3D 1;
> > -		udphy->dp_lane_sel[3] =3D 0;
> > -		udphy->lane_mux_sel[0] =3D PHY_LANE_MUX_USB;
> > -		udphy->lane_mux_sel[1] =3D PHY_LANE_MUX_USB;
> > -		udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_DP;
> > -		udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
> > -		udphy->dp_aux_dout_sel =3D PHY_AUX_DP_DATA_POL_NORMAL;
> > -		udphy->dp_aux_din_sel =3D PHY_AUX_DP_DATA_POL_NORMAL;
> > -		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> > -		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
> > -	}
> > -
> > -	udphy->mode =3D UDPHY_MODE_DP_USB;
> > -}
> > -
> > -static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> > -				 enum typec_orientation orien)
> > -{
> > -	struct rk_udphy *udphy =3D typec_switch_get_drvdata(sw);
> > -
> > -	mutex_lock(&udphy->mutex);
> > -
> > -	if (orien =3D=3D TYPEC_ORIENTATION_NONE) {
> > -		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> > -		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> > -		/* unattached */
> > -		rk_udphy_usb_bvalid_enable(udphy, false);
> > -		goto unlock_ret;
> > -	}
> > -
> > -	udphy->flip =3D (orien =3D=3D TYPEC_ORIENTATION_REVERSE) ? true : fal=
se;
> > -	rk_udphy_set_typec_default_mapping(udphy);
> > -	rk_udphy_usb_bvalid_enable(udphy, true);
> > -
> > -unlock_ret:
> > -	mutex_unlock(&udphy->mutex);
> > -	return 0;
> > -}
> > -
> > -static void rk_udphy_orien_switch_unregister(void *data)
> > -{
> > -	struct rk_udphy *udphy =3D data;
> > -
> > -	typec_switch_unregister(udphy->sw);
> > -}
> > -
> > -static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
> > -{
> > -	struct typec_switch_desc sw_desc =3D { };
> > -
> > -	sw_desc.drvdata =3D udphy;
> > -	sw_desc.fwnode =3D dev_fwnode(udphy->dev);
> > -	sw_desc.set =3D rk_udphy_orien_sw_set;
> > -
> > -	udphy->sw =3D typec_switch_register(udphy->dev, &sw_desc);
> > -	if (IS_ERR(udphy->sw)) {
> > -		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
> > -			PTR_ERR(udphy->sw));
> > -		return PTR_ERR(udphy->sw);
> > -	}
> > -
> > -	return devm_add_action_or_reset(udphy->dev,
> > -					rk_udphy_orien_switch_unregister, udphy);
> > -}
> > -
> >   static int rk_udphy_refclk_set(struct rk_udphy *udphy)
> >   {
> >   	unsigned long rate;
> > @@ -1323,6 +1240,89 @@ static const struct phy_ops rk_udphy_usb3_phy_op=
s =3D {
> >   	.owner		=3D THIS_MODULE,
> >   };
> >  =20
> > +static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
> > +{
> > +	if (udphy->flip) {
> > +		udphy->dp_lane_sel[0] =3D 0;
> > +		udphy->dp_lane_sel[1] =3D 1;
> > +		udphy->dp_lane_sel[2] =3D 3;
> > +		udphy->dp_lane_sel[3] =3D 2;
> > +		udphy->lane_mux_sel[0] =3D PHY_LANE_MUX_DP;
> > +		udphy->lane_mux_sel[1] =3D PHY_LANE_MUX_DP;
> > +		udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_USB;
> > +		udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_USB;
> > +		udphy->dp_aux_dout_sel =3D PHY_AUX_DP_DATA_POL_INVERT;
> > +		udphy->dp_aux_din_sel =3D PHY_AUX_DP_DATA_POL_INVERT;
> > +		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 1);
> > +		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> > +	} else {
> > +		udphy->dp_lane_sel[0] =3D 2;
> > +		udphy->dp_lane_sel[1] =3D 3;
> > +		udphy->dp_lane_sel[2] =3D 1;
> > +		udphy->dp_lane_sel[3] =3D 0;
> > +		udphy->lane_mux_sel[0] =3D PHY_LANE_MUX_USB;
> > +		udphy->lane_mux_sel[1] =3D PHY_LANE_MUX_USB;
> > +		udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_DP;
> > +		udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
> > +		udphy->dp_aux_dout_sel =3D PHY_AUX_DP_DATA_POL_NORMAL;
> > +		udphy->dp_aux_din_sel =3D PHY_AUX_DP_DATA_POL_NORMAL;
> > +		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> > +		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
> > +	}
> > +
> > +	udphy->mode =3D UDPHY_MODE_DP_USB;
> > +}
> > +
> > +static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> > +				 enum typec_orientation orien)
> > +{
> > +	struct rk_udphy *udphy =3D typec_switch_get_drvdata(sw);
> > +
> > +	mutex_lock(&udphy->mutex);
> > +
> > +	if (orien =3D=3D TYPEC_ORIENTATION_NONE) {
> > +		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> > +		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> > +		/* unattached */
> > +		rk_udphy_usb_bvalid_enable(udphy, false);
> > +		goto unlock_ret;
> > +	}
> > +
> > +	udphy->flip =3D (orien =3D=3D TYPEC_ORIENTATION_REVERSE) ? true : fal=
se;
> > +	rk_udphy_set_typec_default_mapping(udphy);
> > +	rk_udphy_usb_bvalid_enable(udphy, true);
> > +
> > +unlock_ret:
> > +	mutex_unlock(&udphy->mutex);
> > +	return ret;
>=20
> This will break built.
>=20
> It was return 0 preivously.
> This change should be aprt of 2/2 where "int ret;" is introduced.

Thanks for noticing that mishap, will fix that in v2.

Heiko



