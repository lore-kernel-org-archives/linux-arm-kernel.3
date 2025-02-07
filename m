Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B4BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKxj3pSD0UwzMwdxWit8kdJvq0oc5hRaBZzxFkTM46k=; b=4BDQcRZL+/gQNi
	qErvT0mifAN90RkxksdVJcfXE1sebifCbhM5jZ4JOnMjLRri19DUjIG1WaJRIB5nGW5k17ROGTWjo
	vPKWSFm8LURCXDnmGYmZ/2CocgZnXQHwKweVtUgUq8Gn25bwpwfDL0abQCdHUB7NijRy5iqVcQ10G
	bk88n1fThM+YRvkkvBao0Yv7yITjUPxQ4d3Jf6aR79FOnAZurP/x/MUrb2WRaPYibkRWNDr94MiRQ
	fyR/9DCemWsKRoL+uRLja+bxYo0STExT9m1u7M+ai43db2gAgy7vtBRB7ZfYZq+UxuqTY6BOmPwJA
	X/ZJQJexHK1vBa8dAyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgKBZ-00000008ufI-1xqN;
	Fri, 07 Feb 2025 08:58:05 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgK75-00000008tDw-41kN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:53:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9912442CE;
	Fri,  7 Feb 2025 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738918404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mKxj3pSD0UwzMwdxWit8kdJvq0oc5hRaBZzxFkTM46k=;
	b=Jt11DHRqH/hXBBUEMf6EkKmyU63Y9/C8UFL/hQXT+cT/sBvJcPNHnTdb21tQMKpXIIaS8n
	Tjy72dAH3yPLxX3dqKeROQm5keBVXaUjd58v3UNMxIspmoEGRvwT69peKmMTNn0e6daa3V
	al+b+2v6RA3XNUzYrjh+Ey+kJLdoxAbWb8xNz01kb1g5TW7VMLqikmvXvt4uv+Fj1KkHc1
	DzrZkzZzMjh0JRsawywnNJabEBCijVEZfARH8y0/h/S76bj5yLmPNv8qg/6yDyiExoH/JF
	SR5yL1Mt/orv91qMJq3j0p//MLNZTzIkWXA7UVywXc+HYC491xHAPngeJJyqBA==
Date: Fri, 7 Feb 2025 09:53:18 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 13/26] drm/encoder: add drm_encoder_cleanup_from()
Message-ID: <20250207095318.2fc8d54e@booty>
In-Reply-To: <spxzxwcs27uv2ttt5mh3r2767ihczvzzrtov6afdmex2ye7lam@r6kdqv5ocg5h>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-13-9d6f2c9c3058@bootlin.com>
	<spxzxwcs27uv2ttt5mh3r2767ihczvzzrtov6afdmex2ye7lam@r6kdqv5ocg5h>
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
X-CRM114-CacheID: sfid-20250207_005328_446227_55F4E037 
X-CRM114-Status: GOOD (  25.26  )
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

On Fri, 7 Feb 2025 05:03:13 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Thu, Feb 06, 2025 at 07:14:28PM +0100, Luca Ceresoli wrote:
> > Supporting hardware whose final part of the DRM pipeline can be physically
> > removed requires the ability to detach all bridges from a given point to
> > the end of the pipeline.
> > 
> > Introduce a variant of drm_encoder_cleanup() for this.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Changes in v6: none
> > Changes in v5: none
> > Changes in v4: none
> > Changes in v3: none
> > 
> > Changed in v2:
> >  - fix a typo in a comment
> > ---
> >  drivers/gpu/drm/drm_encoder.c | 21 +++++++++++++++++++++
> >  include/drm/drm_encoder.h     |  1 +
> >  2 files changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_encoder.c b/drivers/gpu/drm/drm_encoder.c
> > index 8f2bc6a28482229fd0b030a1958f87753ad7885f..472dfbefe2960924a4e83bec425af8c7ef5f5265 100644
> > --- a/drivers/gpu/drm/drm_encoder.c
> > +++ b/drivers/gpu/drm/drm_encoder.c
> > @@ -207,6 +207,27 @@ void drm_encoder_cleanup(struct drm_encoder *encoder)
> >  }
> >  EXPORT_SYMBOL(drm_encoder_cleanup);
> >  
> > +/**
> > + * drm_encoder_cleanup_from - remove a given bridge and all the following
> > + * @encoder: encoder whole list of bridges shall be pruned
> > + * @bridge: first bridge to remove
> > + *
> > + * Removes from an encoder all the bridges starting with a given bridge
> > + * and until the end of the chain.
> > + *
> > + * This should not be used in "normal" DRM pipelines. It is only useful for
> > + * devices whose final part of the DRM chain can be physically removed and
> > + * later reconnected (possibly with different hardware).
> > + */
> > +void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridge *bridge)
> > +{
> > +	struct drm_bridge *next;
> > +
> > +	list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
> > +		drm_bridge_detach(bridge);
> > +}
> > +EXPORT_SYMBOL(drm_encoder_cleanup_from);  
> 
> Shouldn't drm_encoder_cleanup() also use this function?

Sure. I'll do it in v7.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

