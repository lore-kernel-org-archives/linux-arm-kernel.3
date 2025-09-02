Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3A8CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfvmzc8qZmjMW4mhkIuHV/6a4hUMeSIVMoLiNUvK0Jk=; b=pUVgkzxXhVvigUfcBY4iRoHJY3
	S3HrXm5Jhxr4gyOmmkEjxLReyT/HzYlTCJHImEBD0pw0GRgr+YALA9bQP6JfaiG2E4c4/x0pIrOin
	GiaBe8I0CvaVewTgsOqoA/3QiYSRVN5UkRLAwJN/ObjwVH5ywKiEsyFJqJCXkMg+ouxYFvo86xeTU
	N+OfXiQs70QqDRHMKH0QBKG84L2t+/E9ojlecJo5Wv3vM91vSv6SmkMrFe7QeEebfS9YUj2HGbDUA
	evfLWMCwdVtTk2PVTpqcABFDJIExDBZKmi+RsYr2tWqw4mh56+Q37zWCwOyN2dtUroRS4yqNHgDSy
	OGQBYkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSHH-00000000S7l-12vP;
	Tue, 02 Sep 2025 14:46:31 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPdW-0000000H3WF-1tTp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:57:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1F4E1F748;
	Tue,  2 Sep 2025 11:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1756814235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yfvmzc8qZmjMW4mhkIuHV/6a4hUMeSIVMoLiNUvK0Jk=;
	b=mSGou2m35QWKjYxVcVxQArlWxxMr6rCzPkBdM5epuolTdmwUn/CGj7/YzLOTl95SXL+rdW
	Qmd3zGWZxrgIIbKW+mP6eKYSh2nkdGGx6786bF2vat3cXwuFxalz19AWFtfU8BwLF7FqIb
	HwEk5o3aJ50JovfkLIaBcFPq6JbztM0XfPdvlM/XHM36dfzFSkWl4W5peWJIk4uv7J7mzE
	B4HnnnfW76VCNH6Op4IzHvCpnvsjzC1zrXXa2zqwc7EAjwhGIDfULGU/C/B2OzZzo4Qfiw
	0KqG+//FWeBZMHA88sTqW0lzVIhMgY0wWTGwFuhxHIhocwckKSxb5PZl2e22Cg==
Date: Tue, 2 Sep 2025 13:57:09 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Liu Ying
 <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>, Zijun Hu <quic_zijuhu@quicinc.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/9] list: add list_last_entry_or_null()
Message-ID: <20250902135709.19e1ef54@booty>
In-Reply-To: <aKXRHAyfPHPpZmMs@smile.fi.intel.com>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
	<20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-1-888912b0be13@bootlin.com>
	<aJJ9ttmL7wiw41fY@smile.fi.intel.com>
	<20250814183609.3788a6df@booty>
	<aKXRHAyfPHPpZmMs@smile.fi.intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrm
 hhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045719_038878_3F8B98A5 
X-CRM114-Status: GOOD (  25.24  )
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

Hello DRM maintainers,

On Wed, 20 Aug 2025 16:43:56 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Aug 14, 2025 at 06:36:09PM +0200, Luca Ceresoli wrote:
> > On Wed, 6 Aug 2025 00:55:02 +0300
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >   
> > > On Fri, Aug 01, 2025 at 07:05:23PM +0200, Luca Ceresoli wrote:  
> > > > Add an equivalent of list_first_entry_or_null() to obtain the last element
> > > > of a list.    
> > > 
> > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>  
> > 
> > Thanks Andy!
> > 
> > However I'm not sure when and where this should be applied.
> > 
> > Except for this one patch, all patches in the series are for
> > drm-misc-next. Also, patch 1 is currently not needed by any other
> > series AFAIK.
> > 
> > Based on the above, is it correct to assume that the whole series can
> > be applied on drm-misc-next? (when other patches will have a
> > R-by/Ack-by of course)
> > 
> > Also, is Andy's A-by enough to apply this patch?  
> 
> The list.h is common for many, I think going via DRM with my Ack is enough
> based on the Git history of my changes in this file. But if you want more
> reliable source, get an Ack from Andrew Morton.

While applying this patch with dim on drm-misc-next, dim push-branch
failed because:

  dim: ERROR: cb86408b1fc2 ("list: add list_last_entry_or_null()"): Mandatory Maintainer Acked-by missing., aborting

Looking at the dim code, it is looking for a Reviewed- or Acked-by from
people listed by `scripts/get_maintainer.pl --no-git-fallback -m --nol
--norolestats`. but that command returns an empty string, so it will
never allow me to push.

How can I get that commit pushed to drm-misc-next?

I think `dim push-branch -f` would work: am I supposed to use it?

(not sure my committer rights allow that)

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

