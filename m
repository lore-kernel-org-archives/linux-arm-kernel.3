Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B493C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vaaae8hQdMGufW3kcWL9HQNxyaHZJe5tDaHlQP6TfTU=; b=kuPcpEBrU//nsY
	e/mKg1f33StlVUSNXazjekkvM/ByUf9U5/Yzg5qoB5Df8m5Axu03s8r9+fpZ4eUOS2/s4MpLiM30X
	KvRiqz3C4e1lodF5w0cer2WEgTjKIyLr2kX4D15HGGHbZE8WBtxRnXsWBf84Nl2L3YwQ+ix06d4ET
	j+eXOQnsl4DCqCJ+Axz612GlHJFagDs2y8993zXxwnT4Q1Sk4VI9RndZx+4eYLn6fLv9CVzPDJXFU
	/7lIaahP+S2Kgicq09Wd+knuPMk6RimTNjs5R6RrNMiBYju6JRbRrp/DcPuIdazoBfcfnqEimAKE6
	KctBpzLZ8isSCI+Kr9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXfn-00000000kAg-3Atr;
	Mon, 10 Feb 2025 17:34:19 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXLB-00000000g6c-0VHm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 17:13:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E739C204A1;
	Mon, 10 Feb 2025 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739207578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vaaae8hQdMGufW3kcWL9HQNxyaHZJe5tDaHlQP6TfTU=;
	b=Tlq770IUZi4waDyXJuAoriXPcY7QhbuWE3xjbPY80elH9wemxJPpuiUWhDIseMMrVpch6T
	/2wTid2FdGg5/5WlsjIRkQlnKMavZHfIBjB6maPDp20dx53EfKnCQTYgzMe1XeCXM1r11W
	nUT3wf3EimcK5HqoszZRpS6Uf6V5mBmY0KpnkoiyTt/8zKCNHOHqI9Q1xc8vnoTAcFauT+
	1OwFaFp+wNHYLlG1WqAxwBo1y6H7BN94vB/jBWDjvHTltnX9B5i2BKmsr685RhgV+c0chb
	XezviekNgqBC9kG6ttrvlpVRXpaWFuHwHFqGftCNf9ZywKfVpByQlydu7Nvk8w==
Date: Mon, 10 Feb 2025 18:12:52 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250210181252.5ee028d4@booty>
In-Reply-To: <20250207-ingenious-daffodil-dugong-51be57@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
	<20250207-ingenious-daffodil-dugong-51be57@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepj
 hgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_091301_328913_D2AE3F9A 
X-CRM114-Status: GOOD (  23.65  )
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

Hello Maxime,

On Fri, 7 Feb 2025 12:47:51 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f64ad2babfebea62db1d9e43 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -31,6 +31,7 @@
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_mode_object.h>
> >  #include <drm/drm_modes.h>
> > +#include <drm/drm_print.h>
> >  
> >  struct device_node;
> >  
> > @@ -863,6 +864,22 @@ struct drm_bridge {
> >  	const struct drm_bridge_timings *timings;
> >  	/** @funcs: control functions */
> >  	const struct drm_bridge_funcs *funcs;
> > +
> > +	/**
> > +	 * @container_offset: Offset of this struct within the container
> > +	 * struct embedding it. Used for refcounted bridges to free the
> > +	 * embeddeing struct when the refcount drops to zero. Unused on
> > +	 * legacy bridges.
> > +	 */
> > +	size_t container_offset;  
> 
> This shouldn't be in there. You can create an intermediate structure and
> store both pointers for the action to consume.

You mean to store container_offset + refcount + is_refcounted?

It can be named drm_bridge_object maybe, as it is somewhat resembling
struct drm_mode_object?

> > +	/**
> > +	 * @refcount: reference count for bridges with dynamic lifetime
> > +	 * (see drm_bridge_init)
> > +	 */
> > +	struct kref refcount;
> > +	/** @is_refcounted: this bridge has dynamic lifetime management */
> > +	bool is_refcounted;
> > +  
> 
> I'm not sure we want to treat both paths separately too. It'll require
> to update most of/all the drivers, but it's not too hard with
> coccinelle:
> 
> virtual patch
> 
> @@
> identifier f;
> identifier b, c, d;
> expression bf;
> type T;
> @@
> 
>  f(...)
>  {
> 	...
> -	T *c;
> +	T *c;
> 	...
> -	c = devm_kzalloc(d, ...);
> +	c = devm_drm_bridge_alloc(d, T, b, bf);
> 	...
> -	c->b.funcs = bf;
> 	...
> 	drm_bridge_add(&c->b);
> 	...
>  }
> 
> We need to add a bit more variations (like kzalloc vs devm_kzalloc,
> drm_bridge_add vs devm_drm_bridge_add, etc.), but it should be a good
> first approximation

Sure, this can be useful, thanks.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

