Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE97C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXvhynDFLGl2VG/eD2ULksaHNrcYF1H4SjCXfYiNuEI=; b=r4uGsz6MRTRxS1
	iqtNNYBMYbmj4oEF1TBDoF0Mh0vvecbslYgGpKjBj3hMimwdrBTN4nFKa+Eeu0s2Ntmddl+HJ3u9Z
	nNgGpVam32jPjYmquTK983UcycULjwO+o846wpnGlyBtuO3MQIntQhvnM/4fhR0UW0p3bFmGhkZ0q
	WtpTfnfWLWzak0ExxQUQnYuSHtbcuZV3WGsvkQ4wQTMxS5BRT4t85r2Ray5ObQwmURfIqlrf+HGjw
	LX3ckxg2B/aohIiK23Xi0YaKqxU8Oapl2X6ayYq5BhQArx+g3aL6UXXwBF9KeAb486cxQES+3cTU8
	JL1PZc+PqNLjtotD8AXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKCw-00000008v18-0lxF;
	Fri, 07 Feb 2025 08:59:30 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK7m-00000008tPt-1KzW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:54:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAAAC4430D;
	Fri,  7 Feb 2025 08:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXvhynDFLGl2VG/eD2ULksaHNrcYF1H4SjCXfYiNuEI=;
	b=OmZshL39S+98eneP+hu/yjwtRqSkN58pfmU6nEjLJ1fB2ngGo7EG8Jk3/PFROC3BjDVuiI
	NueKOrYh7sitc4edomP/fP7o1sBn3DSrsTiYu6W+k4QrlGhPlwF8xj3bD3uTlx0lT67tu2
	/bn0hjZxKiAYwZVyV26IUo8VRvnS1dVh0ByDMj7XmzyOwRcRALa4EFkHHuAB4IqKLzLNoD
	G1EX8/1nTBTNzt03u/7FvmzRbV0s8/8wi7WBRWb+GOokfKTFpq3qbkzcYwImsj/XwKMR6i
	twMR4vtXSpPq7Y8WWF88REIwETi5bN7PfW/ChNLAJBzg+GAeHxkhA+YOXBBvoA==
Date: Fri, 7 Feb 2025 09:54:01 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
Message-ID: <20250207095401.42d7871d@booty>
In-Reply-To: <hc6llejnkhj5uaj5o4fof64hmderfcbfkrburv7nmqwzq2jnin@nac32akftsbm>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
	<hc6llejnkhj5uaj5o4fof64hmderfcbfkrburv7nmqwzq2jnin@nac32akftsbm>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegtvgejvgemiegtgegvmeeitggtjeemleekgeejpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrt
 ghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_005410_645757_80C3C9CD 
X-CRM114-Status: GOOD (  43.80  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?Q?Herv?= =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 7 Feb 2025 04:55:54 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:26PM +0100, Luca Ceresoli wrote:
> > In order to support panels described either via graph links or via a
> > subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
> > to find the next bridge. The resulting logic is complex and duplicates code
> > already present in the DRM bridge core. Switch to the new APIs in DRM
> > bridge core that allow to do the same in a much cleaner way.
> > 
> > Note there are two slight changes in the new logic intended to improve the
> > final result:
> > 
> >  * the old code looks for a subnode with any name except "port" or "ports",
> >    while the new code uses the node passed as a parameter
> > 
> >  * the old code looks for a subnode first and falls back to a graph link,
> >    while the new code uses the reverse order because graph links are the
> >    recommended device tree representation now
> > 
> > The first change makes the code more robust by avoiding the risk of using
> > an unrelated node which is not describing a panel and not names "port" or
> > "ports".
> > 
> > The second change is not expected to expose regressions because, in the
> > cases where both a subnode and a graph link are used to describe a panel,
> > the graph link should point to the subnode itself, such as in
> > arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > 
> > As a further cleanup, use a temporary variable to assign dsi->out_bridge
> > only on success. This avoids the risk of leaving a non-NULL value in
> > dsi->out_bridge when samsung_dsim_host_attach() fails.
> > 
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch was added in v6.
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------------
> >  1 file changed, 9 insertions(+), 46 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6e8ca741bffa5e46 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> >  	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
> >  	struct device *dev = dsi->dev;
> >  	struct device_node *np = dev->of_node;
> > -	struct device_node *remote;
> > -	struct drm_panel *panel;
> > +	struct drm_bridge *out_bridge;
> >  	int ret;
> >  
> > -	/*
> > -	 * Devices can also be child nodes when we also control that device
> > -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> > -	 *
> > -	 * Lookup for a child node of the given parent that isn't either port
> > -	 * or ports.
> > -	 */  
> 
> Please leave the comment in place (maybe rewrite it slightly).

OK

> > -	for_each_available_child_of_node(np, remote) {
> > -		if (of_node_name_eq(remote, "port") ||
> > -		    of_node_name_eq(remote, "ports"))
> > -			continue;
> > +	out_bridge = devm_drm_of_get_bridge(dev, np, 1, 0);
> > +	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) != -EPROBE_DEFER)  
> 
> Can it actually return EPROBE_DEFER?

It can't indeed. Dropping the second condition.

> 
> > +		out_bridge = devm_drm_of_get_bridge_by_node(dev, device->dev.of_node);
> >  
> > -		goto of_find_panel_or_bridge;
> > -	}
> > -
> > -	/*
> > -	 * of_graph_get_remote_node() produces a noisy error message if port
> > -	 * node isn't found and the absence of the port is a legit case here,
> > -	 * so at first we silently check whether graph presents in the
> > -	 * device-tree node.
> > -	 */
> > -	if (!of_graph_is_present(np))
> > -		return -ENODEV;
> > -
> > -	remote = of_graph_get_remote_node(np, 1, 0);
> > -
> > -of_find_panel_or_bridge:
> > -	if (!remote)
> > -		return -ENODEV;
> > -
> > -	panel = of_drm_find_panel(remote);
> > -	if (!IS_ERR(panel)) {
> > -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > -	} else {
> > -		dsi->out_bridge = of_drm_find_bridge(remote);
> > -		if (!dsi->out_bridge)
> > -			dsi->out_bridge = ERR_PTR(-EINVAL);
> > -	}
> > -
> > -	of_node_put(remote);
> > -
> > -	if (IS_ERR(dsi->out_bridge)) {
> > -		ret = PTR_ERR(dsi->out_bridge);
> > -		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
> > -		return ret;
> > +	if (IS_ERR(out_bridge)) {
> > +		DRM_DEV_ERROR(dev, "failed to find the bridge: %ld\n", PTR_ERR(out_bridge));
> > +		return PTR_ERR(out_bridge);
> >  	}
> >  
> >  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
> > @@ -1784,6 +1745,8 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> >  	dsi->format = device->format;
> >  	dsi->mode_flags = device->mode_flags;
> >  
> > +	dsi->out_bridge = out_bridge;
> > +  
> 
> Please move the assignment closer to the original place.

OK. With this change it doesn't make sense to have a temporary
out_bridge variable, so I'll drop it as well.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

