Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEA5C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcuD7NlNDZd+xhVem/Y+o+z4MWg9gjtRsouOtv13Y6A=; b=c9Jp/yNJ1Bg6MaM3qpXbZPNCxm
	I7n7Q867akn3sGU9ZWnB2r/32+kqq4bN6Rwu2zeTuMTM8e2qD1dURUDB2bJyGV8g/THqqPoiiMCb4
	ZdMaixfYhnNlafhenznKW3hJTg/h/mDwKcFTlBqltfhAj9v0FUuu8IvQ3fPUN/IXNHmaKuV8jG0jl
	i/PY94R8k9VwgeGW0BXFYnPz4TNDniiQhCs0lBvfG5Xy+wHavhaTdS5GWNMMUZ2pCc0Ng7Jt/qFZ4
	+KyO67iL5Pu2Xrhx+CkVHkh2JOICgt0i1WWNQCibrIAxM8xmMPPd6QhrfsadOUMWvATOvTKRbsQjz
	RoHM8V2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVqF-0000000E2ce-0Pla;
	Fri, 07 Mar 2025 11:26:11 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVmW-0000000E1ev-1qYI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 11:22:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4A29432BF;
	Fri,  7 Mar 2025 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741346536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qcuD7NlNDZd+xhVem/Y+o+z4MWg9gjtRsouOtv13Y6A=;
	b=kaY9Rr8s/iRCbvx0GX0icDjID8GQ0lANAxP8yEtn+4eQQIvzjVU+NSkHQOFUFzuzJOtfTL
	GAmi3h7PM7njnuuWRVxOpB7KVzL6ytdr1lVgbNkFB+HV9MKENMy7bO33KObvVOq97MXB3Y
	iDKjjRbqR4Zh2LBH/iNV8WdrViBm3wc9kOlXUVGQ2vn90LRQe3EwhqUs7/RJxQwMvWofon
	MLNahYoNEwETYmW8y4lpsAjsJz/1X0aoK8me0BW5Mzdl9kYHFF3YIUZADuuyYdDcvKIBci
	Wt6L0z0Ke9qm18BVKX7Ohjf/4YoajG/JoJBfD7qiU/zsO2WI+FGhainZs7xh3Q==
Date: Fri, 7 Mar 2025 12:22:12 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: fsl-ldb: make warning message more
 informative
Message-ID: <20250307122212.18252ca6@booty>
In-Reply-To: <f8df2b5e-b005-4ada-8108-159b2b94a72e@nxp.com>
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
	<20250306-drm-two-ldb-improvements-v1-2-f139d768b92c@bootlin.com>
	<f8df2b5e-b005-4ada-8108-159b2b94a72e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeeltdeljeeftdetgeeuuedvheffffekleehkeevhfdttefgleeutdfhkeehkeeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopehvihgtthhorhdrlhhiuhesnhigphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhms
 hhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_032220_643061_CE4972C0 
X-CRM114-Status: GOOD (  22.86  )
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

Hello Liu,

thanks for your reviews.

On Fri, 7 Mar 2025 14:33:37 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> On 03/07/2025, Luca Ceresoli wrote:
> > This warning notifies a clock was set to an inaccurate value. Modify the
> > string to also show the clock name.
> > 
> > While doing that also rewrap the entire function call.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/bridge/fsl-ldb.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> > index 0fc8a14fd80062248a43b8b93272101a7ca6158a..c7c899a9644bb827845fb3fe96a9695d79a91474 100644
> > --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> > +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> > @@ -181,9 +181,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
> >  
> >  	configured_link_freq = clk_get_rate(fsl_ldb->clk);
> >  	if (configured_link_freq != requested_link_freq)
> > -		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
> > -			 configured_link_freq,
> > -			 requested_link_freq);
> > +		dev_warn(fsl_ldb->dev,
> > +			 "Configured %pC clock (%lu Hz) does not match requested LVDS clock: %lu Hz\n",
> > +			 fsl_ldb->clk, configured_link_freq, requested_link_freq);  
> 
> Though this slightly changes the warning message userspace sees, I guess it is
> acceptable.
> 
> Does it make sense to s/%pC/%pCn/ so that the clock name is printed in lower
> case instead of upper case, since it seems that all i.MX specific clock names
> are in lower case?

%pC and %pCn print the same string, as I just discovered at
https://elixir.bootlin.com/linux/v6.14-rc5/source/lib/vsprintf.c#L1972

I've pondering for a moment about whether we should document %pC and
%pCn produce the same output or rather %pCn. I decided to try the
latter and just sent a patch to do it [0].

FYI in my case the printed value is (with both %pC and %pCn)
"32ec0000.blk-ctrl:bridge@5c".

[0] https://lore.kernel.org/20250307-vsprintf-pcn-v1-0-df0b2ccf610f@bootlin.com

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

