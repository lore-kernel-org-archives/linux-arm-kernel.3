Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658521125875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yjm20XwR0A2XuK98U4hPZjpE+P7c1D1fXnte9FuwsM=; b=yC5rsN4i1PY6rIaWzWNzjCFyBK
	XEG74ep6Hj0sMdmFdDvd6lw39SwJ2DkQqKaB7Cp33Rf7zWODhoXW4OilJ2oXwjWZqLKHWIKHkPw55
	WfrEoNtfYQf8CBBk9eiVVPdOrSZOz4ndiUysAXah13ARUoPDzrHUMqmjlN3h6w3PTpac+XCmjo1kj
	U/UGs2cvXwYluCTu8oUqCpPoJDJe30Izeuhn/K9BhC9rx1wElwZ5qGKwCgv56l3SqNPBWIFDddrFm
	l0sA2Z7idFra5myDKgyE/PA8ZRLQWVxktY/5wrDTFFXK5/7NMvM8gPcddiL8BL7d2SS+fNfe9beyH
	kM2K2IZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PVF-0000000COOW-1jyQ;
	Wed, 11 Mar 2026 19:45:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0PVC-0000000CONA-070W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:45:55 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1w0PUl-0003Gd-NH; Wed, 11 Mar 2026 20:45:27 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1w0PUi-004uHc-1s;
	Wed, 11 Mar 2026 20:45:25 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1w0PUj-0000000DVMM-3LA5;
	Wed, 11 Mar 2026 20:45:25 +0100
Date: Wed, 11 Mar 2026 20:45:25 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <ot5qypkeirkiweicjijholt2hwfpnnfhrcm3d6euqfnupptsab@din4bkq2sh5h>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com>
 <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_124554_061997_87D08D68 
X-CRM114-Status: GOOD (  27.67  )
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

Hi Liu, Luca,

sorry for the delayed response, I was at the EW26.

On 26-03-10, Luca Ceresoli wrote:
> Hi Liu, Marco,
> 
> On Tue Mar 10, 2026 at 3:57 AM CET, Liu Ying wrote:
> > Hi Marco, Luca,
> >
> > On Tue, Mar 03, 2026 at 11:34:27AM +0100, Marco Felsch wrote:
> >
> > [...]
> >
> >> +	next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> >> +	if (IS_ERR(next_bridge))
> >> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
> >> +				     "failed to get next bridge\n");
> >> +	pdfc->dev = dev;
> >> +	pdfc->bridge.of_node = dev->of_node;
> >> +	pdfc->bridge.type = DRM_MODE_CONNECTOR_DPI;
> >> +	pdfc->bridge.next_bridge = next_bridge;
> >
> > When I was reviewing another patch[1], I was aware of the necessity of
> > calling drm_bridge_get() for next_bridge to balance the next bridge's
> > refcount put from __drm_bridge_free() for this bridge.  I'd be good if
> > Luca may confirm this is correct.  Sorry for bringing this up late.
> 
> Indeed you have a good point.

At which stage did you faced this issue? During driver probe, because of
EPROBE_DEFER?

That's the reason for having the local next_bridge variable since I
faced with the same issue. In other words this driver is correct and
it's on purpose to not assign it directly. Albeit I could/should have
added a comment.

> After re-checking devm_drm_of_get_bridge(), as I wrote on the other thread
> you pointed to, you should call drm_bridge_get():
> 
> -	pdfc->bridge.next_bridge = next_bridge;
> +	pdfc->bridge.next_bridge = drm_bridge_get(next_bridge);
>
> Marco, you can keep my R-by if you resend with just this change.
> 
> Sorry about the confusion here.
> 
> As mention on the other thread, devm_drm_of_get_bridge() is unable to
> support bridge hotplug. So it should be deprecated, but as of now there is
> no alternative.

Sorry I need a bit more context. What's the issue? How can I trigger the
issue? Why is bridge hotplug required at this stage? Why is only this
bridge affecte by the hotplug issue?

Regards,
  Marco



> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

