Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA096E67A9B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4028qTCJqDSLAIj2hVOnoJ50yWM86IojyWcEZbGMr+I=; b=JmcUr9IDruC+lM6pws6kpQJc43
	Zx4Jnw+StDfViOspQRIRYdfsCyDoadGco5GQ+7imG9QHE7SPoblhHK5B2YWJCIv3E5HC+Jw5flxVr
	X79Dms/ghj8HchSRlhN0itPBEvLAnbGDOwGR/qfU/IPk05Fl+aOV+swfRkyNIQOGv0ChGJjt0fdS9
	pFB6vPO0a0oP4AnhcAM0X0+6XlVSS2BRsCoP1Pn0X+pDA1W5Mj6s9XIK2JxioLeP+OttA9e3huXDy
	MvLEWzzd+ja7xPK1gvVg6bHYaYUUre3CREY7kvedru0h+uUozHnZSYAgRUQRG7uxm6Vd50dDlYujU
	fm7eqIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMl7-0000000EwmT-2qs4;
	Tue, 03 Mar 2026 10:13:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMl4-0000000Ewlx-2KAI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 10:13:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxMkl-0001RA-VG; Tue, 03 Mar 2026 11:13:23 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxMkj-003Wua-0a;
	Tue, 03 Mar 2026 11:13:22 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vxMkk-0000000G2Od-1b45;
	Tue, 03 Mar 2026 11:13:22 +0100
Date: Tue, 3 Mar 2026 11:13:22 +0100
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
Message-ID: <2mbaz4jixv3h5ofvaneoe7muwr7snvwzs6lulorj4yul6arglt@ac5kzsx7zw4c>
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
 <20260302-v6-18-topic-imx93-parallel-display-v10-2-634fe2778c7a@pengutronix.de>
 <d97a9c0c-bdda-466a-8131-73799cdb20cd@nxp.com>
 <jyawx2cllg2jecdvx6bdfv4qiinfiwb6cuuwdhditpr2g2evee@qiox37ahgczd>
 <edc74093-abe3-4782-8e81-afd87222c146@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edc74093-abe3-4782-8e81-afd87222c146@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_021342_596831_F0FE7F72 
X-CRM114-Status: GOOD (  37.32  )
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
> On Tue, Mar 03, 2026 at 09:05:43AM +0100, Marco Felsch wrote:
> > On 26-03-03, Liu Ying wrote:
> >> On Mon, Mar 02, 2026 at 05:10:41PM +0100, Marco Felsch wrote:
> >>> From: Liu Ying <victor.liu@nxp.com>
> >>>
> >>> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> >>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> >>> field. Add a DRM bridge driver to support the display format configuration.
> >>>
> >>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> >>> [m.felsch@pengutronix.de: port to v7.0-rc1]
> >>> [m.felsch@pengutronix.de: add review feedback (Alexander)]
> >>> [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> >>> [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> >>> [m.felsch@pengutronix.de: add bus-width support]
> >>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> >>> ---
> >>>  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
> >>>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
> >>>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 225 ++++++++++++++++++++++++++++++++
> >>>  3 files changed, 237 insertions(+)
> >>>
> >>
> >> [...]
> >>
> >>> +static bool imx93_pdfc_bus_output_fmt_supported(const  u32 fmt)
> >>
> >> As I mentioned in v9, can you drop const?
> >> I don't think const is needed.
> > 
> > It makes sense to spot failures early. Albeit this function is very
> > small, the fmt shouldn't be changed and therefore needs to be const.
> 
> If fmt is a pointer, then I think it makes sense to keep const.
> Otherwise, it looks a bit over engineered to have const, since this
> function is really small and no one would try to change fmt.

I'm aware that this is a copy of the output_cfg.format value. Would it
be a non const value you could mess with it and return the wrong value
afterwards. Keeping it const avoids this. Not sure why a 'const' is
worth the discussion :/

> > I forgot to add the double space fix though, thanks.
> > 
> >>> +{
> >>> +	int i;
> >>> +
> >>> +	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
> >>> +		if (imx93_pdfc_bus_output_fmts[i] == fmt)
> >>> +			return true;
> >>> +	}
> >>> +
> >>> +	return false;
> >>> +}
> 
> [...]
> 
> >>> +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
> >>> +					  struct drm_bridge_state *bridge_state,
> >>> +					  struct drm_crtc_state *crtc_state,
> >>> +					  struct drm_connector_state *conn_state)
> >>> +{
> >>> +	struct imx93_pdfc *pdfc = bridge_to_imx93_pdfc(bridge);
> >>> +	const u32 format = bridge_state->output_bus_cfg.format;
> >>
> >> Can you drop const?
> > 
> > No because this function is not supposed to change the format. The
> > function documentation says: this function can alter the bus_cfg.flags
> > bit _not_ the format.
> 
> The local variable format is not a pointer, so literally the value of
> bridge_state->output_bus_cfg.format cannot be changed through format,
> which follows the documentation.  So, I think const could be dropped.

Same here, I'm aware that this is not the pointer value but it holds a
copy of the value. Any adaptions made to the copy will fail, any
assignment of a const value to a non const value will prints at least a
warning to show that something is wrong within this function. Only a
direct bridge_state->output_bus_cfg.format assigned would cause no
compiler error/warning, fingers crossed that this will not happen.

I'm not sure why the 'const' is such a big problem in your oppinion.
Everything works just fine and we've done everything in our power to
avoid a wrong function behavior.

Regards,
  Marco


> 
> > 
> > Regards,
> >   Marco
> > 
> > 
> > 
> >>
> >> -- 
> >> Regards,
> >> Liu Ying
> >>
> > 
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

