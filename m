Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539A0E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 17:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u003TtXLqRdl21a2NWcQiJL7JcZsNB0P9eljCYzTzjc=; b=3gOyiqkjVxWfoBsRH6Q+6aW482
	85+XBI5zA7PHhjEY9SkHELSPhlqBkv1RKTEgd4e1eASGFCVfU8NTlytsgQEaJuCZuSrkxhohwnBBl
	rKHvlU0rvFCYMG/sXf+W3T/zUimaUvd/sj/Fq/TC7H83f+xVmmGuJGT25cThG4M16gdvIGd+mDRWt
	gSY/Q5VJJ02LwUoKFBiGNZ4RbGFqc5iQaQlSKcU87mZu9/bfu+BCUe51DAHhzCt0ZNOINXlW+WQxK
	l/FxLs57FKXfgOx8TNWxauOpdBYdZu1WwAxr3M5+3lorqIDN7igCTNRtAW8vQ9mVDl+bBnqbZqwA7
	tJcgjsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQRy-0000000FaXo-0giw;
	Wed, 11 Dec 2024 17:24:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLQQt-0000000FaFt-1FsS;
	Wed, 11 Dec 2024 17:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u003TtXLqRdl21a2NWcQiJL7JcZsNB0P9eljCYzTzjc=; b=2W5Hs4dExuwoJVN6KAAy7vsVT8
	q8ibUEy9c8pdKQrMtX4D57ESDxDZMe9l6EsD9jXwvIsbgUT5878dNDDjXO3Dw+O/7w7Bq/hP9jOkX
	wX2Zs3uIAu/MV2PAAw5nEzIpkIvvq0UR07OAuOONfXY1lXVt64sh/sgrk2c20vi3XVmkEP2ulBfog
	E2wpfVvR4vypUbQiDtJDA1t2K8gUR00uMBbUPxlOgWkHF6oQWSyd50veAACWTqlcN6DfKStMmFgCm
	0K5cg/n4Ex8wYoFM9fUkBAmqTnMxHK1dsV5jg2g6Jt+QW5GCpZnjltNrlFvWnbkX5jtPVfrSf6usd
	FyEOxEQg==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tLQQS-00063M-PG; Wed, 11 Dec 2024 18:23:04 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 FUKAUMI Naoki <naoki@radxa.com>
Subject: Re: [PATCH v2 3/5] drm/rockchip: vop2: Improve display modes handling on
 RK3588 HDMI0
Date: Wed, 11 Dec 2024 18:23:03 +0100
Message-ID: <1820767.5KxKD5qtyk@diego>
In-Reply-To: <64vc5pkj44w3qxf5wkcxgghpwhvoagzemcsfqmi7fhsxt7vlqd@yfcgloi45ygh>
References: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
 <20241211-vop2-hdmi0-disp-modes-v2-3-471cf5001e45@collabora.com>
 <64vc5pkj44w3qxf5wkcxgghpwhvoagzemcsfqmi7fhsxt7vlqd@yfcgloi45ygh>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_092331_360867_0F096F36 
X-CRM114-Status: GOOD (  33.42  )
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

Am Mittwoch, 11. Dezember 2024, 18:07:57 CET schrieb Maxime Ripard:
> On Wed, Dec 11, 2024 at 12:15:07PM +0200, Cristian Ciocaltea wrote:
> > The RK3588 specific implementation is currently quite limited in terms
> > of handling the full range of display modes supported by the connected
> > screens, e.g. 2560x1440@75Hz, 2048x1152@60Hz, 1024x768@60Hz are just a
> > few of them.
> > 
> > Additionally, it doesn't cope well with non-integer refresh rates like
> > 59.94, 29.97, 23.98, etc.
> > 
> > Make use of HDMI0 PHY PLL as a more accurate DCLK source to handle
> > all display modes up to 4K@60Hz.
> > 
> > Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 34 ++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > index 8b2f53ffefdbf1cc8737b3a86e630a03a7fd9348..393fe6aa170aaee9663c4a6d98c1cd6a5ef79392 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -158,6 +158,7 @@ struct vop2_video_port {
> >  	struct drm_crtc crtc;
> >  	struct vop2 *vop2;
> >  	struct clk *dclk;
> > +	struct clk *dclk_src;
> >  	unsigned int id;
> >  	const struct vop2_video_port_data *data;
> >  
> > @@ -212,6 +213,7 @@ struct vop2 {
> >  	struct clk *hclk;
> >  	struct clk *aclk;
> >  	struct clk *pclk;
> > +	struct clk *pll_hdmiphy0;
> >  
> >  	/* optional internal rgb encoder */
> >  	struct rockchip_rgb *rgb;
> > @@ -220,6 +222,8 @@ struct vop2 {
> >  	struct vop2_win win[];
> >  };
> >  
> > +#define VOP2_MAX_DCLK_RATE		600000 /* kHz */
> > +
> >  #define vop2_output_if_is_hdmi(x)	((x) == ROCKCHIP_VOP2_EP_HDMI0 || \
> >  					 (x) == ROCKCHIP_VOP2_EP_HDMI1)
> >  
> > @@ -1033,6 +1037,9 @@ static void vop2_crtc_atomic_disable(struct drm_crtc *crtc,
> >  
> >  	vop2_crtc_disable_irq(vp, VP_INT_DSP_HOLD_VALID);
> >  
> > +	if (vp->dclk_src)
> > +		clk_set_parent(vp->dclk, vp->dclk_src);
> > +
> >  	clk_disable_unprepare(vp->dclk);
> >  
> >  	vop2->enable_count--;
> > @@ -2049,6 +2056,27 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
> >  
> >  	vop2_vp_write(vp, RK3568_VP_MIPI_CTRL, 0);
> >  
> > +	/*
> > +	 * Switch to HDMI PHY PLL as DCLK source for display modes up
> > +	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
> > +	 */
> > +	if (vop2->pll_hdmiphy0 && mode->crtc_clock <= VOP2_MAX_DCLK_RATE) {
> > +		drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
> > +			struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> > +
> > +			if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
> > +				if (!vp->dclk_src)
> > +					vp->dclk_src = clk_get_parent(vp->dclk);
> > +
> > +				ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
> > +				if (ret < 0)
> > +					drm_warn(vop2->drm,
> > +						 "Could not switch to HDMI0 PHY PLL: %d\n", ret);
> > +				break;
> > +			}
> > +		}
> > +	}
> > +
> 
> It seems pretty fragile to do it at atomic_enable time, even more so
> since you don't lock the parent either.
> 
> Any reason not to do it in the DRM or clock driver probe, and make sure
> you never change the parent somehow?

On rk3588 we have 3 dclk_s and 2 hdmi controllers. Each video-port can
use the clock generated from either the hdmi0phy or hdmi1phy, depending
on which hdmi-controller it uses.

So you actually need to know which vpX will output to which hdmiY to then
reparent that dclk to the hdmiphy output.






