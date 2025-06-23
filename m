Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B143C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ePt40yJvrO33B0QpVlIo/HV5dJRHpWVq5OdajjSVb8=; b=mXd2RVBMn3aZHmQPip6g+Brbdi
	Hw81XIOI+HiAYBusbCA8lHWuTbVR6BkBi1H5UlY0AiESogl0K9AMyc1K31ohiCo0UsMq22/yPTWKi
	q7bZEVU95MRpkrmyC1MA9O7br1gkf6Pm919JANv5UdJvUlmqAMRjMdwTBZbEXadHnnBcGfqFQV27a
	ZQ73J05RDuY7Kqxg2p2V8Dq/hCJtUdj15zJQC0RER/3G7FT6BDwhs8k3M2n42KcUdpGKnWB3MYRiX
	OdDSMDs330kwypvsZJ2/5GIEADDcNYUJnM4kSuKg6+VH7gRu6oX2v7j15azAGwWLFI1JskqaP1QKy
	GZnwh1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZA-00000004Eyq-3llf;
	Tue, 24 Jun 2025 00:31:13 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThrD-00000002z5H-3zXR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:09:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A41720453;
	Mon, 23 Jun 2025 14:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750687747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ePt40yJvrO33B0QpVlIo/HV5dJRHpWVq5OdajjSVb8=;
	b=OSVBBqfTG09UyTei7Nq8pZ1s6OMA19TYtgRlgZ4Ttnj3iFPs2YpySG3Mn3qtN+76gAu7MP
	3G4DI8MqOZs3EMfOuCPQRw63/ZIw3L1Wfn0lJHTiampezCEtlJWz2TgatjDj7O+RddT8nI
	LqLRQWIBq/hrcGNZii8aoSetSIQt/sHQxmt7+56BHG4e8082Jjd+WeftitpLQuC4nVa3/s
	06evNf5AbkOY2mrVGNV0NJYeUvF8mNAW/s7asxH6Xev6U8bDUv0HsCGDiUQXnHDQtCZIPj
	pAUOyi2Z5kXS73OklkeGvOtk3gSwvyJX7r6R1/+x5kp3eVUNRFJwyvUwfeOaTg==
Date: Mon, 23 Jun 2025 16:09:03 +0200
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
Subject: Re: [PATCH v8 2/5] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-ID: <20250623160903.01c56bfc@booty>
In-Reply-To: <be6a4d90-2c6e-42be-9948-df1840fd2f83@nxp.com>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
	<20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-2-0321845fcafb@bootlin.com>
	<be6a4d90-2c6e-42be-9948-df1840fd2f83@nxp.com>
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
X-CRM114-CacheID: sfid-20250623_070912_608689_A8506087 
X-CRM114-Status: GOOD (  18.38  )
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

On Mon, 23 Jun 2025 10:56:13 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> On 06/21/2025, Luca Ceresoli wrote:
> > drm_bridge_chain_get_first_bridge() returns a bridge pointer that the
> > caller could hold for a long time. Increment the refcount of the returned
> > bridge and document it must be put by the caller.  
> 
> To make sure the incremented refcount is decremented once this patch is
> applied, does it make sense to squash patch 3, 4 and 5 into this one?

I see there is a trade off here between bisectability and patch
readability.

However about bisectability the problem is limited for this series. To
get an actual get/put imbalance you'd have to be able to remove the
bridge, but removing (part of) the bridge chain is not at all supported
right now, and it won't be until after chapter 4 of this work (see
cover letter).

However I realize there is an issue if:
* patch 2 is applied but patches 3/4/5 are not
  (it does not make sense to apply this series partially, but this
  might happen when cherry-picking?)
* an entire DRM card is removed where
  drm_bridge_chain_get_first_bridge() is used by some components

If both happen we'd have a get without put, thus a missing free and a
memory leak for the container struct.

Note that, besides drm_bridge_chain_get_first_bridge() that this
series covers, there are various other accessors: see items 1.E.{2..8}
in cover letter. For some of those there are many more changes to apply
because they are called in more places. Squashing them would result in
a really large patch that is likely hard to review and manage.

So I'll leave the decision to DRM subsystem maintainers. For the time
being I'm keeping the current approach given that Maxime already
reviewed these patches in the past, not squashed.

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

