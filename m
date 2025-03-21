Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FBCC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 18:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VT3j5ia3YM4BM/xg+Fw4hf8d8cAPlpEijn+7bl03zsE=; b=hSA4pHmbmLW1p8jcm1dwMD+/83
	npQPlNl2/vFEBguifYtaDXvh7UurJ6zTjqgVKcG+e+b5bkFU1L6fdzcOGh+cQRA6nauUI+viVPxP5
	jJS7eX/O6r29e82DYw7tVKb9FlpSYrvFkq7WfjtI3pPNOiP4JWj39Guez5FXJiJhh0DPqecDLRYT+
	mWQafoU4Wg6HmywByYonko5cnLdvn7UT9IX8wx3Ku1KSQlad7bigQZafIYGEzk5jGiursuLXvfr+E
	aFJG+uYUL80DiU0bVxYNqmJPuzZPIiMaYsIW/eBtMjDkPyMgL8OVepBKEMI5jpFyVHQ9jtgSz9/bu
	twZ5NEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvh1k-0000000Fpw9-250G;
	Fri, 21 Mar 2025 18:23:28 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvh02-0000000FpYN-3UDZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 18:21:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B82C4439E;
	Fri, 21 Mar 2025 18:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742581298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VT3j5ia3YM4BM/xg+Fw4hf8d8cAPlpEijn+7bl03zsE=;
	b=M2+aLmXCuAkAtEzK22T1y229k0Hx/fEcdMCuVydJ1io66hFVPtiOn7GBAwEYaUnyhjxC94
	ICATURZtPDmh1DBptvQBie4GII1Pm7bGnMArOcVEhyHMLfO4ZtUjzrVAzlXBmLaMCSQJ2o
	v0QxoN+dfKbAxbDnacFwsJVtWQlxGKo8R8MnuogRDC52wuk3izUBlzY9ufJLExiD6tlnKM
	k7rbUwm2fL8rKxFOLoxjROHPAz5M5QHE7vXqivbMecIsaf6TpBAaFZ10mpgP3P7z/SWpQB
	MHkfpgxw9FAok9ZSgsZYepow4fZBN6nB79LgrwrwqCk9UkR+nfFWiaV9ElT8qw==
Date: Fri, 21 Mar 2025 19:21:32 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Anusha Srivatsa"
 <asrivats@redhat.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Fabio Estevam" <festevam@gmail.com>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski"
 <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Paul Kocialkowski" <paulk@sys-base.io>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Robert Foss"
 <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn Guo"
 <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Stefan Agner"
 <stefan@agner.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v8 2/5] drm/bridge: add support for refcounting
Message-ID: <20250321192132.211893ec@booty>
In-Reply-To: <400466cd3c229ea6c6cb25e2a58cee27@kernel.org>
References: <20250320-drm-bridge-refcount-v8-2-b3ddaa9f1368@bootlin.com>
	<400466cd3c229ea6c6cb25e2a58cee27@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedukedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemsgdtjeemieegieelmegtieguieemgegtudelmeeffeekvgemjegvjegvmegttdejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemsgdtjeemieegieelmegtieguieemgegtudelmeeffeekvgemjegvjegvmegttdejuddphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehimhigsehlihhsthhsr
 dhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_112143_177449_B82F4C08 
X-CRM114-Status: GOOD (  12.75  )
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

On Fri, 21 Mar 2025 09:54:55 +0000
"Maxime Ripard" <mripard@kernel.org> wrote:

> On Thu, 20 Mar 2025 16:42:11 +0100, Luca Ceresoli wrote:
> > DRM bridges are currently considered as a fixed element of a DRM card, and
> > thus their lifetime is assumed to extend for as long as the card
> > exists. New use cases, such as hot-pluggable hardware with video bridges,
> > require DRM bridges to be added to and removed from a DRM card without
> > tearing the card down. This is possible for connectors already (used by DP
> > 
> > [ ... ]  
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks a lot for reviewing!

I noticed you haven't replied on patch 3. Being a change you had
suggested, I was wondering whether haven't noticed that. If you are OK
with that patch, the entire series would have a R-by, which would be
great to unlock all the work depending on this series.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

