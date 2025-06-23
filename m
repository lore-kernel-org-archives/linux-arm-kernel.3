Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F928C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tTqzFXucfoLXojG6cheHnIsoX2Ng1HXB6wnPXyTTz+E=; b=3AEHCA2sLWY2yN3QHfe2PRHXDD
	O5gFfyM+XWYYODbp5r4jff3hfsSgZdWRAbU64NKrj1h+OdWgTEQvN/eldus6BKPKz212dL3ZCHpJV
	R98Jm7SCzM6eDD+n5xN4xR1dsfBssVHNmoIBkPuidPq1lMsg7NB593gtJXPHDQ1hNgBJnTWQYr+1J
	y9DzZTEMzCbeYNTQxy+hUI9gr+AISaLXEJcYIekz/zsEFUR2Vd+SNNp26wRQ+DGFE52Mv9Qum0n9a
	8Luj1tOGT+YlNutNCyxEcFwAFKQb1Em/yu+xILPe47E9jd/Xc281HINmqEyPexET/7lJgawLRzzXu
	vEG1C1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZB-00000004F0e-43Ae;
	Tue, 24 Jun 2025 00:31:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThrP-00000002zAr-08rP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Jun 2025 14:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tTqzFXucfoLXojG6cheHnIsoX2Ng1HXB6wnPXyTTz+E=; b=d9P3bwxZdoitsoQjcCIIfECq57
	ZLsHXDWkxcyuEVMv1Vrjna2gwN2cGfrHoRHZli6/9leVcZZIMWaMBcwiDp0eVAYxvrWVVCuQpcPYS
	g4n5mIJ2Wup90UZivxck9f1dwRAiK8edqhc623D6Z1HJcwmL3nNTeoAfMUEZlxFMOjHrG8hOBAsUg
	/SBAYleGBQ/TY7xhHrHQbkiuuQLIgUlbcMempSUTywgnaDIFWg59F2c/+eafX/CM8orwZlXkE1lak
	K4KyR5kTjVHb7zwrSYeNHsv8yMS3m1qlaQFCCV9qHiwn+t/0ZGp4QHHAGk6cO17EomZhxJtN+Nymi
	z0/Mv4PA==;
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThrL-00000005Ejo-2FjD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:09:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 531EE443B1;
	Mon, 23 Jun 2025 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750687754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tTqzFXucfoLXojG6cheHnIsoX2Ng1HXB6wnPXyTTz+E=;
	b=oQkLm/T6QHfWzh5bGMAbnsCa34uI46vKHRhUpHxX5NE0IaJr2zYoPsHc7EzUtZVsSFVfGS
	I8AltFv5PRy/XTgp7ujqzUS6QWK+GQpLAbxpIgm4eEguFNa2zGavOb5z6UXDIGNJ0p+Qqu
	lZSnNWMzP9Rpbk9uYt7Oe++HnqFKnKj28Bu0pkl50yyVyU142lKiFpbpIAJZoa0hq07xOL
	sR3SBQfRmZnFrG51fUxbR3vDd1urvXDs7MR8Pp5PY2fS1YMZ/ReSwfMsg2Vaa9pUufqhkY
	WSZrgEam039YLW+BxLoOTU2Pwbe78g/vCpmGGMx28FIwrnpedTjp/WD4tMVEDw==
Date: Mon, 23 Jun 2025 16:09:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Andrzej
 Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Marek Vasut
 <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 3/5] drm/mxsfb: put the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-ID: <20250623160909.7d11cfee@booty>
In-Reply-To: <6ed34611-d2fe-4c9c-8b00-0939ac407e07@nxp.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
	<20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-3-0321845fcafb@bootlin.com>
	<6ed34611-d2fe-4c9c-8b00-0939ac407e07@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujedvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_150919_757103_FB2B25D4 
X-CRM114-Status: GOOD (  13.47  )
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

On Mon, 23 Jun 2025 11:06:37 +0800
Liu Ying <victor.liu@nxp.com> wrote:

[...]

> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index dbd42cc1da87f82ef9cd4ccc70cdecbe56035174..21311cf5efee7d26c80316bffe80dd2bfed02238 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -433,7 +433,6 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> >  	struct drm_connector *connector;
> >  	struct drm_encoder *encoder;
> >  	struct drm_bridge_state *bridge_state;
> > -	struct drm_bridge *bridge;
> >  	u32 bus_format, bus_flags;
> >  	bool format_set = false, flags_set = false;
> >  	int ret, i;
> > @@ -448,6 +447,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> >  
> >  	/* Try to find consistent bus format and flags across first bridges. */
> >  	for_each_new_connector_in_state(state, connector, connector_state, i) {
> > +		struct drm_bridge *bridge __free(drm_bridge_put) = NULL;
> > +
> >  		if (!connector_state->crtc)
> >  			continue;  
> 
> To avoid the unnecessary cleanup for !connector_state->crtc, I would write:
> 
> -8<-
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -433,7 +433,6 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
>         struct drm_connector *connector;
>         struct drm_encoder *encoder;
>         struct drm_bridge_state *bridge_state;
> -       struct drm_bridge *bridge;
>         u32 bus_format, bus_flags;
>         bool format_set = false, flags_set = false;
>         int ret, i;
> @@ -453,7 +452,8 @@ static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
>  
>                 encoder = connector_state->best_encoder;
>  
> -               bridge = drm_bridge_chain_get_first_bridge(encoder);
> +               struct drm_bridge *bridge __free(drm_bridge_put) =
> +                               drm_bridge_chain_get_first_bridge(encoder);

Good idea, I probably didn't think about it because I was grown up in a
world where all declarations must before the code. :-)

Changing this in v9.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

