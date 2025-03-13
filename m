Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D3FC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9luUN/dEXHB6yOQaOu/R2VJ4c9o/k4HnO8bdSVrfaX8=; b=roG7YrjTbstZ04xaiFNgDuifHA
	2O3ByX8GjNpAwD2QufIhftjLjkSVVKpaFYifWkVI6nkch4Nouga/T+0mSH1Ap0yLfpM7ZVfVYGl5Q
	WGsONNMi9nafQbqpzReJzGdel+qYKN8FFluKKuI914D8t5P1hSuLFkhsEMIHzR0mV3GLKWAbKXByW
	f9FDO1DFO4GH5AgkhaGbqE/+anqLL0WmRNT1vRiYpg4KfRX4ldpxNjFJ31V9SAv8YwfLQvBN2oAV2
	m9nbL5a4FPaqZwAvt8kCjaE8bCfZv8T1YFHSfnN1uqVYqLgFGSL5CjpF4NsSnmiSI1moNJIa3Ma6Q
	mhlw8IPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8I-0000000BwYl-2fcc;
	Thu, 13 Mar 2025 17:14:10 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tskGI-0000000Bcei-2Dk1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 15:14:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55B084421A;
	Thu, 13 Mar 2025 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741878855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9luUN/dEXHB6yOQaOu/R2VJ4c9o/k4HnO8bdSVrfaX8=;
	b=WoqK02lKedHD6pknpCYD3wUB4cb9WBWsuwqfmbaKjvYll+hAiPLQmsK6HdnqxeRBw0G+F/
	2Vm4bYCBgcp+gcP45FoiM+iSwf3GJKg7st/NGTxFgxI/19ZdFWH/jUfNSt2b0lZXoggZcE
	KzKYF67mIrT703ucVzNH/d7+o9VZyV8PPDYzJSloqiHkdz2TRzUroJDdPTFqoR0QXRwmY8
	eBVkyPZ4wThW7j4SCO8112nd/u05O6RelraW+/8LQd+cvXsx1kv2STr7wCd8RyPSs0YH+V
	/fRWGqn3nj9tWiihFo16iNAFzAXf/SETaUAVOcJ7Atd1rO1aulo8ojcvl2RqYA==
Date: Thu, 13 Mar 2025 16:14:11 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>, Michael Trimarchi
 <michael@amarulasolutions.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/mxsfb: fix missing rollback on failure in
 mxsfb_probe()
Message-ID: <20250313161411.4604a1a1@booty>
In-Reply-To: <468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
References: <20250313-mxsfb_probe-fix-rollback-on-error-v1-1-ad2fb79de4cb@bootlin.com>
	<468c6352-3301-4f0b-a2d4-d6a013417a0e@suse.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgdttddvmedusggrjeemgeekfhejmedulegtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgdttddvmedusggrjeemgeekfhejmedulegthedphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehmrghrvgigseguvghngidruggvpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtthhopehmrggrr
 hhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrgh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_081419_192989_AE265311 
X-CRM114-Status: GOOD (  15.32  )
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

Hello Thomas,

On Thu, 13 Mar 2025 15:40:43 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> > @@ -365,9 +365,10 @@ static int mxsfb_probe(struct platform_device *pdev)
> >   	 * located anywhere in RAM
> >   	 */
> >   	ret = aperture_remove_all_conflicting_devices(mxsfb_driver.name);
> > -	if (ret)
> > -		return dev_err_probe(&pdev->dev, ret,
> > -				     "can't kick out existing framebuffers\n");
> > +	if (ret) {
> > +		dev_err_probe(&pdev->dev, ret, "can't kick out existing framebuffers\n");
> > +		goto err_unload;
> > +	}  
> 
> I must have missed that when I reviewed the patch. But this call should 
> happen much earlier. right at the top of the probe function before 
> drm_dev_alloc(). Conflicting drivers need to be kicked out before 
> setting up DRM. Could you please send a patch to move the call to the 
> top? No extra cleanup would be required then.

Sure, sending v2 in a moment.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

