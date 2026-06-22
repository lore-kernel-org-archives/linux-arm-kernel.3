Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EAECDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 10:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6nNUTrOv4beAeuUeuYvdTEuBqhmoXeMNVaJq+x8tsQ=; b=yjDKYaffCbRl4amHk+ORuyK6tL
	AmxA3kQf5L63oDaC2FLb23YSmLM2v74B7XF9viwqw3kAN+E6G+jcjPbozubhWGFpy5wKIRa8vnbS7
	W8HjNk8x/49uNZ4jIKb18sJKbiB1zpiEnalHedRSiETe3c4G0LqHfs1o4UzxludHrbgBu85K5hlES
	a8UUXWpVgGDexi4L/e/GKZpSaW2yq1RLsRfJ42JwF2ddZwAt2dcAKHI23MFhQmyLAIbOoq9b59O/8
	XAGKoDiwv6crY6SDUo1o8chbuAAWq927AnCVcEQl5ZzB5G10VUK0EsJJZ+nw3OZQmPOhDOYHIgAcz
	UriHNuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbc4G-00000004qZP-2A5L;
	Mon, 22 Jun 2026 10:39:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbc4E-00000004qYu-2kDo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 10:39:52 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F886874;
	Mon, 22 Jun 2026 12:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782124746;
	bh=+PTHu8uYEliCG2hW2yliLhL6xDa49kA2IvmO9Lhe998=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZS8eNCjtod/txW3HsrSeFcQIPlJJkdazWEnVkM9m0vInO4nPG7UBveOhKFhiKPzat
	 uE2o64q3hbwjwxtfoNooVvG6KKn8eSp6j16o7cM//dEzQ5NcMXrWcyWGQuQHTMyl7B
	 dniiMVn5ovZpSBR7CbnBwBKPEf9rROkAVkdiDFMQ=
Date: Mon, 22 Jun 2026 13:39:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/8] media: v4l2-fwnode: Add common helper library for
 1-to-1 subdev registration
Message-ID: <20260622103942.GB3872967@killaraus.ideasonboard.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
 <ajMhZP5YHuQdhc5M@kekkonen.localdomain>
 <ajNwgq96WRrykE5I@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajNwgq96WRrykE5I@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_033950_855070_298B8305 
X-CRM114-Status: GOOD (  34.90  )
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

Hi Frank,

On Wed, Jun 17, 2026 at 11:13:55PM -0500, Frank Li wrote:
> On Thu, Jun 18, 2026 at 01:36:20AM +0300, Sakari Ailus wrote:
> > On Wed, Jun 17, 2026 at 03:50:12PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Many V4L2 subdev drivers implement the same registration and media pad
> > > setup logic for simple pipelines consisting of a single sink pad and a
> > > single source pad. As a result, the same boilerplate code is duplicated
> > > across multiple drivers.
> > >
> > > Introduce a common helper library for 1-to-1 subdevs to encapsulate the
> > > registration, media entity initialization, and cleanup paths. Drivers
> > > can embed a struct v4l2_subdev_1to1 instance and use the provided helper
> > > APIs instead of open-coding the setup sequence.
> >
> > I appreciate your efforts in trying to reduce the amount of code drivers
> > need simply to get things done but I think there are a few issues with the
> > approach taken in this patch:
> >
> > - The new helpers aren't generic enough, but require two pads; one sink,
> >   one source.
> 
> It can cover many case already, there are many bridge type subdev. after
> glace of all code, many CSI2RX is type device. It should one kind important
> type/case, like sensors.
> 
> And I plan do 1 TO N replicator driver, which duplicate 1 sink pad to N
> source pad (with/without register config), plus exist video-mux driver,
> 
> It think It can cover more than 80% cases.
> 
> > You could provide special helpers for just this case, but
> >   right now it looks like that if there's something you need that the
> >   helper assumes you don't, you can't use the helper at all. In other
> >   words, more modularity would be nice.
> 
> We can add it later if need, which easy to replace 1to1 API, like I did
> for sensor one.
> 
> > - The new helper should work with the existing types and not add new types
> >   (struct v4l2_subdev_1to1).
> 
> May be save vep data into v4l2_subdev to avoid parse it every time. and
> enhence media_entity_pads_init() to avoid refer caller data.

I agree with Sakari about not introducing a new structure.

We could create a version of media_entity_pads_init() that allocates the
pads array dynamically (*not* with a devm_* function !), and free it in
media_entity_cleanup().

> >
> > - There should be a way to provide default V4L2 fwnode endpoint
> >   configuration as well as to validate the obtained configuration.
> 
> Do you means remote_bustype_cap_mask information get from a callback?
> 
> > I don't have a good proposal to address the above but at least one way I
> > can think of making error handling easier would be to use devm_() for
> > teardown in more places we to today. That certainly does have its own
> > issues though.
> 
> I tried it before, media and v4l2's clean up is not revised order of init.
> Sorry, I can't find original thread. I remember laurnet pinchart said there
> are order problem.
> 
> 1  v4l2_subdev_init()
> 2. v4l2_async_subdev_nf_init()
> 3. v4l2_async_nf_register()
> 4. media_entity_pads_init()
> 5  v4l2_async_register_subdev()
> 
> 
> v4l2_async_unregister_subdev(sd);
> v4l2_subdev_cleanup(sd);        // Not sure if it save to move to last step
> media_entity_cleanup(&sd->entity);
> v4l2_async_nf_unregister(&csi2->notifier);
> v4l2_async_nf_cleanup(&csi2->notifier);

The cleanup procedure is really bad, it's a known issue. Fixing that
involves resuming Sakari's work on life time management in V4L2.

-- 
Regards,

Laurent Pinchart

