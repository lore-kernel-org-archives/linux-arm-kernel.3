Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984FAC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiX423mBFM8qXe3BKnP5N39kMu5CYkpjLnn2bYTEEK0=; b=SntvGLbdtkCU7+w9FgAR2qKFDV
	efUfhUplx6cWyuIdqWn5kxkhpKB7O4+APYMKxVSDxicIIrPc7zCRoG8PhIRenLqedWQyMWNU++QHm
	wucI7CasKVHevhvV+4pr26VSdxsFAoLKdR8GANku9dxUbTDYNKR4lj+mbw4VH40/8Sm3JiFP/4Qho
	ErN/Jlnyn+IZ/IQChclWmXvws9oV0uxlC2mdJ7wdFuFRLM4l+T1Oh1HjsL5V5M40IrTtOMF7G82mT
	/wBevCwLlkridSSuAs7A2yFWv3imn3Tmm59tF19JNyA85VpOSgIjN9zdWjIY9R/7j/Z8Ra7U2GVUB
	fLkOCINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCAT-000000036NM-2VLI;
	Mon, 17 Mar 2025 15:14:17 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBu0-000000033IQ-2R7D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 14:57:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3DD3B441B5;
	Mon, 17 Mar 2025 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742223433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TiX423mBFM8qXe3BKnP5N39kMu5CYkpjLnn2bYTEEK0=;
	b=d5YRz8HSm0HZdUtqDQdw8FIEIb3CfRMXBcpqaXQPcgtSJcJwgCRtMF/ovIx6w8TqAZWUJt
	LQVOlsrmiudnVIVAtu/k5Y5snjGuPCCEQbxy2klAm8+Z0h7dEqV/D8nkoICX57wwSsCZll
	lAgH6XOiR3VnUj+NSDACP2UbDQGMXS+CK5qas+di2FFuiVLwnwBKVC20rwb5hYQrQXWSgJ
	1hM6MAw82+ez1Iym6NgQByoSg1R1A7sRsdf7cgMk6mhrkgurKRNCzdf7cITOg6qbiaA0C9
	E1aUSxA0/ywLU4xMLINWGKrXyCenpSBFdeBhkbgO1Wpvr3x0nc6D0x1IBta26w==
Date: Mon, 17 Mar 2025 15:57:07 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Marek Vasut <marex@denx.de>, Stefan Agner
 <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 05/11] drm/bridge: add a cleanup action for
 scope-based drm_bridge_put() invocation
Message-ID: <20250317155707.6d1055f1@booty>
In-Reply-To: <20250314-banana-toucanet-of-masquerade-8eeb4e@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
 <20250314-drm-bridge-refcount-v7-5-152571f8c694@bootlin.com>
 <20250314-banana-toucanet-of-masquerade-8eeb4e@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_075716_756166_8A091580 
X-CRM114-Status: GOOD (  29.03  )
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

On Fri, 14 Mar 2025 19:08:22 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Mar 14, 2025 at 11:31:18AM +0100, Luca Ceresoli wrote:
> > Many functions get a drm_bridge pointer, only use it in the function body
> > (or a smaller scope such as a loop body), and don't store it. In these
> > cases they always need to drm_bridge_put() it before returning (or exiting
> > the scope).
> > 
> > Some of those functions have complex code paths with multiple return points
> > or loop break/continue. This makes adding drm_bridge_put() in the right
> > places tricky, ugly and error prone in case of future code changes.
> > 
> > Others use the bridge pointer in the return statement and would need to
> > split the return line to fit the drm_bridge_put, which is a bit annoying:
> > 
> >   -return some_thing(bridge);
> >   +ret = some_thing(bridge);
> >   +drm_bridge_put(bridge);
> >   +return ret;
> > 
> > To make it easier for all of them to put the bridge reference correctly
> > without complicating code, define a scope-based cleanup action to be used
> > with __free().
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch was added in v7.
> > ---
> >  include/drm/drm_bridge.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 5c1e2b9cafb12eb429d1f5d3ef312e6cf9b54f47..a5accd64c364ebb57903ae1e7459034ad9ebf4f3 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -23,6 +23,7 @@
> >  #ifndef __DRM_BRIDGE_H__
> >  #define __DRM_BRIDGE_H__
> >  
> > +#include <linux/cleanup.h>
> >  #include <linux/ctype.h>
> >  #include <linux/list.h>
> >  #include <linux/mutex.h>
> > @@ -995,6 +996,9 @@ static inline struct drm_bridge *drm_bridge_put(struct drm_bridge *bridge)
> >  	return bridge;
> >  }
> >  
> > +/* Cleanup action for use with __free() */
> > +DEFINE_FREE(drm_bridge_put, struct drm_bridge *, if (_T) drm_bridge_put(_T))
> > +  
> 
> IIRC, drm_bridge_put already checks for the pointer being null before
> dereferencing it, right? Then we can probably simplify the macro here.

drm_bridge_put() does the NULL-check, yes. However I have kept the 'if'
here for consistency with all other DEFINE_FREE()s in the kernel which
also have an 'if' even when the called function does it as well.

Moreover, as per discussion after patch 2, in the next iteration I'm
moving drm_bridge_put() back to a an exported symbol instead of an
inline. So the 'if' here will save a useless function call on NULL.

For the two above reasons I'm rather inclined to keeping this line as
is.

> Either way,
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

