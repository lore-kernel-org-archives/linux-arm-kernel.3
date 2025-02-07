Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E4DC02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wn7hxWkM/cWBO7IgNnUs/y74YeSzIcIWM0x5ZDLkpdk=; b=L2gX5o0AS1oXuY
	5jbsznhu0i0xaHBG5wBYtdvvveR9Y+5mofQyqMiPGDbz9DSBagqkaXh4F7j/q3a12vMV4MIwHP+7b
	D3rDSOrzpeUtiYB0lfrR2q9VutOACeJkqe+k42562/7VKiSm1pqK9n7hnZMyCdSAAZz+08VuDrnfq
	kUC0O7OjGTyAeuhanrVOKeXfz7cAkpwqIb2RKJ4mxOOiG3mc8FhSWdutDhH+6M9YU97HHJuw3y91v
	6zokd2R0T/blQMlQM+jAAJucFg/tOjK4ddmzsGd0qFXFjfvBiYU6yqKsgCGIyYKRvPxkkrm+BpsVR
	6lsUndno15ilapagBaWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKIK-00000008w9B-3zuB;
	Fri, 07 Feb 2025 09:05:04 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK8D-00000008tX3-1Rtk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:54:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D3C65443A5;
	Fri,  7 Feb 2025 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wn7hxWkM/cWBO7IgNnUs/y74YeSzIcIWM0x5ZDLkpdk=;
	b=IMbX3HWevbzexCXvLrDPdCGV4DgqsZikJxEUhZloTqBXMrb7K5iBqUZzsswJsec98HBthn
	tP4V8cASf0MG5GOAVmfB0so2WYFTXSwYTb6FfAQTNwgXqzUfqXTWdcjGuzIawsP2FaCedv
	4rBDaTsXH9EYzmPHV21Zf0T6c1mC482iupiejkS0t+LLhdXxA0nmme0t7ZcMSCtahBBKCi
	s4iX7aHyI+gTPDWBaJBWGJcVxPnFomj9RcbuSVw+ocSbDiiReNMvBiIWYkMMsotEZWnNd1
	dFxmwaQRSxvzt/z1Hi/mtOcNnRYXPFxVWTv/HhjJn35KZSHb4QDNXAK9x3KJfw==
Date: Fri, 7 Feb 2025 09:54:28 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <20250207095428.244f0f91@booty>
In-Reply-To: <iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
	<iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
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
X-CRM114-CacheID: sfid-20250207_005437_536457_8F6A5A21 
X-CRM114-Status: GOOD (  38.90  )
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

On Fri, 7 Feb 2025 04:49:21 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> > Adding a panel does currently not add a panel_bridge wrapping it. Usually
> > the panel_bridge creation happens when some other driver (e.g. the previous
> > bridge or the encoder) calls *_of_get_bridge() and the following element in
> > the pipeline is a panel.
> > 
> > This has some drawbacks:
> > 
> >  * the panel_bridge is not created in the context of the driver of the
> >    underlying physical device (the panel driver), but of some other driver
> >  * that "other driver" is not aware of whether the returned drm_bridge
> >    pointer is a panel_bridge created on the fly, a pre-existing
> >    panel_bridge or a non-panel bridge
> >  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
> >    but the "other driver" doesn't know whether this is needed because it
> >    doesn't know whether it has created a panel_bridge or not
> > 
> > So far this approach has been working because devm and drmm ensure the
> > panel bridge would be dealloacted at some later point. However with the
> > upcoming implementation of dynamic bridge lifetime this will get more
> > complicated.
> > 
> > Correct removal of a panel_bridge might possibly be obtained by adding more
> > devm/drmm technology to have it freed correctly at all times. However this
> > would add more complexity and not help making lifetime more understandable.
> > 
> > Use a different approach instead: always create a panel_bridge with a
> > drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
> > wrapping it. This makes lifetime much more straightforward to understand
> > and to further develop on.
> > 
> > With the panel_bridge always created, the functions to get a bridge
> > [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> > the bridge they are looking for exists already (if it can exist at all). In
> > turn, this is implemented based on a variant of
> > drm_of_find_panel_or_bridge() that only looks for panels:
> > of_drm_find_bridge_by_endpoint(). In the future
> > drm_of_find_panel_or_bridge() can be progressively removed because there
> > will never be a panel not exposing a bridge.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch was added in v6.
> > ---
> >  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
> >  include/drm/drm_panel.h        |  8 +++++
> >  2 files changed, 66 insertions(+), 16 deletions(-)
> >   
> 
> LGTM, minor issue below.
> 
> > @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
> >  {
> >  	struct drm_bridge **ptr, *bridge;
> >  
> > +	if (panel->bridge) {
> > +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> > +		return panel->bridge;
> > +	}  
> 
> Shouldn't the rest of the function also be removed as you do in other
> cases?

Indeed it should.

And even more, I now realize drm_panel_bridge_add_typed() should also
become a simple 'return panel->bridge', like its devm and drmm
variants, and its code, implementing the actual creation of a panel
bridge, move to an internal function. Otherwise this patch is a bug:
existing drivers which do call drm_panel_bridge_add_typed() would end
up in having two panel_bridges for the same panel.

I must say the process of developing this patch together with the
hotplug work was "convoluted" to say the least, which probably explains
why this got unnoticed so far.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

