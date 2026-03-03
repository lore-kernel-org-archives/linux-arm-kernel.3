Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAFFE67A8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 08:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpiaZJChXT+BJvVJY3KMMcj+O1RqXVeBgH8xNwNq0Ks=; b=CLbqPN0k0oy0r3jOMipW8EtKxz
	LUXJrinX+xj1Bresq5LAuJHgUNwp/QyHea85vnNAgKeWkHjTaW4tAnqcl/ah1lNG1gDTdEjZ9bmpm
	UocRzR8fH/FbE3aa/TTm8xXeevlK3ZWqGWGYbC6FVlI2hH6+6KvTxSvJ7o48e6VxLQWvshEFrG65B
	X0MCkxZE0BTk1BYb7eqccT/HFHwI+FJP4ifHyRSNRIrfBpm9D9z91S11I1MYfDBY9y0dmsKzdf9by
	xDhh/4nRF16aZRgSGbV7j61OQSZVz64Mex7EG5ENLxBky5ONhyttm4GU3nIu2JjwPXwWBEcoSNnbM
	IZKRa8eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKlc-0000000Ekis-3xXh;
	Tue, 03 Mar 2026 08:06:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKla-0000000EkiU-1oXu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 08:06:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxKlG-0005ew-HV; Tue, 03 Mar 2026 09:05:46 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxKlB-003Vqs-2g;
	Tue, 03 Mar 2026 09:05:43 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxKlD-0000000FzWF-07cc;
	Tue, 03 Mar 2026 09:05:43 +0100
Date: Tue, 3 Mar 2026 09:05:43 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, frank.li@nxp.com
Subject: Re: [PATCH v10 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
 <20260302-v6-18-topic-imx93-parallel-display-v10-2-634fe2778c7a@pengutronix.de>
 <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_000606_470706_BF6BC7D4 
X-CRM114-Status: GOOD (  30.11  )
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

On 26-03-03, Liu Ying wrote:
> On Mon, Mar 02, 2026 at 05:10:41PM +0100, Marco Felsch wrote:
> > From: Liu Ying <victor.liu@nxp.com>
> > 
> > NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> > configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> > field. Add a DRM bridge driver to support the display format configuration.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > [m.felsch@pengutronix.de: port to v7.0-rc1]
> > [m.felsch@pengutronix.de: add review feedback (Alexander)]
> > [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> > [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> > [m.felsch@pengutronix.de: add bus-width support]
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
> >  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
> >  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 225 ++++++++++++++++++++++++++++++++
> >  3 files changed, 237 insertions(+)
> > 
> 
> [...]
> 
> > +static bool imx93_pdfc_bus_output_fmt_supported(const  u32 fmt)
> 
> As I mentioned in v9, can you drop const?
> I don't think const is needed.

It makes sense to spot failures early. Albeit this function is very
small, the fmt shouldn't be changed and therefore needs to be const.

I forgot to add the double space fix though, thanks.

> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
> > +		if (imx93_pdfc_bus_output_fmts[i] == fmt)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> > +static u32 *
> > +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > +					    struct drm_bridge_state *bridge_state,
> > +					    struct drm_crtc_state *crtc_state,
> > +					    struct drm_connector_state *conn_state,
> > +					    u32 output_fmt,
> > +					    unsigned int *num_input_fmts)
> > +{
> > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > +	u32 *input_fmts;
> > +
> > +	*num_input_fmts = 0;
> > +
> > +	input_fmts = kmalloc_obj(*input_fmts, GFP_KERNEL);
> 
> With the below two commits in v7.0-rc1, I believe that GFP_KERNEL can be
> dropped.
> 
> bf4afc53b77a Convert 'alloc_obj' family to use the new default GFP_KERNEL argument
> e19e1b480ac7 add default_gfp() helper macro and use it in the new *alloc_obj() helpers

Will drop the GFP_KERNEL.

> > +	if (!input_fmts)
> > +		return NULL;
> > +
> > +	*num_input_fmts = 1;
> > +
> > +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt)) {
> > +		dev_dbg(pdfc->dev, "No valid output bus-fmt detected, fallback to MEDIA_BUS_FMT_RGB888_1X24\n");
> > +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > +		return input_fmts;
> > +	}
> > +
> > +	switch (output_fmt) {
> > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > +	case MEDIA_BUS_FMT_RGB565_1X16:
> > +		input_fmts[0] = output_fmt;
> > +		break;
> > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > +	case MEDIA_BUS_FMT_FIXED:
> > +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> > +		break;
> > +	}
> > +
> > +	return input_fmts;
> > +}
> > +
> > +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
> > +					  struct drm_bridge_state *bridge_state,
> > +					  struct drm_crtc_state *crtc_state,
> > +					  struct drm_connector_state *conn_state)
> > +{
> > +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> > +	const u32 format = bridge_state->output_bus_cfg.format;
> 
> Can you drop const?

No because this function is not supposed to change the format. The
function documentation says: this function can alter the bus_cfg.flags
bit _not_ the format.

Regards,
  Marco



> 
> -- 
> Regards,
> Liu Ying
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

