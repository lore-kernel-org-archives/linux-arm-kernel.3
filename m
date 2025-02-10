Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3848C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8BWpaX+en9bzlPyCXNv/OsmRVq8aUFdsmvGYZd5/M1M=; b=Tm7nArt2TAEcgy
	Yu6NJZfs7pe3XZkm8DEmwuxLIdB9eLVIzzZmGcJ0Jep0yGMMMRGwoizzFLAV+Ce859h9WOl/cdIu4
	D2oSeU9JjLIQH+N4Z+XZSJIXzCJpACzRbcQiNHc2LoB4au0AN+aA/HRlnvkpmjLNYOcvvZ0nt6MXo
	5YPpIAYDsFQa7K5M48qPY5rYg+LRU0AB+Pq2u7hwQ1onH9pCB1p0AU907vXtZf8VjLoa9/iu4M2nQ
	RccrAhby0XzfLTQhpvi84hjewyPauTeevRtBWFLticAgZFxNeSI+GAHow0TbKqhqz30bpYtmD+n1N
	kZE/Z+o2eLCUQqTl02oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXeP-00000000jtx-47Xm;
	Mon, 10 Feb 2025 17:32:54 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXL3-00000000g36-2mh7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 17:12:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59113442DF;
	Mon, 10 Feb 2025 17:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739207570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BWpaX+en9bzlPyCXNv/OsmRVq8aUFdsmvGYZd5/M1M=;
	b=SPtX5V/suamAJnnxGQkZlrn+ert5cFSOQ/fcB7/3eKG5syOz4feQ8vYsj2ry+AK5SXzIfM
	4hC3Nmm3KVAKjeDhg+5fMpLhI0M+79OsT7ip6mzM/vKA06fkbIk7flQMcWTSk+R5nyVuu7
	8dsSpGZLrPNo3PFn4ikkUFQdQbf4WNj3fJobF8vPgNDBqBI5MCb6boobtS+FNeOERcRFib
	gzUlXDW7B1WWGOjKh/mYwhagfXcc2//kX6BuNBRGgOo2ZOkxVyc7uEFAewU0PUs/QO7J0B
	zaI6HgaDH6ICGK6YE2TLQ8RnK6xO/rlyK+l5Gkz1hWcISZRnxEoEJni/ChChtg==
Date: Mon, 10 Feb 2025 18:12:44 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250210181244.0e3e9189@booty>
In-Reply-To: <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
	<20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
	<20250207-ingenious-daffodil-dugong-51be57@houat>
	<ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefjedprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdpr
 hgtphhtthhopehinhhkihdruggrvgesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehjrghgrghnsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehmrdhsiiihphhrohifshhkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_091253_858219_1F464E94 
X-CRM114-Status: GOOD (  14.96  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Maxime, Dmitry

On Fri, 7 Feb 2025 21:54:06 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> > > +/* Internal function (for refcounted bridges) */
> > > +void __drm_bridge_free(struct kref *kref)
> > > +{
> > > +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> > > +	void *container = ((void *)bridge) - bridge->container_offset;
> > > +
> > > +	DRM_DEBUG("bridge=%p, container=%p FREE\n", bridge, container);  
> > 
> > Pointers are not really useful to track here, since they are obfuscated
> > most of the time. Using the bridge device name would probably be better
> > (or removing the SHOUTING DEBUG entirely :))  
> 
> bridge device name or bridge funcs (I opted for the latter for the
> debugfs file)

These DRM_DEBUG()s proved extremely useful exactly because of the
pointer. This is because when using hotplug one normally has the same
device added and removed multiple times, and so the device name or
bridge funcs is always the same, preventing from understanding which
instance is leaking, or being freed, get, put, etc.

Do you think this is a sufficient motivation to keep it?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

