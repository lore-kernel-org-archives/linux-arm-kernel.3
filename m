Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1797C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwUUlthEB0GL/tkuBikSXADM+QDOu8qT0EBANwcGFUY=; b=svq/7M1BiRGGSIk/IGlGpepBMZ
	Z8qIKrO4nD0f/aKnHSh3CdGXf+77ZpkHnCcsnGWxDZpTomPL8lROQfD+9Mmg0U2HkYv4Ehgzht5q4
	+8YESJlBP4CDZK77IFY6Ixfn1quLPJXMoUkg1UNbTUcD9sf87OvKIw/hZlUSAdrjd3bja3lp9GXNv
	8Zdu6D4FSCgAfPB6PmonzqbxFW81N9ASpRb2StWkaGI8KaOEwmpnI5vPfOsKjk/S4naeZseBfW3gd
	s+jJefDNZqeC6emQ8lNaXjJMWFiiVkXBlRq9/P/ZhmW5Zm8GJQkX23P0AxHmD+gBZ5BPzvSHbRntZ
	JrjEvbhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGWn-00000001vFh-28Ac;
	Mon, 14 Jul 2025 10:35:21 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGUK-00000001uzu-2pUx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 10:32:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF62543190;
	Mon, 14 Jul 2025 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752489165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwUUlthEB0GL/tkuBikSXADM+QDOu8qT0EBANwcGFUY=;
	b=ptl6aTRU6q2sZbmunyCwSMALBSosgd8KoJVbC3EzqraKunIc8Bw4Tpl7qUSwGsyZvAJpaX
	nxMpym+ISlifa6M9yfjJNuBfLLdo8NnAo486ZnY4IyX534YPVR9/7GeHoutnlRUe8eCYoB
	xuOKJ8T3tP2c1OnpGLpDazsGB18BEKP0R0S1NdNt+nk8q7ZsE3QZ5jucNavPk/ZPUX1Yzi
	cyhzvnlezCJPyP3rz6Itw/IFMPyCvo9ivUjCAWMKzL+KgIdlSHKnXBbeUaOD7/p7zNvCWh
	KsDCZ4A9j6u5VXp4d0KbE/LFj1zKX/F4YKG3yWpau0gvUZeMVJ8cajQgbuMF/A==
Date: Mon, 14 Jul 2025 12:32:40 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
Message-ID: <20250714123240.16d8dcb1@booty>
In-Reply-To: <20250710-daffy-mini-booby-574fca@houat>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
	<20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-4-48920b9cf369@bootlin.com>
	<20250710-daffy-mini-booby-574fca@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehudejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghro
 hdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_033249_180013_05A69460 
X-CRM114-Status: GOOD (  21.28  )
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

Hi Maxime,

On Thu, 10 Jul 2025 09:13:46 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, Jul 09, 2025 at 06:48:03PM +0200, Luca Ceresoli wrote:
> > Use drm_bridge_chain_get_last_bridge() instead of open coding a loop with
> > two invocations of drm_bridge_get_next_bridge() per iteration.
> > 
> > Besides being cleaner and more efficient, this change is necessary in
> > preparation for drm_bridge_get_next_bridge() to get a reference to the
> > returned bridge.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/omapdrm/omap_drv.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> > index 054b71dba6a75b8c42198c4b102a093f43a675a2..3bbcec01428a6f290afdfa40ef6f79629539a584 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> > @@ -378,12 +378,12 @@ static int omap_display_id(struct omap_dss_device *output)
> >  	struct device_node *node = NULL;
> >  
> >  	if (output->bridge) {
> > -		struct drm_bridge *bridge = output->bridge;
> > -
> > -		while (drm_bridge_get_next_bridge(bridge))
> > -			bridge = drm_bridge_get_next_bridge(bridge);
> > +		struct drm_bridge *bridge =
> > +			drm_bridge_chain_get_last_bridge(output->bridge->encoder);
> >  
> >  		node = bridge->of_node;
> > +
> > +		drm_bridge_put(bridge);  
> 
> Any reason you're not using __free(drm_bridge_put) here?

Just because the code is simple enough that an explicit
drm_bridge_put() is clearly sufficient.

Do you think __free() should be used even in such trivial cases?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

