Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119C0C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srlQpvYJmp4WGJbQ2gOhstlghcIxLLDbBOH3Hms1G1E=; b=w1fjii1mhu/lO5
	9EFmtZwfFEkTlM+lffVo9b1KHw7Twrcv3XiYkN9gRlhpkx/B9+EPs8PsbhMujyWHZsCt5LyoHLtKs
	38OaO9RD+Ne/yHsf7d3bjwcI06d66lnKvNxOXdouwZlMsgosIVNessl8EEEsxeb7PjKe+iD0y3xo7
	XeVaMVHO8nAskzI7z5L3dsYiZYm5vcJZdxz4f72iVxGAvVJ5sdmVDkdE62gnI94CyAiUlou7tMcjx
	p3HmoFCRE5F7HLdnABO0DPmU8pWtiU72ejIDK3sgD85gQiy0VwSLGvVL1GVLPG2tjEvgruXeS561y
	NuOL/zGIN9Pp18X5e+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJEz-00000004FZT-1C8j;
	Wed, 26 Feb 2025 15:22:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIOf-000000045Dn-14gp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:28:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85F5844279;
	Wed, 26 Feb 2025 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740580100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srlQpvYJmp4WGJbQ2gOhstlghcIxLLDbBOH3Hms1G1E=;
	b=YVmqFcjk0U4E+e7zKuj6Rpt4rxnNlmQ/mknWE7cS2QlmyRYYG1pX0skomC3EzGSFK0+D0F
	LofQCcAcczK0rToLqkgTL6IcBlrchx6Td+Em78I4vSLNbZiWK81HGy3XvZ4r9UK2BY2m+s
	t4y9WnK03LesL2wCljRBBavDBr7cQcUGTVz+SqalkLwcf72W6+PuUyj9YfmeNtygDQ7AL2
	mQM1gdT5t/e1zEh2tTHsacPJtCQUZfENXAk/U235HEbS8uFItYZ5vSwAM2o94jAhPbDzwS
	EC5ezudhpnVxZ2B1Yw5qFD9iXvELunSAI9SqyWyf+7aI5kLws9yeteiVn2k+6w==
Date: Wed, 26 Feb 2025 15:28:13 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250226152813.4a1ad218@booty>
In-Reply-To: <20250211-merciful-nyala-of-justice-a4fabb@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
	<20250207-ingenious-daffodil-dugong-51be57@houat>
	<20250210181252.5ee028d4@booty>
	<20250211-merciful-nyala-of-justice-a4fabb@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepj
 hgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_062825_772799_37AAAC4E 
X-CRM114-Status: GOOD (  27.11  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Maxime,

On Tue, 11 Feb 2025 14:10:50 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Feb 10, 2025 at 06:12:52PM +0100, Luca Ceresoli wrote:
> > Hello Maxime,
> > 
> > On Fri, 7 Feb 2025 12:47:51 +0100
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > > index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f64ad2babfebea62db1d9e43 100644
> > > > --- a/include/drm/drm_bridge.h
> > > > +++ b/include/drm/drm_bridge.h
> > > > @@ -31,6 +31,7 @@
> > > >  #include <drm/drm_encoder.h>
> > > >  #include <drm/drm_mode_object.h>
> > > >  #include <drm/drm_modes.h>
> > > > +#include <drm/drm_print.h>
> > > >  
> > > >  struct device_node;
> > > >  
> > > > @@ -863,6 +864,22 @@ struct drm_bridge {
> > > >  	const struct drm_bridge_timings *timings;
> > > >  	/** @funcs: control functions */
> > > >  	const struct drm_bridge_funcs *funcs;
> > > > +
> > > > +	/**
> > > > +	 * @container_offset: Offset of this struct within the container
> > > > +	 * struct embedding it. Used for refcounted bridges to free the
> > > > +	 * embeddeing struct when the refcount drops to zero. Unused on
> > > > +	 * legacy bridges.
> > > > +	 */
> > > > +	size_t container_offset;    
> > > 
> > > This shouldn't be in there. You can create an intermediate structure and
> > > store both pointers for the action to consume.  
> > 
> > You mean to store container_offset + refcount + is_refcounted?  
> 
> No, I meant for the private structure pointer and the drm_bridge
> pointer. refcount should be in drm_bridge, and I think is_refcounted
> should be dropped.

Storing the container pointer instead of the offset is a good idea, it
will allow to get rid of is_refcounted: drm_bridge_is_refcounted() can
just return "container != NULL" instead of "bridge->is_refcounted". So
far so good.

I'm not sure about the intermediate struct you have in mind though.

Do you mean:

struct drm_bridge_pointers {
    struct drm_bridge *bridge;
    void              *container;
}

?

If that's what you mean, should it be embedded in drm_struct or
allocated separately?

If you mean to embed that struct in drm_bridge, then I the drm_bridge
pointer inside the intermediate struct would be useless.

If instead you mean to embed it in drm_struct: I'm not sure I see much
benefit except maybe not exposing the container pointer to drm_bridge
users, but I see a drawbacks: at the last put we need to find the
container pointer to free from a struct kref pointer, which can work
only if the container pointer is in the same struct as struct kref.

Additionally, the consuming action for that struct just needs a
drm_bridge pointer:

     static void drm_bridge_put_void(void *data)
     {
	struct drm_bridge *bridge = (struct drm_bridge *)data;

	drm_bridge_put(bridge);
     }

Can you clarify this? I'd love to have this cleanup in the next
iteration.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

