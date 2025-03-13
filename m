Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45D4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhXUy51c9HOiF2dM0ShdmXt1Njr+UGlAd/NPatt3K0Q=; b=nXB9iyJm15tXTK8jWnP7AoWOZn
	YxM53qaZvQ9xFL6SAijbHXB7MGjc65NDm5zZ5mm8fJzG3x6fqFFHnb+1UaOYWTx4DZJyiyWZuIIvt
	68eJB/5S/F1++HrQoGKLUPYnqwyaX+XHfGCHCF62nutVJEim3iqJLSovLyKK/GTIQgwPi44rqSxVH
	tSnvpGRj5Rpg1w0597gKpnyFlcbvBHU0IfVexr6BdWL0y+eK7KvdYNp4+WJNm38J6tSC/RASBlVkB
	2pufgWCsDQYn110ucFRIam2LxnFYfyv4u+3pxCnM5C7aRwTQf4If0CfYiO01WRkvHOlslugio/WA7
	MLXyKajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshVn-0000000BDVO-3GoT;
	Thu, 13 Mar 2025 12:18:08 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshBU-0000000B9RZ-1n6x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:57:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA15B43290;
	Thu, 13 Mar 2025 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741867023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JhXUy51c9HOiF2dM0ShdmXt1Njr+UGlAd/NPatt3K0Q=;
	b=QwnyFTZYHlEK0gM8ijiyd15oLuWJmqqgsBCfTj5dOwO8Ny2Zx0aUjpStJFhwkMDmaPvmo0
	Qk5FqkGvQlzKhqGEUhWczOpYH6r86aXQxq8KCQ69Kst4cIgUREiVQdPyh3JNUoFAtUzEdL
	oKBoPnqi4f8o+vBx3ceJ1my6wLrWoqSi7EGg9P9cvzKphYMEMGc2C79bpBU7P1aeyzGVky
	DCXwUhNvJFJmGTnswNa1DLdZWbdRwwbhMiKnrSAkj1ypGAcr3qs+sgFGzBZMXQIYI0jMaG
	GiT7iStHOIXg9NqorQxWoG/e1Fh95b4KKxXc4/BNXFp25JWtuZoVtP1q9dlmdQ==
Date: Thu, 13 Mar 2025 12:56:56 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Paul Kocialkowski
 <contact@paulk.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?B?SGVy?=
 =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250313125656.70448d09@booty>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdejkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeljeejuddvudetffdtudelfedugfduledtueffuedufefgudegkeegtdeihedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrtddtvdemudgsrgejmeegkehfjeemudeltgehpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepihhnkhhirdgurggvsehsrghmshhun
 hhgrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_045708_916766_D04D6EA2 
X-CRM114-Status: GOOD (  29.76  )
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

Hello Maxime,

On Fri, 7 Feb 2025 12:47:51 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > DRM bridges are currently considered as a fixed element of a DRM card, and
> > thus their lifetime is assumed to extend for as long as the card
> > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > require DRM bridges to be added and removed to a DRM card without tearing
> > the card down. This is possible for connectors already (used by DP MST), so
> > add this possibility to DRM bridges as well.
> > 
> > Implementation is based on drm_connector_init() as far as it makes sense,
> > and differs when it doesn't. A difference is that bridges are not exposed
> > to userspace, hence struct drm_bridge does not embed a struct
> > drm_mode_object which would provide the refcount. Instead we add to struct
> > drm_bridge a refcount field (we don't need other struct drm_mode_object
> > fields here) and instead of using the drm_mode_object_*() functions we
> > reimplement from those functions the few lines that drm_bridge needs for
> > refcounting.
> > 
> > Also add a new devm_drm_bridge_alloc() macro to allocate a new refcounted
> > bridge.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> 
> So, a couple of general comments:
> 
> - I've said it a couple of times already, but I really think you're
>   making it harder than necessary for you here. This (and only this!)
>   should be the very first series you should be pushing. The rest can
>   only ever work if that work goes through, and it's already hard enough
>   as it is. So, split that patch into a series of its own, get that
>   merged, and then we will be able to deal with panels conversion and
>   whatever. That's even more true with panels since there's ongoing work
>   that will make it easier for you too. So the best thing here is
>   probably to wait.
> 
> - This patch really needs to be split into several patches, something
>   along the lines of:
> 
>   + Creating devm_drm_bridge_alloc()
>   + Adding refcounting
>   + Taking the references in all the needed places
>   + Converting a bunch of drivers

After reading Anusha's "[PATCH RFC 0/2] drm/panel: Refcounted panel
allocation" [0] I think I need a clarification about the 4 steps you had
outlined in the above quoted text. Are you suggesting those are four
_series_, and you'd want to see a series only creating
devm_drm_bridge_alloc() as a first step, similarly to Anusha's work?

That was not my understanding so far, and so I've been working on a
series containing all 4 items, and it's growing very long due to item 3
needing to touch many dozen drivers which need to put a bridge (many
are identical oneliner patches though).

Luca

[0] https://lore.kernel.org/all/20250312-drm-panel-v1-0-e99cd69f6136@redhat.com/

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

